import pytest

def pytest_addoption(parser):
    parser.addoption(
        "--gdbserver-port",
        action="store",
        type=int,
        default=2331,
        help="The GDB server's port number",
    )
    parser.addoption(
        "--text-io-port",
        action="store",
        type=int,
        default=2333,
        help="Port number to connect to for the target's text I/O data",
    )
    parser.addoption(
        "--target-board",
        action="store",
        type=str,
        default=None,
        help="Name of the hardware target to use for executing tests",
    )

@pytest.fixture
def gdbserver_port(request):
    return request.config.getoption("--gdbserver-port")

@pytest.fixture
def text_io_port(request):
    return request.config.getoption("--text-io-port")

@pytest.fixture
def target_board(request):
    return request.config.getoption("--target-board")