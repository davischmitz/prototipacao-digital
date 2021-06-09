-----------------------------------------------------------------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : elevador.vhd
-- NAME         : Elevador de tr�s pavimentos
-- PROJECT      : 
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Implementa��o atrav�s do uso de m�quina de estado de Moore e com uso de descri��o de HW estrutural, o projeto de controle de um elevador de tr�s andares
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
entity elevador is
--Declaracao dos generics------------------------------------------------------
  
--Declaracao das entradas e saidas---------------------------------------------
  port (
	SensorFimDeCurso	   : IN   STD_LOGIC;
	BtnAcionamentoAndar 	: IN   STD_LOGIC;
	Alarme               : IN  std_logic_vector(3 downto 0)
  );
end elevador;

--------------------------------------------------------------------------------
--Declaracao da logica
--------------------------------------------------------------------------------
architecture elevador of elevador is
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
	--arquivo TOP LEVEL n�o deve ter processo
	---------------

	
end elevador;