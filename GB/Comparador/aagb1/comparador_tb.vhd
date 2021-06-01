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
	-----------------------------------
	COMPONENT comparador
		PORT(
			clock			: in std_logic;									
			reset			: in std_logic;		
			w				: in std_logic;				
			z				: out std_logic
		);
	END COMPONENT;

	-----------------------------------
	-- Declaration of Signals
	-----------------------------------
	--Inputs
	signal clock : std_logic := '0';
	signal reset : std_logic := '0';
	signal w 	 : std_logic := '0';

	--Outputs
	signal z 	 : std_logic := '0';

	
	-- Clock
	constant C_period : time := 13 ns; 
	constant tempo_processo : time := 14 ns;
	
	BEGIN
	
	
	------------------
	-- Port Mapping --
	------------------
 	
	uut: comparador
		
		PORT MAP (
			clock => clock,
			reset => reset,
			w 		=> w,
			z		=> z
		);
	
	-----------------------------
	-- Asynchronous tasks      --
	-----------------------------
	
	
	---------------
	-- Processes --
	---------------
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
		reset <= '0';
		wait for tempo_processo;
		reset <= '1';
		w		<= '1';
		wait for tempo_processo;
		w		<= '0';
		wait for tempo_processo;
		w		<= '0';
		wait for tempo_processo;
		w		<= '1';
		wait for tempo_processo;		
		wait;
	end process;
END;
-----------------------------------------------------------------------------------------------------------------------------------------