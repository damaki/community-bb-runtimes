--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

package Interfaces.NRF54.SPU is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  A security violation has been detected on one or several peripherals
   type EVENTS_PERIPHACCERR_EVENTS_PERIPHACCERR_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_PERIPHACCERR_EVENTS_PERIPHACCERR_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  A security violation has been detected on one or several peripherals
   type EVENTS_PERIPHACCERR_Register is record
      --  A security violation has been detected on one or several peripherals
      EVENTS_PERIPHACCERR : EVENTS_PERIPHACCERR_EVENTS_PERIPHACCERR_Field :=
                             Interfaces.NRF54.SPU.NotGenerated;
      --  unspecified
      Reserved_1_31       : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_PERIPHACCERR_Register use record
      EVENTS_PERIPHACCERR at 0 range 0 .. 0;
      Reserved_1_31       at 0 range 1 .. 31;
   end record;

   --  Enable or disable interrupt for event PERIPHACCERR
   type INTEN_PERIPHACCERR_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN_PERIPHACCERR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt
   type INTEN_Register is record
      --  Enable or disable interrupt for event PERIPHACCERR
      PERIPHACCERR  : INTEN_PERIPHACCERR_Field :=
                       Interfaces.NRF54.SPU.Disabled;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTEN_Register use record
      PERIPHACCERR  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Write '1' to enable interrupt for event PERIPHACCERR
   type INTENSET_PERIPHACCERR_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET_PERIPHACCERR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event PERIPHACCERR
   type INTENSET_PERIPHACCERR_Field_1 is
     (--  Reset value for the field
      INTENSET_PERIPHACCERR_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET_PERIPHACCERR_Field_1 use
     (INTENSET_PERIPHACCERR_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt
   type INTENSET_Register is record
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event PERIPHACCERR
      PERIPHACCERR  : INTENSET_PERIPHACCERR_Field_1 :=
                       INTENSET_PERIPHACCERR_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      PERIPHACCERR  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Write '1' to disable interrupt for event PERIPHACCERR
   type INTENCLR_PERIPHACCERR_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR_PERIPHACCERR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event PERIPHACCERR
   type INTENCLR_PERIPHACCERR_Field_1 is
     (--  Reset value for the field
      INTENCLR_PERIPHACCERR_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR_PERIPHACCERR_Field_1 use
     (INTENCLR_PERIPHACCERR_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt
   type INTENCLR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event PERIPHACCERR
      PERIPHACCERR  : INTENCLR_PERIPHACCERR_Field_1 :=
                       INTENCLR_PERIPHACCERR_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      PERIPHACCERR  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Read pending status of interrupt for event PERIPHACCERR
   type INTPEND_PERIPHACCERR_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND_PERIPHACCERR_Field use
     (NotPending => 0,
      Pending => 1);

   --  Pending interrupts
   type INTPEND_Register is record
      --  Read-only. Read pending status of interrupt for event PERIPHACCERR
      PERIPHACCERR  : INTPEND_PERIPHACCERR_Field;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTPEND_Register use record
      PERIPHACCERR  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------------------------------
   -- SPU_PERIPHACCERR cluster's Registers --
   ------------------------------------------

   subtype ADDRESS_PERIPHACCERR_ADDRESS_Field is Interfaces.NRF54.UInt16;

   --  Address of the transaction that caused first error.
   type ADDRESS_PERIPHACCERR_Register is record
      --  Read-only. Address
      ADDRESS        : ADDRESS_PERIPHACCERR_ADDRESS_Field;
      --  unspecified
      Reserved_16_31 : Interfaces.NRF54.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ADDRESS_PERIPHACCERR_Register use record
      ADDRESS        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Unspecified
   type SPU_PERIPHACCERR_Cluster is record
      --  Address of the transaction that caused first error.
      ADDRESS : aliased ADDRESS_PERIPHACCERR_Register;
      pragma Volatile_Full_Access (ADDRESS);
   end record
     with Size => 32;

   for SPU_PERIPHACCERR_Cluster use record
      ADDRESS at 0 range 0 .. 31;
   end record;

   ------------------------------------
   -- SPU_PERIPH cluster's Registers --
   ------------------------------------

   --  Read capabilities for TrustZone Cortex-M secure attribute
   type PERM_SECUREMAPPING_Field is
     (--  This peripheral is always accessible as a non-secure peripheral
      NonSecure,
      --  This peripheral is always accessible as a secure peripheral
      Secure,
      --  Non-secure or secure attribute for this peripheral is defined by the
--  PERIPH[n].PERM register
      UserSelectable,
      --  This peripheral implements the split security mechanism.
      Split)
     with Size => 2;
   for PERM_SECUREMAPPING_Field use
     (NonSecure => 0,
      Secure => 1,
      UserSelectable => 2,
      Split => 3);

   --  Read the peripheral DMA capabilities
   type PERM_DMA_Field is
     (--  Peripheral has no DMA capability
      NoDMA,
      --  Peripheral has DMA and DMA transfers always have the same security
--  attribute as assigned to the peripheral
      NoSeparateAttribute,
      --  Peripheral has DMA and DMA transfers can have a different security
--  attribute than the one assigned to the peripheral
      SeparateAttribute)
     with Size => 2;
   for PERM_DMA_Field use
     (NoDMA => 0,
      NoSeparateAttribute => 1,
      SeparateAttribute => 2);

   --  Peripheral security mapping
   type PERM_SECATTR_Field is
     (--  If SECUREMAPPING == UserSelectable: Peripheral is mapped in non-secure
--  peripheral address space. If SECUREMAPPING == Split: Peripheral is mapped
--  in non-secure and secure peripheral address space.
      NonSecure,
      --  Peripheral is mapped in secure peripheral address space
      Secure)
     with Size => 1;
   for PERM_SECATTR_Field use
     (NonSecure => 0,
      Secure => 1);

   --  Security attribution for the DMA transfer
   type PERM_DMASEC_Field is
     (--  DMA transfers initiated by this peripheral have the non-secure attribute
--  set
      NonSecure,
      --  DMA transfers initiated by this peripheral have the secure attribute set
      Secure)
     with Size => 1;
   for PERM_DMASEC_Field use
     (NonSecure => 0,
      Secure => 1);

   --  Register lock
   type PERM_LOCK_Field is
     (--  This register can be updated
      Unlocked,
      --  The content of this register can not be changed until the next reset
      Locked)
     with Size => 1;
   for PERM_LOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Indicates if a peripheral is present with peripheral slave index n
   type PERM_PRESENT_Field is
     (--  Peripheral is not present
      NotPresent,
      --  Peripheral is present
      IsPresent)
     with Size => 1;
   for PERM_PRESENT_Field use
     (NotPresent => 0,
      IsPresent => 1);

   --  Description cluster: Get and set the applicable access permissions for
   --  the peripheral slave index n
   type PERM_PERIPH_Register is record
      --  Read-only. Read capabilities for TrustZone Cortex-M secure attribute
      SECUREMAPPING : PERM_SECUREMAPPING_Field :=
                       Interfaces.NRF54.SPU.UserSelectable;
      --  Read-only. Read the peripheral DMA capabilities
      DMA           : PERM_DMA_Field :=
                       Interfaces.NRF54.SPU.SeparateAttribute;
      --  Peripheral security mapping
      SECATTR       : PERM_SECATTR_Field := Interfaces.NRF54.SPU.NonSecure;
      --  Security attribution for the DMA transfer
      DMASEC        : PERM_DMASEC_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_6_7  : Interfaces.NRF54.UInt2 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Register lock
      LOCK          : PERM_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_30 : Interfaces.NRF54.UInt22 := 16#0#;
      --  Read-only. Indicates if a peripheral is present with peripheral slave
      --  index n
      PRESENT       : PERM_PRESENT_Field := Interfaces.NRF54.SPU.IsPresent;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PERM_PERIPH_Register use record
      SECUREMAPPING at 0 range 0 .. 1;
      DMA           at 0 range 2 .. 3;
      SECATTR       at 0 range 4 .. 4;
      DMASEC        at 0 range 5 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_30 at 0 range 9 .. 30;
      PRESENT       at 0 range 31 .. 31;
   end record;

   --  Unspecified
   type SPU_PERIPH_Cluster is record
      --  Description cluster: Get and set the applicable access permissions
      --  for the peripheral slave index n
      PERM : aliased PERM_PERIPH_Register;
      pragma Volatile_Full_Access (PERM);
   end record
     with Size => 32;

   for SPU_PERIPH_Cluster use record
      PERM at 0 range 0 .. 31;
   end record;

   --  Unspecified
   type SPU_PERIPH_Clusters is array (0 .. 63) of SPU_PERIPH_Cluster;

   -------------------------------------
   -- SPU_FEATURE cluster's Registers --
   -------------------------------------

   -------------------------------------------
   -- SPU_FEATURE_DPPIC cluster's Registers --
   -------------------------------------------

   --  SECATTR feature
   type CH_SECATTR_Field is
     (--  Feature is available for non-secure usage
      NonSecure,
      --  Feature is reserved for secure usage
      Secure)
     with Size => 1;
   for CH_SECATTR_Field use
     (NonSecure => 0,
      Secure => 1);

   --  LOCK feature
   type CH_LOCK_Field is
     (--  Feature permissions can be updated
      Unlocked,
      --  Feature permissions can not be changed until the next reset
      Locked)
     with Size => 1;
   for CH_LOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Description collection: Security configuration for channel n of DPPIC
   type CH_DPPIC_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.NRF54.UInt4 := 16#0#;
      --  SECATTR feature
      SECATTR       : CH_SECATTR_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_5_7  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. LOCK feature
      LOCK          : CH_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_31 : Interfaces.NRF54.UInt23 := 16#800#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CH_DPPIC_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      SECATTR       at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  SECATTR feature
   type CHG_SECATTR_Field is
     (--  Feature is available for non-secure usage
      NonSecure,
      --  Feature is reserved for secure usage
      Secure)
     with Size => 1;
   for CHG_SECATTR_Field use
     (NonSecure => 0,
      Secure => 1);

   --  LOCK feature
   type CHG_LOCK_Field is
     (--  Feature permissions can be updated
      Unlocked,
      --  Feature permissions can not be changed until the next reset
      Locked)
     with Size => 1;
   for CHG_LOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Description collection: Security configuration for channel group n of
   --  DPPIC
   type CHG_DPPIC_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.NRF54.UInt4 := 16#0#;
      --  SECATTR feature
      SECATTR       : CHG_SECATTR_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_5_7  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. LOCK feature
      LOCK          : CHG_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_31 : Interfaces.NRF54.UInt23 := 16#800#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CHG_DPPIC_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      SECATTR       at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Unspecified
   type SPU_FEATURE_DPPIC_Cluster is record
      --  Description collection: Security configuration for channel n of DPPIC
      CH_0  : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_0);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_1  : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_1);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_2  : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_2);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_3  : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_3);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_4  : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_4);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_5  : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_5);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_6  : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_6);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_7  : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_7);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_8  : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_8);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_9  : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_9);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_10 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_10);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_11 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_11);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_12 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_12);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_13 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_13);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_14 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_14);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_15 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_15);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_16 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_16);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_17 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_17);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_18 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_18);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_19 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_19);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_20 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_20);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_21 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_21);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_22 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_22);
      --  Description collection: Security configuration for channel n of DPPIC
      CH_23 : aliased CH_DPPIC_Register;
      pragma Volatile_Full_Access (CH_23);
      --  Description collection: Security configuration for channel group n of
      --  DPPIC
      CHG_0 : aliased CHG_DPPIC_Register;
      pragma Volatile_Full_Access (CHG_0);
      --  Description collection: Security configuration for channel group n of
      --  DPPIC
      CHG_1 : aliased CHG_DPPIC_Register;
      pragma Volatile_Full_Access (CHG_1);
      --  Description collection: Security configuration for channel group n of
      --  DPPIC
      CHG_2 : aliased CHG_DPPIC_Register;
      pragma Volatile_Full_Access (CHG_2);
      --  Description collection: Security configuration for channel group n of
      --  DPPIC
      CHG_3 : aliased CHG_DPPIC_Register;
      pragma Volatile_Full_Access (CHG_3);
      --  Description collection: Security configuration for channel group n of
      --  DPPIC
      CHG_4 : aliased CHG_DPPIC_Register;
      pragma Volatile_Full_Access (CHG_4);
      --  Description collection: Security configuration for channel group n of
      --  DPPIC
      CHG_5 : aliased CHG_DPPIC_Register;
      pragma Volatile_Full_Access (CHG_5);
      --  Description collection: Security configuration for channel group n of
      --  DPPIC
      CHG_6 : aliased CHG_DPPIC_Register;
      pragma Volatile_Full_Access (CHG_6);
      --  Description collection: Security configuration for channel group n of
      --  DPPIC
      CHG_7 : aliased CHG_DPPIC_Register;
      pragma Volatile_Full_Access (CHG_7);
   end record
     with Size => 1024;

   for SPU_FEATURE_DPPIC_Cluster use record
      CH_0  at 16#0# range 0 .. 31;
      CH_1  at 16#4# range 0 .. 31;
      CH_2  at 16#8# range 0 .. 31;
      CH_3  at 16#C# range 0 .. 31;
      CH_4  at 16#10# range 0 .. 31;
      CH_5  at 16#14# range 0 .. 31;
      CH_6  at 16#18# range 0 .. 31;
      CH_7  at 16#1C# range 0 .. 31;
      CH_8  at 16#20# range 0 .. 31;
      CH_9  at 16#24# range 0 .. 31;
      CH_10 at 16#28# range 0 .. 31;
      CH_11 at 16#2C# range 0 .. 31;
      CH_12 at 16#30# range 0 .. 31;
      CH_13 at 16#34# range 0 .. 31;
      CH_14 at 16#38# range 0 .. 31;
      CH_15 at 16#3C# range 0 .. 31;
      CH_16 at 16#40# range 0 .. 31;
      CH_17 at 16#44# range 0 .. 31;
      CH_18 at 16#48# range 0 .. 31;
      CH_19 at 16#4C# range 0 .. 31;
      CH_20 at 16#50# range 0 .. 31;
      CH_21 at 16#54# range 0 .. 31;
      CH_22 at 16#58# range 0 .. 31;
      CH_23 at 16#5C# range 0 .. 31;
      CHG_0 at 16#60# range 0 .. 31;
      CHG_1 at 16#64# range 0 .. 31;
      CHG_2 at 16#68# range 0 .. 31;
      CHG_3 at 16#6C# range 0 .. 31;
      CHG_4 at 16#70# range 0 .. 31;
      CHG_5 at 16#74# range 0 .. 31;
      CHG_6 at 16#78# range 0 .. 31;
      CHG_7 at 16#7C# range 0 .. 31;
   end record;

   --------------------------------------------
   -- SPU_FEATURE_GPIOTE cluster's Registers --
   --------------------------------------------

   --  Description collection: Security configuration for channel o of
   --  GPIOTE[n]
   type CH_GPIOTE_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.NRF54.UInt4 := 16#0#;
      --  SECATTR feature
      SECATTR       : CH_SECATTR_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_5_7  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. LOCK feature
      LOCK          : CH_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_31 : Interfaces.NRF54.UInt23 := 16#800#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CH_GPIOTE_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      SECATTR       at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  SECATTR feature
   type INTERRUPT_SECATTR_Field is
     (--  Feature is available for non-secure usage
      NonSecure,
      --  Feature is reserved for secure usage
      Secure)
     with Size => 1;
   for INTERRUPT_SECATTR_Field use
     (NonSecure => 0,
      Secure => 1);

   --  LOCK feature
   type INTERRUPT_LOCK_Field is
     (--  Feature permissions can be updated
      Unlocked,
      --  Feature permissions can not be changed until the next reset
      Locked)
     with Size => 1;
   for INTERRUPT_LOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Description collection: Security configuration for interrupt o of
   --  GPIOTE[n]
   type INTERRUPT_GPIOTE_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.NRF54.UInt4 := 16#0#;
      --  SECATTR feature
      SECATTR       : INTERRUPT_SECATTR_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_5_7  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. LOCK feature
      LOCK          : INTERRUPT_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_31 : Interfaces.NRF54.UInt23 := 16#800#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTERRUPT_GPIOTE_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      SECATTR       at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Unspecified
   type SPU_FEATURE_GPIOTE_Cluster is record
      --  Description collection: Security configuration for channel o of
      --  GPIOTE[n]
      CH_0        : aliased CH_GPIOTE_Register;
      pragma Volatile_Full_Access (CH_0);
      --  Description collection: Security configuration for channel o of
      --  GPIOTE[n]
      CH_1        : aliased CH_GPIOTE_Register;
      pragma Volatile_Full_Access (CH_1);
      --  Description collection: Security configuration for channel o of
      --  GPIOTE[n]
      CH_2        : aliased CH_GPIOTE_Register;
      pragma Volatile_Full_Access (CH_2);
      --  Description collection: Security configuration for channel o of
      --  GPIOTE[n]
      CH_3        : aliased CH_GPIOTE_Register;
      pragma Volatile_Full_Access (CH_3);
      --  Description collection: Security configuration for channel o of
      --  GPIOTE[n]
      CH_4        : aliased CH_GPIOTE_Register;
      pragma Volatile_Full_Access (CH_4);
      --  Description collection: Security configuration for channel o of
      --  GPIOTE[n]
      CH_5        : aliased CH_GPIOTE_Register;
      pragma Volatile_Full_Access (CH_5);
      --  Description collection: Security configuration for channel o of
      --  GPIOTE[n]
      CH_6        : aliased CH_GPIOTE_Register;
      pragma Volatile_Full_Access (CH_6);
      --  Description collection: Security configuration for channel o of
      --  GPIOTE[n]
      CH_7        : aliased CH_GPIOTE_Register;
      pragma Volatile_Full_Access (CH_7);
      --  Description collection: Security configuration for interrupt o of
      --  GPIOTE[n]
      INTERRUPT_0 : aliased INTERRUPT_GPIOTE_Register;
      pragma Volatile_Full_Access (INTERRUPT_0);
      --  Description collection: Security configuration for interrupt o of
      --  GPIOTE[n]
      INTERRUPT_1 : aliased INTERRUPT_GPIOTE_Register;
      pragma Volatile_Full_Access (INTERRUPT_1);
      --  Description collection: Security configuration for interrupt o of
      --  GPIOTE[n]
      INTERRUPT_2 : aliased INTERRUPT_GPIOTE_Register;
      pragma Volatile_Full_Access (INTERRUPT_2);
      --  Description collection: Security configuration for interrupt o of
      --  GPIOTE[n]
      INTERRUPT_3 : aliased INTERRUPT_GPIOTE_Register;
      pragma Volatile_Full_Access (INTERRUPT_3);
      --  Description collection: Security configuration for interrupt o of
      --  GPIOTE[n]
      INTERRUPT_4 : aliased INTERRUPT_GPIOTE_Register;
      pragma Volatile_Full_Access (INTERRUPT_4);
      --  Description collection: Security configuration for interrupt o of
      --  GPIOTE[n]
      INTERRUPT_5 : aliased INTERRUPT_GPIOTE_Register;
      pragma Volatile_Full_Access (INTERRUPT_5);
      --  Description collection: Security configuration for interrupt o of
      --  GPIOTE[n]
      INTERRUPT_6 : aliased INTERRUPT_GPIOTE_Register;
      pragma Volatile_Full_Access (INTERRUPT_6);
      --  Description collection: Security configuration for interrupt o of
      --  GPIOTE[n]
      INTERRUPT_7 : aliased INTERRUPT_GPIOTE_Register;
      pragma Volatile_Full_Access (INTERRUPT_7);
   end record
     with Size => 512;

   for SPU_FEATURE_GPIOTE_Cluster use record
      CH_0        at 16#0# range 0 .. 31;
      CH_1        at 16#4# range 0 .. 31;
      CH_2        at 16#8# range 0 .. 31;
      CH_3        at 16#C# range 0 .. 31;
      CH_4        at 16#10# range 0 .. 31;
      CH_5        at 16#14# range 0 .. 31;
      CH_6        at 16#18# range 0 .. 31;
      CH_7        at 16#1C# range 0 .. 31;
      INTERRUPT_0 at 16#20# range 0 .. 31;
      INTERRUPT_1 at 16#24# range 0 .. 31;
      INTERRUPT_2 at 16#28# range 0 .. 31;
      INTERRUPT_3 at 16#2C# range 0 .. 31;
      INTERRUPT_4 at 16#30# range 0 .. 31;
      INTERRUPT_5 at 16#34# range 0 .. 31;
      INTERRUPT_6 at 16#38# range 0 .. 31;
      INTERRUPT_7 at 16#3C# range 0 .. 31;
   end record;

   --  Unspecified
   type SPU_FEATURE_GPIOTE_Clusters is array (0 .. 1)
     of SPU_FEATURE_GPIOTE_Cluster;

   ------------------------------
   -- GPIO cluster's Registers --
   ------------------------------

   --  SECATTR feature
   type PIN_SECATTR_Field is
     (--  Feature is available for non-secure usage
      NonSecure,
      --  Feature is reserved for secure usage
      Secure)
     with Size => 1;
   for PIN_SECATTR_Field use
     (NonSecure => 0,
      Secure => 1);

   --  LOCK feature
   type PIN_LOCK_Field is
     (--  Feature permissions can be updated
      Unlocked,
      --  Feature permissions can not be changed until the next reset
      Locked)
     with Size => 1;
   for PIN_LOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Description collection: Security configuration for GPIO[n] PIN[o]
   type PIN_GPIO_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.NRF54.UInt4 := 16#0#;
      --  SECATTR feature
      SECATTR       : PIN_SECATTR_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_5_7  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. LOCK feature
      LOCK          : PIN_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_31 : Interfaces.NRF54.UInt23 := 16#800#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PIN_GPIO_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      SECATTR       at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Unspecified
   type GPIO_Cluster is record
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_0  : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_0);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_1  : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_1);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_2  : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_2);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_3  : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_3);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_4  : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_4);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_5  : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_5);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_6  : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_6);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_7  : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_7);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_8  : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_8);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_9  : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_9);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_10 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_10);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_11 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_11);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_12 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_12);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_13 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_13);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_14 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_14);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_15 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_15);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_16 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_16);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_17 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_17);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_18 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_18);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_19 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_19);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_20 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_20);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_21 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_21);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_22 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_22);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_23 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_23);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_24 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_24);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_25 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_25);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_26 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_26);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_27 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_27);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_28 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_28);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_29 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_29);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_30 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_30);
      --  Description collection: Security configuration for GPIO[n] PIN[o]
      PIN_31 : aliased PIN_GPIO_Register;
      pragma Volatile_Full_Access (PIN_31);
   end record
     with Size => 1024;

   for GPIO_Cluster use record
      PIN_0  at 16#0# range 0 .. 31;
      PIN_1  at 16#4# range 0 .. 31;
      PIN_2  at 16#8# range 0 .. 31;
      PIN_3  at 16#C# range 0 .. 31;
      PIN_4  at 16#10# range 0 .. 31;
      PIN_5  at 16#14# range 0 .. 31;
      PIN_6  at 16#18# range 0 .. 31;
      PIN_7  at 16#1C# range 0 .. 31;
      PIN_8  at 16#20# range 0 .. 31;
      PIN_9  at 16#24# range 0 .. 31;
      PIN_10 at 16#28# range 0 .. 31;
      PIN_11 at 16#2C# range 0 .. 31;
      PIN_12 at 16#30# range 0 .. 31;
      PIN_13 at 16#34# range 0 .. 31;
      PIN_14 at 16#38# range 0 .. 31;
      PIN_15 at 16#3C# range 0 .. 31;
      PIN_16 at 16#40# range 0 .. 31;
      PIN_17 at 16#44# range 0 .. 31;
      PIN_18 at 16#48# range 0 .. 31;
      PIN_19 at 16#4C# range 0 .. 31;
      PIN_20 at 16#50# range 0 .. 31;
      PIN_21 at 16#54# range 0 .. 31;
      PIN_22 at 16#58# range 0 .. 31;
      PIN_23 at 16#5C# range 0 .. 31;
      PIN_24 at 16#60# range 0 .. 31;
      PIN_25 at 16#64# range 0 .. 31;
      PIN_26 at 16#68# range 0 .. 31;
      PIN_27 at 16#6C# range 0 .. 31;
      PIN_28 at 16#70# range 0 .. 31;
      PIN_29 at 16#74# range 0 .. 31;
      PIN_30 at 16#78# range 0 .. 31;
      PIN_31 at 16#7C# range 0 .. 31;
   end record;

   --  Unspecified
   type GPIO_Clusters is array (0 .. 2) of GPIO_Cluster;

   --------------------------------
   -- CRACEN cluster's Registers --
   --------------------------------

   --  SECATTR feature
   type SEED_SECATTR_Field is
     (--  Feature is available for non-secure usage
      NonSecure,
      --  Feature is reserved for secure usage
      Secure)
     with Size => 1;
   for SEED_SECATTR_Field use
     (NonSecure => 0,
      Secure => 1);

   --  LOCK feature
   type SEED_LOCK_Field is
     (--  Feature permissions can be updated
      Unlocked,
      --  Feature permissions can not be changed until the next reset
      Locked)
     with Size => 1;
   for SEED_LOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Configuration for CRACEN SEED
   type SEED_CRACEN_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.NRF54.UInt4 := 16#0#;
      --  SECATTR feature
      SECATTR       : SEED_SECATTR_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_5_7  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. LOCK feature
      LOCK          : SEED_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_31 : Interfaces.NRF54.UInt23 := 16#100#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SEED_CRACEN_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      SECATTR       at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Unspecified
   type CRACEN_Cluster is record
      --  Configuration for CRACEN SEED
      SEED : aliased SEED_CRACEN_Register;
      pragma Volatile_Full_Access (SEED);
   end record
     with Size => 3104;

   for CRACEN_Cluster use record
      SEED at 16#180# range 0 .. 31;
   end record;

   ------------------------------------------
   -- SPU_FEATURE_GRTC cluster's Registers --
   ------------------------------------------

   --  SECATTR feature
   type CC_SECATTR_Field is
     (--  Feature is available for non-secure usage
      NonSecure,
      --  Feature is reserved for secure usage
      Secure)
     with Size => 1;
   for CC_SECATTR_Field use
     (NonSecure => 0,
      Secure => 1);

   --  LOCK feature
   type CC_LOCK_Field is
     (--  Feature permissions can be updated
      Unlocked,
      --  Feature permissions can not be changed until the next reset
      Locked)
     with Size => 1;
   for CC_LOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Description collection: Security configuration for CC n of GRTC
   type CC_GRTC_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.NRF54.UInt4 := 16#0#;
      --  SECATTR feature
      SECATTR       : CC_SECATTR_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_5_7  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. LOCK feature
      LOCK          : CC_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_31 : Interfaces.NRF54.UInt23 := 16#800#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CC_GRTC_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      SECATTR       at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  SECATTR feature
   type PWMCONFIG_SECATTR_Field is
     (--  Feature is available for non-secure usage
      NonSecure,
      --  Feature is reserved for secure usage
      Secure)
     with Size => 1;
   for PWMCONFIG_SECATTR_Field use
     (NonSecure => 0,
      Secure => 1);

   --  LOCK feature
   type PWMCONFIG_LOCK_Field is
     (--  Feature permissions can be updated
      Unlocked,
      --  Feature permissions can not be changed until the next reset
      Locked)
     with Size => 1;
   for PWMCONFIG_LOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Security Configuration for PWMCONFIG of GRTC
   type PWMCONFIG_GRTC_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.NRF54.UInt4 := 16#0#;
      --  SECATTR feature
      SECATTR       : PWMCONFIG_SECATTR_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_5_7  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. LOCK feature
      LOCK          : PWMCONFIG_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_31 : Interfaces.NRF54.UInt23 := 16#800#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWMCONFIG_GRTC_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      SECATTR       at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  SECATTR feature
   type CLK_SECATTR_Field is
     (--  Feature is available for non-secure usage
      NonSecure,
      --  Feature is reserved for secure usage
      Secure)
     with Size => 1;
   for CLK_SECATTR_Field use
     (NonSecure => 0,
      Secure => 1);

   --  LOCK feature
   type CLK_LOCK_Field is
     (--  Feature permissions can be updated
      Unlocked,
      --  Feature permissions can not be changed until the next reset
      Locked)
     with Size => 1;
   for CLK_LOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Security configuration for CLKOUT/CLKCFG of GRTC
   type CLK_GRTC_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.NRF54.UInt4 := 16#0#;
      --  SECATTR feature
      SECATTR       : CLK_SECATTR_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_5_7  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. LOCK feature
      LOCK          : CLK_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_31 : Interfaces.NRF54.UInt23 := 16#800#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CLK_GRTC_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      SECATTR       at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  SECATTR feature
   type SYSCOUNTER_SECATTR_Field is
     (--  Feature is available for non-secure usage
      NonSecure,
      --  Feature is reserved for secure usage
      Secure)
     with Size => 1;
   for SYSCOUNTER_SECATTR_Field use
     (NonSecure => 0,
      Secure => 1);

   --  LOCK feature
   type SYSCOUNTER_LOCK_Field is
     (--  Feature permissions can be updated
      Unlocked,
      --  Feature permissions can not be changed until the next reset
      Locked)
     with Size => 1;
   for SYSCOUNTER_LOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Security configuration for SYSCOUNTERL/SYSCOUNTERH of GRTC
   type SYSCOUNTER_GRTC_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.NRF54.UInt4 := 16#0#;
      --  SECATTR feature
      SECATTR       : SYSCOUNTER_SECATTR_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_5_7  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. LOCK feature
      LOCK          : SYSCOUNTER_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_31 : Interfaces.NRF54.UInt23 := 16#800#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SYSCOUNTER_GRTC_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      SECATTR       at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Description collection: Security configuration for interrupt n of GRTC
   type INTERRUPT_GRTC_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.NRF54.UInt4 := 16#0#;
      --  SECATTR feature
      SECATTR       : INTERRUPT_SECATTR_Field := Interfaces.NRF54.SPU.Secure;
      --  unspecified
      Reserved_5_7  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. LOCK feature
      LOCK          : INTERRUPT_LOCK_Field := Interfaces.NRF54.SPU.Unlocked;
      --  unspecified
      Reserved_9_31 : Interfaces.NRF54.UInt23 := 16#800#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTERRUPT_GRTC_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      SECATTR       at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      LOCK          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Unspecified
   type SPU_FEATURE_GRTC_Cluster is record
      --  Description collection: Security configuration for CC n of GRTC
      CC_0         : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_0);
      --  Description collection: Security configuration for CC n of GRTC
      CC_1         : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_1);
      --  Description collection: Security configuration for CC n of GRTC
      CC_2         : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_2);
      --  Description collection: Security configuration for CC n of GRTC
      CC_3         : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_3);
      --  Description collection: Security configuration for CC n of GRTC
      CC_4         : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_4);
      --  Description collection: Security configuration for CC n of GRTC
      CC_5         : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_5);
      --  Description collection: Security configuration for CC n of GRTC
      CC_6         : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_6);
      --  Description collection: Security configuration for CC n of GRTC
      CC_7         : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_7);
      --  Description collection: Security configuration for CC n of GRTC
      CC_8         : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_8);
      --  Description collection: Security configuration for CC n of GRTC
      CC_9         : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_9);
      --  Description collection: Security configuration for CC n of GRTC
      CC_10        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_10);
      --  Description collection: Security configuration for CC n of GRTC
      CC_11        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_11);
      --  Description collection: Security configuration for CC n of GRTC
      CC_12        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_12);
      --  Description collection: Security configuration for CC n of GRTC
      CC_13        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_13);
      --  Description collection: Security configuration for CC n of GRTC
      CC_14        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_14);
      --  Description collection: Security configuration for CC n of GRTC
      CC_15        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_15);
      --  Description collection: Security configuration for CC n of GRTC
      CC_16        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_16);
      --  Description collection: Security configuration for CC n of GRTC
      CC_17        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_17);
      --  Description collection: Security configuration for CC n of GRTC
      CC_18        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_18);
      --  Description collection: Security configuration for CC n of GRTC
      CC_19        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_19);
      --  Description collection: Security configuration for CC n of GRTC
      CC_20        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_20);
      --  Description collection: Security configuration for CC n of GRTC
      CC_21        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_21);
      --  Description collection: Security configuration for CC n of GRTC
      CC_22        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_22);
      --  Description collection: Security configuration for CC n of GRTC
      CC_23        : aliased CC_GRTC_Register;
      pragma Volatile_Full_Access (CC_23);
      --  Security Configuration for PWMCONFIG of GRTC
      PWMCONFIG    : aliased PWMCONFIG_GRTC_Register;
      pragma Volatile_Full_Access (PWMCONFIG);
      --  Security configuration for CLKOUT/CLKCFG of GRTC
      CLK          : aliased CLK_GRTC_Register;
      pragma Volatile_Full_Access (CLK);
      --  Security configuration for SYSCOUNTERL/SYSCOUNTERH of GRTC
      SYSCOUNTER   : aliased SYSCOUNTER_GRTC_Register;
      pragma Volatile_Full_Access (SYSCOUNTER);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_0  : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_0);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_1  : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_1);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_2  : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_2);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_3  : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_3);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_4  : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_4);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_5  : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_5);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_6  : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_6);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_7  : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_7);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_8  : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_8);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_9  : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_9);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_10 : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_10);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_11 : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_11);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_12 : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_12);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_13 : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_13);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_14 : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_14);
      --  Description collection: Security configuration for interrupt n of
      --  GRTC
      INTERRUPT_15 : aliased INTERRUPT_GRTC_Register;
      pragma Volatile_Full_Access (INTERRUPT_15);
   end record
     with Size => 1536;

   for SPU_FEATURE_GRTC_Cluster use record
      CC_0         at 16#0# range 0 .. 31;
      CC_1         at 16#4# range 0 .. 31;
      CC_2         at 16#8# range 0 .. 31;
      CC_3         at 16#C# range 0 .. 31;
      CC_4         at 16#10# range 0 .. 31;
      CC_5         at 16#14# range 0 .. 31;
      CC_6         at 16#18# range 0 .. 31;
      CC_7         at 16#1C# range 0 .. 31;
      CC_8         at 16#20# range 0 .. 31;
      CC_9         at 16#24# range 0 .. 31;
      CC_10        at 16#28# range 0 .. 31;
      CC_11        at 16#2C# range 0 .. 31;
      CC_12        at 16#30# range 0 .. 31;
      CC_13        at 16#34# range 0 .. 31;
      CC_14        at 16#38# range 0 .. 31;
      CC_15        at 16#3C# range 0 .. 31;
      CC_16        at 16#40# range 0 .. 31;
      CC_17        at 16#44# range 0 .. 31;
      CC_18        at 16#48# range 0 .. 31;
      CC_19        at 16#4C# range 0 .. 31;
      CC_20        at 16#50# range 0 .. 31;
      CC_21        at 16#54# range 0 .. 31;
      CC_22        at 16#58# range 0 .. 31;
      CC_23        at 16#5C# range 0 .. 31;
      PWMCONFIG    at 16#74# range 0 .. 31;
      CLK          at 16#78# range 0 .. 31;
      SYSCOUNTER   at 16#7C# range 0 .. 31;
      INTERRUPT_0  at 16#80# range 0 .. 31;
      INTERRUPT_1  at 16#84# range 0 .. 31;
      INTERRUPT_2  at 16#88# range 0 .. 31;
      INTERRUPT_3  at 16#8C# range 0 .. 31;
      INTERRUPT_4  at 16#90# range 0 .. 31;
      INTERRUPT_5  at 16#94# range 0 .. 31;
      INTERRUPT_6  at 16#98# range 0 .. 31;
      INTERRUPT_7  at 16#9C# range 0 .. 31;
      INTERRUPT_8  at 16#A0# range 0 .. 31;
      INTERRUPT_9  at 16#A4# range 0 .. 31;
      INTERRUPT_10 at 16#A8# range 0 .. 31;
      INTERRUPT_11 at 16#AC# range 0 .. 31;
      INTERRUPT_12 at 16#B0# range 0 .. 31;
      INTERRUPT_13 at 16#B4# range 0 .. 31;
      INTERRUPT_14 at 16#B8# range 0 .. 31;
      INTERRUPT_15 at 16#BC# range 0 .. 31;
   end record;

   type SPU_FEATURE_Disc is
     (Mode_1,
      Mode_2);

   --  Unspecified
   type SPU_FEATURE_Cluster
     (Discriminent : SPU_FEATURE_Disc := Mode_1)
   is record
      --  Unspecified
      DPPIC  : aliased SPU_FEATURE_DPPIC_Cluster;
      --  Unspecified
      GPIOTE : aliased SPU_FEATURE_GPIOTE_Clusters;
      --  Unspecified
      GRTC   : aliased SPU_FEATURE_GRTC_Cluster;
      case Discriminent is
         when Mode_1 =>
            --  Unspecified
            GPIO : aliased GPIO_Clusters;
         when Mode_2 =>
            --  Unspecified
            CRACEN : aliased CRACEN_Cluster;
      end case;
   end record
     with Unchecked_Union, Size => 15872;

   for SPU_FEATURE_Cluster use record
      DPPIC  at 16#80# range 0 .. 1023;
      GPIOTE at 16#100# range 0 .. 1023;
      GRTC   at 16#700# range 0 .. 1535;
      GPIO   at 16#200# range 0 .. 3071;
      CRACEN at 16#200# range 0 .. 3103;
   end record;

   ------------------------------------------
   -- SPU_PERIPHACCERR cluster's Registers --
   ------------------------------------------

   ------------------------------------
   -- SPU_PERIPH cluster's Registers --
   ------------------------------------

   -------------------------------------
   -- SPU_FEATURE cluster's Registers --
   -------------------------------------

   -------------------------------------------
   -- SPU_FEATURE_DPPIC cluster's Registers --
   -------------------------------------------

   --------------------------------------------
   -- SPU_FEATURE_GPIOTE cluster's Registers --
   --------------------------------------------

   ------------------------------
   -- GPIO cluster's Registers --
   ------------------------------

   --------------------------------
   -- CRACEN cluster's Registers --
   --------------------------------

   ------------------------------------------
   -- SPU_FEATURE_GRTC cluster's Registers --
   ------------------------------------------

   ------------------------------------------
   -- SPU_PERIPHACCERR cluster's Registers --
   ------------------------------------------

   ------------------------------------
   -- SPU_PERIPH cluster's Registers --
   ------------------------------------

   -------------------------------------
   -- SPU_FEATURE cluster's Registers --
   -------------------------------------

   -------------------------------------------
   -- SPU_FEATURE_DPPIC cluster's Registers --
   -------------------------------------------

   --------------------------------------------
   -- SPU_FEATURE_GPIOTE cluster's Registers --
   --------------------------------------------

   ------------------------------
   -- GPIO cluster's Registers --
   ------------------------------

   --------------------------------
   -- CRACEN cluster's Registers --
   --------------------------------

   ------------------------------------------
   -- SPU_FEATURE_GRTC cluster's Registers --
   ------------------------------------------

   ------------------------------------------
   -- SPU_PERIPHACCERR cluster's Registers --
   ------------------------------------------

   ------------------------------------
   -- SPU_PERIPH cluster's Registers --
   ------------------------------------

   -------------------------------------
   -- SPU_FEATURE cluster's Registers --
   -------------------------------------

   -------------------------------------------
   -- SPU_FEATURE_DPPIC cluster's Registers --
   -------------------------------------------

   --------------------------------------------
   -- SPU_FEATURE_GPIOTE cluster's Registers --
   --------------------------------------------

   ------------------------------
   -- GPIO cluster's Registers --
   ------------------------------

   --------------------------------
   -- CRACEN cluster's Registers --
   --------------------------------

   ------------------------------------------
   -- SPU_FEATURE_GRTC cluster's Registers --
   ------------------------------------------

   -----------------
   -- Peripherals --
   -----------------

   --  System protection unit 0
   type SPU_Peripheral is record
      --  A security violation has been detected on one or several peripherals
      EVENTS_PERIPHACCERR : aliased EVENTS_PERIPHACCERR_Register;
      pragma Volatile_Full_Access (EVENTS_PERIPHACCERR);
      --  Enable or disable interrupt
      INTEN               : aliased INTEN_Register;
      pragma Volatile_Full_Access (INTEN);
      --  Enable interrupt
      INTENSET            : aliased INTENSET_Register;
      pragma Volatile_Full_Access (INTENSET);
      --  Disable interrupt
      INTENCLR            : aliased INTENCLR_Register;
      pragma Volatile_Full_Access (INTENCLR);
      --  Pending interrupts
      INTPEND             : aliased INTPEND_Register;
      pragma Volatile_Full_Access (INTPEND);
      --  Unspecified
      PERIPHACCERR        : aliased SPU_PERIPHACCERR_Cluster;
      --  Unspecified
      PERIPH              : aliased SPU_PERIPH_Clusters;
      --  Unspecified
      FEATURE             : aliased SPU_FEATURE_Cluster;
   end record
     with Volatile;

   for SPU_Peripheral use record
      EVENTS_PERIPHACCERR at 16#100# range 0 .. 31;
      INTEN               at 16#300# range 0 .. 31;
      INTENSET            at 16#304# range 0 .. 31;
      INTENCLR            at 16#308# range 0 .. 31;
      INTPEND             at 16#30C# range 0 .. 31;
      PERIPHACCERR        at 16#404# range 0 .. 31;
      PERIPH              at 16#500# range 0 .. 2047;
      FEATURE             at 16#600# range 0 .. 15871;
   end record;

   --  System protection unit 0
   GLOBAL_SPU00_S_Periph : aliased SPU_Peripheral
     with Import, Address => GLOBAL_SPU00_S_Base;

   --  System protection unit 1
   GLOBAL_SPU10_S_Periph : aliased SPU_Peripheral
     with Import, Address => GLOBAL_SPU10_S_Base;

   --  System protection unit 2
   GLOBAL_SPU20_S_Periph : aliased SPU_Peripheral
     with Import, Address => GLOBAL_SPU20_S_Base;

   --  System protection unit 3
   GLOBAL_SPU30_S_Periph : aliased SPU_Peripheral
     with Import, Address => GLOBAL_SPU30_S_Base;

end Interfaces.NRF54.SPU;
