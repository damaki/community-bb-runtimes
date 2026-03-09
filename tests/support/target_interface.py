import os
import pathlib
import pygdbmi.constants
import pygdbmi.gdbcontroller
import select
import shutil
import signal
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


class GdbTargetInterface:
    """
    Interfaces with the target via GDB

    This starts a GDB instance using the GDB executable obtained from the
    runtime crate's Alire environment, then connects it to an already-running
    GDB server that is listening on the specified gdbserver_port.

    Text output from the program running on the target is optionally read from
    a socket whose port is given by terminal_io_port.
    """

    def __init__(
        self,
        runtime_crate_dir: pathlib.Path,
        executable_file: pathlib.Path,
        gdbserver_port: int,
        terminal_io_port: Optional[int],
    ):
        """
        Set up the GdbTargetInterface

        :param runtime_crate_dir: Path to the runtime crate
        :param executable_file: Path to the executable to load and run
        :param gdbserver_port: The port number to use to connect to the local
            GDB server
        :param terminal_io_port: The port number to connect to optionally read
            text output from the target program.
        """
        self.terminal_io_port = terminal_io_port

        gdb_path = find_gdb(runtime_crate_dir, "arm-eabi")

        if gdb_path is None:
            raise FileNotFoundError(
                f"Failed to find GDB in Alire environment for {runtime_crate_dir.name}"
            )

        self.gdb = pygdbmi.gdbcontroller.GdbController(
            [str(gdb_path), "--interpreter=mi2", str(executable_file.absolute())]
        )

        # Clear any opening messages sent by GDB
        self.gdb.get_gdb_response(raise_error_on_timeout=False)

        # Connect to the GDB server
        self._write(
            f"-target-select extended-remote :{gdbserver_port}", read_response=False
        )
        self._wait_for_result(timeout_sec=5.0)

        self.enable_semihosting()

        if terminal_io_port is None:
            self.terminal_socket = None
        else:
            self.terminal_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.terminal_socket.connect(("localhost", terminal_io_port))
            self.terminal_socket.setblocking(False)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, exc_traceback):
        self.shutdown()

    def shutdown(self):
        """Gracefully shut down the GDB session"""
        if self.terminal_socket is not None:
            self.terminal_socket.close()
        self.gdb.exit()

    def load(self):
        """Load the executable onto the target"""
        res = self._write(f"-target-download", read_response=False)
        self._wait_for_result(timeout_sec=10.0)

    def run(self):
        """Run the program"""
        self._write("-exec-continue")

    def interrupt(self):
        """Send SIGINT to interrupt GDB"""
        self.gdb.gdb_process.send_signal(signal.SIGINT)

    def monitor_command(
        self, cmd: str, timeout_sec=pygdbmi.constants.DEFAULT_GDB_TIMEOUT_SEC
    ):
        """Send a command to the remote monitor"""
        self._write(f'-interpreter-exec console "monitor {cmd}"', read_response=False)
        self._wait_for_result()

    def read_io(self, timeout=5.0):
        """Read semihosting data from the target"""
        if self.terminal_socket is None:
            return bytes()

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

    def _write(
        self,
        cmd: str,
        timeout_sec: float = pygdbmi.constants.DEFAULT_GDB_TIMEOUT_SEC,
        read_response=True,
    ):
        """Send a command to GDB"""
        return self.gdb.write(cmd, timeout_sec=timeout_sec, read_response=read_response)

    def _wait_for_result(
        self,
        timeout_sec: float = pygdbmi.constants.DEFAULT_GDB_TIMEOUT_SEC,
    ):
        """Wait for a response from GDB which has the 'result' type"""
        now = time.time()
        deadline = now + timeout_sec

        while now <= deadline:
            responses = self.gdb.get_gdb_response(
                timeout_sec=deadline - now, raise_error_on_timeout=False
            )

            now = time.time()

            for r in responses:
                print(f"Got response: {r}")

            for r in responses:
                if r["type"] == "result":
                    return r

        raise pygdbmi.constants.GdbTimeoutError()


class JLinkInterface(GdbTargetInterface):
    """
    Interfaces to the target via a J-Link GDB server
    """

    def __init__(
        self,
        runtime_crate_dir: pathlib.Path,
        executable_file: pathlib.Path,
        gdbserver_port: int,
        terminal_io_port: int,
    ):
        super(JLinkInterface, self).__init__(
            runtime_crate_dir=runtime_crate_dir,
            executable_file=executable_file,
            gdbserver_port=gdbserver_port,
            terminal_io_port=terminal_io_port,
        )

    def enable_semihosting(self):
        self.monitor_command("semihosting enable")

    def reset(self):
        # The reset seems to be more reliable with two reset commands
        self.monitor_command("reset")
        self.monitor_command("reset")


class OpenOcdInterface(GdbTargetInterface):
    """
    Interfaces to the target via a OpenOCD GDB server
    """

    def __init__(
        self,
        runtime_crate_dir: pathlib.Path,
        executable_file: pathlib.Path,
        gdbserver_port: int,
        terminal_io_port: int,
    ):
        super(OpenOcdInterface, self).__init__(
            runtime_crate_dir=runtime_crate_dir,
            executable_file=executable_file,
            gdbserver_port=gdbserver_port,
            terminal_io_port=terminal_io_port,
        )

    def enable_semihosting(self):
        self.monitor_command("arm semihosting enable")

    def reset(self):
        self.monitor_command("reset halt")


class StUtilInterface(GdbTargetInterface):
    """
    Interfaces to the target using st-util

    This spawns an instance of st-util, then connects to its GDB server.
    """

    def __init__(
        self,
        runtime_crate_dir: pathlib.Path,
        executable_file: pathlib.Path,
        gdbserver_port: int,
        terminal_io_port: int,
    ):
        self.stutil = subprocess.Popen(
            ["st-util", "-v0", "-p", str(gdbserver_port)],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )

        # Prevent read() from possibly blocking indefinitely
        os.set_blocking(self.stutil.stderr.fileno(), False)
        os.set_blocking(self.stutil.stdout.fileno(), False)

        super(StUtilInterface, self).__init__(
            runtime_crate_dir=runtime_crate_dir,
            executable_file=executable_file,
            gdbserver_port=gdbserver_port,
            terminal_io_port=None,  # not used for st-util
        )

    def shutdown(self):
        super(StUtilInterface, self).shutdown()

        # st-util should exit when the GDB connection is closed, so wait for it
        # to exit. If it doesn't exit quickly, then kill it.
        try:
            self.stutil.communicate(timeout=1.0)
        except subprocess.TimeoutExpired:
            self.stutil.kill()
            self.stutil.communicate()

    def enable_semihosting(self):
        self.monitor_command("semihosting enable")

    def reset(self):
        self.monitor_command("reset")

    def read_io(self, timeout=5.0):
        # st-util prints semihosting data to stderr
        ready = select.select([self.stutil.stderr.fileno()], [], [], timeout)
        if ready[0]:
            return self.stutil.stderr.read1()
        else:
            return bytes()


driver_classes = {
    "jlink-gdbserver": JLinkInterface,
    "openocd-gdbserver": OpenOcdInterface,
    "st-util": StUtilInterface,
}

