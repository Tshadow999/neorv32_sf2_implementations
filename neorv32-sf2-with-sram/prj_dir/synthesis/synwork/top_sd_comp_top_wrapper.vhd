--
-- Synopsys
-- Vhdl wrapper for top level design, written on Wed Oct 23 16:26:16 2024
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_top_sd is
   port (
      DEVRST_N : in std_logic;
      UART_RX : in std_logic;
      UART_TX : out std_logic;
      led0 : out std_logic;
      led1 : out std_logic;
      led2 : out std_logic;
      led3 : out std_logic;
      led4 : out std_logic;
      led5 : out std_logic;
      led6 : out std_logic;
      led7 : out std_logic
   );
end wrapper_for_top_sd;

architecture rtl of wrapper_for_top_sd is

component top_sd
 port (
   DEVRST_N : in std_logic;
   UART_RX : in std_logic;
   UART_TX : out std_logic;
   led0 : out std_logic;
   led1 : out std_logic;
   led2 : out std_logic;
   led3 : out std_logic;
   led4 : out std_logic;
   led5 : out std_logic;
   led6 : out std_logic;
   led7 : out std_logic
 );
end component;

signal tmp_DEVRST_N : std_logic;
signal tmp_UART_RX : std_logic;
signal tmp_UART_TX : std_logic;
signal tmp_led0 : std_logic;
signal tmp_led1 : std_logic;
signal tmp_led2 : std_logic;
signal tmp_led3 : std_logic;
signal tmp_led4 : std_logic;
signal tmp_led5 : std_logic;
signal tmp_led6 : std_logic;
signal tmp_led7 : std_logic;

begin

tmp_DEVRST_N <= DEVRST_N;

tmp_UART_RX <= UART_RX;

UART_TX <= tmp_UART_TX;

led0 <= tmp_led0;

led1 <= tmp_led1;

led2 <= tmp_led2;

led3 <= tmp_led3;

led4 <= tmp_led4;

led5 <= tmp_led5;

led6 <= tmp_led6;

led7 <= tmp_led7;



u1:   top_sd port map (
		DEVRST_N => tmp_DEVRST_N,
		UART_RX => tmp_UART_RX,
		UART_TX => tmp_UART_TX,
		led0 => tmp_led0,
		led1 => tmp_led1,
		led2 => tmp_led2,
		led3 => tmp_led3,
		led4 => tmp_led4,
		led5 => tmp_led5,
		led6 => tmp_led6,
		led7 => tmp_led7
       );
end rtl;
