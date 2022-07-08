LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder_4 IS
 PORT (	a: IN std_logic_vector(3 DOWNTO 0);
	b: IN std_logic_vector(3 DOWNTO 0);
	sum : OUT std_logic_vector(3 DOWNTO 0);
	carry: OUT std_logic
	);
END adder_4;

ARCHITECTURE adder_4_struct OF adder_4 IS

COMPONENT adder_4 IS
	PORT ( 	a: IN std_logic;
		b: IN std_logic;
		c_in: IN std_logic;
		sum: OUT std_logic;
		c_out: OUT std_logic
	);
END COMPONENT;
	SIGNAL c_i: std_logic_vector(2 DOWNTO 0) := "000";

BEGIN
	fa_1 : fulladder
		PORT MAP ( 	
			a=>a(0),
			b=>b(0),
			c_in =>'0',
			sum=>sum(0),
			c_out=>c_i(0));

	fa_2 : fulladder
		PORT MAP ( 	
			a=>a(1),
			b=>b(1),
			c_in =>c_i(0),
			sum=>sum(1),
			c_out=>c_i(1));

	fa_3 : fulladder
		PORT MAP ( 	
			a=>a(2),
			b=>b(2),
			c_in =>c_i(1),
			sum=>sum(2),
			c_out=>c_i(2));

	fa_4 : fulladder
		PORT MAP ( 	
			a=>a(3),
			b=>b(3),
			c_in =>c_i(2),
			sum=>sum(3),
			c_out=>carry );
END adder_4_struct;