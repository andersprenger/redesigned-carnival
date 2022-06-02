
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

    j1 <= '0', '1' AFTER 602 ns, '0' AFTER 612 ns,
        '1' AFTER 802 ns, '0' AFTER 812 ns,
        '1' AFTER 1302 ns, '0' AFTER 1312 ns,
        '1' AFTER 1825 ns, '0' AFTER 1835 ns,
        '1' AFTER 3114 ns, '0' AFTER 3124 ns,
        '1' AFTER 3426 ns, '0' AFTER 3436 ns;
    j2 <= '0', '1' AFTER 1005 ns, '0' AFTER 1015 ns,
        '1' AFTER 1415 ns, '0' AFTER 1425 ns,
        '1' AFTER 2125 ns, '0' AFTER 2135 ns,
        '1' AFTER 3215 ns, '0' AFTER 3225 ns,
        '1' AFTER 3628 ns, '0' AFTER 3638 ns,
        '1' AFTER 4365 ns, '0' AFTER 4375 ns;
END a1;