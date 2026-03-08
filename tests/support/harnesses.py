import pathlib
import re
import shutil
import subprocess
from typing import Dict

import support.target_info


class TestHarness:
    __test__ = False

    def __init__(
        self,
        testcase_dir: pathlib.Path,
        working_dir: pathlib.Path,
        target_info: support.target_info.TargetInfo,
    ):
        self.testcase_name = testcase_dir.name

        self._target_info = target_info

        self._testcase_sources_dir = testcase_dir
        self._testcase_working_dir = working_dir
        self._testcase_working_dir.mkdir(parents=True, exist_ok=True)

    def build(self):
        """Invoke alr build on the test case"""
        return subprocess.run(args=["alr", "build"], cwd=self._testcase_working_dir)

    def setup(self):
        """Setup the test harness"""
        self._generate_gpr()
        self._generate_alire_manifest()

    @property
    def executable_path(self) -> pathlib.Path:
        """Get the path to the executable that is built by the test harness"""
        return self._testcase_working_dir / "obj" / "test"

    def _generate_gpr(self):
        """Generate a test.gpr file in the harness's working directory"""
        with open(self._testcase_working_dir / "test.gpr", "w") as f:
            linker_switches = """
   package Linker is
      for Switches ("Ada") use Runtime_Build.Linker_Switches;
   end Linker;
"""

            f.write(
                f"""
with "runtime_build.gpr";
{"with \"ravenscar_build.gpr\";" if self._target_info.has_libgnarl else ""}
project Test is
    for Source_Dirs use ("{self._testcase_sources_dir.absolute()}");
    for Object_Dir use "obj";
    for Create_Missing_Dirs use "True";
    for Main use ("test.adb");

    for Target use Runtime_Build'Target;
    for Runtime ("Ada") use Runtime_Build'Runtime ("Ada");
{linker_switches if self._target_info.requires_linker_switches else ""}
end Test;
"""
            )

    def _generate_alire_manifest(self):
        """Generate an alire.toml file in the harness's working directory"""

        def config_var_string(var_name, value) -> str:
            key = f"{self._target_info.runtime_crate_name}.{var_name}"

            if type(value) == str:
                escaped_value = f'"{value}"'
            elif type(value) == bool:
                escaped_value = str(value).lower()
            else:
                escaped_value = value

            res = f"{key} = {escaped_value}"
            return res

        def escaped_runtime_crate_path():
            path = self._target_info.runtime_crate_dir.absolute()
            return str(path).replace('\\', '\\\\')

        with open(self._testcase_working_dir / "alire.toml", "w") as f:
            f.write(
                f"""
name = "test"
description = "Testcase crate"
version = "0.1.0-dev"

[[depends-on]]
{self._target_info.runtime_crate_name} = "*"

[[pins]]
{self._target_info.runtime_crate_name} = {{ path = "{escaped_runtime_crate_path()}" }}

[configuration.values]
{"\n".join(config_var_string(k,v) for k,v in self._target_info.configuration_values.items())}
"""
            )
