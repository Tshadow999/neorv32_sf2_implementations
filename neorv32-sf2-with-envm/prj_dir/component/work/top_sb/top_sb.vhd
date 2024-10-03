----------------------------------------------------------------------
-- Created by SmartDesign Fri Sep 20 09:45:18 2024
-- Version: 2022.1 2022.1.0.10
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
library COREAHBLITE_LIB;
use COREAHBLITE_LIB.all;
use COREAHBLITE_LIB.components.all;
----------------------------------------------------------------------
-- top_sb entity declaration
----------------------------------------------------------------------
entity top_sb is
    -- Port list
    port(
        -- Inputs
        DEVRST_N                            : in  std_logic;
        FAB_RESET_N                         : in  std_logic;
        HPMS_FIC_0_USER_MASTER_HADDR_M0     : in  std_logic_vector(31 downto 0);
        HPMS_FIC_0_USER_MASTER_HBURST_M0    : in  std_logic_vector(2 downto 0);
        HPMS_FIC_0_USER_MASTER_HMASTLOCK_M0 : in  std_logic;
        HPMS_FIC_0_USER_MASTER_HPROT_M0     : in  std_logic_vector(3 downto 0);
        HPMS_FIC_0_USER_MASTER_HSIZE_M0     : in  std_logic_vector(2 downto 0);
        HPMS_FIC_0_USER_MASTER_HTRANS_M0    : in  std_logic_vector(1 downto 0);
        HPMS_FIC_0_USER_MASTER_HWDATA_M0    : in  std_logic_vector(31 downto 0);
        HPMS_FIC_0_USER_MASTER_HWRITE_M0    : in  std_logic;
        -- Outputs
        COMM_BLK_INT                        : out std_logic;
        FIC_0_CLK                           : out std_logic;
        FIC_0_LOCK                          : out std_logic;
        HPMS_FIC_0_USER_MASTER_HRDATA_M0    : out std_logic_vector(31 downto 0);
        HPMS_FIC_0_USER_MASTER_HREADY_M0    : out std_logic;
        HPMS_FIC_0_USER_MASTER_HRESP_M0     : out std_logic_vector(1 downto 0);
        HPMS_INT_M2F                        : out std_logic_vector(15 downto 0);
        HPMS_READY                          : out std_logic;
        INIT_DONE                           : out std_logic;
        POWER_ON_RESET_N                    : out std_logic
        );
end top_sb;
----------------------------------------------------------------------
-- top_sb architecture body
----------------------------------------------------------------------
architecture RTL of top_sb is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- top_sb_CCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
component top_sb_CCC_0_FCCC
    -- Port list
    port(
        -- Inputs
        RCOSC_25_50MHZ : in  std_logic;
        -- Outputs
        GL0            : out std_logic;
        LOCK           : out std_logic
        );
end component;
-- CoreAHBLite   -   Actel:DirectCore:CoreAHBLite:5.2.100
-- using entity instantiation for component CoreAHBLite
-- CoreResetP   -   Actel:DirectCore:CoreResetP:7.1.100
component CoreResetP
    generic( 
        DDR_WAIT            : integer := 200 ;
        DEVICE_090          : integer := 0 ;
        DEVICE_VOLTAGE      : integer := 2 ;
        ENABLE_SOFT_RESETS  : integer := 0 ;
        EXT_RESET_CFG       : integer := 0 ;
        FDDR_IN_USE         : integer := 0 ;
        MDDR_IN_USE         : integer := 0 ;
        SDIF0_IN_USE        : integer := 0 ;
        SDIF0_PCIE          : integer := 0 ;
        SDIF0_PCIE_HOTRESET : integer := 1 ;
        SDIF0_PCIE_L2P2     : integer := 1 ;
        SDIF1_IN_USE        : integer := 0 ;
        SDIF1_PCIE          : integer := 0 ;
        SDIF1_PCIE_HOTRESET : integer := 1 ;
        SDIF1_PCIE_L2P2     : integer := 1 ;
        SDIF2_IN_USE        : integer := 0 ;
        SDIF2_PCIE          : integer := 0 ;
        SDIF2_PCIE_HOTRESET : integer := 1 ;
        SDIF2_PCIE_L2P2     : integer := 1 ;
        SDIF3_IN_USE        : integer := 0 ;
        SDIF3_PCIE          : integer := 0 ;
        SDIF3_PCIE_HOTRESET : integer := 1 ;
        SDIF3_PCIE_L2P2     : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        CLK_BASE                       : in  std_logic;
        CLK_LTSSM                      : in  std_logic;
        CONFIG1_DONE                   : in  std_logic;
        CONFIG2_DONE                   : in  std_logic;
        FAB_RESET_N                    : in  std_logic;
        FIC_2_APB_M_PRESET_N           : in  std_logic;
        FPLL_LOCK                      : in  std_logic;
        POWER_ON_RESET_N               : in  std_logic;
        RCOSC_25_50MHZ                 : in  std_logic;
        RESET_N_M2F                    : in  std_logic;
        SDIF0_PERST_N                  : in  std_logic;
        SDIF0_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF0_PSEL                     : in  std_logic;
        SDIF0_PWRITE                   : in  std_logic;
        SDIF0_SPLL_LOCK                : in  std_logic;
        SDIF1_PERST_N                  : in  std_logic;
        SDIF1_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF1_PSEL                     : in  std_logic;
        SDIF1_PWRITE                   : in  std_logic;
        SDIF1_SPLL_LOCK                : in  std_logic;
        SDIF2_PERST_N                  : in  std_logic;
        SDIF2_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF2_PSEL                     : in  std_logic;
        SDIF2_PWRITE                   : in  std_logic;
        SDIF2_SPLL_LOCK                : in  std_logic;
        SDIF3_PERST_N                  : in  std_logic;
        SDIF3_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF3_PSEL                     : in  std_logic;
        SDIF3_PWRITE                   : in  std_logic;
        SDIF3_SPLL_LOCK                : in  std_logic;
        SOFT_EXT_RESET_OUT             : in  std_logic;
        SOFT_FDDR_CORE_RESET           : in  std_logic;
        SOFT_M3_RESET                  : in  std_logic;
        SOFT_MDDR_DDR_AXI_S_CORE_RESET : in  std_logic;
        SOFT_RESET_F2M                 : in  std_logic;
        SOFT_SDIF0_0_CORE_RESET        : in  std_logic;
        SOFT_SDIF0_1_CORE_RESET        : in  std_logic;
        SOFT_SDIF0_CORE_RESET          : in  std_logic;
        SOFT_SDIF0_PHY_RESET           : in  std_logic;
        SOFT_SDIF1_CORE_RESET          : in  std_logic;
        SOFT_SDIF1_PHY_RESET           : in  std_logic;
        SOFT_SDIF2_CORE_RESET          : in  std_logic;
        SOFT_SDIF2_PHY_RESET           : in  std_logic;
        SOFT_SDIF3_CORE_RESET          : in  std_logic;
        SOFT_SDIF3_PHY_RESET           : in  std_logic;
        -- Outputs
        DDR_READY                      : out std_logic;
        EXT_RESET_OUT                  : out std_logic;
        FDDR_CORE_RESET_N              : out std_logic;
        INIT_DONE                      : out std_logic;
        M3_RESET_N                     : out std_logic;
        MDDR_DDR_AXI_S_CORE_RESET_N    : out std_logic;
        MSS_HPMS_READY                 : out std_logic;
        RESET_N_F2M                    : out std_logic;
        SDIF0_0_CORE_RESET_N           : out std_logic;
        SDIF0_1_CORE_RESET_N           : out std_logic;
        SDIF0_CORE_RESET_N             : out std_logic;
        SDIF0_PHY_RESET_N              : out std_logic;
        SDIF1_CORE_RESET_N             : out std_logic;
        SDIF1_PHY_RESET_N              : out std_logic;
        SDIF2_CORE_RESET_N             : out std_logic;
        SDIF2_PHY_RESET_N              : out std_logic;
        SDIF3_CORE_RESET_N             : out std_logic;
        SDIF3_PHY_RESET_N              : out std_logic;
        SDIF_READY                     : out std_logic;
        SDIF_RELEASED                  : out std_logic
        );
end component;
-- top_sb_FABOSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
component top_sb_FABOSC_0_OSC
    -- Port list
    port(
        -- Inputs
        XTL                : in  std_logic;
        -- Outputs
        RCOSC_1MHZ_CCC     : out std_logic;
        RCOSC_1MHZ_O2F     : out std_logic;
        RCOSC_25_50MHZ_CCC : out std_logic;
        RCOSC_25_50MHZ_O2F : out std_logic;
        XTLOSC_CCC         : out std_logic;
        XTLOSC_O2F         : out std_logic
        );
end component;
-- SYSRESET
component SYSRESET
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in  std_logic;
        -- Outputs
        POWER_ON_RESET_N : out std_logic
        );
end component;
-- top_sb_HPMS
component top_sb_HPMS
    -- Port list
    port(
        -- Inputs
        FIC_0_AHB_S_HADDR      : in  std_logic_vector(31 downto 0);
        FIC_0_AHB_S_HMASTLOCK  : in  std_logic;
        FIC_0_AHB_S_HREADY     : in  std_logic;
        FIC_0_AHB_S_HSEL       : in  std_logic;
        FIC_0_AHB_S_HSIZE      : in  std_logic_vector(1 downto 0);
        FIC_0_AHB_S_HTRANS     : in  std_logic_vector(1 downto 0);
        FIC_0_AHB_S_HWDATA     : in  std_logic_vector(31 downto 0);
        FIC_0_AHB_S_HWRITE     : in  std_logic;
        FIC_2_APB_M_PRDATA     : in  std_logic_vector(31 downto 0);
        FIC_2_APB_M_PREADY     : in  std_logic;
        FIC_2_APB_M_PSLVERR    : in  std_logic;
        M3_RESET_N             : in  std_logic;
        MCCC_CLK_BASE          : in  std_logic;
        MCCC_CLK_BASE_PLL_LOCK : in  std_logic;
        MSS_RESET_N_F2M        : in  std_logic;
        -- Outputs
        COMM_BLK_INT           : out std_logic;
        FIC_0_AHB_S_HRDATA     : out std_logic_vector(31 downto 0);
        FIC_0_AHB_S_HREADYOUT  : out std_logic;
        FIC_0_AHB_S_HRESP      : out std_logic;
        FIC_2_APB_M_PADDR      : out std_logic_vector(15 downto 2);
        FIC_2_APB_M_PCLK       : out std_logic;
        FIC_2_APB_M_PENABLE    : out std_logic;
        FIC_2_APB_M_PRESET_N   : out std_logic;
        FIC_2_APB_M_PSEL       : out std_logic;
        FIC_2_APB_M_PWDATA     : out std_logic_vector(31 downto 0);
        FIC_2_APB_M_PWRITE     : out std_logic;
        M3_NMI                 : out std_logic;
        MSS_INT_M2F            : out std_logic_vector(15 downto 0);
        MSS_RESET_N_M2F        : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal COMM_BLK_INT_net_0                                 : std_logic;
signal CoreAHBLite_0_AHBmslave16_HADDR                    : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave16_HBURST                   : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave16_HMASTLOCK                : std_logic;
signal CoreAHBLite_0_AHBmslave16_HPROT                    : std_logic_vector(3 downto 0);
signal CoreAHBLite_0_AHBmslave16_HRDATA                   : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave16_HREADY                   : std_logic;
signal CoreAHBLite_0_AHBmslave16_HREADYOUT                : std_logic;
signal CoreAHBLite_0_AHBmslave16_HSELx                    : std_logic;
signal CoreAHBLite_0_AHBmslave16_HTRANS                   : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave16_HWDATA                   : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave16_HWRITE                   : std_logic;
signal CORERESETP_0_RESET_N_F2M                           : std_logic;
signal FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : std_logic;
signal FABOSC_0_RCOSC_25_50MHZ_O2F                        : std_logic;
signal FIC_0_CLK_net_0                                    : std_logic;
signal FIC_0_LOCK_net_0                                   : std_logic;
signal HPMS_FIC_0_USER_MASTER_HRDATA                      : std_logic_vector(31 downto 0);
signal HPMS_FIC_0_USER_MASTER_HREADY                      : std_logic;
signal HPMS_FIC_0_USER_MASTER_HRESP                       : std_logic_vector(1 downto 0);
signal HPMS_INT_M2F_net_0                                 : std_logic_vector(15 downto 0);
signal HPMS_READY_net_0                                   : std_logic;
signal INIT_DONE_net_0                                    : std_logic;
signal POWER_ON_RESET_N_net_0                             : std_logic;
signal top_sb_HPMS_0_FIC_2_APB_M_PRESET_N                 : std_logic;
signal top_sb_HPMS_0_MSS_RESET_N_M2F                      : std_logic;
signal POWER_ON_RESET_N_net_1                             : std_logic;
signal INIT_DONE_net_1                                    : std_logic;
signal FIC_0_CLK_net_1                                    : std_logic;
signal FIC_0_LOCK_net_1                                   : std_logic;
signal HPMS_READY_net_1                                   : std_logic;
signal HPMS_FIC_0_USER_MASTER_HRDATA_net_0                : std_logic_vector(31 downto 0);
signal HPMS_FIC_0_USER_MASTER_HREADY_net_0                : std_logic;
signal HPMS_FIC_0_USER_MASTER_HRESP_net_0                 : std_logic_vector(1 downto 0);
signal COMM_BLK_INT_net_1                                 : std_logic;
signal HPMS_INT_M2F_net_1                                 : std_logic_vector(15 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                                            : std_logic;
signal VCC_net                                            : std_logic;
signal PADDR_const_net_0                                  : std_logic_vector(7 downto 2);
signal PWDATA_const_net_0                                 : std_logic_vector(7 downto 0);
signal SDIF0_PRDATA_const_net_0                           : std_logic_vector(31 downto 0);
signal SDIF1_PRDATA_const_net_0                           : std_logic_vector(31 downto 0);
signal SDIF2_PRDATA_const_net_0                           : std_logic_vector(31 downto 0);
signal SDIF3_PRDATA_const_net_0                           : std_logic_vector(31 downto 0);
signal HADDR_M1_const_net_0                               : std_logic_vector(31 downto 0);
signal HTRANS_M1_const_net_0                              : std_logic_vector(1 downto 0);
signal HSIZE_M1_const_net_0                               : std_logic_vector(2 downto 0);
signal HBURST_M1_const_net_0                              : std_logic_vector(2 downto 0);
signal HPROT_M1_const_net_0                               : std_logic_vector(3 downto 0);
signal HWDATA_M1_const_net_0                              : std_logic_vector(31 downto 0);
signal HADDR_M2_const_net_0                               : std_logic_vector(31 downto 0);
signal HTRANS_M2_const_net_0                              : std_logic_vector(1 downto 0);
signal HSIZE_M2_const_net_0                               : std_logic_vector(2 downto 0);
signal HBURST_M2_const_net_0                              : std_logic_vector(2 downto 0);
signal HPROT_M2_const_net_0                               : std_logic_vector(3 downto 0);
signal HWDATA_M2_const_net_0                              : std_logic_vector(31 downto 0);
signal HADDR_M3_const_net_0                               : std_logic_vector(31 downto 0);
signal HTRANS_M3_const_net_0                              : std_logic_vector(1 downto 0);
signal HSIZE_M3_const_net_0                               : std_logic_vector(2 downto 0);
signal HBURST_M3_const_net_0                              : std_logic_vector(2 downto 0);
signal HPROT_M3_const_net_0                               : std_logic_vector(3 downto 0);
signal HWDATA_M3_const_net_0                              : std_logic_vector(31 downto 0);
signal HRDATA_S0_const_net_0                              : std_logic_vector(31 downto 0);
signal HRESP_S0_const_net_0                               : std_logic_vector(1 downto 0);
signal HRDATA_S1_const_net_0                              : std_logic_vector(31 downto 0);
signal HRESP_S1_const_net_0                               : std_logic_vector(1 downto 0);
signal HRDATA_S2_const_net_0                              : std_logic_vector(31 downto 0);
signal HRESP_S2_const_net_0                               : std_logic_vector(1 downto 0);
signal HRDATA_S3_const_net_0                              : std_logic_vector(31 downto 0);
signal HRESP_S3_const_net_0                               : std_logic_vector(1 downto 0);
signal HRDATA_S4_const_net_0                              : std_logic_vector(31 downto 0);
signal HRESP_S4_const_net_0                               : std_logic_vector(1 downto 0);
signal HRDATA_S5_const_net_0                              : std_logic_vector(31 downto 0);
signal HRESP_S5_const_net_0                               : std_logic_vector(1 downto 0);
signal HRDATA_S6_const_net_0                              : std_logic_vector(31 downto 0);
signal HRESP_S6_const_net_0                               : std_logic_vector(1 downto 0);
signal HRDATA_S7_const_net_0                              : std_logic_vector(31 downto 0);
signal HRESP_S7_const_net_0                               : std_logic_vector(1 downto 0);
signal HRDATA_S8_const_net_0                              : std_logic_vector(31 downto 0);
signal HRESP_S8_const_net_0                               : std_logic_vector(1 downto 0);
signal HRDATA_S9_const_net_0                              : std_logic_vector(31 downto 0);
signal HRESP_S9_const_net_0                               : std_logic_vector(1 downto 0);
signal HRDATA_S10_const_net_0                             : std_logic_vector(31 downto 0);
signal HRESP_S10_const_net_0                              : std_logic_vector(1 downto 0);
signal HRDATA_S11_const_net_0                             : std_logic_vector(31 downto 0);
signal HRESP_S11_const_net_0                              : std_logic_vector(1 downto 0);
signal HRDATA_S12_const_net_0                             : std_logic_vector(31 downto 0);
signal HRESP_S12_const_net_0                              : std_logic_vector(1 downto 0);
signal HRDATA_S13_const_net_0                             : std_logic_vector(31 downto 0);
signal HRESP_S13_const_net_0                              : std_logic_vector(1 downto 0);
signal HRDATA_S14_const_net_0                             : std_logic_vector(31 downto 0);
signal HRESP_S14_const_net_0                              : std_logic_vector(1 downto 0);
signal HRDATA_S15_const_net_0                             : std_logic_vector(31 downto 0);
signal HRESP_S15_const_net_0                              : std_logic_vector(1 downto 0);
signal FIC_2_APB_M_PRDATA_const_net_0                     : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal CoreAHBLite_0_AHBmslave16_HRESP                    : std_logic;
signal CoreAHBLite_0_AHBmslave16_HRESP_0                  : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave16_HRESP_0_0to0             : std_logic_vector(0 to 0);
signal CoreAHBLite_0_AHBmslave16_HRESP_0_1to1             : std_logic_vector(1 to 1);

signal CoreAHBLite_0_AHBmslave16_HSIZE                    : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave16_HSIZE_0                  : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave16_HSIZE_0_1to0             : std_logic_vector(1 downto 0);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net                        <= '0';
 VCC_net                        <= '1';
 PADDR_const_net_0              <= B"000000";
 PWDATA_const_net_0             <= B"00000000";
 SDIF0_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF1_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF2_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF3_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 HADDR_M1_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M1_const_net_0          <= B"00";
 HSIZE_M1_const_net_0           <= B"000";
 HBURST_M1_const_net_0          <= B"000";
 HPROT_M1_const_net_0           <= B"0000";
 HWDATA_M1_const_net_0          <= B"00000000000000000000000000000000";
 HADDR_M2_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M2_const_net_0          <= B"00";
 HSIZE_M2_const_net_0           <= B"000";
 HBURST_M2_const_net_0          <= B"000";
 HPROT_M2_const_net_0           <= B"0000";
 HWDATA_M2_const_net_0          <= B"00000000000000000000000000000000";
 HADDR_M3_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M3_const_net_0          <= B"00";
 HSIZE_M3_const_net_0           <= B"000";
 HBURST_M3_const_net_0          <= B"000";
 HPROT_M3_const_net_0           <= B"0000";
 HWDATA_M3_const_net_0          <= B"00000000000000000000000000000000";
 HRDATA_S0_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S0_const_net_0           <= B"00";
 HRDATA_S1_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S1_const_net_0           <= B"00";
 HRDATA_S2_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S2_const_net_0           <= B"00";
 HRDATA_S3_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S3_const_net_0           <= B"00";
 HRDATA_S4_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S4_const_net_0           <= B"00";
 HRDATA_S5_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S5_const_net_0           <= B"00";
 HRDATA_S6_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S6_const_net_0           <= B"00";
 HRDATA_S7_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S7_const_net_0           <= B"00";
 HRDATA_S8_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S8_const_net_0           <= B"00";
 HRDATA_S9_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S9_const_net_0           <= B"00";
 HRDATA_S10_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S10_const_net_0          <= B"00";
 HRDATA_S11_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S11_const_net_0          <= B"00";
 HRDATA_S12_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S12_const_net_0          <= B"00";
 HRDATA_S13_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S13_const_net_0          <= B"00";
 HRDATA_S14_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S14_const_net_0          <= B"00";
 HRDATA_S15_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S15_const_net_0          <= B"00";
 FIC_2_APB_M_PRDATA_const_net_0 <= B"00000000000000000000000000000000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 POWER_ON_RESET_N_net_1                        <= POWER_ON_RESET_N_net_0;
 POWER_ON_RESET_N                              <= POWER_ON_RESET_N_net_1;
 INIT_DONE_net_1                               <= INIT_DONE_net_0;
 INIT_DONE                                     <= INIT_DONE_net_1;
 FIC_0_CLK_net_1                               <= FIC_0_CLK_net_0;
 FIC_0_CLK                                     <= FIC_0_CLK_net_1;
 FIC_0_LOCK_net_1                              <= FIC_0_LOCK_net_0;
 FIC_0_LOCK                                    <= FIC_0_LOCK_net_1;
 HPMS_READY_net_1                              <= HPMS_READY_net_0;
 HPMS_READY                                    <= HPMS_READY_net_1;
 HPMS_FIC_0_USER_MASTER_HRDATA_net_0           <= HPMS_FIC_0_USER_MASTER_HRDATA;
 HPMS_FIC_0_USER_MASTER_HRDATA_M0(31 downto 0) <= HPMS_FIC_0_USER_MASTER_HRDATA_net_0;
 HPMS_FIC_0_USER_MASTER_HREADY_net_0           <= HPMS_FIC_0_USER_MASTER_HREADY;
 HPMS_FIC_0_USER_MASTER_HREADY_M0              <= HPMS_FIC_0_USER_MASTER_HREADY_net_0;
 HPMS_FIC_0_USER_MASTER_HRESP_net_0            <= HPMS_FIC_0_USER_MASTER_HRESP;
 HPMS_FIC_0_USER_MASTER_HRESP_M0(1 downto 0)   <= HPMS_FIC_0_USER_MASTER_HRESP_net_0;
 COMM_BLK_INT_net_1                            <= COMM_BLK_INT_net_0;
 COMM_BLK_INT                                  <= COMM_BLK_INT_net_1;
 HPMS_INT_M2F_net_1                            <= HPMS_INT_M2F_net_0;
 HPMS_INT_M2F(15 downto 0)                     <= HPMS_INT_M2F_net_1;
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 CoreAHBLite_0_AHBmslave16_HRESP_0(1 downto 0) <= ( CoreAHBLite_0_AHBmslave16_HRESP_0_1to1(1) & CoreAHBLite_0_AHBmslave16_HRESP_0_0to0(0) );
 CoreAHBLite_0_AHBmslave16_HRESP_0_0to0(0) <= CoreAHBLite_0_AHBmslave16_HRESP;
 CoreAHBLite_0_AHBmslave16_HRESP_0_1to1(1) <= '0';

 CoreAHBLite_0_AHBmslave16_HSIZE_0(1 downto 0) <= ( CoreAHBLite_0_AHBmslave16_HSIZE_0_1to0(1 downto 0) );
 CoreAHBLite_0_AHBmslave16_HSIZE_0_1to0(1 downto 0) <= CoreAHBLite_0_AHBmslave16_HSIZE(1 downto 0);

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CCC_0   -   Actel:SgCore:FCCC:2.0.201
CCC_0 : top_sb_CCC_0_FCCC
    port map( 
        -- Inputs
        RCOSC_25_50MHZ => FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC,
        -- Outputs
        GL0            => FIC_0_CLK_net_0,
        LOCK           => FIC_0_LOCK_net_0 
        );
-- CoreAHBLite_0   -   Actel:DirectCore:CoreAHBLite:5.2.100
CoreAHBLite_0 : entity COREAHBLITE_LIB.CoreAHBLite
    generic map( 
        FAMILY             => ( 24 ),
        HADDR_SHG_CFG      => ( 1 ),
        M0_AHBSLOT0ENABLE  => ( 0 ),
        M0_AHBSLOT1ENABLE  => ( 0 ),
        M0_AHBSLOT2ENABLE  => ( 0 ),
        M0_AHBSLOT3ENABLE  => ( 0 ),
        M0_AHBSLOT4ENABLE  => ( 0 ),
        M0_AHBSLOT5ENABLE  => ( 0 ),
        M0_AHBSLOT6ENABLE  => ( 0 ),
        M0_AHBSLOT7ENABLE  => ( 0 ),
        M0_AHBSLOT8ENABLE  => ( 0 ),
        M0_AHBSLOT9ENABLE  => ( 0 ),
        M0_AHBSLOT10ENABLE => ( 0 ),
        M0_AHBSLOT11ENABLE => ( 0 ),
        M0_AHBSLOT12ENABLE => ( 0 ),
        M0_AHBSLOT13ENABLE => ( 0 ),
        M0_AHBSLOT14ENABLE => ( 0 ),
        M0_AHBSLOT15ENABLE => ( 0 ),
        M0_AHBSLOT16ENABLE => ( 1 ),
        M1_AHBSLOT0ENABLE  => ( 0 ),
        M1_AHBSLOT1ENABLE  => ( 0 ),
        M1_AHBSLOT2ENABLE  => ( 0 ),
        M1_AHBSLOT3ENABLE  => ( 0 ),
        M1_AHBSLOT4ENABLE  => ( 0 ),
        M1_AHBSLOT5ENABLE  => ( 0 ),
        M1_AHBSLOT6ENABLE  => ( 0 ),
        M1_AHBSLOT7ENABLE  => ( 0 ),
        M1_AHBSLOT8ENABLE  => ( 0 ),
        M1_AHBSLOT9ENABLE  => ( 0 ),
        M1_AHBSLOT10ENABLE => ( 0 ),
        M1_AHBSLOT11ENABLE => ( 0 ),
        M1_AHBSLOT12ENABLE => ( 0 ),
        M1_AHBSLOT13ENABLE => ( 0 ),
        M1_AHBSLOT14ENABLE => ( 0 ),
        M1_AHBSLOT15ENABLE => ( 0 ),
        M1_AHBSLOT16ENABLE => ( 0 ),
        M2_AHBSLOT0ENABLE  => ( 0 ),
        M2_AHBSLOT1ENABLE  => ( 0 ),
        M2_AHBSLOT2ENABLE  => ( 0 ),
        M2_AHBSLOT3ENABLE  => ( 0 ),
        M2_AHBSLOT4ENABLE  => ( 0 ),
        M2_AHBSLOT5ENABLE  => ( 0 ),
        M2_AHBSLOT6ENABLE  => ( 0 ),
        M2_AHBSLOT7ENABLE  => ( 0 ),
        M2_AHBSLOT8ENABLE  => ( 0 ),
        M2_AHBSLOT9ENABLE  => ( 0 ),
        M2_AHBSLOT10ENABLE => ( 0 ),
        M2_AHBSLOT11ENABLE => ( 0 ),
        M2_AHBSLOT12ENABLE => ( 0 ),
        M2_AHBSLOT13ENABLE => ( 0 ),
        M2_AHBSLOT14ENABLE => ( 0 ),
        M2_AHBSLOT15ENABLE => ( 0 ),
        M2_AHBSLOT16ENABLE => ( 0 ),
        M3_AHBSLOT0ENABLE  => ( 0 ),
        M3_AHBSLOT1ENABLE  => ( 0 ),
        M3_AHBSLOT2ENABLE  => ( 0 ),
        M3_AHBSLOT3ENABLE  => ( 0 ),
        M3_AHBSLOT4ENABLE  => ( 0 ),
        M3_AHBSLOT5ENABLE  => ( 0 ),
        M3_AHBSLOT6ENABLE  => ( 0 ),
        M3_AHBSLOT7ENABLE  => ( 0 ),
        M3_AHBSLOT8ENABLE  => ( 0 ),
        M3_AHBSLOT9ENABLE  => ( 0 ),
        M3_AHBSLOT10ENABLE => ( 0 ),
        M3_AHBSLOT11ENABLE => ( 0 ),
        M3_AHBSLOT12ENABLE => ( 0 ),
        M3_AHBSLOT13ENABLE => ( 0 ),
        M3_AHBSLOT14ENABLE => ( 0 ),
        M3_AHBSLOT15ENABLE => ( 0 ),
        M3_AHBSLOT16ENABLE => ( 0 ),
        MEMSPACE           => ( 1 ),
        SC_0               => ( 1 ),
        SC_1               => ( 0 ),
        SC_2               => ( 1 ),
        SC_3               => ( 0 ),
        SC_4               => ( 1 ),
        SC_5               => ( 0 ),
        SC_6               => ( 1 ),
        SC_7               => ( 0 ),
        SC_8               => ( 0 ),
        SC_9               => ( 0 ),
        SC_10              => ( 0 ),
        SC_11              => ( 0 ),
        SC_12              => ( 0 ),
        SC_13              => ( 0 ),
        SC_14              => ( 0 ),
        SC_15              => ( 0 )
        )
    port map( 
        -- Inputs
        HCLK                  => FIC_0_CLK_net_0,
        HRESETN               => HPMS_READY_net_0,
        REMAP_M0              => GND_net,
        HADDR_M0              => HPMS_FIC_0_USER_MASTER_HADDR_M0,
        HMASTLOCK_M0          => HPMS_FIC_0_USER_MASTER_HMASTLOCK_M0,
        HSIZE_M0              => HPMS_FIC_0_USER_MASTER_HSIZE_M0,
        HTRANS_M0             => HPMS_FIC_0_USER_MASTER_HTRANS_M0,
        HWRITE_M0             => HPMS_FIC_0_USER_MASTER_HWRITE_M0,
        HWDATA_M0             => HPMS_FIC_0_USER_MASTER_HWDATA_M0,
        HBURST_M0             => HPMS_FIC_0_USER_MASTER_HBURST_M0,
        HPROT_M0              => HPMS_FIC_0_USER_MASTER_HPROT_M0,
        HADDR_M1              => HADDR_M1_const_net_0, -- tied to X"0" from definition
        HMASTLOCK_M1          => GND_net, -- tied to '0' from definition
        HSIZE_M1              => HSIZE_M1_const_net_0, -- tied to X"0" from definition
        HTRANS_M1             => HTRANS_M1_const_net_0, -- tied to X"0" from definition
        HWRITE_M1             => GND_net, -- tied to '0' from definition
        HWDATA_M1             => HWDATA_M1_const_net_0, -- tied to X"0" from definition
        HBURST_M1             => HBURST_M1_const_net_0, -- tied to X"0" from definition
        HPROT_M1              => HPROT_M1_const_net_0, -- tied to X"0" from definition
        HADDR_M2              => HADDR_M2_const_net_0, -- tied to X"0" from definition
        HMASTLOCK_M2          => GND_net, -- tied to '0' from definition
        HSIZE_M2              => HSIZE_M2_const_net_0, -- tied to X"0" from definition
        HTRANS_M2             => HTRANS_M2_const_net_0, -- tied to X"0" from definition
        HWRITE_M2             => GND_net, -- tied to '0' from definition
        HWDATA_M2             => HWDATA_M2_const_net_0, -- tied to X"0" from definition
        HBURST_M2             => HBURST_M2_const_net_0, -- tied to X"0" from definition
        HPROT_M2              => HPROT_M2_const_net_0, -- tied to X"0" from definition
        HADDR_M3              => HADDR_M3_const_net_0, -- tied to X"0" from definition
        HMASTLOCK_M3          => GND_net, -- tied to '0' from definition
        HSIZE_M3              => HSIZE_M3_const_net_0, -- tied to X"0" from definition
        HTRANS_M3             => HTRANS_M3_const_net_0, -- tied to X"0" from definition
        HWRITE_M3             => GND_net, -- tied to '0' from definition
        HWDATA_M3             => HWDATA_M3_const_net_0, -- tied to X"0" from definition
        HBURST_M3             => HBURST_M3_const_net_0, -- tied to X"0" from definition
        HPROT_M3              => HPROT_M3_const_net_0, -- tied to X"0" from definition
        HRDATA_S0             => HRDATA_S0_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S0          => VCC_net, -- tied to '1' from definition
        HRESP_S0              => HRESP_S0_const_net_0, -- tied to X"0" from definition
        HRDATA_S1             => HRDATA_S1_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S1          => VCC_net, -- tied to '1' from definition
        HRESP_S1              => HRESP_S1_const_net_0, -- tied to X"0" from definition
        HRDATA_S2             => HRDATA_S2_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S2          => VCC_net, -- tied to '1' from definition
        HRESP_S2              => HRESP_S2_const_net_0, -- tied to X"0" from definition
        HRDATA_S3             => HRDATA_S3_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S3          => VCC_net, -- tied to '1' from definition
        HRESP_S3              => HRESP_S3_const_net_0, -- tied to X"0" from definition
        HRDATA_S4             => HRDATA_S4_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S4          => VCC_net, -- tied to '1' from definition
        HRESP_S4              => HRESP_S4_const_net_0, -- tied to X"0" from definition
        HRDATA_S5             => HRDATA_S5_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S5          => VCC_net, -- tied to '1' from definition
        HRESP_S5              => HRESP_S5_const_net_0, -- tied to X"0" from definition
        HRDATA_S6             => HRDATA_S6_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S6          => VCC_net, -- tied to '1' from definition
        HRESP_S6              => HRESP_S6_const_net_0, -- tied to X"0" from definition
        HRDATA_S7             => HRDATA_S7_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S7          => VCC_net, -- tied to '1' from definition
        HRESP_S7              => HRESP_S7_const_net_0, -- tied to X"0" from definition
        HRDATA_S8             => HRDATA_S8_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S8          => VCC_net, -- tied to '1' from definition
        HRESP_S8              => HRESP_S8_const_net_0, -- tied to X"0" from definition
        HRDATA_S9             => HRDATA_S9_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S9          => VCC_net, -- tied to '1' from definition
        HRESP_S9              => HRESP_S9_const_net_0, -- tied to X"0" from definition
        HRDATA_S10            => HRDATA_S10_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S10         => VCC_net, -- tied to '1' from definition
        HRESP_S10             => HRESP_S10_const_net_0, -- tied to X"0" from definition
        HRDATA_S11            => HRDATA_S11_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S11         => VCC_net, -- tied to '1' from definition
        HRESP_S11             => HRESP_S11_const_net_0, -- tied to X"0" from definition
        HRDATA_S12            => HRDATA_S12_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S12         => VCC_net, -- tied to '1' from definition
        HRESP_S12             => HRESP_S12_const_net_0, -- tied to X"0" from definition
        HRDATA_S13            => HRDATA_S13_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S13         => VCC_net, -- tied to '1' from definition
        HRESP_S13             => HRESP_S13_const_net_0, -- tied to X"0" from definition
        HRDATA_S14            => HRDATA_S14_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S14         => VCC_net, -- tied to '1' from definition
        HRESP_S14             => HRESP_S14_const_net_0, -- tied to X"0" from definition
        HRDATA_S15            => HRDATA_S15_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S15         => VCC_net, -- tied to '1' from definition
        HRESP_S15             => HRESP_S15_const_net_0, -- tied to X"0" from definition
        HRDATA_S16            => CoreAHBLite_0_AHBmslave16_HRDATA,
        HREADYOUT_S16         => CoreAHBLite_0_AHBmslave16_HREADYOUT,
        HRESP_S16(1 downto 0) => CoreAHBLite_0_AHBmslave16_HRESP_0,
        -- Outputs
        HRESP_M0              => HPMS_FIC_0_USER_MASTER_HRESP,
        HRDATA_M0             => HPMS_FIC_0_USER_MASTER_HRDATA,
        HREADY_M0             => HPMS_FIC_0_USER_MASTER_HREADY,
        HRESP_M1              => OPEN,
        HRDATA_M1             => OPEN,
        HREADY_M1             => OPEN,
        HRESP_M2              => OPEN,
        HRDATA_M2             => OPEN,
        HREADY_M2             => OPEN,
        HRESP_M3              => OPEN,
        HRDATA_M3             => OPEN,
        HREADY_M3             => OPEN,
        HSEL_S0               => OPEN,
        HADDR_S0              => OPEN,
        HSIZE_S0              => OPEN,
        HTRANS_S0             => OPEN,
        HWRITE_S0             => OPEN,
        HWDATA_S0             => OPEN,
        HREADY_S0             => OPEN,
        HMASTLOCK_S0          => OPEN,
        HBURST_S0             => OPEN,
        HPROT_S0              => OPEN,
        HSEL_S1               => OPEN,
        HADDR_S1              => OPEN,
        HSIZE_S1              => OPEN,
        HTRANS_S1             => OPEN,
        HWRITE_S1             => OPEN,
        HWDATA_S1             => OPEN,
        HREADY_S1             => OPEN,
        HMASTLOCK_S1          => OPEN,
        HBURST_S1             => OPEN,
        HPROT_S1              => OPEN,
        HSEL_S2               => OPEN,
        HADDR_S2              => OPEN,
        HSIZE_S2              => OPEN,
        HTRANS_S2             => OPEN,
        HWRITE_S2             => OPEN,
        HWDATA_S2             => OPEN,
        HREADY_S2             => OPEN,
        HMASTLOCK_S2          => OPEN,
        HBURST_S2             => OPEN,
        HPROT_S2              => OPEN,
        HSEL_S3               => OPEN,
        HADDR_S3              => OPEN,
        HSIZE_S3              => OPEN,
        HTRANS_S3             => OPEN,
        HWRITE_S3             => OPEN,
        HWDATA_S3             => OPEN,
        HREADY_S3             => OPEN,
        HMASTLOCK_S3          => OPEN,
        HBURST_S3             => OPEN,
        HPROT_S3              => OPEN,
        HSEL_S4               => OPEN,
        HADDR_S4              => OPEN,
        HSIZE_S4              => OPEN,
        HTRANS_S4             => OPEN,
        HWRITE_S4             => OPEN,
        HWDATA_S4             => OPEN,
        HREADY_S4             => OPEN,
        HMASTLOCK_S4          => OPEN,
        HBURST_S4             => OPEN,
        HPROT_S4              => OPEN,
        HSEL_S5               => OPEN,
        HADDR_S5              => OPEN,
        HSIZE_S5              => OPEN,
        HTRANS_S5             => OPEN,
        HWRITE_S5             => OPEN,
        HWDATA_S5             => OPEN,
        HREADY_S5             => OPEN,
        HMASTLOCK_S5          => OPEN,
        HBURST_S5             => OPEN,
        HPROT_S5              => OPEN,
        HSEL_S6               => OPEN,
        HADDR_S6              => OPEN,
        HSIZE_S6              => OPEN,
        HTRANS_S6             => OPEN,
        HWRITE_S6             => OPEN,
        HWDATA_S6             => OPEN,
        HREADY_S6             => OPEN,
        HMASTLOCK_S6          => OPEN,
        HBURST_S6             => OPEN,
        HPROT_S6              => OPEN,
        HSEL_S7               => OPEN,
        HADDR_S7              => OPEN,
        HSIZE_S7              => OPEN,
        HTRANS_S7             => OPEN,
        HWRITE_S7             => OPEN,
        HWDATA_S7             => OPEN,
        HREADY_S7             => OPEN,
        HMASTLOCK_S7          => OPEN,
        HBURST_S7             => OPEN,
        HPROT_S7              => OPEN,
        HSEL_S8               => OPEN,
        HADDR_S8              => OPEN,
        HSIZE_S8              => OPEN,
        HTRANS_S8             => OPEN,
        HWRITE_S8             => OPEN,
        HWDATA_S8             => OPEN,
        HREADY_S8             => OPEN,
        HMASTLOCK_S8          => OPEN,
        HBURST_S8             => OPEN,
        HPROT_S8              => OPEN,
        HSEL_S9               => OPEN,
        HADDR_S9              => OPEN,
        HSIZE_S9              => OPEN,
        HTRANS_S9             => OPEN,
        HWRITE_S9             => OPEN,
        HWDATA_S9             => OPEN,
        HREADY_S9             => OPEN,
        HMASTLOCK_S9          => OPEN,
        HBURST_S9             => OPEN,
        HPROT_S9              => OPEN,
        HSEL_S10              => OPEN,
        HADDR_S10             => OPEN,
        HSIZE_S10             => OPEN,
        HTRANS_S10            => OPEN,
        HWRITE_S10            => OPEN,
        HWDATA_S10            => OPEN,
        HREADY_S10            => OPEN,
        HMASTLOCK_S10         => OPEN,
        HBURST_S10            => OPEN,
        HPROT_S10             => OPEN,
        HSEL_S11              => OPEN,
        HADDR_S11             => OPEN,
        HSIZE_S11             => OPEN,
        HTRANS_S11            => OPEN,
        HWRITE_S11            => OPEN,
        HWDATA_S11            => OPEN,
        HREADY_S11            => OPEN,
        HMASTLOCK_S11         => OPEN,
        HBURST_S11            => OPEN,
        HPROT_S11             => OPEN,
        HSEL_S12              => OPEN,
        HADDR_S12             => OPEN,
        HSIZE_S12             => OPEN,
        HTRANS_S12            => OPEN,
        HWRITE_S12            => OPEN,
        HWDATA_S12            => OPEN,
        HREADY_S12            => OPEN,
        HMASTLOCK_S12         => OPEN,
        HBURST_S12            => OPEN,
        HPROT_S12             => OPEN,
        HSEL_S13              => OPEN,
        HADDR_S13             => OPEN,
        HSIZE_S13             => OPEN,
        HTRANS_S13            => OPEN,
        HWRITE_S13            => OPEN,
        HWDATA_S13            => OPEN,
        HREADY_S13            => OPEN,
        HMASTLOCK_S13         => OPEN,
        HBURST_S13            => OPEN,
        HPROT_S13             => OPEN,
        HSEL_S14              => OPEN,
        HADDR_S14             => OPEN,
        HSIZE_S14             => OPEN,
        HTRANS_S14            => OPEN,
        HWRITE_S14            => OPEN,
        HWDATA_S14            => OPEN,
        HREADY_S14            => OPEN,
        HMASTLOCK_S14         => OPEN,
        HBURST_S14            => OPEN,
        HPROT_S14             => OPEN,
        HSEL_S15              => OPEN,
        HADDR_S15             => OPEN,
        HSIZE_S15             => OPEN,
        HTRANS_S15            => OPEN,
        HWRITE_S15            => OPEN,
        HWDATA_S15            => OPEN,
        HREADY_S15            => OPEN,
        HMASTLOCK_S15         => OPEN,
        HBURST_S15            => OPEN,
        HPROT_S15             => OPEN,
        HSEL_S16              => CoreAHBLite_0_AHBmslave16_HSELx,
        HADDR_S16             => CoreAHBLite_0_AHBmslave16_HADDR,
        HSIZE_S16             => CoreAHBLite_0_AHBmslave16_HSIZE,
        HTRANS_S16            => CoreAHBLite_0_AHBmslave16_HTRANS,
        HWRITE_S16            => CoreAHBLite_0_AHBmslave16_HWRITE,
        HWDATA_S16            => CoreAHBLite_0_AHBmslave16_HWDATA,
        HREADY_S16            => CoreAHBLite_0_AHBmslave16_HREADY,
        HMASTLOCK_S16         => CoreAHBLite_0_AHBmslave16_HMASTLOCK,
        HBURST_S16            => CoreAHBLite_0_AHBmslave16_HBURST,
        HPROT_S16             => CoreAHBLite_0_AHBmslave16_HPROT 
        );
-- CORERESETP_0   -   Actel:DirectCore:CoreResetP:7.1.100
CORERESETP_0 : CoreResetP
    generic map( 
        DDR_WAIT            => ( 200 ),
        DEVICE_090          => ( 0 ),
        DEVICE_VOLTAGE      => ( 2 ),
        ENABLE_SOFT_RESETS  => ( 0 ),
        EXT_RESET_CFG       => ( 0 ),
        FDDR_IN_USE         => ( 0 ),
        MDDR_IN_USE         => ( 0 ),
        SDIF0_IN_USE        => ( 0 ),
        SDIF0_PCIE          => ( 0 ),
        SDIF0_PCIE_HOTRESET => ( 1 ),
        SDIF0_PCIE_L2P2     => ( 1 ),
        SDIF1_IN_USE        => ( 0 ),
        SDIF1_PCIE          => ( 0 ),
        SDIF1_PCIE_HOTRESET => ( 1 ),
        SDIF1_PCIE_L2P2     => ( 1 ),
        SDIF2_IN_USE        => ( 0 ),
        SDIF2_PCIE          => ( 0 ),
        SDIF2_PCIE_HOTRESET => ( 1 ),
        SDIF2_PCIE_L2P2     => ( 1 ),
        SDIF3_IN_USE        => ( 0 ),
        SDIF3_PCIE          => ( 0 ),
        SDIF3_PCIE_HOTRESET => ( 1 ),
        SDIF3_PCIE_L2P2     => ( 1 )
        )
    port map( 
        -- Inputs
        RESET_N_M2F                    => top_sb_HPMS_0_MSS_RESET_N_M2F,
        FIC_2_APB_M_PRESET_N           => top_sb_HPMS_0_FIC_2_APB_M_PRESET_N,
        POWER_ON_RESET_N               => POWER_ON_RESET_N_net_0,
        FAB_RESET_N                    => FAB_RESET_N,
        RCOSC_25_50MHZ                 => FABOSC_0_RCOSC_25_50MHZ_O2F,
        CLK_BASE                       => FIC_0_CLK_net_0,
        CLK_LTSSM                      => GND_net, -- tied to '0' from definition
        FPLL_LOCK                      => VCC_net, -- tied to '1' from definition
        SDIF0_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF1_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF2_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF3_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        CONFIG1_DONE                   => VCC_net,
        CONFIG2_DONE                   => VCC_net,
        SDIF0_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF1_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF2_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF3_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF0_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF0_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF0_PRDATA                   => SDIF0_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF1_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF1_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF1_PRDATA                   => SDIF1_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF2_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF2_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF2_PRDATA                   => SDIF2_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF3_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF3_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF3_PRDATA                   => SDIF3_PRDATA_const_net_0, -- tied to X"0" from definition
        SOFT_EXT_RESET_OUT             => GND_net, -- tied to '0' from definition
        SOFT_RESET_F2M                 => GND_net, -- tied to '0' from definition
        SOFT_M3_RESET                  => GND_net, -- tied to '0' from definition
        SOFT_MDDR_DDR_AXI_S_CORE_RESET => GND_net, -- tied to '0' from definition
        SOFT_FDDR_CORE_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_0_CORE_RESET        => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_1_CORE_RESET        => GND_net, -- tied to '0' from definition
        SOFT_SDIF1_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF1_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF2_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF2_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF3_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF3_CORE_RESET          => GND_net, -- tied to '0' from definition
        -- Outputs
        MSS_HPMS_READY                 => HPMS_READY_net_0,
        DDR_READY                      => OPEN,
        SDIF_READY                     => OPEN,
        RESET_N_F2M                    => CORERESETP_0_RESET_N_F2M,
        M3_RESET_N                     => OPEN,
        EXT_RESET_OUT                  => OPEN,
        MDDR_DDR_AXI_S_CORE_RESET_N    => OPEN,
        FDDR_CORE_RESET_N              => OPEN,
        SDIF0_CORE_RESET_N             => OPEN,
        SDIF0_0_CORE_RESET_N           => OPEN,
        SDIF0_1_CORE_RESET_N           => OPEN,
        SDIF0_PHY_RESET_N              => OPEN,
        SDIF1_CORE_RESET_N             => OPEN,
        SDIF1_PHY_RESET_N              => OPEN,
        SDIF2_CORE_RESET_N             => OPEN,
        SDIF2_PHY_RESET_N              => OPEN,
        SDIF3_CORE_RESET_N             => OPEN,
        SDIF3_PHY_RESET_N              => OPEN,
        SDIF_RELEASED                  => OPEN,
        INIT_DONE                      => INIT_DONE_net_0 
        );
-- FABOSC_0   -   Actel:SgCore:OSC:2.0.101
FABOSC_0 : top_sb_FABOSC_0_OSC
    port map( 
        -- Inputs
        XTL                => GND_net, -- tied to '0' from definition
        -- Outputs
        RCOSC_25_50MHZ_CCC => FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC,
        RCOSC_25_50MHZ_O2F => FABOSC_0_RCOSC_25_50MHZ_O2F,
        RCOSC_1MHZ_CCC     => OPEN,
        RCOSC_1MHZ_O2F     => OPEN,
        XTLOSC_CCC         => OPEN,
        XTLOSC_O2F         => OPEN 
        );
-- SYSRESET_POR
SYSRESET_POR : SYSRESET
    port map( 
        -- Inputs
        DEVRST_N         => DEVRST_N,
        -- Outputs
        POWER_ON_RESET_N => POWER_ON_RESET_N_net_0 
        );
-- top_sb_HPMS_0
top_sb_HPMS_0 : top_sb_HPMS
    port map( 
        -- Inputs
        MCCC_CLK_BASE          => FIC_0_CLK_net_0,
        MCCC_CLK_BASE_PLL_LOCK => FIC_0_LOCK_net_0,
        MSS_RESET_N_F2M        => CORERESETP_0_RESET_N_F2M,
        M3_RESET_N             => GND_net,
        FIC_0_AHB_S_HADDR      => CoreAHBLite_0_AHBmslave16_HADDR,
        FIC_0_AHB_S_HREADY     => CoreAHBLite_0_AHBmslave16_HREADY,
        FIC_0_AHB_S_HWDATA     => CoreAHBLite_0_AHBmslave16_HWDATA,
        FIC_0_AHB_S_HWRITE     => CoreAHBLite_0_AHBmslave16_HWRITE,
        FIC_0_AHB_S_HSIZE      => CoreAHBLite_0_AHBmslave16_HSIZE_0,
        FIC_0_AHB_S_HTRANS     => CoreAHBLite_0_AHBmslave16_HTRANS,
        FIC_0_AHB_S_HMASTLOCK  => CoreAHBLite_0_AHBmslave16_HMASTLOCK,
        FIC_0_AHB_S_HSEL       => CoreAHBLite_0_AHBmslave16_HSELx,
        FIC_2_APB_M_PRDATA     => FIC_2_APB_M_PRDATA_const_net_0, -- tied to X"0" from definition
        FIC_2_APB_M_PREADY     => VCC_net, -- tied to '1' from definition
        FIC_2_APB_M_PSLVERR    => GND_net, -- tied to '0' from definition
        -- Outputs
        MSS_RESET_N_M2F        => top_sb_HPMS_0_MSS_RESET_N_M2F,
        FIC_0_AHB_S_HRDATA     => CoreAHBLite_0_AHBmslave16_HRDATA,
        FIC_0_AHB_S_HRESP      => CoreAHBLite_0_AHBmslave16_HRESP,
        FIC_0_AHB_S_HREADYOUT  => CoreAHBLite_0_AHBmslave16_HREADYOUT,
        FIC_2_APB_M_PRESET_N   => top_sb_HPMS_0_FIC_2_APB_M_PRESET_N,
        FIC_2_APB_M_PCLK       => OPEN,
        FIC_2_APB_M_PADDR      => OPEN,
        FIC_2_APB_M_PWDATA     => OPEN,
        FIC_2_APB_M_PWRITE     => OPEN,
        FIC_2_APB_M_PENABLE    => OPEN,
        FIC_2_APB_M_PSEL       => OPEN,
        M3_NMI                 => OPEN,
        COMM_BLK_INT           => COMM_BLK_INT_net_0,
        MSS_INT_M2F            => HPMS_INT_M2F_net_0 
        );

end RTL;