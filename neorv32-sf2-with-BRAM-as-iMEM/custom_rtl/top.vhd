library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

entity top_wrapper is
    port(
        -- Global control --
        clk_i  : in  std_logic;                              -- global clock, rising edge
        rstn_i : in  std_logic;                              -- global reset, low-active, async
        -- ahb-lite host interface --
        ahb_haddr_o    : out std_ulogic_vector(31 downto 0); -- address
        ahb_hwdata_o   : out std_ulogic_vector(31 downto 0); -- write data
        ahb_hwrite_o   : out std_ulogic;                     -- read/write
        ahb_hsize_o    : out std_ulogic_vector(2 downto 0);  -- transfer size
        ahb_hburst_o   : out std_ulogic_vector(2 downto 0);  -- burst type
        ahb_hprot_o    : out std_ulogic_vector(3 downto 0);  -- protection control
        ahb_htrans_o   : out std_ulogic_vector(1 downto 0);  -- transfer type
        ahb_hready_i   : in  std_ulogic;                     -- transfer completed
        ahb_hresp_i_1  : in  std_ulogic;                     -- transfer response
        ahb_hresp_i_2  : in  std_ulogic;                     -- transfer response
        ahb_hrdata_i   : in  std_ulogic_vector(31 downto 0); -- read data
        -- GPIO (available if IO_GPIO_NUM > 0) --
        gpio_o         : out std_ulogic_vector(7 downto 0); -- parallel output
        -- primary UART0 (available if IO_UART0_EN = true) --
        uart0_txd_o    : out std_ulogic;                     -- UART0 send data
        uart0_rxd_i    : in  std_ulogic                      -- UART0 receive data
    );
end entity;

architecture rtl of top_wrapper is
    signal xbus_adr    : std_ulogic_vector(31 downto 0); -- address
    signal xbus_dat_io : std_ulogic_vector(31 downto 0); -- write data
    signal xbus_dat_oi : std_ulogic_vector(31 downto 0); -- read data
    signal xbus_tag    : std_ulogic_vector(2 downto 0);  -- access tag
    signal xbus_we     : std_ulogic;                     -- read/write
    signal xbus_sel    : std_ulogic_vector(3 downto 0);  -- byte enable
    signal xbus_stb    : std_ulogic;                     -- strobe
    signal xbus_cyc    : std_ulogic;                     -- valid cycle
    signal xbus_ack    : std_ulogic;                     -- transfer acknowledge
    signal xbus_err    : std_ulogic;                     -- transfer error

    signal ahb_hresp   : std_ulogic;
begin

    ahb_hresp <= ahb_hresp_i_1 or ahb_hresp_i_2;

    neorv32_processor: entity work.neorv32_ProcessorTop_Minimal
    port map (
        -- Global control --
        clk_i       => clk_i,
        rstn_i      => rstn_i,
        -- External bus interface (available if XBUS_EN = true) --
        xbus_adr_o  => xbus_adr,
        xbus_dat_o  => xbus_dat_oi,
        xbus_tag_o  => xbus_tag,
        xbus_we_o   => xbus_we,
        xbus_sel_o  => xbus_sel,
        xbus_stb_o  => xbus_stb,
        xbus_cyc_o  => xbus_cyc,
        xbus_dat_i  => xbus_dat_io,
        xbus_ack_i  => xbus_ack,
        xbus_err_i  => xbus_err,
        -- GPIO (available if IO_GPIO_NUM > 0) --
        gpio_o      => gpio_o,
        -- primary UART0 (available if IO_UART0_EN = true) --
        uart0_txd_o => uart0_txd_o,
        uart0_rxd_i => uart0_rxd_i
    );

    xbus_bridge: entity work.xbus2ahblite_bridge
    port map (
        -- global control --
        clk_i        => clk_i,
        rstn_i       => rstn_i,
        -- xbus device interface --
        xbus_adr_i   => xbus_adr,
        xbus_dat_i   => xbus_dat_oi,
        xbus_tag_i   => xbus_tag,
        xbus_we_i    => xbus_we,
        xbus_sel_i   => xbus_sel,
        xbus_stb_i   => xbus_stb,
        xbus_cyc_i   => xbus_cyc,
        xbus_ack_o   => xbus_ack,
        xbus_err_o   => xbus_err,
        xbus_dat_o   => xbus_dat_io,
        -- ahb-lite host interface --
        ahb_haddr_o  => ahb_haddr_o,
        ahb_hwdata_o => ahb_hwdata_o,
        ahb_hwrite_o => ahb_hwrite_o,
        ahb_hsize_o  => ahb_hsize_o,
        ahb_hburst_o => ahb_hburst_o,
        ahb_hprot_o  => ahb_hprot_o,
        ahb_htrans_o => ahb_htrans_o,
        ahb_hready_i => ahb_hready_i,
        ahb_hresp_i  => ahb_hresp,
        ahb_hrdata_i => ahb_hrdata_i
    );

end architecture;
