# Runtime Tests

This directory contains code to perform various sanity checks on the runtimes.
Two kinds of tests are performed:
 * test that programs can be compiled and linked with the runtime without errors.
 * test that programs execute correctly when they are run on the target hardware.

> [!NOTE]
> These tests are **not** intended to fully validate the complete runtime against
> a testsuite like ACATS. We assume that the common runtime sources (obtained
> upstream from [bb-runtimes](https://github.com/alire-project/bb-runtimes))
> are already validated upstream. The purpose of these tests is to sanity check
> the target-specific parts of the runtime that are implemented in this
> repository such as: startup code, text I/O, interrupts, and multicore support.

## Running the Tests

The tests require Python, pytest, and Alire to be available on the PATH.

The runtimes must already be generated in the `../install/` directory before
running the tests:

```sh
(cd .. && ./generate-all.sh)
```

To run the tests, execute the following command in this directory:

```sh
pytest .
```

To run only the tests for a specific target, e.g. the rp2040:
```sh
pytest . -k rp2040
```

By default, any intermediate working files (e.g. build outputs) are stored in
a per-testcase temporary directory that is deleted when the test is completed.
When debugging test failures, it is sometimes useful to keep those files around
so that they can be inspected after the tests. To do this, use `--working-dir`
to set the directory where these temporary directories will be created, and
use `--keep-build-files` to avoid deleting them when the test has completed.
For example:

```sh
pytest . --working-dir=out --keep-build-files
```

##  Running the Tests on Target Hardware

By default, the tests only try compiling and linking programs against the
runtimes; they do not run the resulting executables.

If you want to also check that the executables run correctly on physical
hardware, then you will need to configure pytest to tell it which target you
want to test on, and which ports it should use to communicate with the board
(via a debugger).
The following sections provide instructions for running the tests on specific
target boards.

### Testing on the RP2040 and RP2350

Running the tests on an RP2040 or RP2350 requires the following hardware:
 * A Raspberry Pi Pico board (for RP2040) or Raspberry Pi Pico 2 (for RP2350)
 * A J-Link debugger

and the following software:
 * the [J-Link Software Pack](https://www.segger.com/downloads/jlink/)
   (these instructions were written using version 9.24a)

The following pins must be connected between the J-Link and Pico / Pico2:

| J-Link Pin | Pico Pin |
|------------|----------|
| GND        | GND      |
| Pin 1 (VTref) | Pin 36 (3V3OUT) |
| Pin 7 (SWDIO) | SWDIO |
| Pin 9 (SWDCLK) | SWDCLK |
| Pin 15 (RESET) | Pin 30 (RUN) |

Next, start the J-Link GDB server in a terminal (you may need to tweak these
settings for your environment):

**For RP2040:**
```sh
JLinkGDBServerCLExe -USB -endian little -device RP2040_M0_0 -if SWD -speed auto -noir -LocalhostOnly -nologtofile -port 2331 -SWOPort 2332 -TelnetPort 2333
```

**For RP2350:**
```sh
JLinkGDBServerCLExe -USB -endian little -device RP2350_M33_0 -if SWD -speed auto -noir -LocalhostOnly -nologtofile -port 2331 -SWOPort 2332 -TelnetPort 2333
```

> [!TIP]
> You can also run the J-Link GDB server GUI (using `JLinkGDBServerExe`)
> instead of using the command-line version, if you prefer.

You should see output like this, indicating that the GDB server is waiting for
incoming connections:

```
SEGGER J-Link GDB Server V9.24a Command Line Version

JLinkARM.dll V9.24a (DLL compiled Mar  5 2026 11:03:48)

WARNING: Unknown command line parameter little found.
Command line: -USB -endian little -device RP2040_M0_0 -if SWD -speed auto -noir -LocalhostOnly -nologtofile -port 2331 -SWOPort 2332 -TelnetPort 2333
-----GDB Server start settings-----
GDBInit file:                  none
GDB Server Listening port:     2331
SWO raw output listening port: 2332
Terminal I/O port:             2333
Accept remote connection:      localhost only
Generate logfile:              off
Verify download:               off
Init regs on start:            off
Silent mode:                   off
Single run mode:               off
Target connection timeout:     0 ms
------J-Link related settings------
J-Link Host interface:         USB
J-Link script:                 none
J-Link settings file:          none
------Target related settings------
Target device:                 RP2040_M0_0
Target device parameters:      none
Target interface:              SWD
Target interface speed:        auto
Target endian:                 little

Connecting to J-Link...
J-Link is connected.
Firmware: J-Link V10 compiled Jan 30 2023 11:28:07
Hardware: V10.10
S/N: xxxxxxxxx
OEM: SEGGER-EDU
Feature(s): FlashBP, GDB
Checking target voltage...
Target voltage: 3.27 V
Listening on TCP/IP port 2331
Connecting to target...
Halting core...
Connected to target
Waiting for GDB connection...
```

Now, you can configure and run the tests to tell it which hardware we're
targeting (the rp2040), and which ports to use to commuicate with the J-Link
GDB server and telnet ports:

**For RP2040:**
```sh
pytest . --target-board=rp2040 --gdbserver-port=2331 --text-io-port=2333
```

**For RP2350:**
```sh
pytest . --target-board=rp2350 --gdbserver-port=2331 --text-io-port=2333
```

Note that the above command will also run the "build only" tests. If you only
want to run the tests that execute on the target hardware, you can tell pytest
to only run the `test_execute_on_target` tests:

```sh
pytest . --target-board=rp2040 --gdbserver-port=2331 --text-io-port=2333 -k test_execute_on_target
```

The test harnesses will take care of building each test, downloading & running
it on the hardware (via GDB), and retrieving & checking the test program's
output.

## How the Tests Work

Each test case is an Ada application that exercises some part of the runtime
(e.g. text IO, interrupts, tasks, etc). The sources for each individual test
case are stored in subdirectories under the `testcases` dir (one subdirectory
per test case).

Pytest is used to orchestrate the tests, with parametrization to determine
the list of runtimes that has been generated (by `generate-all.sh`) and should
be tested against. Each test case is then built against each runtime using
the default runtime crate configuration.
So with _N_ test cases and _M_ runtimes, a total of _N_*_M_
test configurations are executed to test every test case against every runtime.

The file `support/test_configs.py` also contains some additional test
configurations to test runtimes with non-default runtime crate configuration
values. For example, to test the RP2040 runtimes in a single-core configuration.

A specific test configuration is tested by creating an Alire manifest
(`alire.toml`) and GNAT Project file (`test.gpr`) in a temporary directory.
The Alire manifest uses a pinned dependency for the specific runtime to be
tested. The GPR file sets its `Source_Dirs` to point to the test case's sources.
These are then used to compile the test.