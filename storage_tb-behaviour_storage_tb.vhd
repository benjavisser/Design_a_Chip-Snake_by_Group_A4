library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour_storage_tb of storage_tb is
   component storage
      port(		clk     			: in  std_logic;
           		reset     			: in  std_logic;
   		new_head_flag			: in  std_logic;
           		new_head  			: in  std_logic_vector(11 downto 0);
   		new_corner_flag			: in  std_logic;
           		new_corner 			: in  std_logic_vector(5 downto 0);
   		new_tail_flag			: in  std_logic;
           		new_tail   			: in  std_logic_vector(5 downto 0);
   		new_item_set			: in  std_logic;
   		remove_item_type			: in  std_logic;
   		remove_item_set			: in  std_logic;
        		new_item   			: in  std_logic_vector(11 downto 0);
		send_corner_flag			: in  std_logic;
        	   	snake_list 			: out std_logic_vector(16 downto 0);
           		item_out_food   			: out std_logic_vector(11 downto 0);
		item_out_power_up			: out std_logic_vector(11 downto 0);
           		audio      			: out std_logic_vector(7 downto 0);
   		head	   		: out std_logic_vector(11 downto 0);
   		tail	   		: out std_logic;
		new_item_clear			: out std_logic;
   		clear_head_flag			: out std_logic;
   		clear_corner_flag			: out std_logic;
   		clear_tail_flag			: out std_logic;
   		remove_item_clear			: out std_logic;
   		head_send_flag			: out std_logic;
   		snake_send_flag			: out std_logic;
   		item_send_flag			: out std_logic;
		send_new_corner_clear			: out std_logic);
   	
   end component;
   signal clk     				: std_logic;
   signal reset     				: std_logic;
   signal new_head_flag				: std_logic;
   signal new_head  				: std_logic_vector(11 downto 0);
   signal new_corner_flag				: std_logic;
   signal new_corner 				: std_logic_vector(5 downto 0);
   signal new_tail_flag				: std_logic;
   signal new_tail   				: std_logic_vector(5 downto 0);
   signal new_item_set				: std_logic;
   signal remove_item_type				: std_logic;
   signal remove_item_set				: std_logic;
   signal new_item   				: std_logic_vector(11 downto 0);
   signal snake_list 				: std_logic_vector(16 downto 0);
   signal item_out_food   				: std_logic_vector(11 downto 0);
   signal item_out_power_up				: std_logic_vector(11 downto 0);
   signal audio      				: std_logic_vector(7 downto 0);
   signal head		   		: std_logic_vector(11 downto 0);
   signal tail		   		: std_logic;
   signal clear_head_flag				: std_logic;
   signal clear_corner_flag				: std_logic;
   signal clear_tail_flag				: std_logic;
   signal remove_item_clear				: std_logic;
   signal new_item_clear				: std_logic;
   signal head_send_flag				: std_logic;
   signal snake_send_flag				: std_logic;
   signal item_send_flag				: std_logic;
   signal send_corner_flag		: std_logic;
   signal send_new_corner_clear	: std_logic; 

begin
test: storage port map (clk, reset, new_head_flag, new_head, new_corner_flag, new_corner, new_tail_flag, new_tail, new_item_set, remove_item_type, remove_item_set, new_item, send_corner_flag, snake_list, item_out_food, item_out_power_up, audio, head, tail, new_item_clear, clear_head_flag, clear_corner_flag, clear_tail_flag, remove_item_clear, head_send_flag, snake_send_flag, item_send_flag, send_new_corner_clear );

 clk 			<= 	'1' after 0 ns,
				'0' after 40 ns when clk /= '0' else '1' after 40 ns;

   reset 			<= 	'1' after 0 ns,
   				'0' after 80 ns;
   new_head_flag 			<= 	'0' after 0 ns;
   new_head(0) 			<= 	'0' after 0 ns;
   new_head(1) 			<= 	'0' after 0 ns;
   new_head(2) 			<= 	'0' after 0 ns;
   new_head(3) 			<= 	'0' after 0 ns;
   new_head(4) 			<= 	'0' after 0 ns;
   new_head(5) 			<= 	'0' after 0 ns;
   new_head(6) 			<= 	'0' after 0 ns;
   new_head(7) 			<= 	'0' after 0 ns;
   new_head(8) 			<= 	'0' after 0 ns;
   new_head(9) 			<= 	'0' after 0 ns;
   new_head(10) 			<= 	'0' after 0 ns;
   new_head(11) 			<= 	'0' after 0 ns;
   new_corner_flag 			<= 	'0' after 0 ns,
				'1' after 160 ns,
				'0' after 540 ns,
				'1' after 560 ns,
				'0' after 640 ns;
  send_corner_flag  <=				'0' after 0 ns,
				'1' after 1040 ns,
				'0' after 1120 ns,
				'1' after 1240 ns,
				'0' after 1370 ns,
				'1' after 1520 ns,
				'0' after 1610 ns;
   new_corner(0) 			<= 	'0' after 0 ns,
				'1' after 320 ns,
				'0' after 490 ns,
				'1' after 880 ns,
				'0' after 970 ns;
   new_corner(1) 			<= 	'0' after 0 ns;
   new_corner(2) 			<= 	'0' after 0 ns,
				'1' after 320 ns,
				'0' after 490 ns;
   new_corner(3) 			<= 	'0' after 0 ns,
				'1' after 320 ns,
				'0' after 490 ns;
   new_corner(4) 			<= 	'0' after 0 ns;
   new_corner(5) 			<= 	'0' after 0 ns,
				'1' after 320 ns,
				'0' after 490 ns;
   new_tail_flag 			<= 	'0' after 0 ns;
   new_tail(0) 			<= 	'0' after 0 ns;
   new_tail(1) 			<= 	'0' after 0 ns;
   new_tail(2) 			<= 	'0' after 0 ns;
   new_tail(3) 			<= 	'0' after 0 ns;
   new_tail(4) 			<= 	'0' after 0 ns;
   new_tail(5) 		 	<= 	'0' after 0 ns;
   new_item_set 			<=	'0' after 0 ns; 
   remove_item_type 			<= 	'0' after 0 ns;
   remove_item_set 			<= 	'0' after 0 ns;
   new_item(0) 			<= 	'0' after 0 ns;
   new_item(1)			<= 	'0' after 0 ns;
   new_item(2) 			<= 	'0' after 0 ns; 
   new_item(3) 			<= 	'0' after 0 ns;
   new_item(4) 			<= 	'0' after 0 ns;
   new_item(5) 			<= 	'0' after 0 ns;
   new_item(6) 			<= 	'0' after 0 ns;
   new_item(7) 			<= 	'0' after 0 ns;
   new_item(8) 			<= 	'0' after 0 ns;
   new_item(9) 			<= 	'0' after 0 ns;
   new_item(10) 			<= 	'0' after 0 ns;
   new_item(11) 			<= 	'0' after 0 ns;

end behaviour_storage_tb;

