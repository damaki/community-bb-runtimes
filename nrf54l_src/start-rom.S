## -*- asm -*- ##############################################################
#                                                                           #
#                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                  #
#                                                                           #
#                                 S T A R T                                 #
#                                                                           #
#                               Assembly File                               #
#                                                                           #
#                      Copyright (C) 2012-2026 AdaCore                      #
#                                                                           #
#  GNAT is free software;  you can  redistribute it  and/or modify it under #
#  terms of the  GNU General Public License as published  by the Free Soft- #
#  ware  Foundation;  either version 3,  or (at your option) any later ver- #
#  sion.  GNAT is distributed in the hope that it will be useful, but WITH- #
#  OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY #
#  or FITNESS FOR A PARTICULAR PURPOSE.                                     #
#                                                                           #
#  As a special exception under Section 7 of GPL version 3, you are granted #
#  additional permissions described in the GCC Runtime Library Exception,   #
#  version 3.1, as published by the Free Software Foundation.               #
#                                                                           #
#  You should have received a copy of the GNU General Public License and    #
#  a copy of the GCC Runtime Library Exception along with this program;     #
#  see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    #
#  <http://www.gnu.org/licenses/>.                                          #
#                                                                           #
#############################################################################

#include "nrf54_app_runtime_config.h"

	.syntax unified
	.cpu cortex-m33
	.thumb

	/* This is the initial vector table and also the one that is used by
	   the Light runtime. Ravenscar runtimes install its own table (using
	   VTOR register) defined in handler.S.  */
	.section .vectors,"a"
__vectors0:
	.word   __stack_end /* stack top address */
	.word   _start_rom  /* 1 Reset */
	.word   hang        /* 2 NMI */
	.word   hang        /* 3 HardFault */
	.word   hang        /* 4 MemManage */

    .text
    .thumb_func
    .globl _start_rom
_start_rom:

	/* Enable the debug monitor so that bkpt instructions are not treated
	* as hard fault when no debugger is attached */
	.set    DEMCR,  0xE000EDFC
	ldr     r0, =DEMCR
	ldr     r1, [r0]
	orr     r1, r1, #0x10000 /* Set MON_EN in DEMCR */
	str     r1, [r0]

	/* Enable FPU */
	movw     r0,#0xED88
	movt     r0,#0xE000
	ldr      r1,[r0]
	orr      r1,r1,#(0xF << 20)
	str      r1,[r0]

#if SECURITY_LEVEL == SECURITY_LEVEL_SECURE
	/* Allow non-secure code to also use the FPU */
	movw     r0,#0xED8C
	movt     r0,#0xE000
	ldr      r1,[r0]
	orr      r1,r1,#(0x3 << 10)
	str      r1,[r0]
#endif

	dsb
	isb

    /* Copy .data */
    ldr    r0,=__data_start
    ldr    r1,=__data_words
    ldr    r2,=__data_load
    cmp    r1,#0
    beq    1f
0:
    ldr    r4,[r2]
    str    r4,[r0]
    adds   r0,#4
    adds   r2,#4
    subs   r1,r1,#1
    bne    0b
1:
    /* Clear .bss */
    ldr    r0,=__bss_start
    ldr    r1,=__bss_words
    movs   r2,#0
    cmp    r1,#0
    beq    1f
0:
    str    r2,[r0]
    adds   r0,#4
    subs   r1,r1,#1
    bne    0b

1:
    bl _ada_setup_board
    bl main
    bl _exit

hang:   b .

jump_to_bootrom_wait_for_vector:
    ldr r0, =0
    ldr r1, =0xE000ED08 /* Secure VTOR */
    str r0, [r1]
    ldmia r0!, {r1, r2}
    msr msp, r1
    bx r2

	.text

	.thumb_func
.weak __gnat_poke_handler
.type __gnat_poke_handler, %function
__gnat_poke_handler:
0:	b 0b
	.size __gnat_poke_handler, . - __gnat_poke_handler

	.thumb_func
.weak __gnat_irq_trap
.type __gnat_irq_trap, %function
__gnat_irq_trap:
0:	b 0b
	.size __gnat_irq_trap, . - __gnat_irq_trap

	.thumb_func
.weak __gnat_bkpt_trap
.type __gnat_bkpt_trap, %function
__gnat_bkpt_trap:
0:	b 0b
	.size __gnat_bkpt_trap, . - __gnat_bkpt_trap

	.thumb_func
.weak __gnat_sv_call_trap
.type __gnat_sv_call_trap, %function
__gnat_sv_call_trap:
0:	b 0b
	.size __gnat_sv_call_trap, . - __gnat_sv_call_trap

	.thumb_func
.weak __gnat_pend_sv_trap
.type __gnat_pend_sv_trap, %function
__gnat_pend_sv_trap:
0:	b 0b
	.size __gnat_pend_sv_trap, . - __gnat_pend_sv_trap

	.thumb_func
.weak __gnat_sys_tick_trap
.type __gnat_sys_tick_trap, %function
__gnat_sys_tick_trap:
0:	b 0b
	.size __gnat_sys_tick_trap, . - __gnat_sys_tick_trap

	.thumb_func
fault:	b fault
