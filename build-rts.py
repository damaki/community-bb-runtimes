# This script extends bb-runtimes to define custom targets

import sys
import os
import pathlib

# Add bb-runtimes to the search path so that we can include and extend it
sys.path.append(str(pathlib.Path(__file__).parent / "bb-runtimes"))

import arm.cortexm
import support.files_holder
from support import add_source_search_path


class ArmV7MArch_Patched(arm.cortexm.ArmV7MArch):
    def __init__(self):
        super(ArmV7MArch_Patched, self).__init__()
        # Use our own patched version of s-bbbosu.adb which has a fix that is
        # not yet merged upstream (the fix ensures that Interrupt_Wrapper is
        # called with interrupts disabled to avoid a race condition with
        # nested interrupts).
        # See: https://forum.ada-lang.io/t/a-bug-in-stm32-bareboard-runtimes/2168
        self.remove_source("s-bbbosu.adb")
        self.add_gnarl_sources("stm32g4_src/s-bbbosu.adb")


# Use our own version of _copy that creates missing subdirectories in the
# destination file path. This allows files to be installed in subdirectories
# created under "gnat" and "gnarl".

_bb_runtimes_copy = support.files_holder._copy


def _copy_patched(src, dst, template_config=None):
    dst_dir = os.path.dirname(dst)
    if not os.path.exists(dst_dir):
        os.makedirs(dst_dir)
    _bb_runtimes_copy(src, dst, template_config)


support.files_holder._copy = _copy_patched

# Import build_rts here so that it uses the patched version of _copy
import build_rts


class RP2040(arm.cortexm.CortexM0P):
    @property
    def name(self):
        return "rp2040"

    @property
    def parent(self):
        # Don't refer to any parent since we need to override certain
        # sources from CortexMArch (e.g. replace src/s-bbsumu__generic.adb)
        return None

    @property
    def loaders(self):
        return ("ROM",)

    @property
    def system_ads(self):
        return {
            "light": "system-xi-arm.ads",
            "light-tasking": "system-xi-armv6m-sfp.ads",
            "embedded": "system-xi-armv6m-full.ads",
        }

    def __init__(self):
        super(RP2040, self).__init__()

        # Common GNAT sources
        self.add_gnat_sources(
            "rp2040_src/boot2/generated/boot2-generic_03.S",
            "rp2040_src/boot2/generated/boot2-generic_qspi.S",
            "rp2040_src/boot2/generated/boot2-w25qxx.S",
            "rp2040_src/svd/i-rp2040.ads",
            "rp2040_src/svd/i-rp2040-clocks.ads",
            "rp2040_src/svd/i-rp2040-pll_sys.ads",
            "rp2040_src/svd/i-rp2040-psm.ads",
            "rp2040_src/svd/i-rp2040-resets.ads",
            "rp2040_src/svd/i-rp2040-rosc.ads",
            "rp2040_src/svd/i-rp2040-sio.ads",
            "rp2040_src/svd/i-rp2040-timer.ads",
            "rp2040_src/svd/i-rp2040-watchdog.ads",
            "rp2040_src/svd/i-rp2040-xosc.ads",
            "rp2040_src/s-bbmcpa.ads",
            "rp2040_src/start-rom.S",
            "rp2040_src/s-bootro.ads",
            "rp2040_src/s-bootro.adb",
            "rp2040_src/setup_clocks.adb",
            "rp2040_src/s-bbbopa.ads",
            "rp2040_src/s-bbpara.ads",
            "rp2040_src/s-bbrpat.ads",
            "rp2040_src/s-bbrpat.adb",
        )

        # s-maxres__cortexm3.adb is also compatible with Cortex-M0+
        self.add_gnat_sources("src/s-macres__cortexm3.adb")

        # Common GNARL sources
        self.add_gnarl_sources(
            "rp2040_src/s-bbbosu.adb",
            "rp2040_src/s-bbsumu.adb",
            "rp2040_src/s-bcpcst.adb",
            "src/s-bbcppr__armv7m.adb",
            "src/s-bbcppr__old.ads",
            "src/s-bbcpsp__cortexm.ads",
            "src/s-bcpcst__armvXm.ads",
        )

        self.add_source_alias(
            "gnarl",
            "cpus_1/a-intnam.ads",
            "rp2040_src/a-intnam-1.ads",
        )
        self.add_source_alias(
            "gnarl",
            "cpus_2/a-intnam.ads",
            "rp2040_src/a-intnam-2.ads",
        )

        # Don't warn about RAM sections having RWX permissions. Execute
        # permissions are currently needed for the stack since the compiler
        # may emit executable trampolines on the stack in some cases
        # (e.g. pointers to nested subprograms).
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="ROM")


class RP2350(arm.cortexm.CortexM33F):
    @property
    def name(self):
        return "rp2350"

    @property
    def parent(self):
        # Don't refer to any parent since we need to override certain
        # sources from CortexMArch (e.g. replace src/s-bbsumu__generic.adb)
        return None

    @property
    def has_double_precision_fpu(self):
        return False

    @property
    def loaders(self):
        return ("ROM",)

    @property
    def system_ads(self):
        return {
            "light": "system-xi-arm.ads",
            "light-tasking": "system-xi-arm-sfp.ads",
            "embedded": "system-xi-arm-full.ads",
        }

    def __init__(self):
        super(RP2350, self).__init__()

        # Common GNAT sources
        self.add_gnat_sources(
            "rp2350_src/svd/i-rp2350.ads",
            "rp2350_src/svd/i-rp2350-clocks.ads",
            "rp2350_src/svd/i-rp2350-pll_sys.ads",
            "rp2350_src/svd/i-rp2350-psm.ads",
            "rp2350_src/svd/i-rp2350-resets.ads",
            "rp2350_src/svd/i-rp2350-rosc.ads",
            "rp2350_src/svd/i-rp2350-sio.ads",
            "rp2350_src/svd/i-rp2350-ticks.ads",
            "rp2350_src/svd/i-rp2350-timer0.ads",
            "rp2350_src/svd/i-rp2350-timer1.ads",
            "rp2350_src/svd/i-rp2350-watchdog.ads",
            "rp2350_src/svd/i-rp2350-xosc.ads",
            "rp2350_src/s-bbmcpa.ads",
            "rp2350_src/image_def.S.inc",
            "rp2350_src/start-rom.S",
            "rp2350_src/setup_clocks.adb",
            "rp2350_src/s-bbbopa.ads",
        )

        # s-maxres__cortexm3.adb is also compatible with Cortex-M0+
        self.add_gnat_sources("src/s-macres__cortexm3.adb")

        # Common GNARL sources
        self.add_gnarl_sources("rp2350_src/s-bbpara.ads")

        self.add_gnarl_sources(
            "rp2350_src/s-bbbosu.adb",
            "rp2350_src/s-bbpara.ads",
            "rp2350_src/s-bbsumu.adb",
            "rp2350_src/s-bcpcst.adb",
            "src/s-bbcppr__armv7m.adb",
            "src/s-bbcppr__old.ads",
            "src/s-bbcpsp__cortexm.ads",
            "src/s-bcpcst__armvXm.ads",
        )

        self.add_source_alias(
            "gnarl",
            "cpus_1/a-intnam.ads",
            "rp2350_src/a-intnam-1.ads",
        )
        self.add_source_alias(
            "gnarl",
            "cpus_2/a-intnam.ads",
            "rp2350_src/a-intnam-2.ads",
        )

        # Don't warn about RAM sections having RWX permissions. Execute
        # permissions are currently needed for the stack since the compiler
        # may emit executable trampolines on the stack in some cases
        # (e.g. pointers to nested subprograms).
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="ROM")


class NRF52(arm.cortexm.ArmV7MTarget):
    @property
    def name(self):
        return "nRF52"

    @property
    def parent(self):
        return arm.cortexm.CortexMArch

    @property
    def loaders(self):
        return ("ROM",)

    @property
    def has_fpu(self):
        return True

    @property
    def system_ads(self):
        # Use custom System package since system-xi-cortexm4 assumes
        # 4-bit interrupt priorities, but the nRF52 only supports
        # 3-bit interrupt priorities. This requires different
        # definitions for Priority and Interrupt_Priority in System.
        return {
            "light": "system-xi-arm.ads",
            "light-tasking": "nrf52_src/system-xi-nrf52-sfp.ads",
            "embedded": "nrf52_src/system-xi-nrf52-full.ads",
        }

    @property
    def compiler_switches(self):
        # The required compiler switches
        return (
            "-mlittle-endian",
            "-mthumb",
            "-mfloat-abi=hard",
            "-mfpu=fpv4-sp-d16",
            "-mcpu=cortex-m4",
        )

    def __init__(self):
        super(NRF52, self).__init__()

        self.add_linker_script("nrf52_src/common-ROM.ld", loader="ROM")
        self.add_linker_script(
            "nrf52_src/memory-map_%s.ld" % self.name, "memory-map.ld"
        )

        self.add_gnat_sources(
            "nrf52_src/s-bbbopa.ads",
            "nrf52_src/s-bbmcpa.ads",
            "nrf52_src/start-common.S",
            "nrf52_src/start-rom.S",
            "nrf52_src/setup_board.ads",
        )

        self.add_gnarl_sources(
            "nrf52_src/s-bbpara.ads",
            "nrf52_src/s-bbbosu.adb",
            "src/s-bcpcst__pendsv.adb",
        )

        # Don't warn about RAM sections having RWX permissions. Execute
        # permissions are currently needed for the stack since the compiler
        # may emit executable trampolines on the stack in some cases
        # (e.g. pointers to nested subprograms).
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="ROM")


class NRF52833(NRF52):
    @property
    def name(self):
        return "nrf52833"

    @property
    def use_semihosting_io(self):
        return True

    def __init__(self):
        super(NRF52833, self).__init__()

        self.add_gnat_sources(
            "nrf52_src/nrf52833/setup_board.adb",
            "nrf52_src/nrf52833/svd/i-nrf52.ads",
            "nrf52_src/nrf52833/svd/i-nrf52-clock.ads",
            "nrf52_src/nrf52833/svd/i-nrf52-ficr.ads",
            "nrf52_src/nrf52833/svd/i-nrf52-gpio.ads",
            "nrf52_src/nrf52833/svd/i-nrf52-uicr.ads",
            "nrf52_src/nrf52833/svd/i-nrf52-nvmc.ads",
            "nrf52_src/nrf52833/svd/i-nrf52-rtc.ads",
            "nrf52_src/nrf52833/svd/i-nrf52-uart.ads",
            "nrf52_src/nrf52833/svd/i-nrf52-temp.ads",
            "nrf52_src/nrf52833/svd/i-nrf52-approtect.ads",
        )

        # ravenscar support
        self.add_gnarl_sources(
            "nrf52_src/nrf52833/svd/handler.S",
            "nrf52_src/nrf52833/svd/a-intnam.ads",
        )


class NRF52840(NRF52):
    @property
    def name(self):
        return "nrf52840"

    @property
    def use_semihosting_io(self):
        return True

    def __init__(self):
        super(NRF52840, self).__init__()

        self.add_gnat_sources(
            "nrf52_src/nrf52840/setup_board.adb",
            "nrf52_src/nrf52840/svd/i-nrf52.ads",
            "nrf52_src/nrf52840/svd/i-nrf52-ccm.ads",
            "nrf52_src/nrf52840/svd/i-nrf52-clock.ads",
            "nrf52_src/nrf52840/svd/i-nrf52-ficr.ads",
            "nrf52_src/nrf52840/svd/i-nrf52-gpio.ads",
            "nrf52_src/nrf52840/svd/i-nrf52-uicr.ads",
            "nrf52_src/nrf52840/svd/i-nrf52-nvmc.ads",
            "nrf52_src/nrf52840/svd/i-nrf52-rtc.ads",
            "nrf52_src/nrf52840/svd/i-nrf52-temp.ads",
        )
        self.add_gnarl_sources(
            "nrf52_src/nrf52840/svd/handler.S", "nrf52_src/nrf52840/svd/a-intnam.ads"
        )


class NRF52832(NRF52):
    @property
    def name(self):
        return "nrf52832"

    @property
    def use_semihosting_io(self):
        return True

    def __init__(self):
        super(NRF52832, self).__init__()

        self.add_gnat_sources(
            "nrf52_src/nrf52832/setup_board.adb",
            "nrf52_src/nrf52832/svd/i-nrf52.ads",
            "nrf52_src/nrf52832/svd/i-nrf52-clock.ads",
            "nrf52_src/nrf52832/svd/i-nrf52-ficr.ads",
            "nrf52_src/nrf52832/svd/i-nrf52-gpio.ads",
            "nrf52_src/nrf52832/svd/i-nrf52-uicr.ads",
            "nrf52_src/nrf52832/svd/i-nrf52-nvmc.ads",
            "nrf52_src/nrf52832/svd/i-nrf52-rtc.ads",
            "nrf52_src/nrf52832/svd/i-nrf52-temp.ads",
        )

        self.add_gnarl_sources(
            "nrf52_src/nrf52832/svd/handler.S", "nrf52_src/nrf52832/svd/a-intnam.ads"
        )


class NRF54LApp(arm.cortexm.CortexM33F):
    @property
    def name(self):
        return "nrf54l_app"

    @property
    def parent(self):
        None

    @property
    def loaders(self):
        return ("ROM",)

    @property
    def has_fpu(self):
        return True

    @property
    def has_timer_64(self):
        return True

    @property
    def use_semihosting_io(self):
        return True

    @property
    def system_ads(self):
        return {
            "light": "system-xi-arm.ads",
            "light-tasking": "nrf54l_src/system-xi-nrf54-sfp.ads",
            "embedded": "nrf54l_src/system-xi-nrf54-full.ads",
        }

    def __init__(self):
        super(NRF54LApp, self).__init__()

        self.add_gnat_sources(
            "arm/src/breakpoint_handler-cortexm.S",
            "nrf54l_src/s-bbbopa.ads",
            "nrf54l_src/s-bbmcpa.ads",
            "nrf54l_src/setup_board.adb",
            "nrf54l_src/setup_board.ads",
            "nrf54l_src/start-rom.S",
            "nrf54l_src/svd/i-nrf54-cache.ads",
            "nrf54l_src/svd/i-nrf54-clock.ads",
            "nrf54l_src/svd/i-nrf54-ficr.ads",
            "nrf54l_src/svd/i-nrf54-glitchdet.ads",
            "nrf54l_src/svd/i-nrf54-gpio.ads",
            "nrf54l_src/svd/i-nrf54-gpiohspadctrl.ads",
            "nrf54l_src/svd/i-nrf54-grtc.ads",
            "nrf54l_src/svd/i-nrf54-kmu.ads",
            "nrf54l_src/svd/i-nrf54-oscillators.ads",
            "nrf54l_src/svd/i-nrf54-spu.ads",
            "nrf54l_src/svd/i-nrf54-tad.ads",
            "nrf54l_src/svd/i-nrf54.ads",
            "src/s-macres__cortexm3.adb",
        )

        self.add_gnarl_sources(
            "nrf54l_src/s-bbbosu.adb",
            "nrf54l_src/s-bbcppr.adb",
            "nrf54l_src/s-bbpara.ads",
            "nrf54l_src/svd/handler.S",
            "src/s-bbcppr__old.ads",
            "src/s-bbcpsp__cortexm.ads",
            "src/s-bbsumu__generic.adb",
            "src/s-bcpcst__armvXm.ads",
            "src/s-bcpcst__pendsv.adb",
        )

        # Add a-intnam.ads variants under their own subdirectories under gnarl
        devices = [
            "nRF54L05",
            "nRF54L05",
            "nRF54L10",
            "nRF54L15",
            "nRF54LM20A",
            "nRF54LM20B",
            "nRF54LS05A",
            "nRF54LS05B",
            "nRF54LV10A",
        ]

        for device in devices:
            self.add_source_alias(
                "gnarl",
                f"{device}/a-intnam.ads",
                f"nrf54l_src/svd/a-intnam__{device}.ads",
            )

        # Don't warn about RAM sections having RWX permissions. Execute
        # permissions are currently needed for the stack since the compiler
        # may emit executable trampolines on the stack in some cases
        # (e.g. pointers to nested subprograms).
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="ROM")


class Stm32F0(arm.cortexm.CortexM0CommonArchSupport):
    @property
    def name(self):
        return "stm32f0xx"

    @property
    def use_semihosting_io(self):
        return True

    @property
    def loaders(self):
        return ("ROM", "RAM")

    def __init__(self):
        super(Stm32F0, self).__init__()

        self.add_linker_script("stm32f0_src/common-RAM.ld")
        self.add_linker_script("stm32f0_src/common-ROM.ld")

        self.add_linker_script("stm32f0_src/memory-map-RAM-16-4.ld")
        self.add_linker_script("stm32f0_src/memory-map-RAM-16-6.ld")
        self.add_linker_script("stm32f0_src/memory-map-RAM-16-8.ld")
        self.add_linker_script("stm32f0_src/memory-map-RAM-32-4.ld")
        self.add_linker_script("stm32f0_src/memory-map-RAM-32-6.ld")
        self.add_linker_script("stm32f0_src/memory-map-RAM-32-8.ld")
        self.add_linker_script("stm32f0_src/memory-map-RAM-64-8.ld")
        self.add_linker_script("stm32f0_src/memory-map-RAM-64-16.ld")
        self.add_linker_script("stm32f0_src/memory-map-RAM-128-16.ld")
        self.add_linker_script("stm32f0_src/memory-map-RAM-128-32.ld")
        self.add_linker_script("stm32f0_src/memory-map-RAM-256-32.ld")

        self.add_linker_script("stm32f0_src/memory-map-ROM-16-4.ld")
        self.add_linker_script("stm32f0_src/memory-map-ROM-16-6.ld")
        self.add_linker_script("stm32f0_src/memory-map-ROM-16-8.ld")
        self.add_linker_script("stm32f0_src/memory-map-ROM-32-4.ld")
        self.add_linker_script("stm32f0_src/memory-map-ROM-32-6.ld")
        self.add_linker_script("stm32f0_src/memory-map-ROM-32-8.ld")
        self.add_linker_script("stm32f0_src/memory-map-ROM-64-8.ld")
        self.add_linker_script("stm32f0_src/memory-map-ROM-64-16.ld")
        self.add_linker_script("stm32f0_src/memory-map-ROM-128-16.ld")
        self.add_linker_script("stm32f0_src/memory-map-ROM-128-32.ld")
        self.add_linker_script("stm32f0_src/memory-map-ROM-256-32.ld")

        # We use our own version of System.BB.Parameters
        self.remove_source("s-bbpara.ads")

        # Use our own version of s-bbarat, which adds __atomic_compare_exchange_4
        self.remove_source("s-bbarat.ads")
        self.remove_source("s-bbarat.adb")

        # Common source files
        self.add_gnat_sources(
            "common_src/s-bbarat.adb",
            "common_src/s-bbarat.ads",
            "stm32f0_src/s-stm32.ads",
            "stm32f0_src/s-stm32.adb",
            "stm32f0_src/start-rom.S",
            "stm32f0_src/start-ram.S",
            "stm32f0_src/setup_pll.ads",
            "stm32f0_src/setup_pll.adb",
            "stm32f0_src/s-bbpara.ads",
            "stm32f0_src/s-bbbopa.ads",
        )

        for device in [
            "F030",
            "F031",
            "F038",
            "F042",
            "F048",
            "F051",
            "F058",
            "F070",
            "F071",
            "F072",
            "F078",
            "F091",
            "F098",
        ]:
            sub_family = device[2]
            sub_family_minor = device[3]

            if sub_family in ["3", "5"]:
                self.add_source_alias(
                    "gnat",
                    f"{device}/s-bbmcpa.ads",
                    f"stm32f0_src/s-bbmcpa-simple.ads",
                )
            else:
                self.add_source_alias(
                    "gnat",
                    f"{device}/s-bbmcpa.ads",
                    f"stm32f0_src/s-bbmcpa-full.ads",
                )

            self.add_source_alias(
                "gnat",
                f"{device}/i-stm32.ads",
                f"stm32f0_src/stm32f0x{sub_family_minor}/svd/i-stm32_{sub_family_minor}.ads",
            )
            self.add_source_alias(
                "gnat",
                f"{device}/i-stm32-rcc.ads",
                f"stm32f0_src/stm32f0x{sub_family_minor}/svd/i-stm32-rcc_{sub_family_minor}.ads",
            )
            self.add_source_alias(
                "gnat",
                f"{device}/i-stm32-flash.ads",
                f"stm32f0_src/stm32f0x{sub_family_minor}/svd/i-stm32-flash_{sub_family_minor}.ads",
            )
            self.add_source_alias(
                "gnarl",
                f"{device}/a-intnam.ads",
                f"stm32f0_src/stm32f0x{sub_family_minor}/svd/a-intnam_{sub_family_minor}.ads",
            )

        # Don't warn about RAM sections having RWX permissions. Execute
        # permissions are currently needed for the stack since the compiler
        # may emit executable trampolines on the stack in some cases
        # (e.g. pointers to nested subprograms).
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="ROM")
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="RAM")


class Stm32G0(arm.cortexm.CortexM0P):
    @property
    def name(self):
        return "stm32g0xx"

    @property
    def use_semihosting_io(self):
        return True

    @property
    def loaders(self):
        return ("ROM", "RAM")

    @property
    def system_ads(self):
        return {
            "light": "system-xi-arm.ads",
            "light-tasking": "system-xi-armv6m-sfp.ads",
            "embedded": "system-xi-armv6m-full.ads",
        }

    def __init__(self):
        super(Stm32G0, self).__init__()

        self.add_linker_script("stm32g0_src/ld/common-RAM.ld")
        self.add_linker_script("stm32g0_src/ld/common-ROM.ld")

        # Use our own version of s-bbarat, which adds __atomic_compare_exchange_4
        self.remove_source("s-bbarat.ads")
        self.remove_source("s-bbarat.adb")

        # Common source files
        self.add_gnat_sources(
            "common_src/s-bbarat.adb",
            "common_src/s-bbarat.ads",
            "stm32g0_src/start-rom.S",
            "stm32g0_src/start-ram.S",
            "stm32g0_src/setup_pll.ads",
            "stm32g0_src/setup_pll.adb",
            "stm32g0_src/s-bbpara.ads",
            "stm32g0_src/s-bbbopa.ads",
            "stm32g0_src/s-bbmcpa.ads",
            "stm32g0_src/svd/handler.S",
            "stm32g0_src/svd/i-stm32.ads",
            "stm32g0_src/svd/i-stm32-flash.ads",
            "stm32g0_src/svd/i-stm32-rcc.ads",
        )

        self.add_gnarl_sources(
            "src/s-bbbosu__armv6m.adb",
            "src/s-bcpcst__pendsv.adb",
        )

        for device in ["g0x0", "g0x1"]:
            self.add_source_alias(
                "gnarl",
                f"{device}/a-intnam.ads",
                f"stm32g0_src/svd/a-intnam-{device}.ads",
            )

        # Don't warn about RAM sections having RWX permissions. Execute
        # permissions are currently needed for the stack since the compiler
        # may emit executable trampolines on the stack in some cases
        # (e.g. pointers to nested subprograms).
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="ROM")
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="RAM")


class Stm32G4(arm.cortexm.CortexM4F):
    @property
    def name(self):
        return "stm32g4xx"

    @property
    def parent(self):
        return ArmV7MArch_Patched

    @property
    def use_semihosting_io(self):
        return True

    @property
    def loaders(self):
        return ("ROM", "RAM")

    @property
    def system_ads(self):
        return {
            "light": "system-xi-arm.ads",
            "light-tasking": "system-xi-cortexm4-sfp.ads",
            "embedded": "system-xi-cortexm4-full.ads",
        }

    def __init__(self):
        super(Stm32G4, self).__init__()

        self.add_linker_script("stm32g4_src/ld/common-RAM.ld")
        self.add_linker_script("stm32g4_src/ld/common-ROM.ld")

        # Common source files
        self.add_gnat_sources(
            "bb-runtimes/arm/stm32/start-common.S",
            "bb-runtimes/arm/stm32/start-ram.S",
            "bb-runtimes/arm/stm32/start-rom.S",
            "stm32g4_src/setup_pll.ads",
            "stm32g4_src/setup_pll.adb",
            "stm32g4_src/s-bbpara.ads",
            "stm32g4_src/s-bbbopa.ads",
            "stm32g4_src/s-bbmcpa.ads",
            "stm32g4_src/svd/handler.S",
            "stm32g4_src/svd/i-stm32.ads",
            "stm32g4_src/svd/i-stm32-flash.ads",
            "stm32g4_src/svd/i-stm32-pwr.ads",
            "stm32g4_src/svd/i-stm32-rcc.ads",
        )

        for device in [
            "G4A1",
            "G431",
            "G441",
            "G473",
            "G474",
            "G483",
            "G484",
            "G491",
        ]:
            self.add_source_alias(
                "gnarl",
                f"{device}/a-intnam.ads",
                f"stm32g4_src/svd/a-intnam-{device}.ads",
            )

        # Don't warn about RAM sections having RWX permissions. Execute
        # permissions are currently needed for the stack since the compiler
        # may emit executable trampolines on the stack in some cases
        # (e.g. pointers to nested subprograms).
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="ROM")
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="RAM")


class Stm32F4(arm.cortexm.CortexM4F):
    @property
    def name(self):
        return "stm32f4xx"

    @property
    def parent(self):
        return ArmV7MArch_Patched

    @property
    def use_semihosting_io(self):
        return True

    @property
    def loaders(self):
        return ("ROM", "RAM")

    @property
    def system_ads(self):
        return {
            "light": "system-xi-arm.ads",
            "light-tasking": "system-xi-cortexm4-sfp.ads",
            "embedded": "system-xi-cortexm4-full.ads",
        }

    def __init__(self):
        super(Stm32F4, self).__init__()

        self.add_linker_script("stm32f4_src/ld/common-RAM.ld")
        self.add_linker_script("stm32f4_src/ld/common-ROM.ld")

        # Common source files, shared by all MCU_Sub_Family variants
        self.add_gnat_sources(
            "bb-runtimes/arm/stm32/start-common.S",
            "bb-runtimes/arm/stm32/start-ram.S",
            "bb-runtimes/arm/stm32/start-rom.S",
            "stm32f4_src/setup_pll.ads",
            "stm32f4_src/setup_pll.adb",
            "stm32f4_src/s-bbpara.ads",
            "stm32f4_src/s-bbbopa.ads",
        )

        # Source files that are specific to each MCU_Sub_Family variant.
        # STM32F405/407/415/417 share the same RCC/FLASH/interrupt layout
        # (they differ only by the presence of a CRYP/HASH peripheral, which
        # this runtime doesn't touch), so "F407" and "F417" both reuse the
        # "stm32f4x7" source directory. More variants may be added here
        # later, following the same pattern as stm32f0xx/stm32g0xx/stm32g4xx.
        sub_family_dirs = {
            "F411": "stm32f411",
            "F407": "stm32f4x7",
            "F417": "stm32f4x7",
        }

        for sub_family, dir_name in sub_family_dirs.items():
            sub_family_dir = f"stm32f4_src/{dir_name}"

            self.add_source_alias(
                "gnat",
                f"{sub_family}/s-bbmcpa.ads",
                f"{sub_family_dir}/s-bbmcpa.ads",
            )
            self.add_source_alias(
                "gnat",
                f"{sub_family}/i-stm32.ads",
                f"{sub_family_dir}/svd/i-stm32.ads",
            )
            self.add_source_alias(
                "gnat",
                f"{sub_family}/i-stm32-flash.ads",
                f"{sub_family_dir}/svd/i-stm32-flash.ads",
            )
            self.add_source_alias(
                "gnat",
                f"{sub_family}/i-stm32-pwr.ads",
                f"{sub_family_dir}/svd/i-stm32-pwr.ads",
            )
            self.add_source_alias(
                "gnat",
                f"{sub_family}/i-stm32-rcc.ads",
                f"{sub_family_dir}/svd/i-stm32-rcc.ads",
            )
            self.add_source_alias(
                "gnarl",
                f"{sub_family}/a-intnam.ads",
                f"{sub_family_dir}/svd/a-intnam.ads",
            )

            # handler.S (the interrupt vector table) is compiled as part of
            # the "gnat" library, not "gnarl": Ravenscar_Build only declares
            # the "Ada" language, so an Asm_Cpp source placed under "gnarl"
            # would silently never be compiled, leaving "__vectors" undefined
            # at link time. This matches how stm32f0xx/stm32g4xx place their
            # own handler.S.
            self.add_source_alias(
                "gnat",
                f"{sub_family}/handler.S",
                f"{sub_family_dir}/svd/handler.S",
            )

        # Don't warn about RAM sections having RWX permissions. Execute
        # permissions are currently needed for the stack since the compiler
        # may emit executable trampolines on the stack in some cases
        # (e.g. pointers to nested subprograms).
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="ROM")
        self.add_linker_switch("-Wl,--no-warn-rwx-segments", loader="RAM")


def build_configs(target):
    if target == "rp2040":
        return RP2040()
    elif target == "rp2350":
        return RP2350()
    elif target == "nrf52832":
        return NRF52832()
    elif target == "nrf52833":
        return NRF52833()
    elif target == "nrf52840":
        return NRF52840()
    elif target == "nrf54l_app":
        return NRF54LApp()
    elif target == "stm32f0xx":
        return Stm32F0()
    elif target == "stm32g0xx":
        return Stm32G0()
    elif target == "stm32g4xx":
        return Stm32G4()
    elif target == "stm32f4xx":
        return Stm32F4()
    else:
        assert False, "unexpected target: %s" % target


def patch_bb_runtimes():
    """Patch some parts of bb-runtimes to use our own targets and data"""
    add_source_search_path(os.path.dirname(__file__))

    build_rts.build_configs = build_configs


if __name__ == "__main__":
    patch_bb_runtimes()
    build_rts.main()
