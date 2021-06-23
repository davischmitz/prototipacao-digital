-----------------------------------------------------------------------------------------------------------------------------------------
-- Company: UNISINOS 
-- Engineer:
-- Create Date: 
-- Design Name: 
-- Component Name: 
-- Target Device: 
-- Tool versions: ISE 14.7
-- Description: 
--    
-- Dependencies: 
--    
-- Revision:
--    
-- Additional Comments: 

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--Libraries
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
-------------------------------------------------------------------------------
-- Entity
-------------------------------------------------------------------------------  
ENTITY elevador_tb IS
--Declara��o dos generics------------------------------------------------------
	
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
         clock : IN  std_logic;
			   reset : IN std_logic;
         sensor_porta : IN  std_logic;
         sensor_incendio : IN  std_logic;
         btn_emergencia : IN  std_logic;
         FC1 : IN  std_logic;
         FC2 : IN  std_logic;
         FC3 : IN  std_logic;
         btn_andar_1_interno : IN  std_logic;
         btn_andar_1_externo : IN  std_logic;
         btn_andar_2_interno : IN  std_logic;
         btn_andar_2_externo : IN  std_logic;
         btn_andar_3_interno : IN  std_logic;
         btn_andar_3_externo : IN  std_logic;

         motor_subindo: OUT std_logic;
         motor_descendo: OUT std_logic;
         indicador_andar_1: OUT std_logic;
         indicador_andar_2: OUT std_logic;
         indicador_andar_3: OUT std_logic;
         indicador_subindo: OUT std_logic;
         indicador_descendo: OUT std_logic;
         alarme_emergencia: OUT std_logic;
         trava_porta: OUT std_logic
        );
    END COMPONENT;
    

   -----------------------------------
	-- Declaration of Signals
	-----------------------------------
	
	--Inputs
  signal clock : std_logic := '0';
	signal reset : std_logic := '0';
  signal sensor_porta : std_logic := '0';
  signal sensor_incendio : std_logic := '0';
  signal btn_emergencia : std_logic := '0';
  signal FC1 : std_logic := '0';
  signal FC2 : std_logic := '0';
  signal FC3 : std_logic := '0';
  signal btn_andar_1_interno : std_logic := '0';
  signal btn_andar_1_externo : std_logic := '0';
  signal btn_andar_2_interno : std_logic := '0';
  signal btn_andar_2_externo : std_logic := '0';
  signal btn_andar_3_interno : std_logic := '0';
  signal btn_andar_3_externo : std_logic := '0'; 
  --Outputs
  signal motor_subindo : std_logic := '0';
  signal motor_descendo : std_logic := '0';
  signal indicador_andar_1 : std_logic := '0';
  signal indicador_andar_2 : std_logic := '0';
  signal indicador_andar_3 : std_logic := '0';
  signal indicador_subindo : std_logic := '0';
  signal indicador_descendo : std_logic := '0';
  signal alarme_emergencia : std_logic := '0';
  signal trava_porta : std_logic := '0';

   -- Clock period definitions
	constant C_period : time := 13 ns; 
	constant tempo_processo : time := 14 ns;
 
BEGIN
 
	------------------
	-- Port Mapping --
	------------------
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
		clock <= '0';
		wait for C_period/2;
		clock <= '1';
		wait for C_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
    
    reset <= '1';
		wait for tempo_processo;
		reset <= '0';
		
    -- Elevador no primeiro andar, chamado nos andares 2 e 3
    sensor_porta <= '1';
		sensor_incendio <= '1';
		btn_emergencia <= '1';
		FC1 <= '1';
		FC2 <= '0';
		FC3 <= '0';
		btn_andar_1_interno <= '0';
		btn_andar_1_externo <= '0';
		btn_andar_2_interno <= '1';
		btn_andar_2_externo <= '0';
		btn_andar_3_interno <= '0';
		btn_andar_3_externo <= '1';
		
		wait for tempo_processo;
    wait for tempo_processo;
		
    -- Elevador no segundo andar, chamado no andar 3
		sensor_porta <= '1';
		sensor_incendio <= '1';
		btn_emergencia <= '1';
		FC1 <= '0';
		FC2 <= '1';
		FC3 <= '0';
		btn_andar_1_interno <= '0';
		btn_andar_1_externo <= '0';
		btn_andar_2_interno <= '0';
		btn_andar_2_externo <= '0';
		btn_andar_3_interno <= '0';
		btn_andar_3_externo <= '1';

    wait for tempo_processo;
    wait for tempo_processo;

    -- Elevador no 3 andar
		sensor_porta <= '1';
		sensor_incendio <= '1';
		btn_emergencia <= '1';
		FC1 <= '0';
		FC2 <= '0';
		FC3 <= '1';
		btn_andar_1_interno <= '0';
		btn_andar_1_externo <= '0';
		btn_andar_2_interno <= '0';
		btn_andar_2_externo <= '0';
		btn_andar_3_interno <= '0';
		btn_andar_3_externo <= '1';

    wait for tempo_processo;
    wait for tempo_processo;

    -- Elevador no 3 andar chamado no andar 1
    sensor_porta <= '1';
    sensor_incendio <= '1';
    btn_emergencia <= '1';
    FC1 <= '0';
    FC2 <= '0';
    FC3 <= '1';
    btn_andar_1_interno <= '1';
    btn_andar_1_externo <= '0';
    btn_andar_2_interno <= '0';
    btn_andar_2_externo <= '0';
    btn_andar_3_interno <= '0';
    btn_andar_3_externo <= '0';

    wait for tempo_processo;
    wait for tempo_processo;

    -- Elevador no 2 andar chamado no andar 1
    sensor_porta <= '1';
    sensor_incendio <= '1';
    btn_emergencia <= '1';
    FC1 <= '0';
    FC2 <= '1';
    FC3 <= '0';
    btn_andar_1_interno <= '1';
    btn_andar_1_externo <= '0';
    btn_andar_2_interno <= '0';
    btn_andar_2_externo <= '0';
    btn_andar_3_interno <= '0';
    btn_andar_3_externo <= '0';
    
    wait for tempo_processo;
    wait for tempo_processo;

    -- Elevador no 1 andar
    sensor_porta <= '1';
    sensor_incendio <= '1';
    btn_emergencia <= '1';
    FC1 <= '1';
    FC2 <= '0';
    FC3 <= '0';
    btn_andar_1_interno <= '1';
    btn_andar_1_externo <= '0';
    btn_andar_2_interno <= '0';
    btn_andar_2_externo <= '0';
    btn_andar_3_interno <= '0';
    btn_andar_3_externo <= '0';
    
    
    wait;
   end process;

END;