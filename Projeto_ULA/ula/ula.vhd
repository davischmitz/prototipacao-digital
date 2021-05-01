-------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : ula.vhd
-- NAME         : 
-- PROJECT      : Unidade Lógica aritmética
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Desenvolver uma ULA com as operações de Adição, Subtração em complemento de dois, Operação AND entre dois dados de entrada, considerando que os dado de entrada possuem 4 bits
-- DEPENDENCIES : 
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- LIBRARY
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;    --operacoes aritmeticas
use IEEE.STD_LOGIC_UNSIGNED.ALL; --para trabalhar com numeros sem sinal 

-------------------------------------------------------------------------------
-- ENTITY
-------------------------------------------------------------------------------

entity ula is
	port (
		A           :	IN  std_logic_vector(7 downto 0);		-- Entrada 8 bits sinal A
		B           :	IN  std_logic_vector(7 downto 0);		-- Entrada 8 bits sinal B
		op_code     :	IN  std_logic_vector(2 downto 0);      -- Entrada da operação a ser realizada
		ULA_output	:	OUT std_logic_vector(8 downto 0)	      -- Saida tem um bit a mais devido ao overflow
  );
end ula;

-------------------------------------------------------------------------------
-- ARCHITECTURE
-------------------------------------------------------------------------------
architecture ula of ula is
    -----------------------------------
	-- Types 
	-----------------------------------

	
	-----------------------------------
	-- Constants
	-----------------------------------
	
	
	-----------------------------------
	-- Statments of components
	-----------------------------------
	
	
	
	-----------------------------------
	-- Statments of signals
	-----------------------------------

 	------------------
	-- Port Mapping --
	------------------
begin
	-----------------------------
	-- Asynchronous assignments --
	-----------------------------

  ---------------
	--  Process  --
	---------------
	process (A, B)
	begin
		--case op_code is
            --when "000" =>	
				--when "001" =>	
				--when "010" =>		
				--when "011" =>  
				--when "100" =>   	
		--end case;
	end process;
	--up_edge
	
end ula;
