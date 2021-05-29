-------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : ula.vhd
-- NAME         : 
-- PROJECT      : Unidade Logica aritmedica
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Desenvolver uma ULA com as operacoes de Adicao, Subtracao em complemento de dois, Operacao AND entre dois dados de entrada, considerando que os dado de entrada possuem 4 bits
-- DEPENDENCIES : 
-------------------------------------------------------------------------------
--Cin para a selecao entre as operacoes de soma e subtracao (para 0, o circuito soma, para 1 subtrai fazendo o complemento de 2 da entrada B)
--MUX para controlar se a saida sera do somador ou a do bloco AND
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
		C_in        :	IN std_logic;	                   	   -- Entrada seletora de 1 bit para fazer a selecao entre soma e subtracao
		MuxSel      :	IN std_logic;                          -- Entrada seletora de 1 bit para fazer a selecao entre o bloco somador e AND
		S         	:	OUT std_logic_vector(4 downto 0)	      -- Saida de 5 bits, 4 de dados + 1 bit de carry out
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
	signal s_b0: std_logic :='0';
	signal s_b1: std_logic :='0';
	signal s_b2: std_logic :='0';
	signal s_b3: std_logic :='0';
	
	--2 bits devido a saida + cout concatenados
	signal s_soma0: std_logic_vector(1 downto 0):="00";
	signal s_soma1: std_logic_vector(1 downto 0):="00";
	signal s_soma2: std_logic_vector(1 downto 0):="00";
	signal s_soma3: std_logic_vector(1 downto 0):="00";

	--sinal dos blocos de soma/sub e AND
	signal s_soma: std_logic_vector(4 downto 0) := "00000";
	signal s_and: std_logic_vector(4 downto 0) := "00000";
	
 	------------------
	-- Port Mapping --
	------------------
begin
	-----------------------------
	-- Asynchronous assignments --
	-----------------------------
	--sinal recebe B (4bits) XOR carry in
	s_b0 <= b(0) xor C_in;
	s_b1 <= b(1) xor C_in;
	s_b2 <= b(2) xor C_in;
	s_b3 <= b(3) xor C_in;
	
	--lógica da soma bit a bit, levando o valor de carry in
	s_soma0 <= ("0"&A(0 downto 0)) + ("0"&s_b0) + ("0"&C_in);
	s_soma1 <= ("0"&A(1 downto 1)) + ("0"&s_b1) + ("0"&s_soma0(1));
	s_soma2 <= ("0"&A(2 downto 2)) + ("0"&s_b2) + ("0"&s_soma1(1));
	s_soma3 <= ("0"&A(3 downto 3)) + ("0"&s_b3) + ("0"&s_soma2(1));

	--sinal que sai do bloco de soma recebe os sinais anteriormente resultantes da soma
	s_soma(0) <= s_soma0(0);
	s_soma(1) <= s_soma1(0);
	s_soma(2) <= s_soma2(0);
	s_soma(3) <= s_soma3(0);
	s_soma(4) <= s_soma3(1) xor C_in; --C_in no bit mais significativo, com complemento de dois
	
	s_and <= ("0"&(A and B)); --& concatena um bit de '0' pois o and de A e B sempre vai retornar 4bits e o contador é de 5bits
  ---------------
	--  Process  --
	---------------
	process (MuxSel, s_soma, s_and)
	begin
		if MuxSel = '0' then
			S <= s_soma;
		elsif MuxSel = '1' then
			S <= s_and;
		else 
			S <= "00000"; --Valor default caso nenhuma opção seja válida. No caso do mux atual que possui so um bit nao sera utilizado
		end if;
	end process;
	--up_edge
	
end ula;
