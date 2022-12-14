/* SPDX-License-Identifier: GPL-2.0-only */
/*
 *  linux/arch/arm/lib/io-acorn.S
 *
 *  Copyright (C) 1995, 1996 Russell King
 *
 * 27/03/03 Ian Molton Clean up CONFIG_CPU
 */
#include <linux/linkage.h>
#include <linux/kern_levels.h>
#include <asm/assembler.h>

		.text
		.align

.Liosl_warning:
		.ascii	KERN_WARNING "insl/outsl not implemented, called from %08lX\0"
		.align

/*
 * These make no sense on Acorn machines.
 * Print a warning message.
 */
ENTRY(insl)
ENTRY(outsl)
		adr	r0, .Liosl_warning
		mov	r1, lr
		b	_printk
