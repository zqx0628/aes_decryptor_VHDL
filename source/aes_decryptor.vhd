----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/12/19 00:35:05
-- Design Name: 
-- Module Name: aes_decryptor - Behavioral
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

entity aes_decryptor is
    generic(n:integer:=128);
    port(
        clk,run:in std_logic;
        input_text:in std_logic_vector(127 downto 0);
        key:in std_logic_vector(n-1 downto 0);
        output_text:out std_logic_vector(127 downto 0);
        done:out std_logic
    );
end aes_decryptor;
architecture Behavioral of aes_decryptor is
    component inv_round
        Port ( round_in : in STD_LOGIC_VECTOR (127 downto 0);
               round_out : out STD_LOGIC_VECTOR (127 downto 0);
               round_key : in STD_LOGIC_VECTOR (127 downto 0));
    end component;
    component inv_round10
        Port ( round_in : in STD_LOGIC_VECTOR (127 downto 0);
               round_out : out STD_LOGIC_VECTOR (127 downto 0);
               round_key : in STD_LOGIC_VECTOR (127 downto 0));
    end component;
    component kexp128
        port(
            key:in std_logic_vector(n-1 downto 0);
            k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10: out std_logic_vector(127 downto 0)
        );
    end component;
    component kexp192
        port(
            key:in std_logic_vector(n-1 downto 0);
            k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12: out std_logic_vector(127 downto 0)
        );
    end component;
    component kexp256
        port(
            key:in std_logic_vector(n-1 downto 0);
            k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14: out std_logic_vector(127 downto 0)
        );
    end component;
    signal cnt:integer:=0;
    signal s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14:std_logic_vector(127 downto 0);
    signal k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14:std_logic_vector(127 downto 0);
begin
aes128:if n=128 generate
    s0<=input_text xor k10;
    r1:inv_round port map(round_in=>s0,round_out=>s1,round_key=>k9);
    r2:inv_round port map(round_in=>s1,round_out=>s2,round_key=>k8);
    r3:inv_round port map(round_in=>s2,round_out=>s3,round_key=>k7);
    r4:inv_round port map(round_in=>s3,round_out=>s4,round_key=>k6);
    r5:inv_round port map(round_in=>s4,round_out=>s5,round_key=>k5);
    r6:inv_round port map(round_in=>s5,round_out=>s6,round_key=>k4);
    r7:inv_round port map(round_in=>s6,round_out=>s7,round_key=>k3);
    r8:inv_round port map(round_in=>s7,round_out=>s8,round_key=>k2);
    r9:inv_round port map(round_in=>s8,round_out=>s9,round_key=>k1);
    r10:inv_round10 port map(round_in=>s9,round_out=>s10,round_key=>k0);
    Keyexp128:kexp128 port map(key=>key,k0=>k0,k1=>k1,k2=>k2,k3=>k3,k4=>k4,k5=>k5,k6=>k6,k7=>k7,k8=>k8,k9=>k9,k10=>k10);
    process(clk,run)
    begin
        if run='0' then
            output_text<=(others=>'0');
            done<='0';
            cnt<=0;
        elsif rising_edge(clk) then
            cnt<=cnt+1;
            if cnt=1 then
                done<='1';
                cnt<=0;
                output_text<=s10;
            end if;
        end if;
    end process;
end generate;
aes192:if n=192 generate
    s0<=input_text xor k12;
    r1:inv_round port map(round_in=>s0,round_out=>s1,round_key=>k11);
    r2:inv_round port map(round_in=>s1,round_out=>s2,round_key=>k10);
    r3:inv_round port map(round_in=>s2,round_out=>s3,round_key=>k9);
    r4:inv_round port map(round_in=>s3,round_out=>s4,round_key=>k8);
    r5:inv_round port map(round_in=>s4,round_out=>s5,round_key=>k7);
    r6:inv_round port map(round_in=>s5,round_out=>s6,round_key=>k6);
    r7:inv_round port map(round_in=>s6,round_out=>s7,round_key=>k5);
    r8:inv_round port map(round_in=>s7,round_out=>s8,round_key=>k4);
    r9:inv_round port map(round_in=>s8,round_out=>s9,round_key=>k3);
    r10:inv_round port map(round_in=>s9,round_out=>s10,round_key=>k2);
    r11:inv_round port map(round_in=>s10,round_out=>s11,round_key=>k1);
    r12:inv_round10 port map(round_in=>s11,round_out=>s12,round_key=>k0);
    Keyexp192:kexp192 port map(key=>key,k0=>k0,k1=>k1,k2=>k2,k3=>k3,k4=>k4,k5=>k5,k6=>k6,k7=>k7,k8=>k8,k9=>k9,k10=>k10,k11=>k11,k12=>k12);
    process(clk,run)
    begin
        if run='0' then
            output_text<=(others=>'0');
            done<='0';
            cnt<=0;
        elsif rising_edge(clk) then
            cnt<=cnt+1;
            if cnt=1 then
                done<='1';
                cnt<=0;
                output_text<=s12;
            end if;
        end if;
    end process;
end generate;
aes256:if n=256 generate
    s0<=input_text xor k14;
    r1:inv_round port map(round_in=>s0,round_out=>s1,round_key=>k13);
    r2:inv_round port map(round_in=>s1,round_out=>s2,round_key=>k12);
    r3:inv_round port map(round_in=>s2,round_out=>s3,round_key=>k11);
    r4:inv_round port map(round_in=>s3,round_out=>s4,round_key=>k10);
    r5:inv_round port map(round_in=>s4,round_out=>s5,round_key=>k9);
    r6:inv_round port map(round_in=>s5,round_out=>s6,round_key=>k8);
    r7:inv_round port map(round_in=>s6,round_out=>s7,round_key=>k7);
    r8:inv_round port map(round_in=>s7,round_out=>s8,round_key=>k6);
    r9:inv_round port map(round_in=>s8,round_out=>s9,round_key=>k5);
    r10:inv_round port map(round_in=>s9,round_out=>s10,round_key=>k4);
    r11:inv_round port map(round_in=>s10,round_out=>s11,round_key=>k3);
    r12:inv_round port map(round_in=>s11,round_out=>s12,round_key=>k2);
    r13:inv_round port map(round_in=>s12,round_out=>s13,round_key=>k1);
    r14:inv_round10 port map(round_in=>s13,round_out=>s14,round_key=>k0);
    Keyexp256:kexp256 port map(key=>key,k0=>k0,k1=>k1,k2=>k2,k3=>k3,k4=>k4,k5=>k5,k6=>k6,k7=>k7,k8=>k8,k9=>k9,k10=>k10,k11=>k11,k12=>k12,k13=>k13,k14=>k14);
    process(clk,run)
    begin
        if run='0' then
            output_text<=(others=>'0');
            done<='0';
            cnt<=0;
        elsif rising_edge(clk) then
            cnt<=cnt+1;
            if cnt=1 then
                done<='1';
                cnt<=0;
                output_text<=s14;
            end if;
        end if;
    end process;
end generate;
end Behavioral;
