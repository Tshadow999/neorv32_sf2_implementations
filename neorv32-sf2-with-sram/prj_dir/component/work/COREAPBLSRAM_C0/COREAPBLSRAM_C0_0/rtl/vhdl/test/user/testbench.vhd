-- ********************************************************************/
-- Actel Corporation Proprietary and Confidential
--  Copyright 2011 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description:  testbench
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
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.xhdl_std_logic.all;
use work.xhdl_misc.all;
use work.coreparameters.all;

ENTITY testbench is
end testbench;

ARCHITECTURE translated OF testbench IS
  COMPONENT COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_COREAPBLSRAM
    GENERIC(
	   FAMILY                         :  integer := 19;    
     	   APB_DWIDTH                     :  integer := 32;    
           SEL_SRAM_TYPE                  :  integer := 1;    
           USRAM_NUM_LOCATIONS_DWIDTH   :  integer := 64;    
           --USRAM_NUM_LOCATIONS_DWIDTH24   :  integer := 64;    
           --USRAM_NUM_LOCATIONS_DWIDTH16   :  integer := 64;    
           --USRAM_NUM_LOCATIONS_DWIDTH08   :  integer := 128;    
           LSRAM_NUM_LOCATIONS_DWIDTH   :  integer := 512    
           --LSRAM_NUM_LOCATIONS_DWIDTH24   :  integer := 512;    
           --LSRAM_NUM_LOCATIONS_DWIDTH16   :  integer := 1024;    
           --LSRAM_NUM_LOCATIONS_DWIDTH08   :  integer := 2048
         );
         PORT(
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
              PSLVERR                 : OUT std_logic;  
              PREADY                  : OUT std_logic
         );
  END COMPONENT;
--Declaring constants
   
   CONSTANT timescale              : time := 1 ns;
   CONSTANT SYS_CLK_CYCLE          : INTEGER := 20;
   CONSTANT APB_AWIDTH             : INTEGER := 20;
--APB_WRITE PROCEDURE
   
   PROCEDURE apb_write(
       constant a         : IN std_logic_vector(19 DOWNTO 0);
       constant d         : IN std_logic_vector((APB_DWIDTH - 1) DOWNTO 0);
       SIGNAL PCLK      : IN std_logic;
       SIGNAL PADDR     : OUT std_logic_vector(19 DOWNTO 0);
       SIGNAL PWDATA    : OUT std_logic_vector(APB_DWIDTH - 1 DOWNTO 0);
       SIGNAL PSEL      : OUT std_logic;
       SIGNAL PWRITE    : OUT std_logic;
       SIGNAL PENABLE   : OUT std_logic)IS

   BEGIN 
       WAIT UNTIL (PCLK'EVENT AND PCLK = '1');
       PENABLE <= '0';
       PSEL <= '1';
       PADDR <= a;
       PWDATA <= d;
       PWRITE <= '1';
       WAIT UNTIL (PCLK'EVENT AND PCLK = '1');
       PENABLE <= '1';
       WAIT UNTIL (PCLK'EVENT AND PCLK = '1');
       PENABLE <= '0';
       PSEL <= '0';
       PWRITE <= '0';
   END apb_write;

-- CHEK SIG PROCEDURE
PROCEDURE checksig (
     SIGNAL d                       : IN std_logic_vector(APB_DWIDTH - 1 DOWNTO 0);   
     constant v                       : IN std_logic_vector(APB_DWIDTH - 1 DOWNTO 0);   
     constant address                 : IN std_logic_vector(19 DOWNTO 0);
     SIGNAL simerrors               : INOUT integer)IS
      
   BEGIN
      IF (d /= v) THEN
         WRITE("");   
         WRITE("ERROR!!! Mismatch on APB_BUS ");   
         WRITE("At time: " & to_string(NOW));   
         WRITE("Expected value was: 0x" & to_string(v) & ", observed  value is: 0x" & to_string(d) & " at address = " & to_hexstring(address));   
         WRITE("");   
         
         --simerrors <= simerrors + 1;    
         simerrors <= 1;    
         IF (simerrors /= 0) THEN
            ASSERT (FALSE) REPORT "'$stop' Encountered" SEVERITY 
            FAILURE;   
         END IF;
      END IF;
      -- if (d !== v)
   END checksig;


   PROCEDURE apb_read (
        constant  a         : IN std_logic_vector(19 DOWNTO 0);   
        constant  d_xhdl14  : IN std_logic_vector((APB_DWIDTH - 1) DOWNTO 0);
        SIGNAL  PCLK      : IN std_logic;
        SIGNAL  PADDR     : OUT std_logic_vector(19 DOWNTO 0);
        SIGNAL  PRDATA    : IN std_logic_vector((APB_DWIDTH - 1) DOWNTO 0);
        SIGNAL  PSEL      : OUT std_logic;
        SIGNAL  PWRITE    : OUT std_logic;
        SIGNAL  PENABLE   : OUT std_logic;
        SIGNAL  PREADY    : IN std_logic;
        SIGNAL  simerrors : INOUT integer)IS
       
        --variable errors   : integer; 
      
   BEGIN
      WAIT UNTIL (PCLK'EVENT AND PCLK = '1');
      PADDR <= a;
      PENABLE <= '0';    
      PSEL <= '1';
      PWRITE <= '0';    
      WAIT UNTIL (PCLK'EVENT AND PCLK = '1');
      PENABLE <= '1';   
      --WAIT UNTIL (PREADY = '1'); 
      WAIT UNTIL (PCLK'EVENT AND PCLK = '1');
      PENABLE <= '0';    
      PSEL <= '0';   
      checksig(PRDATA,d_xhdl14,a,simerrors);
      --simerrors <= errors; 
   END apb_read;
   
   

--DUT SIGNAL DECLARATION 

  SIGNAL PCLK                    :  std_logic;   
  SIGNAL PRESETN                 :  std_logic;   
  SIGNAL PSEL                    :  std_logic;   
  SIGNAL PENABLE                 :  std_logic;   
  SIGNAL PWRITE                  :  std_logic;   
  SIGNAL PADDR                   :  std_logic_vector(19 DOWNTO 0);   
  SIGNAL PWDATA                  :  std_logic_vector(APB_DWIDTH - 1 DOWNTO 0);   
  SIGNAL PRDATA                  :  std_logic_vector(APB_DWIDTH - 1 DOWNTO 0);   
  SIGNAL PSLVERR                 :  std_logic;  
  SIGNAL PREADY                  :  std_logic;
  --SIGNAL loops                    : integer;
  SIGNAL simerrors                : integer;
  SIGNAL end_of_simulation        : BOOLEAN;


BEGIN 

   PROCESS
       BEGIN
         PCLK <= '0';
         WAIT FOR (SYS_CLK_CYCLE/2 * 1 ns);
         PCLK <= '1';    
         WAIT FOR (SYS_CLK_CYCLE/2 * 1 ns);
         IF (end_of_simulation) THEN
           wait;
         END IF;
   END PROCESS;

   COREAPBLSRAM_0 : COREAPBLSRAM_C0_COREAPBLSRAM_C0_0_COREAPBLSRAM 
      GENERIC MAP (
         SEL_SRAM_TYPE => SEL_SRAM_TYPE,
         --LSRAM_NUM_LOCATIONS_DWIDTH08 => LSRAM_NUM_LOCATIONS_DWIDTH08,
         --LSRAM_NUM_LOCATIONS_DWIDTH16 => LSRAM_NUM_LOCATIONS_DWIDTH16,
         --LSRAM_NUM_LOCATIONS_DWIDTH24 => LSRAM_NUM_LOCATIONS_DWIDTH24,
         LSRAM_NUM_LOCATIONS_DWIDTH => LSRAM_NUM_LOCATIONS_DWIDTH,
         --USRAM_NUM_LOCATIONS_DWIDTH08 => USRAM_NUM_LOCATIONS_DWIDTH08,
         --USRAM_NUM_LOCATIONS_DWIDTH16 => USRAM_NUM_LOCATIONS_DWIDTH16,
         --USRAM_NUM_LOCATIONS_DWIDTH24 => USRAM_NUM_LOCATIONS_DWIDTH24,
         USRAM_NUM_LOCATIONS_DWIDTH => USRAM_NUM_LOCATIONS_DWIDTH,
         APB_DWIDTH => APB_DWIDTH)
      PORT MAP (
         PCLK => PCLK,
         PRESETN => PRESETN,
         PSEL => PSEL,
         PENABLE => PENABLE,
         PWRITE => PWRITE,
         PADDR => PADDR,
         PWDATA => PWDATA,
         PRDATA => PRDATA,
         PSLVERR => PSLVERR,
         PREADY => PREADY);
  
PROCESS 

         VARIABLE loops : INTEGER;
         VARIABLE loops_read : INTEGER;
         VARIABLE Y : INTEGER;
BEGIN
         loops := 0;
         loops_read := 0;
         Y := 0;
         --end_of_simulation := 0;

-- INITIALIZE SIGNAL
         PSEL <= '0';    
         PENABLE <= '0';    
         PWRITE <= '0';    
         PADDR <= (OTHERS => '0');
         PWDATA <= (OTHERS => '0');    
         simerrors <= 0;    
         PRESETN <= '0';
         WAIT FOR SYS_CLK_CYCLE * 2 ns;    
         PRESETN <= '1';
         IF (SEL_SRAM_TYPE = 0) THEN
            IF (APB_DWIDTH = 32) THEN
               FOR loops in 0 TO LSRAM_NUM_LOCATIONS_DWIDTH/4 - 1 LOOP
                  apb_write((std_logic_vector(to_unsigned(loops*4,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PWDATA,PSEL,PWRITE,PENABLE);   
                  WAIT FOR 0 ns;
               END LOOP;
               WAIT FOR 0 ns;
               loops := 0; 
               FOR loops in 0 TO LSRAM_NUM_LOCATIONS_DWIDTH/4 - 1 LOOP
                  apb_read((std_logic_vector(to_unsigned(loops*4,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PRDATA,PSEL,PWRITE,PENABLE,PREADY,simerrors);
                  WAIT FOR 0 ns;
               END LOOP;
               WRITE("************** DEPTH = " & to_decstring(LSRAM_NUM_LOCATIONS_DWIDTH) & "****************");   
            
              
             ELSIF (APB_DWIDTH = 16) THEN
                    loops := 0;
                    WAIT FOR 0 ns;
                    FOR loops in 0 TO LSRAM_NUM_LOCATIONS_DWIDTH/2 - 1 LOOP
                        apb_write((std_logic_vector(to_unsigned(loops*2,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PWDATA,PSEL,PWRITE,PENABLE);   
                    END LOOP;
                    WAIT FOR 0 ns;
                    loops := 0;
                    FOR loops in 0 TO LSRAM_NUM_LOCATIONS_DWIDTH/2 - 1 LOOP
                        apb_read((std_logic_vector(to_unsigned(loops*2,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PRDATA,PSEL,PWRITE,PENABLE,PREADY,simerrors);
                    END LOOP;
                    WRITE("************** DEPTH = " & to_decstring(LSRAM_NUM_LOCATIONS_DWIDTH) & " ****************");  
             ELSE
                    loops := 0;
                    WAIT FOR 0 ns;
                    FOR loops in 0 TO LSRAM_NUM_LOCATIONS_DWIDTH - 1 LOOP
                         apb_write((std_logic_vector(to_unsigned(loops,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PWDATA,PSEL,PWRITE,PENABLE);   
                    END LOOP;
                    loops := 0;
                    WAIT FOR 0 ns;
                    FOR loops in 0 TO LSRAM_NUM_LOCATIONS_DWIDTH - 1 LOOP
                        apb_read((std_logic_vector(to_unsigned(loops,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PRDATA,PSEL,PWRITE,PENABLE,PREADY,simerrors);
                    END LOOP;
                    WRITE("************** DEPTH = " & to_decstring(LSRAM_NUM_LOCATIONS_DWIDTH) & " ****************");  
             END IF;
    
       --(SEL_SRAM_TYPE == 1)
       ELSE 
           IF (APB_DWIDTH = 32) THEN
              loops := 0;
              FOR loops in 0 TO USRAM_NUM_LOCATIONS_DWIDTH/4 - 1 LOOP
                    apb_write((std_logic_vector(to_unsigned(loops*4,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PWDATA,PSEL,PWRITE,PENABLE);   
              END LOOP;
              loops := 0;
              WAIT FOR 0 ns;
              FOR loops in 0 TO USRAM_NUM_LOCATIONS_DWIDTH/4 - 1 LOOP
                  apb_read((std_logic_vector(to_unsigned(loops*4,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PRDATA,PSEL,PWRITE,PENABLE,PREADY,simerrors);
              END LOOP;
              WRITE("************** DEPTH = " & to_decstring(USRAM_NUM_LOCATIONS_DWIDTH) & " ****************");  
            
           
         ELSIF (APB_DWIDTH = 16) THEN
                loops := 0;
                FOR loops in 0 TO USRAM_NUM_LOCATIONS_DWIDTH/2 - 1 LOOP
                     apb_write((std_logic_vector(to_unsigned(loops*2,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PWDATA,PSEL,PWRITE,PENABLE);   
                END LOOP;
                loops := 0;
                WAIT FOR 0 ns;
                FOR loops in 0 TO USRAM_NUM_LOCATIONS_DWIDTH/2 - 1 LOOP
                    apb_read((std_logic_vector(to_unsigned(loops*2,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PRDATA,PSEL,PWRITE,PENABLE,PREADY,simerrors);
                END LOOP;
                WRITE("************** DEPTH = " & to_decstring(USRAM_NUM_LOCATIONS_DWIDTH) & " ****************");  
         ELSE 
                loops := 0;
                FOR loops in 0 TO USRAM_NUM_LOCATIONS_DWIDTH - 1 LOOP
                     apb_write((std_logic_vector(to_unsigned(loops,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PWDATA,PSEL,PWRITE,PENABLE);   
                END LOOP;
                loops := 0;
                WAIT FOR 0 ns;
                FOR loops in 0 TO USRAM_NUM_LOCATIONS_DWIDTH - 1 LOOP
                    apb_read((std_logic_vector(to_unsigned(loops,20))), (std_logic_vector(to_unsigned(loops,APB_DWIDTH))),PCLK,PADDR,PRDATA,PSEL,PWRITE,PENABLE,PREADY,simerrors);
                END LOOP;
                WRITE("************** DEPTH = " & to_decstring(USRAM_NUM_LOCATIONS_DWIDTH) & " ****************");  
         END IF;
         
      END IF;
      
      
       WRITE("************** APB_DWIDTH = " & to_decstring(APB_DWIDTH) & " ****************");   
       IF (SEL_SRAM_TYPE = 0) THEN
          WRITE("************** SRAM TYPE  = LSRAM ****************"); 
       ELSE
          WRITE("************** SRAM TYPE  = uSRAM ****************"); 
       END IF;
       IF (simerrors = 0) THEN
         WRITE("            TEST PASSED         ");
         end_of_simulation <= true;
       END IF;
 
      WAIT FOR SYS_CLK_CYCLE * 10000 ns;
      WAIT; 
END PROCESS;


END translated;

