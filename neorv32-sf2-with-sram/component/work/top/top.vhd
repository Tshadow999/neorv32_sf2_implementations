----------------------------------------------------------------------
-- Created by SmartDesign Mon Oct 21 14:43:15 2024
-- Version: 2023.1 2023.1.0.6
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
-- AND2
component AND2
    -- Port list
    port(
        -- Inputs
        A : in  std_logic;
        B : in  std_logic;
        -- Outputs
        Y : out std_logic
        );
end component;
-- FCCC_C0
component FCCC_C0
    -- Port list
    port(
        -- Inputs
        RCOSC_25_50MHZ : in  std_logic;
        -- Outputs
        GL0            : out std_logic;
        LOCK           : out std_logic
        );
end component;
-- neorv32_ProcessorTop_Minimal
component neorv32_ProcessorTop_Minimal
    -- Port list
    port(
        -- Inputs
        clk_i       : in  std_logic;
        rstn_i      : in  std_logic;
        uart0_rxd_i : in  std_logic;
        -- Outputs
        gpio_o      : out std_logic_vector(7 downto 0);
        uart0_txd_o : out std_logic
        );
end component;
-- OSC_C0
component OSC_C0
    -- Port list
    port(
        -- Outputs
        RCOSC_25_50MHZ_CCC : out std_logic
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
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AND2_0_Y                                           : std_logic;
signal FCCC_C0_0_GL0                                      : std_logic;
signal FCCC_C0_0_LOCK                                     : std_logic;
signal led0_net_0                                         : std_logic_vector(0 to 0);
signal led1_net_0                                         : std_logic_vector(1 to 1);
signal led2_net_0                                         : std_logic_vector(2 to 2);
signal led3_net_0                                         : std_logic_vector(3 to 3);
signal led4_net_0                                         : std_logic_vector(4 to 4);
signal led5_net_0                                         : std_logic_vector(5 to 5);
signal led6_net_0                                         : std_logic_vector(6 to 6);
signal led7_net_0                                         : std_logic_vector(7 to 7);
signal OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : std_logic;
signal SYSRESET_0_POWER_ON_RESET_N                        : std_logic;
signal UART_TX_net_0                                      : std_logic;
signal led0_net_1                                         : std_logic;
signal led1_net_1                                         : std_logic;
signal led2_net_1                                         : std_logic;
signal led3_net_1                                         : std_logic;
signal led4_net_1                                         : std_logic;
signal led5_net_1                                         : std_logic;
signal led6_net_1                                         : std_logic;
signal led7_net_1                                         : std_logic;
signal UART_TX_net_1                                      : std_logic;
signal gpio_o_net_0                                       : std_logic_vector(7 downto 0);

begin
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
 led0_net_0(0) <= gpio_o_net_0(0);
 led1_net_0(1) <= gpio_o_net_0(1);
 led2_net_0(2) <= gpio_o_net_0(2);
 led3_net_0(3) <= gpio_o_net_0(3);
 led4_net_0(4) <= gpio_o_net_0(4);
 led5_net_0(5) <= gpio_o_net_0(5);
 led6_net_0(6) <= gpio_o_net_0(6);
 led7_net_0(7) <= gpio_o_net_0(7);
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- AND2_0
AND2_0 : AND2
    port map( 
        -- Inputs
        A => FCCC_C0_0_LOCK,
        B => SYSRESET_0_POWER_ON_RESET_N,
        -- Outputs
        Y => AND2_0_Y 
        );
-- FCCC_C0_0
FCCC_C0_0 : FCCC_C0
    port map( 
        -- Inputs
        RCOSC_25_50MHZ => OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC,
        -- Outputs
        GL0            => FCCC_C0_0_GL0,
        LOCK           => FCCC_C0_0_LOCK 
        );
-- neorv32_ProcessorTop_Minimal_0
neorv32_ProcessorTop_Minimal_0 : neorv32_ProcessorTop_Minimal
    port map( 
        -- Inputs
        clk_i       => FCCC_C0_0_GL0,
        rstn_i      => AND2_0_Y,
        uart0_rxd_i => UART_RX,
        -- Outputs
        gpio_o      => gpio_o_net_0,
        uart0_txd_o => UART_TX_net_0 
        );
-- OSC_C0_0
OSC_C0_0 : OSC_C0
    port map( 
        -- Outputs
        RCOSC_25_50MHZ_CCC => OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC 
        );
-- SYSRESET_0
SYSRESET_0 : SYSRESET
    port map( 
        -- Inputs
        DEVRST_N         => DEVRST_N,
        -- Outputs
        POWER_ON_RESET_N => SYSRESET_0_POWER_ON_RESET_N 
        );

end RTL;
