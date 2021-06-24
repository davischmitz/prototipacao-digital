-----------------------------------------------------------------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : controle_saidas.vhd
-- NAME         : 
-- PROJECT      : Elevador de tres pavimentos
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Controle de saidas 
-- DEPENDENCIES : Modulo com uma entrada que recebe o vetor de saida do modulo de controle de estados para realizar o controle das saidas (estado do motor, indicadores, alarmes, seguranca de travamento de porta)

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
    entrada_estado          : IN std_logic_vector(2 downto 0); -- recebe valor do vetor de saida do modulo de controle_estados de 3 bits
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
    motor_subindo      <= '0';
    motor_descendo     <= '0';
    indicador_andar_1  <= '0';
    indicador_andar_2  <= '0';
    indicador_andar_3  <= '0';
    indicador_subindo  <= '0';
    indicador_descendo <= '0';
    alarme_emergencia  <= '0';
    trava_porta        <= '1'; -- porta travada por default 
										 -- indicadores das portas sao para saber se ela ta aberta
										 -- mas a porta so pode ser aberta quando esta destravada, 
										 -- ou seja, nivel logico baixo, '0', no trava_porta

	  case entrada_estado is
      when "000" => -- ANDAR1
        indicador_andar_1 <= '1';
        trava_porta <= '0';
      when "001" => -- ANDAR2
        indicador_andar_2 <= '1';
        trava_porta <= '0';
      when "010" => -- ANDAR3
        indicador_andar_3 <= '1';
        trava_porta <= '0';
      when "100" => -- SUBINDO
        indicador_subindo <= '1';
        motor_subindo <= '1';
      when "101" => -- DESCENDO
        indicador_descendo <= '1';
        motor_descendo <= '1';
      when "110" => -- EMERGENCIA
        alarme_emergencia <= '1';
	   when others => -- por precaucao tambem contemplamos esse estado
		  alarme_emergencia <= '1';
    end case;
  end process;

end controle_saidas;