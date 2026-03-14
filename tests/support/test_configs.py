import itertools
import pathlib
import re
from typing import Dict, List, Tuple

# Table with additional runtime crate configuration values to use for testing.
#
# The "configuration.values" gives a list of one or more configurations to test
# with. The configurations are only applied to runtimes that are listed in
# "targets" and "profiles".
additional_test_configs = [
    {  # Test nRF52 targets with different RTCs as the time base
        "targets": ["nrf52832", "nrf52833", "nrf52840"],
        "profiles": ["light_tasking", "embedded"],
        "configuration.values": [
            {"Time_Base": "RTC1"},
            {"Time_Base": "RTC0"},
        ],
    },
    {  # Test nRF52 targets with RC as the LFCLK_Src
        "targets": ["nrf52832", "nrf52833", "nrf52840"],
        "profiles": ["light", "light_tasking", "embedded"],
        "configuration.values": [{"LFCLK_Src": "RC"}],
    },
    {  # Test RP2040 and RP2350 targets in a single-core configuration
        "targets": ["rp2040", "rp2350"],
        "profiles": ["light_tasking", "embedded"],
        "configuration.values": [{"Max_CPUs": 1}],
    },
    {  # Test building with all devices in the nRF54L family
        "targets": ["nrf54l"],
        "profiles": ["light", "light_tasking", "embedded"],
        "configuration.values": [
            {"Device": "nRF54L05"},
            {"Device": "nRF54L10"},
            {"Device": "nRF54L15"},
            {"Device": "nRF54LM20A"},
            {"Device": "nRF54LM20B"},
            {"Device": "nRF54LS05A"},
            {"Device": "nRF54LS05B"},
            {"Device": "nRF54LV10A"},
        ],
    },
    {  # Test a different GRTC configuration on the nRF54L
        "targets": ["nrf54l"],
        "profiles": ["light_tasking", "embedded"],
        "configuration.values": [
            {"Time_Base_GRTC_IRQ": 1},
            {"Time_Base_GRTC_CCn": 5},
        ],
    },
]

REPO_ROOT_DIR = pathlib.Path(__file__).absolute().parent.parent.parent
RUNTIMES_INSTALL_DIR = REPO_ROOT_DIR / "install"
TESTCASES_DIR = REPO_ROOT_DIR / "tests" / "testcases"


def generate_tests() -> List[Tuple[str, str, Dict[str, str]]]:
    """Generate a list of test configurations to use

    :return: A list of test cases. Each test case is a tuple consisting of:
      [0] the path to the test case directory
      [1] the path to the runtime crate directory
      [2] a dictionary of crate configuration variables to override for the test
    """
    configs = []

    if not RUNTIMES_INSTALL_DIR.exists():
        return []

    runtime_dirs = list(RUNTIMES_INSTALL_DIR.iterdir())
    testcase_dirs = list(TESTCASES_DIR.iterdir())

    # Create a config entry for each combination of testcase and runtime
    # using the runtime's default crate configuration

    configs = [
        (testcase_dir, runtime_dir, {})
        for testcase_dir, runtime_dir in itertools.product(testcase_dirs, runtime_dirs)
    ]

    # Also add additional combinations with non-default runtime crate
    # configuration values

    for runtime_dir in runtime_dirs:
        m = re.match(
            r"(light_tasking|light|embedded)_(\w+)", runtime_dir.name.replace("-", "_")
        )

        if m:
            profile = m.group(1)
            target = m.group(2)

            for atc in additional_test_configs:
                if target in atc["targets"] and profile in atc["profiles"]:
                    for testcase_dir in testcase_dirs:
                        for config_vals in atc["configuration.values"]:
                            configs.append((testcase_dir, runtime_dir, config_vals))

    return configs
