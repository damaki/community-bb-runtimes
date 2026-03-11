import support.target_info
import pytest
from typing import List


def check_test_conditions(target_info: support.target_info.TargetInfo):
    if not target_info.is_multicore:
        pytest.skip(f"Test is only applicable for multicore runtimes")
