# STM32F0xx Runtimes

This repository generates GNAT runtimes that support all MCUs in the STM32F0
family.

The following runtime profiles are supported:
* light
* light-tasking
* embedded

## Usage

Using the `light-tasking-stm32f0xx` runtime as an example, first edit your
`alire.toml` file and add the following elements:
 - Add `light_tasking_stm32f0xx` in the dependency list:
   ```toml
   [[depends-on]]
   light_tasking_stm32f0xx = "*"
   ```
 - if applicable, apply any runtime configuration variables
   (see "Runtime Configuration" below).

Then edit your project file to add the following elements:
 - "with" the run-time project file:
   ```ada
   with "runtime_build.gpr";
   ```
 - if you are using the **light-tasking** or **embedded** runtime profile, then
   you also need to "with" `ravenscar_build.gpr`:
   ```ada
   with "ravenscar_build.gpr";
   ```
 - specify the `Target` and `Runtime` attributes:
   ```ada
   for Target use runtime_build'Target;
   for Runtime ("Ada") use runtime_build'Runtime ("Ada");
   ```
 - specify the `Linker` switches:
   ```ada
   package Linker is
     for Switches ("Ada") use Runtime_Build.Linker_Switches;
   end Linker;
   ```

## Runtime Configuration

### Crate Configuration

The runtime is configurable through the crate configuration variables.

The following variables configure the specific STM32F0 MCU that is being targeted:

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>MCU_Sub_Family</tt></td>
    <td>
      <tt>"F030"</tt>,
      <tt>"F031"</tt>,
      <tt>"F038"</tt>,
      <tt>"F042"</tt>,
      <tt>"F048"</tt>,
      <tt>"F051"</tt>,
      <tt>"F058"</tt>,
      <tt>"F070"</tt>,
      <tt>"F071"</tt>,
      <tt>"F072"</tt>,
      <tt>"F078"</tt>,
      <tt>"F091"</tt>,
      <tt>"F098"</tt>
    </td>
    <td><tt>"F072"</tt></td>
    <td>
      Specifies the sub-family part of the STM32F0 part number. For example, choose "F072" for the STM32F072RB.
    </td>
  </tr>
  <tr>
    <td><tt>MCU_Pin_Count</tt></td>
    <td>
      <tt>"C"</tt>,
      <tt>"E"</tt>,
      <tt>"F"</tt>,
      <tt>"G"</tt>,
      <tt>"K"</tt>,
      <tt>"R"</tt>,
      <tt>"V"</tt>
    </td>
    <td><tt>"R"</tt></td>
    <td>
      Specifies the pin count part of the STM32F0 part number.
      For example, this is the "R" in "STM32F072RB".
    </td>
  </tr>
  <tr>
    <td><tt>MCU_User_Code_Memory_Size</tt></td>
    <td>
      <tt>"4"</tt>,
      <tt>"6"</tt>,
      <tt>"8"</tt>,
      <tt>"B"</tt>,
      <tt>"C"</tt>
    </td>
    <td><tt>"B"</tt></td>
    <td>
      Specifies the "user code memory size" part of the STM32F0 part number.
      For example, this is the "B" in "STM32F072RB".
    </td>
  </tr>
</table>

By default, the runtime is configured for the STM32F072RB. If you are using
a different MCU, then you will need to configure the runtime by adding the
following to your `alire.toml`. For example, to configure the runtime for the
STM32F030F4:
```toml
[configuration.values]
light_tasking_stm32f0xx.MCU_Sub_Family            = "F030"
light_tasking_stm32f0xx.MCU_Pin_Count             = "F"
light_tasking_stm32f0xx.MCU_User_Code_Memory_Size = "4"
```

By default, the runtime configures the clocks to provide a 48 MHz system clock
from the high-speed internal (HSI) oscillator. The following crate
configuration variables can be used to use a different clock tree configuration:

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>LSI_Enabled</tt></td>
    <td>
      <tt>true</tt>,
      <tt>false</tt>,
    </td>
    <td><tt>true</tt></td>
    <td>
      When <tt>true</tt>, the runtime will enable the low-speed internal (LSI)
      oscillator at startup.
    </td>
  </tr>
  <tr>
    <td><tt>HSE_Bypass</tt></td>
    <td>
      <tt>true</tt>,
      <tt>false</tt>,
    </td>
    <td><tt>false</tt></td>
    <td>
      When <tt>true</tt>, the runtime will use enable the HSE bypass feature
      to allow an external clock source to be used (setting HSEBYP in the clock
      configuration registers). When <tt>false</tt>, the HSE will be configured
      for an external crystal/ceramic resonator.
    </td>
  </tr>
  <tr>
    <td><tt>HSE_Clock_Frequency</tt></td>
    <td>
      4000000 .. 32000000
    </td>
    <td><tt>8000000</tt></td>
    <td>
      Specifies the frequency of the HSE clock in Hertz. The default is 8 MHz.
    </td>
  </tr>
  <tr>
    <td><tt>SYSCLK_Src</tt></td>
    <td>
      <tt>"HSI"</tt>,
      <tt>"HSE"</tt>,
      <tt>"PLL"</tt>,
      <tt>"HSI48"</tt>,
    </td>
    <td><tt>PLL</tt></td>
    <td>
      Specifies the clock source to use for the system clock (SYSCLK).
      <ul>
        <li><tt>"HSI"</tt> selects the 8 MHz high-speed internal (HSI) clock.</li>
        <li><tt>"HSE"</tt> selects the high-speed external (HSE) clock.</li>
        <li><tt>"PLL"</tt> selects the phase-locked loop (PLL) clock.</li>
        <li><tt>"HSI48"</tt> selects the 48 MHz high-speed internal (HSI48) clock.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><tt>PLL_Src</tt></td>
    <td>
      <tt>"HSI_2"</tt>,
      <tt>"HSI_PREDIV"</tt>,
      <tt>"HSE_PREDIV"</tt>,
      <tt>"HSI48_PREDIV"</tt>,
    </td>
    <td><tt>HSI_2</tt></td>
    <td>
      Specifies the clock source to use for the input into the PLL.
      <ul>
        <li><tt>"HSI_2"</tt> selects HSI divided by 2 as the PLL clock source (4 MHz).</li>
        <li><tt>"HSI_PREDIV"</tt> selects HSI divided by PREDIV as the PLL clock source.</li>
        <li><tt>"HSE_PREDIV"</tt> selects HSE divided by PREDIV as the PLL clock source.</li>
        <li><tt>"HSI48_PREDIV"</tt> selects HSI48 divided by PREDIV as the PLL clock source.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><tt>PREDIV</tt></td>
    <td><tt>1 .. 16</tt></td>
    <td><tt>2</tt></td>
    <td>
      Specifies the divider to use for the PLL clock input.
    </td>
  </tr>
  <tr>
    <td><tt>PLLMUL</tt></td>
    <td><tt>2 .. 16</tt></td>
    <td><tt>12</tt></td>
    <td>
      Specifies the PLL multiplier to use.
    </td>
  </tr>
  <tr>
    <td><tt>AHB_Pre</tt></td>
    <td>
      <tt>"DIV1"</tt>,
      <tt>"DIV2"</tt>,
      <tt>"DIV4"</tt>,
      <tt>"DIV8"</tt>,
      <tt>"DIV16"</tt>,
      <tt>"DIV64"</tt>,
      <tt>"DIV128"</tt>,
      <tt>"DIV256"</tt>,
      <tt>"DIV512"</tt>
    </td>
    <td><tt>DIV1</tt></td>
    <td>
      Specifies the divider to use for the AHB prescaler.
    </td>
  </tr>
  <tr>
    <td><tt>APB_Pre</tt></td>
    <td>
      <tt>"DIV1"</tt>,
      <tt>"DIV2"</tt>,
      <tt>"DIV4"</tt>,
      <tt>"DIV8"</tt>,
      <tt>"DIV16"</tt>
    </td>
    <td><tt>DIV1</tt></td>
    <td>
      Specifies the divider to use for the APB prescaler.
    </td>
  </tr>
</table>

Here's an example of configuring the runtime in `alire.toml` for a 32 MHz
system clock from a 16 MHz HSE oscillator:
```toml
[configuration.values]
# Configure a 16 MHz HSE crystal oscillator
light_tasking_stm32f0xx.HSE_Clock_Frequency = 16000000
light_tasking_stm32f0xx.HSE_Bypass = false

# Use the PLL as the SYSCLK source
light_tasking_stm32f0xx.SYSCLK_Src = "PLL"

# Configure the PLL input for a 16 MHz input from the HSE
light_tasking_stm32f0xx.PLL_Src = "HSE_PREDIV"
light_tasking_stm32f0xx.PREDIV = 1

# Configure the PLL to output 32 MHz (16 MHz * 2)
light_tasking_stm32f0xx.PLLMUL = 2

# Configure the AHB an APB to also run at 32 MHz
light_tasking_stm32f0xx.AHB_Pre = "DIV1"
light_tasking_stm32f0xx.APB_Pre = "DIV1"
```

### GPR Scenario Variables

The runtime project files expose `*_BUILD` and and `*_LIBRARY_TYPE` GPR
scenario variables to configure the build mode (e.g. debug/production) and
library type. These variables are prefixed with the name of the runtime in
upper case. For example, for the light-tasking-stm32f0xx runtime the variables
are `LIGHT_TASKING_STM32F0XX_BUILD` and `LIGHT_TASKING_STM32F0XX_LIBRARY_TYPE`
respectively.

The `*_BUILD` variable can be set to the following values:
* `Production` (default) builds the runtime with optimization enabled and with
  all run-time checks suppressed.
* `Debug` disables optimization and adds debug symbols.
* `Assert` enables assertions.
* `Gnatcov` disables optimization and enables flags to help coverage.

The `*_LIBRARY_TYPE` variable can be set to either `static` (default) or
`dynamic`, though only `static` libraries are supported on this target.

You can usually leave these set to their defaults, but if you want to set them
explicitly then you can set them either by passing them on the command line
when building your project with Alire:
```sh
alr build -- -XLIGHT_TASKING_STM32F0XX_BUILD=Debug
```

or by setting them in your project's `alire.toml`:
```toml
[gpr-set-externals]
LIGHT_TASKING_STM32F0XX_BUILD = "Debug"
```