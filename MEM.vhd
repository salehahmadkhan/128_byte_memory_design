--Library
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--entity
ENTITY MEM IS
PORT(clk,RE,WE: IN STD_LOGIC;
data_in: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
data_out: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
address: IN INTEGER RANGE 0 TO 127);
END MEM;

--architecture
ARCHITECTURE behavioral_mem OF MEM IS

TYPE mem IS ARRAY(0 TO 127) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ram_block:mem;
BEGIN
	PROCESS(clk)
	BEGIN
		IF(RISING_EDGE(clk)) THEN
			IF ((WE='1') AND (RE='0')) THEN
				ram_block(address)<= data_in; --write operation
			ELSIF ((WE='0') AND (RE='1')) THEN
				data_out<= ram_block(address); --read operation
			END IF;
		END IF;
	END PROCESS;
END behavioral_mem;