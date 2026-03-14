# nRF54L Runtimes

This repository generates Ada/SPARK runtimes for SoCs in the nRF54L series,
with support for the following runtime profiles:
* light
* light-tasking
* embedded

## Usage

First edit your `alire.toml` file and add the following elements:
 - Add `light_tasking_nrf54l` in the dependency list:
   ```toml
   [[depends-on]]
   light_tasking_nrf54l = "*"
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
 - specify the `Linker` switches:
   ```ada
   package Linker is
     for Switches ("Ada") use Runtime_Build.Linker_Switches & ("-Wl,--gc-sections");
   end Linker;
   ```

## Resources Used

The light-tasking and embedded runtime profiles use one of the four GRTC
interrupts and one of the twelve GRTC capture/compare channels to implement Ada
semantics for time, i.e., delay statements and the package Ada.Real_Time.
The specific GRTC interrupt and capture/compare channel used is configurable
(see below). The GRTC interrupt runs at the highest priority.

## TrustZone Execution States

The runtime can be configured to run in either secure or non-secure TrustZone
execution states by setting the `Security_Level` configuration variable
(see below).

The runtime only performs initial low-level configuration such as setting the
LFCLK source and SWO trace pins when it is configured with
`Security_Level = "Secure"`. When configured as `Non_Secure`, the runtime
assumes that the secure world takes care of such initialization, and the
runtime configures the non-secure peripherals it needs to function such as
`GRTC_NS`.

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
    <td><tt>Device</tt></td>
    <td>
      <tt>"nRF54L05"</tt><br/>
      <tt>"nRF54L10"</tt><br/>
      <tt>"nRF54L15"</tt><br/>
      <tt>"nRF54LM20A"</tt><br/>
      <tt>"nRF54LM20B"</tt><br/>
      <tt>"nRF54LS05A"</tt><br/>
      <tt>"nRF54LS05B"</tt><br/>
      <tt>"nRF54LV10A"</tt><br/>
    </td>
    <td><tt>"nRF54L15"</tt></td>
    <td>
      Targets the runtime for a specific device in the nRF54L family.
      This affects the default linker script and workarounds for erratas that
      are applied at startup.
    </td>
  </tr>
  <tr>
    <td><tt>Time_Base_GRTC_IRQ</tt></td>
    <td>
      <tt>"0 .. 3"</tt><br/>
    </td>
    <td><tt>3</tt></td>
    <td>
      Selects which GRTC interrupt is reserved by the runtime to
      implement the semantics of `Ada.Real_Time`.
    </td>
  </tr>
  <tr>
    <td><tt>Time_Base_GRTC_CCn</tt></td>
    <td>
      <tt>"0 .. 11"</tt><br/>
    </td>
    <td><tt>11</tt></td>
    <td>
      Selects which GRTC capture/compare channel is reserved by the
      runtime to implement the semantics of `Ada.Real_Time`.
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
      Sets the Cortex-M33 TrustZone execution mode that the runtime expects to
      run at.
    </td>
  </tr>
</table>

The following configuration variables are applicable only when
`Security_Level = "Secure"`:

<table>
  <thead>
    <th>Variable</th>
    <th>Values</th>
    <th>Default</th>
    <th>Description</th>
  </thead>
  <tr>
    <td><tt>MCU_Domain_Speed</tt></td>
    <td>
      <tt>"CK64M"</tt><br/>
      <tt>"CK128M"</tt><br/>
    </td>
    <td><tt>"CK64M"</tt></td>
    <td>
      Selects the MCU domain speed that will be applied at startup
      (either 64 MHz or 128 MHz).
    </td>
  </tr>
  <tr>
    <td><tt>LFCLK_Src</tt></td>
    <td>
      <tt>"LFXO"</tt><br/>
      <tt>"LFRC"</tt><br/>
      <tt>"LFSYNT"</tt><br/>
    </td>
    <td><tt>"LFXO"</tt></td>
    <td>
      Sets the clock source for the low frequency clock (LFCLK).
      <ul>
        <li><tt>"LFXO"</tt> selects the external 32 kHz crystal as the LFCLK source (LFXO)</li>
        <li><tt>"LFRC"</tt> selects the internal LFRC oscillator as the LFCLK source</li>
        <li><tt>"LFSYNT"</tt> synthesises the LFCLK from the HFCLK</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><tt>Enable_SWO</tt></td>
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
    <td><tt>Enable_Trace</tt></td>
    <td>
      <tt>true</tt><br/>
      <tt>false</tt><br/>
    </td>
    <td><tt>false</tt></td>
    <td>
      When true, the TRACE pins are configured during startup to enable trace.
    </td>
  </tr>
  <tr>
    <td><tt>Enable_Glitch_Detector</tt></td>
    <td>
      <tt>true</tt><br/>
      <tt>false</tt><br/>
    </td>
    <td><tt>true</tt></td>
    <td>
      When true, the glitch detector is enabled at startup. When false, it is
      disabled.
    </td>
  </tr>
</table>

For example, to configure the runtime to use the internal LFRC oscillator as
the LFCLK source and GRTC_IRQ_0 for timing, add this to your `alire.toml`:
```toml
[configuration.values]
light_tasking_nrf54l.LFCLK_Src = "RC"
light_tasking_nrf54l.Time_Base_GRTC_IRQ = 0
```

### GPR Scenario Variables

The runtime project files expose `*_BUILD` and and `*_LIBRARY_TYPE` GPR
scenario variables to configure the build mode (e.g. debug/production) and
library type. These variables are prefixed with the name of the runtime in
upper case. For example, for the light-tasking runtime the variables
are `LIGHT_TASKING_NRF524L_BUILD` and `LIGHT_TASKING_NRF524L_LIBRARY_TYPE`
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
alr build -- -XLIGHT_TASKING_NRF54L_BUILD=Debug
```

or by setting them in your project's `alire.toml`:
```toml
[gpr-set-externals]
LIGHT_TASKING_NRF54L_BUILD = "Debug"
```