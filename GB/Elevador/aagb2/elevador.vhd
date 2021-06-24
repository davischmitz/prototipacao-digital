-----------------------------------------------------------------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : elevador.vhd
-- NAME         : 
-- PROJECT      : Elevador de tres pavimentos
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Implementar atraves do uso de maquina de estado de Moore e com uso de descricao de HW estrutural, o projeto de controle de um fsm de tres andares
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
	 clock		             : IN std_logic;
	 reset						 : IN std_logic;
    sensor_porta            : IN std_logic; -- Sensor de porta (aberta/fechada)
    sensor_incendio         : IN std_logic; -- Sensor de incêndio
    btn_emergencia          : IN std_logic; -- Botão de emergência
    FC1                     : IN std_logic; -- Fim de curso do andar 1
    FC2                     : IN std_logic; -- Fim de curso do andar 2
    FC3                     : IN std_logic; -- Fim de curso do andar 3
    btn_andar_1_interno     : IN std_logic;
    btn_andar_1_externo     : IN std_logic;
    btn_andar_2_interno     : IN std_logic;
    btn_andar_2_externo     : IN std_logic;
    btn_andar_3_interno     : IN std_logic;
    btn_andar_3_externo     : IN std_logic;

    motor_subindo           : OUT std_logic; -- Estado do motor subindo
    motor_descendo          : OUT std_logic; -- Estado do motor descendo
    indicador_andar_1       : OUT std_logic;
    indicador_andar_2       : OUT std_logic;
    indicador_andar_3       : OUT std_logic;
    indicador_subindo       : OUT std_logic;
    indicador_descendo      : OUT std_logic;
    alarme_emergencia       : OUT std_logic; -- Alarme de emergencia
    trava_porta             : OUT std_logic -- Medida de seguranca
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
  signal estado_aux: std_logic_vector(2 downto 0);
	
begin
	------------------
	-- Port Mapping --
	------------------
  estados: entity work.controle_estados
			port map (
		  clock => clock,
        reset => reset,
        sensor_porta => sensor_porta,
        sensor_incendio => sensor_incendio,
        btn_emergencia => btn_emergencia,
        FC1 => FC1,
        FC2 => FC2,
        FC3 => FC3,
        btn_andar_1_interno => btn_andar_1_interno,
        btn_andar_1_externo => btn_andar_1_externo,
        btn_andar_2_interno => btn_andar_2_interno,
        btn_andar_2_externo => btn_andar_2_externo,
        btn_andar_3_interno => btn_andar_3_interno,
        btn_andar_3_externo => btn_andar_3_externo,
        saida_estado => estado_aux
			);
  saidas: entity work.controle_saidas
      port map (
        entrada_estado => estado_aux,
        motor_subindo => motor_subindo,
        motor_descendo => motor_descendo,
        indicador_andar_1 => indicador_andar_1,
        indicador_andar_2 => indicador_andar_2,
        indicador_andar_3 => indicador_andar_3,
        indicador_subindo => indicador_subindo,
        indicador_descendo => indicador_descendo,
        alarme_emergencia => alarme_emergencia,
        trava_porta => trava_porta
      );
	
	-----------------------------
	-- Atribuicoes Assincronas --
	-----------------------------	

	---------------
	-- Processos --
	---------------

	
end elevador;