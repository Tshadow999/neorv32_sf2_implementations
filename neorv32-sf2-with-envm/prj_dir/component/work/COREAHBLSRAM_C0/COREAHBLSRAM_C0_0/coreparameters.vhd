----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Tue Oct  8 09:06:56 2024
-- Parameters for COREAHBLSRAM
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant AHB_AWIDTH : integer := 32;
    constant AHB_DWIDTH : integer := 32;
    constant FAMILY : integer := 24;
    constant HDL_License : string( 1 to 1 ) := "U";
    constant LSRAM_NUM_LOCATIONS_DWIDTH32 : integer := 32768;
    constant SEL_SRAM_TYPE : integer := 0;
    constant Testbench : string( 1 to 4 ) := "User";
    constant USRAM_NUM_LOCATIONS_DWIDTH32 : integer := 128;
end coreparameters;
