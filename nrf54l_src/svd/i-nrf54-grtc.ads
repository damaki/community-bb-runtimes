--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

package Interfaces.NRF54.GRTC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Capture the counter value to CC[n] register
   type TASKS_CAPTURE_TASKS_CAPTURE_Field is
     (--  Reset value for the field
      TASKS_CAPTURE_TASKS_CAPTURE_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_CAPTURE_TASKS_CAPTURE_Field use
     (TASKS_CAPTURE_TASKS_CAPTURE_Field_Reset => 0,
      Trigger => 1);

   --  Description collection: Capture the counter value to CC[n] register
   type TASKS_CAPTURE_Register is record
      --  Write-only. Capture the counter value to CC[n] register
      TASKS_CAPTURE : TASKS_CAPTURE_TASKS_CAPTURE_Field :=
                       TASKS_CAPTURE_TASKS_CAPTURE_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_CAPTURE_Register use record
      TASKS_CAPTURE at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Start the counter
   type TASKS_START_TASKS_START_Field is
     (--  Reset value for the field
      TASKS_START_TASKS_START_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_START_TASKS_START_Field use
     (TASKS_START_TASKS_START_Field_Reset => 0,
      Trigger => 1);

   --  Start the counter
   type TASKS_START_Register is record
      --  Write-only. Start the counter
      TASKS_START   : TASKS_START_TASKS_START_Field :=
                       TASKS_START_TASKS_START_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_START_Register use record
      TASKS_START   at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Stop the counter
   type TASKS_STOP_TASKS_STOP_Field is
     (--  Reset value for the field
      TASKS_STOP_TASKS_STOP_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_STOP_TASKS_STOP_Field use
     (TASKS_STOP_TASKS_STOP_Field_Reset => 0,
      Trigger => 1);

   --  Stop the counter
   type TASKS_STOP_Register is record
      --  Write-only. Stop the counter
      TASKS_STOP    : TASKS_STOP_TASKS_STOP_Field :=
                       TASKS_STOP_TASKS_STOP_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_STOP_Register use record
      TASKS_STOP    at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clear the counter
   type TASKS_CLEAR_TASKS_CLEAR_Field is
     (--  Reset value for the field
      TASKS_CLEAR_TASKS_CLEAR_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_CLEAR_TASKS_CLEAR_Field use
     (TASKS_CLEAR_TASKS_CLEAR_Field_Reset => 0,
      Trigger => 1);

   --  Clear the counter
   type TASKS_CLEAR_Register is record
      --  Write-only. Clear the counter
      TASKS_CLEAR   : TASKS_CLEAR_TASKS_CLEAR_Field :=
                       TASKS_CLEAR_TASKS_CLEAR_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_CLEAR_Register use record
      TASKS_CLEAR   at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Start the PWM
   type TASKS_PWMSTART_TASKS_PWMSTART_Field is
     (--  Reset value for the field
      TASKS_PWMSTART_TASKS_PWMSTART_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_PWMSTART_TASKS_PWMSTART_Field use
     (TASKS_PWMSTART_TASKS_PWMSTART_Field_Reset => 0,
      Trigger => 1);

   --  Start the PWM
   type TASKS_PWMSTART_Register is record
      --  Write-only. Start the PWM
      TASKS_PWMSTART : TASKS_PWMSTART_TASKS_PWMSTART_Field :=
                        TASKS_PWMSTART_TASKS_PWMSTART_Field_Reset;
      --  unspecified
      Reserved_1_31  : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_PWMSTART_Register use record
      TASKS_PWMSTART at 0 range 0 .. 0;
      Reserved_1_31  at 0 range 1 .. 31;
   end record;

   --  Stop the PWM
   type TASKS_PWMSTOP_TASKS_PWMSTOP_Field is
     (--  Reset value for the field
      TASKS_PWMSTOP_TASKS_PWMSTOP_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_PWMSTOP_TASKS_PWMSTOP_Field use
     (TASKS_PWMSTOP_TASKS_PWMSTOP_Field_Reset => 0,
      Trigger => 1);

   --  Stop the PWM
   type TASKS_PWMSTOP_Register is record
      --  Write-only. Stop the PWM
      TASKS_PWMSTOP : TASKS_PWMSTOP_TASKS_PWMSTOP_Field :=
                       TASKS_PWMSTOP_TASKS_PWMSTOP_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_PWMSTOP_Register use record
      TASKS_PWMSTOP at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype SUBSCRIBE_CAPTURE_CHIDX_Field is Interfaces.NRF54.Byte;

   type SUBSCRIBE_CAPTURE_EN_Field is
     (--  Disable subscription
      Disabled,
      --  Enable subscription
      Enabled)
     with Size => 1;
   for SUBSCRIBE_CAPTURE_EN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Description collection: Subscribe configuration for task CAPTURE[n]
   type SUBSCRIBE_CAPTURE_Register is record
      --  DPPI channel that task CAPTURE[n] will subscribe to
      CHIDX         : SUBSCRIBE_CAPTURE_CHIDX_Field := 16#0#;
      --  unspecified
      Reserved_8_30 : Interfaces.NRF54.UInt23 := 16#0#;
      EN            : SUBSCRIBE_CAPTURE_EN_Field :=
                       Interfaces.NRF54.GRTC.Disabled;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUBSCRIBE_CAPTURE_Register use record
      CHIDX         at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      EN            at 0 range 31 .. 31;
   end record;

   --  Compare event on CC[n] match
   type EVENTS_COMPARE_EVENTS_COMPARE_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_COMPARE_EVENTS_COMPARE_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  Description collection: Compare event on CC[n] match
   type EVENTS_COMPARE_Register is record
      --  Compare event on CC[n] match
      EVENTS_COMPARE : EVENTS_COMPARE_EVENTS_COMPARE_Field :=
                        Interfaces.NRF54.GRTC.NotGenerated;
      --  unspecified
      Reserved_1_31  : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_COMPARE_Register use record
      EVENTS_COMPARE at 0 range 0 .. 0;
      Reserved_1_31  at 0 range 1 .. 31;
   end record;

   --  The GRTC low frequency timer is synchronized with the SYSCOUNTER
   type EVENTS_RTCOMPARESYNC_EVENTS_RTCOMPARESYNC_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_RTCOMPARESYNC_EVENTS_RTCOMPARESYNC_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  The GRTC low frequency timer is synchronized with the SYSCOUNTER
   type EVENTS_RTCOMPARESYNC_Register is record
      --  The GRTC low frequency timer is synchronized with the SYSCOUNTER
      EVENTS_RTCOMPARESYNC : EVENTS_RTCOMPARESYNC_EVENTS_RTCOMPARESYNC_Field :=
                              Interfaces.NRF54.GRTC.NotGenerated;
      --  unspecified
      Reserved_1_31        : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_RTCOMPARESYNC_Register use record
      EVENTS_RTCOMPARESYNC at 0 range 0 .. 0;
      Reserved_1_31        at 0 range 1 .. 31;
   end record;

   --  Event on end of each PWM period
   type EVENTS_PWMPERIODEND_EVENTS_PWMPERIODEND_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_PWMPERIODEND_EVENTS_PWMPERIODEND_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  Event on end of each PWM period
   type EVENTS_PWMPERIODEND_Register is record
      --  Event on end of each PWM period
      EVENTS_PWMPERIODEND : EVENTS_PWMPERIODEND_EVENTS_PWMPERIODEND_Field :=
                             Interfaces.NRF54.GRTC.NotGenerated;
      --  unspecified
      Reserved_1_31       : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_PWMPERIODEND_Register use record
      EVENTS_PWMPERIODEND at 0 range 0 .. 0;
      Reserved_1_31       at 0 range 1 .. 31;
   end record;

   --  Event on STATUS.PWM.READY status changed to ready
   type EVENTS_PWMREADY_EVENTS_PWMREADY_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_PWMREADY_EVENTS_PWMREADY_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  Event on STATUS.PWM.READY status changed to ready
   type EVENTS_PWMREADY_Register is record
      --  Event on STATUS.PWM.READY status changed to ready
      EVENTS_PWMREADY : EVENTS_PWMREADY_EVENTS_PWMREADY_Field :=
                         Interfaces.NRF54.GRTC.NotGenerated;
      --  unspecified
      Reserved_1_31   : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_PWMREADY_Register use record
      EVENTS_PWMREADY at 0 range 0 .. 0;
      Reserved_1_31   at 0 range 1 .. 31;
   end record;

   --  Event on STATUS.CLKOUT.READY status changed to ready
   type EVENTS_CLKOUTREADY_EVENTS_CLKOUTREADY_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_CLKOUTREADY_EVENTS_CLKOUTREADY_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  Event on STATUS.CLKOUT.READY status changed to ready
   type EVENTS_CLKOUTREADY_Register is record
      --  Event on STATUS.CLKOUT.READY status changed to ready
      EVENTS_CLKOUTREADY : EVENTS_CLKOUTREADY_EVENTS_CLKOUTREADY_Field :=
                            Interfaces.NRF54.GRTC.NotGenerated;
      --  unspecified
      Reserved_1_31      : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_CLKOUTREADY_Register use record
      EVENTS_CLKOUTREADY at 0 range 0 .. 0;
      Reserved_1_31      at 0 range 1 .. 31;
   end record;

   subtype PUBLISH_COMPARE_CHIDX_Field is Interfaces.NRF54.Byte;

   type PUBLISH_COMPARE_EN_Field is
     (--  Disable publishing
      Disabled,
      --  Enable publishing
      Enabled)
     with Size => 1;
   for PUBLISH_COMPARE_EN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Description collection: Publish configuration for event COMPARE[n]
   type PUBLISH_COMPARE_Register is record
      --  DPPI channel that event COMPARE[n] will publish to
      CHIDX         : PUBLISH_COMPARE_CHIDX_Field := 16#0#;
      --  unspecified
      Reserved_8_30 : Interfaces.NRF54.UInt23 := 16#0#;
      EN            : PUBLISH_COMPARE_EN_Field :=
                       Interfaces.NRF54.GRTC.Disabled;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PUBLISH_COMPARE_Register use record
      CHIDX         at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      EN            at 0 range 31 .. 31;
   end record;

   subtype PUBLISH_PWMREADY_CHIDX_Field is Interfaces.NRF54.Byte;

   type PUBLISH_PWMREADY_EN_Field is
     (--  Disable publishing
      Disabled,
      --  Enable publishing
      Enabled)
     with Size => 1;
   for PUBLISH_PWMREADY_EN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Publish configuration for event PWMREADY
   type PUBLISH_PWMREADY_Register is record
      --  DPPI channel that event PWMREADY will publish to
      CHIDX         : PUBLISH_PWMREADY_CHIDX_Field := 16#0#;
      --  unspecified
      Reserved_8_30 : Interfaces.NRF54.UInt23 := 16#0#;
      EN            : PUBLISH_PWMREADY_EN_Field :=
                       Interfaces.NRF54.GRTC.Disabled;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PUBLISH_PWMREADY_Register use record
      CHIDX         at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      EN            at 0 range 31 .. 31;
   end record;

   subtype PUBLISH_CLKOUTREADY_CHIDX_Field is Interfaces.NRF54.Byte;

   type PUBLISH_CLKOUTREADY_EN_Field is
     (--  Disable publishing
      Disabled,
      --  Enable publishing
      Enabled)
     with Size => 1;
   for PUBLISH_CLKOUTREADY_EN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Publish configuration for event CLKOUTREADY
   type PUBLISH_CLKOUTREADY_Register is record
      --  DPPI channel that event CLKOUTREADY will publish to
      CHIDX         : PUBLISH_CLKOUTREADY_CHIDX_Field := 16#0#;
      --  unspecified
      Reserved_8_30 : Interfaces.NRF54.UInt23 := 16#0#;
      EN            : PUBLISH_CLKOUTREADY_EN_Field :=
                       Interfaces.NRF54.GRTC.Disabled;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PUBLISH_CLKOUTREADY_Register use record
      CHIDX         at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      EN            at 0 range 31 .. 31;
   end record;

   --  Shortcut between event RTCOMPARE and task CLEAR
   type SHORTS_RTCOMPARE_CLEAR_Field is
     (--  Disable shortcut
      Disabled,
      --  Enable shortcut
      Enabled)
     with Size => 1;
   for SHORTS_RTCOMPARE_CLEAR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcuts between local events and tasks
   type SHORTS_Register is record
      --  Shortcut between event RTCOMPARE and task CLEAR
      RTCOMPARE_CLEAR : SHORTS_RTCOMPARE_CLEAR_Field :=
                         Interfaces.NRF54.GRTC.Disabled;
      --  unspecified
      Reserved_1_31   : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SHORTS_Register use record
      RTCOMPARE_CLEAR at 0 range 0 .. 0;
      Reserved_1_31   at 0 range 1 .. 31;
   end record;

   --  Enable or disable interrupt for event COMPARE[0]
   type INTEN0_COMPARE0_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN0_COMPARE0_Field use
     (Disabled => 0,
      Enabled => 1);

   --  INTEN_COMPARE array
   type INTEN_COMPARE_Field_Array is array (0 .. 11) of INTEN0_COMPARE0_Field
     with Component_Size => 1, Size => 12;

   --  Type definition for INTEN_COMPARE
   type INTEN_COMPARE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPARE as a value
            Val : Interfaces.NRF54.UInt12;
         when True =>
            --  COMPARE as an array
            Arr : INTEN_COMPARE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for INTEN_COMPARE_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Enable or disable interrupt for event RTCOMPARESYNC
   type INTEN0_RTCOMPARESYNC_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN0_RTCOMPARESYNC_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt for event PWMPERIODEND
   type INTEN0_PWMPERIODEND_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN0_PWMPERIODEND_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt for event PWMREADY
   type INTEN0_PWMREADY_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN0_PWMREADY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt for event CLKOUTREADY
   type INTEN0_CLKOUTREADY_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN0_CLKOUTREADY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt
   type INTEN_Register is record
      --  Enable or disable interrupt for event COMPARE[0]
      COMPARE        : INTEN_COMPARE_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_24 : Interfaces.NRF54.UInt13 := 16#0#;
      --  Enable or disable interrupt for event RTCOMPARESYNC
      RTCOMPARESYNC  : INTEN0_RTCOMPARESYNC_Field :=
                        Interfaces.NRF54.GRTC.Disabled;
      --  unspecified
      Reserved_26_26 : Interfaces.NRF54.Bit := 16#0#;
      --  Enable or disable interrupt for event PWMPERIODEND
      PWMPERIODEND   : INTEN0_PWMPERIODEND_Field :=
                        Interfaces.NRF54.GRTC.Disabled;
      --  unspecified
      Reserved_28_28 : Interfaces.NRF54.Bit := 16#0#;
      --  Enable or disable interrupt for event PWMREADY
      PWMREADY       : INTEN0_PWMREADY_Field :=
                        Interfaces.NRF54.GRTC.Disabled;
      --  Enable or disable interrupt for event CLKOUTREADY
      CLKOUTREADY    : INTEN0_CLKOUTREADY_Field :=
                        Interfaces.NRF54.GRTC.Disabled;
      --  unspecified
      Reserved_31_31 : Interfaces.NRF54.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTEN_Register use record
      COMPARE        at 0 range 0 .. 11;
      Reserved_12_24 at 0 range 12 .. 24;
      RTCOMPARESYNC  at 0 range 25 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      PWMPERIODEND   at 0 range 27 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      PWMREADY       at 0 range 29 .. 29;
      CLKOUTREADY    at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  Write '1' to enable interrupt for event COMPARE[0]
   type INTENSET0_COMPARE0_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET0_COMPARE0_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event COMPARE[0]
   type INTENSET0_COMPARE0_Field_1 is
     (--  Reset value for the field
      INTENSET0_COMPARE0_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET0_COMPARE0_Field_1 use
     (INTENSET0_COMPARE0_Field_Reset => 0,
      Set => 1);

   --  INTENSET_COMPARE array
   type INTENSET_COMPARE_Field_Array is array (0 .. 11)
     of INTENSET0_COMPARE0_Field_1
     with Component_Size => 1, Size => 12;

   --  Type definition for INTENSET_COMPARE
   type INTENSET_COMPARE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPARE as a value
            Val : Interfaces.NRF54.UInt12;
         when True =>
            --  COMPARE as an array
            Arr : INTENSET_COMPARE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for INTENSET_COMPARE_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Write '1' to enable interrupt for event RTCOMPARESYNC
   type INTENSET0_RTCOMPARESYNC_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET0_RTCOMPARESYNC_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event RTCOMPARESYNC
   type INTENSET0_RTCOMPARESYNC_Field_1 is
     (--  Reset value for the field
      INTENSET0_RTCOMPARESYNC_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET0_RTCOMPARESYNC_Field_1 use
     (INTENSET0_RTCOMPARESYNC_Field_Reset => 0,
      Set => 1);

   --  Write '1' to enable interrupt for event PWMPERIODEND
   type INTENSET0_PWMPERIODEND_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET0_PWMPERIODEND_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event PWMPERIODEND
   type INTENSET0_PWMPERIODEND_Field_1 is
     (--  Reset value for the field
      INTENSET0_PWMPERIODEND_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET0_PWMPERIODEND_Field_1 use
     (INTENSET0_PWMPERIODEND_Field_Reset => 0,
      Set => 1);

   --  Write '1' to enable interrupt for event PWMREADY
   type INTENSET0_PWMREADY_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET0_PWMREADY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event PWMREADY
   type INTENSET0_PWMREADY_Field_1 is
     (--  Reset value for the field
      INTENSET0_PWMREADY_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET0_PWMREADY_Field_1 use
     (INTENSET0_PWMREADY_Field_Reset => 0,
      Set => 1);

   --  Write '1' to enable interrupt for event CLKOUTREADY
   type INTENSET0_CLKOUTREADY_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET0_CLKOUTREADY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event CLKOUTREADY
   type INTENSET0_CLKOUTREADY_Field_1 is
     (--  Reset value for the field
      INTENSET0_CLKOUTREADY_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET0_CLKOUTREADY_Field_1 use
     (INTENSET0_CLKOUTREADY_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt
   type INTENSET_Register is record
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event COMPARE[0]
      COMPARE        : INTENSET_COMPARE_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_24 : Interfaces.NRF54.UInt13 := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event RTCOMPARESYNC
      RTCOMPARESYNC  : INTENSET0_RTCOMPARESYNC_Field_1 :=
                        INTENSET0_RTCOMPARESYNC_Field_Reset;
      --  unspecified
      Reserved_26_26 : Interfaces.NRF54.Bit := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event PWMPERIODEND
      PWMPERIODEND   : INTENSET0_PWMPERIODEND_Field_1 :=
                        INTENSET0_PWMPERIODEND_Field_Reset;
      --  unspecified
      Reserved_28_28 : Interfaces.NRF54.Bit := 16#0#;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event PWMREADY
      PWMREADY       : INTENSET0_PWMREADY_Field_1 :=
                        INTENSET0_PWMREADY_Field_Reset;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event CLKOUTREADY
      CLKOUTREADY    : INTENSET0_CLKOUTREADY_Field_1 :=
                        INTENSET0_CLKOUTREADY_Field_Reset;
      --  unspecified
      Reserved_31_31 : Interfaces.NRF54.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      COMPARE        at 0 range 0 .. 11;
      Reserved_12_24 at 0 range 12 .. 24;
      RTCOMPARESYNC  at 0 range 25 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      PWMPERIODEND   at 0 range 27 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      PWMREADY       at 0 range 29 .. 29;
      CLKOUTREADY    at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  Write '1' to disable interrupt for event COMPARE[0]
   type INTENCLR0_COMPARE0_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR0_COMPARE0_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event COMPARE[0]
   type INTENCLR0_COMPARE0_Field_1 is
     (--  Reset value for the field
      INTENCLR0_COMPARE0_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR0_COMPARE0_Field_1 use
     (INTENCLR0_COMPARE0_Field_Reset => 0,
      Clear => 1);

   --  INTENCLR_COMPARE array
   type INTENCLR_COMPARE_Field_Array is array (0 .. 11)
     of INTENCLR0_COMPARE0_Field_1
     with Component_Size => 1, Size => 12;

   --  Type definition for INTENCLR_COMPARE
   type INTENCLR_COMPARE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPARE as a value
            Val : Interfaces.NRF54.UInt12;
         when True =>
            --  COMPARE as an array
            Arr : INTENCLR_COMPARE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for INTENCLR_COMPARE_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Write '1' to disable interrupt for event RTCOMPARESYNC
   type INTENCLR0_RTCOMPARESYNC_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR0_RTCOMPARESYNC_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event RTCOMPARESYNC
   type INTENCLR0_RTCOMPARESYNC_Field_1 is
     (--  Reset value for the field
      INTENCLR0_RTCOMPARESYNC_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR0_RTCOMPARESYNC_Field_1 use
     (INTENCLR0_RTCOMPARESYNC_Field_Reset => 0,
      Clear => 1);

   --  Write '1' to disable interrupt for event PWMPERIODEND
   type INTENCLR0_PWMPERIODEND_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR0_PWMPERIODEND_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event PWMPERIODEND
   type INTENCLR0_PWMPERIODEND_Field_1 is
     (--  Reset value for the field
      INTENCLR0_PWMPERIODEND_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR0_PWMPERIODEND_Field_1 use
     (INTENCLR0_PWMPERIODEND_Field_Reset => 0,
      Clear => 1);

   --  Write '1' to disable interrupt for event PWMREADY
   type INTENCLR0_PWMREADY_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR0_PWMREADY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event PWMREADY
   type INTENCLR0_PWMREADY_Field_1 is
     (--  Reset value for the field
      INTENCLR0_PWMREADY_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR0_PWMREADY_Field_1 use
     (INTENCLR0_PWMREADY_Field_Reset => 0,
      Clear => 1);

   --  Write '1' to disable interrupt for event CLKOUTREADY
   type INTENCLR0_CLKOUTREADY_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR0_CLKOUTREADY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event CLKOUTREADY
   type INTENCLR0_CLKOUTREADY_Field_1 is
     (--  Reset value for the field
      INTENCLR0_CLKOUTREADY_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR0_CLKOUTREADY_Field_1 use
     (INTENCLR0_CLKOUTREADY_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt
   type INTENCLR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event COMPARE[0]
      COMPARE        : INTENCLR_COMPARE_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_24 : Interfaces.NRF54.UInt13 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event RTCOMPARESYNC
      RTCOMPARESYNC  : INTENCLR0_RTCOMPARESYNC_Field_1 :=
                        INTENCLR0_RTCOMPARESYNC_Field_Reset;
      --  unspecified
      Reserved_26_26 : Interfaces.NRF54.Bit := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event PWMPERIODEND
      PWMPERIODEND   : INTENCLR0_PWMPERIODEND_Field_1 :=
                        INTENCLR0_PWMPERIODEND_Field_Reset;
      --  unspecified
      Reserved_28_28 : Interfaces.NRF54.Bit := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event PWMREADY
      PWMREADY       : INTENCLR0_PWMREADY_Field_1 :=
                        INTENCLR0_PWMREADY_Field_Reset;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event CLKOUTREADY
      CLKOUTREADY    : INTENCLR0_CLKOUTREADY_Field_1 :=
                        INTENCLR0_CLKOUTREADY_Field_Reset;
      --  unspecified
      Reserved_31_31 : Interfaces.NRF54.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      COMPARE        at 0 range 0 .. 11;
      Reserved_12_24 at 0 range 12 .. 24;
      RTCOMPARESYNC  at 0 range 25 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      PWMPERIODEND   at 0 range 27 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      PWMREADY       at 0 range 29 .. 29;
      CLKOUTREADY    at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  Read pending status of interrupt for event COMPARE[0]
   type INTPEND0_COMPARE0_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND0_COMPARE0_Field use
     (NotPending => 0,
      Pending => 1);

   --  INTPEND_COMPARE array
   type INTPEND_COMPARE_Field_Array is array (0 .. 11)
     of INTPEND0_COMPARE0_Field
     with Component_Size => 1, Size => 12;

   --  Type definition for INTPEND_COMPARE
   type INTPEND_COMPARE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPARE as a value
            Val : Interfaces.NRF54.UInt12;
         when True =>
            --  COMPARE as an array
            Arr : INTPEND_COMPARE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for INTPEND_COMPARE_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Read pending status of interrupt for event RTCOMPARESYNC
   type INTPEND0_RTCOMPARESYNC_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND0_RTCOMPARESYNC_Field use
     (NotPending => 0,
      Pending => 1);

   --  Read pending status of interrupt for event PWMPERIODEND
   type INTPEND0_PWMPERIODEND_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND0_PWMPERIODEND_Field use
     (NotPending => 0,
      Pending => 1);

   --  Read pending status of interrupt for event PWMREADY
   type INTPEND0_PWMREADY_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND0_PWMREADY_Field use
     (NotPending => 0,
      Pending => 1);

   --  Read pending status of interrupt for event CLKOUTREADY
   type INTPEND0_CLKOUTREADY_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND0_CLKOUTREADY_Field use
     (NotPending => 0,
      Pending => 1);

   --  Pending interrupts
   type INTPEND_Register is record
      --  Read-only. Read pending status of interrupt for event COMPARE[0]
      COMPARE        : INTPEND_COMPARE_Field;
      --  unspecified
      Reserved_12_24 : Interfaces.NRF54.UInt13;
      --  Read-only. Read pending status of interrupt for event RTCOMPARESYNC
      RTCOMPARESYNC  : INTPEND0_RTCOMPARESYNC_Field;
      --  unspecified
      Reserved_26_26 : Interfaces.NRF54.Bit;
      --  Read-only. Read pending status of interrupt for event PWMPERIODEND
      PWMPERIODEND   : INTPEND0_PWMPERIODEND_Field;
      --  unspecified
      Reserved_28_28 : Interfaces.NRF54.Bit;
      --  Read-only. Read pending status of interrupt for event PWMREADY
      PWMREADY       : INTPEND0_PWMREADY_Field;
      --  Read-only. Read pending status of interrupt for event CLKOUTREADY
      CLKOUTREADY    : INTPEND0_CLKOUTREADY_Field;
      --  unspecified
      Reserved_31_31 : Interfaces.NRF54.Bit;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTPEND_Register use record
      COMPARE        at 0 range 0 .. 11;
      Reserved_12_24 at 0 range 12 .. 24;
      RTCOMPARESYNC  at 0 range 25 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      PWMPERIODEND   at 0 range 27 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      PWMREADY       at 0 range 29 .. 29;
      CLKOUTREADY    at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  Enable or disable event routing for event PWMPERIODEND
   type EVTEN_PWMPERIODEND_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for EVTEN_PWMPERIODEND_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable event routing
   type EVTEN_Register is record
      --  unspecified
      Reserved_0_26  : Interfaces.NRF54.UInt27 := 16#0#;
      --  Enable or disable event routing for event PWMPERIODEND
      PWMPERIODEND   : EVTEN_PWMPERIODEND_Field :=
                        Interfaces.NRF54.GRTC.Disabled;
      --  unspecified
      Reserved_28_31 : Interfaces.NRF54.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVTEN_Register use record
      Reserved_0_26  at 0 range 0 .. 26;
      PWMPERIODEND   at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  Write '1' to enable event routing for event PWMPERIODEND
   type EVTENSET_PWMPERIODEND_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for EVTENSET_PWMPERIODEND_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable event routing for event PWMPERIODEND
   type EVTENSET_PWMPERIODEND_Field_1 is
     (--  Reset value for the field
      EVTENSET_PWMPERIODEND_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for EVTENSET_PWMPERIODEND_Field_1 use
     (EVTENSET_PWMPERIODEND_Field_Reset => 0,
      Set => 1);

   --  Enable event routing
   type EVTENSET_Register is record
      --  unspecified
      Reserved_0_26  : Interfaces.NRF54.UInt27 := 16#0#;
      --  Write '1' to enable event routing for event PWMPERIODEND
      PWMPERIODEND   : EVTENSET_PWMPERIODEND_Field_1 :=
                        EVTENSET_PWMPERIODEND_Field_Reset;
      --  unspecified
      Reserved_28_31 : Interfaces.NRF54.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVTENSET_Register use record
      Reserved_0_26  at 0 range 0 .. 26;
      PWMPERIODEND   at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  Write '1' to disable event routing for event PWMPERIODEND
   type EVTENCLR_PWMPERIODEND_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for EVTENCLR_PWMPERIODEND_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable event routing for event PWMPERIODEND
   type EVTENCLR_PWMPERIODEND_Field_1 is
     (--  Reset value for the field
      EVTENCLR_PWMPERIODEND_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for EVTENCLR_PWMPERIODEND_Field_1 use
     (EVTENCLR_PWMPERIODEND_Field_Reset => 0,
      Clear => 1);

   --  Disable event routing
   type EVTENCLR_Register is record
      --  unspecified
      Reserved_0_26  : Interfaces.NRF54.UInt27 := 16#0#;
      --  Write '1' to disable event routing for event PWMPERIODEND
      PWMPERIODEND   : EVTENCLR_PWMPERIODEND_Field_1 :=
                        EVTENCLR_PWMPERIODEND_Field_Reset;
      --  unspecified
      Reserved_28_31 : Interfaces.NRF54.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVTENCLR_Register use record
      Reserved_0_26  at 0 range 0 .. 26;
      PWMPERIODEND   at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  Automatic enable to keep the SYSCOUNTER active.
   type MODE_AUTOEN_Field is
     (--  Default configuration to keep the SYSCOUNTER active.
      Default,
      --  In addition to the above mode, any local CPU that is not sleeping keep the
--  SYSCOUNTER active.
      CpuActive)
     with Size => 1;
   for MODE_AUTOEN_Field use
     (Default => 0,
      CpuActive => 1);

   --  Enable the SYSCOUNTER
   type MODE_SYSCOUNTEREN_Field is
     (--  SYSCOUNTER disabled
      Disabled,
      --  SYSCOUNTER enabled
      Enabled)
     with Size => 1;
   for MODE_SYSCOUNTEREN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Counter mode selection
   type MODE_Register is record
      --  Automatic enable to keep the SYSCOUNTER active.
      AUTOEN        : MODE_AUTOEN_Field := Interfaces.NRF54.GRTC.Default;
      --  Enable the SYSCOUNTER
      SYSCOUNTEREN  : MODE_SYSCOUNTEREN_Field :=
                       Interfaces.NRF54.GRTC.Disabled;
      --  unspecified
      Reserved_2_31 : Interfaces.NRF54.UInt30 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for MODE_Register use record
      AUTOEN        at 0 range 0 .. 0;
      SYSCOUNTEREN  at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   ---------------------------------
   -- GRTC_CC cluster's Registers --
   ---------------------------------

   subtype CCH_CC_CCH_Field is Interfaces.NRF54.UInt20;

   --  Description cluster: The higher 32-bits of Capture/Compare register
   --  CC[n]
   type CCH_CC_Register is record
      --  Capture/Compare high value in 1 us
      CCH            : CCH_CC_CCH_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : Interfaces.NRF54.UInt12 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CCH_CC_Register use record
      CCH            at 0 range 0 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype CCADD_CC_VALUE_Field is Interfaces.NRF54.UInt31;

   --  Configure the Capture/Compare register
   type CCADD_REFERENCE_Field is
     (--  Adds SYSCOUNTER value.
      SYSCOUNTER,
      --  Adds CC value.
      CC)
     with Size => 1;
   for CCADD_REFERENCE_Field use
     (SYSCOUNTER => 0,
      CC => 1);

   --  Description cluster: Count to add to CC[n] when this register is
   --  written.
   type CCADD_CC_Register is record
      --  Write-only. Count to add to CC[n]
      VALUE     : CCADD_CC_VALUE_Field := 16#0#;
      --  Write-only. Configure the Capture/Compare register
      REFERENCE : CCADD_REFERENCE_Field := Interfaces.NRF54.GRTC.SYSCOUNTER;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CCADD_CC_Register use record
      VALUE     at 0 range 0 .. 30;
      REFERENCE at 0 range 31 .. 31;
   end record;

   --  Configure the Capture/Compare register
   type CCEN_ACTIVE_Field is
     (--  Capture/Compare register CC[n] Disabled.
      Disable,
      --  Capture/Compare register CC[n] enabled.
      Enable)
     with Size => 1;
   for CCEN_ACTIVE_Field use
     (Disable => 0,
      Enable => 1);

   --  Description cluster: Configure Capture/Compare register CC[n]
   type CCEN_CC_Register is record
      --  Configure the Capture/Compare register
      ACTIVE        : CCEN_ACTIVE_Field := Interfaces.NRF54.GRTC.Disable;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CCEN_CC_Register use record
      ACTIVE        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Unspecified
   type GRTC_CC_Cluster is record
      --  Description cluster: The lower 32-bits of Capture/Compare register
      --  CC[n]
      CCL   : aliased Interfaces.NRF54.UInt32;
      --  Description cluster: The higher 32-bits of Capture/Compare register
      --  CC[n]
      CCH   : aliased CCH_CC_Register;
      pragma Volatile_Full_Access (CCH);
      --  Description cluster: Count to add to CC[n] when this register is
      --  written.
      CCADD : aliased CCADD_CC_Register;
      pragma Volatile_Full_Access (CCADD);
      --  Description cluster: Configure Capture/Compare register CC[n]
      CCEN  : aliased CCEN_CC_Register;
      pragma Volatile_Full_Access (CCEN);
   end record
     with Size => 128;

   for GRTC_CC_Cluster use record
      CCL   at 16#0# range 0 .. 31;
      CCH   at 16#4# range 0 .. 31;
      CCADD at 16#8# range 0 .. 31;
      CCEN  at 16#C# range 0 .. 31;
   end record;

   --  Unspecified
   type GRTC_CC_Clusters is array (0 .. 11) of GRTC_CC_Cluster;

   subtype TIMEOUT_VALUE_Field is Interfaces.NRF54.UInt16;

   --  Timeout after all CPUs gone into sleep state to stop the SYSCOUNTER
   type TIMEOUT_Register is record
      --  Number of 32Ki cycles
      VALUE          : TIMEOUT_VALUE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.NRF54.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TIMEOUT_Register use record
      VALUE          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype INTERVAL_VALUE_Field is Interfaces.NRF54.UInt16;

   --  Count to add to CC[0] when the event EVENTS_COMPARE[0] triggers.
   type INTERVAL_Register is record
      --  Count to add to CC[0]
      VALUE          : INTERVAL_VALUE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.NRF54.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTERVAL_Register use record
      VALUE          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype WAKETIME_VALUE_Field is Interfaces.NRF54.Byte;

   --  GRTC wake up time.
   type WAKETIME_Register is record
      --  Number of LFCLK clock cycles to wake up before the next scheduled
      --  EVENTS_COMPARE event
      VALUE         : WAKETIME_VALUE_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : Interfaces.NRF54.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WAKETIME_Register use record
      VALUE         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------------------------
   -- GRTC_STATUS cluster's Registers --
   -------------------------------------

   --  Low frequency timer is ready or busy.
   type LFTIMER_READY_Field is
     (--  Busy
      Busy,
      --  Ready
      Ready)
     with Size => 1;
   for LFTIMER_READY_Field use
     (Busy => 0,
      Ready => 1);

   --  Low frequency timer status.
   type LFTIMER_STATUS_Register is record
      --  Read-only. Low frequency timer is ready or busy.
      READY         : LFTIMER_READY_Field;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for LFTIMER_STATUS_Register use record
      READY         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  PWM is ready or busy.
   type PWM_READY_Field is
     (--  Busy
      Busy,
      --  Ready
      Ready)
     with Size => 1;
   for PWM_READY_Field use
     (Busy => 0,
      Ready => 1);

   --  PWM status.
   type PWM_STATUS_Register is record
      --  Read-only. PWM is ready or busy.
      READY         : PWM_READY_Field;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_STATUS_Register use record
      READY         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  CLKOUT is ready or busy.
   type CLKOUT_READY_Field is
     (--  Busy
      Busy,
      --  Ready
      Ready)
     with Size => 1;
   for CLKOUT_READY_Field use
     (Busy => 0,
      Ready => 1);

   --  CLKOUT configuration status.
   type CLKOUT_STATUS_Register is record
      --  Read-only. CLKOUT is ready or busy.
      READY         : CLKOUT_READY_Field;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CLKOUT_STATUS_Register use record
      READY         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Unspecified
   type GRTC_STATUS_Cluster is record
      --  Low frequency timer status.
      LFTIMER : aliased LFTIMER_STATUS_Register;
      pragma Volatile_Full_Access (LFTIMER);
      --  PWM status.
      PWM     : aliased PWM_STATUS_Register;
      pragma Volatile_Full_Access (PWM);
      --  CLKOUT configuration status.
      CLKOUT  : aliased CLKOUT_STATUS_Register;
      pragma Volatile_Full_Access (CLKOUT);
   end record
     with Size => 96;

   for GRTC_STATUS_Cluster use record
      LFTIMER at 16#0# range 0 .. 31;
      PWM     at 16#4# range 0 .. 31;
      CLKOUT  at 16#8# range 0 .. 31;
   end record;

   subtype PWMCONFIG_COMPAREVALUE_Field is Interfaces.NRF54.Byte;

   --  PWM configuration.
   type PWMCONFIG_Register is record
      --  The PWM compare value
      COMPAREVALUE  : PWMCONFIG_COMPAREVALUE_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.NRF54.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWMCONFIG_Register use record
      COMPAREVALUE  at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Enable 32Ki clock output on pin
   type CLKOUT_CLKOUT32K_Field is
     (--  Disabled
      Disabled,
      --  Enabled
      Enabled)
     with Size => 1;
   for CLKOUT_CLKOUT32K_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable fast clock output on pin
   type CLKOUT_CLKOUTFAST_Field is
     (--  Disabled
      Disabled,
      --  Enabled
      Enabled)
     with Size => 1;
   for CLKOUT_CLKOUTFAST_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Configuration of clock output
   type CLKOUT_Register is record
      --  Enable 32Ki clock output on pin
      CLKOUT32K     : CLKOUT_CLKOUT32K_Field :=
                       Interfaces.NRF54.GRTC.Disabled;
      --  Enable fast clock output on pin
      CLKOUTFAST    : CLKOUT_CLKOUTFAST_Field :=
                       Interfaces.NRF54.GRTC.Disabled;
      --  unspecified
      Reserved_2_31 : Interfaces.NRF54.UInt30 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CLKOUT_Register use record
      CLKOUT32K     at 0 range 0 .. 0;
      CLKOUTFAST    at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype CLKCFG_CLKFASTDIV_Field is Interfaces.NRF54.Byte;

   --  GRTC LFCLK clock source selection
   type CLKCFG_CLKSEL_Field is
     (--  GRTC LFCLK clock source is LFXO
      LFXO,
      --  GRTC LFCLK clock source is system LFCLK
      SystemLFCLK,
      --  GRTC LFCLK clock source is LFLPRC
      LFLPRC)
     with Size => 2;
   for CLKCFG_CLKSEL_Field use
     (LFXO => 0,
      SystemLFCLK => 1,
      LFLPRC => 2);

   --  Clock Configuration
   type CLKCFG_Register is record
      --  Fast clock divisor value of clock output
      CLKFASTDIV     : CLKCFG_CLKFASTDIV_Field := 16#1#;
      --  unspecified
      Reserved_8_15  : Interfaces.NRF54.Byte := 16#0#;
      --  Write-only. GRTC LFCLK clock source selection
      CLKSEL         : CLKCFG_CLKSEL_Field :=
                        Interfaces.NRF54.GRTC.SystemLFCLK;
      --  unspecified
      Reserved_18_31 : Interfaces.NRF54.UInt14 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CLKCFG_Register use record
      CLKFASTDIV     at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      CLKSEL         at 0 range 16 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   -----------------------------------------
   -- GRTC_SYSCOUNTER cluster's Registers --
   -----------------------------------------

   subtype SYSCOUNTERH_SYSCOUNTER_VALUE_Field is Interfaces.NRF54.UInt20;

   --  SYSCOUNTER busy status
   type SYSCOUNTERH_BUSY_Field is
     (--  SYSCOUNTER is ready for read
      Ready,
      --  SYSCOUNTER is busy, so not ready for read (value returned in the VALUE
--  field of this register is not valid)
      Busy)
     with Size => 1;
   for SYSCOUNTERH_BUSY_Field use
     (Ready => 0,
      Busy => 1);

   --  The SYSCOUNTERL overflow indication after reading it.
   type SYSCOUNTERH_OVERFLOW_Field is
     (--  SYSCOUNTERL is not overflown
      NoOverflow,
      --  SYSCOUNTERL overflown
      Overflow)
     with Size => 1;
   for SYSCOUNTERH_OVERFLOW_Field use
     (NoOverflow => 0,
      Overflow => 1);

   --  Description cluster: The higher 20-bits of the SYSCOUNTER for index [n]
   type SYSCOUNTERH_SYSCOUNTER_Register is record
      --  Read-only. The higher 20-bits of the SYSCOUNTER value.
      VALUE          : SYSCOUNTERH_SYSCOUNTER_VALUE_Field;
      --  unspecified
      Reserved_20_29 : Interfaces.NRF54.UInt10;
      --  Read-only. SYSCOUNTER busy status
      BUSY           : SYSCOUNTERH_BUSY_Field;
      --  Read-only. The SYSCOUNTERL overflow indication after reading it.
      OVERFLOW       : SYSCOUNTERH_OVERFLOW_Field;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SYSCOUNTERH_SYSCOUNTER_Register use record
      VALUE          at 0 range 0 .. 19;
      Reserved_20_29 at 0 range 20 .. 29;
      BUSY           at 0 range 30 .. 30;
      OVERFLOW       at 0 range 31 .. 31;
   end record;

   --  Keep SYSCOUNTER in active state
   type ACTIVE_ACTIVE_Field is
     (--  Allow SYSCOUNTER to go to sleep
      NotActive,
      --  Keep SYSCOUNTER active
      Active)
     with Size => 1;
   for ACTIVE_ACTIVE_Field use
     (NotActive => 0,
      Active => 1);

   --  Description cluster: Request to keep the SYSCOUNTER in the active state
   --  and prevent going to sleep for index [n]
   type ACTIVE_SYSCOUNTER_Register is record
      --  Keep SYSCOUNTER in active state
      ACTIVE        : ACTIVE_ACTIVE_Field := Interfaces.NRF54.GRTC.NotActive;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ACTIVE_SYSCOUNTER_Register use record
      ACTIVE        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Unspecified
   type GRTC_SYSCOUNTER_Cluster is record
      --  Description cluster: The lower 32-bits of the SYSCOUNTER for index
      --  [n]
      SYSCOUNTERL : aliased Interfaces.NRF54.UInt32;
      --  Description cluster: The higher 20-bits of the SYSCOUNTER for index
      --  [n]
      SYSCOUNTERH : aliased SYSCOUNTERH_SYSCOUNTER_Register;
      pragma Volatile_Full_Access (SYSCOUNTERH);
      --  Description cluster: Request to keep the SYSCOUNTER in the active
      --  state and prevent going to sleep for index [n]
      ACTIVE      : aliased ACTIVE_SYSCOUNTER_Register;
      pragma Volatile_Full_Access (ACTIVE);
      RESERVED    : aliased Interfaces.NRF54.UInt32;
   end record
     with Size => 128;

   for GRTC_SYSCOUNTER_Cluster use record
      SYSCOUNTERL at 16#0# range 0 .. 31;
      SYSCOUNTERH at 16#4# range 0 .. 31;
      ACTIVE      at 16#8# range 0 .. 31;
      RESERVED    at 16#C# range 0 .. 31;
   end record;

   --  Unspecified
   type GRTC_SYSCOUNTER_Clusters is array (0 .. 3) of GRTC_SYSCOUNTER_Cluster;

   ---------------------------------
   -- GRTC_CC cluster's Registers --
   ---------------------------------

   -------------------------------------
   -- GRTC_STATUS cluster's Registers --
   -------------------------------------

   -----------------------------------------
   -- GRTC_SYSCOUNTER cluster's Registers --
   -----------------------------------------

   -----------------
   -- Peripherals --
   -----------------

   --  Global Real-time counter 0
   type GRTC_Peripheral is record
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_0      : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_0);
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_1      : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_1);
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_2      : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_2);
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_3      : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_3);
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_4      : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_4);
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_5      : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_5);
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_6      : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_6);
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_7      : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_7);
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_8      : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_8);
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_9      : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_9);
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_10     : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_10);
      --  Description collection: Capture the counter value to CC[n] register
      TASKS_CAPTURE_11     : aliased TASKS_CAPTURE_Register;
      pragma Volatile_Full_Access (TASKS_CAPTURE_11);
      --  Start the counter
      TASKS_START          : aliased TASKS_START_Register;
      pragma Volatile_Full_Access (TASKS_START);
      --  Stop the counter
      TASKS_STOP           : aliased TASKS_STOP_Register;
      pragma Volatile_Full_Access (TASKS_STOP);
      --  Clear the counter
      TASKS_CLEAR          : aliased TASKS_CLEAR_Register;
      pragma Volatile_Full_Access (TASKS_CLEAR);
      --  Start the PWM
      TASKS_PWMSTART       : aliased TASKS_PWMSTART_Register;
      pragma Volatile_Full_Access (TASKS_PWMSTART);
      --  Stop the PWM
      TASKS_PWMSTOP        : aliased TASKS_PWMSTOP_Register;
      pragma Volatile_Full_Access (TASKS_PWMSTOP);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_0  : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_0);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_1  : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_1);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_2  : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_2);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_3  : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_3);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_4  : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_4);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_5  : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_5);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_6  : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_6);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_7  : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_7);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_8  : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_8);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_9  : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_9);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_10 : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_10);
      --  Description collection: Subscribe configuration for task CAPTURE[n]
      SUBSCRIBE_CAPTURE_11 : aliased SUBSCRIBE_CAPTURE_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAPTURE_11);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_0     : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_0);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_1     : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_1);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_2     : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_2);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_3     : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_3);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_4     : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_4);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_5     : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_5);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_6     : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_6);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_7     : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_7);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_8     : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_8);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_9     : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_9);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_10    : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_10);
      --  Description collection: Compare event on CC[n] match
      EVENTS_COMPARE_11    : aliased EVENTS_COMPARE_Register;
      pragma Volatile_Full_Access (EVENTS_COMPARE_11);
      --  The GRTC low frequency timer is synchronized with the SYSCOUNTER
      EVENTS_RTCOMPARESYNC : aliased EVENTS_RTCOMPARESYNC_Register;
      pragma Volatile_Full_Access (EVENTS_RTCOMPARESYNC);
      --  Event on end of each PWM period
      EVENTS_PWMPERIODEND  : aliased EVENTS_PWMPERIODEND_Register;
      pragma Volatile_Full_Access (EVENTS_PWMPERIODEND);
      --  Event on STATUS.PWM.READY status changed to ready
      EVENTS_PWMREADY      : aliased EVENTS_PWMREADY_Register;
      pragma Volatile_Full_Access (EVENTS_PWMREADY);
      --  Event on STATUS.CLKOUT.READY status changed to ready
      EVENTS_CLKOUTREADY   : aliased EVENTS_CLKOUTREADY_Register;
      pragma Volatile_Full_Access (EVENTS_CLKOUTREADY);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_0    : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_0);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_1    : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_1);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_2    : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_2);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_3    : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_3);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_4    : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_4);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_5    : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_5);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_6    : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_6);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_7    : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_7);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_8    : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_8);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_9    : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_9);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_10   : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_10);
      --  Description collection: Publish configuration for event COMPARE[n]
      PUBLISH_COMPARE_11   : aliased PUBLISH_COMPARE_Register;
      pragma Volatile_Full_Access (PUBLISH_COMPARE_11);
      --  Publish configuration for event PWMREADY
      PUBLISH_PWMREADY     : aliased PUBLISH_PWMREADY_Register;
      pragma Volatile_Full_Access (PUBLISH_PWMREADY);
      --  Publish configuration for event CLKOUTREADY
      PUBLISH_CLKOUTREADY  : aliased PUBLISH_CLKOUTREADY_Register;
      pragma Volatile_Full_Access (PUBLISH_CLKOUTREADY);
      --  Shortcuts between local events and tasks
      SHORTS               : aliased SHORTS_Register;
      pragma Volatile_Full_Access (SHORTS);
      --  Enable or disable interrupt
      INTEN0               : aliased INTEN_Register;
      pragma Volatile_Full_Access (INTEN0);
      --  Enable interrupt
      INTENSET0            : aliased INTENSET_Register;
      pragma Volatile_Full_Access (INTENSET0);
      --  Disable interrupt
      INTENCLR0            : aliased INTENCLR_Register;
      pragma Volatile_Full_Access (INTENCLR0);
      --  Pending interrupts
      INTPEND0             : aliased INTPEND_Register;
      pragma Volatile_Full_Access (INTPEND0);
      --  Enable or disable interrupt
      INTEN1               : aliased INTEN_Register;
      pragma Volatile_Full_Access (INTEN1);
      --  Enable interrupt
      INTENSET1            : aliased INTENSET_Register;
      pragma Volatile_Full_Access (INTENSET1);
      --  Disable interrupt
      INTENCLR1            : aliased INTENCLR_Register;
      pragma Volatile_Full_Access (INTENCLR1);
      --  Pending interrupts
      INTPEND1             : aliased INTPEND_Register;
      pragma Volatile_Full_Access (INTPEND1);
      --  Enable or disable interrupt
      INTEN2               : aliased INTEN_Register;
      pragma Volatile_Full_Access (INTEN2);
      --  Enable interrupt
      INTENSET2            : aliased INTENSET_Register;
      pragma Volatile_Full_Access (INTENSET2);
      --  Disable interrupt
      INTENCLR2            : aliased INTENCLR_Register;
      pragma Volatile_Full_Access (INTENCLR2);
      --  Pending interrupts
      INTPEND2             : aliased INTPEND_Register;
      pragma Volatile_Full_Access (INTPEND2);
      --  Enable or disable interrupt
      INTEN3               : aliased INTEN_Register;
      pragma Volatile_Full_Access (INTEN3);
      --  Enable interrupt
      INTENSET3            : aliased INTENSET_Register;
      pragma Volatile_Full_Access (INTENSET3);
      --  Disable interrupt
      INTENCLR3            : aliased INTENCLR_Register;
      pragma Volatile_Full_Access (INTENCLR3);
      --  Pending interrupts
      INTPEND3             : aliased INTPEND_Register;
      pragma Volatile_Full_Access (INTPEND3);
      --  Enable or disable event routing
      EVTEN                : aliased EVTEN_Register;
      pragma Volatile_Full_Access (EVTEN);
      --  Enable event routing
      EVTENSET             : aliased EVTENSET_Register;
      pragma Volatile_Full_Access (EVTENSET);
      --  Disable event routing
      EVTENCLR             : aliased EVTENCLR_Register;
      pragma Volatile_Full_Access (EVTENCLR);
      --  Counter mode selection
      MODE                 : aliased MODE_Register;
      pragma Volatile_Full_Access (MODE);
      --  Unspecified
      CC                   : aliased GRTC_CC_Clusters;
      --  Timeout after all CPUs gone into sleep state to stop the SYSCOUNTER
      TIMEOUT              : aliased TIMEOUT_Register;
      pragma Volatile_Full_Access (TIMEOUT);
      --  Count to add to CC[0] when the event EVENTS_COMPARE[0] triggers.
      INTERVAL             : aliased INTERVAL_Register;
      pragma Volatile_Full_Access (INTERVAL);
      --  GRTC wake up time.
      WAKETIME             : aliased WAKETIME_Register;
      pragma Volatile_Full_Access (WAKETIME);
      --  Unspecified
      STATUS               : aliased GRTC_STATUS_Cluster;
      --  PWM configuration.
      PWMCONFIG            : aliased PWMCONFIG_Register;
      pragma Volatile_Full_Access (PWMCONFIG);
      --  Configuration of clock output
      CLKOUT               : aliased CLKOUT_Register;
      pragma Volatile_Full_Access (CLKOUT);
      --  Clock Configuration
      CLKCFG               : aliased CLKCFG_Register;
      pragma Volatile_Full_Access (CLKCFG);
      --  Unspecified
      SYSCOUNTER           : aliased GRTC_SYSCOUNTER_Clusters;
   end record
     with Volatile;

   for GRTC_Peripheral use record
      TASKS_CAPTURE_0      at 16#0# range 0 .. 31;
      TASKS_CAPTURE_1      at 16#4# range 0 .. 31;
      TASKS_CAPTURE_2      at 16#8# range 0 .. 31;
      TASKS_CAPTURE_3      at 16#C# range 0 .. 31;
      TASKS_CAPTURE_4      at 16#10# range 0 .. 31;
      TASKS_CAPTURE_5      at 16#14# range 0 .. 31;
      TASKS_CAPTURE_6      at 16#18# range 0 .. 31;
      TASKS_CAPTURE_7      at 16#1C# range 0 .. 31;
      TASKS_CAPTURE_8      at 16#20# range 0 .. 31;
      TASKS_CAPTURE_9      at 16#24# range 0 .. 31;
      TASKS_CAPTURE_10     at 16#28# range 0 .. 31;
      TASKS_CAPTURE_11     at 16#2C# range 0 .. 31;
      TASKS_START          at 16#60# range 0 .. 31;
      TASKS_STOP           at 16#64# range 0 .. 31;
      TASKS_CLEAR          at 16#68# range 0 .. 31;
      TASKS_PWMSTART       at 16#6C# range 0 .. 31;
      TASKS_PWMSTOP        at 16#70# range 0 .. 31;
      SUBSCRIBE_CAPTURE_0  at 16#80# range 0 .. 31;
      SUBSCRIBE_CAPTURE_1  at 16#84# range 0 .. 31;
      SUBSCRIBE_CAPTURE_2  at 16#88# range 0 .. 31;
      SUBSCRIBE_CAPTURE_3  at 16#8C# range 0 .. 31;
      SUBSCRIBE_CAPTURE_4  at 16#90# range 0 .. 31;
      SUBSCRIBE_CAPTURE_5  at 16#94# range 0 .. 31;
      SUBSCRIBE_CAPTURE_6  at 16#98# range 0 .. 31;
      SUBSCRIBE_CAPTURE_7  at 16#9C# range 0 .. 31;
      SUBSCRIBE_CAPTURE_8  at 16#A0# range 0 .. 31;
      SUBSCRIBE_CAPTURE_9  at 16#A4# range 0 .. 31;
      SUBSCRIBE_CAPTURE_10 at 16#A8# range 0 .. 31;
      SUBSCRIBE_CAPTURE_11 at 16#AC# range 0 .. 31;
      EVENTS_COMPARE_0     at 16#100# range 0 .. 31;
      EVENTS_COMPARE_1     at 16#104# range 0 .. 31;
      EVENTS_COMPARE_2     at 16#108# range 0 .. 31;
      EVENTS_COMPARE_3     at 16#10C# range 0 .. 31;
      EVENTS_COMPARE_4     at 16#110# range 0 .. 31;
      EVENTS_COMPARE_5     at 16#114# range 0 .. 31;
      EVENTS_COMPARE_6     at 16#118# range 0 .. 31;
      EVENTS_COMPARE_7     at 16#11C# range 0 .. 31;
      EVENTS_COMPARE_8     at 16#120# range 0 .. 31;
      EVENTS_COMPARE_9     at 16#124# range 0 .. 31;
      EVENTS_COMPARE_10    at 16#128# range 0 .. 31;
      EVENTS_COMPARE_11    at 16#12C# range 0 .. 31;
      EVENTS_RTCOMPARESYNC at 16#164# range 0 .. 31;
      EVENTS_PWMPERIODEND  at 16#16C# range 0 .. 31;
      EVENTS_PWMREADY      at 16#174# range 0 .. 31;
      EVENTS_CLKOUTREADY   at 16#178# range 0 .. 31;
      PUBLISH_COMPARE_0    at 16#180# range 0 .. 31;
      PUBLISH_COMPARE_1    at 16#184# range 0 .. 31;
      PUBLISH_COMPARE_2    at 16#188# range 0 .. 31;
      PUBLISH_COMPARE_3    at 16#18C# range 0 .. 31;
      PUBLISH_COMPARE_4    at 16#190# range 0 .. 31;
      PUBLISH_COMPARE_5    at 16#194# range 0 .. 31;
      PUBLISH_COMPARE_6    at 16#198# range 0 .. 31;
      PUBLISH_COMPARE_7    at 16#19C# range 0 .. 31;
      PUBLISH_COMPARE_8    at 16#1A0# range 0 .. 31;
      PUBLISH_COMPARE_9    at 16#1A4# range 0 .. 31;
      PUBLISH_COMPARE_10   at 16#1A8# range 0 .. 31;
      PUBLISH_COMPARE_11   at 16#1AC# range 0 .. 31;
      PUBLISH_PWMREADY     at 16#1F4# range 0 .. 31;
      PUBLISH_CLKOUTREADY  at 16#1F8# range 0 .. 31;
      SHORTS               at 16#200# range 0 .. 31;
      INTEN0               at 16#300# range 0 .. 31;
      INTENSET0            at 16#304# range 0 .. 31;
      INTENCLR0            at 16#308# range 0 .. 31;
      INTPEND0             at 16#30C# range 0 .. 31;
      INTEN1               at 16#310# range 0 .. 31;
      INTENSET1            at 16#314# range 0 .. 31;
      INTENCLR1            at 16#318# range 0 .. 31;
      INTPEND1             at 16#31C# range 0 .. 31;
      INTEN2               at 16#320# range 0 .. 31;
      INTENSET2            at 16#324# range 0 .. 31;
      INTENCLR2            at 16#328# range 0 .. 31;
      INTPEND2             at 16#32C# range 0 .. 31;
      INTEN3               at 16#330# range 0 .. 31;
      INTENSET3            at 16#334# range 0 .. 31;
      INTENCLR3            at 16#338# range 0 .. 31;
      INTPEND3             at 16#33C# range 0 .. 31;
      EVTEN                at 16#400# range 0 .. 31;
      EVTENSET             at 16#404# range 0 .. 31;
      EVTENCLR             at 16#408# range 0 .. 31;
      MODE                 at 16#510# range 0 .. 31;
      CC                   at 16#520# range 0 .. 1535;
      TIMEOUT              at 16#6A4# range 0 .. 31;
      INTERVAL             at 16#6A8# range 0 .. 31;
      WAKETIME             at 16#6AC# range 0 .. 31;
      STATUS               at 16#6B0# range 0 .. 95;
      PWMCONFIG            at 16#710# range 0 .. 31;
      CLKOUT               at 16#714# range 0 .. 31;
      CLKCFG               at 16#718# range 0 .. 31;
      SYSCOUNTER           at 16#720# range 0 .. 511;
   end record;

   --  Global Real-time counter 0
   GLOBAL_GRTC_NS_Periph : aliased GRTC_Peripheral
     with Import, Address => GLOBAL_GRTC_NS_Base;

   --  Global Real-time counter 1
   GLOBAL_GRTC_S_Periph : aliased GRTC_Peripheral
     with Import, Address => GLOBAL_GRTC_S_Base;

end Interfaces.NRF54.GRTC;
