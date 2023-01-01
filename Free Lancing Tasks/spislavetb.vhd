--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:49:34 05/12/2022
-- Design Name:   
-- Module Name:   E:/risvAI/spislavetb.vhd
-- Project Name:  risvAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SPI_SLAVE
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY spislavetb IS
END spislavetb;
 
ARCHITECTURE behavior OF spislavetb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SPI_SLAVE
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         SCLK : IN  std_logic;
         CS_N : IN  std_logic;
         MOSI : IN  std_logic;
         MISO : OUT  std_logic;
         DIN : IN  std_logic_vector(7 downto 0);
         DIN_VLD : IN  std_logic;
         DIN_RDY : OUT  std_logic;
         DOUT : OUT  std_logic_vector(7 downto 0);
         DOUT_VLD : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal SCLK : std_logic := '0';
   signal CS_N : std_logic := '0';
   signal MOSI : std_logic := '0';
   signal DIN : std_logic_vector(7 downto 0) := (others => '0');
   signal DIN_VLD : std_logic := '0';

 	--Outputs
   signal MISO : std_logic;
   signal DIN_RDY : std_logic;
   signal DOUT : std_logic_vector(7 downto 0);
   signal DOUT_VLD : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
   constant SCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SPI_SLAVE PORT MAP (
          CLK => CLK,
          RST => RST,
          SCLK => SCLK,
          CS_N => CS_N,
          MOSI => MOSI,
          MISO => MISO,
          DIN => DIN,
          DIN_VLD => DIN_VLD,
          DIN_RDY => DIN_RDY,
          DOUT => DOUT,
          DOUT_VLD => DOUT_VLD
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   SCLK_process :process
   begin
		SCLK <= '0';
		wait for SCLK_period/2;
		SCLK <= '1';
		wait for SCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
