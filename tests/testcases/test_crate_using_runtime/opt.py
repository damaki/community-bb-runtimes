import support.target_info
import pytest
import pathlib


def check_test_conditions(target_info: support.target_info.TargetInfo):
    if not target_info.has_libgnarl:
        pytest.skip(
            f"Test is not applicable for '{target_info.runtime_profile}' runtimes"
        )

def local_crates(target_info: support.target_info.TargetInfo):
    return [pathlib.Path(__file__).parent / "a_crate"]