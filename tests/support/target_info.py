import copy
import pathlib
import tomllib
import re
from typing import Dict, Tuple, Any


def split_runtime_crate_name(runtime_crate_dir: pathlib.Path) -> Tuple[str, str]:
    """Split the name of a runtime crate into its profile and target name components"""
    m = re.match(
        r"(light_tasking|light|embedded)_(\w+)",
        runtime_crate_dir.name.replace("-", "_"),
    )
    return m.group(1), m.group(2)


def get_target_name(runtime_crate_dir: pathlib.Path) -> str:
    """Get the name of the target from the runtime crate's name"""
    return split_runtime_crate_name(runtime_crate_dir)[1]


def get_runtime_profile(runtime_crate_dir: pathlib.Path) -> str:
    """Get the runtime profile from the runtime crate's name"""
    return split_runtime_crate_name(runtime_crate_dir)[0]


def get_config_vars(runtime_crate_dir: pathlib.Path) -> Dict[str, Dict[str, Any]]:
    """Load the configuration.variables part of a runtime's Alire manifest"""
    with open(runtime_crate_dir / "alire.toml", "rb") as f:
        manifest = tomllib.load(f)

    if "configuration" in manifest and "variables" in manifest["configuration"]:
        return manifest["configuration"]["variables"]

    return {}


def get_config_values(
    config_vars: Dict, updated_values: Dict[str, str]
) -> Dict[str, Any]:
    """Gets the set of configuration.values to apply in the test crate's Alire manifest"""
    return {
        var_name: (
            updated_values[var_name]
            if var_name in updated_values
            else var_info["default"]
        )
        for var_name, var_info in config_vars.items()
    }


class TargetInfo:
    """Provides information about a specific runtime crate"""

    def __init__(
        self, runtime_crate_dir: pathlib.Path, overridden_config_values: Dict[str, str]
    ):
        self._runtime_crate_dir = runtime_crate_dir
        self._configuration_variables = get_config_vars(runtime_crate_dir)
        self._configuration_values = get_config_values(
            self._configuration_variables, overridden_config_values
        )

    @property
    def runtime_crate_dir(self) -> pathlib.Path:
        """Get the path to the runtime crate"""
        return self._runtime_crate_dir

    @property
    def runtime_crate_name(self) -> str:
        """Get the name of the runtime crate, e.g. light_tasking_rp2040"""
        return self._runtime_crate_dir.name.replace("-", "_")

    @property
    def runtime_profile(self) -> str:
        """Get the runtime profile of the runtime crate, e.g. light_tasking"""
        return get_runtime_profile(self._runtime_crate_dir)

    @property
    def configuration_variables(self) -> Dict[str, Dict[str, Any]]:
        """Get the configuration.variables from the runtime crate's Alire manifest"""
        return self._configuration_variables

    @property
    def configuration_values(self) -> Dict[str, Any]:
        """Get the configuration.values to apply in the test crate's Alire manifest"""
        return self._configuration_values

    @property
    def target(self) -> str:
        """Get the name of the target, e.g. rp2040"""
        return get_target_name(self._runtime_crate_dir)

    @property
    def requires_linker_switches(self) -> bool:
        """Returns True if the runtime requires linker switches to be set in
        the GPR file.
        """
        return self.target in [
            "stm32g4xx",
            "stm32g0xx",
            "stm32f0xx",
            "rp2040",
            "rp2350",
        ]

    @property
    def has_libgnarl(self) -> bool:
        """Returns True if the runtime provides libgnarl"""
        return self.runtime_profile in ["light_tasking", "embedded"]

    @property
    def is_multicore(self) -> bool:
        """Returns True if the runtime supports multicore tasking"""
        return (
            self.target in ["rp2040", "rp2350"]
            and self.has_libgnarl
            and int(self.configuration_values["Max_CPUs"]) > 1
        )
