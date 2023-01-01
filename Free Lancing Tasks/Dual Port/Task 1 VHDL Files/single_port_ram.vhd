LIBRARY xtek;
   USE xtek.XHDL_std_logic.all;
LIBRARY ieee;
   USE ieee.std_logic_1164.all;

ENTITY single_port_ram IS
   PORT (
      data  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      addr  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      we    : IN STD_LOGIC;
      clk   : IN STD_LOGIC;
      q     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
END single_port_ram;

ARCHITECTURE trans OF single_port_ram IS
   TYPE type_xhdl0 IS ARRAY (63 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
   
   
   SIGNAL ram      : type_xhdl0;
   
   SIGNAL addr_reg : STD_LOGIC_VECTOR(5 DOWNTO 0);
BEGIN
   
   PROCESS (clk)
   BEGIN
      IF (clk'EVENT AND clk = '1') THEN
         IF (we = '1') THEN
            ram(to_integer(addr)) <= data;
         END IF;
         
         addr_reg <= addr;
      END IF;
   END PROCESS;
   
   
   q <= ram(to_integer(addr_reg));
   
END trans;




