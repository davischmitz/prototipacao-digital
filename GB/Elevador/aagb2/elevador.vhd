-----------------------------------------------------------------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : top_level.vhd
-- NAME         : top_level de três pavimentos
-- PROJECT      : 
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Implementação através do uso de máquina de estado de Moore e com uso de descrição de HW estrutural, o projeto de controle de um top_level de três andares
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
entity top_level is
--Declaracao dos generics------------------------------------------------------
  
--Declaracao das entradas e saidas---------------------------------------------
  port (
   Andar1              : IN std_logic;
	Andar2              : IN std_logic;
	Andar3              : IN std_logic;
	Porta               : IN std_logic;
	Emergencia          : IN std_logic;
	SensorFimDeCurso	  : IN   STD_LOGIC;
	Motor_Subindo       : OUT std_logic;    
	Motor_Descendo      : OUT std_logic;    
	LED                 : OUT std_logic_vector(2 downto 0)
	Alarme              : OUT std_logic_vector(3 downto 0)
  );
end top_level;

--------------------------------------------------------------------------------
--Declaracao da logica
--------------------------------------------------------------------------------
architecture top_level of top_level is
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
	--aqui vai uma lógica básica, das portas e tal 
	--no arquivo da FSM vai a lógica mais 'pesada'
	---------------
	-- Processos --
	--arquivo TOP LEVEL não deve ter processo
	---------------

	
end top_level;