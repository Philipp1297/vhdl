LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY halfadder_test IS
END halfadder_test;


ARCHITECTURE halfadder_test OF halfadder_test IS
	COMPONENT halfadder IS
	 PORT ( a: IN std_logic;
		b: IN std_logic;
		sum: OUT std_logic;
		carry: OUT std_logic
	 );
	END COMPONENT;

	SIGNAL a_1 : std_logic := '0';
	SIGNAL b_1 : std_logic := '0';
	SIGNAL s_1 : std_logic := '0';
	SIGNAL c_1 : std_logic := '0';
BEGIN

	ha_1 : halfadder
	 PORT MAP ( 	a=> a_1,
			b=> b_1,
			sum=> s_1,
			carry=> c_1);

	stimulus : PROCESS
	BEGIN
		a_1 <='0';
		b_1 <='0';
		WAIT FOR 10ns;
		a_1 <='0';
		b_1 <='1';
		WAIT FOR 10ns;
		a_1 <='1';
		b_1 <='0';
		WAIT FOR 10ns;
		a_1 <='1';
		b_1 <='1';
		WAIT;
	END PROCESS stimulus;
END halfadder_test; 