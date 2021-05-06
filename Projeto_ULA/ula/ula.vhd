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
		A           :	IN  std_logic_vector(3 downto 0);		-- Entrada 4 bits sinal A
		B           :	IN  std_logic_vector(3 downto 0);		-- Entrada 4 bits sinal B
      C_in        :	IN std_logic;	                   	   -- Entrada 1 bit para fazer a seleção entre Adder e And
		C_out       :	IN std_logic;                  	      -- Saida
		S         	:	OUT std_logic_vector(8 downto 0)	      -- Saida tem um bit a mais devido ao overflow
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
	  --signal aux1_s: std_logic := '0';
	  --signal aux2_s: std_logic := '0';
	  --signal aux3_s: std_logic := '0';
	  --signal aux4_s: std_logic := '0';
	signal s_b0: std_logic :='0';
	signal s_b1: std_logic :='0';
	signal s_b2: std_logic :='0';
	signal s_b3: std_logic :='0';
	signal s_soma0: std_logic_vector(1 downto 0):="00";
	signal s_soma1: std_logic_vector(1 downto 0):="00";
	signal s_soma2: std_logic_vector(1 downto 0):="00";
	signal s_soma3: std_logic_vector(1 downto 0):="00";
 	------------------
	-- Port Mapping --
	------------------
begin
	-----------------------------
	-- Asynchronous assignments --
	-----------------------------
	s_b0 <= b(0) xor C_in;
	s_b1 <= b(1) xor C_in;
	s_b2 <= b(2) xor C_in;
	s_b3 <= b(3) xor C_in;
	
	s_soma0 <= ("0"&A(0 downto 0)) + ("0"&s_b0) + ("0"&C_in);
	s_soma1 <= ("0"&A(1 downto 1)) + ("0"&s_b1) + ("0"&s_soma0(1));
	s_soma2 <= ("0"&A(2 downto 2)) + ("0"&s_b2) + ("0"&s_soma1(1));
	s_soma3 <= ("0"&A(3 downto 3)) + ("0"&s_b3) + ("0"&s_soma2(1));
	
	s(0) <= s_soma0(0);
	s(1) <= s_soma1(0);
	s(2) <= s_soma2(0);
	s(3) <= s_soma3(0);
	s(4)	<= s_soma3(1) xor C_in;
  ---------------
	--  Process  --
	---------------

	--up_edge
	
end ula;
