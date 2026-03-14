--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

package Interfaces.NRF54.KMU is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Provision key slot
   type TASKS_PROVISION_TASKS_PROVISION_Field is
     (--  Reset value for the field
      TASKS_PROVISION_TASKS_PROVISION_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_PROVISION_TASKS_PROVISION_Field use
     (TASKS_PROVISION_TASKS_PROVISION_Field_Reset => 0,
      Trigger => 1);

   --  Provision key slot
   type TASKS_PROVISION_Register is record
      --  Write-only. Provision key slot
      TASKS_PROVISION : TASKS_PROVISION_TASKS_PROVISION_Field :=
                         TASKS_PROVISION_TASKS_PROVISION_Field_Reset;
      --  unspecified
      Reserved_1_31   : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_PROVISION_Register use record
      TASKS_PROVISION at 0 range 0 .. 0;
      Reserved_1_31   at 0 range 1 .. 31;
   end record;

   --  Push key slot
   type TASKS_PUSH_TASKS_PUSH_Field is
     (--  Reset value for the field
      TASKS_PUSH_TASKS_PUSH_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_PUSH_TASKS_PUSH_Field use
     (TASKS_PUSH_TASKS_PUSH_Field_Reset => 0,
      Trigger => 1);

   --  Push key slot
   type TASKS_PUSH_Register is record
      --  Write-only. Push key slot
      TASKS_PUSH    : TASKS_PUSH_TASKS_PUSH_Field :=
                       TASKS_PUSH_TASKS_PUSH_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_PUSH_Register use record
      TASKS_PUSH    at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Revoke key slot
   type TASKS_REVOKE_TASKS_REVOKE_Field is
     (--  Reset value for the field
      TASKS_REVOKE_TASKS_REVOKE_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_REVOKE_TASKS_REVOKE_Field use
     (TASKS_REVOKE_TASKS_REVOKE_Field_Reset => 0,
      Trigger => 1);

   --  Revoke key slot
   type TASKS_REVOKE_Register is record
      --  Write-only. Revoke key slot
      TASKS_REVOKE  : TASKS_REVOKE_TASKS_REVOKE_Field :=
                       TASKS_REVOKE_TASKS_REVOKE_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_REVOKE_Register use record
      TASKS_REVOKE  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Read key slot metadata into METADATA register
   type TASKS_READMETADATA_TASKS_READMETADATA_Field is
     (--  Reset value for the field
      TASKS_READMETADATA_TASKS_READMETADATA_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_READMETADATA_TASKS_READMETADATA_Field use
     (TASKS_READMETADATA_TASKS_READMETADATA_Field_Reset => 0,
      Trigger => 1);

   --  Read key slot metadata into METADATA register
   type TASKS_READMETADATA_Register is record
      --  Write-only. Read key slot metadata into METADATA register
      TASKS_READMETADATA : TASKS_READMETADATA_TASKS_READMETADATA_Field :=
                            TASKS_READMETADATA_TASKS_READMETADATA_Field_Reset;
      --  unspecified
      Reserved_1_31      : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_READMETADATA_Register use record
      TASKS_READMETADATA at 0 range 0 .. 0;
      Reserved_1_31      at 0 range 1 .. 31;
   end record;

   --  Block only the PUSH operation of a key slot, preventing the key slot
   --  from being PUSHED until next reset. The task is kept for backwards
   --  compatibility.
   type TASKS_PUSHBLOCK_TASKS_PUSHBLOCK_Field is
     (--  Reset value for the field
      TASKS_PUSHBLOCK_TASKS_PUSHBLOCK_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_PUSHBLOCK_TASKS_PUSHBLOCK_Field use
     (TASKS_PUSHBLOCK_TASKS_PUSHBLOCK_Field_Reset => 0,
      Trigger => 1);

   --  Block only the PUSH operation of a key slot, preventing the key slot
   --  from being PUSHED until next reset. The task is kept for backwards
   --  compatibility.
   type TASKS_PUSHBLOCK_Register is record
      --  Write-only. Block only the PUSH operation of a key slot, preventing
      --  the key slot from being PUSHED until next reset. The task is kept for
      --  backwards compatibility.
      TASKS_PUSHBLOCK : TASKS_PUSHBLOCK_TASKS_PUSHBLOCK_Field :=
                         TASKS_PUSHBLOCK_TASKS_PUSHBLOCK_Field_Reset;
      --  unspecified
      Reserved_1_31   : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_PUSHBLOCK_Register use record
      TASKS_PUSHBLOCK at 0 range 0 .. 0;
      Reserved_1_31   at 0 range 1 .. 31;
   end record;

   --  Key slot successfully provisioned
   type EVENTS_PROVISIONED_EVENTS_PROVISIONED_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_PROVISIONED_EVENTS_PROVISIONED_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  Key slot successfully provisioned
   type EVENTS_PROVISIONED_Register is record
      --  Key slot successfully provisioned
      EVENTS_PROVISIONED : EVENTS_PROVISIONED_EVENTS_PROVISIONED_Field :=
                            Interfaces.NRF54.KMU.NotGenerated;
      --  unspecified
      Reserved_1_31      : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_PROVISIONED_Register use record
      EVENTS_PROVISIONED at 0 range 0 .. 0;
      Reserved_1_31      at 0 range 1 .. 31;
   end record;

   --  Key slot successfully pushed
   type EVENTS_PUSHED_EVENTS_PUSHED_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_PUSHED_EVENTS_PUSHED_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  Key slot successfully pushed
   type EVENTS_PUSHED_Register is record
      --  Key slot successfully pushed
      EVENTS_PUSHED : EVENTS_PUSHED_EVENTS_PUSHED_Field :=
                       Interfaces.NRF54.KMU.NotGenerated;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_PUSHED_Register use record
      EVENTS_PUSHED at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Key slot has been revoked and can no longer be used
   type EVENTS_REVOKED_EVENTS_REVOKED_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_REVOKED_EVENTS_REVOKED_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  Key slot has been revoked and can no longer be used
   type EVENTS_REVOKED_Register is record
      --  Key slot has been revoked and can no longer be used
      EVENTS_REVOKED : EVENTS_REVOKED_EVENTS_REVOKED_Field :=
                        Interfaces.NRF54.KMU.NotGenerated;
      --  unspecified
      Reserved_1_31  : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_REVOKED_Register use record
      EVENTS_REVOKED at 0 range 0 .. 0;
      Reserved_1_31  at 0 range 1 .. 31;
   end record;

   --  Error generated during PROVISION, PUSH, READMETADATA or REVOKE
   --  operations. Triggering the PROVISION, PUSH and REVOKE tasks on a BLOCKED
   --  keyslot will also generate this event.
   type EVENTS_ERROR_EVENTS_ERROR_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_ERROR_EVENTS_ERROR_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  Error generated during PROVISION, PUSH, READMETADATA or REVOKE
   --  operations. Triggering the PROVISION, PUSH and REVOKE tasks on a BLOCKED
   --  keyslot will also generate this event.
   type EVENTS_ERROR_Register is record
      --  Error generated during PROVISION, PUSH, READMETADATA or REVOKE
      --  operations. Triggering the PROVISION, PUSH and REVOKE tasks on a
      --  BLOCKED keyslot will also generate this event.
      EVENTS_ERROR  : EVENTS_ERROR_EVENTS_ERROR_Field :=
                       Interfaces.NRF54.KMU.NotGenerated;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_ERROR_Register use record
      EVENTS_ERROR  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Key slot metadata has been read into METADATA register
   type EVENTS_METADATAREAD_EVENTS_METADATAREAD_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_METADATAREAD_EVENTS_METADATAREAD_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  Key slot metadata has been read into METADATA register
   type EVENTS_METADATAREAD_Register is record
      --  Key slot metadata has been read into METADATA register
      EVENTS_METADATAREAD : EVENTS_METADATAREAD_EVENTS_METADATAREAD_Field :=
                             Interfaces.NRF54.KMU.NotGenerated;
      --  unspecified
      Reserved_1_31       : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_METADATAREAD_Register use record
      EVENTS_METADATAREAD at 0 range 0 .. 0;
      Reserved_1_31       at 0 range 1 .. 31;
   end record;

   --  The PUSHBLOCK operation was successful. The event is kept for backwards
   --  compatibility.
   type EVENTS_PUSHBLOCKED_EVENTS_PUSHBLOCKED_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_PUSHBLOCKED_EVENTS_PUSHBLOCKED_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  The PUSHBLOCK operation was successful. The event is kept for backwards
   --  compatibility.
   type EVENTS_PUSHBLOCKED_Register is record
      --  The PUSHBLOCK operation was successful. The event is kept for
      --  backwards compatibility.
      EVENTS_PUSHBLOCKED : EVENTS_PUSHBLOCKED_EVENTS_PUSHBLOCKED_Field :=
                            Interfaces.NRF54.KMU.NotGenerated;
      --  unspecified
      Reserved_1_31      : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_PUSHBLOCKED_Register use record
      EVENTS_PUSHBLOCKED at 0 range 0 .. 0;
      Reserved_1_31      at 0 range 1 .. 31;
   end record;

   --  KMU status
   type STATUS_STATUS_Field is
     (--  KMU is ready for new operation
      Ready,
      --  KMU is busy, an operation is in progress
      Busy)
     with Size => 1;
   for STATUS_STATUS_Field use
     (Ready => 0,
      Busy => 1);

   --  KMU status register
   type STATUS_Register is record
      --  Read-only. KMU status
      STATUS        : STATUS_STATUS_Field;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for STATUS_Register use record
      STATUS        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype KEYSLOT_ID_Field is Interfaces.NRF54.Byte;

   --  Select key slot to operate on
   type KEYSLOT_Register is record
      --  Select key slot ID to provision, push, read METADATA, revoke or block
      --  when the corresponding task is triggered.
      ID            : KEYSLOT_ID_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.NRF54.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for KEYSLOT_Register use record
      ID            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Key management unit
   type KMU_Peripheral is record
      --  Provision key slot
      TASKS_PROVISION     : aliased TASKS_PROVISION_Register;
      pragma Volatile_Full_Access (TASKS_PROVISION);
      --  Push key slot
      TASKS_PUSH          : aliased TASKS_PUSH_Register;
      pragma Volatile_Full_Access (TASKS_PUSH);
      --  Revoke key slot
      TASKS_REVOKE        : aliased TASKS_REVOKE_Register;
      pragma Volatile_Full_Access (TASKS_REVOKE);
      --  Read key slot metadata into METADATA register
      TASKS_READMETADATA  : aliased TASKS_READMETADATA_Register;
      pragma Volatile_Full_Access (TASKS_READMETADATA);
      --  Block only the PUSH operation of a key slot, preventing the key slot
      --  from being PUSHED until next reset. The task is kept for backwards
      --  compatibility.
      TASKS_PUSHBLOCK     : aliased TASKS_PUSHBLOCK_Register;
      pragma Volatile_Full_Access (TASKS_PUSHBLOCK);
      --  Key slot successfully provisioned
      EVENTS_PROVISIONED  : aliased EVENTS_PROVISIONED_Register;
      pragma Volatile_Full_Access (EVENTS_PROVISIONED);
      --  Key slot successfully pushed
      EVENTS_PUSHED       : aliased EVENTS_PUSHED_Register;
      pragma Volatile_Full_Access (EVENTS_PUSHED);
      --  Key slot has been revoked and can no longer be used
      EVENTS_REVOKED      : aliased EVENTS_REVOKED_Register;
      pragma Volatile_Full_Access (EVENTS_REVOKED);
      --  Error generated during PROVISION, PUSH, READMETADATA or REVOKE
      --  operations. Triggering the PROVISION, PUSH and REVOKE tasks on a
      --  BLOCKED keyslot will also generate this event.
      EVENTS_ERROR        : aliased EVENTS_ERROR_Register;
      pragma Volatile_Full_Access (EVENTS_ERROR);
      --  Key slot metadata has been read into METADATA register
      EVENTS_METADATAREAD : aliased EVENTS_METADATAREAD_Register;
      pragma Volatile_Full_Access (EVENTS_METADATAREAD);
      --  The PUSHBLOCK operation was successful. The event is kept for
      --  backwards compatibility.
      EVENTS_PUSHBLOCKED  : aliased EVENTS_PUSHBLOCKED_Register;
      pragma Volatile_Full_Access (EVENTS_PUSHBLOCKED);
      --  KMU status register
      STATUS              : aliased STATUS_Register;
      pragma Volatile_Full_Access (STATUS);
      --  Select key slot to operate on
      KEYSLOT             : aliased KEYSLOT_Register;
      pragma Volatile_Full_Access (KEYSLOT);
      --  Source address for provisioning
      SRC                 : aliased Interfaces.NRF54.UInt32;
      --  Key slot metadata as read by TASKS_READMETADATA.
      METADATA            : aliased Interfaces.NRF54.UInt32;
   end record
     with Volatile;

   for KMU_Peripheral use record
      TASKS_PROVISION     at 16#0# range 0 .. 31;
      TASKS_PUSH          at 16#4# range 0 .. 31;
      TASKS_REVOKE        at 16#8# range 0 .. 31;
      TASKS_READMETADATA  at 16#C# range 0 .. 31;
      TASKS_PUSHBLOCK     at 16#10# range 0 .. 31;
      EVENTS_PROVISIONED  at 16#100# range 0 .. 31;
      EVENTS_PUSHED       at 16#104# range 0 .. 31;
      EVENTS_REVOKED      at 16#108# range 0 .. 31;
      EVENTS_ERROR        at 16#10C# range 0 .. 31;
      EVENTS_METADATAREAD at 16#110# range 0 .. 31;
      EVENTS_PUSHBLOCKED  at 16#114# range 0 .. 31;
      STATUS              at 16#400# range 0 .. 31;
      KEYSLOT             at 16#500# range 0 .. 31;
      SRC                 at 16#504# range 0 .. 31;
      METADATA            at 16#508# range 0 .. 31;
   end record;

   --  Key management unit
   GLOBAL_KMU_S_Periph : aliased KMU_Peripheral
     with Import, Address => GLOBAL_KMU_S_Base;

end Interfaces.NRF54.KMU;
