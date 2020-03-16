----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/12/10 11:27:41
-- Design Name: 
-- Module Name: inv_subbytes - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inv_subbytes is
    Port (
        state_in:in std_logic_vector(127 downto 0);
        state_out:out std_logic_vector(127 downto 0)
    );
end inv_subbytes;
architecture Behavioral of inv_subbytes is
    type state is array(3 downto 0,3 downto 0) of std_logic_vector(7 downto 0);
    signal s_in:state;
    signal s_out:state;
begin
    s_in_x:for j in 3 downto 0 generate
        s_in_y:for k in 3 downto 0 generate
            s_in(j,k)<=state_in(((3-j)*4+(4-k))*8-1 downto ((3-j)*4+(3-k))*8);
        end generate;
    end generate;
    s_out_x:for j in 3 downto 0 generate
        s_out_y:for k in 3 downto 0 generate
            state_out(((3-j)*4+(4-k))*8-1 downto ((3-j)*4+(3-k))*8)<=s_out(j,k);
        end generate;
    end generate;
--process 
    process(s_in)
    begin
        for j in 3 downto 0 loop
            for k in 3 downto 0 loop
                case s_in(j,k) is
                    when "01100011" => s_out(j,k)<="00000000";
					when "01111100" => s_out(j,k)<="00000001";
					when "01110111" => s_out(j,k)<="00000010";
					when "01111011" => s_out(j,k)<="00000011";
					when "11110010" => s_out(j,k)<="00000100";
					when "01101011" => s_out(j,k)<="00000101";
					when "01101111" => s_out(j,k)<="00000110";
					when "11000101" => s_out(j,k)<="00000111";
					when "00110000" => s_out(j,k)<="00001000";
					when "00000001" => s_out(j,k)<="00001001";
					when "01100111" => s_out(j,k)<="00001010";
					when "00101011" => s_out(j,k)<="00001011";
					when "11111110" => s_out(j,k)<="00001100";
					when "11010111" => s_out(j,k)<="00001101";
					when "10101011" => s_out(j,k)<="00001110";
					when "01110110" => s_out(j,k)<="00001111";
					when "11001010" => s_out(j,k)<="00010000";
					when "10000010" => s_out(j,k)<="00010001";
					when "11001001" => s_out(j,k)<="00010010";
					when "01111101" => s_out(j,k)<="00010011";
					when "11111010" => s_out(j,k)<="00010100";
					when "01011001" => s_out(j,k)<="00010101";
					when "01000111" => s_out(j,k)<="00010110";
					when "11110000" => s_out(j,k)<="00010111";
					when "10101101" => s_out(j,k)<="00011000";
					when "11010100" => s_out(j,k)<="00011001";
					when "10100010" => s_out(j,k)<="00011010";
					when "10101111" => s_out(j,k)<="00011011";
					when "10011100" => s_out(j,k)<="00011100";
					when "10100100" => s_out(j,k)<="00011101";
					when "01110010" => s_out(j,k)<="00011110";
					when "11000000" => s_out(j,k)<="00011111";
					when "10110111" => s_out(j,k)<="00100000";
					when "11111101" => s_out(j,k)<="00100001";
					when "10010011" => s_out(j,k)<="00100010";
					when "00100110" => s_out(j,k)<="00100011";
					when "00110110" => s_out(j,k)<="00100100";
					when "00111111" => s_out(j,k)<="00100101";
					when "11110111" => s_out(j,k)<="00100110";
					when "11001100" => s_out(j,k)<="00100111";
					when "00110100" => s_out(j,k)<="00101000";
					when "10100101" => s_out(j,k)<="00101001";
					when "11100101" => s_out(j,k)<="00101010";
					when "11110001" => s_out(j,k)<="00101011";
					when "01110001" => s_out(j,k)<="00101100";
					when "11011000" => s_out(j,k)<="00101101";
					when "00110001" => s_out(j,k)<="00101110";
					when "00010101" => s_out(j,k)<="00101111";
					when "00000100" => s_out(j,k)<="00110000";
					when "11000111" => s_out(j,k)<="00110001";
					when "00100011" => s_out(j,k)<="00110010";
					when "11000011" => s_out(j,k)<="00110011";
					when "00011000" => s_out(j,k)<="00110100";
					when "10010110" => s_out(j,k)<="00110101";
					when "00000101" => s_out(j,k)<="00110110";
					when "10011010" => s_out(j,k)<="00110111";
					when "00000111" => s_out(j,k)<="00111000";
					when "00010010" => s_out(j,k)<="00111001";
					when "10000000" => s_out(j,k)<="00111010";
					when "11100010" => s_out(j,k)<="00111011";
					when "11101011" => s_out(j,k)<="00111100";
					when "00100111" => s_out(j,k)<="00111101";
					when "10110010" => s_out(j,k)<="00111110";
					when "01110101" => s_out(j,k)<="00111111";
					when "00001001" => s_out(j,k)<="01000000";
					when "10000011" => s_out(j,k)<="01000001";
					when "00101100" => s_out(j,k)<="01000010";
					when "00011010" => s_out(j,k)<="01000011";
					when "00011011" => s_out(j,k)<="01000100";
					when "01101110" => s_out(j,k)<="01000101";
					when "01011010" => s_out(j,k)<="01000110";
					when "10100000" => s_out(j,k)<="01000111";
					when "01010010" => s_out(j,k)<="01001000";
					when "00111011" => s_out(j,k)<="01001001";
					when "11010110" => s_out(j,k)<="01001010";
					when "10110011" => s_out(j,k)<="01001011";
					when "00101001" => s_out(j,k)<="01001100";
					when "11100011" => s_out(j,k)<="01001101";
					when "00101111" => s_out(j,k)<="01001110";
					when "10000100" => s_out(j,k)<="01001111";
					when "01010011" => s_out(j,k)<="01010000";
					when "11010001" => s_out(j,k)<="01010001";
					when "00000000" => s_out(j,k)<="01010010";
					when "11101101" => s_out(j,k)<="01010011";
					when "00100000" => s_out(j,k)<="01010100";
					when "11111100" => s_out(j,k)<="01010101";
					when "10110001" => s_out(j,k)<="01010110";
					when "01011011" => s_out(j,k)<="01010111";
					when "01101010" => s_out(j,k)<="01011000";
					when "11001011" => s_out(j,k)<="01011001";
					when "10111110" => s_out(j,k)<="01011010";
					when "00111001" => s_out(j,k)<="01011011";
					when "01001010" => s_out(j,k)<="01011100";
					when "01001100" => s_out(j,k)<="01011101";
					when "01011000" => s_out(j,k)<="01011110";
					when "11001111" => s_out(j,k)<="01011111";
					when "11010000" => s_out(j,k)<="01100000";
					when "11101111" => s_out(j,k)<="01100001";
					when "10101010" => s_out(j,k)<="01100010";
					when "11111011" => s_out(j,k)<="01100011";
					when "01000011" => s_out(j,k)<="01100100";
					when "01001101" => s_out(j,k)<="01100101";
					when "00110011" => s_out(j,k)<="01100110";
					when "10000101" => s_out(j,k)<="01100111";
					when "01000101" => s_out(j,k)<="01101000";
					when "11111001" => s_out(j,k)<="01101001";
					when "00000010" => s_out(j,k)<="01101010";
					when "01111111" => s_out(j,k)<="01101011";
					when "01010000" => s_out(j,k)<="01101100";
					when "00111100" => s_out(j,k)<="01101101";
					when "10011111" => s_out(j,k)<="01101110";
					when "10101000" => s_out(j,k)<="01101111";
					when "01010001" => s_out(j,k)<="01110000";
					when "10100011" => s_out(j,k)<="01110001";
					when "01000000" => s_out(j,k)<="01110010";
					when "10001111" => s_out(j,k)<="01110011";
					when "10010010" => s_out(j,k)<="01110100";
					when "10011101" => s_out(j,k)<="01110101";
					when "00111000" => s_out(j,k)<="01110110";
					when "11110101" => s_out(j,k)<="01110111";
					when "10111100" => s_out(j,k)<="01111000";
					when "10110110" => s_out(j,k)<="01111001";
					when "11011010" => s_out(j,k)<="01111010";
					when "00100001" => s_out(j,k)<="01111011";
					when "00010000" => s_out(j,k)<="01111100";
					when "11111111" => s_out(j,k)<="01111101";
					when "11110011" => s_out(j,k)<="01111110";
					when "11010010" => s_out(j,k)<="01111111";
					when "11001101" => s_out(j,k)<="10000000";
					when "00001100" => s_out(j,k)<="10000001";
					when "00010011" => s_out(j,k)<="10000010";
					when "11101100" => s_out(j,k)<="10000011";
					when "01011111" => s_out(j,k)<="10000100";
					when "10010111" => s_out(j,k)<="10000101";
					when "01000100" => s_out(j,k)<="10000110";
					when "00010111" => s_out(j,k)<="10000111";
					when "11000100" => s_out(j,k)<="10001000";
					when "10100111" => s_out(j,k)<="10001001";
					when "01111110" => s_out(j,k)<="10001010";
					when "00111101" => s_out(j,k)<="10001011";
					when "01100100" => s_out(j,k)<="10001100";
					when "01011101" => s_out(j,k)<="10001101";
					when "00011001" => s_out(j,k)<="10001110";
					when "01110011" => s_out(j,k)<="10001111";
					when "01100000" => s_out(j,k)<="10010000";
					when "10000001" => s_out(j,k)<="10010001";
					when "01001111" => s_out(j,k)<="10010010";
					when "11011100" => s_out(j,k)<="10010011";
					when "00100010" => s_out(j,k)<="10010100";
					when "00101010" => s_out(j,k)<="10010101";
					when "10010000" => s_out(j,k)<="10010110";
					when "10001000" => s_out(j,k)<="10010111";
					when "01000110" => s_out(j,k)<="10011000";
					when "11101110" => s_out(j,k)<="10011001";
					when "10111000" => s_out(j,k)<="10011010";
					when "00010100" => s_out(j,k)<="10011011";
					when "11011110" => s_out(j,k)<="10011100";
					when "01011110" => s_out(j,k)<="10011101";
					when "00001011" => s_out(j,k)<="10011110";
					when "11011011" => s_out(j,k)<="10011111";
					when "11100000" => s_out(j,k)<="10100000";
					when "00110010" => s_out(j,k)<="10100001";
					when "00111010" => s_out(j,k)<="10100010";
					when "00001010" => s_out(j,k)<="10100011";
					when "01001001" => s_out(j,k)<="10100100";
					when "00000110" => s_out(j,k)<="10100101";
					when "00100100" => s_out(j,k)<="10100110";
					when "01011100" => s_out(j,k)<="10100111";
					when "11000010" => s_out(j,k)<="10101000";
					when "11010011" => s_out(j,k)<="10101001";
					when "10101100" => s_out(j,k)<="10101010";
					when "01100010" => s_out(j,k)<="10101011";
					when "10010001" => s_out(j,k)<="10101100";
					when "10010101" => s_out(j,k)<="10101101";
					when "11100100" => s_out(j,k)<="10101110";
					when "01111001" => s_out(j,k)<="10101111";
					when "11100111" => s_out(j,k)<="10110000";
					when "11001000" => s_out(j,k)<="10110001";
					when "00110111" => s_out(j,k)<="10110010";
					when "01101101" => s_out(j,k)<="10110011";
					when "10001101" => s_out(j,k)<="10110100";
					when "11010101" => s_out(j,k)<="10110101";
					when "01001110" => s_out(j,k)<="10110110";
					when "10101001" => s_out(j,k)<="10110111";
					when "01101100" => s_out(j,k)<="10111000";
					when "01010110" => s_out(j,k)<="10111001";
					when "11110100" => s_out(j,k)<="10111010";
					when "11101010" => s_out(j,k)<="10111011";
					when "01100101" => s_out(j,k)<="10111100";
					when "01111010" => s_out(j,k)<="10111101";
					when "10101110" => s_out(j,k)<="10111110";
					when "00001000" => s_out(j,k)<="10111111";
					when "10111010" => s_out(j,k)<="11000000";
					when "01111000" => s_out(j,k)<="11000001";
					when "00100101" => s_out(j,k)<="11000010";
					when "00101110" => s_out(j,k)<="11000011";
					when "00011100" => s_out(j,k)<="11000100";
					when "10100110" => s_out(j,k)<="11000101";
					when "10110100" => s_out(j,k)<="11000110";
					when "11000110" => s_out(j,k)<="11000111";
					when "11101000" => s_out(j,k)<="11001000";
					when "11011101" => s_out(j,k)<="11001001";
					when "01110100" => s_out(j,k)<="11001010";
					when "00011111" => s_out(j,k)<="11001011";
					when "01001011" => s_out(j,k)<="11001100";
					when "10111101" => s_out(j,k)<="11001101";
					when "10001011" => s_out(j,k)<="11001110";
					when "10001010" => s_out(j,k)<="11001111";
					when "01110000" => s_out(j,k)<="11010000";
					when "00111110" => s_out(j,k)<="11010001";
					when "10110101" => s_out(j,k)<="11010010";
					when "01100110" => s_out(j,k)<="11010011";
					when "01001000" => s_out(j,k)<="11010100";
					when "00000011" => s_out(j,k)<="11010101";
					when "11110110" => s_out(j,k)<="11010110";
					when "00001110" => s_out(j,k)<="11010111";
					when "01100001" => s_out(j,k)<="11011000";
					when "00110101" => s_out(j,k)<="11011001";
					when "01010111" => s_out(j,k)<="11011010";
					when "10111001" => s_out(j,k)<="11011011";
					when "10000110" => s_out(j,k)<="11011100";
					when "11000001" => s_out(j,k)<="11011101";
					when "00011101" => s_out(j,k)<="11011110";
					when "10011110" => s_out(j,k)<="11011111";
					when "11100001" => s_out(j,k)<="11100000";
					when "11111000" => s_out(j,k)<="11100001";
					when "10011000" => s_out(j,k)<="11100010";
					when "00010001" => s_out(j,k)<="11100011";
					when "01101001" => s_out(j,k)<="11100100";
					when "11011001" => s_out(j,k)<="11100101";
					when "10001110" => s_out(j,k)<="11100110";
					when "10010100" => s_out(j,k)<="11100111";
					when "10011011" => s_out(j,k)<="11101000";
					when "00011110" => s_out(j,k)<="11101001";
					when "10000111" => s_out(j,k)<="11101010";
					when "11101001" => s_out(j,k)<="11101011";
					when "11001110" => s_out(j,k)<="11101100";
					when "01010101" => s_out(j,k)<="11101101";
					when "00101000" => s_out(j,k)<="11101110";
					when "11011111" => s_out(j,k)<="11101111";
					when "10001100" => s_out(j,k)<="11110000";
					when "10100001" => s_out(j,k)<="11110001";
					when "10001001" => s_out(j,k)<="11110010";
					when "00001101" => s_out(j,k)<="11110011";
					when "10111111" => s_out(j,k)<="11110100";
					when "11100110" => s_out(j,k)<="11110101";
					when "01000010" => s_out(j,k)<="11110110";
					when "01101000" => s_out(j,k)<="11110111";
					when "01000001" => s_out(j,k)<="11111000";
					when "10011001" => s_out(j,k)<="11111001";
					when "00101101" => s_out(j,k)<="11111010";
					when "00001111" => s_out(j,k)<="11111011";
					when "10110000" => s_out(j,k)<="11111100";
					when "01010100" => s_out(j,k)<="11111101";
					when "10111011" => s_out(j,k)<="11111110";
					when "00010110" => s_out(j,k)<="11111111";
                    when others=> s_out(j,k)<="00000000";
                end case;
            end loop;
        end loop;
    end process;
end Behavioral;
