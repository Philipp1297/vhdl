LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fulladder_test IS
END fulladder_test;


ARCHITECTURE fulladder_test OF fulladder_test IS
	COMPONENT fulladder IS
	 PORT ( a: IN std_logic;
		b: IN std_logic;
		c_in: IN std_logic;
		c_out: OUT std_logic;
		sum: OUT std_logic;
		carry: OUT std_logic
	 );
	END COMPONENT;

	SIGNAL a_1 : std_logic := '0';
	SIGNAL b_1 : std_logic := '0';
	SIGNAL s_1 : std_logic := '0';
	SIGNAL cin_1 : std_logic := '0';
	SIGNAL cout_1 : std_logic := '0';
	SIGNAL carry_1 : std_logic := '0';
	
BEGIN

	fa_1 : fulladder
	 PORT MAP ( 	a=> a_1,
			b=> b_1,
			c_in =>cin_1,
			c_out =>cout_1,
			sum=> s_1,
			carry=> carry_1 );
	stimulus : PROCESS
	BEGIN
		a_1 <='0';
		b_1 <='0';
		cin_1 <='0';
		WAIT FOR 10ns;
		a_1 <='0';
		b_1 <='1';
		cin_1 <='0';
		WAIT FOR 10ns;
		a_1 <='1';
		b_1 <='0';
		cin_1 <='0';
		WAIT FOR 10ns;
		a_1 <='1';
		b_1 <='1';
		cin_1 <='0';
		WAIT FOR 10ns;
		a_1 <='1';
		b_1 <='1';
		cin_1 <='1';
		WAIT FOR 10ns;
		a_1 <='0';
		b_1 <='1';
		cin_1 <='0';
		WAIT FOR 10ns;
		a_1 <='1';
		b_1 <='0';
		cin_1 <='0';
		WAIT FOR 10ns;
		a_1 <='0';
		b_1 <='1';
		cin_1 <='1';
		WAIT FOR 10ns;
		a_1 <='1';
		b_1 <='0';
		cin_1 <='1';
		WAIT;
	END PROCESS stimulus;
END fulladder_test; 