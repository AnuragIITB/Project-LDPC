library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library work;
use work.ahir_system_global_package.all;
library ModelsimLink;
use ModelsimLink.Utility_Package.all;
use ModelsimLink.Modelsim_FLI_Foreign.all;
entity ahir_system_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of ahir_system_Test_Bench is -- 
  component ahir_system is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      aPosteriori1_out_pipe_read_data: out std_logic_vector(31 downto 0);
      aPosteriori1_out_pipe_read_req : in std_logic_vector(0 downto 0);
      aPosteriori1_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      aPosteriori2_out_pipe_read_data: out std_logic_vector(31 downto 0);
      aPosteriori2_out_pipe_read_req : in std_logic_vector(0 downto 0);
      aPosteriori2_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      aPriori1_out_pipe_read_data: out std_logic_vector(31 downto 0);
      aPriori1_out_pipe_read_req : in std_logic_vector(0 downto 0);
      aPriori1_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      aPriori2_out_pipe_read_data: out std_logic_vector(31 downto 0);
      aPriori2_out_pipe_read_req : in std_logic_vector(0 downto 0);
      aPriori2_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      code_block1_out_pipe_read_data: out std_logic_vector(31 downto 0);
      code_block1_out_pipe_read_req : in std_logic_vector(0 downto 0);
      code_block1_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      code_block2_out_pipe_read_data: out std_logic_vector(31 downto 0);
      code_block2_out_pipe_read_req : in std_logic_vector(0 downto 0);
      code_block2_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      code_block_in_pipe_write_data: in std_logic_vector(31 downto 0);
      code_block_in_pipe_write_req : in std_logic_vector(0 downto 0);
      code_block_in_pipe_write_ack : out std_logic_vector(0 downto 0);
      ebbyNo_in_pipe_write_data: in std_logic_vector(31 downto 0);
      ebbyNo_in_pipe_write_req : in std_logic_vector(0 downto 0);
      ebbyNo_in_pipe_write_ack : out std_logic_vector(0 downto 0);
      ext_info11_out_pipe_read_data: out std_logic_vector(31 downto 0);
      ext_info11_out_pipe_read_req : in std_logic_vector(0 downto 0);
      ext_info11_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      ext_info12_out_pipe_read_data: out std_logic_vector(31 downto 0);
      ext_info12_out_pipe_read_req : in std_logic_vector(0 downto 0);
      ext_info12_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      ext_info21_out_pipe_read_data: out std_logic_vector(31 downto 0);
      ext_info21_out_pipe_read_req : in std_logic_vector(0 downto 0);
      ext_info21_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      ext_info22_out_pipe_read_data: out std_logic_vector(31 downto 0);
      ext_info22_out_pipe_read_req : in std_logic_vector(0 downto 0);
      ext_info22_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      init_message11_out_pipe_read_data: out std_logic_vector(31 downto 0);
      init_message11_out_pipe_read_req : in std_logic_vector(0 downto 0);
      init_message11_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      init_message12_out_pipe_read_data: out std_logic_vector(31 downto 0);
      init_message12_out_pipe_read_req : in std_logic_vector(0 downto 0);
      init_message12_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      init_message21_out_pipe_read_data: out std_logic_vector(31 downto 0);
      init_message21_out_pipe_read_req : in std_logic_vector(0 downto 0);
      init_message21_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      init_message22_out_pipe_read_data: out std_logic_vector(31 downto 0);
      init_message22_out_pipe_read_req : in std_logic_vector(0 downto 0);
      init_message22_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      matrix_in_pipe_write_data: in std_logic_vector(15 downto 0);
      matrix_in_pipe_write_req : in std_logic_vector(0 downto 0);
      matrix_in_pipe_write_ack : out std_logic_vector(0 downto 0);
      matrix_out_pipe_read_data: out std_logic_vector(15 downto 0);
      matrix_out_pipe_read_req : in std_logic_vector(0 downto 0);
      matrix_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      maxNitr_in_pipe_write_data: in std_logic_vector(15 downto 0);
      maxNitr_in_pipe_write_req : in std_logic_vector(0 downto 0);
      maxNitr_in_pipe_write_ack : out std_logic_vector(0 downto 0);
      rate_in_pipe_write_data: in std_logic_vector(31 downto 0);
      rate_in_pipe_write_req : in std_logic_vector(0 downto 0);
      rate_in_pipe_write_ack : out std_logic_vector(0 downto 0);
      trans_info11_12_out_pipe_read_data: out std_logic_vector(31 downto 0);
      trans_info11_12_out_pipe_read_req : in std_logic_vector(0 downto 0);
      trans_info11_12_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      trans_info12_11_out_pipe_read_data: out std_logic_vector(31 downto 0);
      trans_info12_11_out_pipe_read_req : in std_logic_vector(0 downto 0);
      trans_info12_11_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      trans_info21_22_out_pipe_read_data: out std_logic_vector(31 downto 0);
      trans_info21_22_out_pipe_read_req : in std_logic_vector(0 downto 0);
      trans_info21_22_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      trans_info22_21_out_pipe_read_data: out std_logic_vector(31 downto 0);
      trans_info22_21_out_pipe_read_req : in std_logic_vector(0 downto 0);
      trans_info22_21_out_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal daemon_3_tag_in: std_logic_vector(1 downto 0);
  signal daemon_3_tag_out: std_logic_vector(1 downto 0);
  signal daemon_3_start_req : std_logic := '0';
  signal daemon_3_start_ack : std_logic := '0';
  signal daemon_3_fin_req   : std_logic := '0';
  signal daemon_3_fin_ack   : std_logic := '0';
  signal daemon_4_tag_in: std_logic_vector(1 downto 0);
  signal daemon_4_tag_out: std_logic_vector(1 downto 0);
  signal daemon_4_start_req : std_logic := '0';
  signal daemon_4_start_ack : std_logic := '0';
  signal daemon_4_fin_req   : std_logic := '0';
  signal daemon_4_fin_ack   : std_logic := '0';
  signal top_daemon_1_tag_in: std_logic_vector(1 downto 0);
  signal top_daemon_1_tag_out: std_logic_vector(1 downto 0);
  signal top_daemon_1_start_req : std_logic := '0';
  signal top_daemon_1_start_ack : std_logic := '0';
  signal top_daemon_1_fin_req   : std_logic := '0';
  signal top_daemon_1_fin_ack   : std_logic := '0';
  signal top_daemon_2_tag_in: std_logic_vector(1 downto 0);
  signal top_daemon_2_tag_out: std_logic_vector(1 downto 0);
  signal top_daemon_2_start_req : std_logic := '0';
  signal top_daemon_2_start_ack : std_logic := '0';
  signal top_daemon_2_fin_req   : std_logic := '0';
  signal top_daemon_2_fin_ack   : std_logic := '0';
  -- read from pipe aPosteriori1_out
  signal aPosteriori1_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal aPosteriori1_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal aPosteriori1_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe aPosteriori2_out
  signal aPosteriori2_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal aPosteriori2_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal aPosteriori2_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe aPriori1_out
  signal aPriori1_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal aPriori1_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal aPriori1_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe aPriori2_out
  signal aPriori2_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal aPriori2_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal aPriori2_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe code_block1_out
  signal code_block1_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal code_block1_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal code_block1_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe code_block2_out
  signal code_block2_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal code_block2_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal code_block2_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- write to pipe code_block_in
  signal code_block_in_pipe_write_data: std_logic_vector(31 downto 0);
  signal code_block_in_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal code_block_in_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe ebbyNo_in
  signal ebbyNo_in_pipe_write_data: std_logic_vector(31 downto 0);
  signal ebbyNo_in_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal ebbyNo_in_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe ext_info11_out
  signal ext_info11_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal ext_info11_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal ext_info11_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe ext_info12_out
  signal ext_info12_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal ext_info12_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal ext_info12_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe ext_info21_out
  signal ext_info21_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal ext_info21_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal ext_info21_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe ext_info22_out
  signal ext_info22_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal ext_info22_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal ext_info22_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe init_message11_out
  signal init_message11_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal init_message11_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal init_message11_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe init_message12_out
  signal init_message12_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal init_message12_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal init_message12_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe init_message21_out
  signal init_message21_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal init_message21_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal init_message21_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe init_message22_out
  signal init_message22_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal init_message22_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal init_message22_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- write to pipe matrix_in
  signal matrix_in_pipe_write_data: std_logic_vector(15 downto 0);
  signal matrix_in_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal matrix_in_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe matrix_out
  signal matrix_out_pipe_read_data: std_logic_vector(15 downto 0);
  signal matrix_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal matrix_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- write to pipe maxNitr_in
  signal maxNitr_in_pipe_write_data: std_logic_vector(15 downto 0);
  signal maxNitr_in_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal maxNitr_in_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe rate_in
  signal rate_in_pipe_write_data: std_logic_vector(31 downto 0);
  signal rate_in_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal rate_in_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe trans_info11_12_out
  signal trans_info11_12_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal trans_info11_12_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal trans_info11_12_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe trans_info12_11_out
  signal trans_info12_11_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal trans_info12_11_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal trans_info12_11_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe trans_info21_22_out
  signal trans_info21_22_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal trans_info21_22_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal trans_info21_22_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe trans_info22_21_out
  signal trans_info22_21_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal trans_info22_21_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal trans_info22_21_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  process
  begin --
    Modelsim_FLI_Initialize;
    wait until clk = '1';
    reset <= '0';
    while true loop --
      wait until clk = '0';
      Modelsim_FLI_Listen;
      Modelsim_FLI_Send;
      --
    end loop;
    wait;
    --
  end process;
  -- connect all the top-level modules to Vhpi
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("aPosteriori1_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      aPosteriori1_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("aPosteriori1_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(aPosteriori1_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("aPosteriori1_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(aPosteriori1_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("aPosteriori2_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      aPosteriori2_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("aPosteriori2_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(aPosteriori2_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("aPosteriori2_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(aPosteriori2_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("aPriori1_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      aPriori1_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("aPriori1_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(aPriori1_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("aPriori1_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(aPriori1_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("aPriori2_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      aPriori2_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("aPriori2_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(aPriori2_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("aPriori2_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(aPriori2_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("code_block1_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      code_block1_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("code_block1_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(code_block1_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("code_block1_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(code_block1_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("code_block2_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      code_block2_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("code_block2_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(code_block2_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("code_block2_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(code_block2_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("code_block_in req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      code_block_in_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("code_block_in 0");
      Modelsim_FLI_Get_Port_Value(obj_ref,port_val_string,32);
      code_block_in_pipe_write_data <= Unpack_String(port_val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("code_block_in ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(code_block_in_pipe_write_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("ebbyNo_in req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      ebbyNo_in_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ebbyNo_in 0");
      Modelsim_FLI_Get_Port_Value(obj_ref,port_val_string,32);
      ebbyNo_in_pipe_write_data <= Unpack_String(port_val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ebbyNo_in ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(ebbyNo_in_pipe_write_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("ext_info11_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      ext_info11_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ext_info11_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(ext_info11_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ext_info11_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(ext_info11_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("ext_info12_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      ext_info12_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ext_info12_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(ext_info12_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ext_info12_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(ext_info12_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("ext_info21_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      ext_info21_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ext_info21_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(ext_info21_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ext_info21_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(ext_info21_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("ext_info22_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      ext_info22_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ext_info22_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(ext_info22_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ext_info22_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(ext_info22_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("init_message11_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      init_message11_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("init_message11_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(init_message11_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("init_message11_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(init_message11_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("init_message12_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      init_message12_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("init_message12_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(init_message12_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("init_message12_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(init_message12_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("init_message21_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      init_message21_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("init_message21_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(init_message21_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("init_message21_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(init_message21_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("init_message22_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      init_message22_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("init_message22_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(init_message22_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("init_message22_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(init_message22_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("matrix_in req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      matrix_in_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("matrix_in 0");
      Modelsim_FLI_Get_Port_Value(obj_ref,port_val_string,16);
      matrix_in_pipe_write_data <= Unpack_String(port_val_string,16);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("matrix_in ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(matrix_in_pipe_write_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("matrix_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      matrix_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("matrix_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(matrix_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("matrix_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(matrix_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,16);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("maxNitr_in req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      maxNitr_in_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("maxNitr_in 0");
      Modelsim_FLI_Get_Port_Value(obj_ref,port_val_string,16);
      maxNitr_in_pipe_write_data <= Unpack_String(port_val_string,16);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("maxNitr_in ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(maxNitr_in_pipe_write_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("rate_in req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      rate_in_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("rate_in 0");
      Modelsim_FLI_Get_Port_Value(obj_ref,port_val_string,32);
      rate_in_pipe_write_data <= Unpack_String(port_val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("rate_in ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(rate_in_pipe_write_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("trans_info11_12_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      trans_info11_12_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("trans_info11_12_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(trans_info11_12_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("trans_info11_12_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(trans_info11_12_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("trans_info12_11_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      trans_info12_11_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("trans_info12_11_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(trans_info12_11_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("trans_info12_11_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(trans_info12_11_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("trans_info21_22_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      trans_info21_22_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("trans_info21_22_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(trans_info21_22_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("trans_info21_22_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(trans_info21_22_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("trans_info22_21_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      trans_info22_21_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("trans_info22_21_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(trans_info22_21_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("trans_info22_21_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(trans_info22_21_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  ahir_system_instance: ahir_system -- 
    port map ( -- 
      clk => clk,
      reset => reset,
      aPosteriori1_out_pipe_read_data  => aPosteriori1_out_pipe_read_data, 
      aPosteriori1_out_pipe_read_req  => aPosteriori1_out_pipe_read_req, 
      aPosteriori1_out_pipe_read_ack  => aPosteriori1_out_pipe_read_ack ,
      aPosteriori2_out_pipe_read_data  => aPosteriori2_out_pipe_read_data, 
      aPosteriori2_out_pipe_read_req  => aPosteriori2_out_pipe_read_req, 
      aPosteriori2_out_pipe_read_ack  => aPosteriori2_out_pipe_read_ack ,
      aPriori1_out_pipe_read_data  => aPriori1_out_pipe_read_data, 
      aPriori1_out_pipe_read_req  => aPriori1_out_pipe_read_req, 
      aPriori1_out_pipe_read_ack  => aPriori1_out_pipe_read_ack ,
      aPriori2_out_pipe_read_data  => aPriori2_out_pipe_read_data, 
      aPriori2_out_pipe_read_req  => aPriori2_out_pipe_read_req, 
      aPriori2_out_pipe_read_ack  => aPriori2_out_pipe_read_ack ,
      code_block1_out_pipe_read_data  => code_block1_out_pipe_read_data, 
      code_block1_out_pipe_read_req  => code_block1_out_pipe_read_req, 
      code_block1_out_pipe_read_ack  => code_block1_out_pipe_read_ack ,
      code_block2_out_pipe_read_data  => code_block2_out_pipe_read_data, 
      code_block2_out_pipe_read_req  => code_block2_out_pipe_read_req, 
      code_block2_out_pipe_read_ack  => code_block2_out_pipe_read_ack ,
      code_block_in_pipe_write_data  => code_block_in_pipe_write_data, 
      code_block_in_pipe_write_req  => code_block_in_pipe_write_req, 
      code_block_in_pipe_write_ack  => code_block_in_pipe_write_ack,
      ebbyNo_in_pipe_write_data  => ebbyNo_in_pipe_write_data, 
      ebbyNo_in_pipe_write_req  => ebbyNo_in_pipe_write_req, 
      ebbyNo_in_pipe_write_ack  => ebbyNo_in_pipe_write_ack,
      ext_info11_out_pipe_read_data  => ext_info11_out_pipe_read_data, 
      ext_info11_out_pipe_read_req  => ext_info11_out_pipe_read_req, 
      ext_info11_out_pipe_read_ack  => ext_info11_out_pipe_read_ack ,
      ext_info12_out_pipe_read_data  => ext_info12_out_pipe_read_data, 
      ext_info12_out_pipe_read_req  => ext_info12_out_pipe_read_req, 
      ext_info12_out_pipe_read_ack  => ext_info12_out_pipe_read_ack ,
      ext_info21_out_pipe_read_data  => ext_info21_out_pipe_read_data, 
      ext_info21_out_pipe_read_req  => ext_info21_out_pipe_read_req, 
      ext_info21_out_pipe_read_ack  => ext_info21_out_pipe_read_ack ,
      ext_info22_out_pipe_read_data  => ext_info22_out_pipe_read_data, 
      ext_info22_out_pipe_read_req  => ext_info22_out_pipe_read_req, 
      ext_info22_out_pipe_read_ack  => ext_info22_out_pipe_read_ack ,
      init_message11_out_pipe_read_data  => init_message11_out_pipe_read_data, 
      init_message11_out_pipe_read_req  => init_message11_out_pipe_read_req, 
      init_message11_out_pipe_read_ack  => init_message11_out_pipe_read_ack ,
      init_message12_out_pipe_read_data  => init_message12_out_pipe_read_data, 
      init_message12_out_pipe_read_req  => init_message12_out_pipe_read_req, 
      init_message12_out_pipe_read_ack  => init_message12_out_pipe_read_ack ,
      init_message21_out_pipe_read_data  => init_message21_out_pipe_read_data, 
      init_message21_out_pipe_read_req  => init_message21_out_pipe_read_req, 
      init_message21_out_pipe_read_ack  => init_message21_out_pipe_read_ack ,
      init_message22_out_pipe_read_data  => init_message22_out_pipe_read_data, 
      init_message22_out_pipe_read_req  => init_message22_out_pipe_read_req, 
      init_message22_out_pipe_read_ack  => init_message22_out_pipe_read_ack ,
      matrix_in_pipe_write_data  => matrix_in_pipe_write_data, 
      matrix_in_pipe_write_req  => matrix_in_pipe_write_req, 
      matrix_in_pipe_write_ack  => matrix_in_pipe_write_ack,
      matrix_out_pipe_read_data  => matrix_out_pipe_read_data, 
      matrix_out_pipe_read_req  => matrix_out_pipe_read_req, 
      matrix_out_pipe_read_ack  => matrix_out_pipe_read_ack ,
      maxNitr_in_pipe_write_data  => maxNitr_in_pipe_write_data, 
      maxNitr_in_pipe_write_req  => maxNitr_in_pipe_write_req, 
      maxNitr_in_pipe_write_ack  => maxNitr_in_pipe_write_ack,
      rate_in_pipe_write_data  => rate_in_pipe_write_data, 
      rate_in_pipe_write_req  => rate_in_pipe_write_req, 
      rate_in_pipe_write_ack  => rate_in_pipe_write_ack,
      trans_info11_12_out_pipe_read_data  => trans_info11_12_out_pipe_read_data, 
      trans_info11_12_out_pipe_read_req  => trans_info11_12_out_pipe_read_req, 
      trans_info11_12_out_pipe_read_ack  => trans_info11_12_out_pipe_read_ack ,
      trans_info12_11_out_pipe_read_data  => trans_info12_11_out_pipe_read_data, 
      trans_info12_11_out_pipe_read_req  => trans_info12_11_out_pipe_read_req, 
      trans_info12_11_out_pipe_read_ack  => trans_info12_11_out_pipe_read_ack ,
      trans_info21_22_out_pipe_read_data  => trans_info21_22_out_pipe_read_data, 
      trans_info21_22_out_pipe_read_req  => trans_info21_22_out_pipe_read_req, 
      trans_info21_22_out_pipe_read_ack  => trans_info21_22_out_pipe_read_ack ,
      trans_info22_21_out_pipe_read_data  => trans_info22_21_out_pipe_read_data, 
      trans_info22_21_out_pipe_read_req  => trans_info22_21_out_pipe_read_req, 
      trans_info22_21_out_pipe_read_ack  => trans_info22_21_out_pipe_read_ack ); -- 
  -- 
end VhpiLink;
