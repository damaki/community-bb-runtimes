import support.target_info
import pytest
from typing import List


def check_test_conditions(target_info: support.target_info.TargetInfo):
    if not target_info.is_multicore:
        pytest.skip(f"Test is only applicable for multicore runtimes")
    # Needs libgnarl for protected objects and interrupt handlers
    if not target_info.has_libgnarl:
        pytest.skip(f"Test requires a runtime with libgnarl")


def source_dirs(target_info: support.target_info.TargetInfo) -> List[str]:
    return [target_info.target]
