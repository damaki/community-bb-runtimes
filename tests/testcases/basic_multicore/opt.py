import support.target_info
import pytest


def check_test_conditions(target_info: support.target_info.TargetInfo):
    if not target_info.has_libgnarl:
        pytest.skip(
            f"Test is not applicable for '{target_info.runtime_profile}' runtimes"
        )
    if not target_info.is_multicore:
        pytest.skip(f"Test is not applicable for single-core runtimes")
