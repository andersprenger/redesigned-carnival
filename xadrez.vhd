LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
LIBRARY work;

ENTITY xadrez IS
  PORT (
    clock, reset : IN STD_LOGIC;
    j1, j2 : IN STD_LOGIC;
    load : IN STD_LOGIC;
    i_value : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    contj1, contj2 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    winJ1, winJ2 : OUT STD_LOGIC
  );
END xadrez;

ARCHITECTURE a1 OF xadrez IS
  TYPE states IS (s_start, s_delay, s_j1, s_j2, s_winj1, s_winj2);
  SIGNAL EA, PE : states;
  SIGNAL intern_cont1, intern_cont2 : STD_LOGIC_VECTOR(11 DOWNTO 0);
BEGIN

  contador1 : PROCESS (reset, clock)
  BEGIN
    IF reset = '1' THEN
      intern_cont1 <= x"000";
    ELSIF load = '1' THEN
      intern_cont1 <= i_value;
    ELSIF rising_edge(clock) AND EA = s_j1 THEN
      intern_cont1 <= intern_cont1 - 1;
    END IF;
  END PROCESS;

  contador2 : PROCESS (reset, clock)
  BEGIN
    IF (reset = '1') THEN
      intern_cont2 <= x"000";
    ELSIF (load = '1') THEN
      intern_cont2 <= i_value;
    ELSIF rising_edge(clock) AND EA = s_j2 THEN
      intern_cont2 <= intern_cont2 - 1;
    END IF;
  END PROCESS;

  resetClock : PROCESS (reset, clock)
  BEGIN
    IF (reset = '1') THEN
      EA <= s_start;
    ELSIF rising_edge(clock) THEN
      EA <= PE;
    END IF;
  END PROCESS;

  -- aqui vai a maquina de estados
  maquinaDeEstados : PROCESS (ea, j1, j2, intern_cont1, intern_cont2)
  BEGIN
    CASE(ea) IS
      WHEN s_start =>
      IF (j1 = '1' OR j2 = '1') THEN
        pe <= s_delay;
      END IF;

      WHEN s_delay =>
      IF (j1 = '1') THEN
        pe <= s_j1;
      ELSIF (j2 = '1') THEN
        pe <= s_j2;
      END IF;

      WHEN s_j1 =>
      IF (intern_cont1 = x"000") THEN
        pe <= s_winj1;
      ELSIF (j1 = '1') THEN
        pe <= s_j2;
      END IF;

      WHEN s_j2 =>
      IF (intern_cont2 = x"000") THEN
        pe <= s_winj2;
      ELSIF (j2 = '1') THEN
        pe <= s_j1;
      END IF;

      WHEN OTHERS =>
      NULL;
    END CASE;
  END PROCESS;

  winJ1 <= '1' WHEN EA = s_winj1 ELSE
    '0';
  winJ2 <= '1' WHEN EA = s_winj2 ELSE
    '0';

  --lembrar de atribuir o valor dos contadores internos para as saidas
  contj1 <= intern_cont1;
  contj2 <= intern_cont2;
END a1;