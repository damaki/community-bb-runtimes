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

## On-Target Testing

> [!WARNING]
> These instructions have been tested on Linux only. They should also work
> on Windows and MacOS, but this hasn't been tested and some things may not work.

By default, the tests only try compiling and linking programs against the
runtimes; they do not run the resulting executables.
If you want to also check that the executables run correctly on physical
hardware, then you will also need:
* a development board with the target you want to test on (e.g. Raspberry Pi Pico);
* a debug probe connected to your target (e.g. J-link, ST-Link); and
* software for your debug probe that can run a GDB server
  (e.g. [J-Link software Pack](https://www.segger.com/downloads/jlink/),
  [OpenOCD](https://openocd.org/),
  [st-util](https://github.com/stlink-org/stlink)).

The way on-target testing works is that the testsuite uses GDB to
interface with the target via the debug probe's GDB server and uses it to send
commands to download and run test programs on the target board, and check that
the output from the program (via semihosting) matches the expected output.
The specifics change depending on the debug probe and software used.

Additional options to pass to pytest for on-target testing are:
* `--target-board` configures the target that is being tested, e.g. `rp2040`
* `--target-if` configures the method used to interface with the target. Available options:
  * `jlink-gdbserver` (default): connect to the target via a J-Link GDB server
  * `openocd-gdbserver`: connect to the target via OpenOCD's GDB server
  * `st-util`: connect to the target using the st-util utility.
* `--gdbserver-port`: configures the GDB server's port number to connect to.
* `--text-io-port`: configures the port number to connect to for reading the
  semihosting text output from the program running on the target.

### On-Target Testing using J-Link

Assuming you have a J-Link debug probe and are using the J-Link software pack,
you can run the tests using the following steps:
1. Connect the J-Link to the target board and ensure both are powered (see
   the target-specific sections below for details).
2. Launch the J-Link GDB server GUI (by running `JLinkGDBServerExe`),
   select the appropriate target options for your target and debug probe, then
   start the GDB server. Make a note of the GDB server port and the Telnet port
   as you will need it in the next step.
3. Run the tests:

```sh
pytest . \
    --target-board=<target> \
    --target-if=jlink-gdbserver \
    --gdbserver-port=<gdb-port> \
    --text-io-port<telnet-port>
```

Where:
* `<target>` is the name of the runtime target you want to test (e.g. `rp2040`)
* `<gdb-port>` is the J-Link GDB server port number
* `<telnet-port>` is the J-Link GDB server telnet port number

For example, to test on the RP2040 using a J-Link:

```sh
pytest . --target-board=rp2040 --target-if=jlink-gdbserver --gdbserver-port=2331 --text-io-port=2333
```

### On-Target Testing using OpenOCD

> [!WARNING]
> The OpenOCD interface seems to be quite unreliable, as OpenOCD tends to segfault
> when the testsuite disconnects from the semihosting socket at the end of each
> test. If you encounter segfaults with OpenOCD then you may need to run one
> test at a time and restart OpenOCD after each test, or use a different GDB
> server.

1. Launch OpenOCD with the appropriate options for your debug interface and target,
   and configure OpenOCD to enable semihosting and redirect it via TCP
   For example, for the Nucleo-G474RE board (`stm32g4xx` target) with semihosting
   output on port 4445:
```sh
openocd \
    -f interface/stlink.cfg \
    -f target/stm32g4x.cfg \
    -c init \
    -c "arm semihosting enable" \
    -c "arm semihosting_redirect tcp 4445"
```
2. Run the tests:

```sh
pytest . \
    --target-board=<target> \
    --target-if=openocd-gdbserver \
    --gdbserver-port=<gdb-port> \
    --text-io-port<telnet-port>
```

Where:
* `<target>` is the name of the runtime target you want to test (e.g. `rp2040`)
* `<gdb-port>` is OpenOCD's GDB server port number (port 3333 by default)
* `<telnet-port>` is OpenOCD's semihosting port number (e.g. 4445)

For example, to test on the stm32g4xx (Nucleo-G474RE board):

```sh
pytest . --target-board=stm32g4xx --target-if=openocd-gdbserver --gdbserver-port=3333 --text-io-port=4445
```

### On-Target Testing using st-util

For STM32 boards with an ST-Link debugger, the `st-util` tool from
the open source [STLINK Tools](https://github.com/stlink-org/stlink) project
can be used to connect to the board.

Assuming that `st-util` is in your system PATH, you can run the testsuite
directly (the testsuite will take care of launching `st-util`):
```sh
pytest . --target-board=<target> --target-if=st-util
```

For example, to test on the stm32g4xx (Nucleo-G474RE board):

```sh
pytest . --target-board=stm32g4xx --target-if=st-util
```

### Testing on the RP2040 and RP2350 with J-Link

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
pytest . \
    --target-board=rp2040 \
    --target-if=jlink-gdbserver \
    --gdbserver-port=2331 \
    --text-io-port=2333
```

**For RP2350:**
```sh
pytest . \
    --target-board=rp2350 \
    --target-if=jlink-gdbserver \
    --gdbserver-port=2331 \
    --text-io-port=2333
```

Note that the above command will also run the "build only" tests. If you only
want to run the tests that execute on the target hardware, you can tell pytest
to only run the `test_execute_on_target` tests:

```sh
pytest . \
    --target-board=rp2040 \
    --target-if=jlink-gdbserver \
    --gdbserver-port=2331 \
    --text-io-port=2333
    -k test_execute_on_target
```

The test harnesses will take care of building each test, downloading & running
it on the hardware (via GDB), and retrieving & checking the test program's
output.

### Testing on the nRF52840

Running the tests on an nRF52840 requires the following hardware:
 * An nRF52840 Development Kit (nRF52840-DK)

and the following software:
 * the [J-Link Software Pack](https://www.segger.com/downloads/jlink/)
   (these instructions were written using version 9.24a)

Note that the nRF52840-DK comes with an on-board J-Link debugger, so a separate
debugger is not required. Simply connect to the J-Link's micro-USB connector on
the board.

Next, start the J-Link GDB server in a terminal (you may need to tweak these
settings for your environment):

```sh
JLinkGDBServerCLExe -USB -endian little -device nRF52840_xxAA -if SWD -speed auto -noir -LocalhostOnly -nologtofile -port 2331 -SWOPort 2332 -TelnetPort 2333
```

Now, you can configure and run the tests to tell it which hardware we're
targeting (the nrf52840), and which ports to use to commuicate with the J-Link
GDB server and telnet ports:

```sh
pytest . \
    --target-board=nrf52840 \
    --target-if=jlink-gdbserver \
    --gdbserver-port=2331 \
    --text-io-port=2333 \
    -k test_execute_on_target
```

### Testing on STM32 Targets

Testing on STM32 is done on the following boards:
| Target      | Board         |
|-------------|---------------|
| `stm32f0xx` | Nucleo-F072RB |
| `stm32g0xx` | Nucleo-G0B1RE |
| `stm32g4xx` | Nucleo-G474RE |

The following software is also required to be installed and available on your
system PATH:
 * [STLINK Tools](https://github.com/stlink-org/stlink)

Note that the Nucleo board comes with an on-board ST-Link debugger, so a separate
debugger is not required. Simply connect to the ST-Link via a USB cable.

To run the tests, using the `stm32g0xx` target as an example:

```sh
pytest . --target-board=stm32g0xx --target-if=st-util -k test_execute_on_target
```

## Writing Tests

Testcases are stored in the `testcases` directory, where each subdirectory is
an individual test case.

Each testcase subdirectory contains the sources needed for the test.
The testcase contains at least the file `test.adb` which contains the main
subprogram for the testcase, called `Test`. The testcase can also contain
other source files, which must be in the same directory.

The testcase must print the string `"===TEST COMPLETE==="` via `Ada.Text_IO`
at the end of the test. This lets the test infrastructure know when the
test has finished, and helps detect stuck/hung tests.

The testcase subdirectory must also contain a file called `test.out` which
contains the expected text output from the test when it is executed.

The testcase may optionally contain a Python script called `opt.py` which
can contain some additional, optional functions to configure the test:

| Function | Description |
|----------|-------------|
| `check_test_conditions` | Calls `pytest.skip()` if the test is not applicable for given runtime configuration. |
| `local_crates` | Returns a list of crate names that are in the testcases's directory. These crates will be added to the build. |
| `external_crates` | Returns a dictionary of crate names from the Alire index and the version to use. |
| `crate_config_values` | Returns a dictionary of crate configuration variables to set, and the value to set. |

```python
import support.target_info
import pytest

def check_test_conditions(target_info: support.target_info.TargetInfo):
    # This test only applies to the rp2040 target
    if target_info.target != "rp2040":
        pytest.skip("Test is only for the rp2040 target")


def local_crates(target_info: support.target_info.TargetInfo) -> List[str]:
    # The testcase directory has a crate called "my_crate" that is used for the test
    return ["my_crate"]

def external_crates(target_info: support.target_info.TargetInfo) -> Dict[str,str]:
    # The testcases also uses the rp2040_hal crate from the Alire index
    return {"rp2040_hal": "=2.7.0"}

def crate_config_values(target_info: support.target_info.TargetInfo) -> Dict[str,Any]:
    # The testcase needs to set the Use_Startup variable for the rp2040_hal crate
    return {"rp2040_hal.Use_Startup": False}
```