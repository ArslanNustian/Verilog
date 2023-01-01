
LIBRARY xtek;
   USE xtek.XHDL_std_logic.all;
LIBRARY ieee;
   USE ieee.std_logic_1164.all;

ENTITY true_dpram_sclk IS
   PORT (
      data_a  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      data_b  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      addr_a  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      addr_b  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      we_a    : IN STD_LOGIC;
      we_b    : IN STD_LOGIC;
      clk     : IN STD_LOGIC;
      q_a     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      q_b     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
END true_dpram_sclk;

ARCHITECTURE trans OF true_dpram_sclk IS
   TYPE type_xhdl0 IS ARRAY (63 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
   
   SIGNAL ram : type_xhdl0;
BEGIN
   
   PROCESS (clk)
   BEGIN
      IF (clk'EVENT AND clk = '1') THEN
         IF (we_a = '1') THEN
            ram(to_integer(addr_a)) <= data_a;
            q_a <= data_a;
         ELSE
            q_a <= ram(to_integer(addr_a));
         END IF;
      END IF;
   END PROCESS;
   
   
   PROCESS (clk)
   BEGIN
      IF (clk'EVENT AND clk = '1') THEN
         IF (we_b = '1') THEN
            ram(to_integer(addr_b)) <= data_b;
            q_b <= data_b;
         ELSE
            q_b <= ram(to_integer(addr_b));
         END IF;
      END IF;
   END PROCESS;
   
   
END trans;




