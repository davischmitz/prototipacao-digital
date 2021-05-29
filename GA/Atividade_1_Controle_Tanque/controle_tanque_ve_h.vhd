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
use IEEE.STD_LOGIC_ARITH.ALL; --operacoes aritmeticas
use IEEE.STD_LOGIC_UNSIGNED.ALL; --para trabalhar com numeros sem sinal

-------------------------------------------------------------------------------
-- ENTITY
-------------------------------------------------------------------------------

entity controle_tanque is
	port (
		Lh				: IN std_logic;
		LI				: IN std_logic;
		Th			   : IN std_logic;
      Tc			   : IN std_logic;
		Ve		      : OUT std_logic;
		--Vs	         : OUT std_logic;
		H	         : OUT std_logic--;
		--A		      : OUT std_logic
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
  signal aux6_s: std_logic := '0';
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
	  process (Lh, LI, Th, Tc)
		  begin
			 aux1_s <= NOT Lh; -- /Lh
			 aux2_s <= NOT Tc; -- /Tc
			 aux3_s <= NOT Th; -- /Th
			 aux4_s <= aux2_s OR aux3_s; -- /Tc + /Th                  ta dando U
			 Ve <= aux1_s AND aux4_s; -- /Lh (/Tc + /Th)
			 aux5_s <= LI OR aux1_s; --LI + /Lh                 ta dando U
			 aux6_s <= aux3_s AND Tc; --/Th.Tc
			 H <= aux6_s AND aux5_s;
	  end process;
	--up_edge
	
end controle_tanque;
