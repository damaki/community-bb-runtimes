import support.target_info
import pytest
import pathlib


def check_test_conditions(target_info: support.target_info.TargetInfo):
    if target_info.target != "rp2040":
        pytest.skip(f"Test requires target 'rp2040'")


def external_crates(target_info: support.target_info.TargetInfo):
    return {"rp2040_hal": "=2.7.0", "pico_bsp": "=2.2.0"}


def crate_config_values(target_info: support.target_info.TargetInfo):
    if target_info.runtime_profile == "light":
        return {"rp2040_hal.Use_Startup": False}
    else:
        return {"rp2040_hal.Interrupts": "bb_runtimes", "rp2040_hal.Use_Startup": False}
