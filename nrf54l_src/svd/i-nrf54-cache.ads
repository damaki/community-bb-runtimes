--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

package Interfaces.NRF54.CACHE is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Invalidate the cache.
   type TASKS_INVALIDATECACHE_TASKS_INVALIDATECACHE_Field is
     (--  Reset value for the field
      TASKS_INVALIDATECACHE_TASKS_INVALIDATECACHE_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_INVALIDATECACHE_TASKS_INVALIDATECACHE_Field use
     (TASKS_INVALIDATECACHE_TASKS_INVALIDATECACHE_Field_Reset => 0,
      Trigger => 1);

   --  Invalidate the cache.
   type TASKS_INVALIDATECACHE_Register is record
      --  Write-only. Invalidate the cache.
      TASKS_INVALIDATECACHE : TASKS_INVALIDATECACHE_TASKS_INVALIDATECACHE_Field :=
                               TASKS_INVALIDATECACHE_TASKS_INVALIDATECACHE_Field_Reset;
      --  unspecified
      Reserved_1_31         : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_INVALIDATECACHE_Register use record
      TASKS_INVALIDATECACHE at 0 range 0 .. 0;
      Reserved_1_31         at 0 range 1 .. 31;
   end record;

   --  Invalidate the line.
   type TASKS_INVALIDATELINE_TASKS_INVALIDATELINE_Field is
     (--  Reset value for the field
      TASKS_INVALIDATELINE_TASKS_INVALIDATELINE_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_INVALIDATELINE_TASKS_INVALIDATELINE_Field use
     (TASKS_INVALIDATELINE_TASKS_INVALIDATELINE_Field_Reset => 0,
      Trigger => 1);

   --  Invalidate the line.
   type TASKS_INVALIDATELINE_Register is record
      --  Write-only. Invalidate the line.
      TASKS_INVALIDATELINE : TASKS_INVALIDATELINE_TASKS_INVALIDATELINE_Field :=
                              TASKS_INVALIDATELINE_TASKS_INVALIDATELINE_Field_Reset;
      --  unspecified
      Reserved_1_31        : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_INVALIDATELINE_Register use record
      TASKS_INVALIDATELINE at 0 range 0 .. 0;
      Reserved_1_31        at 0 range 1 .. 31;
   end record;

   --  Erase the cache.
   type TASKS_ERASE_TASKS_ERASE_Field is
     (--  Reset value for the field
      TASKS_ERASE_TASKS_ERASE_Field_Reset,
      --  Trigger task
      Trigger)
     with Size => 1;
   for TASKS_ERASE_TASKS_ERASE_Field use
     (TASKS_ERASE_TASKS_ERASE_Field_Reset => 0,
      Trigger => 1);

   --  Erase the cache.
   type TASKS_ERASE_Register is record
      --  Write-only. Erase the cache.
      TASKS_ERASE   : TASKS_ERASE_TASKS_ERASE_Field :=
                       TASKS_ERASE_TASKS_ERASE_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TASKS_ERASE_Register use record
      TASKS_ERASE   at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Ready status.
   type STATUS_READY_Field is
     (--  Activity is done and ready for the next activity.
      Ready,
      --  Activity is in progress.
      Busy)
     with Size => 1;
   for STATUS_READY_Field use
     (Ready => 0,
      Busy => 1);

   --  Status of the cache activities.
   type STATUS_Register is record
      --  Read-only. Ready status.
      READY         : STATUS_READY_Field;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for STATUS_Register use record
      READY         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Enable cache
   type ENABLE_ENABLE_Field is
     (--  Disable cache
      Disabled,
      --  Enable cache
      Enabled)
     with Size => 1;
   for ENABLE_ENABLE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable cache.
   type ENABLE_Register is record
      --  Enable cache
      ENABLE        : ENABLE_ENABLE_Field := Interfaces.NRF54.CACHE.Disabled;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ENABLE_Register use record
      ENABLE        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------------------------------
   -- CACHE_PROFILING cluster's Registers --
   -----------------------------------------

   --  Enable the profiling counters
   type ENABLE_ENABLE_Field_1 is
     (--  Disable profiling
      Disable,
      --  Enable profiling
      Enable)
     with Size => 1;
   for ENABLE_ENABLE_Field_1 use
     (Disable => 0,
      Enable => 1);

   --  Enable the profiling counters.
   type ENABLE_PROFILING_Register is record
      --  Enable the profiling counters
      ENABLE        : ENABLE_ENABLE_Field_1 := Interfaces.NRF54.CACHE.Disable;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ENABLE_PROFILING_Register use record
      ENABLE        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Clearing the profiling counters
   type CLEAR_CLEAR_Field is
     (--  Reset value for the field
      CLEAR_CLEAR_Field_Reset,
      --  Clear the profiling counters
      Clear)
     with Size => 1;
   for CLEAR_CLEAR_Field use
     (CLEAR_CLEAR_Field_Reset => 0,
      Clear => 1);

   --  Clear the profiling counters.
   type CLEAR_PROFILING_Register is record
      --  Write-only. Clearing the profiling counters
      CLEAR         : CLEAR_CLEAR_Field := CLEAR_CLEAR_Field_Reset;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CLEAR_PROFILING_Register use record
      CLEAR         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Unspecified
   type CACHE_PROFILING_Cluster is record
      --  Enable the profiling counters.
      ENABLE : aliased ENABLE_PROFILING_Register;
      pragma Volatile_Full_Access (ENABLE);
      --  Clear the profiling counters.
      CLEAR  : aliased CLEAR_PROFILING_Register;
      pragma Volatile_Full_Access (CLEAR);
      --  The cache hit counter for cache region.
      HIT    : aliased Interfaces.NRF54.UInt32;
      --  The cache miss counter for cache region.
      MISS   : aliased Interfaces.NRF54.UInt32;
      --  The cache line miss counter for cache region.
      LMISS  : aliased Interfaces.NRF54.UInt32;
      --  Number of reads for cache region.
      READS  : aliased Interfaces.NRF54.UInt32;
      --  Number of writes for cache region.
      WRITES : aliased Interfaces.NRF54.UInt32;
   end record
     with Size => 224;

   for CACHE_PROFILING_Cluster use record
      ENABLE at 16#0# range 0 .. 31;
      CLEAR  at 16#4# range 0 .. 31;
      HIT    at 16#8# range 0 .. 31;
      MISS   at 16#C# range 0 .. 31;
      LMISS  at 16#10# range 0 .. 31;
      READS  at 16#14# range 0 .. 31;
      WRITES at 16#18# range 0 .. 31;
   end record;

   --  Lock debug mode
   type DEBUGLOCK_DEBUGLOCK_Field is
     (--  Debug mode unlocked
      Unlocked,
      --  Debug mode locked. Ignores any other value written.
      Locked)
     with Size => 1;
   for DEBUGLOCK_DEBUGLOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Lock debug mode.
   type DEBUGLOCK_Register is record
      --  Read-Write-once. Lock debug mode
      DEBUGLOCK     : DEBUGLOCK_DEBUGLOCK_Field :=
                       Interfaces.NRF54.CACHE.Unlocked;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DEBUGLOCK_Register use record
      DEBUGLOCK     at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Lock cache updates
   type WRITELOCK_WRITELOCK_Field is
     (--  Cache updates unlocked
      Unlocked,
      --  Cache updates locked
      Locked)
     with Size => 1;
   for WRITELOCK_WRITELOCK_Field use
     (Unlocked => 0,
      Locked => 1);

   --  Lock cache updates.
   type WRITELOCK_Register is record
      --  Lock cache updates
      WRITELOCK     : WRITELOCK_WRITELOCK_Field :=
                       Interfaces.NRF54.CACHE.Unlocked;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WRITELOCK_Register use record
      WRITELOCK     at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Cache
   type CACHE_Peripheral is record
      --  Invalidate the cache.
      TASKS_INVALIDATECACHE : aliased TASKS_INVALIDATECACHE_Register;
      pragma Volatile_Full_Access (TASKS_INVALIDATECACHE);
      --  Invalidate the line.
      TASKS_INVALIDATELINE  : aliased TASKS_INVALIDATELINE_Register;
      pragma Volatile_Full_Access (TASKS_INVALIDATELINE);
      --  Erase the cache.
      TASKS_ERASE           : aliased TASKS_ERASE_Register;
      pragma Volatile_Full_Access (TASKS_ERASE);
      --  Status of the cache activities.
      STATUS                : aliased STATUS_Register;
      pragma Volatile_Full_Access (STATUS);
      --  Enable cache.
      ENABLE                : aliased ENABLE_Register;
      pragma Volatile_Full_Access (ENABLE);
      --  Memory address covered by the line to be maintained.
      LINEADDR              : aliased Interfaces.NRF54.UInt32;
      --  Unspecified
      PROFILING             : aliased CACHE_PROFILING_Cluster;
      --  Lock debug mode.
      DEBUGLOCK             : aliased DEBUGLOCK_Register;
      pragma Volatile_Full_Access (DEBUGLOCK);
      --  Lock cache updates.
      WRITELOCK             : aliased WRITELOCK_Register;
      pragma Volatile_Full_Access (WRITELOCK);
   end record
     with Volatile;

   for CACHE_Peripheral use record
      TASKS_INVALIDATECACHE at 16#8# range 0 .. 31;
      TASKS_INVALIDATELINE  at 16#14# range 0 .. 31;
      TASKS_ERASE           at 16#20# range 0 .. 31;
      STATUS                at 16#400# range 0 .. 31;
      ENABLE                at 16#404# range 0 .. 31;
      LINEADDR              at 16#410# range 0 .. 31;
      PROFILING             at 16#414# range 0 .. 223;
      DEBUGLOCK             at 16#430# range 0 .. 31;
      WRITELOCK             at 16#434# range 0 .. 31;
   end record;

   --  Cache
   ICACHE_S_Periph : aliased CACHE_Peripheral
     with Import, Address => ICACHE_S_Base;

end Interfaces.NRF54.CACHE;
