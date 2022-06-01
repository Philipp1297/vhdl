LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY stoppuhr IS
 	PORT (
		clk 	: IN std_logic;
		button1	: IN std_logic;
 		button2	: IN std_logic;
		button3	: IN std_logic;
		hex	: IN std_logic; 
		led	: IN std_logic;
	);
END stoppuhr;


ARCHITECTURE stoppuhr_1 OF stoppuhr IS
	COMPONENT timer IS
		PORT (
			in_clk	IN
			in_button1
			in_button2
			out_counter	: OUT
			out_run		: OUT
