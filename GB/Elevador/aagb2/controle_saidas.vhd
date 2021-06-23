-----------------------------------------------------------------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : controle_saidas.vhd
-- NAME         : 
-- PROJECT      : Elevador de tr�s pavimentos
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Implementa��o atrav�s do uso de m�quina de estado de Moore e com uso de descri��o de HW estrutural, o projeto de controle de um fsm de tr�s andares
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
entity controle_saidas is
--Declaracao dos generics------------------------------------------------------
  
--Declaracao das entradas e saidas---------------------------------------------
  port (
    entrada_estado          : IN std_logic_vector(2 downto 0);
    motor_subindo           : OUT std_logic;
    motor_descendo          : OUT std_logic;
    indicador_andar_1       : OUT std_logic;
    indicador_andar_2       : OUT std_logic;
    indicador_andar_3       : OUT std_logic;
    indicador_subindo       : OUT std_logic;
    indicador_descendo      : OUT std_logic;
    alarme_emergencia       : OUT std_logic;
    trava_porta             : OUT std_logic
  );
end controle_saidas;

--------------------------------------------------------------------------------
--Declaracao da logica
--------------------------------------------------------------------------------
architecture controle_saidas of controle_saidas is
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
	---------------
  process(entrada_estado)
  begin
    -- default values
    motor_subindo <= '0';
    motor_descendo <= '0';
    indicador_andar_1 <= '0';
    indicador_andar_2 <= '0';
    indicador_andar_3 <= '0';
    indicador_subindo <= '0';
    indicador_descendo <= '0';
    alarme_emergencia <= '0';
    trava_porta <= '1'; -- porta travada por default

	  case entrada_estado is
      when "000" => 
        indicador_andar_1 <= '1';
        trava_porta <= '0';
      when "001" =>
        indicador_andar_2 <= '1';
        trava_porta <= '0';
      when "010" => 
        indicador_andar_3 <= '1';
        trava_porta <= '0';
      when "100" =>
        indicador_subindo <= '1';
        motor_subindo <= '1';
      when "101" =>
        indicador_descendo <= '1';
        motor_descendo <= '1';
      when "110" =>
        alarme_emergencia <= '1';
	   when others =>
		  alarme_emergencia <= '1';
    end case;
  end process;


	
end controle_saidas;