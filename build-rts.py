# This script extends bb-runtimes to define custom targets

import sys
import os
import pathlib

# Add bb-runtimes to the search path so that we can include and extend it
sys.path.append(str(pathlib.Path(__file__).parent / "bb-runtimes"))

import arm.cortexm
import build_rts
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
        )

        # s-maxres__cortexm3.adb is also compatible with Cortex-M0+
        self.add_gnat_sources("src/s-macres__cortexm3.adb")

        # Common GNARL sources
        self.add_gnarl_sources("rp2040_src/s-bbpara.ads")

        self.add_gnarl_sources(
            "rp2040_src/a-intnam-1.ads",
            "rp2040_src/a-intnam-2.ads",
            "rp2040_src/s-bbbosu.adb",
            "rp2040_src/s-bbpara.ads",
            "rp2040_src/s-bbsumu.adb",
            "rp2040_src/s-bcpcst.adb",
            "src/s-bbcppr__armv7m.adb",
            "src/s-bbcppr__old.ads",
            "src/s-bbcpsp__cortexm.ads",
            "src/s-bcpcst__armvXm.ads",
        )


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
            "rp2350_src/a-intnam-1.ads",
            "rp2350_src/a-intnam-2.ads",
            "rp2350_src/s-bbbosu.adb",
            "rp2350_src/s-bbpara.ads",
            "rp2350_src/s-bbsumu.adb",
            "rp2350_src/s-bcpcst.adb",
            "src/s-bbcppr__armv7m.adb",
            "src/s-bbcppr__old.ads",
            "src/s-bbcpsp__cortexm.ads",
            "src/s-bcpcst__armvXm.ads",
        )

class NRF52(arm.cortexm.ArmV7MTarget):
    @property
    def name(self):
        return 'nRF52'

    @property
    def parent(self):
        return arm.cortexm.CortexMArch

    @property
    def loaders(self):
        return ('ROM', )

    @property
    def has_fpu(self):
        return True

    @property
    def system_ads(self):
        # Use custom System package since system-xi-cortexm4 assumes
        # 4-bit interrupt priorities, but the nRF52 only supports
        # 3-bit interrupt priorities. This requires different
        # definitions for Priority and Interrupt_Priority in System.
        return {'light': 'system-xi-arm.ads',
                'light-tasking': 'nrf52_src/system-xi-nrf52-sfp.ads',
                'embedded': 'nrf52_src/system-xi-nrf52-full.ads'}

    @property
    def compiler_switches(self):
        # The required compiler switches
        return ('-mlittle-endian', '-mthumb', '-mfloat-abi=hard',
                '-mfpu=fpv4-sp-d16', '-mcpu=cortex-m4')

    def __init__(self):
        super(NRF52, self).__init__()

        self.add_linker_script('nrf52_src/common-ROM.ld', loader='ROM')
        self.add_linker_script('nrf52_src/memory-map_%s.ld' % self.name,
                               'memory-map.ld')

        self.add_gnat_sources(
            "nrf52_src/s-bbbopa.ads",
            'nrf52_src/s-bbmcpa.ads',
            'nrf52_src/start-common.S',
            'nrf52_src/start-rom.S',
            'nrf52_src/setup_board.ads')

        self.add_gnarl_sources(
            'nrf52_src/s-bbpara.ads',
            'nrf52_src/s-bbbosu.adb',
            'src/s-bcpcst__pendsv.adb')


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
            "nrf52_src/nrf52833/svd/interfaces-nrf52.ads",
            "nrf52_src/nrf52833/svd/interfaces-nrf52-clock.ads",
            "nrf52_src/nrf52833/svd/interfaces-nrf52-ficr.ads",
            "nrf52_src/nrf52833/svd/interfaces-nrf52-gpio.ads",
            "nrf52_src/nrf52833/svd/interfaces-nrf52-uicr.ads",
            "nrf52_src/nrf52833/svd/interfaces-nrf52-nvmc.ads",
            "nrf52_src/nrf52833/svd/interfaces-nrf52-rtc.ads",
            "nrf52_src/nrf52833/svd/interfaces-nrf52-uart.ads",
            "nrf52_src/nrf52833/svd/interfaces-nrf52-temp.ads",
            "nrf52_src/nrf52833/svd/interfaces-nrf52-approtect.ads",
        )

        # ravenscar support
        self.add_gnarl_sources(
            "nrf52_src/nrf52833/svd/handler.S",
            "nrf52_src/nrf52833/svd/a-intnam.ads",
        )


class NRF52840(NRF52):
    @property
    def name(self):
        return 'nrf52840'

    @property
    def use_semihosting_io(self):
        return True

    def __init__(self):
        super(NRF52840, self).__init__()

        self.add_gnat_sources(
            'nrf52_src/nrf52840/setup_board.adb',
            'nrf52_src/nrf52840/svd/interfaces-nrf52.ads',
            'nrf52_src/nrf52840/svd/interfaces-nrf52-ccm.ads',
            'nrf52_src/nrf52840/svd/interfaces-nrf52-clock.ads',
            'nrf52_src/nrf52840/svd/interfaces-nrf52-ficr.ads',
            'nrf52_src/nrf52840/svd/interfaces-nrf52-gpio.ads',
            'nrf52_src/nrf52840/svd/interfaces-nrf52-uicr.ads',
            'nrf52_src/nrf52840/svd/interfaces-nrf52-nvmc.ads',
            'nrf52_src/nrf52840/svd/interfaces-nrf52-rtc.ads',
            'nrf52_src/nrf52840/svd/interfaces-nrf52-temp.ads')
        self.add_gnarl_sources(
            'nrf52_src/nrf52840/svd/handler.S',
            'nrf52_src/nrf52840/svd/a-intnam.ads')


class NRF52832(NRF52):
    @property
    def name(self):
        return 'nrf52832'

    @property
    def use_semihosting_io(self):
        return True

    def __init__(self):
        super(NRF52832, self).__init__()

        self.add_gnat_sources(
            'nrf52_src/nrf52832/setup_board.adb',
            'nrf52_src/nrf52832/svd/interfaces-nrf52.ads',
            'nrf52_src/nrf52832/svd/interfaces-nrf52-clock.ads',
            'nrf52_src/nrf52832/svd/interfaces-nrf52-ficr.ads',
            'nrf52_src/nrf52832/svd/interfaces-nrf52-gpio.ads',
            'nrf52_src/nrf52832/svd/interfaces-nrf52-uicr.ads',
            'nrf52_src/nrf52832/svd/interfaces-nrf52-nvmc.ads',
            'nrf52_src/nrf52832/svd/interfaces-nrf52-rtc.ads',
            'nrf52_src/nrf52832/svd/interfaces-nrf52-temp.ads')

        self.add_gnarl_sources(
            'nrf52_src/nrf52832/svd/handler.S',
            'nrf52_src/nrf52832/svd/a-intnam.ads')


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

        # Common source files
        self.add_gnat_sources(
            "stm32f0_src/s-stm32.ads",
            "stm32f0_src/s-stm32.adb",
            "stm32f0_src/start-rom.S",
            "stm32f0_src/start-ram.S",
            "stm32f0_src/setup_pll.ads",
            "stm32f0_src/setup_pll.adb",
            "stm32f0_src/s-bbpara.ads",
            "stm32f0_src/s-bbbopa.ads",
            "stm32f0_src/s-bbmcpa-full.ads",
            "stm32f0_src/s-bbmcpa-simple.ads",
            "stm32f0_src/stm32f0x0/svd/interfaces-stm32_0.ads",
            "stm32f0_src/stm32f0x1/svd/interfaces-stm32_1.ads",
            "stm32f0_src/stm32f0x2/svd/interfaces-stm32_2.ads",
            "stm32f0_src/stm32f0x8/svd/interfaces-stm32_8.ads",
            "stm32f0_src/stm32f0x0/svd/interfaces-stm32-flash_0.ads",
            "stm32f0_src/stm32f0x1/svd/interfaces-stm32-flash_1.ads",
            "stm32f0_src/stm32f0x2/svd/interfaces-stm32-flash_2.ads",
            "stm32f0_src/stm32f0x8/svd/interfaces-stm32-flash_8.ads",
            "stm32f0_src/stm32f0x0/svd/interfaces-stm32-rcc_0.ads",
            "stm32f0_src/stm32f0x1/svd/interfaces-stm32-rcc_1.ads",
            "stm32f0_src/stm32f0x2/svd/interfaces-stm32-rcc_2.ads",
            "stm32f0_src/stm32f0x8/svd/interfaces-stm32-rcc_8.ads",
        )

        # Choose interrupt names based on family
        self.add_gnarl_sources(
            "stm32f0_src/stm32f0x0/svd/a-intnam_0.ads",
            "stm32f0_src/stm32f0x1/svd/a-intnam_1.ads",
            "stm32f0_src/stm32f0x2/svd/a-intnam_2.ads",
            "stm32f0_src/stm32f0x8/svd/a-intnam_8.ads",
        )


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

        # Common source files
        self.add_gnat_sources(
            "stm32g0_src/start-rom.S",
            "stm32g0_src/start-ram.S",
            "stm32g0_src/setup_pll.ads",
            "stm32g0_src/setup_pll.adb",
            "stm32g0_src/s-bbpara.ads",
            "stm32g0_src/s-bbbopa.ads",
            "stm32g0_src/s-bbmcpa.ads",
            "stm32g0_src/svd/handler.S",
            "stm32g0_src/svd/interfaces-stm32.ads",
            "stm32g0_src/svd/interfaces-stm32-flash.ads",
            "stm32g0_src/svd/interfaces-stm32-rcc.ads",
        )

        self.add_gnarl_sources(
            "src/s-bbbosu__armv6m.adb",
            "src/s-bcpcst__pendsv.adb",
            "stm32g0_src/svd/a-intnam-g0x0.ads",
            "stm32g0_src/svd/a-intnam-g0x1.ads",
        )


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
            "stm32g4_src/svd/interfaces-stm32.ads",
            "stm32g4_src/svd/interfaces-stm32-flash.ads",
            "stm32g4_src/svd/interfaces-stm32-pwr.ads",
            "stm32g4_src/svd/interfaces-stm32-rcc.ads",
        )

        self.add_gnarl_sources(
            "stm32g4_src/svd/a-intnam-G4A1.ads",
            "stm32g4_src/svd/a-intnam-G431.ads",
            "stm32g4_src/svd/a-intnam-G441.ads",
            "stm32g4_src/svd/a-intnam-G473.ads",
            "stm32g4_src/svd/a-intnam-G474.ads",
            "stm32g4_src/svd/a-intnam-G483.ads",
            "stm32g4_src/svd/a-intnam-G484.ads",
            "stm32g4_src/svd/a-intnam-G491.ads",
        )


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
    elif target == "stm32f0xx":
        return Stm32F0()
    elif target == "stm32g0xx":
        return Stm32G0()
    elif target == "stm32g4xx":
        return Stm32G4()
    else:
        assert False, "unexpected target: %s" % target

def patch_bb_runtimes():
    """Patch some parts of bb-runtimes to use our own targets and data"""
    add_source_search_path(os.path.dirname(__file__))

    build_rts.build_configs = build_configs

if __name__ == "__main__":
    patch_bb_runtimes()
    build_rts.main()