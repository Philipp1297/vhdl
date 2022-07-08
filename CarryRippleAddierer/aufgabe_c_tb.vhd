LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder_4_tb IS
END adder_4_tb;

ARCHITECTURE adder_4_test OF adder_4_tb IS
	COMPONENT adder_4 IS
	 PORT ( a: IN std_logic_vector(3 DOWNTO 0);
		b: IN std_logic_vector(3 DOWNTO 0);
		sum: IN std_logic_vector(3 DOWNTO 0);
		carry: OUT std_logic
	 );
	END COMPONENT;

SIGNAL a_i : std_logic_vector(3 DOWNTO 0) := "0000";
SIGNAL b_i : std_logic_vector(3 DOWNTO 0) := "0000";
SIGNAL s_i : std_logic_vector(3 DOWNTO 0) := "0000";
SIGNAL c_i : std_logic := '0';
	
BEGIN

	fa_1 : adder_4
	 PORT MAP ( 	a=> a_i,
			b=> b_i,
			sum=> s_i,
			carry=> c_i );
	stimulus : PROCESS
	BEGIN
		a_i <="0010";
		b_i <="0111";
		WAIT FOR 10ns;
		a_i <="1111";
		b_i <="0001";
		WAIT FOR 10ns;
		a_i <="1010";
		b_i <="0101";
		WAIT FOR 10ns;
		a_i <="1111";
		b_i <="1111";
		WAIT;
	END PROCESS stimulus;
END adder_4_test; 