## -*- asm -*- ##############################################################
#                                                                           #
#                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                  #
#                                                                           #
#                                 S T A R T                                 #
#                                                                           #
#                               Assembly File                               #
#                                                                           #
#                      Copyright (C) 2012-2021 AdaCore                      #
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

#include "rp2350_runtime_config.h"

    .syntax unified
    .cpu cortex-m33
    .thumb

	.text
	.section .vectors,"a"
	.globl __vectors
	.p2align 9
__vectors:
	/* Cortex-M core interrupts */
	.word   __stack_end          /* stack top address */
	.word   _start_rom           /* 1 Reset.  */
	.word   fault                /* 2 NMI. */
	.word   fault                /* 3 Hard fault. */
	.word   fault                /* 4 Mem manage. */
	.word   fault                /* 5 Bus fault. */
	.word   fault                /* 6 Usage fault. */
	.word   fault                /* 7 reserved. */
	.word   fault                /* 8 reserved. */
	.word   fault                /* 9 reserved. */
	.word   fault                /* 10 reserved. */
	.word   __gnat_sv_call_trap  /* 11 SVCall. */
	.word   __gnat_bkpt_trap     /* 12 Breakpoint. */
	.word   fault                /* 13 reserved. */
	.word   __gnat_pend_sv_trap  /* 14 PendSV. */
	.word   __gnat_sys_tick_trap /* 15 Systick. */
	/* MCU interrupts */
	.word __gnat_irq_trap        /* 16 TIMER0_IRQ_0 */
	.word __gnat_irq_trap        /* 17 TIMER0_IRQ_1 */
	.word __gnat_irq_trap        /* 18 TIMER0_IRQ_2 */
	.word __gnat_irq_trap        /* 19 TIMER0_IRQ_3 */
	.word __gnat_irq_trap        /* 20 TIMER1_IRQ_0 */
	.word __gnat_irq_trap        /* 21 TIMER1_IRQ_1 */
	.word __gnat_irq_trap        /* 22 TIMER1_IRQ_2 */
	.word __gnat_irq_trap        /* 23 TIMER1_IRQ_3 */
	.word __gnat_irq_trap        /* 24 PWM_IRQ_WRAP_0 */
	.word __gnat_irq_trap        /* 25 PWM_IRQ_WRAP_1 */
	.word __gnat_irq_trap        /* 26 DMA_IRQ_0 */
	.word __gnat_irq_trap        /* 27 DMA_IRQ_1 */
	.word __gnat_irq_trap        /* 28 DMA_IRQ_2 */
	.word __gnat_irq_trap        /* 29 DMA_IRQ_3 */
	.word __gnat_irq_trap        /* 30 USBCTRL_IRQ */
	.word __gnat_irq_trap        /* 31 PIO0_IRQ_0 */
	.word __gnat_irq_trap        /* 32 PIO0_IRQ_1 */
	.word __gnat_irq_trap        /* 33 PIO1_IRQ_0 */
	.word __gnat_irq_trap        /* 34 PIO1_IRQ_1 */
	.word __gnat_irq_trap        /* 35 PIO2_IRQ_0 */
	.word __gnat_irq_trap        /* 36 PIO2_IRQ_1 */
	.word __gnat_irq_trap        /* 37 IO_IRQ_BANK0 */
	.word __gnat_irq_trap        /* 38 IO_IRQ_BANK0_NS */
	.word __gnat_irq_trap        /* 39 IO_IRQ_QSPI */
	.word __gnat_irq_trap        /* 40 IO_IRQ_QSPI_NS */
	.word __gnat_irq_trap        /* 41 SIO_IRQ_FIFO */
#if (MAX_CPUS > 1) && (SECURITY_LEVEL == SECURITY_LEVEL_SECURE)
	.word __gnat_poke_handler    /* 42 SIO_IRQ_BELL */
#else
	.word __gnat_irq_trap        /* 42 SIO_IRQ_BELL */
#endif
	.word __gnat_irq_trap        /* 43 SIO_IRQ_FIFO_NS */
#if (MAX_CPUS > 1) && (SECURITY_LEVEL != SECURITY_LEVEL_SECURE)
	.word __gnat_poke_handler    /* 44 SIO_IRQ_BELL_NS */
#else
	.word __gnat_irq_trap        /* 42 SIO_IRQ_BELL_NS */
#endif
	.word __gnat_irq_trap        /* 45 SIO_IRQ_MTIMECMP */
	.word __gnat_irq_trap        /* 46 CLOCKS_IRQ */
	.word __gnat_irq_trap        /* 47 SPI0_IRQ */
	.word __gnat_irq_trap        /* 48 SPI1_IRQ */
	.word __gnat_irq_trap        /* 49 UART0_IRQ */
	.word __gnat_irq_trap        /* 50 UART1_IRQ */
	.word __gnat_irq_trap        /* 51 ADC_IRQ_FIFO */
	.word __gnat_irq_trap        /* 52 I2C0_IRQ */
	.word __gnat_irq_trap        /* 53 I2C1_IRQ */
	.word __gnat_irq_trap        /* 54 OTP_IRQ */
	.word __gnat_irq_trap        /* 55 TRNG_IRQ */
	.word __gnat_irq_trap        /* 56 IRQ 40. */
	.word __gnat_irq_trap        /* 57 IRQ 41. */
	.word __gnat_irq_trap        /* 58 PLL_SYS_IRQ */
	.word __gnat_irq_trap        /* 59 PLL_USB_IRQ */
	.word __gnat_irq_trap        /* 60 POWMAN_IRQ_POW */
	.word __gnat_irq_trap        /* 61 POWMAN_IRQ_TIMER */
	.word __gnat_irq_trap        /* 62 SPARE_IRQ_0 */
	.word __gnat_irq_trap        /* 63 SPARE_IRQ_1 */
	.word __gnat_irq_trap        /* 64 SPARE_IRQ_2 */
	.word __gnat_irq_trap        /* 65 SPARE_IRQ_3 */
	.word __gnat_irq_trap        /* 66 SPARE_IRQ_4 */
	.word __gnat_irq_trap        /* 67 SPARE_IRQ_5 */

    .text
    .thumb_func
    .globl _start_rom
_start_rom:
    /* Enable the redundancy coprocessor */
    ldr  r0,=0xe000ed88 /* CPACR */
    movs r1,#0x0000c000 /* CPACR CP7 */
    str  r1,[r0]

    /* Skip canary initialization if already initialized */
    mrc p7,#1,r15,c0,c0,#0
    bmi 1f
    mcrr p7,#8,r0,r0,c0
    mcrr p7,#8,r0,r0,c1
    sev

1:
    /* Check which core we're running on */
    ldr r0, =0xd0000000 /* CPUID register */
    ldr r0, [r0]

    /* Call _wait_for_vector in the bootrom for all cores except core0 */
    cmp r0, #0
    bne jump_to_bootrom_wait_for_vector

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
    bl _ada_setup_clocks
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

#include "image_def.S.inc"