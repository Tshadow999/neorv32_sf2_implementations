package coreapblsram_pkg is
    function addr_schme (APB_DWIDTH : INTEGER) return INTEGER; 
end coreapblsram_pkg;

package body coreapblsram_pkg is
    function ADDR_SCHME (APB_DWIDTH : INTEGER) return INTEGER IS
    VARIABLE return_val : INTEGER := 0;
    BEGIN
      IF (APB_DWIDTH = 32) THEN
          return_val := 0;
      ELSIF (APB_DWIDTH = 16) THEN
          return_val := 1;
      ELSE 
          return_val := 2;
      END IF;
      
      RETURN return_val;
    
    END ADDR_SCHME;

end coreapblsram_pkg;
