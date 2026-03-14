--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

package Interfaces.NRF54.GPIO is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Pin 0
   type OUT_PIN0_Field is
     (--  Pin driver is low
      Low,
      --  Pin driver is high
      High)
     with Size => 1;
   for OUT_PIN0_Field use
     (Low => 0,
      High => 1);

   --  OUT_PIN array
   type OUT_PIN_Field_Array is array (0 .. 31) of OUT_PIN0_Field
     with Component_Size => 1, Size => 32;

   --  Write GPIO port
   type OUT_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : Interfaces.NRF54.UInt32;
         when True =>
            --  PIN as an array
            Arr : OUT_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OUT_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Pin 0
   type OUTSET_PIN0_Field is
     (--  Read: pin driver is low
      Low,
      --  Read: pin driver is high
      High)
     with Size => 1;
   for OUTSET_PIN0_Field use
     (Low => 0,
      High => 1);

   --  Pin 0
   type OUTSET_PIN0_Field_1 is
     (--  Reset value for the field
      OUTSET_PIN0_Field_Reset,
      --  Write: writing a '1' sets the pin high; writing a '0' has no effect
      Set)
     with Size => 1;
   for OUTSET_PIN0_Field_1 use
     (OUTSET_PIN0_Field_Reset => 0,
      Set => 1);

   --  OUTSET_PIN array
   type OUTSET_PIN_Field_Array is array (0 .. 31) of OUTSET_PIN0_Field_1
     with Component_Size => 1, Size => 32;

   --  Set individual bits in GPIO port
   type OUTSET_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : Interfaces.NRF54.UInt32;
         when True =>
            --  PIN as an array
            Arr : OUTSET_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OUTSET_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Pin 0
   type OUTCLR_PIN0_Field is
     (--  Read: pin driver is low
      Low,
      --  Read: pin driver is high
      High)
     with Size => 1;
   for OUTCLR_PIN0_Field use
     (Low => 0,
      High => 1);

   --  Pin 0
   type OUTCLR_PIN0_Field_1 is
     (--  Reset value for the field
      OUTCLR_PIN0_Field_Reset,
      --  Write: writing a '1' sets the pin low; writing a '0' has no effect
      Clear)
     with Size => 1;
   for OUTCLR_PIN0_Field_1 use
     (OUTCLR_PIN0_Field_Reset => 0,
      Clear => 1);

   --  OUTCLR_PIN array
   type OUTCLR_PIN_Field_Array is array (0 .. 31) of OUTCLR_PIN0_Field_1
     with Component_Size => 1, Size => 32;

   --  Clear individual bits in GPIO port
   type OUTCLR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : Interfaces.NRF54.UInt32;
         when True =>
            --  PIN as an array
            Arr : OUTCLR_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OUTCLR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Pin 0
   type IN_PIN0_Field is
     (--  Pin input is low
      Low,
      --  Pin input is high
      High)
     with Size => 1;
   for IN_PIN0_Field use
     (Low => 0,
      High => 1);

   --  IN_PIN array
   type IN_PIN_Field_Array is array (0 .. 31) of IN_PIN0_Field
     with Component_Size => 1, Size => 32;

   --  Read GPIO port
   type IN_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : Interfaces.NRF54.UInt32;
         when True =>
            --  PIN as an array
            Arr : IN_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IN_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Pin 0
   type DIR_PIN0_Field is
     (--  Pin set as input
      Input,
      --  Pin set as output
      Output)
     with Size => 1;
   for DIR_PIN0_Field use
     (Input => 0,
      Output => 1);

   --  DIR_PIN array
   type DIR_PIN_Field_Array is array (0 .. 31) of DIR_PIN0_Field
     with Component_Size => 1, Size => 32;

   --  Direction of GPIO pins
   type DIR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : Interfaces.NRF54.UInt32;
         when True =>
            --  PIN as an array
            Arr : DIR_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Set as output pin 0
   type DIRSET_PIN0_Field is
     (--  Read: pin set as input
      Input,
      --  Read: pin set as output
      Output)
     with Size => 1;
   for DIRSET_PIN0_Field use
     (Input => 0,
      Output => 1);

   --  Set as output pin 0
   type DIRSET_PIN0_Field_1 is
     (--  Reset value for the field
      DIRSET_PIN0_Field_Reset,
      --  Write: writing a '1' sets pin to output; writing a '0' has no effect
      Set)
     with Size => 1;
   for DIRSET_PIN0_Field_1 use
     (DIRSET_PIN0_Field_Reset => 0,
      Set => 1);

   --  DIRSET_PIN array
   type DIRSET_PIN_Field_Array is array (0 .. 31) of DIRSET_PIN0_Field_1
     with Component_Size => 1, Size => 32;

   --  DIR set register
   type DIRSET_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : Interfaces.NRF54.UInt32;
         when True =>
            --  PIN as an array
            Arr : DIRSET_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIRSET_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Set as input pin 0
   type DIRCLR_PIN0_Field is
     (--  Read: pin set as input
      Input,
      --  Read: pin set as output
      Output)
     with Size => 1;
   for DIRCLR_PIN0_Field use
     (Input => 0,
      Output => 1);

   --  Set as input pin 0
   type DIRCLR_PIN0_Field_1 is
     (--  Reset value for the field
      DIRCLR_PIN0_Field_Reset,
      --  Write: writing a '1' sets pin to input; writing a '0' has no effect
      Clear)
     with Size => 1;
   for DIRCLR_PIN0_Field_1 use
     (DIRCLR_PIN0_Field_Reset => 0,
      Clear => 1);

   --  DIRCLR_PIN array
   type DIRCLR_PIN_Field_Array is array (0 .. 31) of DIRCLR_PIN0_Field_1
     with Component_Size => 1, Size => 32;

   --  DIR clear register
   type DIRCLR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : Interfaces.NRF54.UInt32;
         when True =>
            --  PIN as an array
            Arr : DIRCLR_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIRCLR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Status on whether PIN0 has met criteria set in PIN_CNF[0].SENSE
   --  register. Write '1' to clear.
   type LATCH_PIN0_Field is
     (--  Criteria has not been met
      NotLatched,
      --  Criteria has been met
      Latched)
     with Size => 1;
   for LATCH_PIN0_Field use
     (NotLatched => 0,
      Latched => 1);

   --  LATCH_PIN array
   type LATCH_PIN_Field_Array is array (0 .. 31) of LATCH_PIN0_Field
     with Component_Size => 1, Size => 32;

   --  Latch register indicating what GPIO pins that have met the criteria set
   --  in the PIN_CNF[n].SENSE registers
   type LATCH_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : Interfaces.NRF54.UInt32;
         when True =>
            --  PIN as an array
            Arr : LATCH_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for LATCH_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Select between default DETECT signal behavior and LDETECT mode
   type DETECTMODE_DETECTMODE_Field is
     (--  DETECT directly connected to PIN DETECT signals
      Default,
      --  Use the latched LDETECT behavior
      LDETECT)
     with Size => 1;
   for DETECTMODE_DETECTMODE_Field use
     (Default => 0,
      LDETECT => 1);

   --  Select between default DETECT signal behavior and LDETECT mode
   type DETECTMODE_Register is record
      --  Select between default DETECT signal behavior and LDETECT mode
      DETECTMODE    : DETECTMODE_DETECTMODE_Field :=
                       Interfaces.NRF54.GPIO.Default;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DETECTMODE_Register use record
      DETECTMODE    at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Pin direction. Same physical register as DIR register
   type PIN_CNF_DIR_Field is
     (--  Configure pin as an input pin
      Input,
      --  Configure pin as an output pin
      Output)
     with Size => 1;
   for PIN_CNF_DIR_Field use
     (Input => 0,
      Output => 1);

   --  Connect or disconnect input buffer
   type PIN_CNF_INPUT_Field is
     (--  Connect input buffer
      Connect,
      --  Disconnect input buffer
      Disconnect)
     with Size => 1;
   for PIN_CNF_INPUT_Field use
     (Connect => 0,
      Disconnect => 1);

   --  Pull configuration
   type PIN_CNF_PULL_Field is
     (--  No pull
      Disabled,
      --  Pull down on pin
      Pulldown,
      --  Pull up on pin
      Pullup)
     with Size => 2;
   for PIN_CNF_PULL_Field use
     (Disabled => 0,
      Pulldown => 1,
      Pullup => 3);

   --  Drive configuration for '0'
   type PIN_CNF_DRIVE0_Field is
     (--  Standard '0'
      S0,
      --  High drive '0'
      H0,
      --  Disconnect '0'(normally used for wired-or connections)
      D0,
      --  Extra high drive '0'
      E0)
     with Size => 2;
   for PIN_CNF_DRIVE0_Field use
     (S0 => 0,
      H0 => 1,
      D0 => 2,
      E0 => 3);

   --  Drive configuration for '1'
   type PIN_CNF_DRIVE1_Field is
     (--  Standard '1'
      S1,
      --  High drive '1'
      H1,
      --  Disconnect '1'(normally used for wired-or connections)
      D1,
      --  Extra high drive '1'
      E1)
     with Size => 2;
   for PIN_CNF_DRIVE1_Field use
     (S1 => 0,
      H1 => 1,
      D1 => 2,
      E1 => 3);

   --  Pin sensing mechanism
   type PIN_CNF_SENSE_Field is
     (--  Disabled
      Disabled,
      --  Sense for high level
      High,
      --  Sense for low level
      Low)
     with Size => 2;
   for PIN_CNF_SENSE_Field use
     (Disabled => 0,
      High => 2,
      Low => 3);

   --  Select which module has direct control over this pin
   type PIN_CNF_CTRLSEL_Field is
     (--  GPIO or peripherals with PSEL registers
      GPIO,
      --  VPR processor
      VPR,
      --  GRTC peripheral
      GRTC)
     with Size => 3;
   for PIN_CNF_CTRLSEL_Field use
     (GPIO => 0,
      VPR => 1,
      GRTC => 4);

   --  Description collection: Pin n configuration of GPIO pin
   type PIN_CNF_Register is record
      --  Pin direction. Same physical register as DIR register
      DIR            : PIN_CNF_DIR_Field := Interfaces.NRF54.GPIO.Input;
      --  Connect or disconnect input buffer
      INPUT          : PIN_CNF_INPUT_Field :=
                        Interfaces.NRF54.GPIO.Disconnect;
      --  Pull configuration
      PULL           : PIN_CNF_PULL_Field := Interfaces.NRF54.GPIO.Disabled;
      --  unspecified
      Reserved_4_7   : Interfaces.NRF54.UInt4 := 16#0#;
      --  Drive configuration for '0'
      DRIVE0         : PIN_CNF_DRIVE0_Field := Interfaces.NRF54.GPIO.S0;
      --  Drive configuration for '1'
      DRIVE1         : PIN_CNF_DRIVE1_Field := Interfaces.NRF54.GPIO.S1;
      --  unspecified
      Reserved_12_15 : Interfaces.NRF54.UInt4 := 16#0#;
      --  Pin sensing mechanism
      SENSE          : PIN_CNF_SENSE_Field := Interfaces.NRF54.GPIO.Disabled;
      --  unspecified
      Reserved_18_27 : Interfaces.NRF54.UInt10 := 16#0#;
      --  Select which module has direct control over this pin
      CTRLSEL        : PIN_CNF_CTRLSEL_Field := Interfaces.NRF54.GPIO.GPIO;
      --  unspecified
      Reserved_31_31 : Interfaces.NRF54.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PIN_CNF_Register use record
      DIR            at 0 range 0 .. 0;
      INPUT          at 0 range 1 .. 1;
      PULL           at 0 range 2 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      DRIVE0         at 0 range 8 .. 9;
      DRIVE1         at 0 range 10 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      SENSE          at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      CTRLSEL        at 0 range 28 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  GPIO Port 4
   type GPIO_Peripheral is record
      --  Write GPIO port
      OUT_k      : aliased OUT_Register;
      pragma Volatile_Full_Access (OUT_k);
      --  Set individual bits in GPIO port
      OUTSET     : aliased OUTSET_Register;
      pragma Volatile_Full_Access (OUTSET);
      --  Clear individual bits in GPIO port
      OUTCLR     : aliased OUTCLR_Register;
      pragma Volatile_Full_Access (OUTCLR);
      --  Read GPIO port
      IN_k       : aliased IN_Register;
      pragma Volatile_Full_Access (IN_k);
      --  Direction of GPIO pins
      DIR        : aliased DIR_Register;
      pragma Volatile_Full_Access (DIR);
      --  DIR set register
      DIRSET     : aliased DIRSET_Register;
      pragma Volatile_Full_Access (DIRSET);
      --  DIR clear register
      DIRCLR     : aliased DIRCLR_Register;
      pragma Volatile_Full_Access (DIRCLR);
      --  Latch register indicating what GPIO pins that have met the criteria
      --  set in the PIN_CNF[n].SENSE registers
      LATCH      : aliased LATCH_Register;
      pragma Volatile_Full_Access (LATCH);
      --  Select between default DETECT signal behavior and LDETECT mode
      DETECTMODE : aliased DETECTMODE_Register;
      pragma Volatile_Full_Access (DETECTMODE);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_0  : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_0);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_1  : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_1);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_2  : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_2);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_3  : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_3);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_4  : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_4);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_5  : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_5);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_6  : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_6);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_7  : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_7);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_8  : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_8);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_9  : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_9);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_10 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_10);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_11 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_11);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_12 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_12);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_13 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_13);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_14 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_14);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_15 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_15);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_16 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_16);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_17 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_17);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_18 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_18);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_19 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_19);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_20 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_20);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_21 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_21);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_22 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_22);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_23 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_23);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_24 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_24);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_25 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_25);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_26 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_26);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_27 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_27);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_28 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_28);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_29 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_29);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_30 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_30);
      --  Description collection: Pin n configuration of GPIO pin
      PIN_CNF_31 : aliased PIN_CNF_Register;
      pragma Volatile_Full_Access (PIN_CNF_31);
   end record
     with Volatile;

   for GPIO_Peripheral use record
      OUT_k      at 16#0# range 0 .. 31;
      OUTSET     at 16#4# range 0 .. 31;
      OUTCLR     at 16#8# range 0 .. 31;
      IN_k       at 16#C# range 0 .. 31;
      DIR        at 16#10# range 0 .. 31;
      DIRSET     at 16#14# range 0 .. 31;
      DIRCLR     at 16#18# range 0 .. 31;
      LATCH      at 16#20# range 0 .. 31;
      DETECTMODE at 16#24# range 0 .. 31;
      PIN_CNF_0  at 16#80# range 0 .. 31;
      PIN_CNF_1  at 16#84# range 0 .. 31;
      PIN_CNF_2  at 16#88# range 0 .. 31;
      PIN_CNF_3  at 16#8C# range 0 .. 31;
      PIN_CNF_4  at 16#90# range 0 .. 31;
      PIN_CNF_5  at 16#94# range 0 .. 31;
      PIN_CNF_6  at 16#98# range 0 .. 31;
      PIN_CNF_7  at 16#9C# range 0 .. 31;
      PIN_CNF_8  at 16#A0# range 0 .. 31;
      PIN_CNF_9  at 16#A4# range 0 .. 31;
      PIN_CNF_10 at 16#A8# range 0 .. 31;
      PIN_CNF_11 at 16#AC# range 0 .. 31;
      PIN_CNF_12 at 16#B0# range 0 .. 31;
      PIN_CNF_13 at 16#B4# range 0 .. 31;
      PIN_CNF_14 at 16#B8# range 0 .. 31;
      PIN_CNF_15 at 16#BC# range 0 .. 31;
      PIN_CNF_16 at 16#C0# range 0 .. 31;
      PIN_CNF_17 at 16#C4# range 0 .. 31;
      PIN_CNF_18 at 16#C8# range 0 .. 31;
      PIN_CNF_19 at 16#CC# range 0 .. 31;
      PIN_CNF_20 at 16#D0# range 0 .. 31;
      PIN_CNF_21 at 16#D4# range 0 .. 31;
      PIN_CNF_22 at 16#D8# range 0 .. 31;
      PIN_CNF_23 at 16#DC# range 0 .. 31;
      PIN_CNF_24 at 16#E0# range 0 .. 31;
      PIN_CNF_25 at 16#E4# range 0 .. 31;
      PIN_CNF_26 at 16#E8# range 0 .. 31;
      PIN_CNF_27 at 16#EC# range 0 .. 31;
      PIN_CNF_28 at 16#F0# range 0 .. 31;
      PIN_CNF_29 at 16#F4# range 0 .. 31;
      PIN_CNF_30 at 16#F8# range 0 .. 31;
      PIN_CNF_31 at 16#FC# range 0 .. 31;
   end record;

   --  GPIO Port 4
   GLOBAL_P0_NS_Periph : aliased GPIO_Peripheral
     with Import, Address => GLOBAL_P0_NS_Base;

   --  GPIO Port 5
   GLOBAL_P0_S_Periph : aliased GPIO_Peripheral
     with Import, Address => GLOBAL_P0_S_Base;

   --  GPIO Port 2
   GLOBAL_P1_NS_Periph : aliased GPIO_Peripheral
     with Import, Address => GLOBAL_P1_NS_Base;

   --  GPIO Port 3
   GLOBAL_P1_S_Periph : aliased GPIO_Peripheral
     with Import, Address => GLOBAL_P1_S_Base;

   --  GPIO Port 0
   GLOBAL_P2_NS_Periph : aliased GPIO_Peripheral
     with Import, Address => GLOBAL_P2_NS_Base;

   --  GPIO Port 1
   GLOBAL_P2_S_Periph : aliased GPIO_Peripheral
     with Import, Address => GLOBAL_P2_S_Base;

end Interfaces.NRF54.GPIO;
