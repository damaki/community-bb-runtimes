import support.target_info
import pytest
import pathlib


def crate_config_values(target_info: support.target_info.TargetInfo):
    # Use Segger_RTT for text I/O
    return { f"{target_info.runtime_crate_name}.Text_IO": "Segger_RTT" }

def io_timeout(target_info: support.target_info.TargetInfo):
    # Use a longer timeout when using RTT since it takes several seconds for
    # the J-Link to auto-detect the RTT control block in memory.
    return 20.0