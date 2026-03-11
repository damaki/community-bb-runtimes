import support.target_info
import pytest
from typing import List


def check_test_conditions(target_info: support.target_info.TargetInfo):
    # Needs libgnarl for protected objects and interrupt handlers
    if not target_info.has_libgnarl:
        pytest.skip(f"Test requires a runtime with libgnarl")


def source_dirs(target_info: support.target_info.TargetInfo) -> List[str]:
    if target_info.target.startswith("nrf528"):
        return ["nrf52"]
    elif target_info.target.startswith("stm32"):
        return ["stm32"]
    else:
        return [target_info.target]
