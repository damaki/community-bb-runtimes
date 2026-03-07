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
 * [STMicroelectronics STM32F0xx Series](stm32f0_src/README.md)
 * [STMicroelectronics STM32G0xx Series](stm32g0_src/README.md)
 * [STMicroelectronics STM32G4xx Series](stm32g4_src/README.md)

The runtimes are configurable through Alire's crate configuration variables.
Refer to the target-specific READMEs above for details on what is configurable
for each target.

Runtime crates are provided for the _light_, _light-tasking_, and _embedded_
[predefined GNAT runtime profiles](https://docs.adacore.com/live/wave/gnat_ugx/html/gnat_ugx/gnat_ugx/gnat_runtimes.html).
For example, the `light_tasking_rp2040` crate provides the _light-tasking_
runtime profile for the RP2040 target.