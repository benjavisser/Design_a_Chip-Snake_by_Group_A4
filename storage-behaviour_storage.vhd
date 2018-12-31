library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour_storage of storage is

	type S_memory is array (0 to 24) of std_logic_vector(5 downto 0);
	signal S_S : S_memory; 
	
	type I_memory is array (0 to 1) of std_logic_vector(11 downto 0);
	signal I_S : I_memory;

	type H_memory is array (0 to 0) of std_logic_vector(11 downto 0);
	signal H_S : H_memory;
	
	type storage_change_states is ( reset_state,
					idle,
					replace_head,
					load_tail,
					check_tail,
					replace_tail,
					remove_tail,
					corner_counter_up,
					shift_corners,
					add_new_corner,
					remove_food,
					remove_power_up,
					replace_food,
					replace_power_up,
					clear_head_state,
					clear_corner_state,
					new_item_clear_state,
					clear_tail_state,
               				        state_1,
                    					state_2,
                    					state_3,
                    					state_wait,
                   					state_wait1,
                    					state_wait2,
                    					state_wait3,
					tail_check1,
					tail_check2,
					tail_check3

					);

signal state, new_state : storage_change_states;
signal corner_count, new_corner_count, right : integer;
signal head_check : std_logic_vector (11 downto 0);
signal tail_check : std_logic_vector (5 downto 0);
signal tail_out		 : std_logic_vector (5 downto 0);
signal N, new_N : integer;
signal corner_check: std_logic_vector(5 downto 0);
signal shift0, shift1, shift2, shift3, shift4, shift5, shift6, shift7, shift8, shift9, shift10, shift11, shift12, shift13, shift14, shift15, shift16, shift17, shift18, shift19, shift20, shift21, shift22, shift23 : std_logic_vector (5 downto 0);

begin
process (clk, reset)
	begin
		if (rising_edge (clk)) then
			if (reset = '1') then
				state <= reset_state;
			else
			state <= new_state;
			end if;
		end if;
end process;


process (new_head_flag, new_corner_flag, new_tail_flag, new_item_set, send_corner_flag, remove_item_set, new_head, new_corner, new_tail, new_item, state)
	begin
		case state is
			when reset_state =>
				H_S(0) 	<= "100100110001";
				S_S 	<=  (others=>(others=>'0'));
				S_S(0) 	<= "011110";
				I_S(0) 	<= "000000000000";
				I_S(1) 	<= "000000000000";
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				corner_count <= 1;
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				tail_check				<= "000000";
				head_check				<= "000000000000";
				corner_check				<= "000000";
				N				<= 1;
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

				new_state <= idle;
		
			when idle =>
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				tail_out				<= S_S(corner_count);
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

		

				if (new_head_flag = '1') then
					new_state <= replace_head;
				elsif (new_corner_flag = '1') then
					new_state <= corner_counter_up;
				elsif (new_tail_flag = '1') then
					new_state <= load_tail;
				elsif (new_item_set = '1' AND new_item(1 downto 0) = "00") then
					new_state <= replace_food;
				elsif (new_item_set = '1' AND new_item(1 downto 0) /= "00") then
					new_state <= replace_power_up;
				elsif (new_item_set = '0' AND remove_item_set = '1' AND remove_item_type = '0') then
					new_state <= remove_food;
				elsif (new_item_set = '0' AND remove_item_set = '1' AND remove_item_type = '1') then
					new_state <= remove_power_up;
				elsif	(send_corner_flag = '1') then
					new_state <= tail_check1;
				else
					new_state <= idle;
				end if;

			when replace_head =>
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				H_S(0) <= new_head;
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);
				
				new_state <= clear_head_state;

			when clear_head_state =>
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '1';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

				new_state <= idle;
								


			when corner_counter_up =>
				new_corner_count <= corner_count + 1;
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

				shift0	<= S_S(0);
				shift1 <= S_S(1);
				shift2 <= S_S(2);
				shift3	<= S_S(3);
				shift4 <= S_S(4);
				shift5 <= S_S(5);
				shift6	<= S_S(6);
				shift7 <= S_S(7);
				shift8 <= S_S(8);
				shift9	<= S_S(9);
				shift10 <= S_S(10);
				shift11 <= S_S(11);
				shift12	<= S_S(12);
				shift13 <= S_S(13);
				shift14 <= S_S(14);
				shift15	<= S_S(15);
				shift16 <= S_S(16);
				shift17 <= S_S(17);
				shift18	<= S_S(18);
				shift19 <= S_S(19);
				shift20 <= S_S(20);
				shift21	<= S_S(21);
				shift22 <= S_S(22);
				shift23 <= S_S(23);



				

				new_state <= shift_corners;

			when shift_corners =>

				corner_count <= new_corner_count;
				S_S(1) <= shift0;
				S_S(2) <= shift1;
				S_S(3) <= shift2;
				S_S(4) <= shift3;
				S_S(5) <= shift4;
				S_S(6) <= shift5;
				S_S(7) <= shift6;
				S_S(8) <= shift7;
				S_S(9) <= shift8;
				S_S(10) <= shift9;
				S_S(11) <= shift10;
				S_S(12) <= shift11;
				S_S(13) <= shift12;
				S_S(14) <= shift13;
				S_S(15) <= shift14;
				S_S(16) <= shift15;
				S_S(17) <= shift16;
				S_S(18) <= shift17;
				S_S(19) <= shift18;
				S_S(20) <= shift19;
				S_S(21) <= shift20;
				S_S(22) <= shift21;
				S_S(23) <= shift22;
				S_S(24) <= shift23;
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);


				new_state <= add_new_corner;

			when add_new_corner =>
				S_S(0) <= new_corner;
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);


				new_state <= clear_corner_state;

			when clear_corner_state =>
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '1'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);


				new_state <= idle;			

			when replace_food =>
				I_S(0) <= new_item;
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

			
				new_state <= new_item_clear_state;

			when replace_power_up =>
				I_S(1) <= new_item;
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);


				new_state <= new_item_clear_state;

			when remove_food =>
				I_S(0) <= "000000000000";
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);


				new_state <= new_item_clear_state;

			when remove_power_up =>
				I_S(1) <= "000000000000";
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

				new_state <= new_item_clear_state;

			when new_item_clear_state =>
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '1';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);


				new_state <= idle;

			when load_tail =>
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

				tail_check				<= S_S(1);

				new_state				<= check_tail;

			when check_tail =>
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

				
				if (corner_count = 1) then
					if (tail_check(5) = '1') then
						if ( head_check(9 downto 5) = new_tail(4 downto 0)) then
							new_state <= remove_tail;
						end if;
					elsif (tail_check(5) = '0') then
						if ( head_check(4 downto 0) = new_tail(4 downto 0)) then
							new_state <= remove_tail;
						end if;
					end if;
				elsif (corner_count = 0) then
					new_state <= replace_tail;
				elsif (new_tail = S_S(corner_count - 2)) then
					new_state <= remove_tail;
				else 
					new_state <= replace_tail;
				end if;

			when replace_tail =>
				S_S(corner_count - 1) <= new_tail;
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '1';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);


				new_state <= idle;

			when remove_tail =>
				S_S(corner_count - 1) <= "000000";
				corner_count <= corner_count - 1;
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '1';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

				new_state <= idle;

			when clear_tail_state =>
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '1';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

				new_state <= idle;

	    when tail_check1 =>
                head_send_flag    <= '0';
                snake_send_flag <= '0';
                item_send_flag <= '0';
                head <= H_S(0);
                audio <= "00000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_item_clear	 		                <= '0';
                corner_check                <= S_S(0);
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

		if (N = corner_count) then
			tail <= '1';
		else 
			tail <= '0';
		end if;
		
		new_state <= state_1;


            when state_1 =>
                head_send_flag    <= '0';
                snake_send_flag <= '1';
                item_send_flag <= '0';
                head <= H_S(0);
                audio <= "00000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_item_clear	 		                <= '0';
                corner_check                <= S_S(0);
		new_N				<= N + 1;
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);


                snake_list <= H_S(0)(9 downto 0) & S_S(0) & tail;

                if  (N = corner_count) then     
                    new_state <= idle;
                else new_state <= state_wait2;
                end if;

            when state_wait2 =>
                head_send_flag    <= '0';
                snake_send_flag <= '0';
                item_send_flag <= '0';
                head <= H_S(0);
                audio <= "00000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
                tail <= '0';
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                 <= '0';   
                remove_item_clear               <= '0';
                N <= new_N;
                corner_check                <= S_S(N-1);
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

                if    (send_corner_flag = '1') then
                        new_state <= tail_check2;
                else new_state <= state_wait2;
                end if;

	    when tail_check2 =>
                head_send_flag    <= '0';
                snake_send_flag <= '0';
                item_send_flag <= '0';
                head <= H_S(0);
                audio <= "00000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_item_clear	 		               <= '0';
                corner_check                <= S_S(1);
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

		if (N = corner_count) then
			tail <= '1';
		else 
			tail <= '0';
		end if;

		new_state <= state_2;

            when state_2 =>
                head_send_flag    <= '0';
                snake_send_flag <= '1';
                item_send_flag <= '0';
                head <= H_S(0);
                audio <= "00000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                 <= '0';   
                remove_item_clear                <= '0';
		new_N				<= N + 1;
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

           
                if (corner_check(5) = '1') then
                    snake_list <= S_S(0)(4 downto 0) & H_S(0)(9 downto 5) & S_S(N-1) & tail;
                end if;

                if (corner_check(5) = '0') then
                    snake_list <=  H_S(0)(4 downto 0) & S_S(0)(4 downto 0) & S_S(N-1) & tail;
                end if;
                 

   		if  (N = corner_count) then     
                    new_state <= idle;
                else new_state <= state_wait3;

                end if;


            when state_wait3 =>
                head_send_flag    <= '0';
                snake_send_flag <= '0';
                item_send_flag <= '0';
                head <= H_S(0);
                audio <= "00000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
                tail <= '0';
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                 <= '0';   
                remove_item_clear                <= '0';
                N <= new_N;
                corner_check                <= S_S(N);
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

                if    send_corner_flag = '1' then
                        new_state <= tail_check3;
                else new_state <= state_wait3;
                end if;

	    when tail_check3 =>
                head_send_flag    <= '0';
                snake_send_flag <= '0';
                item_send_flag <= '0';
                head <= H_S(0);
                audio <= "00000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_item_clear	 		                <= '0';
                corner_check                <= S_S(0);
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

		if (N = corner_count) then
			tail <= '1';
		else 
			tail <= '0';
		end if;

		new_state <= state_3;

            when state_3 =>
                head_send_flag    <= '0';
                snake_send_flag <= '1';
                item_send_flag <= '0';
                head <= H_S(0);
                audio <= "00000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_item_clear                <= '0';
                corner_check                <= S_S(0);
		new_N			<= N + 1;
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);
                           
                       
                           
                           
               	if corner_check(5) = '0' then
                       snake_list <= S_S(N-3)(4 downto 0) & S_S(N-2)(4 downto 0) & S_S(N-1) & tail;
                 end if;

                if corner_check(5) = '1' then
                         snake_list <= S_S(N-2)(4 downto 0) & S_S(N-3)(4 downto 0) & S_S(N-1) & tail;
                           
                end if;                       
          
               if  (N = corner_count) then     
                    new_state <= idle;
                else new_state <= state_wait;

                end if;

            	when state_wait =>
                head_send_flag    <= '0';
                snake_send_flag <= '0';
                item_send_flag <= '0';
                head <= H_S(0);
                audio <= "00000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
                tail <= '0';
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_item_clear                <= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);
                N <= new_N;

                if    send_corner_flag = '1' then
                        new_state <= tail_check3;
                else new_state <= state_wait;
                end if;



			when others =>
				head_send_flag	<= '0';
				snake_send_flag <= '0';
				item_send_flag <= '0';
				head <= H_S(0);
				snake_list <= "00000000000000000";
				audio <= "00000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_item_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				
				snake_output0				<= S_S(0);
				snake_output1				<= S_S(1);
				snake_output2				<= S_S(2);
				snake_output3				<= S_S(3);
				snake_output4				<= S_S(4);
				snake_output5				<= S_S(5);
				snake_output6				<= S_S(6);
				snake_output7				<= S_S(7);
				snake_output8				<= S_S(8);
				snake_output9				<= S_S(9);
				snake_output10				<= S_S(10);
				snake_output11				<= S_S(11);
				snake_output12				<= S_S(12);
				snake_output13				<= S_S(13);
				snake_output14				<= S_S(14);
				snake_output15				<= S_S(15);
				snake_output16				<= S_S(16);
				snake_output17				<= S_S(17);
				snake_output18				<= S_S(18);
				snake_output19				<= S_S(19);
				snake_output20				<= S_S(20);
				snake_output21				<= S_S(21);
				snake_output22				<= S_S(22);
				snake_output23				<= S_S(23);
				snake_output24				<= S_S(24);

				new_state <= idle;
			end case;
		end process;			
			
end behaviour_storage;

