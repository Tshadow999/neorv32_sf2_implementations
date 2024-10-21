----------------------------------------------------------------------------------------------
--
-- VHDL file generated by X-HDL - Revision 3.2.52  Mar. 28, 2005 
-- Mon Feb 22 12:32:01 2016
--
--      Input file         : //idm/IPEngg/Technical/maheswark/CoreAHBLSRAM/RTL/trunk/rtl/vlog/core/AHBLSramIf.v
--      Design name        : COREAHBLSRAM_C0_COREAHBLSRAM_C0_0_AHBLSramIf
--      Author             : 
--      Company            : 
--
--      Description        : 
--
--
----------------------------------------------------------------------------------------------
--
library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_arith.all;
use     ieee.std_logic_unsigned.all;
use     ieee.std_logic_misc.all;


ENTITY COREAHBLSRAM_C0_COREAHBLSRAM_C0_0_AHBLSramIf IS
   GENERIC (
      SYNC_RESET                     :  integer := 0;    
      AHB_DWIDTH                     :  integer := 32;    
      AHB_AWIDTH                     :  integer := 32;    
      RESP_OKAY                      :  std_logic_vector(1 DOWNTO 0) := "00";    
      RESP_ERROR                     :  std_logic_vector(1 DOWNTO 0) := "01";    
      TRN_IDLE                       :  std_logic_vector(1 DOWNTO 0) := "00";    
      TRN_BUSY                       :  std_logic_vector(1 DOWNTO 0) := "01";    
      TRN_SEQ                        :  std_logic_vector(1 DOWNTO 0) := "11";    
      TRN_NONSEQ                     :  std_logic_vector(1 DOWNTO 0) := "10");    
   PORT (
      HCLK                    : IN std_logic;   
      HRESETN                 : IN std_logic;   
      HSEL                    : IN std_logic;   
      HTRANS                  : IN std_logic_vector(1 DOWNTO 0);   
      HBURST                  : IN std_logic_vector(2 DOWNTO 0);   
      HWRITE                  : IN std_logic;   
      HSIZE                   : IN std_logic_vector(2 DOWNTO 0);   
      HADDR                   : IN std_logic_vector(19 DOWNTO 0);   
      HWDATA                  : IN std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
      HREADYIN                : IN std_logic;   
      sramahb_ack             : IN std_logic;   
      sramahb_rdata           : IN std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
      HRESP                   : OUT std_logic_vector(1 DOWNTO 0);   
      HREADYOUT               : OUT std_logic;   
      HRDATA                  : OUT std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
      ahbsram_req             : OUT std_logic;   
      ahbsram_write           : OUT std_logic;   
      ahbsram_wdata           : OUT std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0);   
      ahbsram_wdata_usram     : OUT std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
      ahbsram_size            : OUT std_logic_vector(2 DOWNTO 0);   
      ahbsram_addr            : OUT std_logic_vector(19 DOWNTO 0);   
      BUSY                    : IN std_logic);   
END COREAHBLSRAM_C0_COREAHBLSRAM_C0_0_AHBLSramIf;

ARCHITECTURE translated OF COREAHBLSRAM_C0_COREAHBLSRAM_C0_0_AHBLSramIf IS


   CONSTANT  IDLE                  :  std_logic_vector(1 DOWNTO 0) := "00";    
   CONSTANT  AHB_WR                :  std_logic_vector(1 DOWNTO 0) := "01";    
   CONSTANT  AHB_RD                :  std_logic_vector(1 DOWNTO 0) := "10";    
   CONSTANT  SINGLE                :  std_logic_vector(2 DOWNTO 0) := "000";    
   CONSTANT  INCR                  :  std_logic_vector(2 DOWNTO 0) := "001";    
   CONSTANT  WRAP4                 :  std_logic_vector(2 DOWNTO 0) := "010";    
   CONSTANT  INCR4                 :  std_logic_vector(2 DOWNTO 0) := "011";    
   CONSTANT  WRAP8                 :  std_logic_vector(2 DOWNTO 0) := "100";    
   CONSTANT  INCR8                 :  std_logic_vector(2 DOWNTO 0) := "101";    
   CONSTANT  WRAP16                :  std_logic_vector(2 DOWNTO 0) := "110";    
   CONSTANT  INCR16                :  std_logic_vector(2 DOWNTO 0) := "111";    
   
   SIGNAL HTRANS_d                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL HBURST_d                 :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HSIZE_d                  :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HADDR_d                  :  std_logic_vector(19 DOWNTO 0);   
   SIGNAL HWDATA_d                 :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
   SIGNAL HWRITE_d                 :  std_logic;   
   SIGNAL HSEL_d                   :  std_logic;   
   SIGNAL HREADYIN_d               :  std_logic;   
   SIGNAL ahbcurr_state            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ahbnext_state            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL latchahbcmd              :  std_logic;   
   SIGNAL ahbsram_req_int          :  std_logic;   
   SIGNAL ahbsram_req_d1           :  std_logic;   
   SIGNAL HWDATA_cal               :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
   SIGNAL ahbsram_wdata_usram_d    :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
   SIGNAL burst_count              :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL burst_count_reg          :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL count                    :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL sramahb_ack_cnt          :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL validahbcmd              :  std_logic;   
   SIGNAL aresetn                  :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   
   SIGNAL temp_xhdl10              :  std_logic;   
   SIGNAL temp_xhdl11              :  std_logic;   
   SIGNAL temp_xhdl12              :  std_logic;   
   SIGNAL temp_xhdl13              :  std_logic_vector(19 DOWNTO 0);   
   SIGNAL temp_xhdl14              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HREADYOUT_xhdl1          :  std_logic;   
   SIGNAL HRESP_xhdl2              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL HRDATA_xhdl3             :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
   SIGNAL ahbsram_req_xhdl4        :  std_logic;   
   SIGNAL ahbsram_write_xhdl5      :  std_logic;   
   SIGNAL ahbsram_wdata_usram_xhdl6:  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
   SIGNAL ahbsram_wdata_xhdl7      :  std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0);   
   SIGNAL ahbsram_size_xhdl8       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ahbsram_addr_xhdl9       :  std_logic_vector(19 DOWNTO 0);   

BEGIN
   HREADYOUT <= HREADYOUT_xhdl1;
   HRESP <= HRESP_xhdl2;
   HRDATA <= HRDATA_xhdl3;
   ahbsram_req <= ahbsram_req_xhdl4;
   ahbsram_write <= ahbsram_write_xhdl5;
   ahbsram_wdata_usram <= ahbsram_wdata_usram_xhdl6;
   ahbsram_wdata <= ahbsram_wdata_xhdl7;
   ahbsram_size <= ahbsram_size_xhdl8;
   ahbsram_addr <= ahbsram_addr_xhdl9;
   temp_xhdl10 <= '1' WHEN (SYNC_RESET = 1) ELSE HRESETN;
   aresetn <= temp_xhdl10 ;
   temp_xhdl11 <= HRESETN WHEN (SYNC_RESET = 1) ELSE '1';
   sresetn <= temp_xhdl11 ;
   --validahbcmd <= (HREADYIN AND HSEL) AND CONV_STD_LOGIC(HTRANS = TRN_NONSEQ) ;
   HRESP_xhdl2 <= RESP_OKAY ;

   PROCESS (HSEL, HWDATA, HTRANS,HREADYIN)
   BEGIN
      HWDATA_cal <= HWDATA;    
   END PROCESS;

   PROCESS (HCLK,aresetn)
   BEGIN
      IF (aresetn = '0') THEN
         HADDR_d <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';    
         HWDATA_d <= (OTHERS => '0');    
         HTRANS_d <= "00";    
         HSIZE_d <= "000";    
         HBURST_d <= "000";    
         HWRITE_d <= '0';    
         HSEL_d <= '0';    
         HREADYIN_d <= '0';    
     ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         IF(sresetn = '0') THEN
            HADDR_d <= (OTHERS => '0');    
            HWDATA_d <= (OTHERS => '0');    
            HTRANS_d <= "00";    
            HSIZE_d <= "000";    
            HBURST_d <= "000";    
            HWRITE_d <= '0';    
            HSEL_d <= '0';    
            HREADYIN_d <= '0'; 
         ELSE 
            IF ((HREADYIN = '1' AND HSEL = '1') AND HREADYOUT_xhdl1 = '1') THEN
               HADDR_d <= HADDR;    
               HTRANS_d <= HTRANS;    
               HSIZE_d <= HSIZE;    
               HBURST_d <= HBURST;    
               HWRITE_d <= HWRITE;    
               HWDATA_d <= HWDATA_cal;    
               HSEL_d <= HSEL;    
               HREADYIN_d <= HREADYIN;    
            END IF;
         END IF;
      END IF;
   END PROCESS;
  

   PROCESS (HCLK, aresetn)
   BEGIN
      IF (aresetn = '0') THEN
         ahbcurr_state <= IDLE;    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
          IF (sresetn = '0') THEN
              ahbcurr_state <= IDLE;    
          ELSE 
              ahbcurr_state <= ahbnext_state;    
          END IF;
      END IF;
   END PROCESS;

   PROCESS (HWRITE, sramahb_ack, count, ahbnext_state, HBURST, HREADYIN, HREADYOUT_xhdl1, HWDATA_cal, ahbcurr_state, HSIZE, HCLK, burst_count_reg, HSEL, HTRANS, HADDR)
   BEGIN
      latchahbcmd <= '0';    
      ahbsram_req_int <= '0';    
      ahbnext_state <= ahbcurr_state;    
      CASE ahbcurr_state IS
         WHEN IDLE =>
                  IF ((HREADYIN = '1' AND HSEL = '1') AND ((HTRANS = TRN_NONSEQ) OR HTRANS = TRN_SEQ)) THEN
                     latchahbcmd <= '1';    
                     IF (HWRITE = '1') THEN
                        ahbnext_state <= AHB_WR;    
                     ELSE
                        ahbnext_state <= AHB_RD;    
                     END IF;
                  ELSE
                     ahbnext_state <= IDLE;    
                  END IF;
         WHEN AHB_WR =>
                  latchahbcmd <= '0';    
                  ahbsram_req_int <= '1';    
                  IF (sramahb_ack = '1') THEN
                     IF (count = burst_count_reg) THEN
                        ahbnext_state <= IDLE;    
                     ELSE
                        ahbsram_req_int <= '0';    
                     END IF;
                  END IF;
         WHEN AHB_RD =>
                  latchahbcmd <= '0';    
                  ahbsram_req_int <= '1';    
                  IF (sramahb_ack = '1') THEN
                     ahbnext_state <= IDLE;    
                  END IF;
         WHEN OTHERS  =>
                  ahbnext_state <= IDLE;    
         
      END CASE;
   END PROCESS;

   PROCESS (HREADYOUT_xhdl1, burst_count_reg, HSEL, HTRANS, HBURST, HREADYIN)
   BEGIN
      burst_count <= burst_count_reg;    
      IF (((HSEL = '1' AND HTRANS = TRN_NONSEQ) AND HREADYIN = '1') AND HREADYOUT_xhdl1 = '1') THEN
         CASE HBURST IS
            WHEN SINGLE =>
                     burst_count <= "00001";    
            WHEN INCR4 =>
                     burst_count <= "00100";    
            WHEN WRAP4 =>
                     burst_count <= "00100";    
            WHEN INCR8 => 
                     burst_count <= "01000";    
            WHEN WRAP8 => 
                     burst_count <= "01000";    
            WHEN INCR16 =>
                     burst_count <= "10000";    
            WHEN WRAP16 =>
                     burst_count <= "10000";    
            WHEN OTHERS  =>
                     burst_count <= "00001";    
            
         END CASE;
      END IF;
   END PROCESS;


   PROCESS (HCLK,aresetn)
   BEGIN
      IF (aresetn = '0') THEN
         burst_count_reg <= "00000";    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
        IF (sresetn = '0') THEN
          burst_count_reg <= "00000";    
        ELSE 
         burst_count_reg <= burst_count;    
        END IF;
      END IF;
   END PROCESS;

   PROCESS (HCLK, aresetn)
   BEGIN
      IF (aresetn = '0') THEN
         count <= "00000";    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         IF (sresetn = '0') THEN
           count <= "00000";    
         ELSE 
           IF (count = burst_count_reg) THEN
              count <= "00000";    
           ELSE
              IF (ahbsram_req_xhdl4 = '1') THEN
                 count <= count + "00001";    
              ELSE
                 count <= count;    
              END IF;
           END IF;
         END IF;
      END IF;
   END PROCESS;

   HREADYOUT_xhdl1 <= NOT ahbsram_req_int ;
   temp_xhdl12 <= HWRITE_d WHEN ahbsram_req_xhdl4 = '1' ELSE '0';
   ahbsram_write_xhdl5 <= temp_xhdl12 ;
   ahbsram_wdata_xhdl7 <= HWDATA ;
   temp_xhdl13 <= HADDR_d WHEN ahbsram_req_xhdl4 = '1' ELSE HADDR_d;
   ahbsram_addr_xhdl9 <= temp_xhdl13 ;
   temp_xhdl14 <= HSIZE_d WHEN ahbsram_req_xhdl4 = '1' ELSE HSIZE_d;
   ahbsram_size_xhdl8 <= temp_xhdl14 ;

   PROCESS (HCLK, aresetn)
   BEGIN
      IF (aresetn = '0' ) THEN
         ahbsram_req_d1 <= '0';    
      ELSIF(HCLK'EVENT AND HCLK='1') THEN
        IF (sresetn = '0') THEN
          ahbsram_req_d1 <= '0';    
        ELSE 
          ahbsram_req_d1 <= ahbsram_req_int;    
        END IF;
      END IF;
   END PROCESS;
   
   ahbsram_req_xhdl4 <= ahbsram_req_int AND NOT ahbsram_req_d1 ;

   
   PROCESS (HSIZE_d, ahbsram_req_int, sresetn, aresetn, ahbsram_addr_xhdl9, ahbsram_req_xhdl4, HCLK, ahbsram_wdata_usram_d, ahbsram_req_d1, burst_count_reg, burst_count, ahbsram_size_xhdl8, count, HADDR_d, ahbsram_wdata_xhdl7, HWDATA, HWRITE_d)
   BEGIN
      IF (ahbsram_size_xhdl8 = "010") THEN
         ahbsram_wdata_usram_xhdl6 <= ahbsram_wdata_xhdl7;    
      ELSE
         IF (ahbsram_size_xhdl8 = "001") THEN
            IF (ahbsram_addr_xhdl9(1 DOWNTO 0) = "00") THEN
               ahbsram_wdata_usram_xhdl6 <= ahbsram_wdata_usram_d(31 DOWNTO 16) & ahbsram_wdata_xhdl7(15 DOWNTO 0);    
            ELSE
               ahbsram_wdata_usram_xhdl6 <= ahbsram_wdata_xhdl7(31 DOWNTO 16) & ahbsram_wdata_usram_d(15 DOWNTO 0);    
            END IF;
         ELSE
            IF (ahbsram_size_xhdl8 = "000") THEN
               IF (ahbsram_addr_xhdl9(1 DOWNTO 0) = "00") THEN
                  ahbsram_wdata_usram_xhdl6 <= ahbsram_wdata_usram_d(31 DOWNTO 8) & ahbsram_wdata_xhdl7(7 DOWNTO 0);    
               ELSE
                  IF (ahbsram_addr_xhdl9(1 DOWNTO 0) = "01") THEN
                     ahbsram_wdata_usram_xhdl6 <= ahbsram_wdata_usram_d(31 DOWNTO 16) & ahbsram_wdata_xhdl7(15 DOWNTO 8) & ahbsram_wdata_usram_d(7 DOWNTO 0);    
                  ELSE
                     IF (ahbsram_addr_xhdl9(1 DOWNTO 0) = "10") THEN
                        ahbsram_wdata_usram_xhdl6 <= ahbsram_wdata_usram_d(31 DOWNTO 24) & ahbsram_wdata_xhdl7(23 DOWNTO 16) & ahbsram_wdata_usram_d(15 DOWNTO 0);    
                     ELSE
                        ahbsram_wdata_usram_xhdl6 <= ahbsram_wdata_xhdl7(31 DOWNTO 24) & ahbsram_wdata_usram_d(23 DOWNTO 0);    
                     END IF;
                  END IF;
               END IF;
            ELSE
               ahbsram_wdata_usram_xhdl6 <= ahbsram_wdata_usram_d;    
            END IF;
         END IF;
      END IF;
   END PROCESS;

   PROCESS (HCLK, aresetn)
   BEGIN
      IF (aresetn = '0') THEN
         ahbsram_wdata_usram_d <= (OTHERS => '0');    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         IF (sresetn = '0') THEN
            ahbsram_wdata_usram_d <= (OTHERS => '0');    
         ELSE
           IF (HREADYOUT_xhdl1 = '1' AND HREADYIN = '1') THEN
              ahbsram_wdata_usram_d <= ahbsram_wdata_usram_xhdl6;    
           END IF;
        END IF;
      END IF;
   END PROCESS;

   PROCESS (HREADYOUT_xhdl1, ahbsram_wdata_usram_xhdl6, sresetn, aresetn, sramahb_rdata, HCLK, HREADYIN)
   BEGIN
      IF ((HREADYOUT_xhdl1 AND HREADYIN) = '1') THEN
         HRDATA_xhdl3 <= sramahb_rdata;    
      ELSE
         HRDATA_xhdl3 <= sramahb_rdata;    
      END IF;
   END PROCESS;

END translated;
