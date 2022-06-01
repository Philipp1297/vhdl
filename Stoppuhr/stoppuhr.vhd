LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY stoppuhr IS
 	PORT (
		clk 	: IN std_logic;
		button1	: IN std_logic;
 		button2	: IN std_logic;
		button3	: IN std_logic;
		hex	: IN std_logic; 
		led	: IN std_logic
	);
END stoppuhr;


ARCHITECTURE stoppuhr_1 OF stoppuhr IS
	COMPONENT timer IS
		PORT (
			in_clk		: IN std_logic;
			in_button1	: IN std_logic;
			in_button2	: IN std_logic;
			out_counter	: OUT std_logic_vector(15 DOWNTO 0);
			out_run		: OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT display IS
		PORT (
			in_counter	: IN std_logic_vector(15 DOWNTO 0);
			out_hex		: OUT std_logic_vector(31 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT lightshow IS
		PORT (
			in_clk		: IN std_logic;
			in_button	: IN std_logic;
			in_run		: IN std_logic;
			out_led		: OUT std_logic_vector(9 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL counter	: std_logic_vector(15 DOWNTO 0) := (others => '0');
	SIGNAL run 	: std_logic := '0';


	BEGIN
		timer_int : timer;
			PORT MAP (
				in_clk		=> clk,
				in_button1	=> button1,
				in_button2	=> button2,
				out_counter	=> counter,
				out_run		=> run
			);
		
		display_inst : display
			PORT MAP (
				in_counter	=> counter,
				out_hex		=> hex
			);
		
		lightshow_inst : lightshow
			PORT MAP (
				in_clk		=> clk,
				in_button	=> button3,
				in_run		=> run,
				out_led 	=> led
			
			);
END stoppuhr_1
		
