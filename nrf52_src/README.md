# nRF52 Runtimes

This repository generates Ada/SPARK runtimes for the following SoCs in the
nRF52 series:
* nRF52832
* nRF52833
* nRF52840

The following runtime profiles are supported for each of the above:
* light
* light-tasking
* embedded

## Usage

Using the light_tasking_nrf52840 as an example, first edit your
`alire.toml` file and add the following elements:
 - Add `light_tasking_nrf52840` in the dependency list:
   ```toml
   [[depends-on]]
   light_tasking_nrf52840 = "*"
   ```

Then edit your project file to add the following elements, depending on your
chosen runtime profile:
 - when using the **light** runtime profile:
   - "with" the run-time project file:
     ```ada
     with "runtime_build.gpr";
     ```
   - specify the `Target` and `Runtime` attributes:
     ```ada
     for Target use runtime_build'Target;
     for Runtime ("Ada") use runtime_build'Runtime ("Ada");
     ```
 - when using the **light-tasking** or **embedded** runtime profile:
   - "with" the run-time project file:
     ```ada
     with "ravenscar_build.gpr";
     ```
   - specify the `Target` and `Runtime` attributes:
     ```ada
     for Target use ravenscar_build'Target;
     for Runtime ("Ada") use ravenscar_build'Runtime ("Ada");
     ```

## Resources Used

The light-tasking and embedded runtime profiles use an RTC peripheral to
implement Ada semantics for time, i.e., delay statements and the package
Ada.Real_Time. The RTC interrupt runs at the highest priority. The RTC runs
from the low frequency clock (LFCLK) which runs at 32.768 kHz. The LFCLK source
is configured via the crate configuration, and may be either the external
32 kHz crystal oscillator (LFXO), the internal 32 kHz oscillator (LFRC), or
synthesized from the 16 MHz high-speed clock (HFCLK).

## Runtime Configuration

### Crate Configuration

The runtime is configurable through the following crate configuration variables:

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>Time_Base</tt></td>
    <td>
      <tt>"RTC0"</tt><br/>
      <tt>"RTC1"</tt><br/>
      <tt>"RTC2"</tt><br/>
    </td>
    <td><tt>"RTC2"</tt></td>
    <td>
      Selects which RTC peripheral the runtime uses to implement the semantics
      of `Ada.Real_Time`.
    </td>
  </tr>
  <tr>
    <td><tt>LFCLK_Src</tt></td>
    <td>
      <tt>"Xtal"</tt><br/>
      <tt>"RC"</tt><br/>
      <tt>"Synth"</tt><br/>
    </td>
    <td><tt>"Xtal"</tt></td>
    <td>
      Sets the clock source for the low frequency clock (LFCLK).
      <ul>
        <li><tt>"Xtal"</tt> selects the external 32 kHz crystal as the LFCLK source (LFXO)</li>
        <li><tt>"RC"</tt> selects the internal LFRC oscillator as the LFCLK source</li>
        <li><tt>"Synth"</tt> synthesises the LFCLK from the HFCLK</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><tt>Use_SWO_Trace</tt></td>
    <td>
      <tt>true</tt><br/>
      <tt>false</tt><br/>
    </td>
    <td><tt>true</tt></td>
    <td>
      When true, the SWO pins are configured during startup to enable SWO trace.
    </td>
  </tr>
  <tr>
    <td><tt>Use_Reset_Pin</tt></td>
    <td>
      <tt>true</tt><br/>
      <tt>false</tt><br/>
    </td>
    <td><tt>true</tt></td>
    <td>
      When true, P0.18 is configured as the reset pin.
    </td>
  </tr>
</table>

For example, to configure the light-tasking-nrf52840 runtime to use the
internal LFRC oscillator as the LFCLK source and RTC0 for timing, add this to
your `alire.toml`:
```toml
[configuration.values]
light_tasking_nrf52840.LFCLK_Src = "RC"
light_tasking_nrf52840.Time_Base = "RTC0"
```

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

The following variables configure the communication method used for package
`Ada.Text_IO`:

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>Text_IO</tt></td>
    <td>
      <tt>"None"</tt><br/>
      <tt>"Semihosting"</tt><br/>
      <tt>"Segger_RTT"</tt><br/>
    </td>
    <td><tt>"Semihosting"</tt></td>
    <td>
      Selects the communication method used for package <tt>Ada.Text_IO</tt>.
      <ul>
        <li><tt>"None"</tt> silently discards all data sent via <tt>Ada.Text_IO</tt></li>
        <li><tt>"Semihosting"</tt> uses Arm semihosting to send and receive data</li>
        <li><tt>"Segger_RTT"</tt> uses Segger Real Time Transfer (RTT) to send and receive data</li>
      </ul>
    </td>
  </tr>
</table>

>[!NOTE]
> Segger RTT uses circular buffers in RAM to send Text_IO data.
> A debug probe on the host machine (e.g. a J-Link) uses background memory
> accesses (via JTAG, SWD, or similar) to asynchronously read and write to those
> RAM buffers (i.e., without halting the CPU). This allows RTT to be much faster
> than semihosting, but requires special support from the debug probes and
> debug software tools to communicate.

When `Text_IO` is set to `"Segger_RTT"` then the following configuration
variables can be used to fine-tune it:

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>Text_IO_RTT_Out_Buffer_Length</tt></td>
    <td><tt>>= 2</td>
    <td><tt>1024</tt></td>
    <td>Sets the size (in characters) of the output buffer for Segger RTT Text_IO.</td>
  </tr>
  <tr>
    <td><tt>Text_IO_RTT_In_Buffer_Length</tt></td>
    <td><tt>>= 2</td>
    <td><tt>32</tt></td>
    <td>Sets the size (in characters) of the input buffer for Segger RTT Text_IO.</td>
  </tr>
  <tr>
    <td><tt>Text_IO_RTT_Mode</tt></td>
    <td>
      <tt>"No_Block_Trim"</tt><br/>
      <tt>"Block_When_Full"</tt><br/>
    </td>
    <td><tt>"No_Block_Trim"</tt></td>
    <td>
      Selects the RTT behaviour when the output buffer is full.
      <ul>
        <li><tt>"No_Block_Trim"</tt> RTT output is non-blocking.
        Messages are truncated when the buffer becomes full.</li>
        <li><tt>"Block_When_Full"</tt> causes <tt>Ada.Text_IO</tt> to block
        when the output buffer becomes full, until the debug probe consumes
        data from it.</li>
      </ul>
    </td>
  </tr>
</table>

### GPR Scenario Variables

The runtime project files expose `*_BUILD` and and `*_LIBRARY_TYPE` GPR
scenario variables to configure the build mode (e.g. debug/production) and
library type. These variables are prefixed with the name of the runtime in
upper case. For example, for the light-tasking-nrf52832 runtime the variables
are `LIGHT_TASKING_NRF52832_BUILD` and `LIGHT_TASKING_NRF52832_LIBRARY_TYPE`
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
alr build -- -XLIGHT_TASKING_NRF52840_BUILD=Debug
```

or by setting them in your project's `alire.toml`:
```toml
[gpr-set-externals]
LIGHT_TASKING_NRF52840_BUILD = "Debug"
```