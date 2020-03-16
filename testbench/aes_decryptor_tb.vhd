library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.textio.all;
use ieee.std_logic_textio.all;
entity aes_decryptor_tb is
    generic(n:integer:=128);
end aes_decryptor_tb;
architecture Behavioral of aes_decryptor_tb is
    component aes_decryptor
        generic(n:integer);
        port(
            clk,run:in std_logic;
            input_text:in std_logic_vector(127 downto 0);
            key:in std_logic_vector(n-1 downto 0);
            output_text:out std_logic_vector(127 downto 0);
            done:out std_logic
        );
    end component;
    signal clk,run,done:std_logic;
    signal input_text,output_text:std_logic_vector(127 downto 0);
    signal key:std_logic_vector(n-1 downto 0);
    
begin
    AES:aes_decryptor 
        generic map(n=>n)
        port map(clk=>clk,run=>run,done=>done,input_text=>input_text,output_text=>output_text,key=>key);
process begin
    clk<='1';
    wait for 10 ns;
    clk<='0';
    wait for 10 ns;
end process;
--    process begin
--        run<='0';
--        wait for 10 ns;
--        run<='1';
--        input_text<=x"69c4e0d86a7b0430d8cdb78070b4c55a";
--        key<=x"000102030405060708090a0b0c0d0e0f";

----        input_text<=x"dda97ca4864cdfe06eaf70a0ec0d7191";
----        key<=x"000102030405060708090a0b0c0d0e0f1011121314151617";

--        --input_text<=x"8ea2b7ca516745bfeafc49904b496089";
--        --key<=x"000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f";
--        wait for 1000 ns;
--    end process;
process
    file F: TEXT open READ_MODE is "input.txt";
    file O: TEXT open WRITE_MODE is "output.txt";
    variable Lr: LINE;
    variable Lw: LINE;
    variable plain_text: std_logic_vector(127 downto 0);
    variable input_key: std_logic_vector(n-1 downto 0);
begin
    wait until (clk ='0');
    while not ENDFILE(F) loop
        readline(F, Lr);
        read(Lr,plain_text);
        read(Lr,input_key);
        run<='1';
        input_text<=plain_text;
        key<=input_key;
        wait for 50 ns;
        WRITE (Lw, NOW, Left, 12);
        WRITE (Lw, output_text);
        writeline (O, Lw);
    end loop;
    file_close(F);
    file_close(O);
end process;
end Behavioral;