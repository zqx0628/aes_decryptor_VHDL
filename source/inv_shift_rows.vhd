----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/12/09 23:49:37
-- Design Name: 
-- Module Name: shift_rows - Behavioral
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

entity inv_shift_rows is
    port(state_in: in std_logic_vector(127 downto 0);
        state_out: out std_logic_vector(127 downto 0));
end inv_shift_rows;
architecture Behavioral of inv_shift_rows is
    signal s00,s01,s02,s03,s10,s11,s12,s13,s20,s21,s22,s23,s30,s31,s32,s33:std_logic_vector(7 downto 0);
begin
s00 <= state_in(127 downto 120);
s10 <= state_in(119 downto 112);
s20 <= state_in(111 downto 104);
s30 <= state_in(103 downto 96);

s01 <= state_in(95 downto 88);
s11 <= state_in(87 downto 80);
s21 <= state_in(79 downto 72);
s31 <= state_in(71 downto 64);

s02 <= state_in(63 downto 56);
s12 <= state_in(55 downto 48);
s22 <= state_in(47 downto 40);
s32 <= state_in(39 downto 32);

s03 <= state_in(31 downto 24);
s13 <= state_in(23 downto 16);
s23 <= state_in(15 downto 8);
s33 <= state_in(7 downto 0);

state_out <= s00&s13&s22&s31&s01&s10&s23&s32&s02&s11&s20&s33&s03&s12&s21&s30;
end Behavioral;
