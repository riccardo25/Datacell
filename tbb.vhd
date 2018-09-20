--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:23:42 09/07/2018
-- Design Name:   
-- Module Name:   D:/Repository/XILINX/aes/tbb.vhd
-- Project Name:  aes
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: datacell
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbb IS
END tbb;
 
ARCHITECTURE behavior OF tbb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT datacell
    PORT(
         CLK : IN  std_logic;
         rst_n : IN  std_logic;
         in_right : IN  std_logic_vector(7 downto 0);
         up_in : IN  std_logic_vector(7 downto 0);
         key : IN  std_logic_vector(7 downto 0);
         s0c : IN  std_logic_vector(7 downto 0);
         s1c : IN  std_logic_vector(7 downto 0);
         s2c : IN  std_logic_vector(7 downto 0);
         s3c : IN  std_logic_vector(7 downto 0);
         key_lenght : IN  std_logic_vector(1 downto 0);
         cell_num : IN  std_logic_vector(3 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal rst_n : std_logic := '0';
   signal in_right : std_logic_vector(7 downto 0) := "00000001";
   signal up_in : std_logic_vector(7 downto 0) := (others => '0');
   signal key : std_logic_vector(7 downto 0) := (others => '0');
   signal s0c : std_logic_vector(7 downto 0) := "00000000";
   signal s1c : std_logic_vector(7 downto 0) := "00000100";
   signal s2c : std_logic_vector(7 downto 0) := "00001000";
   signal s3c : std_logic_vector(7 downto 0) := "00001100";
   signal key_lenght : std_logic_vector(1 downto 0) := (others => '0');
   signal cell_num : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: datacell PORT MAP (
          CLK => CLK,
          rst_n => rst_n,
          in_right => in_right,
          up_in => up_in,
          key => key,
          s0c => s0c,
          s1c => s1c,
          s2c => s2c,
          s3c => s3c,
          key_lenght => key_lenght,
          cell_num => cell_num,
          data_out => data_out
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;
		rst_n <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
