LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fulladder IS
 PORT (	a: IN std_logic;
	b: IN std_logic;
	c_in : IN std_logic;
	c_out : OUT std_logic;
	sum: OUT std_logic;
	carry: OUT std_logic
	);
END fulladder;

ARCHITECTURE fulladder_beahav OF fulladder IS

COMPONENT halfadder IS
	PORT ( 	a: IN std_logic;
		b: IN std_logic;
		sum: OUT std_logic;
		carry: OUT std_logic
	);
END COMPONENT;

COMPONENT or_gate IS
	PORT ( 	a: IN std_logic;
		b: IN std_logic;
		erg: OUT std_logic
	);
END COMPONENT;

SIGNAL sig1_i: std_logic := '0';
SIGNAL sig2_i: std_logic := '0';
SIGNAL sig3_i: std_logic := '0';

BEGIN
	ha_1 : halfadder
		PORT MAP ( 	
			a=>a,
			b=>b,
			sum=>sig1_i,
			carry=>sig2_i );

	ha_2 : halfadder
		PORT MAP ( 	
			a=>sig1_i,
			b=>c_in,
			sum=>sum,
			carry=>sig3_i );


	or_1 : or_gate
		PORT MAP ( 	
			a=>sig3_i,
			b=>sig2_i,
			erg=>c_out );
	
END fulladder_beahav;
