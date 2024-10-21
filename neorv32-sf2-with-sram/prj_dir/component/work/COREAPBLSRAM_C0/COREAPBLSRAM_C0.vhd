----------------------------------------------------------------------
-- Created by SmartDesign Mon Oct 21 16:34:39 2024
-- Version: 2023.1 2023.1.0.6
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of COREAPBLSRAM_C0 to TCL
--# Family: IGLOO2
--# Part Number: M2GL010-VF400
--# Create and Configure the core component COREAPBLSRAM_C0
--create_and_configure_core -core_vlnv {Actel:DirectCore:COREAPBLSRAM:3.0.101} -component_name {COREAPBLSRAM_C0} -params {\
--"APB_DWIDTH:32"  \
--"LSRAM_NUM_LOCATIONS_DWIDTH:2048"  \
--"SEL_SRAM_TYPE:0"  \
--"USRAM_NUM_LOCATIONS_DWIDTH:128"   }
--# Exporting Component Description of COREAPBLSRAM_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- COREAPBLSRAM_C0 entity declaration
----------------------------------------------------------------------
entity COREAPBLSRAM_C0 is
    -- Port list
    port(
        -- Inputs
        PADDR   : in  std_logic_vector(19 downto 0);
        PCLK    : in  std_logic;
        PENABLE : in  std_logic;
        PRESETN : in  std_logic;
        PSEL    : in  std_logic;
        PWDATA  : in  std_logic_vector(31 downto 0);
        PWRITE  : in  std_logic;
        -- Outputs
        PRDATA  : out std_logic_vector(31 downto 0);
        PREADY  : out std_logic;
        PSLVERR : out std_logic
        );
end COREAPBLSRAM_C0;
----------------------------------------------------------------------
-- COREAPBLSRAM_C0 architecture body
----------------------------------------------------------------------
architecture RTL of COREAPBLSRAM_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_COREAPBLSRAM   -   Actel:DirectCore:COREAPBLSRAM:3.0.101
component COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_COREAPBLSRAM
    generic( 
        APB_DWIDTH                 : integer := 32 ;
        FAMILY                     : integer := 24 ;
        LSRAM_NUM_LOCATIONS_DWIDTH : integer := 2048 ;
        SEL_SRAM_TYPE              : integer := 0 ;
        USRAM_NUM_LOCATIONS_DWIDTH : integer := 128 
        );
    -- Port list
    port(
        -- Inputs
        PADDR   : in  std_logic_vector(19 downto 0);
        PCLK    : in  std_logic;
        PENABLE : in  std_logic;
        PRESETN : in  std_logic;
        PSEL    : in  std_logic;
        PWDATA  : in  std_logic_vector(31 downto 0);
        PWRITE  : in  std_logic;
        -- Outputs
        PRDATA  : out std_logic_vector(31 downto 0);
        PREADY  : out std_logic;
        PSLVERR : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal APBSlaveInterface_PRDATA        : std_logic_vector(31 downto 0);
signal APBSlaveInterface_PREADY        : std_logic;
signal APBSlaveInterface_PSLVERR       : std_logic;
signal APBSlaveInterface_PRDATA_net_0  : std_logic_vector(31 downto 0);
signal APBSlaveInterface_PREADY_net_0  : std_logic;
signal APBSlaveInterface_PSLVERR_net_0 : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 APBSlaveInterface_PRDATA_net_0  <= APBSlaveInterface_PRDATA;
 PRDATA(31 downto 0)             <= APBSlaveInterface_PRDATA_net_0;
 APBSlaveInterface_PREADY_net_0  <= APBSlaveInterface_PREADY;
 PREADY                          <= APBSlaveInterface_PREADY_net_0;
 APBSlaveInterface_PSLVERR_net_0 <= APBSlaveInterface_PSLVERR;
 PSLVERR                         <= APBSlaveInterface_PSLVERR_net_0;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- COREAPBLSRAM_C0_0   -   Actel:DirectCore:COREAPBLSRAM:3.0.101
COREAPBLSRAM_C0_0 : COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_COREAPBLSRAM
    generic map( 
        APB_DWIDTH                 => ( 32 ),
        FAMILY                     => ( 24 ),
        LSRAM_NUM_LOCATIONS_DWIDTH => ( 2048 ),
        SEL_SRAM_TYPE              => ( 0 ),
        USRAM_NUM_LOCATIONS_DWIDTH => ( 128 )
        )
    port map( 
        -- Inputs
        PCLK    => PCLK,
        PRESETN => PRESETN,
        PSEL    => PSEL,
        PENABLE => PENABLE,
        PWRITE  => PWRITE,
        PADDR   => PADDR,
        PWDATA  => PWDATA,
        -- Outputs
        PRDATA  => APBSlaveInterface_PRDATA,
        PSLVERR => APBSlaveInterface_PSLVERR,
        PREADY  => APBSlaveInterface_PREADY 
        );

end RTL;
