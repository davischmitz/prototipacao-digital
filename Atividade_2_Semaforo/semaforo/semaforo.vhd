-------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : semaforo.vhd
-- NAME         : 
-- PROJECT      : Controle de um sem�foro de tr�nsito
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : 
-- DEPENDENCIES : 
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- LIBRARY
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-------------------------------------------------------------------------------
-- ENTITY
-------------------------------------------------------------------------------

entity semaforo is
	port (
    S1: IN std_logic;
    S0: IN std_logic;

    MR: OUT std_logic;
    MY: OUT std_logic;
    MG: OUT std_logic;
    SR: OUT std_logic;
    SY: OUT std_logic;
    SG: OUT std_logic;
    TL: OUT std_logic;
    TS: OUT std_logic
  );
end semaforo;

-------------------------------------------------------------------------------
-- ARCHITECTURE
-------------------------------------------------------------------------------
architecture semaforo of semaforo is
    -----------------------------------
	-- Types 
	-----------------------------------

	
	-----------------------------------
	-- Constants
	-----------------------------------
	
	
	-----------------------------------
	-- Statments of components
	-----------------------------------
	
	
	
	-----------------------------------
	-- Statments of signals
	-----------------------------------
  signal so1: std_logic := '0';
  signal so2: std_logic := '0';
  signal so3: std_logic := '0';
  signal so4: std_logic := '0';

 	------------------
	-- Port Mapping --
	------------------
begin
	-----------------------------
	-- Asynchronous assignments --
	-----------------------------
  so1 <= not S1 and not S0;
  so2 <= not S1 and S0;
  so3 <= S1 and S0;
  so4 <= S1 and not S0;

  MR <= so3 or so4;
  MY <= so2;
  MG <= so1;
  SR <= so1 or so2;
  SY <= so4;
  SG <= so3;
  TL <= so1 or so3;
  TS <= so2 or so4;
  ---------------
	--  Process  --
	---------------
	--up_edge
	
end semaforo;
