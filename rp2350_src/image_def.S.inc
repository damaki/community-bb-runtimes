#include "rp2350_runtime_config.h"

.section .embedded_block, "a"
.p2align 2
embedded_block:
    /* Block header */
    .word 0xffffded3 /* BLOCK_MARKER_START */

    /* Item 1 (IMAGE_DEF) */
    .byte  0x42 /* size_flag == 0, item_type == PICOBIN_BLOCK_ITEM_1BS_IMAGE_TYPE */
    .byte  0x01 /* block_size in words */

#if SECURITY_LEVEL == SECURITY_LEVEL_SECURE
    .hword 0x1021 /* Image_Type   = IMAGE_TYPE_EXE
                     EXE Security = EXE_SECURITY_S
                     EXE CPU      = EXEC_CPU_ARM
                     EXE CHIP     = EXE_CHIP_RP2350
                     EXE TBYB     = 0
                     */
#else
    .hword 0x1011 /* Image_Type   = IMAGE_TYPE_EXE
                     EXE Security = EXE_SECURITY_NS
                     EXE CPU      = EXEC_CPU_ARM
                     EXE CHIP     = EXE_CHIP_RP2350
                     EXE TBYB     = 0
                     */
#endif

    /* Item 2 (2BS_LAST) */
    .byte  0xff   /* size_flag == 1, item_type = PICOBIN_BLOCK_ITEM_2BS_LAST */
    .hword 0x0001 /* block_size in words */
    .byte  0x00   /* padding */

    /* LINK */
    .word 0

    /* Block footer */
    .word 0xab123579 /* BLOCK_MARKER_END */