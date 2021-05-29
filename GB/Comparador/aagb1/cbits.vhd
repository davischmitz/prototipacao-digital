-----------------------------------------------------------------------------------------------------------------------------------------
-- Engineer: 
-- Create Date: 
-- Design Name: 
-- Component Name: 
-- Target Device: 
-- Tool versions: 
-- Description: 
--    
-- Dependencies:
--    
-- Revision:
--    
-- Additional Comments: 


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
--Declaração dos generics------------------------------------------------------
  
--Declaração das entradas e saídas---------------------------------------------
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
--Descrição da lógica
--------------------------------------------------------------------------------
architecture cbits of cbits is
	-----------------------------------
	-- Tipos 
	-----------------------------------

	
	-----------------------------------
	-- Constantes
	-----------------------------------
	
	
	-----------------------------------
	-- Declarações de componentes
	-----------------------------------
	
	-----------------------------------
	-- Declarações de sinais
	-----------------------------------
	
	
begin
	------------------
	-- Port Mapping --
	------------------
	
	-----------------------------
	-- Atribuições Assíncronas --
	-----------------------------	

	---------------
	-- Processos --
	process (Ab, Bb, e_ma, e_me)
	begin
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