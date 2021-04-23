-------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : controle_tanque.vhd
-- NAME         : 
-- PROJECT      : Controle Tanque
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : 
-- DEPENDENCIES : 
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- LIBRARY
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------------------------
-- ENTITY
-------------------------------------------------------------------------------

entity controle_tanque is
	port (
    Lh: IN std_logic;
    Ll: IN std_logic;
    Th: IN std_logic;
    Tc: IN std_logic;
    Vs: OUT std_logic;
    A: OUT std_logic
  );
end controle_tanque;

-------------------------------------------------------------------------------
-- ARCHITECTURE
-------------------------------------------------------------------------------
architecture controle_tanque of controle_tanque is
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
  signal aux1_s: std_logic := '0';
  signal aux2_s: std_logic := '0';
  signal aux3_s: std_logic := '0';
  signal aux4_s: std_logic := '0';
  signal aux5_s: std_logic := '0';

 	------------------
	-- Port Mapping --
	------------------
begin
	-----------------------------
	-- Asynchronous assignments --
	-----------------------------

  ---------------
	--  Process  --
	---------------
	--up_edge
  process (Lh, Ll, Th, Tc)
  begin
    aux1_s <= not Th;
    aux2_s <= not Tc;
    aux3_s <= aux1_s and aux2_s;
    Vs <= aux3_s and Ll;
    aux4_s <= not Ll;
    aux5_s <= aux4_s and Lh;
    A <= aux5_s or Th;
  end process;
	
end controle_tanque;
