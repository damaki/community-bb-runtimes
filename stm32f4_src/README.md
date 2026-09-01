# STM32F4xx Runtimes

This repository generates GNAT runtimes that support MCUs in the STM32F4
family. The specific MCU sub-family (e.g. STM32F411) is selected via the
`MCU_Sub_Family` crate configuration variable (see "MCU Configuration"
below). Currently the following sub-families are supported; more may be
added over time:
* STM32F411 (STM32F411Cx/Rx/Vx, with `x` being `C` for 256KB flash or `E`
  for 512KB flash)
* STM32F405/407/415/417 (`MCU_Sub_Family` = `"F407"` or `"F417"`)

The following runtime profiles are supported:
* light
* light-tasking
* embedded

## Usage

Using the `light-tasking-stm32f4xx` runtime as an example, first edit your
`alire.toml` file and add the following elements:
 - Add `light_tasking_stm32f4xx` in the dependency list:
   ```toml
   [[depends-on]]
   light_tasking_stm32f4xx = "*"
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

The following variables configure the specific STM32F4 MCU part number that
is being targeted:

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
      <tt>"F411"</tt>,
      <tt>"F407"</tt>,
      <tt>"F417"</tt>
    </td>
    <td><tt>"F411"</tt></td>
    <td>
      Specifies the sub-family part of the STM32F4 part number. For example,
      choose "F411" for the STM32F411CEU6, or "F407" for the STM32F407VET6.
      "F407" and "F417" share the same runtime support (they differ only by
      the presence of a CRYP/HASH peripheral, which this runtime does not
      use). More sub-families may be added in the future.
    </td>
  </tr>
  <tr>
    <td><tt>MCU_Pin_Count</tt></td>
    <td>
      <tt>"C"</tt> (48-pin),
      <tt>"R"</tt> (64-pin),
      <tt>"V"</tt> (100-pin),
      <tt>"Z"</tt> (144-pin),
      <tt>"I"</tt> (176-pin)
    </td>
    <td><tt>"C"</tt></td>
    <td>
      Specifies the pin count part of the STM32F4 part number. For example,
      this is the "C" in "STM32F411CEU6", or the "V" in "STM32F407VET6".
      This does not currently affect the generated runtime (all packages
      share the same peripheral register layout); it is provided for
      documentation and forward-compatibility.
    </td>
  </tr>
  <tr>
    <td><tt>MCU_Flash_Memory_Size</tt></td>
    <td>
      <tt>"C"</tt> (256KB),
      <tt>"E"</tt> (512KB),
      <tt>"G"</tt> (1024KB)
    </td>
    <td><tt>"E"</tt></td>
    <td>
      Specifies the "flash memory size" part of the STM32F4 part number.
      For example, this is the "E" in "STM32F411CEU6" or "STM32F407VET6".
      "G" (1MB flash) is only meaningful for the STM32F407/F417 sub-family.
    </td>
  </tr>
</table>

By default, the runtime is configured for the STM32F411CEU6 (the chip used on
the popular "WeAct BlackPill" board). If you are using a different MCU, then
you will need to configure the runtime by adding the following to your
`alire.toml`. For example, to configure the runtime for the STM32F411RCT6:
```toml
[configuration.values]
light_tasking_stm32f4xx.MCU_Sub_Family         = "F411"
light_tasking_stm32f4xx.MCU_Pin_Count          = "R"
light_tasking_stm32f4xx.MCU_Flash_Memory_Size  = "C"
```

Or, to configure the runtime for the STM32F407VET6. Note that
STM32F405/407/415/417 have lower APB1/APB2 frequency limits (42 / 84 MHz)
than STM32F411 (50 / 100 MHz), so the default clock tree (which targets
STM32F411's limits) must be paired with different APB prescalers -- see
"Clock Configuration" below:
```toml
[configuration.values]
light_tasking_stm32f4xx.MCU_Sub_Family         = "F407"
light_tasking_stm32f4xx.MCU_Pin_Count          = "V"
light_tasking_stm32f4xx.MCU_Flash_Memory_Size  = "E"
light_tasking_stm32f4xx.APB1_Pre               = "DIV4"
light_tasking_stm32f4xx.APB2_Pre               = "DIV2"
```

#### Clock Configuration

By default, the runtime configures the clocks to provide a 100 MHz system
clock from the high-speed internal (HSI) oscillator, via the PLL. The
following crate configuration variables can be used to configure a different
clock tree:

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>LSI_Enabled</tt></td>
    <td><tt>true</tt>, <tt>false</tt></td>
    <td><tt>true</tt></td>
    <td>
      When <tt>true</tt>, the runtime will enable the low-speed internal (LSI)
      oscillator at startup.
    </td>
  </tr>
  <tr>
    <td><tt>LSE_Enabled</tt></td>
    <td><tt>true</tt>, <tt>false</tt></td>
    <td><tt>false</tt></td>
    <td>
      When <tt>true</tt>, the runtime will enable the 32.768 kHz low-speed
      external (LSE) oscillator at startup.
    </td>
  </tr>
  <tr>
    <td><tt>HSE_Bypass</tt></td>
    <td><tt>true</tt>, <tt>false</tt></td>
    <td><tt>false</tt></td>
    <td>
      When <tt>true</tt>, the runtime will enable the HSE bypass feature to
      allow an external clock source to be used (setting HSEBYP in the clock
      configuration registers). When <tt>false</tt>, the HSE will be
      configured for an external crystal/ceramic resonator.
    </td>
  </tr>
  <tr>
    <td><tt>LSE_Bypass</tt></td>
    <td><tt>true</tt>, <tt>false</tt></td>
    <td><tt>false</tt></td>
    <td>
      Same as <tt>HSE_Bypass</tt>, but for the LSE oscillator.
    </td>
  </tr>
  <tr>
    <td><tt>HSE_Clock_Frequency</tt></td>
    <td>4000000 .. 26000000</td>
    <td><tt>25000000</tt></td>
    <td>
      Specifies the frequency of the HSE clock in Hertz. The default (25 MHz)
      matches the crystal fitted to many F411 boards, e.g. the "WeAct
      BlackPill".
    </td>
  </tr>
  <tr>
    <td><tt>PLL_Src</tt></td>
    <td><tt>"HSI"</tt>, <tt>"HSE"</tt></td>
    <td><tt>"HSI"</tt></td>
    <td>
      Specifies the clock source to use for the input into the PLL.
    </td>
  </tr>
  <tr>
    <td><tt>PLL_M_Div</tt></td>
    <td><tt>2 .. 63</tt></td>
    <td><tt>8</tt></td>
    <td>Specifies the 'M' divider value in the PLL configuration.</td>
  </tr>
  <tr>
    <td><tt>PLL_N_Mul</tt></td>
    <td><tt>50 .. 432</tt></td>
    <td><tt>168</tt></td>
    <td>Specifies the 'N' multiplier value in the PLL configuration.</td>
  </tr>
  <tr>
    <td><tt>PLL_P_Div</tt></td>
    <td>
      <tt>"DIV2"</tt>,
      <tt>"DIV4"</tt>,
      <tt>"DIV6"</tt>,
      <tt>"DIV8"</tt>
    </td>
    <td><tt>"DIV4"</tt></td>
    <td>
      Specifies the 'P' divider value in the PLL configuration. This
      determines the PLL's main output, used as SYSCLK.
    </td>
  </tr>
  <tr>
    <td><tt>PLL_Q_Div</tt></td>
    <td><tt>2 .. 15</tt></td>
    <td><tt>7</tt></td>
    <td>
      Specifies the 'Q' divider value in the PLL configuration, used to
      generate the 48 MHz clock for USB OTG FS / SDIO / RNG.
    </td>
  </tr>
  <tr>
    <td><tt>SYSCLK_Src</tt></td>
    <td>
      <tt>"HSI"</tt>,
      <tt>"HSE"</tt>,
      <tt>"PLL"</tt>
    </td>
    <td><tt>"PLL"</tt></td>
    <td>
      Specifies the clock source to use for the system clock (SYSCLK).
    </td>
  </tr>
  <tr>
    <td><tt>AHB_Pre</tt></td>
    <td>
      <tt>"DIV1"</tt>, <tt>"DIV2"</tt>, <tt>"DIV4"</tt>, <tt>"DIV8"</tt>,
      <tt>"DIV16"</tt>, <tt>"DIV64"</tt>, <tt>"DIV128"</tt>, <tt>"DIV256"</tt>,
      <tt>"DIV512"</tt>
    </td>
    <td><tt>"DIV1"</tt></td>
    <td>Specifies the divider to use for the AHB prescaler.</td>
  </tr>
  <tr>
    <td><tt>APB1_Pre</tt></td>
    <td>
      <tt>"DIV1"</tt>, <tt>"DIV2"</tt>, <tt>"DIV4"</tt>, <tt>"DIV8"</tt>,
      <tt>"DIV16"</tt>
    </td>
    <td><tt>"DIV2"</tt></td>
    <td>
      Specifies the divider to use for the APB1 prescaler. APB1 must not
      exceed 50 MHz on STM32F411, or 42 MHz on STM32F405/407/415/417.
    </td>
  </tr>
  <tr>
    <td><tt>APB2_Pre</tt></td>
    <td>
      <tt>"DIV1"</tt>, <tt>"DIV2"</tt>, <tt>"DIV4"</tt>, <tt>"DIV8"</tt>,
      <tt>"DIV16"</tt>
    </td>
    <td><tt>"DIV1"</tt></td>
    <td>
      Specifies the divider to use for the APB2 prescaler. APB2 must not
      exceed 100 MHz on STM32F411, or 84 MHz on STM32F405/407/415/417.
    </td>
  </tr>
</table>

Here's an example of configuring the runtime in `alire.toml` for a 100 MHz
system clock from a 25 MHz HSE oscillator:
```toml
[configuration.values]
light_tasking_stm32f4xx.MCU_Sub_Family      = "F411"
# Configure a 25 MHz HSE crystal oscillator
light_tasking_stm32f4xx.HSE_Clock_Frequency = 25000000
light_tasking_stm32f4xx.HSE_Bypass = false

# Select the PLL as the SYSCLK source, driven from HSE
light_tasking_stm32f4xx.SYSCLK_Src = "PLL"
light_tasking_stm32f4xx.PLL_Src = "HSE"

# Configure the PLL VCO to run at 400 MHz from the 25 MHz HSE
# (fVCO = fHSE * (N/M) = 25 MHz * (192/12) = 400 MHz)
light_tasking_stm32f4xx.PLL_M_Div = 12
light_tasking_stm32f4xx.PLL_N_Mul = 192

# Configure the PLL P output (SYSCLK) to run at 100 MHz from the 400 MHz VCO
light_tasking_stm32f4xx.PLL_P_Div = "DIV4"

# Configure the AHB, APB1 and APB2 prescalers
light_tasking_stm32f4xx.AHB_Pre  = "DIV1"
light_tasking_stm32f4xx.APB1_Pre = "DIV2"
light_tasking_stm32f4xx.APB2_Pre = "DIV1"
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
</table>

### GPR Scenario Variables

The runtime project files expose `*_BUILD` and `*_LIBRARY_TYPE` GPR
scenario variables to configure the build mode (e.g. debug/production) and
library type. These variables are prefixed with the name of the runtime in
upper case. For example, for the light-tasking-stm32f4xx runtime the
variables are `LIGHT_TASKING_STM32F4XX_BUILD` and
`LIGHT_TASKING_STM32F4XX_LIBRARY_TYPE` respectively.

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
alr build -- -XLIGHT_TASKING_STM32F4XX_BUILD=Debug
```

or by setting them in your project's `alire.toml`:
```toml
[gpr-set-externals]
LIGHT_TASKING_STM32F4XX_BUILD = "Debug"
```
