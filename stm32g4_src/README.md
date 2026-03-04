# STM32G4xx Runtimes

This repository generates GNAT runtimes that support all MCUs in the STM32G4
family.

The following runtime profiles are supported:
* light
* light-tasking
* embedded

## Usage

Using the `light-tasking-stm32g4xx` runtime as an example, first edit your
`alire.toml` file and add the following elements:
 - Add `light_tasking_stm32g4xx` in the dependency list:
   ```toml
   [[depends-on]]
   light_tasking_stm32g4xx = "*"
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

The runtime is configurable through crate configuration variables in your project's `alire.toml`.

#### MCU Configuration

The following variables configure the specific STM32G4 MCU that is being targeted:

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
      <tt>"G431"</tt>,
      <tt>"G441"</tt>,
      <tt>"G491"</tt>,
      <tt>"G4A1"</tt>,
      <tt>"G473"</tt>,
      <tt>"G483"</tt>,
      <tt>"G474"</tt>,
      <tt>"G484"</tt>
    </td>
    <td><tt>"G474"</tt></td>
    <td>
      Specifies the sub-family part of the STM32G4 part number. For example, choose "G474" for the STM32G474RE.
    </td>
  </tr>
  <tr>
    <td><tt>MCU_Flash_Memory_Size</tt></td>
    <td>
      <tt>"6"</tt>,
      <tt>"8"</tt>,
      <tt>"B"</tt>,
      <tt>"C"</tt>,
      <tt>"E"</tt>
    </td>
    <td><tt>"E"</tt></td>
    <td>
      Specifies the "flash memory size" part of the STM32G4 part number.
      For example, this is the "E" in "STM32G474RE".
    </td>
  </tr>
</table>

By default, the runtime is configured for the STM32G474RE. If you are using
a different MCU, then you will need to configure the runtime by adding the
following to your `alire.toml`. For example, to configure the runtime for the
STM32G431K6:
```toml
[configuration.values]
light_tasking_stm32g4xx.MCU_Sub_Family        = "G431"
light_tasking_stm32g4xx.MCU_Flash_Memory_Size = "6"
```

#### Clock Configuration

By default, the runtime configures the clocks to provide a 170 MHz system clock
from the high-speed internal (HSI) oscillator. The following crate
configuration variables can be used to configure a different clock tree:

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
      <tt>false</tt>
    </td>
    <td><tt>true</tt></td>
    <td>
      When <tt>true</tt>, the runtime will enable the 32 kHz low-speed internal
      (LSI) oscillator at startup.
    </td>
  </tr>
  <tr>
    <td><tt>LSE_Enabled</tt></td>
    <td>
      <tt>true</tt>,
      <tt>false</tt>
    </td>
    <td><tt>true</tt></td>
    <td>
      When <tt>true</tt>, the runtime will enable the 32.768 kHz low-speed external
      (LSE) oscillator at startup.
    </td>
  </tr>
  <tr>
    <td><tt>HSE_Bypass</tt></td>
    <td>
      <tt>true</tt>,
      <tt>false</tt>
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
    <td><tt>LSE_Bypass</tt></td>
    <td>
      <tt>true</tt>,
      <tt>false</tt>
    </td>
    <td><tt>false</tt></td>
    <td>
      When <tt>true</tt>, the runtime will use enable the LSE bypass feature
      to allow an external clock source to be used (setting LSEBYP in the clock
      configuration registers). When <tt>false</tt>, the LSE will be configured
      for an external crystal/ceramic resonator.
    </td>
  </tr>
  <tr>
    <td><tt>HSE_Clock_Frequency</tt></td>
    <td>
      4000000 .. 48000000
    </td>
    <td><tt>24000000</tt></td>
    <td>
      Specifies the frequency of the HSE clock in Hertz. The default is 24 MHz.
    </td>
  </tr>
  <tr>
    <td><tt>PLL_Src</tt></td>
    <td>
      <tt>"HSE"</tt>,
      <tt>"HSI16"</tt>
    </td>
    <td><tt>HSI16</tt></td>
    <td>
      Specifies the clock source to use for the input into the PLL.
      <ul>
        <li><tt>"HSE"</tt> selects the high-speed external (HSE) clock as the PLL clock source.</li>
        <li><tt>"HSI16"</tt> selects high-speed internal (HSI) clock as the PLL clock source.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><tt>PLL_M_Div</tt></td>
    <td><tt>1 .. 16</tt></td>
    <td><tt>4</tt></td>
    <td>Specifies the 'M' divider value in the PLL configuration</td>
  </tr>
  <tr>
    <td><tt>PLL_N_Div</tt></td>
    <td><tt>8 .. 127</tt></td>
    <td><tt>85</tt></td>
    <td>Specifies the 'N' multiplier value in the PLL configuration.</td>
  </tr>
  <tr>
    <td><tt>PLL_R_Div</tt></td>
    <td>
      <tt>"DIV2"</tt>,
      <tt>"DIV4"</tt>,
      <tt>"DIV6"</tt>,
      <tt>"DIV8"</tt>
    </td>
    <td><tt>"DIV2"</tt></td>
    <td>Specifies the 'R' divider value in the PLL configuration</td>
  </tr>
  <tr>
    <td><tt>PLL_Q_Div</tt></td>
    <td>
      <tt>"DIV2"</tt>,
      <tt>"DIV4"</tt>,
      <tt>"DIV6"</tt>,
      <tt>"DIV8"</tt>
    </td>
    <td><tt>"DIV2"</tt></td>
    <td>Specifies the 'Q' divider value in the PLL configuration</td>
  </tr>
  <tr>
    <td><tt>PLL_P_Div</tt></td>
    <td><tt>2 .. 31</tt></td>
    <td><tt>2</tt></td>
    <td>Specifies the 'P' divider value in the PLL configuration</td>
  </tr>
  <tr>
    <td><tt>PLL_Q_Enable</tt></td>
    <td>
      <tt>true</tt>,
      <tt>false</tt>,
    </td>
    <td><tt>true</tt></td>
    <td>Selects whether the PLL's 'Q' output clock is enabled.</td>
  </tr>
  <tr>
    <td><tt>PLL_P_Enable</tt></td>
    <td>
      <tt>true</tt>,
      <tt>false</tt>,
    </td>
    <td><tt>true</tt></td>
    <td>Selects whether the PLL's 'P' output clock is enabled.</td>
  </tr>
  <tr>
    <td><tt>SYSCLK_Src</tt></td>
    <td>
      <tt>"HSI16"</tt>,
      <tt>"HSE"</tt>,
      <tt>"PLLRCLK"</tt>
    </td>
    <td><tt>"PLLRCLK"</tt></td>
    <td>
      Specifies the clock source to use for the system clock (SYSCLK).
      <ul>
        <li><tt>"HSI16"</tt> selects the high-speed internal (HSI) clock.</li>
        <li><tt>"HSE"</tt> selects the high-speed external (HSE) clock.</li>
        <li><tt>"PLLRCLK"</tt> selects the PLL's 'R' clock.</li>
      </ul>
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
    <td><tt>"DIV1"</tt></td>
    <td>
      Specifies the divider to use for the AHB prescaler.
    </td>
  </tr>
  <tr>
    <td><tt>APB1_Pre</tt></td>
    <td>
      <tt>"DIV1"</tt>,
      <tt>"DIV2"</tt>,
      <tt>"DIV4"</tt>,
      <tt>"DIV8"</tt>,
      <tt>"DIV16"</tt>
    </td>
    <td><tt>"DIV1"</tt></td>
    <td>
      Specifies the divider to use for the APB1 prescaler.
    </td>
  </tr>
  <tr>
    <td><tt>APB2_Pre</tt></td>
    <td>
      <tt>"DIV1"</tt>,
      <tt>"DIV2"</tt>,
      <tt>"DIV4"</tt>,
      <tt>"DIV8"</tt>,
      <tt>"DIV16"</tt>
    </td>
    <td><tt>"DIV1"</tt></td>
    <td>
      Specifies the divider to use for the APB2 prescaler.
    </td>
  </tr>
</table>

Here's an example of configuring the runtime in `alire.toml` for a 170 MHz
system clock from a 24 MHz HSE oscillator:
```toml
[configuration.values]
# Configure a 24 MHz HSE crystal oscillator
light_tasking_stm32g4xx.HSE_Clock_Frequency = 24000000
light_tasking_stm32g4xx.HSE_Bypass = false

# Select PLLRCLK as the SYSCLK source
light_tasking_stm32g4xx.SYSCLK_Src = "PLLRCLK"

# Configure the PLL VCO to run at 340 MHz from the 24 MHz HSE (fVCO = fHSE * (N/M))
light_tasking_stm32g4xx.PLL_Src = "HSE"
light_tasking_stm32g4xx.PLL_N_Mul = 85
light_tasking_stm32g4xx.PLL_M_Div = 6

# Configure the PLLRCLK to run at 170 MHz from the 340 MHz VCO.
light_tasking_stm32g4xx.PLL_R_Div = 2

# Configure the AHB and APB to also run at 170 MHz
light_tasking_stm32g4xx.AHB_Pre  = "DIV1"
light_tasking_stm32g4xx.APB1_Pre = "DIV1"
light_tasking_stm32g4xx.APB2_Pre = "DIV1"
```

#### Stack Sizes

The following variables configure the interrupt stack sizes:

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>Interrupt_Stack_Size</tt></td>
    <td>Any positive integer</td>
    <td><tt>1024</tt></td>
    <td>Specifies the size of the primary stack used for interrupt handlers.</td>
  </tr>
  <tr>
    <td><tt>Interrupt_Secondary_Stack_Size</tt></td>
    <td>Any positive integer</td>
    <td><tt>128</tt></td>
    <td>Specifies the size of the secondary stack used for interrupt handlers.</td>
  </tr>
</table>

### GPR Scenario Variables

The runtime project files expose `*_BUILD` and `*_LIBRARY_TYPE` GPR
scenario variables to configure the build mode (e.g. debug/production) and
library type. These variables are prefixed with the name of the runtime in
upper case. For example, for the light-tasking-stm32g4xx runtime the variables
are `LIGHT_TASKING_STM32G4XX_BUILD` and `LIGHT_TASKING_STM32G4XX_LIBRARY_TYPE`
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
alr build -- -XLIGHT_TASKING_STM32G4XX_BUILD=Debug
```

or by setting them in your project's `alire.toml`:
```toml
[gpr-set-externals]
LIGHT_TASKING_STM32G4XX_BUILD = "Debug"
```