----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Mon Oct 21 16:34:39 2024
-- Parameters for COREAPBLSRAM
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant APB_DWIDTH : integer := 32;
    constant FAMILY : integer := 24;
    constant HDL_License : string( 1 to 1 ) := "U";
    constant LSRAM_NUM_LOCATIONS_DWIDTH : integer := 2048;
    constant SEL_SRAM_TYPE : integer := 0;
    constant Testbench : string( 1 to 4 ) := "User";
    constant USRAM_NUM_LOCATIONS_DWIDTH : integer := 128;
end coreparameters;
