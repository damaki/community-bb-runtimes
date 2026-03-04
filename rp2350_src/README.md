# RP2350 Runtimes

The following GNAT runtimes are provided for the RP2350:
* `light_rp2350`
* `light_tasking_rp2350`
* `embedded_rp2350`

## Usage

The pre-generated runtimes are distributed as crates in the Alire community
index. This section describes how to set up your project to use one of those
crates.

Using the `light_tasking_rp2350` runtime as an example, first edit your
`alire.toml` file and add the following elements:
 - Add `light_tasking_rp2350` in the dependency list:
   ```toml
   [[depends-on]]
   light_tasking_rp2350 = "*"
   ```

Then edit your project file to add the following elements:
 - "with" the run-time project files:
   ```ada
   with "runtime_build.gpr";
   with "ravenscar_build.gpr";
   ```
 - specify the `Target` and `Runtime` attributes:
   ```ada
   for Target use Runtime_Build'Target;
   for Runtime ("Ada") use Runtime_Build'Runtime ("Ada");
   ```
 - specify the `Linker` switches:
   ```ada
   package Linker is
     for Switches ("Ada") use Runtime_Build.Linker_Switches & ("-Wl,--gc-sections");
   end Linker;
   ```

>[!TIP]
> The `--gc-sections` linker switch is recommended (but not mandatory) to
> remove any unused code and data sections from the executable and therefore
> reduce memory usage.

## Multitasking

The _light-tasking_ and _embedded_ runtime profiles support multitasking across
both cores on the RP2350 using the Ada language's task and protected
object mechanisms. By default, tasks run on the first core. Tasks can be pinned
to the second core using the `CPU` aspect or pragma in the task declaration.
For example, to declare a task that runs on the second core:

```ada
task My_Task with CPU => 2;
```

Interrupt handlers can also be assigned execute on a specific core on a
per-interrupt basis.
Each interrupt in package `Ada.Interrupts.Names` has two variants: the
ones ending in `_CPU_1` are executed on the first core, and the ones ending
in `_CPU_2` are executed on the second core.
For example, to handle the `PIO0_IRQ_0` interrupt on the second core:

```ada
protected My_PO with Interrupt_Priority => System.Interrupt_Priority'Last is

   --  Declare public protected subprograms here

private

   procedure PIO0_Interrupt_Handler with
     Attach_Handler => Ada.Interrupts.Names.PIO0_IRQ_0_Interrupt_CPU_2;

end My_PO;
```

>[!TIP]
>If you don't want the runtime to use the second core, then you can configure
>the runtime to only use the first core by setting the `Max_CPUs` crate
>configuration variable to `1`. The _light_ runtime profile always uses 1 core.

## Resources Used

The following peripherals are reserved for use by the the runtime
(_light-tasking_ and _embedded_ runtime profiles only):
* One of the System Timers' ALARM channels is used to implement Ada semantics
  for time, i.e., delay statements and the package `Ada.Real_Time`.
  The timer interrupt runs at the highest priority.
  The specific System Timer and ALARM channel that is used is configurable.
* When the runtime is configured to use both cores (i.e. `Max_CPUs > 1`
  in the runtime configuration), then the SIO doorbell is reserved for
  use by the runtime. For a single-core configuration (`Max_CPUs = 1`), the
  SIO doorbell is not reserved and can be used by the application.

The following peripherals configured by the runtime:
* The runtime enables the redundancy coprocessor at startup.
* The runtime configures `clk_ref` to run at the reference clock speed, either
  XOSC or ROSC depending on the runtime configuration. `clk_ref` therefore
  runs at 12 MHz unless a different XOSC frequency is used.
* The runtime configures `clk_usb` and `clk_sys` using the PLL settings
  specified by the user in the runtime configuration. The default configuration
  sets `clk_usb` to 48 MHz and `clk_sys` to 150 MHz.
* The runtime sets `clk_usb` and `clk_adc` to run from `pll_usb`.

### Ada.Text_IO

The runtime libraries provide a minimal version of package `Ada.Text_IO`
supporting character and string-based input and output routines. These are
implemented using semihosting, which requires a debugger to be attached.
Calling the semihosted Text_IO routines without a debugger attached will
trigger a HardFault on the processor that uses it.

## Runtime Configuration

The runtime can be configured by setting various crate configuration variables
in your project's `alire.toml`. The available configuration options are described
in the following subsections:

### General Configuration

>[!NOTE]
>The following configuration items apply to the _light-tasking_ and _embedded_
>runtime profiles only.

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>Time_Base_Timer</tt></td>
    <td>
      <tt>"TIMER0"</tt><br/>
      <tt>"TIMER1"</tt><br/>
    </td>
    <td><tt>"TIMER0"</tt></td>
    <td>
      Selects which Sytem Timer peripheral is used by the runtime uses to
      implement the semantics of <tt>Ada.Real_Time</tt>.
    </td>
  </tr>
  <tr>
    <td><tt>Time_Base_Alarm</tt></td>
    <td>
      <tt>"ALARM0"</tt><br/>
      <tt>"ALARM1"</tt><br/>
      <tt>"ALARM2"</tt><br/>
      <tt>"ALARM3"</tt><br/>
    </td>
    <td><tt>"ALARM3"</tt></td>
    <td>
      Selects which ALARM interrupt of the System Timer chosen by
      <tt>Time_Base_Timer</tt> that the runtime uses to implement the semantics
      of <tt>Ada.Real_Time</tt>. The specified ALARM interrupt will be reserved
      by the runtime and must not be used by the user program.
    </td>
  </tr>
  <tr>
    <td><tt>Max_CPUs</tt></td>
    <td>
      <tt>1</tt>, <tt>2</tt>
    </td>
    <td><tt>2</tt></td>
    <td>
      Selects how many of the Cortex-M33 cores are used by the runtime.
      By default, the runtime uses both cores and tasks can be assigned to either
      core using the <tt>CPU</tt> pragma or aspect on the task declaration. For example:
      <tt>task My_Task with CPU => 2;</tt> runs <tt>My_Task</tt> on the second core.<br/>
      When this is set to 1, the runtime will ignore the second CPU and will
      schedule all tasks and interrupts on the first core.
    </td>
  </tr>
  <tr>
    <td><tt>Security_Level</tt></td>
    <td>
      <tt>"Secure"</tt><br/>
      <tt>"Non_Secure"</tt><br/>
    </td>
    <td><tt>"Secure"</tt></td>
    <td>
      Configures the TrustZone execution state for the partition.
      The runtime embeds this information into the Image Definition
      metadata block.<br/>
      Note that the <tt>Non_Secure</tt> execution state requires a partition
      table to be configured in the final image, which you can embed using
      <tt>picotool</tt> from
      <a href="https://github.com/raspberrypi/pico-sdk-tools">pico-sdk-tools</a>.
    </td>
  </tr>
  <tr>
    <td><tt>Interrupt_Stack_Size</tt></td>
    <td>
      Any positive integer
    </td>
    <td><tt>1024</tt></td>
    <td>
      Sets the size of the primary stack used for interrupt handlers in bytes.
    </td>
  </tr>
  <tr>
    <td><tt>Interrupt_Secondary_Stack_Size</tt></td>
    <td>
      Any positive integer
    </td>
    <td><tt>128</tt></td>
    <td>
      Sets the size of the secondary stack used for interrupt handlers in bytes.
    </td>
  </tr>
</table>

For example, to configure the light_tasking_rp2350 runtime to only use the
first core, add this to your `alire.toml`:
```toml
[configuration.values]
light_tasking_rp2350.Max_CPUs = 1
```

### Clock Configuration

The following variables can be set to change the `pll_sys` clock configuration.
By default, a 150 MHz clock is generated, assuming a 12 MHz XOSC.

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>PLL_Sys_Reference_Div</tt></td>
    <td><tt>1 .. 63</tt></td>
    <td><tt>1</tt></td>
    <td>
      Sets the REFDIV for <tt>pll_sys</tt>
    </td>
  </tr>
  <tr>
    <td><tt>PLL_Sys_VCO_Multiple</tt></td>
    <td><tt>16 .. 320</tt></td>
    <td><tt>125</tt></td>
    <td>
      Sets the VCO multiplier for <tt>pll_sys</tt>
    </td>
  </tr>
  <tr>
    <td><tt>PLL_Sys_Post_Div_1</tt></td>
    <td><tt>1 .. 7</tt></td>
    <td><tt>5</tt></td>
    <td>
      Sets POSTDIV1 for <tt>pll_sys</tt>
    </td>
  </tr>
  <tr>
    <td><tt>PLL_Sys_Post_Div_2</tt></td>
    <td><tt>1 .. 7</tt></td>
    <td><tt>2</tt></td>
    <td>
      Sets POSTDIV2 for <tt>pll_sys</tt>
    </td>
  </tr>
</table>

The following variables can be set to change the `pll_usb` clock configuration.
By default, a 48 MHz USB clock is generated assuming a 12 MHz XOSC.

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>PLL_USB_Reference_Div</tt></td>
    <td><tt>1 .. 63</tt></td>
    <td><tt>1</tt></td>
    <td>
      Sets the REFDIV for <tt>pll_usb</tt>
    </td>
  </tr>
  <tr>
    <td><tt>PLL_USB_VCO_Multiple</tt></td>
    <td><tt>16 .. 320</tt></td>
    <td><tt>40</tt></td>
    <td>
      Sets the VCO multiplier for <tt>pll_usb</tt>
    </td>
  </tr>
  <tr>
    <td><tt>PLL_USB_Post_Div_1</tt></td>
    <td><tt>1 .. 7</tt></td>
    <td><tt>5</tt></td>
    <td>
      Sets POSTDIV1 for <tt>pll_usb</tt>
    </td>
  </tr>
  <tr>
    <td><tt>PLL_USB_Post_Div_2</tt></td>
    <td><tt>1 .. 7</tt></td>
    <td><tt>2</tt></td>
    <td>
      Sets POSTDIV2 for <tt>pll_usb</tt>
    </td>
  </tr>
</table>

For example, to configure a 133 MHz clock add the following to your `alire.toml`:
```toml
[configuration.values]
light_tasking_rp2350.PLL_Sys_Reference_Div = 1
light_tasking_rp2350.PLL_Sys_VCO_Multiple = 133
light_tasking_rp2350.PLL_Sys_Post_Div_1 = 6
light_tasking_rp2350.PLL_Sys_Post_Div_2 = 2
```

### Board Configuration

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>Board</tt></td>
    <td>
      <tt>"generic_board"</tt><br/>
      <tt>"rpi_pico2"</tt><br/>
      <tt>"pimoroni_pico_lipo_2_xl_w"</tt><br/>
      <tt>"pimoroni_pico_plus_2"</tt><br/>
      <tt>"pimoroni_plasma_2350"</tt><br/>
      <tt>"pimoroni_tiny_2350"</tt><br/>
      <tt>"pimoroni_rp2350_stamp_xl"</tt><br/>
      <tt>"pimoroni_rp2350_stamp"</tt><br/>
      <tt>"pimoroni_pga2350"</tt><br/>
      <tt>"adafruit_feather_rp2350"</tt><br/>
      <tt>"adafruit_metro_rp2350"</tt><br/>
      <tt>"adafruit_fruit_jam"</tt><br/>
    </td>
    <td><tt>"rpi_pico2"</tt></td>
    <td>
      Configures the runtime for a specific board. This is used to select the
      appropriate linker script and XOSC based on the board.<br/>
      When <tt>"generic_board"</tt> is selected, the board parameters must be
      set manually (see below).
    </td>
  </tr>
</table>

When `"generic_board"` is selected as the board, then the following configuration
variables can be set to specify the board parameters.
These variables are ignored for non-generic boards.

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>XOSC_Frequency</tt></td>
    <td>
      Any non-negative value
    </td>
    <td><tt>12000000</tt></td>
    <td>
      Specifies the frequency of the on-board XOSC in Hertz. Set to 0 if the
      board does not have an XOSC.
    </td>
  </tr>
  <tr>
    <td><tt>XOSC_Startup_Delay_Mult</tt></td>
    <td>
      <tt>1 .. 16383</tt>
    </td>
    <td><tt>64</tt></td>
    <td>
      Sets the startup delay for the XOSC in milliseconds.
    </td>
  </tr>
  <tr>
    <td><tt>Flash_Size</tt></td>
    <td>
      <tt>2</tt><br/>
      <tt>4</tt><br/>
      <tt>8</tt><br/>
      <tt>16</tt><br/>
    </td>
    <td><tt>2</tt></td>
    <td>
      Sets the size of the flash chip that is fitted on the board in megabytes.
      This is used to set the memory size in the linker script.
    </td>
  </tr>
</table>

### GPR Scenario Variables

The runtime project files expose `*_BUILD` and and `*_LIBRARY_TYPE` GPR
scenario variables to configure the build mode (e.g. debug/production) and
library type. These variables are prefixed with the name of the runtime in
upper case. For example, for the light_tasking_rp2350 runtime the variables
are `LIGHT_TASKING_RP2350_BUILD` and `LIGHT_TASKING_RP2350_LIBRARY_TYPE`
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
alr build -- -XLIGHT_TASKING_RP2350_BUILD=Debug
```

or by setting them in your project's `alire.toml`:
```toml
[gpr-set-externals]
LIGHT_TASKING_RP2350_BUILD = "Debug"
```