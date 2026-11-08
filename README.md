# Community Bareboard Runtimes

This repository contains the sources to generate GNAT Ada/SPARK runtimes for a
variety of bare-metal embedded targets.

Pre-generated runtimes are released as crates in the
[Alire Community Index](https://alire.ada.dev/crates.html).

Here's a list of the targets supported by this repository, with links to their
target-specific documentation:
 * [Raspberry Pi RP2040](rp2040_src/README.md)
 * [Raspberry Pi RP2350](rp2350_src/README.md)
 * [Nordic Semi nRF52 Series](nrf52_src/README.md)
 * [Nordic Semi nRF54L Series](nrf54l_src/README.md)
 * [STMicroelectronics STM32F0xx Series](stm32f0_src/README.md)
 * [STMicroelectronics STM32G0xx Series](stm32g0_src/README.md)
 * [STMicroelectronics STM32G4xx Series](stm32g4_src/README.md)
 * [STMicroelectronics STM32F4xx Series](stm32f4_src/README.md)

The runtimes are configurable through Alire's crate configuration variables.
Refer to the target-specific READMEs above for details on what is configurable
for each target.

Runtime crates are provided for the _light_, _light-tasking_, and _embedded_
[predefined GNAT runtime profiles](https://docs.adacore.com/live/wave/gnat_ugx/html/gnat_ugx/gnat_ugx/gnat_runtimes.html).
For example, the `light_tasking_rp2040` crate provides the _light-tasking_
runtime profile for the RP2040 target.

## Usage

To use these runtimes (using the `light_tasking_stm32g4xx` runtime as an example):

1. Add a dependency on the runtime crate:
    ```sh
    alr with light_tasking_stm32g4xx
    ```

2. Edit your project's GPR file:

    1.  "with" the runtime's GPR file

        ```ada
        with "runtime_build.gpr";
        ```

        If you are using a `light_tasking` or `embedded` runtime, also "with" `ravenscar_build.gpr`:
        ```ada
        with "ravenscar_build.gpr";
        ```

    2. Define the `Target` and `Runtime` attributes in your GPR file:

        ```ada
        for Target use Runtime_Build'Target;
        for Runtime ("Ada") use Runtime_Build'Runtime ("Ada");
        ```

    3. Some targets also require specific linker switches:

        >[!WARNING]
        > Follow the links to the target-specific documentation above to check
        > if this step is needed for your target.

        ```ada
        package Linker is
          for Switches ("Ada") use Runtime_Build.Linker_Switches;
        end Linker;
        ```

## What is a runtime?

The runtime is a library of that implements the low-level support routines that
Ada code depends on during execution, such as:
 * exception handling;
 * multitasking;
 * heap memory allocation;
 * support for attributes such as `'Image`;
 * numeric utilities;
 * package `Ada.Text_IO`.

These Ada runtimes for bare-board targets support a _subset_ of the Ada language
due to resource constraints, determinism and real-time requirements, and the
lack of an underlying operating system.
For example, tasking and concurrency is limited to the Ravenscar and Jorvik
profiles, so features such as dynamic task priorities and task rendezvous are
not available on these runtimes.

GNAT defines three runtime _profiles_ that offer different language subsets:
 * _light_: The smallest runtime profile. Lacks support for tasking,
   `Unchecked_Deallocate` (the heap is allocate-only), and exception propagation.
 * _light-tasking_: Includes everything in _light_, but also adds support for
   tasking under the Jorvik profile.
 * _embedded_: Includes everything in _light-tasking_, but also adds support
   for a exception propagation and a full heap allocator including support for
   `Unchecked_Deallocate`.

See the [GNAT User's Guide Supplement for Cross Platforms](https://docs.adacore.com/live/wave/gnat_ugx/html/gnat_ugx/gnat_ugx/gnat_runtimes.html) for more details on what is
included for each profile.

This repository produces one crate per runtime profile and target tuple.
For example, the following crates are available for the STM32G4xx family:
* `light_stm32g4xx`
* `light_tasking_stm32g4xx`
* `embedded_stm32g4xx`

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

If you are using an LLM, see also [LLM_POLICY.md](LLM_POLICY.md).