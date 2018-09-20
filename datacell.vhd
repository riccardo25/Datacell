
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity datacell is
port (
		CLK, rst_n 					: in std_logic;

		-- data inputs

		in_right, up_in, key		: in std_logic_vector (7 downto 0);
		s0c, s1c, s2c, s3c		: in std_logic_vector (7 downto 0);
		key_lenght 					: in std_logic_vector (1 downto 0);
		cell_num 					: in std_logic_vector (3 downto 0);

		-- data outputs

		data_out 					: out std_logic_vector (7 downto 0)
	);
end datacell;

architecture arc of datacell is


component datacell_datapath is
port (
		CLK, rst_n 							: in std_logic;
		sel_round, sel_mix, sel_state	: in std_logic_vector (1 downto 0);
		sel_right							: in std_logic;
		load_round, load_state			: in std_logic;
		in_right, up_in, key				: in std_logic_vector (7 downto 0);
		s0c, s1c, s2c, s3c				: in std_logic_vector (7 downto 0);
		cell_num 							: in std_logic_vector (3 downto 0);
		STT									: out std_logic_vector (7 downto 0);
		ROUND									: out std_logic_vector (3 downto 0)
	);
end component;

component datacell_control is
port (
		CLK, rst_n 							: in std_logic;
		--STT									: in std_logic_vector (7 downto 0);
		ROUND									: in std_logic_vector (3 downto 0);
		key_lenght							: in std_logic_vector (1 downto 0);
		sel_round, sel_mix, sel_state	: out std_logic_vector (1 downto 0);
		sel_right							: out std_logic;
		load_round, load_state			: out std_logic
	);
end component;

	signal STT									: std_logic_vector (7 downto 0);
	signal ROUND								: std_logic_vector (3 downto 0);
	signal sel_round, sel_mix, sel_state: std_logic_vector (1 downto 0);
	signal sel_right							: std_logic;
	signal load_round, load_state			: std_logic;
	

begin


	DATAPATH: datacell_datapath port map(CLK => CLK, rst_n => rst_n, 
		sel_round => sel_round, sel_mix =>sel_mix, sel_state => sel_state,
		sel_right => sel_right, load_round => load_round, load_state => load_state,
		in_right => in_right, up_in => up_in, key => key,
		s0c => s0c, s1c => s1c, s2c => s2c, s3c => s3c,
		cell_num => cell_num, STT => STT, ROUND => ROUND);
		
	CONTROLUNIT: datacell_control port map(CLK => CLK, rst_n => rst_n, 
		ROUND => ROUND,	key_lenght => key_lenght,
		sel_round => sel_round, sel_mix => sel_mix, sel_state => sel_state,
		sel_right => sel_right,load_round => load_round, load_state => load_state);
		
-- OUTPUT
	data_out <= STT;

end arc;

