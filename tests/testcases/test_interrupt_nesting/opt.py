import support.target_info
import pytest
from typing import List


def check_test_conditions(target_info: support.target_info.TargetInfo):
    # Cortex-M0 runtimes only provide one interrupt priority level
    if target_info.target in ["rp2040", "stm32f0xx", "stm32g0xx"]:
        pytest.skip(
            f"Test not supported on target '{target_info.target}'"
            " (requires multiple interrupt priority levels)"
        )
    # Needs libgnarl for protected objects and interrupt handlers
    if not target_info.has_libgnarl:
        pytest.skip(f"Test requires a runtime with libgnarl")


def source_dirs(target_info: support.target_info.TargetInfo) -> List[str]:
    if target_info.target in ["nrf52832", "nrf52833", "nrf52840"]:
        return ["nrf52"]
    else:
        return [target_info.target]
