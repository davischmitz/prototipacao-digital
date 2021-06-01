-----------------------------------------------------------------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : cbits.vhd
-- NAME         : 
-- PROJECT      : 
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : 
-- DEPENDENCIES : 

--------------------------------------------------------------------------------
--Bibliotecas
--------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use IEEE.STD_LOGIC_ARITH.ALL;    --operacoes aritmeticas
	use IEEE.STD_LOGIC_UNSIGNED.ALL; --para trabalhar com numeros sem sinal 

-------------------------------------------------------------------------------
-- Entidade
-------------------------------------------------------------------------------
entity cbits is
--Declaracao dos generics------------------------------------------------------
  
--Declaracao das entradas e saidas---------------------------------------------
  port (
	Ab	: in   STD_LOGIC;
	Bb 	: in   STD_LOGIC;
	e_ma 	: in   STD_LOGIC;
	e_me  : in   STD_LOGIC;
	s_ma 	: out  STD_LOGIC;
	s_me  : out  STD_LOGIC
  );
end cbits;

--------------------------------------------------------------------------------
--Declaracao da logica
--------------------------------------------------------------------------------
architecture cbits of cbits is
	-----------------------------------
	-- Tipos 
	-----------------------------------

	
	-----------------------------------
	-- Constantes
	-----------------------------------
	
	
	-----------------------------------
	-- Declaracoes de componentes
	-----------------------------------
	
	-----------------------------------
	-- Declaracoes de sinais
	-----------------------------------
	
	
begin
	------------------
	-- Port Mapping --
	------------------
	
	-----------------------------
	-- Atribuicoes Assincronas --
	-----------------------------	

	---------------
	-- Processos --
	process (Ab, Bb, e_ma, e_me)
	begin
		--primeira verificação
		if (Ab > Bb) then
			s_ma <= '1';
			s_me <= '0';
		elsif (Ab < Bb) then
			s_ma <= '0';
			s_me <= '1';
		elsif (Ab = Bb) then
			s_ma <= '0';
			s_me <= '0';
		end if;
		--segunda verificação para prioridade do bit mais significativo
		if(e_ma = '1') then
			s_ma <= '1';
			s_me <= '0';
		elsif(e_me = '1') then
			s_ma <= '0';
			s_me <= '1';
		end if;
	end process;
	---------------

	
end cbits;