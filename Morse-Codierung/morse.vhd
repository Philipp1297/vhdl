entity morse is
	port (resetpin, sprarepin: in std_logic;
	seg7: out std_logic_vector(6 downto 0));
	led3: out std_logic_vector(2 downto 0));
