------------------------------------------------------------------------------
--           
-- COMPONENT	WB2AHBL
--
------------------------------------------------------------------------------
-- Brief		Bridge to convert Wishbone access into AHBLite access
--              32/16/8bits & NO Bursts & little or big endian
--
-- Called components
--				none
--				
------------------------------------------------------------------------------
-- Author 		Guillaume Trannoy
-- Date 	    07 June 2021
-- Version   	v1.02
------------------------------------------------------------------------------
-- Last changes 
--              07/06/21    v1.02   GT  Cleanup
--              04/06/21    v1.01   GT  Handle ganularity
--         		02/06/21    v1.00   GT  First version
--
--
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WB2AHBL is
    generic( 
        AWIDTH     : integer := 32 ;
        DWIDTH     : integer := 32
    );
    port (
        -- Global
        hclk           : in  std_logic;
        hresetn        : in  std_logic;
        
        -- AHB
        hrdata         : in  std_logic_vector(DWIDTH-1 downto 0);
        hresp          : in  std_logic;
        hready         : in  std_logic;
        haddr          : out std_logic_vector(AWIDTH-1 downto 0);
        hwrite         : out std_logic;
        hsize          : out std_logic_vector(2 downto 0);
        hburst         : out std_logic_vector(2 downto 0);
        hwdata         : out std_logic_vector(DWIDTH-1 downto 0);
        htrans         : out std_logic_vector(1 downto 0);
        
        -- Wishbone
        data_o          : out std_logic_vector(DWIDTH-1 downto 0);
        ack_o           : out std_logic;
        err_o           : out std_logic;

        data_i          : in  std_logic_vector(DWIDTH-1 downto 0);
        addr_i          : in  std_logic_vector(AWIDTH-1 downto 0);
        cyc_i           : in  std_logic;
        stb_i           : in  std_logic;
        sel_i           : in  std_logic_vector(3 downto 0);
        we_i            : in  std_logic
    );
end entity WB2AHBL;

architecture rtl of WB2AHBL is
--------------------------------------------------------------
-- Constant declarations

    -- Address
    constant c_IDLE     : std_logic_vector(1 downto 0) := "00";
    constant c_BUSY     : std_logic_vector(1 downto 0) := "01";
    constant c_NONSEQ   : std_logic_vector(1 downto 0) := "10";
    constant c_SEQ      : std_logic_vector(1 downto 0) := "11";
    
--------------------------------------------------------------------------------
-- Function declarations
--------------------------------------------------------------------------------
    function transgranularity(signal sel : std_logic_vector(3 downto 0)) return std_logic_vector is
        variable size : std_logic_vector(2 downto 0);
    begin
        case sel is
            when "1111" => size := "010";            -- 32bits
            when "0011" | "1100" => size := "001";   -- 16bits
            when "0001" | "0010" | "0100" | "1000" => size := "000"; -- 8bits
            when others => size := "010";            -- 32bits
        end case;
        return size;
    end transgranularity;

--------------------------------------------------------------------------------
-- Signal declarations
--------------------------------------------------------------------------------
    signal stb_i_dl     : std_logic;
    
--------------------------------------------------------------------------------
-- Main body of code
--------------------------------------------------------------------------------
begin

    -- ASSIGN STATEMENTS
    data_o  <= hrdata ;
    ack_o   <= hready AND stb_i AND stb_i_dl; -- After htrans if slave is ready
    -- haddr is necessarily aligned accordingly to bus size
    haddr   <= addr_i(AWIDTH-1 downto 2) & "00" when (transgranularity(sel_i) = "010") else  -- 32bits
               addr_i(AWIDTH-1 downto 1) & '0'  when (transgranularity(sel_i) = "001") else  -- 16bits
               addr_i;                                                                       -- 8bits
    hwdata  <= data_i;
    hsize   <= transgranularity(sel_i); --Adjust size
    hburst  <= "000"; -- No burst
    hwrite  <= we_i;
    -- htrans is allowed for one cycle at begining of stb_i when slave is ready
    htrans  <= c_NONSEQ when ((hready = '1') AND (stb_i = '1') AND (stb_i_dl = '0')) else
               c_IDLE;
    err_o   <= hresp;

    
    -- Delayed stb_i
    p_del: process( hclk )
    begin
    if( hclk'event AND hclk = '1' ) then
        if (hresetn = '0') then
            stb_i_dl <= '0';
		else
            stb_i_dl <= stb_i;
        end if;
    end if;
    end process p_del;
    
    
end rtl;
--================================= End ===================================--
