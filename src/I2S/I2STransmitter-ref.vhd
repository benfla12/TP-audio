library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity I2STransmitter is
  generic (
    CLK_FREQUENCY_HZ: positive := 51200000;
    MASTER_FREQUENCY_HZ: positive range 512e3 to 50e6 := 5120000;
    SAMPLE_RATE_HZ: positive range 2e3 to 200e3 := 20000;
    BITS_PER_SAMPLE: positive range 16 to 24 := 16
  );
  port (
    clk_i: in std_logic;
    reset_i: in std_logic;
    valid_i: in std_logic;
    ready_o: out std_logic;
    left_data_i: in signed (BITS_PER_SAMPLE - 1 downto 0);
    right_data_i: in signed (BITS_PER_SAMPLE - 1 downto 0);
    master_clk_o: out std_logic;
    serial_clk_o: out std_logic;
    serial_data_o: out std_logic;
    left_right_clk_o: out std_logic
  );
end I2STransmitter;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of i2stransmitter is
  signal wrap_clk_i: std_logic;
  signal wrap_reset_i: std_logic;
  signal wrap_valid_i: std_logic;
  subtype typwrap_left_data_i is std_logic_vector (15 downto 0);
  signal wrap_left_data_i: typwrap_left_data_i;
  subtype typwrap_right_data_i is std_logic_vector (15 downto 0);
  signal wrap_right_data_i: typwrap_right_data_i;
  signal wrap_ready_o: std_logic;
  signal wrap_master_clk_o: std_logic;
  signal wrap_serial_clk_o: std_logic;
  signal wrap_serial_data_o: std_logic;
  signal wrap_left_right_clk_o: std_logic;
  signal master_timer_reg : std_logic_vector (3 downto 0);
  signal master_half : std_logic;
  signal master_cycle : std_logic;
  signal master_clk_reg : std_logic;
  signal serial_timer_reg : std_logic_vector (2 downto 0);
  signal serial_half : std_logic;
  signal serial_cycle : std_logic;
  signal serial_clk_reg : std_logic;
  signal bit_index_reg : std_logic_vector (4 downto 0);
  signal left_right_half : std_logic;
  signal left_right_cycle : std_logic;
  signal left_right_clk_reg : std_logic;
  signal data_reg : std_logic_vector (31 downto 0);
  signal n6_o : std_logic;
  signal n7_o : std_logic_vector (31 downto 0);
  signal n9_o : std_logic_vector (31 downto 0);
  signal n10_o : std_logic_vector (3 downto 0);
  signal n12_o : std_logic_vector (3 downto 0);
  signal n17_q : std_logic_vector (3 downto 0);
  signal n18_o : std_logic_vector (31 downto 0);
  signal n20_o : std_logic;
  signal n21_o : std_logic_vector (31 downto 0);
  signal n23_o : std_logic;
  signal n25_o : std_logic;
  signal n26_o : std_logic;
  signal n27_o : std_logic;
  signal n33_o : std_logic;
  signal n34_q : std_logic;
  signal n36_o : std_logic;
  signal n37_o : std_logic_vector (31 downto 0);
  signal n39_o : std_logic_vector (31 downto 0);
  signal n40_o : std_logic_vector (2 downto 0);
  signal n41_o : std_logic_vector (2 downto 0);
  signal n43_o : std_logic_vector (2 downto 0);
  signal n48_q : std_logic_vector (2 downto 0);
  signal n49_o : std_logic_vector (31 downto 0);
  signal n51_o : std_logic;
  signal n52_o : std_logic;
  signal n53_o : std_logic_vector (31 downto 0);
  signal n55_o : std_logic;
  signal n56_o : std_logic;
  signal n58_o : std_logic;
  signal n59_o : std_logic;
  signal n60_o : std_logic;
  signal n66_o : std_logic;
  signal n67_q : std_logic;
  signal n69_o : std_logic;
  signal n70_o : std_logic_vector (31 downto 0);
  signal n72_o : std_logic;
  signal n73_o : std_logic_vector (31 downto 0);
  signal n75_o : std_logic_vector (31 downto 0);
  signal n76_o : std_logic_vector (4 downto 0);
  signal n78_o : std_logic_vector (4 downto 0);
  signal n79_o : std_logic_vector (4 downto 0);
  signal n81_o : std_logic_vector (4 downto 0);
  signal n84_q : std_logic_vector (4 downto 0);
  signal n85_o : std_logic_vector (31 downto 0);
  signal n87_o : std_logic;
  signal n88_o : std_logic;
  signal n89_o : std_logic_vector (31 downto 0);
  signal n91_o : std_logic;
  signal n92_o : std_logic;
  signal n94_o : std_logic;
  signal n95_o : std_logic;
  signal n96_o : std_logic;
  signal n102_o : std_logic;
  signal n103_q : std_logic;
  signal n105_o : std_logic;
  signal n106_o : std_logic_vector (31 downto 0);
  signal n108_o : std_logic;
  signal n109_o : std_logic;
  signal n110_o : std_logic;
  signal n111_o : std_logic_vector (31 downto 0);
  signal n117_o : std_logic_vector (31 downto 0);
  signal n118_q : std_logic_vector (31 downto 0);
  signal n122_o : std_logic_vector (31 downto 0);
  signal n124_o : std_logic;
  signal n125_o : std_logic;
  signal n126_o : std_logic;
  signal n128_o : std_logic;
  signal n129_o : std_logic;
  signal n130_o : std_logic;
  signal n131_o : std_logic;
  signal n132_o : std_logic;
  signal n133_o : std_logic;
  signal n134_o : std_logic;
  signal n135_o : std_logic;
  signal n136_o : std_logic;
  signal n137_o : std_logic;
  signal n138_o : std_logic;
  signal n139_o : std_logic;
  signal n140_o : std_logic;
  signal n141_o : std_logic;
  signal n142_o : std_logic;
  signal n143_o : std_logic;
  signal n144_o : std_logic;
  signal n145_o : std_logic;
  signal n146_o : std_logic;
  signal n147_o : std_logic;
  signal n148_o : std_logic;
  signal n149_o : std_logic;
  signal n150_o : std_logic;
  signal n151_o : std_logic;
  signal n152_o : std_logic;
  signal n153_o : std_logic;
  signal n154_o : std_logic;
  signal n155_o : std_logic;
  signal n156_o : std_logic;
  signal n157_o : std_logic;
  signal n158_o : std_logic;
  signal n159_o : std_logic;
  signal n160_o : std_logic_vector (1 downto 0);
  signal n161_o : std_logic;
  signal n162_o : std_logic_vector (1 downto 0);
  signal n163_o : std_logic;
  signal n164_o : std_logic_vector (1 downto 0);
  signal n165_o : std_logic;
  signal n166_o : std_logic_vector (1 downto 0);
  signal n167_o : std_logic;
  signal n168_o : std_logic_vector (1 downto 0);
  signal n169_o : std_logic;
  signal n170_o : std_logic_vector (1 downto 0);
  signal n171_o : std_logic;
  signal n172_o : std_logic_vector (1 downto 0);
  signal n173_o : std_logic;
  signal n174_o : std_logic_vector (1 downto 0);
  signal n175_o : std_logic;
  signal n176_o : std_logic_vector (1 downto 0);
  signal n177_o : std_logic;
  signal n178_o : std_logic_vector (1 downto 0);
  signal n179_o : std_logic;
  signal n180_o : std_logic;
  signal n181_o : std_logic;
begin
  wrap_clk_i <= clk_i;
  wrap_reset_i <= reset_i;
  wrap_valid_i <= valid_i;
  wrap_left_data_i <= typwrap_left_data_i(left_data_i);
  wrap_right_data_i <= typwrap_right_data_i(right_data_i);
  ready_o <= wrap_ready_o;
  master_clk_o <= wrap_master_clk_o;
  serial_clk_o <= wrap_serial_clk_o;
  serial_data_o <= wrap_serial_data_o;
  left_right_clk_o <= wrap_left_right_clk_o;
  wrap_ready_o <= n126_o;
  wrap_master_clk_o <= master_clk_reg;
  wrap_serial_clk_o <= serial_clk_reg;
  wrap_serial_data_o <= n181_o;
  wrap_left_right_clk_o <= left_right_clk_reg;
  -- I2STransmitter.vhd:45:12
  master_timer_reg <= n17_q; -- (signal)
  -- I2STransmitter.vhd:47:12
  master_half <= n20_o; -- (signal)
  -- I2STransmitter.vhd:47:25
  master_cycle <= n23_o; -- (signal)
  -- I2STransmitter.vhd:49:12
  master_clk_reg <= n34_q; -- (signal)
  -- I2STransmitter.vhd:53:12
  serial_timer_reg <= n48_q; -- (signal)
  -- I2STransmitter.vhd:55:12
  serial_half <= n52_o; -- (signal)
  -- I2STransmitter.vhd:55:25
  serial_cycle <= n56_o; -- (signal)
  -- I2STransmitter.vhd:57:12
  serial_clk_reg <= n67_q; -- (signal)
  -- I2STransmitter.vhd:59:12
  bit_index_reg <= n84_q; -- (signal)
  -- I2STransmitter.vhd:61:12
  left_right_half <= n88_o; -- (signal)
  -- I2STransmitter.vhd:61:29
  left_right_cycle <= n92_o; -- (signal)
  -- I2STransmitter.vhd:63:12
  left_right_clk_reg <= n103_q; -- (signal)
  -- I2STransmitter.vhd:65:12
  data_reg <= n118_q; -- (signal)
  -- I2STransmitter.vhd:75:15
  -- n6_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- I2STransmitter.vhd:79:54
  n7_o <= "0000000000000000000000000000" & master_timer_reg;  --  uext
  -- I2STransmitter.vhd:79:54
  n9_o <= std_logic_vector (unsigned (n7_o) + unsigned'("00000000000000000000000000000001"));
  -- I2STransmitter.vhd:79:37
  n10_o <= n9_o (3 downto 0);  --  trunc
  -- I2STransmitter.vhd:76:13
  n12_o <= n10_o when master_cycle = '0' else "0000";
  -- I2STransmitter.vhd:75:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n17_q <= "0000";
    elsif rising_edge (wrap_clk_i) then
      n17_q <= n12_o;
    end if;
  end process;
  -- I2STransmitter.vhd:84:38
  n18_o <= "0000000000000000000000000000" & master_timer_reg;  --  uext
  -- I2STransmitter.vhd:84:38
  n20_o <= '1' when n18_o = "00000000000000000000000000000100" else '0';
  -- I2STransmitter.vhd:85:38
  n21_o <= "0000000000000000000000000000" & master_timer_reg;  --  uext
  -- I2STransmitter.vhd:85:38
  n23_o <= '1' when n21_o = "00000000000000000000000000001001" else '0';
  -- I2STransmitter.vhd:91:15
  -- n25_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- I2STransmitter.vhd:92:28
  n26_o <= master_half or master_cycle;
  -- I2STransmitter.vhd:93:35
  n27_o <= not master_clk_reg;
  -- I2STransmitter.vhd:92:28
  n33_o <= master_clk_reg when n26_o = '0' else n27_o;
  -- I2STransmitter.vhd:91:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n34_q <= '0';
    elsif rising_edge (wrap_clk_i) then
      n34_q <= n33_o;
    end if;
  end process;
  -- I2STransmitter.vhd:108:15
  -- n36_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- I2STransmitter.vhd:112:54
  n37_o <= "00000000000000000000000000000" & serial_timer_reg;  --  uext
  -- I2STransmitter.vhd:112:54
  n39_o <= std_logic_vector (unsigned (n37_o) + unsigned'("00000000000000000000000000000001"));
  -- I2STransmitter.vhd:112:37
  n40_o <= n39_o (2 downto 0);  --  trunc
  -- I2STransmitter.vhd:111:13
  n41_o <= serial_timer_reg when master_cycle = '0' else n40_o;
  -- I2STransmitter.vhd:109:13
  n43_o <= n41_o when serial_cycle = '0' else "000";
  -- I2STransmitter.vhd:108:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n48_q <= "000";
    elsif rising_edge (wrap_clk_i) then
      n48_q <= n43_o;
    end if;
  end process;
  -- I2STransmitter.vhd:117:55
  n49_o <= "00000000000000000000000000000" & serial_timer_reg;  --  uext
  -- I2STransmitter.vhd:117:55
  n51_o <= '1' when n49_o = "00000000000000000000000000000011" else '0';
  -- I2STransmitter.vhd:117:34
  n52_o <= master_cycle and n51_o;
  -- I2STransmitter.vhd:118:55
  n53_o <= "00000000000000000000000000000" & serial_timer_reg;  --  uext
  -- I2STransmitter.vhd:118:55
  n55_o <= '1' when n53_o = "00000000000000000000000000000111" else '0';
  -- I2STransmitter.vhd:118:34
  n56_o <= master_cycle and n55_o;
  -- I2STransmitter.vhd:124:15
  -- n58_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- I2STransmitter.vhd:125:28
  n59_o <= serial_half or serial_cycle;
  -- I2STransmitter.vhd:126:35
  n60_o <= not serial_clk_reg;
  -- I2STransmitter.vhd:125:28
  n66_o <= serial_clk_reg when n59_o = '0' else n60_o;
  -- I2STransmitter.vhd:124:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n67_q <= '0';
    elsif rising_edge (wrap_clk_i) then
      n67_q <= n66_o;
    end if;
  end process;
  -- I2STransmitter.vhd:139:12
  -- n69_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- I2STransmitter.vhd:143:34
  n70_o <= "000000000000000000000000000" & bit_index_reg;  --  uext
  -- I2STransmitter.vhd:143:34
  n72_o <= '1' when n70_o = "00000000000000000000000000000000" else '0';
  -- I2STransmitter.vhd:146:52
  n73_o <= "000000000000000000000000000" & bit_index_reg;  --  uext
  -- I2STransmitter.vhd:146:52
  n75_o <= std_logic_vector (unsigned (n73_o) - unsigned'("00000000000000000000000000000001"));
  -- I2STransmitter.vhd:146:38
  n76_o <= n75_o (4 downto 0);  --  trunc
  -- I2STransmitter.vhd:143:17
  n78_o <= n76_o when n72_o = '0' else "11111";
  -- I2STransmitter.vhd:142:13
  n79_o <= bit_index_reg when serial_cycle = '0' else n78_o;
  -- I2STransmitter.vhd:140:13
  n81_o <= n79_o when wrap_reset_i = '0' else "00000";
  -- I2STransmitter.vhd:139:9
  process (wrap_clk_i)
  begin
    if rising_edge (wrap_clk_i) then
      n84_q <= n81_o;
    end if;
  end process;
  -- I2STransmitter.vhd:152:56
  n85_o <= "000000000000000000000000000" & bit_index_reg;  --  uext
  -- I2STransmitter.vhd:152:56
  n87_o <= '1' when n85_o = "00000000000000000000000000010001" else '0';
  -- I2STransmitter.vhd:152:38
  n88_o <= serial_cycle and n87_o;
  -- I2STransmitter.vhd:153:56
  n89_o <= "000000000000000000000000000" & bit_index_reg;  --  uext
  -- I2STransmitter.vhd:153:56
  n91_o <= '1' when n89_o = "00000000000000000000000000000001" else '0';
  -- I2STransmitter.vhd:153:38
  n92_o <= serial_cycle and n91_o;
  -- I2STransmitter.vhd:159:15
  -- n94_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- I2STransmitter.vhd:160:32
  n95_o <= left_right_half or left_right_cycle;
  -- I2STransmitter.vhd:161:39
  n96_o <= not left_right_clk_reg;
  -- I2STransmitter.vhd:160:32
  n102_o <= left_right_clk_reg when n95_o = '0' else n96_o;
  -- I2STransmitter.vhd:159:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n103_q <= '0';
    elsif rising_edge (wrap_clk_i) then
      n103_q <= n102_o;
    end if;
  end process;
  -- I2STransmitter.vhd:176:15
  -- n105_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- I2STransmitter.vhd:177:47
  n106_o <= "000000000000000000000000000" & bit_index_reg;  --  uext
  -- I2STransmitter.vhd:177:47
  n108_o <= '1' when n106_o = "00000000000000000000000000000000" else '0';
  -- I2STransmitter.vhd:177:29
  n109_o <= serial_cycle and n108_o;
  -- I2STransmitter.vhd:177:51
  n110_o <= n109_o and wrap_valid_i;
  -- I2STransmitter.vhd:178:41
  n111_o <= wrap_left_data_i & wrap_right_data_i;
  -- I2STransmitter.vhd:177:51
  n117_o <= data_reg when n110_o = '0' else n111_o;
  -- I2STransmitter.vhd:176:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n118_q <= "00000000000000000000000000000000";
    elsif rising_edge (wrap_clk_i) then
      n118_q <= n117_o;
    end if;
  end process;
  -- I2STransmitter.vhd:189:56
  n122_o <= "000000000000000000000000000" & bit_index_reg;  --  uext
  -- I2STransmitter.vhd:189:56
  n124_o <= '1' when n122_o = "00000000000000000000000000000000" else '0';
  -- I2STransmitter.vhd:189:38
  n125_o <= serial_cycle and n124_o;
  -- I2STransmitter.vhd:189:20
  n126_o <= '0' when n125_o = '0' else '1';
  -- I2STransmitter.vhd:37:9
  n128_o <= data_reg (0);
  -- I2STransmitter.vhd:35:9
  n129_o <= data_reg (1);
  -- I2STransmitter.vhd:33:9
  n130_o <= data_reg (2);
  -- I2STransmitter.vhd:31:9
  n131_o <= data_reg (3);
  -- I2STransmitter.vhd:25:9
  n132_o <= data_reg (4);
  n133_o <= data_reg (5);
  -- I2STransmitter.vhd:176:9
  n134_o <= data_reg (6);
  -- I2STransmitter.vhd:172:5
  n135_o <= data_reg (7);
  n136_o <= data_reg (8);
  -- I2STransmitter.vhd:159:9
  n137_o <= data_reg (9);
  -- I2STransmitter.vhd:155:5
  n138_o <= data_reg (10);
  n139_o <= data_reg (11);
  -- I2STransmitter.vhd:137:5
  n140_o <= data_reg (12);
  n141_o <= data_reg (13);
  -- I2STransmitter.vhd:124:9
  n142_o <= data_reg (14);
  -- I2STransmitter.vhd:120:5
  n143_o <= data_reg (15);
  n144_o <= data_reg (16);
  -- I2STransmitter.vhd:104:5
  n145_o <= data_reg (17);
  n146_o <= data_reg (18);
  -- I2STransmitter.vhd:91:9
  n147_o <= data_reg (19);
  -- I2STransmitter.vhd:87:5
  n148_o <= data_reg (20);
  n149_o <= data_reg (21);
  -- I2STransmitter.vhd:71:5
  n150_o <= data_reg (22);
  n151_o <= data_reg (23);
  n152_o <= data_reg (24);
  n153_o <= data_reg (25);
  n154_o <= data_reg (26);
  n155_o <= data_reg (27);
  n156_o <= data_reg (28);
  n157_o <= data_reg (29);
  n158_o <= data_reg (30);
  n159_o <= data_reg (31);
  -- I2STransmitter.vhd:183:30
  n160_o <= bit_index_reg (1 downto 0);
  -- I2STransmitter.vhd:183:30
  with n160_o select n161_o <=
    n128_o when "00",
    n129_o when "01",
    n130_o when "10",
    n131_o when "11",
    'X' when others;
  -- I2STransmitter.vhd:183:30
  n162_o <= bit_index_reg (1 downto 0);
  -- I2STransmitter.vhd:183:30
  with n162_o select n163_o <=
    n132_o when "00",
    n133_o when "01",
    n134_o when "10",
    n135_o when "11",
    'X' when others;
  -- I2STransmitter.vhd:183:30
  n164_o <= bit_index_reg (1 downto 0);
  -- I2STransmitter.vhd:183:30
  with n164_o select n165_o <=
    n136_o when "00",
    n137_o when "01",
    n138_o when "10",
    n139_o when "11",
    'X' when others;
  -- I2STransmitter.vhd:183:30
  n166_o <= bit_index_reg (1 downto 0);
  -- I2STransmitter.vhd:183:30
  with n166_o select n167_o <=
    n140_o when "00",
    n141_o when "01",
    n142_o when "10",
    n143_o when "11",
    'X' when others;
  -- I2STransmitter.vhd:183:30
  n168_o <= bit_index_reg (1 downto 0);
  -- I2STransmitter.vhd:183:30
  with n168_o select n169_o <=
    n144_o when "00",
    n145_o when "01",
    n146_o when "10",
    n147_o when "11",
    'X' when others;
  -- I2STransmitter.vhd:183:30
  n170_o <= bit_index_reg (1 downto 0);
  -- I2STransmitter.vhd:183:30
  with n170_o select n171_o <=
    n148_o when "00",
    n149_o when "01",
    n150_o when "10",
    n151_o when "11",
    'X' when others;
  -- I2STransmitter.vhd:183:30
  n172_o <= bit_index_reg (1 downto 0);
  -- I2STransmitter.vhd:183:30
  with n172_o select n173_o <=
    n152_o when "00",
    n153_o when "01",
    n154_o when "10",
    n155_o when "11",
    'X' when others;
  -- I2STransmitter.vhd:183:30
  n174_o <= bit_index_reg (1 downto 0);
  -- I2STransmitter.vhd:183:30
  with n174_o select n175_o <=
    n156_o when "00",
    n157_o when "01",
    n158_o when "10",
    n159_o when "11",
    'X' when others;
  -- I2STransmitter.vhd:183:30
  n176_o <= bit_index_reg (3 downto 2);
  -- I2STransmitter.vhd:183:30
  with n176_o select n177_o <=
    n161_o when "00",
    n163_o when "01",
    n165_o when "10",
    n167_o when "11",
    'X' when others;
  -- I2STransmitter.vhd:183:30
  n178_o <= bit_index_reg (3 downto 2);
  -- I2STransmitter.vhd:183:30
  with n178_o select n179_o <=
    n169_o when "00",
    n171_o when "01",
    n173_o when "10",
    n175_o when "11",
    'X' when others;
  -- I2STransmitter.vhd:183:30
  n180_o <= bit_index_reg (4);
  -- I2STransmitter.vhd:183:30
  n181_o <= n177_o when n180_o = '0' else n179_o;
end rtl;
