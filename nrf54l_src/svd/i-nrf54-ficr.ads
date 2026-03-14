--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

package Interfaces.NRF54.FICR is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   -----------------------------------
   -- FICR_INFO cluster's Registers --
   -----------------------------------

   subtype CONFIGID_INFO_HWID_Field is Interfaces.NRF54.UInt16;

   --  Configuration identifier
   type CONFIGID_INFO_Register is record
      --  Read-only. Identification number for the HW
      HWID           : CONFIGID_INFO_HWID_Field;
      --  unspecified
      Reserved_16_31 : Interfaces.NRF54.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CONFIGID_INFO_Register use record
      HWID           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Description collection: Device identifier
   --  Description collection: 128-bit Universally Unique IDentifier (UUID).

   --  Device info
   type FICR_INFO_Cluster is record
      --  Configuration identifier
      CONFIGID   : aliased CONFIGID_INFO_Register;
      pragma Volatile_Full_Access (CONFIGID);
      --  Description collection: Device identifier
      DEVICEID_0 : aliased Interfaces.NRF54.UInt32;
      --  Description collection: Device identifier
      DEVICEID_1 : aliased Interfaces.NRF54.UInt32;
      --  Description collection: 128-bit Universally Unique IDentifier (UUID).
      UUID_0     : aliased Interfaces.NRF54.UInt32;
      --  Description collection: 128-bit Universally Unique IDentifier (UUID).
      UUID_1     : aliased Interfaces.NRF54.UInt32;
      --  Description collection: 128-bit Universally Unique IDentifier (UUID).
      UUID_2     : aliased Interfaces.NRF54.UInt32;
      --  Description collection: 128-bit Universally Unique IDentifier (UUID).
      UUID_3     : aliased Interfaces.NRF54.UInt32;
      --  Part code
      PART       : aliased Interfaces.NRF54.UInt32;
      --  Part Variant, Hardware version and Production configuration
      VARIANT    : aliased Interfaces.NRF54.UInt32;
      --  Package option
      PACKAGE_k  : aliased Interfaces.NRF54.UInt32;
      --  RAM size (KB)
      RAM        : aliased Interfaces.NRF54.UInt32;
      --  RRAM size (KB)
      RRAM       : aliased Interfaces.NRF54.UInt32;
   end record
     with Size => 384;

   for FICR_INFO_Cluster use record
      CONFIGID   at 16#0# range 0 .. 31;
      DEVICEID_0 at 16#4# range 0 .. 31;
      DEVICEID_1 at 16#8# range 0 .. 31;
      UUID_0     at 16#C# range 0 .. 31;
      UUID_1     at 16#10# range 0 .. 31;
      UUID_2     at 16#14# range 0 .. 31;
      UUID_3     at 16#18# range 0 .. 31;
      PART       at 16#1C# range 0 .. 31;
      VARIANT    at 16#20# range 0 .. 31;
      PACKAGE_k  at 16#24# range 0 .. 31;
      RAM        at 16#28# range 0 .. 31;
      RRAM       at 16#2C# range 0 .. 31;
   end record;

   --  Description collection: Common encryption root key, word n
   --  Description collection: Common identity root key, word n

   --  Device address type
   type DEVICEADDRTYPE_DEVICEADDRTYPE_Field is
     (--  Public address
      Public,
      --  Random address
      Random)
     with Size => 1;
   for DEVICEADDRTYPE_DEVICEADDRTYPE_Field use
     (Public => 0,
      Random => 1);

   --  Device address type
   type DEVICEADDRTYPE_Register is record
      --  Read-only. Device address type
      DEVICEADDRTYPE : DEVICEADDRTYPE_DEVICEADDRTYPE_Field;
      --  unspecified
      Reserved_1_31  : Interfaces.NRF54.UInt31;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DEVICEADDRTYPE_Register use record
      DEVICEADDRTYPE at 0 range 0 .. 0;
      Reserved_1_31  at 0 range 1 .. 31;
   end record;

   --  Description collection: Device address n

   --------------------------------------
   -- FICR_TRIMCNF cluster's Registers --
   --------------------------------------

   --  Unspecified
   type FICR_TRIMCNF_Cluster is record
      --  Description cluster: Address of the register which will be written
      ADDR : aliased Interfaces.NRF54.UInt32;
      --  Description cluster: Data to be written into the register
      DATA : aliased Interfaces.NRF54.UInt32;
   end record
     with Size => 64;

   for FICR_TRIMCNF_Cluster use record
      ADDR at 16#0# range 0 .. 31;
      DATA at 16#4# range 0 .. 31;
   end record;

   --  Unspecified
   type FICR_TRIMCNF_Clusters is array (0 .. 63) of FICR_TRIMCNF_Cluster;

   ----------------------------------
   -- FICR_NFC cluster's Registers --
   ----------------------------------

   subtype TAGHEADER0_NFC_MFGID_Field is Interfaces.NRF54.Byte;
   --  TAGHEADER0_NFC_UD array element
   subtype TAGHEADER0_NFC_UD_Element is Interfaces.NRF54.Byte;

   --  TAGHEADER0_NFC_UD array
   type TAGHEADER0_NFC_UD_Field_Array is array (1 .. 3)
     of TAGHEADER0_NFC_UD_Element
     with Component_Size => 8, Size => 24;

   --  Type definition for TAGHEADER0_NFC_UD
   type TAGHEADER0_NFC_UD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UD as a value
            Val : Interfaces.NRF54.UInt24;
         when True =>
            --  UD as an array
            Arr : TAGHEADER0_NFC_UD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 24;

   for TAGHEADER0_NFC_UD_Field use record
      Val at 0 range 0 .. 23;
      Arr at 0 range 0 .. 23;
   end record;

   --  Default header for NFC Tag. Software can read these values to populate
   --  NFCID1_3RD_LAST, NFCID1_2ND_LAST and NFCID1_LAST.
   type TAGHEADER0_NFC_Register is record
      --  Read-only. Default Manufacturer ID: Nordic Semiconductor ASA has ICM
      --  0x5F
      MFGID : TAGHEADER0_NFC_MFGID_Field;
      --  Read-only. Unique identifier byte 1
      UD    : TAGHEADER0_NFC_UD_Field;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TAGHEADER0_NFC_Register use record
      MFGID at 0 range 0 .. 7;
      UD    at 0 range 8 .. 31;
   end record;

   --  TAGHEADER1_NFC_UD array element
   subtype TAGHEADER1_NFC_UD_Element is Interfaces.NRF54.Byte;

   --  TAGHEADER1_NFC_UD array
   type TAGHEADER1_NFC_UD_Field_Array is array (4 .. 7)
     of TAGHEADER1_NFC_UD_Element
     with Component_Size => 8, Size => 32;

   --  Default header for NFC Tag. Software can read these values to populate
   --  NFCID1_3RD_LAST, NFCID1_2ND_LAST and NFCID1_LAST.
   type TAGHEADER1_NFC_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UD as a value
            Val : Interfaces.NRF54.UInt32;
         when True =>
            --  UD as an array
            Arr : TAGHEADER1_NFC_UD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TAGHEADER1_NFC_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  TAGHEADER2_NFC_UD array element
   subtype TAGHEADER2_NFC_UD_Element is Interfaces.NRF54.Byte;

   --  TAGHEADER2_NFC_UD array
   type TAGHEADER2_NFC_UD_Field_Array is array (8 .. 11)
     of TAGHEADER2_NFC_UD_Element
     with Component_Size => 8, Size => 32;

   --  Default header for NFC Tag. Software can read these values to populate
   --  NFCID1_3RD_LAST, NFCID1_2ND_LAST and NFCID1_LAST.
   type TAGHEADER2_NFC_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UD as a value
            Val : Interfaces.NRF54.UInt32;
         when True =>
            --  UD as an array
            Arr : TAGHEADER2_NFC_UD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TAGHEADER2_NFC_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  TAGHEADER3_NFC_UD array element
   subtype TAGHEADER3_NFC_UD_Element is Interfaces.NRF54.Byte;

   --  TAGHEADER3_NFC_UD array
   type TAGHEADER3_NFC_UD_Field_Array is array (12 .. 15)
     of TAGHEADER3_NFC_UD_Element
     with Component_Size => 8, Size => 32;

   --  Default header for NFC Tag. Software can read these values to populate
   --  NFCID1_3RD_LAST, NFCID1_2ND_LAST and NFCID1_LAST.
   type TAGHEADER3_NFC_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UD as a value
            Val : Interfaces.NRF54.UInt32;
         when True =>
            --  UD as an array
            Arr : TAGHEADER3_NFC_UD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TAGHEADER3_NFC_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Unspecified
   type FICR_NFC_Cluster is record
      --  Default header for NFC Tag. Software can read these values to
      --  populate NFCID1_3RD_LAST, NFCID1_2ND_LAST and NFCID1_LAST.
      TAGHEADER0 : aliased TAGHEADER0_NFC_Register;
      pragma Volatile_Full_Access (TAGHEADER0);
      --  Default header for NFC Tag. Software can read these values to
      --  populate NFCID1_3RD_LAST, NFCID1_2ND_LAST and NFCID1_LAST.
      TAGHEADER1 : aliased TAGHEADER1_NFC_Register;
      pragma Volatile_Full_Access (TAGHEADER1);
      --  Default header for NFC Tag. Software can read these values to
      --  populate NFCID1_3RD_LAST, NFCID1_2ND_LAST and NFCID1_LAST.
      TAGHEADER2 : aliased TAGHEADER2_NFC_Register;
      pragma Volatile_Full_Access (TAGHEADER2);
      --  Default header for NFC Tag. Software can read these values to
      --  populate NFCID1_3RD_LAST, NFCID1_2ND_LAST and NFCID1_LAST.
      TAGHEADER3 : aliased TAGHEADER3_NFC_Register;
      pragma Volatile_Full_Access (TAGHEADER3);
   end record
     with Size => 128;

   for FICR_NFC_Cluster use record
      TAGHEADER0 at 16#0# range 0 .. 31;
      TAGHEADER1 at 16#4# range 0 .. 31;
      TAGHEADER2 at 16#8# range 0 .. 31;
      TAGHEADER3 at 16#C# range 0 .. 31;
   end record;

   subtype XOSC32MTRIM_SLOPE_Field is Interfaces.NRF54.UInt9;
   subtype XOSC32MTRIM_OFFSET_Field is Interfaces.NRF54.UInt10;

   --  XOSC32M capacitor selection trim values
   type XOSC32MTRIM_Register is record
      --  Read-only. Slope trim factor on twos complement form
      SLOPE          : XOSC32MTRIM_SLOPE_Field;
      --  unspecified
      Reserved_9_15  : Interfaces.NRF54.UInt7;
      --  Read-only. Offset trim factor on integer form
      OFFSET         : XOSC32MTRIM_OFFSET_Field;
      --  unspecified
      Reserved_26_31 : Interfaces.NRF54.UInt6;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for XOSC32MTRIM_Register use record
      SLOPE          at 0 range 0 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      OFFSET         at 0 range 16 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype XOSC32KTRIM_SLOPE_Field is Interfaces.NRF54.UInt9;
   subtype XOSC32KTRIM_OFFSET_Field is Interfaces.NRF54.UInt10;

   --  XOSC32K capacitor selection trim values
   type XOSC32KTRIM_Register is record
      --  Read-only. Slope trim factor on twos complement form
      SLOPE          : XOSC32KTRIM_SLOPE_Field;
      --  unspecified
      Reserved_9_15  : Interfaces.NRF54.UInt7;
      --  Read-only. Offset trim factor on integer form
      OFFSET         : XOSC32KTRIM_OFFSET_Field;
      --  unspecified
      Reserved_26_31 : Interfaces.NRF54.UInt6;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for XOSC32KTRIM_Register use record
      SLOPE          at 0 range 0 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      OFFSET         at 0 range 16 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Factory Information Configuration Registers
   type FICR_Peripheral is record
      --  Device info
      INFO           : aliased FICR_INFO_Cluster;
      --  Description collection: Common encryption root key, word n
      ER_0           : aliased Interfaces.NRF54.UInt32;
      --  Description collection: Common encryption root key, word n
      ER_1           : aliased Interfaces.NRF54.UInt32;
      --  Description collection: Common encryption root key, word n
      ER_2           : aliased Interfaces.NRF54.UInt32;
      --  Description collection: Common encryption root key, word n
      ER_3           : aliased Interfaces.NRF54.UInt32;
      --  Description collection: Common identity root key, word n
      IR_0           : aliased Interfaces.NRF54.UInt32;
      --  Description collection: Common identity root key, word n
      IR_1           : aliased Interfaces.NRF54.UInt32;
      --  Description collection: Common identity root key, word n
      IR_2           : aliased Interfaces.NRF54.UInt32;
      --  Description collection: Common identity root key, word n
      IR_3           : aliased Interfaces.NRF54.UInt32;
      --  Device address type
      DEVICEADDRTYPE : aliased DEVICEADDRTYPE_Register;
      pragma Volatile_Full_Access (DEVICEADDRTYPE);
      --  Description collection: Device address n
      DEVICEADDR_0   : aliased Interfaces.NRF54.UInt32;
      --  Description collection: Device address n
      DEVICEADDR_1   : aliased Interfaces.NRF54.UInt32;
      --  Unspecified
      TRIMCNF        : aliased FICR_TRIMCNF_Clusters;
      --  Unspecified
      NFC            : aliased FICR_NFC_Cluster;
      --  XOSC32M capacitor selection trim values
      XOSC32MTRIM    : aliased XOSC32MTRIM_Register;
      pragma Volatile_Full_Access (XOSC32MTRIM);
      --  XOSC32K capacitor selection trim values
      XOSC32KTRIM    : aliased XOSC32KTRIM_Register;
      pragma Volatile_Full_Access (XOSC32KTRIM);
   end record
     with Volatile;

   for FICR_Peripheral use record
      INFO           at 16#300# range 0 .. 383;
      ER_0           at 16#380# range 0 .. 31;
      ER_1           at 16#384# range 0 .. 31;
      ER_2           at 16#388# range 0 .. 31;
      ER_3           at 16#38C# range 0 .. 31;
      IR_0           at 16#390# range 0 .. 31;
      IR_1           at 16#394# range 0 .. 31;
      IR_2           at 16#398# range 0 .. 31;
      IR_3           at 16#39C# range 0 .. 31;
      DEVICEADDRTYPE at 16#3A0# range 0 .. 31;
      DEVICEADDR_0   at 16#3A4# range 0 .. 31;
      DEVICEADDR_1   at 16#3A8# range 0 .. 31;
      TRIMCNF        at 16#400# range 0 .. 4095;
      NFC            at 16#600# range 0 .. 127;
      XOSC32MTRIM    at 16#620# range 0 .. 31;
      XOSC32KTRIM    at 16#624# range 0 .. 31;
   end record;

   --  Factory Information Configuration Registers
   GLOBAL_FICR_NS_Periph : aliased FICR_Peripheral
     with Import, Address => GLOBAL_FICR_NS_Base;

end Interfaces.NRF54.FICR;
