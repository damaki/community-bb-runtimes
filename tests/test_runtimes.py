import conftest
import itertools
import os
import pathlib
import pytest
import re
import shutil
import tempfile
import support.test_configs
from support.harnesses import TestHarness
from support.target_info import TargetInfo
from support.target_interface import JLinkInterface
from typing import List, Dict, Tuple, Optional


def get_test_id(config: Tuple[str, str, Dict[str, str]]) -> str:
    """Turn a test configuration into an ID string for pytest.mark.parametrize"""
    testcase_dir = config[0]
    runtime_dir = config[1]
    crate_config_values = config[2]

    config_strs = "_".join(f"{k}={v}" for k, v in crate_config_values.items())

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
    working_dir: Optional[str],
    keep_build_files: bool,
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

    if working_dir is not None:
        os.makedirs(working_dir, exist_ok=True)

    with tempfile.TemporaryDirectory(
        prefix=request.node.callspec.id,
        dir=working_dir,
        delete=working_dir is None or not keep_build_files,
    ) as tmpdir:
        tc = TestHarness(
            testcase_dir=testcase_dir,
            working_dir=pathlib.Path(tmpdir),
            target_info=target_info,
        )

        tc.check_test_conditions()
        tc.setup()
        p = tc.build()
        assert p.returncode == 0, "Build failed"


@pytest.mark.parametrize(
    "testcase_dir,runtime_dir,crate_config_values",
    TEST_CONFIGS,
    ids=[get_test_id(config) for config in TEST_CONFIGS],
)
def test_execute_on_target(
    request: pytest.FixtureRequest,
    testcase_dir: str,
    runtime_dir: str,
    crate_config_values: Dict[str, str],
    target_board,
    target_if,
    gdbserver_port,
    text_io_port,
    working_dir: Optional[str],
    keep_build_files: bool,
):
    """
    Test that a test case program runs correctly on the target hardware

    This test is skipped if no --target-board was specified when calling pytest

    This test is also skipped for configurations where the runtime is
    incompatible with the --target-board. For example, programs built with the
    light_nrf52840 runtime cannot be executed on the rp2040 target board.

    :param testcase_dir: The directory containing the test case sources.
    :param runtime_dir: The directory containing the runtime to use.
    :param crate_config_values: Contains any crate configuration variable
        overrides to use for the test.
    :param target_board: The value of --target-board
    :param gdbserver_port: The value of --gdbserver-port
    :param text_io_port: The value of --text-io-port
    """
    if target_board is None:
        pytest.skip("No --target-board was specified")

    target_info = TargetInfo(
        runtime_crate_dir=runtime_dir,
        overridden_config_values=crate_config_values,
    )

    if target_board != target_info.target:
        pytest.skip(
            f"Runtime '{target_info.runtime_crate_name}' is incompatible with "
            f"target '{target_board}'"
        )

    if working_dir is not None:
        os.makedirs(working_dir, exist_ok=True)

    with tempfile.TemporaryDirectory(
        prefix=request.node.callspec.id,
        dir=working_dir,
        delete=working_dir is None or not keep_build_files,
    ) as tmpdir:
        tc = TestHarness(
            testcase_dir=testcase_dir,
            working_dir=pathlib.Path(tmpdir),
            target_info=target_info,
        )

        tc.check_test_conditions()
        tc.setup()
        p = tc.build()
        assert p.returncode == 0, "Build failed"

        # Load the executable onto the target, run it, and check its output

        driver = support.target_interface.driver_classes[target_if]

        with driver(
            runtime_crate_dir=target_info.runtime_crate_dir,
            executable_file=tc.executable_path,
            gdbserver_port=gdbserver_port,
            terminal_io_port=text_io_port,
        ) as target_if:
            target_if.load()
            target_if.reset()
            target_if.read_io(timeout=0.0)  # Clear input buffer
            target_if.run()

            # Keep reading output until the TEST COMPLETE marker is found

            test_complete_marker = bytes("===TEST COMPLETE===", "ascii")
            actual_output = target_if.read_io_until(test_complete_marker).decode('ascii')

            with open(testcase_dir / "test.out", "rb") as f:
                expected_output = f.read().decode('ascii')

            assert actual_output == expected_output
