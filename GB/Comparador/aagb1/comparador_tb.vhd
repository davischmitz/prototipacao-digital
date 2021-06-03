-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : comparador_tb.vhd
-- NAME         : 
-- PROJECT      : AA01GB
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Desenvolver em VHDL a descrição de HW de um circuito comparador de dois números 'A' e 'B'. O circuito deve detectar se 'A' e maior, menor ou igual ao valor de 'B'
-- DEPENDENCIES : 
-- Additional Comments: 

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--Libraries
--------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	
-------------------------------------------------------------------------------
-- Entity
------------------------------------------------------------------------------- 
ENTITY comparador_tb IS
--DeclaraÃ§Ã£o dos generics------------------------------------------------------
	
--Declaration of input and output data---------------------------------------------
END comparador_tb;


--------------------------------------------------------------------------------
--Description of behaviour
--------------------------------------------------------------------------------
ARCHITECTURE behavior OF comparador_tb IS 

	-----------------------------------
	-- Types 
	-----------------------------------

	
	-----------------------------------
	-- Constants
	-----------------------------------
	
	
	-----------------------------------
	-- Declaration of components
	-- Component Declaration for the Unit Under Test (UUT)
	-----------------------------------
	COMPONENT comparador
		PORT(
			clock			: in std_logic;									
			reset			: in std_logic;		
			A           : IN  std_logic_vector(3 downto 0);
         B           : IN  std_logic_vector(3 downto 0);
         s_ma        : OUT  std_logic;
         s_me        : OUT  std_logic
		);
	END COMPONENT;

	-----------------------------------
	-- Declaration of Signals
	-----------------------------------
	--Inputs
	signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
	
	--signal clock : std_logic := '0';
	--signal reset : std_logic := '0';

	--Outputs
	signal s_ma : std_logic;
   signal s_me : std_logic;
	
	-- Clock
	--constant C_period : time := 13 ns; 
	constant tempo_processo : time := 14 ns;
	
	BEGIN
	
	
	------------------
	-- Port Mapping --
	------------------
 	-- Instantiate the Unit Under Test (UUT)
	uut: comparador
		
		PORT MAP (
			--clock => clock,
			--reset => reset,
			A => A,
         B => B,
			--e_ma => e_ma,
			--e_me => e_me,
         s_ma => s_ma,
         s_me => s_me
		);
	
	-----------------------------
	-- Asynchronous tasks      --
	-----------------------------
	
	
	---------------
	-- Processes --
	---------------
	-- Clock process definitions
	--C_process :process
	--	begin
	--		clock <= '0';
	--		wait for C_period/2;
	--		clock <= '1';
	--		wait for C_period/2;
	--end process;

	-- Stimulus process
	stim_proc: process
	begin
		A <= "001";
		B <= "001";
		e_ma <= '0';
		e_me <= '0';
		wait for tempo_processo;
		
		A <= "001";
		B <= "010";
		wait for tempo_processo;
		
		A <= "111";
		B <= "010";
		wait for tempo_processo;
		
		A <= "100";
		B <= "001";
		wait for tempo_processo;

		A <= "101";
		B <= "010";
		wait for tempo_processo;
		--reset <= '0';
		--wait for tempo_processo;
		--reset <= '1';
		--w		<= '1';
		--wait for tempo_processo;
		--w		<= '0';
		--wait for tempo_processo;
		--w		<= '0';
		--wait for tempo_processo;
		--w		<= '1';
		--wait for tempo_processo;		
		--wait;
	end process;
END;
-----------------------------------------------------------------------------------------------------------------------------------------