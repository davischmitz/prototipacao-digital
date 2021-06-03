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

	--Outputs
	signal s_ma : std_logic;
   signal s_me : std_logic;
	
	-- Clock
	constant tempo_processo : time := 14 ns; --usada para gerar estimulos para as entradas
	
	BEGIN
	
	------------------
	-- Port Mapping --
	------------------
 	-- Instantiate the Unit Under Test (UUT)
	uut: comparador
		
		PORT MAP (
			A => A,
         B => B,
         s_ma => s_ma,
         s_me => s_me
		);
	
	-----------------------------
	-- Asynchronous tasks      --
	-----------------------------
	
	
	---------------
	-- Processes --
	---------------
	-- Stimulus process
	stim_proc: process
	begin
		--A e B iguais
		A <= "0001"; --1
		B <= "0001";
		wait for tempo_processo;
		
		--A menor que B
		A <= "0001"; --1
		B <= "0010"; --2
		wait for tempo_processo;
		
		--A maior que B 
		A <= "0100"; --4
		B <= "0010"; --2
		wait for tempo_processo;
		
		--A maior que B
		A <= "1001"; --9
		B <= "0001"; --1
		wait for tempo_processo;

		--A menor que B
		A <= "0101"; --5
		B <= "0010"; --2
		wait for tempo_processo;
		
		wait;
		
	end process;
END;
-----------------------------------------------------------------------------------------------------------------------------------------