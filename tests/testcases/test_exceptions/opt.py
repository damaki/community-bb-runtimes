import support.target_info
import pytest


def check_test_conditions(target_info: support.target_info.TargetInfo):
    if target_info.runtime_profile != "embedded":
        pytest.skip(
            f"Test is not applicable for '{target_info.runtime_profile}' runtimes"
        )
