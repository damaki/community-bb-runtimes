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
    parser.addoption(
        "--working-dir",
        action="store",
        type=str,
        default=None,
        help="Directory to store working files for building tests",
    )
    parser.addoption(
        "--keep-build-files",
        action="store_true",
        help="Don't delete working files after the test is completed",
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

@pytest.fixture
def working_dir(request):
    return request.config.getoption("--working-dir")

@pytest.fixture
def keep_build_files(request):
    return request.config.getoption("--keep-build-files")