library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;
use work.vocoder_pkg.all;
entity Oscillator is
  port (
    clk_i: in std_logic;
    reset_i: in std_logic;
    step_i: in natural range 0 to SINE_INDEX_MAX;
    ready_i: in std_logic;
    data_o: out vocoder_coef_t
  );
end Oscillator;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of oscillator is
  signal wrap_clk_i: std_logic;
  signal wrap_reset_i: std_logic;
  subtype typwrap_step_i is std_logic_vector (4 downto 0);
  signal wrap_step_i: typwrap_step_i;
  signal wrap_ready_i: std_logic;
  subtype typwrap_data_o is std_logic_vector (17 downto 0);
  signal wrap_data_o: typwrap_data_o;
  signal down_reg : std_logic;
  signal sign_reg : std_logic;
  signal index_reg : std_logic_vector (4 downto 0);
  signal n4_o : std_logic_vector (31 downto 0);
  signal n5_o : std_logic_vector (31 downto 0);
  signal n6_o : std_logic_vector (31 downto 0);
  signal n7_o : std_logic_vector (6 downto 0);
  signal n8_o : std_logic_vector (31 downto 0);
  signal n9_o : std_logic_vector (31 downto 0);
  signal n10_o : std_logic_vector (31 downto 0);
  signal n11_o : std_logic_vector (6 downto 0);
  signal n12_o : std_logic_vector (6 downto 0);
  signal n13_o : std_logic_vector (31 downto 0);
  signal n15_o : std_logic;
  signal n16_o : std_logic_vector (31 downto 0);
  signal n18_o : std_logic_vector (31 downto 0);
  signal n19_o : std_logic_vector (4 downto 0);
  signal n20_o : std_logic_vector (31 downto 0);
  signal n22_o : std_logic;
  signal n23_o : std_logic_vector (31 downto 0);
  signal n24_o : std_logic_vector (31 downto 0);
  signal n25_o : std_logic_vector (4 downto 0);
  signal n26_o : std_logic;
  signal n27_o : std_logic_vector (4 downto 0);
  signal n29_o : std_logic;
  signal n30_o : std_logic;
  signal n31_o : std_logic_vector (4 downto 0);
  signal n33_o : std_logic;
  signal n34_o : std_logic;
  signal n35_o : std_logic_vector (4 downto 0);
  signal n52_o : std_logic;
  signal n53_q : std_logic;
  signal n54_o : std_logic;
  signal n55_q : std_logic;
  signal n56_o : std_logic_vector (4 downto 0);
  signal n57_q : std_logic_vector (4 downto 0);
  signal n64_o : std_logic;
  signal n66_o : std_logic_vector (4 downto 0);
  signal n72_o : std_logic_vector (4 downto 0);
  signal n85_o : std_logic_vector (18 downto 0);
  signal n86_o : std_logic_vector (18 downto 0);
  signal n102_o : std_logic_vector (17 downto 0);
  signal n103_o : std_logic;
  signal n107_o : std_logic;
  signal n108_o : std_logic;
  signal n115_o : std_logic;
  signal n121_o : std_logic;
  signal n122_o : std_logic;
  signal n123_o : std_logic;
  signal n124_o : std_logic;
  signal n125_o : std_logic;
  signal n126_o : std_logic;
  signal n127_o : std_logic;
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
  signal n139_o : std_logic_vector (3 downto 0);
  signal n140_o : std_logic_vector (3 downto 0);
  signal n141_o : std_logic_vector (3 downto 0);
  signal n142_o : std_logic_vector (3 downto 0);
  signal n143_o : std_logic_vector (1 downto 0);
  signal n144_o : std_logic_vector (15 downto 0);
  signal n145_o : std_logic_vector (17 downto 0);
  signal n146_o : std_logic_vector (16 downto 0);
  signal n147_o : std_logic_vector (17 downto 0);
  signal n148_o : std_logic_vector (17 downto 0);
  signal n150_o : std_logic_vector (17 downto 0);
  signal n153_q : std_logic_vector (17 downto 0);
  signal n155_data : std_logic_vector (17 downto 0);
  signal n157_data : std_logic_vector (17 downto 0);
begin
  wrap_clk_i <= clk_i;
  wrap_reset_i <= reset_i;
  wrap_step_i <= std_logic_vector(to_unsigned(step_i, 5));
  wrap_ready_i <= ready_i;
  data_o <= sfixed(wrap_data_o);
  wrap_data_o <= n153_q;
  -- Oscillator.vhd:19:12
  down_reg <= n53_q; -- (signal)
  -- Oscillator.vhd:19:22
  sign_reg <= n55_q; -- (signal)
  -- Oscillator.vhd:20:12
  index_reg <= n57_q; -- (signal)
  -- Oscillator.vhd:32:45
  n4_o <= "000000000000000000000000000" & index_reg;  --  uext
  -- Oscillator.vhd:32:45
  n5_o <= "000000000000000000000000000" & wrap_step_i;  --  uext
  -- Oscillator.vhd:32:45
  n6_o <= std_logic_vector (unsigned (n4_o) - unsigned (n5_o));
  -- Oscillator.vhd:32:21
  n7_o <= n6_o (6 downto 0);  --  trunc
  -- Oscillator.vhd:34:45
  n8_o <= "000000000000000000000000000" & index_reg;  --  uext
  -- Oscillator.vhd:34:45
  n9_o <= "000000000000000000000000000" & wrap_step_i;  --  uext
  -- Oscillator.vhd:34:45
  n10_o <= std_logic_vector (unsigned (n8_o) + unsigned (n9_o));
  -- Oscillator.vhd:34:21
  n11_o <= n10_o (6 downto 0);  --  trunc
  -- Oscillator.vhd:31:17
  n12_o <= n11_o when down_reg = '0' else n7_o;
  -- Oscillator.vhd:36:31
  n13_o <= std_logic_vector (resize (signed (n12_o), 32));  --  sext
  -- Oscillator.vhd:36:31
  n15_o <= '1' when signed (n13_o) >= signed'("00000000000000000000000000011001") else '0';
  -- Oscillator.vhd:37:53
  n16_o <= std_logic_vector (resize (signed (n12_o), 32));  --  sext
  -- Oscillator.vhd:37:53
  n18_o <= std_logic_vector (unsigned'("00000000000000000000000000110010") - unsigned (n16_o));
  -- Oscillator.vhd:37:34
  n19_o <= n18_o (4 downto 0);  --  trunc
  -- Oscillator.vhd:39:34
  n20_o <= std_logic_vector (resize (signed (n12_o), 32));  --  sext
  -- Oscillator.vhd:39:34
  n22_o <= '1' when signed (n20_o) <= signed'("00000000000000000000000000000000") else '0';
  -- Oscillator.vhd:40:34
  n23_o <= std_logic_vector (resize (signed (n12_o), 32));  --  sext
  -- Oscillator.vhd:40:34
  n24_o <= std_logic_vector(-signed (n23_o));
  -- Oscillator.vhd:40:34
  n25_o <= n24_o (4 downto 0);  --  trunc
  -- Oscillator.vhd:42:34
  n26_o <= not sign_reg;
  -- Oscillator.vhd:44:34
  n27_o <= n12_o (4 downto 0);  --  trunc
  -- Oscillator.vhd:39:17
  n29_o <= down_reg when n22_o = '0' else '0';
  -- Oscillator.vhd:39:17
  n30_o <= sign_reg when n22_o = '0' else n26_o;
  -- Oscillator.vhd:39:17
  n31_o <= n27_o when n22_o = '0' else n25_o;
  -- Oscillator.vhd:36:17
  n33_o <= n29_o when n15_o = '0' else '1';
  -- Oscillator.vhd:36:17
  n34_o <= n30_o when n15_o = '0' else sign_reg;
  -- Oscillator.vhd:36:17
  n35_o <= n31_o when n15_o = '0' else n19_o;
  -- Oscillator.vhd:8:8
  n52_o <= down_reg when wrap_ready_i = '0' else n33_o;
  -- Oscillator.vhd:29:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n53_q <= '0';
    elsif rising_edge (wrap_clk_i) then
      n53_q <= n52_o;
    end if;
  end process;
  -- Oscillator.vhd:8:8
  n54_o <= sign_reg when wrap_ready_i = '0' else n34_o;
  -- Oscillator.vhd:29:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n55_q <= '0';
    elsif rising_edge (wrap_clk_i) then
      n55_q <= n54_o;
    end if;
  end process;
  -- Oscillator.vhd:8:8
  n56_o <= index_reg when wrap_ready_i = '0' else n35_o;
  -- Oscillator.vhd:29:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n57_q <= "00000";
    elsif rising_edge (wrap_clk_i) then
      n57_q <= n56_o;
    end if;
  end process;
  -- Oscillator.vhd:53:25
  n64_o <= not sign_reg;
  -- Oscillator.vhd:54:37
  n66_o <= std_logic_vector (unsigned'("11001") - unsigned (index_reg));
  -- Oscillator.vhd:56:38
  n72_o <= std_logic_vector (unsigned'("11001") - unsigned (index_reg));
  -- ../fixed_pkg.vhd:231:32
  n85_o <= std_logic_vector (resize (signed (n157_data), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n86_o <= std_logic_vector(-signed (n85_o));
  -- ../fixed_pkg.vhd:168:39
  n102_o <= n86_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n103_o <= n86_o (18);
  -- ../fixed_pkg.vhd:185:23
  n107_o <= n86_o (17);
  -- ../fixed_pkg.vhd:185:27
  n108_o <= '1' when n107_o /= n103_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n115_o <= '0' when n108_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n121_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n122_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n123_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n124_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n125_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n126_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n127_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n128_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n129_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n130_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n131_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n132_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n133_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n134_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n135_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n136_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n137_o <= not n103_o;
  -- ../fixed_pkg.vhd:196:31
  n138_o <= not n103_o;
  n139_o <= n121_o & n122_o & n123_o & n124_o;
  n140_o <= n125_o & n126_o & n127_o & n128_o;
  n141_o <= n129_o & n130_o & n131_o & n132_o;
  n142_o <= n133_o & n134_o & n135_o & n136_o;
  n143_o <= n137_o & n138_o;
  n144_o <= n139_o & n140_o & n141_o & n142_o;
  n145_o <= n144_o & n143_o;
  n146_o <= n145_o (16 downto 0);
  n147_o <= n103_o & n146_o;
  -- ../fixed_pkg.vhd:195:9
  n148_o <= n102_o when n115_o = '0' else n147_o;
  -- Oscillator.vhd:53:13
  n150_o <= n148_o when n64_o = '0' else n155_data;
  -- Oscillator.vhd:52:9
  process (wrap_clk_i)
  begin
    if rising_edge (wrap_clk_i) then
      n153_q <= n150_o;
    end if;
  end process;
  -- Oscillator.vhd:14:9
  process (n66_o) is
    type n154_oport_type is array (0 to 25)
      of std_logic_vector (17 downto 0);
    variable n154_oport : n154_oport_type :=
      (25 => "000000000000000000",
       24 => "000001000000010011",
       23 => "000010000000010110",
       22 => "000010111111111000",
       21 => "000011111110101010",
       20 => "000100111100011100",
       19 => "000101111000111101",
       18 => "000110110100000000",
       17 => "000111101101010100",
       16 => "001000100100101100",
       15 => "001001011001111001",
       14 => "001010001100101110",
       13 => "001010111100111110",
       12 => "001011101010011110",
       11 => "001100010101000000",
       10 => "001100111100011100",
       9 => "001101100000100110",
       8 => "001110000001010110",
       7 => "001110011110100011",
       6 => "001110111000000110",
       5 => "001111001101111000",
       4 => "001111011111110101",
       3 => "001111101101110111",
       2 => "001111110111111011",
       1 => "001111111101111111",
       0 => "010000000000000000");
  begin
    n155_data <= n154_oport(to_integer (unsigned (n66_o)));
  end process;
  -- Oscillator.vhd:54:38
  -- Oscillator.vhd:54:37
  process (n72_o) is
    type n156_oport_type is array (0 to 25)
      of std_logic_vector (17 downto 0);
    variable n156_oport : n156_oport_type :=
      (25 => "000000000000000000",
       24 => "000001000000010011",
       23 => "000010000000010110",
       22 => "000010111111111000",
       21 => "000011111110101010",
       20 => "000100111100011100",
       19 => "000101111000111101",
       18 => "000110110100000000",
       17 => "000111101101010100",
       16 => "001000100100101100",
       15 => "001001011001111001",
       14 => "001010001100101110",
       13 => "001010111100111110",
       12 => "001011101010011110",
       11 => "001100010101000000",
       10 => "001100111100011100",
       9 => "001101100000100110",
       8 => "001110000001010110",
       7 => "001110011110100011",
       6 => "001110111000000110",
       5 => "001111001101111000",
       4 => "001111011111110101",
       3 => "001111101101110111",
       2 => "001111110111111011",
       1 => "001111111101111111",
       0 => "010000000000000000");
  begin
    n157_data <= n156_oport(to_integer (unsigned (n72_o)));
  end process;
  -- Oscillator.vhd:56:39
end rtl;
