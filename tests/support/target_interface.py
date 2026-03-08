import pathlib
import os
import pygdbmi.gdbcontroller
import select
import shutil
import socket
import subprocess
import time
from typing import Optional


def find_in_alire_env(crate_dir: pathlib.Path, executable_name: str) -> Optional[str]:
    """
    Find an executable in the alire environment

    :param crate_dir: Path to the Alire crate whose environment is searched
    :param executable_name: Name of the executable to find in the alr environment

    :return: Path to the executable, if one was found
    """

    # Get the environment from Alire
    p = subprocess.run(
        ["alr", "printenv", "--unix"],
        capture_output=True,
        text=True,
        check=True,
        cwd=crate_dir,
    )

    # Update a copy of the current environment with Alire's variables
    alr_env = os.environ.copy()
    for line in p.stdout.splitlines():
        if line.startswith("export "):
            # Line format is: export KEY="VALUE"
            content = line.replace("export ", "", 1)
            key, value = content.split("=", 1)
            alr_env[key] = value.strip('"')

    # Use shutil.which with the Alire-specific PATH
    return shutil.which(executable_name, path=alr_env.get("PATH"))


def find_gdb(crate_dir: pathlib.Path, target_triplet: str) -> pathlib.Path:
    """Find GDB in the Alire path for the specified crate"""
    path = find_in_alire_env(crate_dir, f"{target_triplet}-gdb")
    return None if path is None else pathlib.Path(path)


class GdbInterface:
    """Provides operations to interact with GDB"""

    def __init__(self, gdb_path: pathlib.Path, gdbserver_port: int):
        """
        Set up the GdbInterface

        :param gdb_path: Path to the GDB executable to use
        :param gdbserver_port: The port number to use to connect to the local
            GDB server
        """

        self.gdb = pygdbmi.gdbcontroller.GdbController(
            [str(gdb_path), "--interpreter=mi2"]
        )
        self.gdb.write(f"target remote :{gdbserver_port}")

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, exc_traceback):
        self.gdb.exit()

    def load(self, executable: pathlib.Path):
        """Load an executable to the target"""
        self.gdb.write(f"load {executable.absolute()}", timeout_sec=5)

    def reset(self):
        """Reset the target"""
        self.gdb.write("monitor reset", timeout_sec=5)

    def run(self):
        """Run the program"""
        self.gdb.write("continue")


class JLinkInterface(GdbInterface):
    def __init__(
        self,
        runtime_crate_dir: pathlib.Path,
        gdbserver_port: int,
        terminal_io_port: int,
    ):
        gdb_path = find_gdb(runtime_crate_dir, "arm-eabi")

        if gdb_path is None:
            raise FileNotFoundError(
                f"Failed to find GDB in Alire environment for {runtime_crate_dir.name}"
            )

        super(JLinkInterface, self).__init__(
            gdb_path=find_gdb(runtime_crate_dir, "arm-eabi"),
            gdbserver_port=gdbserver_port,
        )
        self.gdb.write("monitor semihosting enable")

        self.terminal_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.terminal_socket.connect(("localhost", terminal_io_port))
        self.terminal_socket.setblocking(False)

    def __exit__(self, exc_type, exc_value, exc_traceback):
        super(JLinkInterface, self).__exit__(exc_type, exc_value, exc_traceback)
        self.terminal_socket.close()

    def reset(self):
        # The reset seems to be more reliable with two reset commands
        super(JLinkInterface, self).reset()
        super(JLinkInterface, self).reset()

    def read_io(self, timeout=5.0):
        """Read semihosting data from the target"""
        ready = select.select([self.terminal_socket], [], [], timeout)
        if ready[0]:
            return self.terminal_socket.recv(4096)
        else:
            return bytes()

    def read_io_until(self, end_marker: bytes, timeout: float = 5.0):
        """Read semihosting data from the target until end_marker is seen.

        Any data received after the end_marker is discarded.

        :param end_marker: Stop reading data when this sequence of bytes is received
        :param timeout: Timeout for the read
        :return: The received bytes up to (and including) the end_marker
        """
        now = time.time()
        deadline = now + timeout

        output = bytes()
        while not output.endswith(end_marker) and now <= deadline:
            output += self.read_io(timeout=deadline - now)
            now = time.time()

            # Discard anything after the test complete marker

            before, sep, after = output.partition(end_marker)
            output = before + sep

        return output
