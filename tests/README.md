# Runtime Tests

This directory contains code to perform various sanity checks on the runtimes.
Currently, these tests just check that applications can compile and link
successfully under various runtime configurations. It is planned to eventually
automate downloading and running the tests on the target board to also verify
execution.

> [!NOTE]
> These tests are **not** intended to fully validate the complete runtime against
> a testsuite like ACATS. We assume that the common runtime sources (obtained
> upstream from [bb-runtimes](https://github.com/alire-project/bb-runtimes))
> are already validated upstream. The purpose of these tests is to sanity check
> the target-specific parts of the runtime that are implemented in this
> repository such as: startup code, interrupts, and multicore support.

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