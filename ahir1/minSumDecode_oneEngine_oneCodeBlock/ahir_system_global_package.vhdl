-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package ahir_system_global_package is -- 
  constant ADDOP : std_logic_vector(7 downto 0) := "00000000";
  constant MULOP : std_logic_vector(7 downto 0) := "00000010";
  constant SUBOP : std_logic_vector(7 downto 0) := "00000001";
  constant aPosteriori_base_address : std_logic_vector(13 downto 0) := "00000000000000";
  constant aPriori_base_address : std_logic_vector(13 downto 0) := "00000000000000";
  constant c_ONE_64 : std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
  constant c_ZERO_1 : std_logic_vector(0 downto 0) := "0";
  constant code_block_base_address : std_logic_vector(13 downto 0) := "00000000000000";
  constant ebbyNo_base_address : std_logic_vector(0 downto 0) := "0";
  constant ext_info_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant fp_d_ZERO : std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  constant maxNitr_base_address : std_logic_vector(0 downto 0) := "0";
  constant mem_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant message_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant progx_xoptx_xo_iNtErNal_xx_xstr7_base_address : std_logic_vector(4 downto 0) := "00000";
  constant rate_base_address : std_logic_vector(0 downto 0) := "0";
  constant stderr_base_address : std_logic_vector(0 downto 0) := "0";
  -- 
end package ahir_system_global_package;
