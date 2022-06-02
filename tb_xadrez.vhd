
library IEEE;
use IEEE.std_logic_1164.all;

entity tb is
end tb;

architecture a1 of tb is
      signal value, cont1, cont2 : std_logic_vector(11 downto 0);
      signal reset, load, j1, j2, winJ1, winJ2   : std_logic;
      signal ck : std_logic := '0' ;
begin

    relogio : entity work.xadrez
          port map ( reset=>reset, clock=>ck, load=>load,  j1=>j1,  j2=>j2,  i_value=>value,  contj2=>cont2, contj1=>cont1, winJ1=>winJ1, winJ2=>winJ2 ); 

      reset <= '1', '0' after 5 ns;

      ck <= not ck after 5 ns;

      load <= '0', '1' after 15 ns,  '0' after 25 ns;

      value <= x"090";   

      j1 <=  '0', '1' after  602 ns,  '0' after  612 ns, 
                  '1' after  802 ns,  '0' after 812 ns,
                  '1' after  1302 ns,  '0' after 1312 ns,
                  '1' after  1825 ns,  '0' after 1835 ns,  -- acao ignorada
                  '1' after  3114 ns,  '0' after 3124 ns,
                  '1' after  3426 ns,  '0' after 3436 ns;


      j2 <= '0',  '1' after  1005 ns, '0' after  1015 ns,   
                  '1' after  1415 ns, '0' after  1425 ns, 
                  '1' after  2125 ns,  '0' after  2135 ns,
                  '1' after  3215 ns,  '0' after  3225 ns,
                  '1' after  3628 ns,  '0' after  3638 ns,
                  '1' after  4365 ns,  '0' after  4375 ns;


end a1; 
