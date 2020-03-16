----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/12/18 11:30:07
-- Design Name: 
-- Module Name: inv_round10 - Behavioral
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

entity inv_round10 is
    generic(n:integer:=128);
    Port ( round_in : in STD_LOGIC_VECTOR (127 downto 0);
           round_key : in STD_LOGIC_VECTOR (n-1 downto 0);
           round_out : out STD_LOGIC_VECTOR (127 downto 0)
           );
end inv_round10;

architecture Behavioral of inv_round10 is
    component inv_subbytes
        Port (
            state_in:in std_logic_vector(127 downto 0);
            state_out:out std_logic_vector(127 downto 0)
        );
    end component;
    component inv_shift_rows
        port(
            state_in: in std_logic_vector(127 downto 0);
            state_out: out std_logic_vector(127 downto 0)
        );
    end component;
    component inv_mixclumn
        port(
            state_in:in std_logic_vector(127 downto 0);
            state_out: out std_logic_vector(127 downto 0)
        );
    end component;
    component addroundkey
        port(
            state_in:in std_logic_vector(127 downto 0);
            state_out:out std_logic_vector(127 downto 0);
            key:in std_logic_vector(n-1 downto 0)
        );
    end component;
    component expkey
        port(
            key_in:in std_logic_vector(n-1 downto 0);
            Rcon:in std_logic_vector(7 downto 0);
            key_out:out std_logic_vector(n-1 downto 0)
        );
    end component;
    signal s1,s2,s3:std_logic_vector(127 downto 0);
begin
    Sub:inv_subbytes port map(state_in=>round_in,state_out=>s1);
    Sft:inv_shift_rows port map(state_in=>s1,state_out=>s2);
    Adk:addroundkey port map(state_in=>s2,state_out=>round_out,key=>round_key);
end Behavioral;
