-----------------------------------------------------------------------------------------------------------------------------------------
-- UNISINOS - Universidade do Vale do Rio dos Sinos 
-- DESIGN NAME  : controle_estados.vhd
-- NAME         : 
-- PROJECT      : Elevador de tres pavimentos
-- AUTHOR       : Aline Nunes e Davi Schmitz
-- FINALITY     : Modulo que decide se pode trocar de um estado para o outro
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
entity controle_estados is
--Declaracao dos generics------------------------------------------------------
  
--Declaracao das entradas e saidas---------------------------------------------
  port (
    --Inputs
    clock		            : IN std_logic;
	 reset						: IN std_logic;
    sensor_porta           : IN std_logic; -- seguranca ok: nivel logico alto se refere a porta travada, fechada
    sensor_incendio        : IN std_logic; -- seguranca ok: nivel logico alto se refere a sensor de incendio não ativo
    btn_emergencia         : IN std_logic; -- seguranca ok: nivel logico alto se refere a botao de emergencia não ativo
    FC1                    : IN std_logic; -- Fim de curso do andar 1: nivel lógico alto
    FC2                    : IN std_logic; -- Fim de curso do andar 2: nivel lógico alto
    FC3                    : IN std_logic; -- Fim de curso do andar 3: nivel lógico alto
    btn_andar_1_interno    : IN std_logic;
    btn_andar_1_externo    : IN std_logic;
    btn_andar_2_interno    : IN std_logic;
    btn_andar_2_externo    : IN std_logic;
    btn_andar_3_interno    : IN std_logic;
    btn_andar_3_externo    : IN std_logic;
	 
	 --Outputs
    saida_estado           : OUT std_logic_vector(2 downto 0) -- a saida do modulo e um vetor com saidas de 3 bits
										-- saida_estado 
										-- 000 ANDAR1
										-- 001 ANDAR2
										-- 010 ANDAR3
										-- 100 SUBINDO
										-- 101 DESCENDO
										-- 110 EMERGENCIA
  );
end controle_estados;

--------------------------------------------------------------------------------
--Declaracao da logica
--------------------------------------------------------------------------------
architecture controle_estados of controle_estados is
	-----------------------------------
	-- Tipos 
	-----------------------------------
  TYPE State_type IS (ANDAR1, ANDAR2, ANDAR3, SUBINDO, DESCENDO, EMERGENCIA); -- Tipo Enumerado para definir os Estados da FSM
	
	-----------------------------------
	-- Constantes
	-----------------------------------
	
	
	-----------------------------------
	-- Declaracoes de componentes
	-----------------------------------
	
	-----------------------------------
	-- Declaracoes de sinais
	-----------------------------------
  signal estado: State_type; -- inicializacao do sinal estado com os estados da FSM

  signal btn_andar_1: std_logic := '0';
  signal btn_andar_2: std_logic := '0';
  signal btn_andar_3: std_logic := '0';

  signal checklist_seguranca: std_logic := '0'; -- sinal para verificacoes de seguranca: sensor_porta, sensor_incendio e btn_emergencia tem que estar em um, ou seja, situacao segura para uso do elevador 

  signal fins_de_curso_andar_1: std_logic := '0';
  signal fins_de_curso_andar_2: std_logic := '0';
  signal fins_de_curso_andar_3: std_logic := '0';
	
begin
	------------------
	-- Port Mapping --
	------------------
	
	-----------------------------
	-- Atribuicoes Assincronas --
	-----------------------------	
  -- Botoes internos e externos sao convertidos em um unico sinal
  btn_andar_1 <= btn_andar_1_interno or btn_andar_1_externo;
  btn_andar_2 <= btn_andar_2_interno or btn_andar_2_externo;
  btn_andar_3 <= btn_andar_3_interno or btn_andar_3_externo;

  checklist_seguranca <= sensor_porta and sensor_incendio and btn_emergencia;
  
  fins_de_curso_andar_1  <= FC1 and (not FC2) and (not FC3); --so o fim de curso no andar de 1 ativo
  fins_de_curso_andar_2  <= (not FC1) and FC2 and (not FC3); --so o fim de curso no andar de 2 ativo
  fins_de_curso_andar_3  <= (not FC1) and (not FC2) and FC3; --so o fim de curso no andar de 3 ativo
  
	---------------
	-- Processos --
	---------------
  process(clock, 
			 reset,
          checklist_seguranca, 
          fins_de_curso_andar_1, 
          fins_de_curso_andar_2, 
          fins_de_curso_andar_3, 
          btn_andar_1, 
          btn_andar_2, 
          btn_andar_3)
  begin
	 if reset = '1' then -- ao ativar o reset, o estado andar1 fica ativo  
      saida_estado <= "000";
		estado <= ANDAR1;
	 --se o clock estiver na borda de subida e o reset nao estiver ativo
    elsif rising_edge(clock) and reset = '0' then --rising_edge para usar a borda de subida de clock pra trocar os estados
      case estado is
        when ANDAR1 =>
          saida_estado <= "000";
          -- verificacoes de seguranca
          if (checklist_seguranca = '1' and fins_de_curso_andar_1 = '1') then
            -- subindo
            if ((btn_andar_1 = '0') and ((btn_andar_2 = '1') or (btn_andar_3 = '1'))) then
              estado <= SUBINDO; -- elevador foi chamado no andar 2 ou 3
            else 
              estado <= ANDAR1; -- permanece no mesmo estado
            end if;
          else 
              estado <= EMERGENCIA;
          end if;

        when ANDAR2 =>
          saida_estado <= "001";
          -- verificacoes de seguranca
          if (checklist_seguranca = '1' and fins_de_curso_andar_2 = '1') then
            -- subindo
            if ((btn_andar_1 = '0') and btn_andar_2 = '0' and btn_andar_3 = '1') then
              estado <= SUBINDO;  -- elevador foi chamado no andar 3
            -- descendo
            elsif (btn_andar_1 = '1' and btn_andar_2 = '0' and btn_andar_3 = '0') then
              estado <= DESCENDO;
            else 
              estado <= ANDAR2;
            end if;
          else 
              estado <= EMERGENCIA;
          end if;

        when ANDAR3 => 
          saida_estado <= "010";
          -- verificacoes de seguranca
          if (checklist_seguranca = '1' and fins_de_curso_andar_3 = '1') then
            -- descendo
            if ((btn_andar_1 = '1' or btn_andar_2 = '1') and btn_andar_3 = '0') then
              estado <= DESCENDO;
            else 
              estado <= ANDAR3;
            end if;
          else 
              estado <= EMERGENCIA;
          end if;

        when SUBINDO =>
          saida_estado <= "100";
          -- verificacoes de seguranca
          if (checklist_seguranca = '1') then
            if (fins_de_curso_andar_2 = '1' and (btn_andar_2 = '1' or btn_andar_3 = '1')) then
              -- subindo para o andar 2
              estado <= ANDAR2;
            elsif (fins_de_curso_andar_3 = '1' and btn_andar_3 = '1') then
              -- subindo para o andar 3
              estado <= ANDAR3;
            else 
              estado <= SUBINDO;
            end if;
          else 
              estado <= EMERGENCIA;
          end if;

        when DESCENDO =>
          saida_estado <= "101"; 
          if (checklist_seguranca = '1') then
            if (fins_de_curso_andar_2 = '1' and (btn_andar_2 = '1' or btn_andar_1 = '1')) then
              -- descendo para o andar 2
              estado <= ANDAR2;
            elsif (fins_de_curso_andar_1 = '1' and btn_andar_1 = '1') then
              -- descendo para o andar 1
              estado <= ANDAR1;
            else 
              estado <= DESCENDO;
            end if;
          else 
            estado <= EMERGENCIA;
          end if;

        when EMERGENCIA => 
          saida_estado <= "110";
      end case;
    end if;
  end process;


	
end controle_estados;