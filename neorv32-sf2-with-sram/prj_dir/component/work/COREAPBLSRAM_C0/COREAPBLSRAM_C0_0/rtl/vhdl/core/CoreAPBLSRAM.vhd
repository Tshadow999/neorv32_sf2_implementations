-- ********************************************************************/
-- Actel Corporation Proprietary and Confidential
--  Copyright 2011 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description:  CoreAPBLSRAM
--               Provides APB interface to embedded Large SRAM.
--
--
-- Revision Information:
-- Date     Description
--
-- SVN Revision Information:
-- SVN $Revision: 4805 $
-- SVN $Date: 2008-11-27 17:48:48 +0530 (Thu, 27 Nov 2008) $
--
-- Resolved SARs
-- SAR      Date     Who   Description
--
-- Notes:
--
-- ********************************************************************/
library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_arith.all;
use     ieee.std_logic_unsigned.all;
use     ieee.std_logic_misc.all;
use     work.coreapblsram_pkg.all;

ENTITY COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_COREAPBLSRAM IS
   GENERIC (
      FAMILY                         :  integer := 19;    
      APB_DWIDTH                     :  integer := 32;    
      SEL_SRAM_TYPE                  :  integer := 1;    
      USRAM_NUM_LOCATIONS_DWIDTH     :  integer := 128;    
      LSRAM_NUM_LOCATIONS_DWIDTH     :  integer := 2048);    
   PORT (
------------------------------------------------------------------------
-- I/Os
------------------------------------------------------------------------
-- inputs

      PCLK                    : IN std_logic;   
      PRESETN                 : IN std_logic;   
      PSEL                    : IN std_logic;   
      PENABLE                 : IN std_logic;   
      PWRITE                  : IN std_logic;   
      PADDR                   : IN std_logic_vector(19 DOWNTO 0);   
      PWDATA                  : IN std_logic_vector(APB_DWIDTH - 1 
      DOWNTO 0);   
      -- outputs

      PRDATA                  : OUT std_logic_vector(APB_DWIDTH - 1 
      DOWNTO 0);   
      PSLVERR                 : OUT std_logic;   --  APB3 sig
      PREADY                  : OUT std_logic);   --  APB3 sig
END ENTITY COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_COREAPBLSRAM;

ARCHITECTURE translated OF COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_COREAPBLSRAM IS


   -- ADDR_SCHEME
   -- 0 = word aligned
   -- 1 = sequential
   --CONSTANT  ADDR_SCHEME           :  integer := 1;    
     CONSTANT  ADDR_SCHEME    :  integer := ADDR_SCHME(APB_DWIDTH);    

   COMPONENT COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_usram_64to2304x32
   GENERIC (
      USRAM_NUM_LOCATIONS_DWIDTH32   :  integer := 64;    
      APB_DWIDTH                     :  integer := 32);    
   PORT (

-- Inputs

      writeData               : IN std_logic_vector(31 DOWNTO 0);   
      -- Output
      readData                : OUT std_logic_vector(APB_DWIDTH - 1 
      DOWNTO 0);   
      -- AhbSramIf interface
-- Inputs

      wen                     : IN std_logic;   
      ren                     : IN std_logic;   
      writeAddr               : IN std_logic_vector(17 DOWNTO 0);   
      readAddr                : IN std_logic_vector(17 DOWNTO 0);   
      clk                     : IN std_logic;   
      resetn                  : IN std_logic;   
      u_2K_BUSY_all              : OUT std_logic);   
   END COMPONENT;

   COMPONENT COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_usram_64to4608x16
   GENERIC (
      USRAM_NUM_LOCATIONS_DWIDTH16   :  integer := 64;    
      APB_DWIDTH                     :  integer := 32);    
   PORT (

-- Inputs

      writeData               : IN std_logic_vector(31 DOWNTO 0);   
      -- Output
      readData                : OUT std_logic_vector(APB_DWIDTH - 1 
      DOWNTO 0);   

-- Inputs

      wen                     : IN std_logic;   
      ren                     : IN std_logic;   
      writeAddr               : IN std_logic_vector(17 DOWNTO 0);   
      readAddr                : IN std_logic_vector(17 DOWNTO 0);   
      clk                     : IN std_logic;   
      resetn                  : IN std_logic;   
      u_4K_BUSY_all           : OUT std_logic);   
   END COMPONENT;

   COMPONENT COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_usram_128to9216x8
   GENERIC (
      USRAM_NUM_LOCATIONS_DWIDTH08   :  integer := 128;    
      APB_DWIDTH                     :  integer := 32);    
   PORT (

-- Inputs

      writeData               : IN std_logic_vector(31 DOWNTO 0);   
      -- Output
      readData                : OUT std_logic_vector(APB_DWIDTH - 1 
      DOWNTO 0);   
-- Inputs

      wen                     : IN std_logic;   
      ren                     : IN std_logic;   
      writeAddr               : IN std_logic_vector(17 DOWNTO 0);   
      readAddr                : IN std_logic_vector(17 DOWNTO 0);   
      clk                     : IN std_logic;   
      resetn                  : IN std_logic;   
      u_9K_BUSY_all           : OUT std_logic);   
   END COMPONENT;

  COMPONENT COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_lsram_1024to70656x16
   GENERIC (
      -- ---------------------------------------------------------------------
      -- Parameters
      -- ---------------------------------------------------------------------
      -- DEPTH can range from 1024 to 65536, in steps of 1024
      DEPTH                          :  integer := 1024;    
      APB_DWIDTH                     :  integer := 16);    
   PORT (
      -- ---------------------------------------------------------------------
-- Port declarations
-- ---------------------------------------------------------------------
-- AhbFabric interface
-- Inputs

      writeData               : IN std_logic_vector(APB_DWIDTH - 1 
      DOWNTO 0);   
      -- Output

      readData                : OUT std_logic_vector(APB_DWIDTH - 1 
      DOWNTO 0);   
      -- AhbSramIf interface
-- Inputs

      wen                     : IN std_logic;   
      ren                     : IN std_logic;   
      writeAddr               : IN std_logic_vector(17 DOWNTO 0);   
      readAddr                : IN std_logic_vector(17 DOWNTO 0);   
      clk                     : IN std_logic;   
      resetn                  : IN std_logic;   
      lsram_1k_BUSY_all       : OUT std_logic);   
END COMPONENT;

 
COMPONENT COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_lsram_512to35328x32
   GENERIC (
      -- ---------------------------------------------------------------------
      -- Parameters
      -- ---------------------------------------------------------------------
      -- DEPTH can range from 512 to 8192, in steps of 512
      DEPTH                          :  integer := 512;    
      APB_DWIDTH                     :  integer := 32);    
   PORT (
      -- ---------------------------------------------------------------------
-- Port declarations
-- ---------------------------------------------------------------------
-- ApbFabric interface
-- Inputs

      writeData               : IN std_logic_vector(APB_DWIDTH - 1 
      DOWNTO 0);   
      readData                : OUT std_logic_vector(APB_DWIDTH - 1 
      DOWNTO 0);   
      -- AhbSramIf interface
-- Inputs

      wen                     : IN std_logic;   
      ren                     : IN std_logic;   
      writeAddr               : IN std_logic_vector(17 DOWNTO 0);   
      readAddr                : IN std_logic_vector(17 DOWNTO 0);   
      clk                     : IN std_logic;   
      resetn                  : IN std_logic;   
      -- Output

      lsram_512_BUSY_all      : OUT std_logic);   
END COMPONENT;

COMPONENT COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_lsram_2048to141312x8
   GENERIC (
      -- ---------------------------------------------------------------------
      -- Parameters
      -- ---------------------------------------------------------------------
      -- DEPTH can range from 2048 to 141312, in steps of 2048
      DEPTH                          :  integer := 2048;    
      APB_DWIDTH                     :  integer := 8);    
   PORT (
      -- ---------------------------------------------------------------------
-- Port declarations
-- ---------------------------------------------------------------------

-- Inputs

      writeData               : IN std_logic_vector(APB_DWIDTH - 1 
      DOWNTO 0);   
      -- Output

      readData                : OUT std_logic_vector(APB_DWIDTH - 1 
      DOWNTO 0);   

-- Inputs

      wen                     : IN std_logic;   
      ren                     : IN std_logic;   
      writeAddr               : IN std_logic_vector(17 DOWNTO 0);   
      readAddr                : IN std_logic_vector(17 DOWNTO 0);   
      clk                     : IN std_logic;   
      resetn                  : IN std_logic;   
      lsram_2k_BUSY_all       : OUT std_logic);   
END COMPONENT;

   ------------------------------------------------------------------------
   -- Signals
   ------------------------------------------------------------------------
   SIGNAL addr                     :  std_logic_vector(17 DOWNTO 0);   
   SIGNAL wen                      :  std_logic;   
   SIGNAL ren                      :  std_logic;   
   SIGNAL lsram_512_BUSY_all       :  std_logic;   
   SIGNAL lsram_512to46k_BUSY_all  :  std_logic;   
   SIGNAL lsram_1k_BUSY_all        :  std_logic;   
   SIGNAL lsram_2k_BUSY_all        :  std_logic;   
   SIGNAL lsram_BUSY_all           :  std_logic;   
   SIGNAL usram_BUSY_all           :  std_logic;   
   SIGNAL usram_2K_BUSY_all           :  std_logic;   
   SIGNAL usram_3K_BUSY_all           :  std_logic;   
   SIGNAL usram_4K_BUSY_all           :  std_logic;   
   SIGNAL usram_9K_BUSY_all           :  std_logic;   

   SIGNAL mem_BUSY_all             :  std_logic;   
   SIGNAL usram_PRDATA             :  std_logic_vector(APB_DWIDTH - 1 
   DOWNTO 0);   
   SIGNAL lsram_PRDATA             :  std_logic_vector(APB_DWIDTH - 1 
   DOWNTO 0); 
   ------------------------------------------------------------------------
   -- Main body of code
   ------------------------------------------------------------------------
   -- BUSY signal used to block the User transactions so that SII interface 
   -- can proceed with using the memory
   -- The APB transactions are exited properly before the SII interface can
   -- access the SRAMs
   SIGNAL temp_xhdl4               :  std_logic;   
   SIGNAL temp_xhdl5               :  std_logic;   
   SIGNAL temp_xhdl6               :  std_logic;   
   SIGNAL temp_xhdl7               :  std_logic;   
   SIGNAL PRDATA_xhdl1             :  std_logic_vector(APB_DWIDTH - 1 
   DOWNTO 0);   
   SIGNAL PSLVERR_xhdl2            :  std_logic;   
   SIGNAL PREADY_xhdl3             :  std_logic;   
   SIGNAL PREADY_reg               :  std_logic;
   SIGNAL PRDATA_reg               :  std_logic_vector(APB_DWIDTH - 1 
   DOWNTO 0); 

BEGIN
   PRDATA <= PRDATA_xhdl1;
   PSLVERR <= PSLVERR_xhdl2;
  -- PREADY <= PREADY_xhdl3;
   temp_xhdl4 <= lsram_1k_BUSY_all WHEN (APB_DWIDTH = 16) ELSE 
   lsram_2k_BUSY_all;
   temp_xhdl5 <= lsram_512to46k_BUSY_all WHEN (APB_DWIDTH = 24) ELSE 
   temp_xhdl4;
   temp_xhdl6 <= lsram_512_BUSY_all WHEN (APB_DWIDTH = 32) ELSE 
   temp_xhdl5;
   lsram_BUSY_all <= temp_xhdl6 ;

   temp_xhdl7 <= usram_BUSY_all WHEN SEL_SRAM_TYPE /= 0 ELSE lsram_BUSY_all;

   mem_BUSY_all <= temp_xhdl7 ;

   -- APB 3 signals
   --    assign PREADY = 1'b1 & ~mem_BUSY_all;

   PSLVERR_xhdl2 <= '0' ;
   --PREADY <= PREADY_reg ; -- SAR#38264
   PREADY <= '1' ; -- SAR#38264
   PREADY_xhdl3 <= PREADY_reg;  -- SAR#38264

-- PREADY is pulled LOW for one clock cycle during reads
   -- PROCESS (PCLK, PRESETN)  -- SAR#38264
   -- BEGIN
   --    IF (PRESETN = '0') THEN
   --       PREADY_reg <= '1';    
   --    ELSIF (PCLK'EVENT AND PCLK = '1') THEN
   --      IF(PSEL = '1' AND PWRITE = '0' AND PENABLE = '0' AND PREADY_xhdl3 = '1') THEN
   --         PREADY_reg <= '0';
   --      ELSIF (PSEL = '1' AND PWRITE = '0' AND PENABLE = '1') THEN
   --         PREADY_reg <= '1';
   --      ELSE 
   --         PREADY_reg <= '1';
   --      END IF;
   --    END IF;
   --  END PROCESS;

   -- Create read and write enable signals using APB control signals
   wen <= (PWRITE AND PENABLE) AND PSEL ;
   ren <= (NOT PWRITE AND NOT PENABLE) AND PSEL ;
 
   L1: IF (SEL_SRAM_TYPE = 0) GENERATE
      L2: IF (APB_DWIDTH = 32) GENERATE
         lsram_512to35328x32_block0 : COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_lsram_512to35328x32 
            GENERIC MAP (
               DEPTH => LSRAM_NUM_LOCATIONS_DWIDTH,
               APB_DWIDTH => APB_DWIDTH)
            PORT MAP (
               writeData => PWDATA,
               readData => lsram_PRDATA,
               wen => wen,
               ren => ren,
               writeAddr => addr,
               readAddr => addr,
               clk => PCLK,
               resetn => PRESETN,
               lsram_512_BUSY_all => lsram_512_BUSY_all);   
      END GENERATE;
      
      --L3:IF (NOT(APB_DWIDTH = 32)) GENERATE
      --   L4:IF (APB_DWIDTH = 24) GENERATE
      --      lsram_512to46kx24_block0 : COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_lsram_512to46kx24 
      --         GENERIC MAP (
      --            DEPTH => LSRAM_NUM_LOCATIONS_DWIDTH24,
      --            APB_DWIDTH => APB_DWIDTH)
      --         PORT MAP (
      --            writeData => PWDATA,
      --            readData => lsram_PRDATA,
      --            wen => wen,
      --            ren => ren,
      --            writeAddr => addr,
      --            readAddr => addr,
      --            clk => PCLK,
      --            resetn => PRESETN,
      --            lsram_512to46k_BUSY_all => lsram_512to46k_BUSY_all);   
      --   END GENERATE;
         
         L5:IF (NOT(APB_DWIDTH = 32)) GENERATE
            L6:IF (APB_DWIDTH = 16) GENERATE
               lsram_1024to70656x16_block0 : COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_lsram_1024to70656x16 
                  GENERIC MAP (
                     DEPTH => LSRAM_NUM_LOCATIONS_DWIDTH,
                     APB_DWIDTH => APB_DWIDTH)
                  PORT MAP (
                     writeData => PWDATA,
                  readData => lsram_PRDATA,
                      wen => wen,
                     ren => ren,
                     writeAddr => addr,
                     readAddr => addr,
                     clk => PCLK,
                     resetn => PRESETN,
                     lsram_1k_BUSY_all => lsram_1k_BUSY_all);   
            END GENERATE;
            
            L7:IF (NOT(APB_DWIDTH = 16)) GENERATE
               L8:IF (APB_DWIDTH = 8) GENERATE
                  lsram_2048to141312x8_block0 : COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_lsram_2048to141312x8 
                     GENERIC MAP (
                        DEPTH => LSRAM_NUM_LOCATIONS_DWIDTH,
                        APB_DWIDTH => APB_DWIDTH)
                     PORT MAP (
                        writeData => PWDATA,
--                        readData => lsram_width08_PRDATA,
                        readData => lsram_PRDATA,
                        wen => wen,
                        ren => ren,
                        writeAddr => addr,
                        readAddr => addr,
                        clk => PCLK,
                        resetn => PRESETN,
                        lsram_2k_BUSY_all => lsram_2k_BUSY_all);   
               END GENERATE;
            END GENERATE;
      END GENERATE;
   END GENERATE;
   
   L9:IF (NOT(SEL_SRAM_TYPE = 0)) GENERATE
      L10: IF (APB_DWIDTH = 32) GENERATE
      usram_64to2304x32_block0 : COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_usram_64to2304x32
         GENERIC MAP (
            APB_DWIDTH => APB_DWIDTH,
            USRAM_NUM_LOCATIONS_DWIDTH32 => USRAM_NUM_LOCATIONS_DWIDTH)
         PORT MAP (
            writeData => PWDATA,
            readData => usram_PRDATA,
            wen => wen,
            ren => ren,
            writeAddr => addr,
            readAddr => addr,
            clk => PCLK,
            resetn => PRESETN,
            u_2K_BUSY_all => usram_2K_BUSY_all);
      END GENERATE;  -- L10

      --L11:IF (NOT(APB_DWIDTH = 32)) GENERATE         
      --   L12:IF (APB_DWIDTH = 24) GENERATE

      --   usram_64to3072x24_block0 : COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_usram_64to3072x24
      --   GENERIC MAP (
      --      APB_DWIDTH => APB_DWIDTH,
      --      USRAM_NUM_LOCATIONS_DWIDTH24 => USRAM_NUM_LOCATIONS_DWIDTH24)
      --   PORT MAP (
      --      writeData => PWDATA,
      --      readData => usram_PRDATA,
      --      wen => wen,
      --      ren => ren,
      --      writeAddr => addr,
      --      readAddr => addr,
      --      clk => PCLK,
      --      resetn => PRESETN,
      --      u_3K_BUSY_all => usram_3K_BUSY_all);
      --   END GENERATE;  -- L12

         L13:IF (NOT(APB_DWIDTH = 32)) GENERATE            
            L14:IF (APB_DWIDTH = 16) GENERATE

            usram_64to4608x16_block0 : COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_usram_64to4608x16
            GENERIC MAP (
              APB_DWIDTH => APB_DWIDTH,
              USRAM_NUM_LOCATIONS_DWIDTH16 => USRAM_NUM_LOCATIONS_DWIDTH)
            PORT MAP (
              writeData => PWDATA,
              readData => usram_PRDATA,
              wen => wen,
              ren => ren,
              writeAddr => addr,
              readAddr => addr,
              clk => PCLK,
              resetn => PRESETN,
              u_4K_BUSY_all => usram_4K_BUSY_all);
            END GENERATE;  --L14

            L15:IF (NOT(APB_DWIDTH = 16)) GENERATE               
               L16:IF (APB_DWIDTH = 8) GENERATE

                 usram_128to9216x8_block0 : COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_usram_128to9216x8
                 GENERIC MAP (
                   APB_DWIDTH => APB_DWIDTH,
                   USRAM_NUM_LOCATIONS_DWIDTH08 => USRAM_NUM_LOCATIONS_DWIDTH)
                 PORT MAP (
                   writeData => PWDATA,
                   readData => usram_PRDATA,
                   wen => wen,
                   ren => ren,
                   writeAddr => addr,
                   readAddr => addr,
                   clk => PCLK,
                   resetn => PRESETN,
                   u_9K_BUSY_all => usram_9K_BUSY_all);
                 END GENERATE;  --L16
            END GENERATE;   -- L15
        END GENERATE;  --L13
   END GENERATE;  -- L9

   PROCESS (PADDR)
   BEGIN
     CASE ADDR_SCHEME IS
       WHEN 0 => 
         addr <= PADDR(19 DOWNTO 2);
       WHEN 1 => 
         addr <= PADDR(18 DOWNTO 1);
       WHEN 2 => 
         addr <= PADDR(17 DOWNTO 0);
       WHEN OTHERS  =>
         addr <= PADDR(17 DOWNTO 0);
     END CASE;
   END PROCESS;

 -- SAR#38264   
   PROCESS (PSEL, PWRITE, PENABLE, lsram_PRDATA, usram_PRDATA,PRDATA_reg)
   BEGIN
         IF ((PSEL = '1' AND PWRITE = '0') AND PENABLE = '1') THEN
            IF (SEL_SRAM_TYPE = 0) THEN
               PRDATA_xhdl1 <= lsram_PRDATA;
            ELSE
               PRDATA_xhdl1 <= usram_PRDATA;    
            END IF;
         ELSE
            PRDATA_xhdl1 <= PRDATA_reg;    
         END IF;
   END PROCESS;

   PROCESS (PCLK, PRESETN)  -- SAR#38264
   BEGIN
      IF (PRESETN = '0') THEN
         PRDATA_reg <= (OTHERS => '0');    
      ELSIF (PCLK'EVENT AND PCLK = '1') THEN
         PRDATA_reg <= PRDATA_xhdl1;
      END IF;
    END PROCESS;

END ARCHITECTURE translated;
