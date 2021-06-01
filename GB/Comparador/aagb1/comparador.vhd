-----------------------------------------------------------------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : comparador.vhd
-- NAME         : 
-- PROJECT      : AA01GB
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Desenvolver em VHDL a descrição de HW de um circuito comparador de dois números 'A' e 'B'. O circuito deve detectar se 'A' e maior, menor ou igual ao valor de 'B'
-- DEPENDENCIES : 
-- Additional Comments: 

--O número de bits das entradas Ab e Bb é definido pelo GENERIC NUM_BITS do tipo inteiro
--------------------------------------------------------------------------------
--Bibliotecas
--------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	
-------------------------------------------------------------------------------
-- Entidade
-------------------------------------------------------------------------------
entity comparador is
--Declaracao dos generics------------------------------------------------------
  generic (
		NUM_BITS : INTEGER := 4 --utilizado para sintetizar o projeto, precisa setar para saber quantos bits utilizar na entrada
	);
	
--Declaracao das entradas e saidas---------------------------------------------
  port (
		A  	: in   STD_LOGIC_VECTOR(NUM_BITS-1 downto 0); --para dimensionar A de acordo com NUM_BITS
		B    	: in   STD_LOGIC_VECTOR(NUM_BITS-1 downto 0);
		s_ma 	: out  STD_LOGIC;
		s_me 	: out  STD_LOGIC
  );
end comparador;

--------------------------------------------------------------------------------
--Declaracao da logica
--------------------------------------------------------------------------------
architecture comparador of comparador is
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
	signal s_ma_aux: std_logic_vector(NUM_BITS downto 0) := (others => '0');
	signal s_me_aux: std_logic_vector(NUM_BITS downto 0) := (others => '0');
	
begin
	------------------
	-- Port Mapping --
	------------------
	comparador : for i in 0 to NUM_BITS - 1 generate 
	instancia: entity work.cbits
			port map (
				Ab	=> A(i),
				Bb => B(i),
				e_ma => s_ma_aux(i+1),
				e_me => s_me_aux(i+1),
				s_ma => s_ma_aux(i),
				s_me => s_me_aux(i)
			);
	end generate;
	-----------------------------
	-- Atribuicoes Assincronas --
	-----------------------------	
   s_ma <= s_ma_aux(0);
	s_me <= s_me_aux(0);
	---------------
	-- Processos --
	---------------

	
end comparador;