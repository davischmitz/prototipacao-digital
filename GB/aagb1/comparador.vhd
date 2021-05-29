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

--O n�mero de bits das entradas Ab e Bb � definido pelo GENERIC NUM_BITS do tipo inteiro
--------------------------------------------------------------------------------
--Bibliotecas
--------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	
-------------------------------------------------------------------------------
-- Entidade
-------------------------------------------------------------------------------
entity comparador is
--Declaração dos generics------------------------------------------------------
  generic (
		NUM_BITS : INTEGER := 2 --utilizado para sintetizar o projeto, precisa setar para saber quantos bits utilizar na entrada
	);
	
--Declaração das entradas e saídas---------------------------------------------
  port (
		A  	: in   STD_LOGIC_VECTOR(NUM_BITS-1 downto 0); --para dimensionar A de acordo com NUM_BITS
		B    	: in   STD_LOGIC_VECTOR(NUM_BITS-1 downto 0);
		s_ma 	: out  STD_LOGIC;
		s_me 	: out  STD_LOGIC
  );
end comparador;

--------------------------------------------------------------------------------
--Descrição da lógica
--------------------------------------------------------------------------------
architecture comparador of comparador is
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
	signal auxiliar_tl: std_logic :='0';
	
begin
	------------------
	-- Port Mapping --
	------------------



	
	
	instancia1 : entity work.cbits
				port map (
					x2	=> x3,
					y2 => y3,
					z2 => z3,
					s2	=> auxiliar_tl
				);
	
	instancia2 : entity work.cbits
				port map (
					x1	=> auxiliar_tl,
					y1 	=> w3,
					s1	=> s3
				);
	-----------------------------
	-- Atribuições Assíncronas --
	-----------------------------	
--	s3 <= auxiliar_tl xor w3;
	---------------
	-- Processos --
	---------------

	
end comparador;