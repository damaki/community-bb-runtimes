--
--  Copyright (C) 2025, AdaCore
--

pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G0B0.svd


with System;

package Interfaces.STM32.Flash is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype ACR_LATENCY_Field is Interfaces.STM32.UInt3;
   subtype ACR_PRFTEN_Field is Interfaces.STM32.Bit;
   subtype ACR_ICEN_Field is Interfaces.STM32.Bit;
   subtype ACR_ICRST_Field is Interfaces.STM32.Bit;
   subtype ACR_EMPTY_Field is Interfaces.STM32.Bit;

   --  Access control register
   type ACR_Register is record
      --  Latency
      LATENCY        : ACR_LATENCY_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : Interfaces.STM32.UInt5 := 16#0#;
      --  Prefetch enable
      PRFTEN         : ACR_PRFTEN_Field := 16#0#;
      --  Instruction cache enable
      ICEN           : ACR_ICEN_Field := 16#1#;
      --  unspecified
      Reserved_10_10 : Interfaces.STM32.Bit := 16#1#;
      --  Instruction cache reset
      ICRST          : ACR_ICRST_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : Interfaces.STM32.UInt4 := 16#0#;
      --  Flash User area empty
      EMPTY          : ACR_EMPTY_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.STM32.UInt15 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ACR_Register use record
      LATENCY        at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      PRFTEN         at 0 range 8 .. 8;
      ICEN           at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      ICRST          at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      EMPTY          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype SR_EOP_Field is Interfaces.STM32.Bit;
   subtype SR_OPERR_Field is Interfaces.STM32.Bit;
   subtype SR_PROGERR_Field is Interfaces.STM32.Bit;
   subtype SR_WRPERR_Field is Interfaces.STM32.Bit;
   subtype SR_PGAERR_Field is Interfaces.STM32.Bit;
   subtype SR_SIZERR_Field is Interfaces.STM32.Bit;
   subtype SR_PGSERR_Field is Interfaces.STM32.Bit;
   subtype SR_MISERR_Field is Interfaces.STM32.Bit;
   subtype SR_FASTERR_Field is Interfaces.STM32.Bit;
   subtype SR_OPTVERR_Field is Interfaces.STM32.Bit;
   --  SR_BSY array element
   subtype SR_BSY_Element is Interfaces.STM32.Bit;

   --  SR_BSY array
   type SR_BSY_Field_Array is array (1 .. 2) of SR_BSY_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SR_BSY
   type SR_BSY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BSY as a value
            Val : Interfaces.STM32.UInt2;
         when True =>
            --  BSY as an array
            Arr : SR_BSY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SR_BSY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SR_CFGBSY_Field is Interfaces.STM32.Bit;

   --  Status register
   type SR_Register is record
      --  End of operation
      EOP            : SR_EOP_Field := 16#0#;
      --  Operation error
      OPERR          : SR_OPERR_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.STM32.Bit := 16#0#;
      --  Programming error
      PROGERR        : SR_PROGERR_Field := 16#0#;
      --  Write protected error
      WRPERR         : SR_WRPERR_Field := 16#0#;
      --  Programming alignment error
      PGAERR         : SR_PGAERR_Field := 16#0#;
      --  Size error
      SIZERR         : SR_SIZERR_Field := 16#0#;
      --  Programming sequence error
      PGSERR         : SR_PGSERR_Field := 16#0#;
      --  Fast programming data miss error
      MISERR         : SR_MISERR_Field := 16#0#;
      --  Fast programming error
      FASTERR        : SR_FASTERR_Field := 16#0#;
      --  unspecified
      Reserved_10_14 : Interfaces.STM32.UInt5 := 16#0#;
      --  Option and Engineering bits loading validity error
      OPTVERR        : SR_OPTVERR_Field := 16#0#;
      --  BSY1
      BSY            : SR_BSY_Field := (As_Array => False, Val => 16#0#);
      --  Programming or erase configuration busy.
      CFGBSY         : SR_CFGBSY_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : Interfaces.STM32.UInt13 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
      EOP            at 0 range 0 .. 0;
      OPERR          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      PROGERR        at 0 range 3 .. 3;
      WRPERR         at 0 range 4 .. 4;
      PGAERR         at 0 range 5 .. 5;
      SIZERR         at 0 range 6 .. 6;
      PGSERR         at 0 range 7 .. 7;
      MISERR         at 0 range 8 .. 8;
      FASTERR        at 0 range 9 .. 9;
      Reserved_10_14 at 0 range 10 .. 14;
      OPTVERR        at 0 range 15 .. 15;
      BSY            at 0 range 16 .. 17;
      CFGBSY         at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype CR_PG_Field is Interfaces.STM32.Bit;
   subtype CR_PER_Field is Interfaces.STM32.Bit;
   subtype CR_MER1_Field is Interfaces.STM32.Bit;
   subtype CR_PNB_Field is Interfaces.STM32.UInt10;
   subtype CR_BKER_Field is Interfaces.STM32.Bit;
   subtype CR_MER2_Field is Interfaces.STM32.Bit;
   subtype CR_STRT_Field is Interfaces.STM32.Bit;
   subtype CR_OPTSTRT_Field is Interfaces.STM32.Bit;
   subtype CR_FSTPG_Field is Interfaces.STM32.Bit;
   subtype CR_EOPIE_Field is Interfaces.STM32.Bit;
   subtype CR_ERRIE_Field is Interfaces.STM32.Bit;
   subtype CR_OBL_LAUNCH_Field is Interfaces.STM32.Bit;
   subtype CR_OPTLOCK_Field is Interfaces.STM32.Bit;
   subtype CR_LOCK_Field is Interfaces.STM32.Bit;

   --  Flash control register
   type CR_Register is record
      --  Programming
      PG             : CR_PG_Field := 16#0#;
      --  Page erase
      PER            : CR_PER_Field := 16#0#;
      --  Mass erase
      MER1           : CR_MER1_Field := 16#0#;
      --  Page number
      PNB            : CR_PNB_Field := 16#0#;
      --  BKER
      BKER           : CR_BKER_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : Interfaces.STM32.Bit := 16#0#;
      --  MER2
      MER2           : CR_MER2_Field := 16#0#;
      --  Start
      STRT           : CR_STRT_Field := 16#0#;
      --  Options modification start
      OPTSTRT        : CR_OPTSTRT_Field := 16#0#;
      --  Fast programming
      FSTPG          : CR_FSTPG_Field := 16#0#;
      --  unspecified
      Reserved_19_23 : Interfaces.STM32.UInt5 := 16#0#;
      --  End of operation interrupt enable
      EOPIE          : CR_EOPIE_Field := 16#0#;
      --  Error interrupt enable
      ERRIE          : CR_ERRIE_Field := 16#0#;
      --  unspecified
      Reserved_26_26 : Interfaces.STM32.Bit := 16#0#;
      --  Force the option byte loading
      OBL_LAUNCH     : CR_OBL_LAUNCH_Field := 16#0#;
      --  unspecified
      Reserved_28_29 : Interfaces.STM32.UInt2 := 16#0#;
      --  Options Lock
      OPTLOCK        : CR_OPTLOCK_Field := 16#1#;
      --  FLASH_CR Lock
      LOCK           : CR_LOCK_Field := 16#1#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      PG             at 0 range 0 .. 0;
      PER            at 0 range 1 .. 1;
      MER1           at 0 range 2 .. 2;
      PNB            at 0 range 3 .. 12;
      BKER           at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      MER2           at 0 range 15 .. 15;
      STRT           at 0 range 16 .. 16;
      OPTSTRT        at 0 range 17 .. 17;
      FSTPG          at 0 range 18 .. 18;
      Reserved_19_23 at 0 range 19 .. 23;
      EOPIE          at 0 range 24 .. 24;
      ERRIE          at 0 range 25 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      OBL_LAUNCH     at 0 range 27 .. 27;
      Reserved_28_29 at 0 range 28 .. 29;
      OPTLOCK        at 0 range 30 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   subtype ECCR_ADDR_ECC_Field is Interfaces.STM32.UInt14;
   subtype ECCR_SYSF_ECC_Field is Interfaces.STM32.Bit;
   subtype ECCR_ECCIE_Field is Interfaces.STM32.Bit;
   subtype ECCR_ECCC_Field is Interfaces.STM32.Bit;
   subtype ECCR_ECCD_Field is Interfaces.STM32.Bit;

   --  Flash ECC register
   type ECCR_Register is record
      --  Read-only. ECC fail address
      ADDR_ECC       : ECCR_ADDR_ECC_Field := 16#0#;
      --  unspecified
      Reserved_14_19 : Interfaces.STM32.UInt6 := 16#0#;
      --  Read-only. ECC fail for Corrected ECC Error or Double ECC Error in
      --  info block
      SYSF_ECC       : ECCR_SYSF_ECC_Field := 16#0#;
      --  unspecified
      Reserved_21_23 : Interfaces.STM32.UInt3 := 16#0#;
      --  ECC correction interrupt enable
      ECCIE          : ECCR_ECCIE_Field := 16#0#;
      --  unspecified
      Reserved_25_29 : Interfaces.STM32.UInt5 := 16#0#;
      --  ECC correction
      ECCC           : ECCR_ECCC_Field := 16#0#;
      --  ECC detection
      ECCD           : ECCR_ECCD_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ECCR_Register use record
      ADDR_ECC       at 0 range 0 .. 13;
      Reserved_14_19 at 0 range 14 .. 19;
      SYSF_ECC       at 0 range 20 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      ECCIE          at 0 range 24 .. 24;
      Reserved_25_29 at 0 range 25 .. 29;
      ECCC           at 0 range 30 .. 30;
      ECCD           at 0 range 31 .. 31;
   end record;

   subtype OPTR_RDP_Field is Interfaces.STM32.Byte;
   subtype OPTR_nRST_STOP_Field is Interfaces.STM32.Bit;
   subtype OPTR_nRST_STDBY_Field is Interfaces.STM32.Bit;
   subtype OPTR_IDWG_SW_Field is Interfaces.STM32.Bit;
   subtype OPTR_IWDG_STOP_Field is Interfaces.STM32.Bit;
   subtype OPTR_IWDG_STDBY_Field is Interfaces.STM32.Bit;
   subtype OPTR_WWDG_SW_Field is Interfaces.STM32.Bit;
   subtype OPTR_nSWAP_BANK_Field is Interfaces.STM32.Bit;
   subtype OPTR_DUAL_BANK_Field is Interfaces.STM32.Bit;
   subtype OPTR_RAM_PARITY_CHECK_Field is Interfaces.STM32.Bit;
   subtype OPTR_nBOOT_SEL_Field is Interfaces.STM32.Bit;
   subtype OPTR_nBOOT1_Field is Interfaces.STM32.Bit;
   subtype OPTR_nBOOT0_Field is Interfaces.STM32.Bit;

   --  Flash option register
   type OPTR_Register is record
      --  Read protection level
      RDP              : OPTR_RDP_Field := 16#0#;
      --  unspecified
      Reserved_8_12    : Interfaces.STM32.UInt5 := 16#0#;
      --  nRST_STOP
      nRST_STOP        : OPTR_nRST_STOP_Field := 16#0#;
      --  nRST_STDBY
      nRST_STDBY       : OPTR_nRST_STDBY_Field := 16#0#;
      --  unspecified
      Reserved_15_15   : Interfaces.STM32.Bit := 16#0#;
      --  Independent watchdog selection
      IDWG_SW          : OPTR_IDWG_SW_Field := 16#0#;
      --  Independent watchdog counter freeze in Stop mode
      IWDG_STOP        : OPTR_IWDG_STOP_Field := 16#0#;
      --  Independent watchdog counter freeze in Standby mode
      IWDG_STDBY       : OPTR_IWDG_STDBY_Field := 16#0#;
      --  Window watchdog selection
      WWDG_SW          : OPTR_WWDG_SW_Field := 16#0#;
      --  nSWAP_BANK
      nSWAP_BANK       : OPTR_nSWAP_BANK_Field := 16#0#;
      --  DUAL_BANK
      DUAL_BANK        : OPTR_DUAL_BANK_Field := 16#0#;
      --  SRAM parity check control
      RAM_PARITY_CHECK : OPTR_RAM_PARITY_CHECK_Field := 16#0#;
      --  unspecified
      Reserved_23_23   : Interfaces.STM32.Bit := 16#0#;
      --  nBOOT_SEL
      nBOOT_SEL        : OPTR_nBOOT_SEL_Field := 16#0#;
      --  Boot configuration
      nBOOT1           : OPTR_nBOOT1_Field := 16#0#;
      --  nBOOT0 option bit
      nBOOT0           : OPTR_nBOOT0_Field := 16#0#;
      --  unspecified
      Reserved_27_31   : Interfaces.STM32.UInt5 := 16#1E#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OPTR_Register use record
      RDP              at 0 range 0 .. 7;
      Reserved_8_12    at 0 range 8 .. 12;
      nRST_STOP        at 0 range 13 .. 13;
      nRST_STDBY       at 0 range 14 .. 14;
      Reserved_15_15   at 0 range 15 .. 15;
      IDWG_SW          at 0 range 16 .. 16;
      IWDG_STOP        at 0 range 17 .. 17;
      IWDG_STDBY       at 0 range 18 .. 18;
      WWDG_SW          at 0 range 19 .. 19;
      nSWAP_BANK       at 0 range 20 .. 20;
      DUAL_BANK        at 0 range 21 .. 21;
      RAM_PARITY_CHECK at 0 range 22 .. 22;
      Reserved_23_23   at 0 range 23 .. 23;
      nBOOT_SEL        at 0 range 24 .. 24;
      nBOOT1           at 0 range 25 .. 25;
      nBOOT0           at 0 range 26 .. 26;
      Reserved_27_31   at 0 range 27 .. 31;
   end record;

   subtype WRP1AR_WRP1A_STRT_Field is Interfaces.STM32.UInt7;
   subtype WRP1AR_WRP1A_END_Field is Interfaces.STM32.UInt7;

   --  Flash WRP area A address register
   type WRP1AR_Register is record
      --  Read-only. WRP area A start offset
      WRP1A_STRT     : WRP1AR_WRP1A_STRT_Field;
      --  unspecified
      Reserved_7_15  : Interfaces.STM32.UInt9;
      --  Read-only. WRP area A end offset
      WRP1A_END      : WRP1AR_WRP1A_END_Field;
      --  unspecified
      Reserved_23_31 : Interfaces.STM32.UInt9;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WRP1AR_Register use record
      WRP1A_STRT     at 0 range 0 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      WRP1A_END      at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype WRP1BR_WRP1B_STRT_Field is Interfaces.STM32.UInt7;
   subtype WRP1BR_WRP1B_END_Field is Interfaces.STM32.UInt7;

   --  Flash WRP area B address register
   type WRP1BR_Register is record
      --  Read-only. WRP area B start offset
      WRP1B_STRT     : WRP1BR_WRP1B_STRT_Field;
      --  unspecified
      Reserved_7_15  : Interfaces.STM32.UInt9;
      --  Read-only. WRP area B end offset
      WRP1B_END      : WRP1BR_WRP1B_END_Field;
      --  unspecified
      Reserved_23_31 : Interfaces.STM32.UInt9;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WRP1BR_Register use record
      WRP1B_STRT     at 0 range 0 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      WRP1B_END      at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype WRP2AR_WRP2A_STRT_Field is Interfaces.STM32.UInt7;
   subtype WRP2AR_WRP2A_END_Field is Interfaces.STM32.UInt7;

   --  FLASH WRP2 area A address register
   type WRP2AR_Register is record
      --  WRP2A_STRT
      WRP2A_STRT     : WRP2AR_WRP2A_STRT_Field := 16#0#;
      --  unspecified
      Reserved_7_15  : Interfaces.STM32.UInt9 := 16#0#;
      --  WRP2A_END
      WRP2A_END      : WRP2AR_WRP2A_END_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : Interfaces.STM32.UInt9 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WRP2AR_Register use record
      WRP2A_STRT     at 0 range 0 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      WRP2A_END      at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype WRP2BR_WRP2B_STRT_Field is Interfaces.STM32.UInt7;
   subtype WRP2BR_WRP2B_END_Field is Interfaces.STM32.UInt7;

   --  FLASH WRP2 area B address register
   type WRP2BR_Register is record
      --  WRP2B_STRT
      WRP2B_STRT     : WRP2BR_WRP2B_STRT_Field := 16#0#;
      --  unspecified
      Reserved_7_15  : Interfaces.STM32.UInt9 := 16#0#;
      --  WRP2B_END
      WRP2B_END      : WRP2BR_WRP2B_END_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : Interfaces.STM32.UInt9 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WRP2BR_Register use record
      WRP2B_STRT     at 0 range 0 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      WRP2B_END      at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Flash
   type FLASH_Peripheral is record
      --  Access control register
      ACR     : aliased ACR_Register;
      pragma Volatile_Full_Access (ACR);
      --  Flash key register
      KEYR    : aliased Interfaces.STM32.UInt32;
      --  Option byte key register
      OPTKEYR : aliased Interfaces.STM32.UInt32;
      --  Status register
      SR      : aliased SR_Register;
      pragma Volatile_Full_Access (SR);
      --  Flash control register
      CR      : aliased CR_Register;
      pragma Volatile_Full_Access (CR);
      --  Flash ECC register
      ECCR    : aliased ECCR_Register;
      pragma Volatile_Full_Access (ECCR);
      --  Flash option register
      OPTR    : aliased OPTR_Register;
      pragma Volatile_Full_Access (OPTR);
      --  Flash WRP area A address register
      WRP1AR  : aliased WRP1AR_Register;
      pragma Volatile_Full_Access (WRP1AR);
      --  Flash WRP area B address register
      WRP1BR  : aliased WRP1BR_Register;
      pragma Volatile_Full_Access (WRP1BR);
      --  FLASH WRP2 area A address register
      WRP2AR  : aliased WRP2AR_Register;
      pragma Volatile_Full_Access (WRP2AR);
      --  FLASH WRP2 area B address register
      WRP2BR  : aliased WRP2BR_Register;
      pragma Volatile_Full_Access (WRP2BR);
   end record
     with Volatile;

   for FLASH_Peripheral use record
      ACR     at 16#0# range 0 .. 31;
      KEYR    at 16#8# range 0 .. 31;
      OPTKEYR at 16#C# range 0 .. 31;
      SR      at 16#10# range 0 .. 31;
      CR      at 16#14# range 0 .. 31;
      ECCR    at 16#18# range 0 .. 31;
      OPTR    at 16#20# range 0 .. 31;
      WRP1AR  at 16#2C# range 0 .. 31;
      WRP1BR  at 16#30# range 0 .. 31;
      WRP2AR  at 16#4C# range 0 .. 31;
      WRP2BR  at 16#50# range 0 .. 31;
   end record;

   --  Flash
   FLASH_Periph : aliased FLASH_Peripheral
     with Import, Address => FLASH_Base;

end Interfaces.STM32.Flash;
