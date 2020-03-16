----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/12/22 18:49:22
-- Design Name: 
-- Module Name: kexp128 - Behavioral
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
library work;
use work.util_package.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity kexp128 is
    port(
        key:in std_logic_vector(127 downto 0);
        k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10: out std_logic_vector(127 downto 0)
    );
end kexp128;
architecture Behavioral of kexp128 is
    type key_word is array(0 to 43) of std_logic_vector(31 downto 0);
    signal w:key_word;
begin
w(0)<=key(127 downto 96);
w(1)<=key(95 downto 64);
w(2)<=key(63 downto 32);
w(3)<=key(31 downto 0);
w(4)<=w(0) xor T(1,w(3));
w(5)<=w(1) xor w(4);
w(6)<=w(2) xor w(5);
w(7)<=w(3) xor w(6);
w(8)<=w(4) xor T(2,w(7));
w(9)<=w(5) xor w(8);
w(10)<=w(6) xor w(9);
w(11)<=w(7) xor w(10);
w(12)<=w(8) xor T(3,w(11));
w(13)<=w(9) xor w(12);
w(14)<=w(10) xor w(13);
w(15)<=w(11) xor w(14);
w(16)<=w(12) xor T(4,w(15));
w(17)<=w(13) xor w(16);
w(18)<=w(14) xor w(17);
w(19)<=w(15) xor w(18);
w(20)<=w(16) xor T(5,w(19));
w(21)<=w(17) xor w(20);
w(22)<=w(18) xor w(21);
w(23)<=w(19) xor w(22);
w(24)<=w(20) xor T(6,w(23));
w(25)<=w(21) xor w(24);
w(26)<=w(22) xor w(25);
w(27)<=w(23) xor w(26);
w(28)<=w(24) xor T(7,w(27));
w(29)<=w(25) xor w(28);
w(30)<=w(26) xor w(29);
w(31)<=w(27) xor w(30);
w(32)<=w(28) xor T(8,w(31));
w(33)<=w(29) xor w(32);
w(34)<=w(30) xor w(33);
w(35)<=w(31) xor w(34);
w(36)<=w(32) xor T(9,w(35));
w(37)<=w(33) xor w(36);
w(38)<=w(34) xor w(37);
w(39)<=w(35) xor w(38);
w(40)<=w(36) xor T(10,w(39));
w(41)<=w(37) xor w(40);
w(42)<=w(38) xor w(41);
w(43)<=w(39) xor w(42);

k0<=w(0)&w(1)&w(2)&w(3);
k1<=w(4)&w(5)&w(6)&w(7);
k2<=w(8)&w(9)&w(10)&w(11);
k3<=w(12)&w(13)&w(14)&w(15);
k4<=w(16)&w(17)&w(18)&w(19);
k5<=w(20)&w(21)&w(22)&w(23);
k6<=w(24)&w(25)&w(26)&w(27);
k7<=w(28)&w(29)&w(30)&w(31);
k8<=w(32)&w(33)&w(34)&w(35);
k9<=w(36)&w(37)&w(38)&w(39);
k10<=w(40)&w(41)&w(42)&w(43);
end Behavioral;