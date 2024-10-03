----------------------------------------------------------------------
-- Created by SmartDesign Thu Oct  3 17:08:50 2024
-- Version: 2023.1 2023.1.0.6
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of COREAHBLSRAM_C0 to TCL
--# Family: IGLOO2
--# Part Number: M2GL010-VF400
--# Create and Configure the core component COREAHBLSRAM_C0
--create_and_configure_core -core_vlnv {Actel:DirectCore:COREAHBLSRAM:2.2.104} -component_name {COREAHBLSRAM_C0} -params {\
--"AHB_AWIDTH:32"  \
--"AHB_DWIDTH:32"  \
--"LSRAM_NUM_LOCATIONS_DWIDTH32:65536"  \
--"SEL_SRAM_TYPE:0"  \
--"USRAM_NUM_LOCATIONS_DWIDTH32:128"   }
--# Exporting Component Description of COREAHBLSRAM_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
library COREAHBLSRAM_LIB;
use COREAHBLSRAM_LIB.all;
----------------------------------------------------------------------
-- COREAHBLSRAM_C0 entity declaration
----------------------------------------------------------------------
entity COREAHBLSRAM_C0 is
    -- Port list
    port(
        -- Inputs
        HADDR     : in  std_logic_vector(31 downto 0);
        HBURST    : in  std_logic_vector(2 downto 0);
        HCLK      : in  std_logic;
        HREADYIN  : in  std_logic;
        HRESETN   : in  std_logic;
        HSEL      : in  std_logic;
        HSIZE     : in  std_logic_vector(2 downto 0);
        HTRANS    : in  std_logic_vector(1 downto 0);
        HWDATA    : in  std_logic_vector(31 downto 0);
        HWRITE    : in  std_logic;
        -- Outputs
        HRDATA    : out std_logic_vector(31 downto 0);
        HREADYOUT : out std_logic;
        HRESP     : out std_logic_vector(1 downto 0)
        );
end COREAHBLSRAM_C0;
----------------------------------------------------------------------
-- COREAHBLSRAM_C0 architecture body
----------------------------------------------------------------------
architecture RTL of COREAHBLSRAM_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- COREAHBLSRAM_C0_COREAHBLSRAM_C0_0_COREAHBLSRAM   -   Actel:DirectCore:COREAHBLSRAM:2.2.104
component COREAHBLSRAM_C0_COREAHBLSRAM_C0_0_COREAHBLSRAM
    generic( 
        AHB_AWIDTH                   : integer := 32 ;
        AHB_DWIDTH                   : integer := 32 ;
        FAMILY                       : integer := 24 ;
        LSRAM_NUM_LOCATIONS_DWIDTH32 : integer := 65536 ;
        SEL_SRAM_TYPE                : integer := 0 ;
        USRAM_NUM_LOCATIONS_DWIDTH32 : integer := 128 
        );
    -- Port list
    port(
        -- Inputs
        HADDR     : in  std_logic_vector(31 downto 0);
        HBURST    : in  std_logic_vector(2 downto 0);
        HCLK      : in  std_logic;
        HREADYIN  : in  std_logic;
        HRESETN   : in  std_logic;
        HSEL      : in  std_logic;
        HSIZE     : in  std_logic_vector(2 downto 0);
        HTRANS    : in  std_logic_vector(1 downto 0);
        HWDATA    : in  std_logic_vector(31 downto 0);
        HWRITE    : in  std_logic;
        -- Outputs
        HRDATA    : out std_logic_vector(31 downto 0);
        HREADYOUT : out std_logic;
        HRESP     : out std_logic_vector(1 downto 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AHBSlaveInterface_HRDATA          : std_logic_vector(31 downto 0);
signal AHBSlaveInterface_HREADYOUT       : std_logic;
signal AHBSlaveInterface_HRESP           : std_logic_vector(1 downto 0);
signal AHBSlaveInterface_HRDATA_net_0    : std_logic_vector(31 downto 0);
signal AHBSlaveInterface_HREADYOUT_net_0 : std_logic;
signal AHBSlaveInterface_HRESP_net_0     : std_logic_vector(1 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 AHBSlaveInterface_HRDATA_net_0    <= AHBSlaveInterface_HRDATA;
 HRDATA(31 downto 0)               <= AHBSlaveInterface_HRDATA_net_0;
 AHBSlaveInterface_HREADYOUT_net_0 <= AHBSlaveInterface_HREADYOUT;
 HREADYOUT                         <= AHBSlaveInterface_HREADYOUT_net_0;
 AHBSlaveInterface_HRESP_net_0     <= AHBSlaveInterface_HRESP;
 HRESP(1 downto 0)                 <= AHBSlaveInterface_HRESP_net_0;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- COREAHBLSRAM_C0_0   -   Actel:DirectCore:COREAHBLSRAM:2.2.104
COREAHBLSRAM_C0_0 : COREAHBLSRAM_C0_COREAHBLSRAM_C0_0_COREAHBLSRAM
    generic map( 
        AHB_AWIDTH                   => ( 32 ),
        AHB_DWIDTH                   => ( 32 ),
        FAMILY                       => ( 24 ),
        LSRAM_NUM_LOCATIONS_DWIDTH32 => ( 65536 ),
        SEL_SRAM_TYPE                => ( 0 ),
        USRAM_NUM_LOCATIONS_DWIDTH32 => ( 128 )
        )
    port map( 
        -- Inputs
        HCLK      => HCLK,
        HRESETN   => HRESETN,
        HSEL      => HSEL,
        HREADYIN  => HREADYIN,
        HWRITE    => HWRITE,
        HSIZE     => HSIZE,
        HTRANS    => HTRANS,
        HBURST    => HBURST,
        HADDR     => HADDR,
        HWDATA    => HWDATA,
        -- Outputs
        HREADYOUT => AHBSlaveInterface_HREADYOUT,
        HRDATA    => AHBSlaveInterface_HRDATA,
        HRESP     => AHBSlaveInterface_HRESP 
        );

end RTL;
