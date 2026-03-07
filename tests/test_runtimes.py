import itertools
import pathlib
import pytest
import re
import shutil
import tempfile
import support.test_configs
from support.harnesses import TestHarness
from support.target_info import TargetInfo
from typing import List, Dict, Tuple


def get_test_id(config: Tuple[str, str, Dict[str, str]]) -> str:
    """Turn a test configuration into an ID string for pytest.mark.parametrize"""
    testcase_dir = config[0]
    runtime_dir = config[1]
    crate_config_values = config[2]

    config_strs = "_".join(f"{k}={v}" for k,v in crate_config_values.items())

    return f"{testcase_dir.name}_{runtime_dir.name}_{config_strs}"


TEST_CONFIGS = support.test_configs.generate_tests()


@pytest.mark.parametrize(
    "testcase_dir,runtime_dir,crate_config_values",
    TEST_CONFIGS,
    ids=[get_test_id(config) for config in TEST_CONFIGS],
)
def test_build(
    request: pytest.FixtureRequest,
    testcase_dir: str,
    runtime_dir: str,
    crate_config_values: Dict[str, str],
):
    """
    Tests that each test application can be successfully compiled and linked
    against each runtime.

    :param testcase_dir: The directory containing the test case sources.
    :param runtime_dir: The directory containing the runtime to use.
    :param crate_config_values: Contains any crate configuration variable
        overrides to use for the test.
    """
    target_info = TargetInfo(
        runtime_crate_dir=runtime_dir,
        overridden_config_values=crate_config_values,
    )

    with tempfile.TemporaryDirectory() as tmpdir:
        tc = TestHarness(
            testcase_dir=testcase_dir,
            working_dir=pathlib.Path(tmpdir),
            target_info=target_info,
        )

        tc.setup()
        p = tc.build()
        assert p.returncode == 0, "Build failed"
