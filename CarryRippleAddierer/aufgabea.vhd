LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY halfadder IS
 PORT (	a: IN std_logic;
	b: IN std_logic;
	sum: OUT std_logic;
	carry: OUT std_logic
	);
END halfadder;

ARCHITECTURE halfadder_behav OF halfadder IS
BEGIN
	sum <= ((NOT a) AND b) OR (a AND (NOT b));
	carry <= (a AND b);

END halfadder_behav;
