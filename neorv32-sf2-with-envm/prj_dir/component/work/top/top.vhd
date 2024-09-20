----------------------------------------------------------------------
-- Created by SmartDesign Fri Sep 20 09:45:19 2024
-- Version: 2022.1 2022.1.0.10
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- top entity declaration
----------------------------------------------------------------------
entity top is
    -- Port list
    port(
        -- Inputs
        DEVRST_N : in  std_logic;
        UART_RX  : in  std_logic;
        -- Outputs
        UART_TX  : out std_logic;
        led0     : out std_logic;
        led1     : out std_logic;
        led2     : out std_logic;
        led3     : out std_logic;
        led4     : out std_logic;
        led5     : out std_logic;
        led6     : out std_logic;
        led7     : out std_logic
        );
end top;
----------------------------------------------------------------------
-- top architecture body
----------------------------------------------------------------------
architecture RTL of top is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- neorv32_ProcessorTop_Minimal
component neorv32_ProcessorTop_Minimal
    -- Port list
    port(
        -- Inputs
        clk_i       : in  std_logic;
        rstn_i      : in  std_logic;
        uart0_rxd_i : in  std_logic;
        wb_ack_i    : in  std_logic;
        wb_dat_i    : in  std_logic_vector(31 downto 0);
        wb_err_i    : in  std_logic;
        -- Outputs
        gpio_o      : out std_logic_vector(7 downto 0);
        uart0_txd_o : out std_logic;
        wb_adr_o    : out std_logic_vector(31 downto 0);
        wb_cyc_o    : out std_logic;
        wb_dat_o    : out std_logic_vector(31 downto 0);
        wb_sel_o    : out std_logic_vector(3 downto 0);
        wb_stb_o    : out std_logic;
        wb_tag_o    : out std_logic_vector(2 downto 0);
        wb_we_o     : out std_logic
        );
end component;
-- OR2
component OR2
    -- Port list
    port(
        -- Inputs
        A : in  std_logic;
        B : in  std_logic;
        -- Outputs
        Y : out std_logic
        );
end component;
-- top_sb
component top_sb
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
end component;
-- WB2AHBL
component WB2AHBL
    -- Port list
    port(
        -- Inputs
        addr_i  : in  std_logic_vector(31 downto 0);
        cyc_i   : in  std_logic;
        data_i  : in  std_logic_vector(31 downto 0);
        hclk    : in  std_logic;
        hrdata  : in  std_logic_vector(31 downto 0);
        hready  : in  std_logic;
        hresetn : in  std_logic;
        hresp   : in  std_logic;
        sel_i   : in  std_logic_vector(3 downto 0);
        stb_i   : in  std_logic;
        we_i    : in  std_logic;
        -- Outputs
        ack_o   : out std_logic;
        data_o  : out std_logic_vector(31 downto 0);
        err_o   : out std_logic;
        haddr   : out std_logic_vector(31 downto 0);
        hburst  : out std_logic_vector(2 downto 0);
        hsize   : out std_logic_vector(2 downto 0);
        htrans  : out std_logic_vector(1 downto 0);
        hwdata  : out std_logic_vector(31 downto 0);
        hwrite  : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal led0_net_0                                   : std_logic_vector(0 to 0);
signal led1_net_0                                   : std_logic_vector(1 to 1);
signal led2_net_0                                   : std_logic_vector(2 to 2);
signal led3_net_0                                   : std_logic_vector(3 to 3);
signal led4_net_0                                   : std_logic_vector(4 to 4);
signal led5_net_0                                   : std_logic_vector(5 to 5);
signal led6_net_0                                   : std_logic_vector(6 to 6);
signal led7_net_0                                   : std_logic_vector(7 to 7);
signal neorv32_ProcessorTop_Minimal_0_wb_adr_o      : std_logic_vector(31 downto 0);
signal neorv32_ProcessorTop_Minimal_0_wb_cyc_o      : std_logic;
signal neorv32_ProcessorTop_Minimal_0_wb_dat_o      : std_logic_vector(31 downto 0);
signal neorv32_ProcessorTop_Minimal_0_wb_sel_o      : std_logic_vector(3 downto 0);
signal neorv32_ProcessorTop_Minimal_0_wb_stb_o      : std_logic;
signal neorv32_ProcessorTop_Minimal_0_wb_we_o       : std_logic;
signal OR2_0_Y                                      : std_logic;
signal top_sb_0_FIC_0_CLK                           : std_logic;
signal top_sb_0_HPMS_FIC_0_USER_MASTER_HRDATA_M0    : std_logic_vector(31 downto 0);
signal top_sb_0_HPMS_FIC_0_USER_MASTER_HREADY_M0    : std_logic;
signal top_sb_0_HPMS_FIC_0_USER_MASTER_HRESP_M00to0 : std_logic_vector(0 to 0);
signal top_sb_0_HPMS_FIC_0_USER_MASTER_HRESP_M01to1 : std_logic_vector(1 to 1);
signal top_sb_0_INIT_DONE                           : std_logic;
signal UART_TX_net_0                                : std_logic;
signal WB2AHBL_0_ack_o                              : std_logic;
signal WB2AHBL_0_data_o                             : std_logic_vector(31 downto 0);
signal WB2AHBL_0_err_o                              : std_logic;
signal WB2AHBL_0_haddr                              : std_logic_vector(31 downto 0);
signal WB2AHBL_0_hburst                             : std_logic_vector(2 downto 0);
signal WB2AHBL_0_hsize                              : std_logic_vector(2 downto 0);
signal WB2AHBL_0_htrans                             : std_logic_vector(1 downto 0);
signal WB2AHBL_0_hwdata                             : std_logic_vector(31 downto 0);
signal WB2AHBL_0_hwrite                             : std_logic;
signal led0_net_1                                   : std_logic;
signal led1_net_1                                   : std_logic;
signal led2_net_1                                   : std_logic;
signal led3_net_1                                   : std_logic;
signal led4_net_1                                   : std_logic;
signal led5_net_1                                   : std_logic;
signal led6_net_1                                   : std_logic;
signal led7_net_1                                   : std_logic;
signal UART_TX_net_1                                : std_logic;
signal gpio_o_net_0                                 : std_logic_vector(7 downto 0);
signal HPMS_FIC_0_USER_MASTER_HRESP_M0_net_0        : std_logic_vector(1 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal HPMS_FIC_0_USER_MASTER_HPROT_M0_const_net_0  : std_logic_vector(3 downto 0);
signal VCC_net                                      : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 HPMS_FIC_0_USER_MASTER_HPROT_M0_const_net_0 <= B"0000";
 VCC_net                                     <= '1';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 led0_net_1    <= led0_net_0(0);
 led0          <= led0_net_1;
 led1_net_1    <= led1_net_0(1);
 led1          <= led1_net_1;
 led2_net_1    <= led2_net_0(2);
 led2          <= led2_net_1;
 led3_net_1    <= led3_net_0(3);
 led3          <= led3_net_1;
 led4_net_1    <= led4_net_0(4);
 led4          <= led4_net_1;
 led5_net_1    <= led5_net_0(5);
 led5          <= led5_net_1;
 led6_net_1    <= led6_net_0(6);
 led6          <= led6_net_1;
 led7_net_1    <= led7_net_0(7);
 led7          <= led7_net_1;
 UART_TX_net_1 <= UART_TX_net_0;
 UART_TX       <= UART_TX_net_1;
----------------------------------------------------------------------
-- Slices assignments
----------------------------------------------------------------------
 led0_net_0(0)                                   <= gpio_o_net_0(0);
 led1_net_0(1)                                   <= gpio_o_net_0(1);
 led2_net_0(2)                                   <= gpio_o_net_0(2);
 led3_net_0(3)                                   <= gpio_o_net_0(3);
 led4_net_0(4)                                   <= gpio_o_net_0(4);
 led5_net_0(5)                                   <= gpio_o_net_0(5);
 led6_net_0(6)                                   <= gpio_o_net_0(6);
 led7_net_0(7)                                   <= gpio_o_net_0(7);
 top_sb_0_HPMS_FIC_0_USER_MASTER_HRESP_M00to0(0) <= HPMS_FIC_0_USER_MASTER_HRESP_M0_net_0(0);
 top_sb_0_HPMS_FIC_0_USER_MASTER_HRESP_M01to1(1) <= HPMS_FIC_0_USER_MASTER_HRESP_M0_net_0(1);
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- neorv32_ProcessorTop_Minimal_0
neorv32_ProcessorTop_Minimal_0 : neorv32_ProcessorTop_Minimal
    port map( 
        -- Inputs
        clk_i       => top_sb_0_FIC_0_CLK,
        rstn_i      => top_sb_0_INIT_DONE,
        wb_dat_i    => WB2AHBL_0_data_o,
        wb_ack_i    => WB2AHBL_0_ack_o,
        wb_err_i    => WB2AHBL_0_err_o,
        uart0_rxd_i => UART_RX,
        -- Outputs
        wb_tag_o    => OPEN,
        wb_adr_o    => neorv32_ProcessorTop_Minimal_0_wb_adr_o,
        wb_dat_o    => neorv32_ProcessorTop_Minimal_0_wb_dat_o,
        wb_we_o     => neorv32_ProcessorTop_Minimal_0_wb_we_o,
        wb_sel_o    => neorv32_ProcessorTop_Minimal_0_wb_sel_o,
        wb_stb_o    => neorv32_ProcessorTop_Minimal_0_wb_stb_o,
        wb_cyc_o    => neorv32_ProcessorTop_Minimal_0_wb_cyc_o,
        uart0_txd_o => UART_TX_net_0,
        gpio_o      => gpio_o_net_0 
        );
-- OR2_0
OR2_0 : OR2
    port map( 
        -- Inputs
        A => top_sb_0_HPMS_FIC_0_USER_MASTER_HRESP_M01to1(1),
        B => top_sb_0_HPMS_FIC_0_USER_MASTER_HRESP_M00to0(0),
        -- Outputs
        Y => OR2_0_Y 
        );
-- top_sb_0
top_sb_0 : top_sb
    port map( 
        -- Inputs
        FAB_RESET_N                         => VCC_net, -- tied to '1' from definition
        HPMS_FIC_0_USER_MASTER_HADDR_M0     => WB2AHBL_0_haddr,
        HPMS_FIC_0_USER_MASTER_HTRANS_M0    => WB2AHBL_0_htrans,
        HPMS_FIC_0_USER_MASTER_HWRITE_M0    => WB2AHBL_0_hwrite,
        HPMS_FIC_0_USER_MASTER_HSIZE_M0     => WB2AHBL_0_hsize,
        HPMS_FIC_0_USER_MASTER_HBURST_M0    => WB2AHBL_0_hburst,
        HPMS_FIC_0_USER_MASTER_HPROT_M0     => HPMS_FIC_0_USER_MASTER_HPROT_M0_const_net_0,
        HPMS_FIC_0_USER_MASTER_HWDATA_M0    => WB2AHBL_0_hwdata,
        HPMS_FIC_0_USER_MASTER_HMASTLOCK_M0 => top_sb_0_FIC_0_CLK,
        DEVRST_N                            => DEVRST_N,
        -- Outputs
        POWER_ON_RESET_N                    => OPEN,
        INIT_DONE                           => top_sb_0_INIT_DONE,
        FIC_0_CLK                           => top_sb_0_FIC_0_CLK,
        FIC_0_LOCK                          => OPEN,
        HPMS_READY                          => OPEN,
        HPMS_FIC_0_USER_MASTER_HRDATA_M0    => top_sb_0_HPMS_FIC_0_USER_MASTER_HRDATA_M0,
        HPMS_FIC_0_USER_MASTER_HREADY_M0    => top_sb_0_HPMS_FIC_0_USER_MASTER_HREADY_M0,
        HPMS_FIC_0_USER_MASTER_HRESP_M0     => HPMS_FIC_0_USER_MASTER_HRESP_M0_net_0,
        COMM_BLK_INT                        => OPEN,
        HPMS_INT_M2F                        => OPEN 
        );
-- WB2AHBL_0
WB2AHBL_0 : WB2AHBL
    port map( 
        -- Inputs
        hclk    => top_sb_0_FIC_0_CLK,
        hresetn => top_sb_0_INIT_DONE,
        hrdata  => top_sb_0_HPMS_FIC_0_USER_MASTER_HRDATA_M0,
        hresp   => OR2_0_Y,
        hready  => top_sb_0_HPMS_FIC_0_USER_MASTER_HREADY_M0,
        data_i  => neorv32_ProcessorTop_Minimal_0_wb_dat_o,
        addr_i  => neorv32_ProcessorTop_Minimal_0_wb_adr_o,
        cyc_i   => neorv32_ProcessorTop_Minimal_0_wb_cyc_o,
        stb_i   => neorv32_ProcessorTop_Minimal_0_wb_stb_o,
        sel_i   => neorv32_ProcessorTop_Minimal_0_wb_sel_o,
        we_i    => neorv32_ProcessorTop_Minimal_0_wb_we_o,
        -- Outputs
        haddr   => WB2AHBL_0_haddr,
        hwrite  => WB2AHBL_0_hwrite,
        hsize   => WB2AHBL_0_hsize,
        hburst  => WB2AHBL_0_hburst,
        hwdata  => WB2AHBL_0_hwdata,
        htrans  => WB2AHBL_0_htrans,
        data_o  => WB2AHBL_0_data_o,
        ack_o   => WB2AHBL_0_ack_o,
        err_o   => WB2AHBL_0_err_o 
        );

end RTL;
