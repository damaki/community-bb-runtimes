#!/bin/sh

mkdir -p generated
./genboot2asm.sh generic_03 generated/boot2-generic_03.S
./genboot2asm.sh generic_qspi generated/boot2-generic_qspi.S
./genboot2asm.sh w25qxx generated/boot2-w25qxx.S
