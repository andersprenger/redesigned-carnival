
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE a1 OF tb IS
    SIGNAL value, cont1, cont2 : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL reset, load, j1, j2, winJ1, winJ2 : STD_LOGIC;
    SIGNAL ck : STD_LOGIC := '0';
BEGIN

    relogio : ENTITY work.xadrez
        PORT MAP(
            reset => reset,
            clock => ck,
            load => load,
            j1 => j1,
            j2 => j2,
            i_value => value,
            contj2 => cont2,
            contj1 => cont1,
            winJ1 => winJ1,
            winJ2 => winJ2
        );

    reset <= '1', '0' AFTER 5 ns;

    ck <= NOT ck AFTER 5 ns;

    load <= '0', '1' AFTER 15 ns, '0' AFTER 25 ns;

    value <= x"0BB";

    j1 <= '0',
        '1' AFTER 0600 ns, '0' AFTER 0610 ns,
        '1' AFTER 0800 ns, '0' AFTER 0810 ns,
        '1' AFTER 1200 ns, '0' AFTER 1210 ns,
        '1' AFTER 1800 ns, '0' AFTER 1810 ns,
        '1' AFTER 1950 ns, '0' AFTER 1960 ns,
        '1' AFTER 3100 ns, '0' AFTER 3110 ns,
        '1' AFTER 3400 ns, '0' AFTER 3410 ns;
    j2 <= '0',
        '1' AFTER 1000 ns, '0' AFTER 1010 ns,
        '1' AFTER 1300 ns, '0' AFTER 1310 ns,
        '1' AFTER 2100 ns, '0' AFTER 2110 ns,
        '1' AFTER 3200 ns, '0' AFTER 3210 ns,
        '1' AFTER 3600 ns, '0' AFTER 3610 ns,
        '1' AFTER 4300 ns, '0' AFTER 4310 ns;
END a1;