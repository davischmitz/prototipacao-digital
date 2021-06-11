-----------------------------------------------------------------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : fsm.vhd
-- NAME         : FSM
-- PROJECT      : Elevador de três pavimentos
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Implementação através do uso de máquina de estado de Moore e com uso de descrição de HW estrutural, o projeto de controle de um fsm de três andares
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
entity fsm is
--Declaracao dos generics------------------------------------------------------
  
--Declaracao das entradas e saidas---------------------------------------------
  port (
		Andar1              : IN std_logic;
		Andar2              : IN std_logic;
		Andar3              : IN std_logic;
		Porta               : IN std_logic;
		Emergencia          : IN std_logic;
		SensorFimDeCurso	  : IN std_logic;
		Motor_Subindo       : OUT std_logic;    
		Motor_Descendo      : OUT std_logic;    
		LED                 : OUT std_logic_vector(2 downto 0);
		Alarme              : OUT std_logic_vector(3 downto 0)
  );
end fsm;

--------------------------------------------------------------------------------
--Declaracao da logica
--------------------------------------------------------------------------------
architecture fsm of fsm is
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
	--pode ter processos
	---------------

	
end fsm;