-----------------------------------------------------------------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : elevador_tb.vhd
-- NAME         : 
-- PROJECT      : Elevador de tres pavimentos
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Testbench abrangente do funcionamento do elevador
-- DEPENDENCIES : 

--------------------------------------------------------------------------------
--Bibliotecas
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
-------------------------------------------------------------------------------
-- Entity
-------------------------------------------------------------------------------  
ENTITY elevador_tb IS
--Declaracao dos generics------------------------------------------------------
	
--Declaration of input and output data---------------------------------------------
END elevador_tb;
 
--------------------------------------------------------------------------------
--Description of behaviour
--------------------------------------------------------------------------------
ARCHITECTURE behavior OF elevador_tb IS 
 
    -----------------------------------
	-- Types 
	-----------------------------------

	
	-----------------------------------
	-- Constants
	-----------------------------------
	
	
	-----------------------------------
	-- Declaration of components
	-----------------------------------
 
    COMPONENT elevador
    PORT(
         clock               : IN  std_logic;
			reset               : IN  std_logic;
         sensor_porta        : IN  std_logic;
         sensor_incendio     : IN  std_logic;
         btn_emergencia      : IN  std_logic;
         FC1                 : IN  std_logic;
         FC2                 : IN  std_logic;
         FC3                 : IN  std_logic;
         btn_andar_1_interno : IN  std_logic;
         btn_andar_1_externo : IN  std_logic;
         btn_andar_2_interno : IN  std_logic;
         btn_andar_2_externo : IN  std_logic;
         btn_andar_3_interno : IN  std_logic;
         btn_andar_3_externo : IN  std_logic;

         motor_subindo       : OUT std_logic;
         motor_descendo      : OUT std_logic;
         indicador_andar_1   : OUT std_logic;
         indicador_andar_2   : OUT std_logic;
         indicador_andar_3   : OUT std_logic;
         indicador_subindo   : OUT std_logic;
         indicador_descendo  : OUT std_logic;
         alarme_emergencia   : OUT std_logic;
         trava_porta         : OUT std_logic
        );
    END COMPONENT;
    

   -----------------------------------
	-- Declaration of Signals
	-----------------------------------
	
	--Inputs
  signal clock               : std_logic := '0';
  signal reset               : std_logic := '0';
  signal sensor_porta        : std_logic := '0';
  signal sensor_incendio     : std_logic := '0';
  signal btn_emergencia      : std_logic := '0';
  signal FC1                 : std_logic := '0'; -- Fim de curso do andar 1
  signal FC2                 : std_logic := '0'; -- Fim de curso do andar 2
  signal FC3                 : std_logic := '0'; -- Fim de curso do andar 3
  signal btn_andar_1_interno : std_logic := '0';
  signal btn_andar_1_externo : std_logic := '0';
  signal btn_andar_2_interno : std_logic := '0';
  signal btn_andar_2_externo : std_logic := '0';
  signal btn_andar_3_interno : std_logic := '0';
  signal btn_andar_3_externo : std_logic := '0'; 
  --Outputs
  signal motor_subindo       : std_logic := '0';
  signal motor_descendo      : std_logic := '0';
  signal indicador_andar_1   : std_logic := '0';
  signal indicador_andar_2   : std_logic := '0';
  signal indicador_andar_3   : std_logic := '0';
  signal indicador_subindo   : std_logic := '0';
  signal indicador_descendo  : std_logic := '0';
  signal alarme_emergencia   : std_logic := '0';
  signal trava_porta         : std_logic := '0';

   -- Clock period definitions
	constant C_period       : time := 13 ns; 
	constant tempo_processo : time := 50 ns; --14
 
BEGIN
 
	------------------
	-- Port Mapping --
	------------------
	--mapeamento de portas da instancia do elevador para os sinais usados para o tb
   uut: elevador PORT MAP (
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
	-- Asynchronous tasks      --
	-----------------------------
	
	
	---------------
	-- Processes --
	---------------
   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0'; -- borda de descida
		wait for C_period/2; --13/2, então fica em espera por 6.5s
		clock <= '1'; --borda de subida (rising edge)
		wait for C_period/2; --13/2, então fica em espera por 6.5s
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
    
      reset <= '1';
		wait for tempo_processo;
		reset <= '0';
		
      -- Elevador no primeiro andar, chamado nos andares 2 e 3
		--Primeiro andar para o subindo: 111100001000 OR 111100000001
      sensor_porta        <= '1'; -- nível lógico alto se refere a porta travada, fechada
		sensor_incendio     <= '1'; -- sensor de incêndio não está ativo
		btn_emergencia      <= '1'; -- botao de emergência não está ativo
		FC1                 <= '1'; -- nível lógico alto pois o elevador está no primeiro andar
		FC2                 <= '0'; -- nível baixo pois o elevador não está no segundo andar
		FC3                 <= '0'; -- nível baixo pois o elevador não está no terceiro andar
		btn_andar_1_interno <= '0';
		btn_andar_1_externo <= '0';
		btn_andar_2_interno <= '1'; 
		btn_andar_2_externo <= '0';
		btn_andar_3_interno <= '0';
		btn_andar_3_externo <= '1'; --alguém de fora do elevador chama o andar 
		
		--espera por tempo_processo s
		wait for tempo_processo;
		
      -- Elevador no segundo andar, chamado no andar 3
		-- Segundo andar para o subindo: 11101000001
		sensor_porta        <= '1'; -- nível lógico alto se refere a porta travada, fechada
		sensor_incendio     <= '1'; -- sensor de incêndio não está ativo
		btn_emergencia      <= '1'; -- botão de emergência não está ativo
		FC1                 <= '0'; 
		FC2                 <= '1'; -- nível lógico alto pois o elevador está no 2 andar
		FC3                 <= '0';
		btn_andar_1_interno <= '0';
		btn_andar_1_externo <= '0';
		btn_andar_2_interno <= '0';
		btn_andar_2_externo <= '0';
		btn_andar_3_interno <= '0';
		btn_andar_3_externo <= '1'; --alguém de fora do elevador chama o elevador no 3 andar 

		--espera por tempo_processo s
		wait for tempo_processo;

      -- Elevador no 3 andar
		-- Subindo para o Terceiro andar: 111001000001
		sensor_porta        <= '1'; -- nível lógico alto se refere a porta travada, fechada
		sensor_incendio     <= '1';
		btn_emergencia      <= '1';
		FC1                 <= '0';
		FC2                 <= '0';
		FC3                 <= '1'; -- nível lógico alto pois o elevador está no terceiro andar
		btn_andar_1_interno <= '0';
		btn_andar_1_externo <= '0';
		btn_andar_2_interno <= '0';
		btn_andar_2_externo <= '0';
		btn_andar_3_interno <= '0';
		btn_andar_3_externo <= '1';

		--espera por tempo_processo s
		wait for tempo_processo;

      -- Elevador no 3 andar chamado no andar 1
		-- Terceiro andar para o descida : 111001100000
      sensor_porta        <= '1'; -- nível lógico alto se refere a porta travada, fechada
      sensor_incendio     <= '1';
      btn_emergencia      <= '1';
      FC1                 <= '0';
      FC2                 <= '0';
      FC3                 <= '1';
      btn_andar_1_interno <= '1';
      btn_andar_1_externo <= '0';
      btn_andar_2_interno <= '0';
      btn_andar_2_externo <= '0';
      btn_andar_3_interno <= '0';
      btn_andar_3_externo <= '0';

		--espera por tempo_processo s
		wait for tempo_processo;

      -- Elevador no 2 andar chamado no andar 1
      sensor_porta        <= '1'; -- nível lógico alto se refere a porta travada, fechada
      sensor_incendio     <= '1';
      btn_emergencia      <= '1';
      FC1                 <= '0';
      FC2                 <= '1';
      FC3                 <= '0';
      btn_andar_1_interno <= '1';
      btn_andar_1_externo <= '0';
      btn_andar_2_interno <= '0';
      btn_andar_2_externo <= '0';
      btn_andar_3_interno <= '0';
      btn_andar_3_externo <= '0';
    
		--espera por tempo_processo s
		wait for tempo_processo;

      -- Elevador no 1 andar
      sensor_porta        <= '1'; -- nível lógico alto se refere a porta travada, fechada
      sensor_incendio     <= '1';
      btn_emergencia      <= '1';
      FC1                 <= '1';
      FC2                 <= '0';
      FC3                 <= '0';
      btn_andar_1_interno <= '1';
      btn_andar_1_externo <= '0';
      btn_andar_2_interno <= '0';
      btn_andar_2_externo <= '0';
      btn_andar_3_interno <= '0';
      btn_andar_3_externo <= '0';

		--espera por tempo_processo s
		wait for tempo_processo;

      --Emergencia por 2 fins de curso ativos simultaneamente
      sensor_porta        <= '1'; -- nível lógico alto se refere a porta travada, fechada
      sensor_incendio     <= '1';
      btn_emergencia      <= '1';
      FC1                 <= '1';
      FC2                 <= '1';
      FC3                 <= '0';
      btn_andar_1_interno <= '1';
      btn_andar_1_externo <= '0';
      btn_andar_2_interno <= '0';
      btn_andar_2_externo <= '0';
      btn_andar_3_interno <= '0';
      btn_andar_3_externo <= '0';

		--espera por tempo_processo s
		wait for tempo_processo;

      --Botao de emergencia pressionado
      sensor_porta        <= '1'; -- nível lógico alto se refere a porta travada, fechada
      sensor_incendio     <= '1';
      btn_emergencia      <= '0';
      FC1                 <= '1';
      FC2                 <= '0';
      FC3                 <= '0';
      btn_andar_1_interno <= '1';
      btn_andar_1_externo <= '0';
      btn_andar_2_interno <= '0';
      btn_andar_2_externo <= '0';
      btn_andar_3_interno <= '0';
      btn_andar_3_externo <= '0';
    
     wait;
	  
   end process;

END;
