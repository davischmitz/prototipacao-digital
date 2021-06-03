--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:44:24 06/03/2021
-- Design Name:   
-- Module Name:   C:/unisinos/prototipacao-digital-ga-1/GB/Comparador/aagb1/t_comparador_tb.vhd
-- Project Name:  aagb1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparador
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
 
ENTITY t_comparador_tb IS
END t_comparador_tb;
 
ARCHITECTURE behavior OF t_comparador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparador
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         s_ma : OUT  std_logic;
         s_me : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal s_ma : std_logic;
   signal s_me : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  constant C_period : time := 13 ns; 
	constant tempo_processo : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparador PORT MAP (
          A => A,
          B => B,
          s_ma => s_ma,
          s_me => s_me
        );

   -- Clock process definitions
   C_process :process
		begin
			clock <= '0';
			wait for C_period/2;
			clock <= '1';
			wait for C_period/2;
	end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for tempo_processo;;

      -- insert stimulus here 

      wait;
   end process;

END;
