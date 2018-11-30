library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of counter4_tb is
   component counter4
      port(clk    : in  std_logic;
           reset  : in  std_logic;
           enable : in  std_logic;
           z_out  : out std_logic_vector(3 downto 0));
   end component;
   signal clk    : std_logic;
   signal reset  : std_logic;
   signal enable : std_logic;
   signal z_out  : std_logic_vector(3 downto 0);
begin
test: counter4 port map (clk, reset, enable, z_out);
  clk <= '1' after 0 ns,
         '0' after 40 ns when clk /= '0' else '1' after 40 ns;
  reset <= '1' after 0 ns,
           '0' after 100 ns;
  enable <= '1' after 0 ns;
end behaviour;
