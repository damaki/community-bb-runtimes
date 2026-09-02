/****************************************************************************
 *                                                                          *
 *                         GNAT COMPILER COMPONENTS                         *
 *                                                                          *
 *                                  A R M                                   *
 *                                                                          *
 *                            Linker Script File                            *
 *                                                                          *
 *      Copyright (C) 1999-2002 Universidad Politecnica de Madrid           *
 *             Copyright (C) 2003-2006 The European Space Agency            *
 *                   Copyright (C) 2003-2020 AdaCore                        *
 *                                                                          *
 * GNAT is free software;  you can  redistribute it  and/or modify it under *
 * terms of the  GNU General Public License as published  by the Free Soft- *
 * ware  Foundation;  either version 2,  or (at your option) any later ver- *
 * sion.  GNAT is distributed in the hope that it will be useful, but WITH- *
 * OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY *
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License *
 * for  more details.  You should have  received  a copy of the GNU General *
 * Public License  distributed with GNAT;  see file COPYING.  If not, write *
 * to  the  Free Software Foundation,  51  Franklin  Street,  Fifth  Floor, *
 * Boston, MA 02110-1301, USA.                                              *
 *                                                                          *
 * As a  special  exception,  if you  link  this file  with other  files to *
 * produce an executable,  this file does not by itself cause the resulting *
 * executable to be covered by the GNU General Public License. This except- *
 * ion does not  however invalidate  any other reasons  why the  executable *
 * file might be covered by the  GNU Public License.                        *
 *                                                                          *
 * GNARL was developed by the GNARL team at Florida State University.       *
 * Extensive contributions were provided by Ada Core Technologies, Inc.     *
 * The  executive  was developed  by the  Real-Time  Systems  Group  at the *
 * Technical University of Madrid.                                          *
 *                                                                          *
 ****************************************************************************/

/* This region covers the 128KB main SRAM bank shared by STM32F411 (which
   has no separate CCM RAM) and STM32F405/407/415/417 (which do have a
   separate 64KB CCM region at 0x10000000, but this runtime does not
   currently expose it as a usable memory region -- the "ccm" alias below
   is a zero-length placeholder). Every logical region used by
   common-{ROM,RAM}.ld aliases onto the main SRAM bank. */

MEMORY
{
  sram  (rwx) : ORIGIN = 0x20000000, LENGTH = 128K
  ccm   (rw)  : ORIGIN = 0x10000000, LENGTH = 0
}

REGION_ALIAS("sram_tx", sram)
REGION_ALIAS("sram_ro", sram)
REGION_ALIAS("sram_bs", sram)
REGION_ALIAS("sram_da", sram)
REGION_ALIAS("ccm_da", ccm)
