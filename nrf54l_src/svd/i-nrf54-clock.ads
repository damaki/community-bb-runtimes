--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

package Interfaces.NRF54.CLOCK is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Start crystal oscillator (HFXO)
   type TASKS_XOSTART_TASKS_XOSTART_Field is
     (--  Reset value for the field
      TASKS_XOSTART_TASKS_XOSTART_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_XOSTART_TASKS_XOSTART_Field use
     (TASKS_XOSTART_TASKS_XOSTART_Field_Reset => 0,
      Trigger => 1);

   --  Start crystal oscillator (HFXO)
   type TASKS_XOSTART_Register is record
      --  Write-only. Start crystal oscillator (HFXO)
      TASKS_XOSTART : TASKS_XOSTART_TASKS_XOSTART_Field :=
                       TASKS_XOSTART_TASKS_XOSTART_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_XOSTART_Register use record
      TASKS_XOSTART at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Stop crystal oscillator (HFXO)
   type TASKS_XOSTOP_TASKS_XOSTOP_Field is
     (--  Reset value for the field
      TASKS_XOSTOP_TASKS_XOSTOP_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_XOSTOP_TASKS_XOSTOP_Field use
     (TASKS_XOSTOP_TASKS_XOSTOP_Field_Reset => 0,
      Trigger => 1);

   --  Stop crystal oscillator (HFXO)
   type TASKS_XOSTOP_Register is record
      --  Write-only. Stop crystal oscillator (HFXO)
      TASKS_XOSTOP  : TASKS_XOSTOP_TASKS_XOSTOP_Field :=
                       TASKS_XOSTOP_TASKS_XOSTOP_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_XOSTOP_Register use record
      TASKS_XOSTOP  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Start PLL and keep it running, regardless of the automatic clock
   --  requests
   type TASKS_PLLSTART_TASKS_PLLSTART_Field is
     (--  Reset value for the field
      TASKS_PLLSTART_TASKS_PLLSTART_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_PLLSTART_TASKS_PLLSTART_Field use
     (TASKS_PLLSTART_TASKS_PLLSTART_Field_Reset => 0,
      Trigger => 1);

   --  Start PLL and keep it running, regardless of the automatic clock
   --  requests
   type TASKS_PLLSTART_Register is record
      --  Write-only. Start PLL and keep it running, regardless of the
      --  automatic clock requests
      TASKS_PLLSTART : TASKS_PLLSTART_TASKS_PLLSTART_Field :=
                        TASKS_PLLSTART_TASKS_PLLSTART_Field_Reset;
      --  unspecified
      Reserved_1_31  : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_PLLSTART_Register use record
      TASKS_PLLSTART at 0 range 0 .. 0;
      Reserved_1_31  at 0 range 1 .. 31;
   end record;

   --  Stop PLL
   type TASKS_PLLSTOP_TASKS_PLLSTOP_Field is
     (--  Reset value for the field
      TASKS_PLLSTOP_TASKS_PLLSTOP_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_PLLSTOP_TASKS_PLLSTOP_Field use
     (TASKS_PLLSTOP_TASKS_PLLSTOP_Field_Reset => 0,
      Trigger => 1);

   --  Stop PLL
   type TASKS_PLLSTOP_Register is record
      --  Write-only. Stop PLL
      TASKS_PLLSTOP : TASKS_PLLSTOP_TASKS_PLLSTOP_Field :=
                       TASKS_PLLSTOP_TASKS_PLLSTOP_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_PLLSTOP_Register use record
      TASKS_PLLSTOP at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Start LFCLK source as selected in LFCLK.SRC
   type TASKS_LFCLKSTART_TASKS_LFCLKSTART_Field is
     (--  Reset value for the field
      TASKS_LFCLKSTART_TASKS_LFCLKSTART_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_LFCLKSTART_TASKS_LFCLKSTART_Field use
     (TASKS_LFCLKSTART_TASKS_LFCLKSTART_Field_Reset => 0,
      Trigger => 1);

   --  Start LFCLK source as selected in LFCLK.SRC
   type TASKS_LFCLKSTART_Register is record
      --  Write-only. Start LFCLK source as selected in LFCLK.SRC
      TASKS_LFCLKSTART : TASKS_LFCLKSTART_TASKS_LFCLKSTART_Field :=
                          TASKS_LFCLKSTART_TASKS_LFCLKSTART_Field_Reset;
      --  unspecified
      Reserved_1_31    : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_LFCLKSTART_Register use record
      TASKS_LFCLKSTART at 0 range 0 .. 0;
      Reserved_1_31    at 0 range 1 .. 31;
   end record;

   --  Stop LFCLK source
   type TASKS_LFCLKSTOP_TASKS_LFCLKSTOP_Field is
     (--  Reset value for the field
      TASKS_LFCLKSTOP_TASKS_LFCLKSTOP_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_LFCLKSTOP_TASKS_LFCLKSTOP_Field use
     (TASKS_LFCLKSTOP_TASKS_LFCLKSTOP_Field_Reset => 0,
      Trigger => 1);

   --  Stop LFCLK source
   type TASKS_LFCLKSTOP_Register is record
      --  Write-only. Stop LFCLK source
      TASKS_LFCLKSTOP : TASKS_LFCLKSTOP_TASKS_LFCLKSTOP_Field :=
                         TASKS_LFCLKSTOP_TASKS_LFCLKSTOP_Field_Reset;
      --  unspecified
      Reserved_1_31   : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_LFCLKSTOP_Register use record
      TASKS_LFCLKSTOP at 0 range 0 .. 0;
      Reserved_1_31   at 0 range 1 .. 31;
   end record;

   --  Start calibration of LFRC oscillator
   type TASKS_CAL_TASKS_CAL_Field is
     (--  Reset value for the field
      TASKS_CAL_TASKS_CAL_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_CAL_TASKS_CAL_Field use
     (TASKS_CAL_TASKS_CAL_Field_Reset => 0,
      Trigger => 1);

   --  Start calibration of LFRC oscillator
   type TASKS_CAL_Register is record
      --  Write-only. Start calibration of LFRC oscillator
      TASKS_CAL     : TASKS_CAL_TASKS_CAL_Field :=
                       TASKS_CAL_TASKS_CAL_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_CAL_Register use record
      TASKS_CAL     at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Request tuning for HFXO
   type TASKS_XOTUNE_TASKS_XOTUNE_Field is
     (--  Reset value for the field
      TASKS_XOTUNE_TASKS_XOTUNE_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_XOTUNE_TASKS_XOTUNE_Field use
     (TASKS_XOTUNE_TASKS_XOTUNE_Field_Reset => 0,
      Trigger => 1);

   --  Request tuning for HFXO
   type TASKS_XOTUNE_Register is record
      --  Write-only. Request tuning for HFXO
      TASKS_XOTUNE  : TASKS_XOTUNE_TASKS_XOTUNE_Field :=
                       TASKS_XOTUNE_TASKS_XOTUNE_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_XOTUNE_Register use record
      TASKS_XOTUNE  at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Abort tuning for HFXO
   type TASKS_XOTUNEABORT_TASKS_XOTUNEABORT_Field is
     (--  Reset value for the field
      TASKS_XOTUNEABORT_TASKS_XOTUNEABORT_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_XOTUNEABORT_TASKS_XOTUNEABORT_Field use
     (TASKS_XOTUNEABORT_TASKS_XOTUNEABORT_Field_Reset => 0,
      Trigger => 1);

   --  Abort tuning for HFXO
   type TASKS_XOTUNEABORT_Register is record
      --  Write-only. Abort tuning for HFXO
      TASKS_XOTUNEABORT : TASKS_XOTUNEABORT_TASKS_XOTUNEABORT_Field :=
                           TASKS_XOTUNEABORT_TASKS_XOTUNEABORT_Field_Reset;
      --  unspecified
      Reserved_1_31     : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_XOTUNEABORT_Register use record
      TASKS_XOTUNEABORT at 0 range 0 .. 0;
      Reserved_1_31     at 0 range 1 .. 31;
   end record;

   subtype SUBSCRIBE_XOSTART_CHIDX_Field is Interfaces.NRF54.Byte;

   type SUBSCRIBE_XOSTART_EN_Field is
     (--  Disable subscription
      Disabled,
      --  Enable subscription
      Enabled)
     with Size => 1;
   for SUBSCRIBE_XOSTART_EN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Subscribe configuration for task XOSTART
   type SUBSCRIBE_XOSTART_Register is record
      --  DPPI channel that task XOSTART will subscribe to
      CHIDX         : SUBSCRIBE_XOSTART_CHIDX_Field := 16#0#;
      --  unspecified
      Reserved_8_30 : Interfaces.NRF54.UInt23 := 16#0#;
      EN            : SUBSCRIBE_XOSTART_EN_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUBSCRIBE_XOSTART_Register use record
      CHIDX         at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      EN            at 0 range 31 .. 31;
   end record;

   subtype SUBSCRIBE_XOSTOP_CHIDX_Field is Interfaces.NRF54.Byte;

   type SUBSCRIBE_XOSTOP_EN_Field is
     (--  Disable subscription
      Disabled,
      --  Enable subscription
      Enabled)
     with Size => 1;
   for SUBSCRIBE_XOSTOP_EN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Subscribe configuration for task XOSTOP
   type SUBSCRIBE_XOSTOP_Register is record
      --  DPPI channel that task XOSTOP will subscribe to
      CHIDX         : SUBSCRIBE_XOSTOP_CHIDX_Field := 16#0#;
      --  unspecified
      Reserved_8_30 : Interfaces.NRF54.UInt23 := 16#0#;
      EN            : SUBSCRIBE_XOSTOP_EN_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUBSCRIBE_XOSTOP_Register use record
      CHIDX         at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      EN            at 0 range 31 .. 31;
   end record;

   subtype SUBSCRIBE_PLLSTART_CHIDX_Field is Interfaces.NRF54.Byte;

   type SUBSCRIBE_PLLSTART_EN_Field is
     (--  Disable subscription
      Disabled,
      --  Enable subscription
      Enabled)
     with Size => 1;
   for SUBSCRIBE_PLLSTART_EN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Subscribe configuration for task PLLSTART
   type SUBSCRIBE_PLLSTART_Register is record
      --  DPPI channel that task PLLSTART will subscribe to
      CHIDX         : SUBSCRIBE_PLLSTART_CHIDX_Field := 16#0#;
      --  unspecified
      Reserved_8_30 : Interfaces.NRF54.UInt23 := 16#0#;
      EN            : SUBSCRIBE_PLLSTART_EN_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUBSCRIBE_PLLSTART_Register use record
      CHIDX         at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      EN            at 0 range 31 .. 31;
   end record;

   subtype SUBSCRIBE_PLLSTOP_CHIDX_Field is Interfaces.NRF54.Byte;

   type SUBSCRIBE_PLLSTOP_EN_Field is
     (--  Disable subscription
      Disabled,
      --  Enable subscription
      Enabled)
     with Size => 1;
   for SUBSCRIBE_PLLSTOP_EN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Subscribe configuration for task PLLSTOP
   type SUBSCRIBE_PLLSTOP_Register is record
      --  DPPI channel that task PLLSTOP will subscribe to
      CHIDX         : SUBSCRIBE_PLLSTOP_CHIDX_Field := 16#0#;
      --  unspecified
      Reserved_8_30 : Interfaces.NRF54.UInt23 := 16#0#;
      EN            : SUBSCRIBE_PLLSTOP_EN_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUBSCRIBE_PLLSTOP_Register use record
      CHIDX         at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      EN            at 0 range 31 .. 31;
   end record;

   subtype SUBSCRIBE_LFCLKSTART_CHIDX_Field is Interfaces.NRF54.Byte;

   type SUBSCRIBE_LFCLKSTART_EN_Field is
     (--  Disable subscription
      Disabled,
      --  Enable subscription
      Enabled)
     with Size => 1;
   for SUBSCRIBE_LFCLKSTART_EN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Subscribe configuration for task LFCLKSTART
   type SUBSCRIBE_LFCLKSTART_Register is record
      --  DPPI channel that task LFCLKSTART will subscribe to
      CHIDX         : SUBSCRIBE_LFCLKSTART_CHIDX_Field := 16#0#;
      --  unspecified
      Reserved_8_30 : Interfaces.NRF54.UInt23 := 16#0#;
      EN            : SUBSCRIBE_LFCLKSTART_EN_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUBSCRIBE_LFCLKSTART_Register use record
      CHIDX         at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      EN            at 0 range 31 .. 31;
   end record;

   subtype SUBSCRIBE_LFCLKSTOP_CHIDX_Field is Interfaces.NRF54.Byte;

   type SUBSCRIBE_LFCLKSTOP_EN_Field is
     (--  Disable subscription
      Disabled,
      --  Enable subscription
      Enabled)
     with Size => 1;
   for SUBSCRIBE_LFCLKSTOP_EN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Subscribe configuration for task LFCLKSTOP
   type SUBSCRIBE_LFCLKSTOP_Register is record
      --  DPPI channel that task LFCLKSTOP will subscribe to
      CHIDX         : SUBSCRIBE_LFCLKSTOP_CHIDX_Field := 16#0#;
      --  unspecified
      Reserved_8_30 : Interfaces.NRF54.UInt23 := 16#0#;
      EN            : SUBSCRIBE_LFCLKSTOP_EN_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUBSCRIBE_LFCLKSTOP_Register use record
      CHIDX         at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      EN            at 0 range 31 .. 31;
   end record;

   subtype SUBSCRIBE_CAL_CHIDX_Field is Interfaces.NRF54.Byte;

   type SUBSCRIBE_CAL_EN_Field is
     (--  Disable subscription
      Disabled,
      --  Enable subscription
      Enabled)
     with Size => 1;
   for SUBSCRIBE_CAL_EN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Subscribe configuration for task CAL
   type SUBSCRIBE_CAL_Register is record
      --  DPPI channel that task CAL will subscribe to
      CHIDX         : SUBSCRIBE_CAL_CHIDX_Field := 16#0#;
      --  unspecified
      Reserved_8_30 : Interfaces.NRF54.UInt23 := 16#0#;
      EN            : SUBSCRIBE_CAL_EN_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUBSCRIBE_CAL_Register use record
      CHIDX         at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      EN            at 0 range 31 .. 31;
   end record;

   --  Crystal oscillator has started
   type EVENTS_XOSTARTED_EVENTS_XOSTARTED_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_XOSTARTED_EVENTS_XOSTARTED_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  Crystal oscillator has started
   type EVENTS_XOSTARTED_Register is record
      --  Crystal oscillator has started
      EVENTS_XOSTARTED : EVENTS_XOSTARTED_EVENTS_XOSTARTED_Field :=
                          Interfaces.NRF54.CLOCK.NotGenerated;
      --  unspecified
      Reserved_1_31    : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_XOSTARTED_Register use record
      EVENTS_XOSTARTED at 0 range 0 .. 0;
      Reserved_1_31    at 0 range 1 .. 31;
   end record;

   --  PLL started
   type EVENTS_PLLSTARTED_EVENTS_PLLSTARTED_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_PLLSTARTED_EVENTS_PLLSTARTED_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  PLL started
   type EVENTS_PLLSTARTED_Register is record
      --  PLL started
      EVENTS_PLLSTARTED : EVENTS_PLLSTARTED_EVENTS_PLLSTARTED_Field :=
                           Interfaces.NRF54.CLOCK.NotGenerated;
      --  unspecified
      Reserved_1_31     : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_PLLSTARTED_Register use record
      EVENTS_PLLSTARTED at 0 range 0 .. 0;
      Reserved_1_31     at 0 range 1 .. 31;
   end record;

   --  LFCLK source started
   type EVENTS_LFCLKSTARTED_EVENTS_LFCLKSTARTED_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_LFCLKSTARTED_EVENTS_LFCLKSTARTED_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  LFCLK source started
   type EVENTS_LFCLKSTARTED_Register is record
      --  LFCLK source started
      EVENTS_LFCLKSTARTED : EVENTS_LFCLKSTARTED_EVENTS_LFCLKSTARTED_Field :=
                             Interfaces.NRF54.CLOCK.NotGenerated;
      --  unspecified
      Reserved_1_31       : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_LFCLKSTARTED_Register use record
      EVENTS_LFCLKSTARTED at 0 range 0 .. 0;
      Reserved_1_31       at 0 range 1 .. 31;
   end record;

   --  Calibration of LFRC oscillator complete event
   type EVENTS_DONE_EVENTS_DONE_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_DONE_EVENTS_DONE_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  Calibration of LFRC oscillator complete event
   type EVENTS_DONE_Register is record
      --  Calibration of LFRC oscillator complete event
      EVENTS_DONE   : EVENTS_DONE_EVENTS_DONE_Field :=
                       Interfaces.NRF54.CLOCK.NotGenerated;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_DONE_Register use record
      EVENTS_DONE   at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  HFXO tuning is done. XOTUNED is generated after TASKS_XOSTART or after
   --  TASKS_XOTUNE has completed
   type EVENTS_XOTUNED_EVENTS_XOTUNED_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_XOTUNED_EVENTS_XOTUNED_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  HFXO tuning is done. XOTUNED is generated after TASKS_XOSTART or after
   --  TASKS_XOTUNE has completed
   type EVENTS_XOTUNED_Register is record
      --  HFXO tuning is done. XOTUNED is generated after TASKS_XOSTART or
      --  after TASKS_XOTUNE has completed
      EVENTS_XOTUNED : EVENTS_XOTUNED_EVENTS_XOTUNED_Field :=
                        Interfaces.NRF54.CLOCK.NotGenerated;
      --  unspecified
      Reserved_1_31  : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_XOTUNED_Register use record
      EVENTS_XOTUNED at 0 range 0 .. 0;
      Reserved_1_31  at 0 range 1 .. 31;
   end record;

   --  HFXO quality issue detected, XOTUNE is needed
   type EVENTS_XOTUNEERROR_EVENTS_XOTUNEERROR_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_XOTUNEERROR_EVENTS_XOTUNEERROR_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  HFXO quality issue detected, XOTUNE is needed
   type EVENTS_XOTUNEERROR_Register is record
      --  HFXO quality issue detected, XOTUNE is needed
      EVENTS_XOTUNEERROR : EVENTS_XOTUNEERROR_EVENTS_XOTUNEERROR_Field :=
                            Interfaces.NRF54.CLOCK.NotGenerated;
      --  unspecified
      Reserved_1_31      : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_XOTUNEERROR_Register use record
      EVENTS_XOTUNEERROR at 0 range 0 .. 0;
      Reserved_1_31      at 0 range 1 .. 31;
   end record;

   --  HFXO tuning could not be completed
   type EVENTS_XOTUNEFAILED_EVENTS_XOTUNEFAILED_Field is
     (--  Event not generated
      NotGenerated,
      --  Event generated
      Generated)
     with Size => 1;
   for EVENTS_XOTUNEFAILED_EVENTS_XOTUNEFAILED_Field use
     (NotGenerated => 0,
      Generated => 1);

   --  HFXO tuning could not be completed
   type EVENTS_XOTUNEFAILED_Register is record
      --  HFXO tuning could not be completed
      EVENTS_XOTUNEFAILED : EVENTS_XOTUNEFAILED_EVENTS_XOTUNEFAILED_Field :=
                             Interfaces.NRF54.CLOCK.NotGenerated;
      --  unspecified
      Reserved_1_31       : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EVENTS_XOTUNEFAILED_Register use record
      EVENTS_XOTUNEFAILED at 0 range 0 .. 0;
      Reserved_1_31       at 0 range 1 .. 31;
   end record;

   --  Enable or disable interrupt for event XOSTARTED
   type INTEN_XOSTARTED_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN_XOSTARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt for event PLLSTARTED
   type INTEN_PLLSTARTED_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN_PLLSTARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt for event LFCLKSTARTED
   type INTEN_LFCLKSTARTED_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN_LFCLKSTARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt for event DONE
   type INTEN_DONE_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN_DONE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt for event XOTUNED
   type INTEN_XOTUNED_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN_XOTUNED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt for event XOTUNEERROR
   type INTEN_XOTUNEERROR_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN_XOTUNEERROR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt for event XOTUNEFAILED
   type INTEN_XOTUNEFAILED_Field is
     (--  Disable
      Disabled,
      --  Enable
      Enabled)
     with Size => 1;
   for INTEN_XOTUNEFAILED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable interrupt
   type INTEN_Register is record
      --  Enable or disable interrupt for event XOSTARTED
      XOSTARTED     : INTEN_XOSTARTED_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
      --  Enable or disable interrupt for event PLLSTARTED
      PLLSTARTED    : INTEN_PLLSTARTED_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
      --  Enable or disable interrupt for event LFCLKSTARTED
      LFCLKSTARTED  : INTEN_LFCLKSTARTED_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
      --  Enable or disable interrupt for event DONE
      DONE          : INTEN_DONE_Field := Interfaces.NRF54.CLOCK.Disabled;
      --  Enable or disable interrupt for event XOTUNED
      XOTUNED       : INTEN_XOTUNED_Field := Interfaces.NRF54.CLOCK.Disabled;
      --  Enable or disable interrupt for event XOTUNEERROR
      XOTUNEERROR   : INTEN_XOTUNEERROR_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
      --  Enable or disable interrupt for event XOTUNEFAILED
      XOTUNEFAILED  : INTEN_XOTUNEFAILED_Field :=
                       Interfaces.NRF54.CLOCK.Disabled;
      --  unspecified
      Reserved_7_31 : Interfaces.NRF54.UInt25 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTEN_Register use record
      XOSTARTED     at 0 range 0 .. 0;
      PLLSTARTED    at 0 range 1 .. 1;
      LFCLKSTARTED  at 0 range 2 .. 2;
      DONE          at 0 range 3 .. 3;
      XOTUNED       at 0 range 4 .. 4;
      XOTUNEERROR   at 0 range 5 .. 5;
      XOTUNEFAILED  at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Write '1' to enable interrupt for event XOSTARTED
   type INTENSET_XOSTARTED_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET_XOSTARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event XOSTARTED
   type INTENSET_XOSTARTED_Field_1 is
     (--  Reset value for the field
      INTENSET_XOSTARTED_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET_XOSTARTED_Field_1 use
     (INTENSET_XOSTARTED_Field_Reset => 0,
      Set => 1);

   --  Write '1' to enable interrupt for event PLLSTARTED
   type INTENSET_PLLSTARTED_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET_PLLSTARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event PLLSTARTED
   type INTENSET_PLLSTARTED_Field_1 is
     (--  Reset value for the field
      INTENSET_PLLSTARTED_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET_PLLSTARTED_Field_1 use
     (INTENSET_PLLSTARTED_Field_Reset => 0,
      Set => 1);

   --  Write '1' to enable interrupt for event LFCLKSTARTED
   type INTENSET_LFCLKSTARTED_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET_LFCLKSTARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event LFCLKSTARTED
   type INTENSET_LFCLKSTARTED_Field_1 is
     (--  Reset value for the field
      INTENSET_LFCLKSTARTED_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET_LFCLKSTARTED_Field_1 use
     (INTENSET_LFCLKSTARTED_Field_Reset => 0,
      Set => 1);

   --  Write '1' to enable interrupt for event DONE
   type INTENSET_DONE_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET_DONE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event DONE
   type INTENSET_DONE_Field_1 is
     (--  Reset value for the field
      INTENSET_DONE_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET_DONE_Field_1 use
     (INTENSET_DONE_Field_Reset => 0,
      Set => 1);

   --  Write '1' to enable interrupt for event XOTUNED
   type INTENSET_XOTUNED_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET_XOTUNED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event XOTUNED
   type INTENSET_XOTUNED_Field_1 is
     (--  Reset value for the field
      INTENSET_XOTUNED_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET_XOTUNED_Field_1 use
     (INTENSET_XOTUNED_Field_Reset => 0,
      Set => 1);

   --  Write '1' to enable interrupt for event XOTUNEERROR
   type INTENSET_XOTUNEERROR_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET_XOTUNEERROR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event XOTUNEERROR
   type INTENSET_XOTUNEERROR_Field_1 is
     (--  Reset value for the field
      INTENSET_XOTUNEERROR_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET_XOTUNEERROR_Field_1 use
     (INTENSET_XOTUNEERROR_Field_Reset => 0,
      Set => 1);

   --  Write '1' to enable interrupt for event XOTUNEFAILED
   type INTENSET_XOTUNEFAILED_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENSET_XOTUNEFAILED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to enable interrupt for event XOTUNEFAILED
   type INTENSET_XOTUNEFAILED_Field_1 is
     (--  Reset value for the field
      INTENSET_XOTUNEFAILED_Field_Reset,
      --  Enable
      Set)
     with Size => 1;
   for INTENSET_XOTUNEFAILED_Field_1 use
     (INTENSET_XOTUNEFAILED_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt
   type INTENSET_Register is record
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event XOSTARTED
      XOSTARTED     : INTENSET_XOSTARTED_Field_1 :=
                       INTENSET_XOSTARTED_Field_Reset;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event PLLSTARTED
      PLLSTARTED    : INTENSET_PLLSTARTED_Field_1 :=
                       INTENSET_PLLSTARTED_Field_Reset;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event LFCLKSTARTED
      LFCLKSTARTED  : INTENSET_LFCLKSTARTED_Field_1 :=
                       INTENSET_LFCLKSTARTED_Field_Reset;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event DONE
      DONE          : INTENSET_DONE_Field_1 := INTENSET_DONE_Field_Reset;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event XOTUNED
      XOTUNED       : INTENSET_XOTUNED_Field_1 :=
                       INTENSET_XOTUNED_Field_Reset;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event XOTUNEERROR
      XOTUNEERROR   : INTENSET_XOTUNEERROR_Field_1 :=
                       INTENSET_XOTUNEERROR_Field_Reset;
      --  Write data bit of one shall set (set to one) the corresponding bit in
      --  the field. Write '1' to enable interrupt for event XOTUNEFAILED
      XOTUNEFAILED  : INTENSET_XOTUNEFAILED_Field_1 :=
                       INTENSET_XOTUNEFAILED_Field_Reset;
      --  unspecified
      Reserved_7_31 : Interfaces.NRF54.UInt25 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      XOSTARTED     at 0 range 0 .. 0;
      PLLSTARTED    at 0 range 1 .. 1;
      LFCLKSTARTED  at 0 range 2 .. 2;
      DONE          at 0 range 3 .. 3;
      XOTUNED       at 0 range 4 .. 4;
      XOTUNEERROR   at 0 range 5 .. 5;
      XOTUNEFAILED  at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Write '1' to disable interrupt for event XOSTARTED
   type INTENCLR_XOSTARTED_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR_XOSTARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event XOSTARTED
   type INTENCLR_XOSTARTED_Field_1 is
     (--  Reset value for the field
      INTENCLR_XOSTARTED_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR_XOSTARTED_Field_1 use
     (INTENCLR_XOSTARTED_Field_Reset => 0,
      Clear => 1);

   --  Write '1' to disable interrupt for event PLLSTARTED
   type INTENCLR_PLLSTARTED_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR_PLLSTARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event PLLSTARTED
   type INTENCLR_PLLSTARTED_Field_1 is
     (--  Reset value for the field
      INTENCLR_PLLSTARTED_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR_PLLSTARTED_Field_1 use
     (INTENCLR_PLLSTARTED_Field_Reset => 0,
      Clear => 1);

   --  Write '1' to disable interrupt for event LFCLKSTARTED
   type INTENCLR_LFCLKSTARTED_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR_LFCLKSTARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event LFCLKSTARTED
   type INTENCLR_LFCLKSTARTED_Field_1 is
     (--  Reset value for the field
      INTENCLR_LFCLKSTARTED_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR_LFCLKSTARTED_Field_1 use
     (INTENCLR_LFCLKSTARTED_Field_Reset => 0,
      Clear => 1);

   --  Write '1' to disable interrupt for event DONE
   type INTENCLR_DONE_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR_DONE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event DONE
   type INTENCLR_DONE_Field_1 is
     (--  Reset value for the field
      INTENCLR_DONE_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR_DONE_Field_1 use
     (INTENCLR_DONE_Field_Reset => 0,
      Clear => 1);

   --  Write '1' to disable interrupt for event XOTUNED
   type INTENCLR_XOTUNED_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR_XOTUNED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event XOTUNED
   type INTENCLR_XOTUNED_Field_1 is
     (--  Reset value for the field
      INTENCLR_XOTUNED_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR_XOTUNED_Field_1 use
     (INTENCLR_XOTUNED_Field_Reset => 0,
      Clear => 1);

   --  Write '1' to disable interrupt for event XOTUNEERROR
   type INTENCLR_XOTUNEERROR_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR_XOTUNEERROR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event XOTUNEERROR
   type INTENCLR_XOTUNEERROR_Field_1 is
     (--  Reset value for the field
      INTENCLR_XOTUNEERROR_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR_XOTUNEERROR_Field_1 use
     (INTENCLR_XOTUNEERROR_Field_Reset => 0,
      Clear => 1);

   --  Write '1' to disable interrupt for event XOTUNEFAILED
   type INTENCLR_XOTUNEFAILED_Field is
     (--  Read: Disabled
      Disabled,
      --  Read: Enabled
      Enabled)
     with Size => 1;
   for INTENCLR_XOTUNEFAILED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Write '1' to disable interrupt for event XOTUNEFAILED
   type INTENCLR_XOTUNEFAILED_Field_1 is
     (--  Reset value for the field
      INTENCLR_XOTUNEFAILED_Field_Reset,
      --  Disable
      Clear)
     with Size => 1;
   for INTENCLR_XOTUNEFAILED_Field_1 use
     (INTENCLR_XOTUNEFAILED_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt
   type INTENCLR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event XOSTARTED
      XOSTARTED     : INTENCLR_XOSTARTED_Field_1 :=
                       INTENCLR_XOSTARTED_Field_Reset;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event PLLSTARTED
      PLLSTARTED    : INTENCLR_PLLSTARTED_Field_1 :=
                       INTENCLR_PLLSTARTED_Field_Reset;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event LFCLKSTARTED
      LFCLKSTARTED  : INTENCLR_LFCLKSTARTED_Field_1 :=
                       INTENCLR_LFCLKSTARTED_Field_Reset;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event DONE
      DONE          : INTENCLR_DONE_Field_1 := INTENCLR_DONE_Field_Reset;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event XOTUNED
      XOTUNED       : INTENCLR_XOTUNED_Field_1 :=
                       INTENCLR_XOTUNED_Field_Reset;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event XOTUNEERROR
      XOTUNEERROR   : INTENCLR_XOTUNEERROR_Field_1 :=
                       INTENCLR_XOTUNEERROR_Field_Reset;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Write '1' to disable interrupt for event XOTUNEFAILED
      XOTUNEFAILED  : INTENCLR_XOTUNEFAILED_Field_1 :=
                       INTENCLR_XOTUNEFAILED_Field_Reset;
      --  unspecified
      Reserved_7_31 : Interfaces.NRF54.UInt25 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      XOSTARTED     at 0 range 0 .. 0;
      PLLSTARTED    at 0 range 1 .. 1;
      LFCLKSTARTED  at 0 range 2 .. 2;
      DONE          at 0 range 3 .. 3;
      XOTUNED       at 0 range 4 .. 4;
      XOTUNEERROR   at 0 range 5 .. 5;
      XOTUNEFAILED  at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Read pending status of interrupt for event XOSTARTED
   type INTPEND_XOSTARTED_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND_XOSTARTED_Field use
     (NotPending => 0,
      Pending => 1);

   --  Read pending status of interrupt for event PLLSTARTED
   type INTPEND_PLLSTARTED_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND_PLLSTARTED_Field use
     (NotPending => 0,
      Pending => 1);

   --  Read pending status of interrupt for event LFCLKSTARTED
   type INTPEND_LFCLKSTARTED_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND_LFCLKSTARTED_Field use
     (NotPending => 0,
      Pending => 1);

   --  Read pending status of interrupt for event DONE
   type INTPEND_DONE_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND_DONE_Field use
     (NotPending => 0,
      Pending => 1);

   --  Read pending status of interrupt for event XOTUNED
   type INTPEND_XOTUNED_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND_XOTUNED_Field use
     (NotPending => 0,
      Pending => 1);

   --  Read pending status of interrupt for event XOTUNEERROR
   type INTPEND_XOTUNEERROR_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND_XOTUNEERROR_Field use
     (NotPending => 0,
      Pending => 1);

   --  Read pending status of interrupt for event XOTUNEFAILED
   type INTPEND_XOTUNEFAILED_Field is
     (--  Read: Not pending
      NotPending,
      --  Read: Pending
      Pending)
     with Size => 1;
   for INTPEND_XOTUNEFAILED_Field use
     (NotPending => 0,
      Pending => 1);

   --  Pending interrupts
   type INTPEND_Register is record
      --  Read-only. Read pending status of interrupt for event XOSTARTED
      XOSTARTED     : INTPEND_XOSTARTED_Field;
      --  Read-only. Read pending status of interrupt for event PLLSTARTED
      PLLSTARTED    : INTPEND_PLLSTARTED_Field;
      --  Read-only. Read pending status of interrupt for event LFCLKSTARTED
      LFCLKSTARTED  : INTPEND_LFCLKSTARTED_Field;
      --  Read-only. Read pending status of interrupt for event DONE
      DONE          : INTPEND_DONE_Field;
      --  Read-only. Read pending status of interrupt for event XOTUNED
      XOTUNED       : INTPEND_XOTUNED_Field;
      --  Read-only. Read pending status of interrupt for event XOTUNEERROR
      XOTUNEERROR   : INTPEND_XOTUNEERROR_Field;
      --  Read-only. Read pending status of interrupt for event XOTUNEFAILED
      XOTUNEFAILED  : INTPEND_XOTUNEFAILED_Field;
      --  unspecified
      Reserved_7_31 : Interfaces.NRF54.UInt25;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTPEND_Register use record
      XOSTARTED     at 0 range 0 .. 0;
      PLLSTARTED    at 0 range 1 .. 1;
      LFCLKSTARTED  at 0 range 2 .. 2;
      DONE          at 0 range 3 .. 3;
      XOTUNED       at 0 range 4 .. 4;
      XOTUNEERROR   at 0 range 5 .. 5;
      XOTUNEFAILED  at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   ----------------------------------
   -- CLOCK_XO cluster's Registers --
   ----------------------------------

   --  XOSTART task triggered or not
   type RUN_STATUS_Field is
     (--  Task not triggered
      NotTriggered,
      --  Task triggered
      Triggered)
     with Size => 1;
   for RUN_STATUS_Field use
     (NotTriggered => 0,
      Triggered => 1);

   --  Indicates that XOSTART task was triggered
   type RUN_XO_Register is record
      --  Read-only. XOSTART task triggered or not
      STATUS        : RUN_STATUS_Field;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RUN_XO_Register use record
      STATUS        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  XO state (Running between START task and STOPPED event)
   type STAT_STATE_Field is
     (--  XO is not running
      NotRunning,
      --  XO is running
      Running)
     with Size => 1;
   for STAT_STATE_Field use
     (NotRunning => 0,
      Running => 1);

   --  XO status
   type STAT_XO_Register is record
      --  unspecified
      Reserved_0_15  : Interfaces.NRF54.UInt16;
      --  Read-only. XO state (Running between START task and STOPPED event)
      STATE          : STAT_STATE_Field;
      --  unspecified
      Reserved_17_31 : Interfaces.NRF54.UInt15;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for STAT_XO_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      STATE          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  Unspecified
   type CLOCK_XO_Cluster is record
      --  Indicates that XOSTART task was triggered
      RUN  : aliased RUN_XO_Register;
      pragma Volatile_Full_Access (RUN);
      --  XO status
      STAT : aliased STAT_XO_Register;
      pragma Volatile_Full_Access (STAT);
   end record
     with Size => 128;

   for CLOCK_XO_Cluster use record
      RUN  at 16#8# range 0 .. 31;
      STAT at 16#C# range 0 .. 31;
   end record;

   -----------------------------------
   -- CLOCK_PLL cluster's Registers --
   -----------------------------------

   --  Indicates that PLLSTART task was triggered
   type RUN_PLL_Register is record
      --  Read-only. PLLSTART task triggered or not
      STATUS        : RUN_STATUS_Field;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RUN_PLL_Register use record
      STATUS        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Which PLL settings were selected when triggering START task
   type STAT_PLL_Register is record
      --  unspecified
      Reserved_0_15  : Interfaces.NRF54.UInt16;
      --  Read-only. PLL state (Running between START task and STOPPED event)
      STATE          : STAT_STATE_Field;
      --  unspecified
      Reserved_17_31 : Interfaces.NRF54.UInt15;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for STAT_PLL_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      STATE          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  Unspecified
   type CLOCK_PLL_Cluster is record
      --  Indicates that PLLSTART task was triggered
      RUN  : aliased RUN_PLL_Register;
      pragma Volatile_Full_Access (RUN);
      --  Which PLL settings were selected when triggering START task
      STAT : aliased STAT_PLL_Register;
      pragma Volatile_Full_Access (STAT);
   end record
     with Size => 128;

   for CLOCK_PLL_Cluster use record
      RUN  at 16#8# range 0 .. 31;
      STAT at 16#C# range 0 .. 31;
   end record;

   -------------------------------------
   -- CLOCK_LFCLK cluster's Registers --
   -------------------------------------

   --  Select which LFCLK source is started by the LFCLKSTART task
   type SRC_SRC_Field is
     (--  32.768 kHz RC oscillator
      LFRC,
      --  32.768 kHz crystal oscillator
      LFXO,
      --  32.768 kHz synthesized from HFCLK
      LFSYNT)
     with Size => 2;
   for SRC_SRC_Field use
     (LFRC => 0,
      LFXO => 1,
      LFSYNT => 2);

   --  Clock source for LFCLK
   type SRC_LFCLK_Register is record
      --  Select which LFCLK source is started by the LFCLKSTART task
      SRC           : SRC_SRC_Field := Interfaces.NRF54.CLOCK.LFRC;
      --  unspecified
      Reserved_2_31 : Interfaces.NRF54.UInt30 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SRC_LFCLK_Register use record
      SRC           at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Indicates that LFCLKSTART task was triggered
   type RUN_LFCLK_Register is record
      --  Read-only. LFCLKSTART task triggered or not
      STATUS        : RUN_STATUS_Field;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RUN_LFCLK_Register use record
      STATUS        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Value of LFCLK.SRCCOPY register when LFCLKSTARTED event was triggered
   type STAT_SRC_Field is
     (--  32.768 kHz RC oscillator
      LFRC,
      --  32.768 kHz crystal oscillator
      LFXO,
      --  32.768 kHz synthesized from HFCLK
      LFSYNT)
     with Size => 2;
   for STAT_SRC_Field use
     (LFRC => 0,
      LFXO => 1,
      LFSYNT => 2);

   --  ALWAYSRUN activated
   type STAT_ALWAYSRUNNING_Field is
     (--  Automatic clock control enabled
      NotRunning,
      --  Oscillator is always running
      Running)
     with Size => 1;
   for STAT_ALWAYSRUNNING_Field use
     (NotRunning => 0,
      Running => 1);

   --  Copy of LFCLK.SRCCOPY register, set when LFCLKSTARTED event is
   --  triggered.
   type STAT_LFCLK_Register is record
      --  Read-only. Value of LFCLK.SRCCOPY register when LFCLKSTARTED event
      --  was triggered
      SRC            : STAT_SRC_Field;
      --  unspecified
      Reserved_2_3   : Interfaces.NRF54.UInt2;
      --  Read-only. ALWAYSRUN activated
      ALWAYSRUNNING  : STAT_ALWAYSRUNNING_Field;
      --  unspecified
      Reserved_5_15  : Interfaces.NRF54.UInt11;
      --  Read-only. LFCLK state (Running between START task and STOPPED event)
      STATE          : STAT_STATE_Field;
      --  unspecified
      Reserved_17_31 : Interfaces.NRF54.UInt15;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for STAT_LFCLK_Register use record
      SRC            at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      ALWAYSRUNNING  at 0 range 4 .. 4;
      Reserved_5_15  at 0 range 5 .. 15;
      STATE          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  Value of LFCLK.SRC register when LFCLKSTART task was triggered
   type SRCCOPY_SRC_Field is
     (--  32.768 kHz RC oscillator
      LFRC,
      --  32.768 kHz crystal oscillator
      LFXO,
      --  32.768 kHz synthesized from HFCLK
      LFSYNT)
     with Size => 2;
   for SRCCOPY_SRC_Field use
     (LFRC => 0,
      LFXO => 1,
      LFSYNT => 2);

   --  Copy of LFCLK.SRC register, set when LFCLKSTART task is triggered
   type SRCCOPY_LFCLK_Register is record
      --  Value of LFCLK.SRC register when LFCLKSTART task was triggered
      SRC           : SRCCOPY_SRC_Field := Interfaces.NRF54.CLOCK.LFRC;
      --  unspecified
      Reserved_2_31 : Interfaces.NRF54.UInt30 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SRCCOPY_LFCLK_Register use record
      SRC           at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Unspecified
   type CLOCK_LFCLK_Cluster is record
      --  Clock source for LFCLK
      SRC     : aliased SRC_LFCLK_Register;
      pragma Volatile_Full_Access (SRC);
      --  Indicates that LFCLKSTART task was triggered
      RUN     : aliased RUN_LFCLK_Register;
      pragma Volatile_Full_Access (RUN);
      --  Copy of LFCLK.SRCCOPY register, set when LFCLKSTARTED event is
      --  triggered.
      STAT    : aliased STAT_LFCLK_Register;
      pragma Volatile_Full_Access (STAT);
      --  Copy of LFCLK.SRC register, set when LFCLKSTART task is triggered
      SRCCOPY : aliased SRCCOPY_LFCLK_Register;
      pragma Volatile_Full_Access (SRCCOPY);
   end record
     with Size => 160;

   for CLOCK_LFCLK_Cluster use record
      SRC     at 16#0# range 0 .. 31;
      RUN     at 16#8# range 0 .. 31;
      STAT    at 16#C# range 0 .. 31;
      SRCCOPY at 16#10# range 0 .. 31;
   end record;

   ----------------------------------
   -- CLOCK_XO cluster's Registers --
   ----------------------------------

   -----------------------------------
   -- CLOCK_PLL cluster's Registers --
   -----------------------------------

   -------------------------------------
   -- CLOCK_LFCLK cluster's Registers --
   -------------------------------------

   -----------------
   -- Peripherals --
   -----------------

   --  Clock management 0
   type CLOCK_Peripheral is record
      --  Start crystal oscillator (HFXO)
      TASKS_XOSTART        : aliased TASKS_XOSTART_Register;
      pragma Volatile_Full_Access (TASKS_XOSTART);
      --  Stop crystal oscillator (HFXO)
      TASKS_XOSTOP         : aliased TASKS_XOSTOP_Register;
      pragma Volatile_Full_Access (TASKS_XOSTOP);
      --  Start PLL and keep it running, regardless of the automatic clock
      --  requests
      TASKS_PLLSTART       : aliased TASKS_PLLSTART_Register;
      pragma Volatile_Full_Access (TASKS_PLLSTART);
      --  Stop PLL
      TASKS_PLLSTOP        : aliased TASKS_PLLSTOP_Register;
      pragma Volatile_Full_Access (TASKS_PLLSTOP);
      --  Start LFCLK source as selected in LFCLK.SRC
      TASKS_LFCLKSTART     : aliased TASKS_LFCLKSTART_Register;
      pragma Volatile_Full_Access (TASKS_LFCLKSTART);
      --  Stop LFCLK source
      TASKS_LFCLKSTOP      : aliased TASKS_LFCLKSTOP_Register;
      pragma Volatile_Full_Access (TASKS_LFCLKSTOP);
      --  Start calibration of LFRC oscillator
      TASKS_CAL            : aliased TASKS_CAL_Register;
      pragma Volatile_Full_Access (TASKS_CAL);
      --  Request tuning for HFXO
      TASKS_XOTUNE         : aliased TASKS_XOTUNE_Register;
      pragma Volatile_Full_Access (TASKS_XOTUNE);
      --  Abort tuning for HFXO
      TASKS_XOTUNEABORT    : aliased TASKS_XOTUNEABORT_Register;
      pragma Volatile_Full_Access (TASKS_XOTUNEABORT);
      --  Subscribe configuration for task XOSTART
      SUBSCRIBE_XOSTART    : aliased SUBSCRIBE_XOSTART_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_XOSTART);
      --  Subscribe configuration for task XOSTOP
      SUBSCRIBE_XOSTOP     : aliased SUBSCRIBE_XOSTOP_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_XOSTOP);
      --  Subscribe configuration for task PLLSTART
      SUBSCRIBE_PLLSTART   : aliased SUBSCRIBE_PLLSTART_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_PLLSTART);
      --  Subscribe configuration for task PLLSTOP
      SUBSCRIBE_PLLSTOP    : aliased SUBSCRIBE_PLLSTOP_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_PLLSTOP);
      --  Subscribe configuration for task LFCLKSTART
      SUBSCRIBE_LFCLKSTART : aliased SUBSCRIBE_LFCLKSTART_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_LFCLKSTART);
      --  Subscribe configuration for task LFCLKSTOP
      SUBSCRIBE_LFCLKSTOP  : aliased SUBSCRIBE_LFCLKSTOP_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_LFCLKSTOP);
      --  Subscribe configuration for task CAL
      SUBSCRIBE_CAL        : aliased SUBSCRIBE_CAL_Register;
      pragma Volatile_Full_Access (SUBSCRIBE_CAL);
      --  Crystal oscillator has started
      EVENTS_XOSTARTED     : aliased EVENTS_XOSTARTED_Register;
      pragma Volatile_Full_Access (EVENTS_XOSTARTED);
      --  PLL started
      EVENTS_PLLSTARTED    : aliased EVENTS_PLLSTARTED_Register;
      pragma Volatile_Full_Access (EVENTS_PLLSTARTED);
      --  LFCLK source started
      EVENTS_LFCLKSTARTED  : aliased EVENTS_LFCLKSTARTED_Register;
      pragma Volatile_Full_Access (EVENTS_LFCLKSTARTED);
      --  Calibration of LFRC oscillator complete event
      EVENTS_DONE          : aliased EVENTS_DONE_Register;
      pragma Volatile_Full_Access (EVENTS_DONE);
      --  HFXO tuning is done. XOTUNED is generated after TASKS_XOSTART or
      --  after TASKS_XOTUNE has completed
      EVENTS_XOTUNED       : aliased EVENTS_XOTUNED_Register;
      pragma Volatile_Full_Access (EVENTS_XOTUNED);
      --  HFXO quality issue detected, XOTUNE is needed
      EVENTS_XOTUNEERROR   : aliased EVENTS_XOTUNEERROR_Register;
      pragma Volatile_Full_Access (EVENTS_XOTUNEERROR);
      --  HFXO tuning could not be completed
      EVENTS_XOTUNEFAILED  : aliased EVENTS_XOTUNEFAILED_Register;
      pragma Volatile_Full_Access (EVENTS_XOTUNEFAILED);
      --  Enable or disable interrupt
      INTEN                : aliased INTEN_Register;
      pragma Volatile_Full_Access (INTEN);
      --  Enable interrupt
      INTENSET             : aliased INTENSET_Register;
      pragma Volatile_Full_Access (INTENSET);
      --  Disable interrupt
      INTENCLR             : aliased INTENCLR_Register;
      pragma Volatile_Full_Access (INTENCLR);
      --  Pending interrupts
      INTPEND              : aliased INTPEND_Register;
      pragma Volatile_Full_Access (INTPEND);
      --  Unspecified
      XO                   : aliased CLOCK_XO_Cluster;
      --  Unspecified
      PLL                  : aliased CLOCK_PLL_Cluster;
      --  Unspecified
      LFCLK                : aliased CLOCK_LFCLK_Cluster;
   end record
     with Volatile;

   for CLOCK_Peripheral use record
      TASKS_XOSTART        at 16#0# range 0 .. 31;
      TASKS_XOSTOP         at 16#4# range 0 .. 31;
      TASKS_PLLSTART       at 16#8# range 0 .. 31;
      TASKS_PLLSTOP        at 16#C# range 0 .. 31;
      TASKS_LFCLKSTART     at 16#10# range 0 .. 31;
      TASKS_LFCLKSTOP      at 16#14# range 0 .. 31;
      TASKS_CAL            at 16#18# range 0 .. 31;
      TASKS_XOTUNE         at 16#1C# range 0 .. 31;
      TASKS_XOTUNEABORT    at 16#20# range 0 .. 31;
      SUBSCRIBE_XOSTART    at 16#80# range 0 .. 31;
      SUBSCRIBE_XOSTOP     at 16#84# range 0 .. 31;
      SUBSCRIBE_PLLSTART   at 16#88# range 0 .. 31;
      SUBSCRIBE_PLLSTOP    at 16#8C# range 0 .. 31;
      SUBSCRIBE_LFCLKSTART at 16#90# range 0 .. 31;
      SUBSCRIBE_LFCLKSTOP  at 16#94# range 0 .. 31;
      SUBSCRIBE_CAL        at 16#98# range 0 .. 31;
      EVENTS_XOSTARTED     at 16#100# range 0 .. 31;
      EVENTS_PLLSTARTED    at 16#104# range 0 .. 31;
      EVENTS_LFCLKSTARTED  at 16#108# range 0 .. 31;
      EVENTS_DONE          at 16#10C# range 0 .. 31;
      EVENTS_XOTUNED       at 16#110# range 0 .. 31;
      EVENTS_XOTUNEERROR   at 16#114# range 0 .. 31;
      EVENTS_XOTUNEFAILED  at 16#118# range 0 .. 31;
      INTEN                at 16#300# range 0 .. 31;
      INTENSET             at 16#304# range 0 .. 31;
      INTENCLR             at 16#308# range 0 .. 31;
      INTPEND              at 16#30C# range 0 .. 31;
      XO                   at 16#400# range 0 .. 127;
      PLL                  at 16#420# range 0 .. 127;
      LFCLK                at 16#440# range 0 .. 159;
   end record;

   --  Clock management 0
   GLOBAL_CLOCK_NS_Periph : aliased CLOCK_Peripheral
     with Import, Address => GLOBAL_CLOCK_NS_Base;

   --  Clock management 1
   GLOBAL_CLOCK_S_Periph : aliased CLOCK_Peripheral
     with Import, Address => GLOBAL_CLOCK_S_Base;

end Interfaces.NRF54.CLOCK;
