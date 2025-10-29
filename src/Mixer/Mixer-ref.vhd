library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;
use work.vocoder_pkg.all;
entity Mixer is
  port (
    clk_i: in std_logic;
    reset_i: in std_logic;
    valid_i: in std_logic;
    ready_o: out std_logic;
    env_data_i: in vocoder_data_vector_t (0 to CHANNELS - 1);
    carrier_data_i: in vocoder_coef_vector_t (0 to CHANNELS - 1);
    valid_o: out std_logic;
    ready_i: in std_logic;
    data_o: out vocoder_data_t
  );
end Mixer;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of mixer is
  signal wrap_clk_i: std_logic;
  signal wrap_reset_i: std_logic;
  signal wrap_valid_i: std_logic;
  subtype typwrap_env_data_i is std_logic_vector (215 downto 0);
  signal wrap_env_data_i: typwrap_env_data_i;
  subtype typwrap_carrier_data_i is std_logic_vector (215 downto 0);
  signal wrap_carrier_data_i: typwrap_carrier_data_i;
  signal wrap_ready_i: std_logic;
  signal wrap_ready_o: std_logic;
  signal wrap_valid_o: std_logic;
  subtype typwrap_data_o is std_logic_vector (17 downto 0);
  signal wrap_data_o: typwrap_data_o;
  signal state_reg : std_logic_vector (1 downto 0);
  signal channel_reg : std_logic_vector (3 downto 0);
  signal data_reg : std_logic_vector (17 downto 0);
  signal n6_o : std_logic_vector (1 downto 0);
  signal n8_o : std_logic;
  signal n9_o : std_logic_vector (31 downto 0);
  signal n11_o : std_logic;
  signal n13_o : std_logic_vector (1 downto 0);
  signal n15_o : std_logic;
  signal n17_o : std_logic_vector (1 downto 0);
  signal n19_o : std_logic;
  signal n20_o : std_logic_vector (2 downto 0);
  signal n22_o : std_logic_vector (1 downto 0);
  signal n27_q : std_logic_vector (1 downto 0);
  signal n30_o : std_logic;
  signal n31_o : std_logic;
  signal n35_o : std_logic;
  signal n36_o : std_logic;
  signal n41_o : std_logic_vector (3 downto 0);
  signal n43_o : std_logic;
  signal n44_o : std_logic_vector (31 downto 0);
  signal n46_o : std_logic;
  signal n47_o : std_logic_vector (31 downto 0);
  signal n49_o : std_logic_vector (31 downto 0);
  signal n50_o : std_logic_vector (3 downto 0);
  signal n52_o : std_logic_vector (3 downto 0);
  signal n54_o : std_logic;
  signal n55_o : std_logic_vector (1 downto 0);
  signal n56_o : std_logic_vector (3 downto 0);
  signal n61_q : std_logic_vector (3 downto 0);
  signal n65_o : std_logic;
  signal n66_o : std_logic;
  signal n68_o : std_logic;
  signal n69_o : std_logic;
  signal n74_o : std_logic_vector (3 downto 0);
  signal n78_o : std_logic_vector (3 downto 0);
  signal n95_o : std_logic_vector (35 downto 0);
  signal n96_o : std_logic_vector (35 downto 0);
  signal n97_o : std_logic_vector (35 downto 0);
  signal n114_o : std_logic_vector (20 downto 0);
  constant n118_o : std_logic_vector (36 downto 0) := "0000000000000000000000000000000000000";
  signal n119_o : std_logic_vector (15 downto 0);
  signal n120_o : std_logic_vector (36 downto 0);
  signal n131_o : std_logic_vector (36 downto 0);
  signal n146_o : std_logic_vector (36 downto 0);
  signal n157_o : std_logic_vector (35 downto 0);
  signal n158_o : std_logic;
  signal n162_o : std_logic;
  signal n163_o : std_logic;
  signal n170_o : std_logic;
  signal n176_o : std_logic;
  signal n177_o : std_logic;
  signal n178_o : std_logic;
  signal n179_o : std_logic;
  signal n180_o : std_logic;
  signal n181_o : std_logic;
  signal n182_o : std_logic;
  signal n183_o : std_logic;
  signal n184_o : std_logic;
  signal n185_o : std_logic;
  signal n186_o : std_logic;
  signal n187_o : std_logic;
  signal n188_o : std_logic;
  signal n189_o : std_logic;
  signal n190_o : std_logic;
  signal n191_o : std_logic;
  signal n192_o : std_logic;
  signal n193_o : std_logic;
  signal n194_o : std_logic;
  signal n195_o : std_logic;
  signal n196_o : std_logic;
  signal n197_o : std_logic;
  signal n198_o : std_logic;
  signal n199_o : std_logic;
  signal n200_o : std_logic;
  signal n201_o : std_logic;
  signal n202_o : std_logic;
  signal n203_o : std_logic;
  signal n204_o : std_logic;
  signal n205_o : std_logic;
  signal n206_o : std_logic;
  signal n207_o : std_logic;
  signal n208_o : std_logic;
  signal n209_o : std_logic;
  signal n210_o : std_logic;
  signal n211_o : std_logic;
  signal n212_o : std_logic_vector (3 downto 0);
  signal n213_o : std_logic_vector (3 downto 0);
  signal n214_o : std_logic_vector (3 downto 0);
  signal n215_o : std_logic_vector (3 downto 0);
  signal n216_o : std_logic_vector (3 downto 0);
  signal n217_o : std_logic_vector (3 downto 0);
  signal n218_o : std_logic_vector (3 downto 0);
  signal n219_o : std_logic_vector (3 downto 0);
  signal n220_o : std_logic_vector (3 downto 0);
  signal n221_o : std_logic_vector (15 downto 0);
  signal n222_o : std_logic_vector (15 downto 0);
  signal n223_o : std_logic_vector (35 downto 0);
  signal n224_o : std_logic_vector (34 downto 0);
  signal n225_o : std_logic_vector (35 downto 0);
  signal n226_o : std_logic_vector (35 downto 0);
  signal n242_o : std_logic_vector (33 downto 0);
  signal n243_o : std_logic;
  signal n247_o : std_logic;
  signal n248_o : std_logic;
  signal n255_o : std_logic;
  signal n259_o : std_logic;
  signal n261_o : std_logic;
  signal n262_o : std_logic;
  signal n264_o : std_logic;
  signal n270_o : std_logic;
  signal n273_o : std_logic;
  signal n275_o : std_logic;
  signal n276_o : std_logic;
  signal n277_o : std_logic;
  signal n278_o : std_logic;
  signal n279_o : std_logic;
  signal n280_o : std_logic;
  signal n281_o : std_logic;
  signal n282_o : std_logic;
  signal n283_o : std_logic;
  signal n284_o : std_logic;
  signal n285_o : std_logic;
  signal n286_o : std_logic;
  signal n287_o : std_logic;
  signal n288_o : std_logic;
  signal n289_o : std_logic;
  signal n290_o : std_logic;
  signal n291_o : std_logic;
  signal n292_o : std_logic;
  signal n293_o : std_logic_vector (3 downto 0);
  signal n294_o : std_logic_vector (3 downto 0);
  signal n295_o : std_logic_vector (3 downto 0);
  signal n296_o : std_logic_vector (3 downto 0);
  signal n297_o : std_logic_vector (1 downto 0);
  signal n298_o : std_logic_vector (15 downto 0);
  signal n299_o : std_logic_vector (17 downto 0);
  signal n300_o : std_logic_vector (16 downto 0);
  signal n301_o : std_logic_vector (17 downto 0);
  signal n302_o : std_logic_vector (17 downto 0);
  signal n303_o : std_logic_vector (17 downto 0);
  signal n306_o : std_logic;
  signal n307_o : std_logic;
  signal n309_o : std_logic_vector (17 downto 0);
  signal n310_o : std_logic_vector (17 downto 0);
  signal n315_q : std_logic_vector (17 downto 0);
  signal n316_o : std_logic_vector (17 downto 0);
  signal n317_o : std_logic_vector (17 downto 0);
  signal n318_o : std_logic_vector (17 downto 0);
  signal n319_o : std_logic_vector (17 downto 0);
  signal n320_o : std_logic_vector (17 downto 0);
  signal n321_o : std_logic_vector (17 downto 0);
  signal n322_o : std_logic_vector (17 downto 0);
  signal n323_o : std_logic_vector (17 downto 0);
  signal n324_o : std_logic_vector (17 downto 0);
  signal n325_o : std_logic_vector (17 downto 0);
  signal n326_o : std_logic_vector (17 downto 0);
  signal n327_o : std_logic_vector (17 downto 0);
  signal n328_o : std_logic_vector (1 downto 0);
  signal n329_o : std_logic_vector (17 downto 0);
  signal n330_o : std_logic_vector (1 downto 0);
  signal n331_o : std_logic_vector (17 downto 0);
  signal n332_o : std_logic_vector (1 downto 0);
  signal n333_o : std_logic_vector (17 downto 0);
  signal n334_o : std_logic;
  signal n335_o : std_logic_vector (17 downto 0);
  signal n336_o : std_logic;
  signal n337_o : std_logic_vector (17 downto 0);
  signal n338_o : std_logic_vector (17 downto 0);
  signal n339_o : std_logic_vector (17 downto 0);
  signal n340_o : std_logic_vector (17 downto 0);
  signal n341_o : std_logic_vector (17 downto 0);
  signal n342_o : std_logic_vector (17 downto 0);
  signal n343_o : std_logic_vector (17 downto 0);
  signal n344_o : std_logic_vector (17 downto 0);
  signal n345_o : std_logic_vector (17 downto 0);
  signal n346_o : std_logic_vector (17 downto 0);
  signal n347_o : std_logic_vector (17 downto 0);
  signal n348_o : std_logic_vector (17 downto 0);
  signal n349_o : std_logic_vector (17 downto 0);
  signal n350_o : std_logic_vector (1 downto 0);
  signal n351_o : std_logic_vector (17 downto 0);
  signal n352_o : std_logic_vector (1 downto 0);
  signal n353_o : std_logic_vector (17 downto 0);
  signal n354_o : std_logic_vector (1 downto 0);
  signal n355_o : std_logic_vector (17 downto 0);
  signal n356_o : std_logic;
  signal n357_o : std_logic_vector (17 downto 0);
  signal n358_o : std_logic;
  signal n359_o : std_logic_vector (17 downto 0);
begin
  wrap_clk_i <= clk_i;
  wrap_reset_i <= reset_i;
  wrap_valid_i <= valid_i;
  wrap_env_data_i (17 downto 0) <= std_logic_vector(env_data_i ( 0));
  wrap_env_data_i (35 downto 18) <= std_logic_vector(env_data_i ( 1));
  wrap_env_data_i (53 downto 36) <= std_logic_vector(env_data_i ( 2));
  wrap_env_data_i (71 downto 54) <= std_logic_vector(env_data_i ( 3));
  wrap_env_data_i (89 downto 72) <= std_logic_vector(env_data_i ( 4));
  wrap_env_data_i (107 downto 90) <= std_logic_vector(env_data_i ( 5));
  wrap_env_data_i (125 downto 108) <= std_logic_vector(env_data_i ( 6));
  wrap_env_data_i (143 downto 126) <= std_logic_vector(env_data_i ( 7));
  wrap_env_data_i (161 downto 144) <= std_logic_vector(env_data_i ( 8));
  wrap_env_data_i (179 downto 162) <= std_logic_vector(env_data_i ( 9));
  wrap_env_data_i (197 downto 180) <= std_logic_vector(env_data_i ( 10));
  wrap_env_data_i (215 downto 198) <= std_logic_vector(env_data_i ( 11));
  wrap_carrier_data_i (17 downto 0) <= std_logic_vector(carrier_data_i ( 0));
  wrap_carrier_data_i (35 downto 18) <= std_logic_vector(carrier_data_i ( 1));
  wrap_carrier_data_i (53 downto 36) <= std_logic_vector(carrier_data_i ( 2));
  wrap_carrier_data_i (71 downto 54) <= std_logic_vector(carrier_data_i ( 3));
  wrap_carrier_data_i (89 downto 72) <= std_logic_vector(carrier_data_i ( 4));
  wrap_carrier_data_i (107 downto 90) <= std_logic_vector(carrier_data_i ( 5));
  wrap_carrier_data_i (125 downto 108) <= std_logic_vector(carrier_data_i ( 6));
  wrap_carrier_data_i (143 downto 126) <= std_logic_vector(carrier_data_i ( 7));
  wrap_carrier_data_i (161 downto 144) <= std_logic_vector(carrier_data_i ( 8));
  wrap_carrier_data_i (179 downto 162) <= std_logic_vector(carrier_data_i ( 9));
  wrap_carrier_data_i (197 downto 180) <= std_logic_vector(carrier_data_i ( 10));
  wrap_carrier_data_i (215 downto 198) <= std_logic_vector(carrier_data_i ( 11));
  wrap_ready_i <= ready_i;
  ready_o <= wrap_ready_o;
  valid_o <= wrap_valid_o;
  data_o <= sfixed(wrap_data_o);
  wrap_ready_o <= n31_o;
  wrap_valid_o <= n36_o;
  wrap_data_o <= data_reg;
  -- Mixer.vhd:24:12
  state_reg <= n27_q; -- (signal)
  -- Mixer.vhd:25:12
  channel_reg <= n61_q; -- (signal)
  -- Mixer.vhd:26:12
  data_reg <= n315_q; -- (signal)
  -- Mixer.vhd:35:21
  n6_o <= state_reg when wrap_valid_i = '0' else "01";
  -- Mixer.vhd:34:17
  n8_o <= '1' when state_reg = "00" else '0';
  -- Mixer.vhd:39:36
  n9_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- Mixer.vhd:39:36
  n11_o <= '1' when n9_o = "00000000000000000000000000001011" else '0';
  -- Mixer.vhd:39:21
  n13_o <= state_reg when n11_o = '0' else "10";
  -- Mixer.vhd:38:17
  n15_o <= '1' when state_reg = "01" else '0';
  -- Mixer.vhd:43:21
  n17_o <= state_reg when wrap_ready_i = '0' else "00";
  -- Mixer.vhd:42:17
  n19_o <= '1' when state_reg = "10" else '0';
  n20_o <= n19_o & n15_o & n8_o;
  -- Mixer.vhd:33:13
  with n20_o select n22_o <=
    n17_o when "100",
    n13_o when "010",
    n6_o when "001",
    "XX" when others;
  -- Mixer.vhd:32:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n27_q <= "00";
    elsif rising_edge (wrap_clk_i) then
      n27_q <= n22_o;
    end if;
  end process;
  -- Mixer.vhd:50:35
  n30_o <= '1' when state_reg = "00" else '0';
  -- Mixer.vhd:50:20
  n31_o <= '0' when n30_o = '0' else '1';
  -- Mixer.vhd:51:35
  n35_o <= '1' when state_reg = "10" else '0';
  -- Mixer.vhd:51:20
  n36_o <= '0' when n35_o = '0' else '1';
  -- Mixer.vhd:60:21
  n41_o <= channel_reg when wrap_valid_i = '0' else "0001";
  -- Mixer.vhd:59:17
  n43_o <= '1' when state_reg = "00" else '0';
  -- Mixer.vhd:64:36
  n44_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- Mixer.vhd:64:36
  n46_o <= '1' when n44_o = "00000000000000000000000000001011" else '0';
  -- Mixer.vhd:67:52
  n47_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- Mixer.vhd:67:52
  n49_o <= std_logic_vector (unsigned (n47_o) + unsigned'("00000000000000000000000000000001"));
  -- Mixer.vhd:67:40
  n50_o <= n49_o (3 downto 0);  --  trunc
  -- Mixer.vhd:64:21
  n52_o <= n50_o when n46_o = '0' else "0000";
  -- Mixer.vhd:63:17
  n54_o <= '1' when state_reg = "01" else '0';
  n55_o <= n54_o & n43_o;
  -- Mixer.vhd:58:13
  with n55_o select n56_o <=
    n52_o when "10",
    n41_o when "01",
    channel_reg when others;
  -- Mixer.vhd:57:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n61_q <= "0000";
    elsif rising_edge (wrap_clk_i) then
      n61_q <= n56_o;
    end if;
  end process;
  -- Mixer.vhd:79:27
  n65_o <= '1' when state_reg = "00" else '0';
  -- Mixer.vhd:79:41
  n66_o <= n65_o and wrap_valid_i;
  -- Mixer.vhd:79:73
  n68_o <= '1' when state_reg = "01" else '0';
  -- Mixer.vhd:79:60
  n69_o <= n66_o or n68_o;
  -- Mixer.vhd:80:65
  n74_o <= std_logic_vector (unsigned'("1011") - unsigned (channel_reg));
  -- Mixer.vhd:80:95
  n78_o <= std_logic_vector (unsigned'("1011") - unsigned (channel_reg));
  -- ../fixed_pkg.vhd:268:100
  n95_o <= std_logic_vector (resize (signed (n337_o), 36));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n96_o <= std_logic_vector (resize (signed (n359_o), 36));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n97_o <= std_logic_vector (resize (signed (n95_o) * signed (n96_o), 36));
  -- ../fixed_pkg.vhd:168:39
  n114_o <= std_logic_vector (resize (signed (data_reg), 21));  --  sext
  n119_o <= n118_o (15 downto 0);
  n120_o <= n114_o & n119_o;
  -- ../fixed_pkg.vhd:168:39
  n131_o <= std_logic_vector (resize (signed (n97_o), 37));  --  sext
  -- ../fixed_pkg.vhd:257:67
  n146_o <= std_logic_vector (unsigned (n120_o) + unsigned (n131_o));
  -- ../fixed_pkg.vhd:168:39
  n157_o <= n146_o (35 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n158_o <= n146_o (36);
  -- ../fixed_pkg.vhd:185:23
  n162_o <= n146_o (35);
  -- ../fixed_pkg.vhd:185:27
  n163_o <= '1' when n162_o /= n158_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n170_o <= '0' when n163_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n176_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n177_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n178_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n179_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n180_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n181_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n182_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n183_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n184_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n185_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n186_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n187_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n188_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n189_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n190_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n191_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n192_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n193_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n194_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n195_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n196_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n197_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n198_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n199_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n200_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n201_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n202_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n203_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n204_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n205_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n206_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n207_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n208_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n209_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n210_o <= not n158_o;
  -- ../fixed_pkg.vhd:196:31
  n211_o <= not n158_o;
  n212_o <= n176_o & n177_o & n178_o & n179_o;
  n213_o <= n180_o & n181_o & n182_o & n183_o;
  n214_o <= n184_o & n185_o & n186_o & n187_o;
  n215_o <= n188_o & n189_o & n190_o & n191_o;
  n216_o <= n192_o & n193_o & n194_o & n195_o;
  n217_o <= n196_o & n197_o & n198_o & n199_o;
  n218_o <= n200_o & n201_o & n202_o & n203_o;
  n219_o <= n204_o & n205_o & n206_o & n207_o;
  n220_o <= n208_o & n209_o & n210_o & n211_o;
  n221_o <= n212_o & n213_o & n214_o & n215_o;
  n222_o <= n216_o & n217_o & n218_o & n219_o;
  n223_o <= n221_o & n222_o & n220_o;
  n224_o <= n223_o (34 downto 0);
  n225_o <= n158_o & n224_o;
  -- ../fixed_pkg.vhd:195:9
  n226_o <= n157_o when n170_o = '0' else n225_o;
  -- ../fixed_pkg.vhd:168:39
  n242_o <= n226_o (33 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n243_o <= n226_o (35);
  -- ../fixed_pkg.vhd:185:23
  n247_o <= n226_o (34);
  -- ../fixed_pkg.vhd:185:27
  n248_o <= '1' when n247_o /= n243_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n255_o <= '0' when n248_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n259_o <= '1' when n248_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n261_o <= n226_o (33);
  -- ../fixed_pkg.vhd:185:27
  n262_o <= '1' when n261_o /= n243_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n264_o <= n255_o when n273_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n270_o <= n262_o and n259_o;
  -- ../fixed_pkg.vhd:185:17
  n273_o <= n259_o and n270_o;
  -- ../fixed_pkg.vhd:196:31
  n275_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n276_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n277_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n278_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n279_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n280_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n281_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n282_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n283_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n284_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n285_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n286_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n287_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n288_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n289_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n290_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n291_o <= not n243_o;
  -- ../fixed_pkg.vhd:196:31
  n292_o <= not n243_o;
  n293_o <= n275_o & n276_o & n277_o & n278_o;
  n294_o <= n279_o & n280_o & n281_o & n282_o;
  n295_o <= n283_o & n284_o & n285_o & n286_o;
  n296_o <= n287_o & n288_o & n289_o & n290_o;
  n297_o <= n291_o & n292_o;
  n298_o <= n293_o & n294_o & n295_o & n296_o;
  n299_o <= n298_o & n297_o;
  n300_o <= n299_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n301_o <= n242_o (33 downto 16);
  n302_o <= n243_o & n300_o;
  -- ../fixed_pkg.vhd:195:9
  n303_o <= n301_o when n264_o = '0' else n302_o;
  -- Mixer.vhd:81:29
  n306_o <= '1' when state_reg = "10" else '0';
  -- Mixer.vhd:81:43
  n307_o <= n306_o and wrap_ready_i;
  -- Mixer.vhd:81:13
  n309_o <= data_reg when n307_o = '0' else "000000000000000000";
  -- Mixer.vhd:79:13
  n310_o <= n309_o when n69_o = '0' else n303_o;
  -- Mixer.vhd:78:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n315_q <= "000000000000000000";
    elsif rising_edge (wrap_clk_i) then
      n315_q <= n310_o;
    end if;
  end process;
  -- Mixer.vhd:18:9
  n316_o <= wrap_env_data_i (17 downto 0);
  -- Mixer.vhd:16:9
  n317_o <= wrap_env_data_i (35 downto 18);
  -- Mixer.vhd:13:9
  n318_o <= wrap_env_data_i (53 downto 36);
  n319_o <= wrap_env_data_i (71 downto 54);
  n320_o <= wrap_env_data_i (89 downto 72);
  -- ../fixed_pkg.vhd:185:17
  n321_o <= wrap_env_data_i (107 downto 90);
  -- ../fixed_pkg.vhd:185:17
  n322_o <= wrap_env_data_i (125 downto 108);
  -- ../fixed_pkg.vhd:185:17
  n323_o <= wrap_env_data_i (143 downto 126);
  -- ../fixed_pkg.vhd:185:17
  n324_o <= wrap_env_data_i (161 downto 144);
  -- ../fixed_pkg.vhd:185:17
  n325_o <= wrap_env_data_i (179 downto 162);
  n326_o <= wrap_env_data_i (197 downto 180);
  -- ../fixed_pkg.vhd:185:17
  n327_o <= wrap_env_data_i (215 downto 198);
  -- Mixer.vhd:80:65
  n328_o <= n74_o (1 downto 0);
  -- Mixer.vhd:80:65
  with n328_o select n329_o <=
    n316_o when "00",
    n317_o when "01",
    n318_o when "10",
    n319_o when "11",
    (17 downto 0 => 'X') when others;
  -- Mixer.vhd:80:65
  n330_o <= n74_o (1 downto 0);
  -- Mixer.vhd:80:65
  with n330_o select n331_o <=
    n320_o when "00",
    n321_o when "01",
    n322_o when "10",
    n323_o when "11",
    (17 downto 0 => 'X') when others;
  -- Mixer.vhd:80:65
  n332_o <= n74_o (1 downto 0);
  -- Mixer.vhd:80:65
  with n332_o select n333_o <=
    n324_o when "00",
    n325_o when "01",
    n326_o when "10",
    n327_o when "11",
    (17 downto 0 => 'X') when others;
  n334_o <= n74_o (2);
  -- Mixer.vhd:80:65
  n335_o <= n329_o when n334_o = '0' else n331_o;
  -- ../fixed_pkg.vhd:171:18
  n336_o <= n74_o (3);
  -- Mixer.vhd:80:65
  n337_o <= n335_o when n336_o = '0' else n333_o;
  -- Mixer.vhd:80:66
  n338_o <= wrap_carrier_data_i (17 downto 0);
  -- Mixer.vhd:80:65
  n339_o <= wrap_carrier_data_i (35 downto 18);
  -- ../fixed_pkg.vhd:170:18
  n340_o <= wrap_carrier_data_i (53 downto 36);
  n341_o <= wrap_carrier_data_i (71 downto 54);
  -- ../fixed_pkg.vhd:9:14
  n342_o <= wrap_carrier_data_i (89 downto 72);
  -- ../fixed_pkg.vhd:9:14
  n343_o <= wrap_carrier_data_i (107 downto 90);
  n344_o <= wrap_carrier_data_i (125 downto 108);
  -- ../fixed_pkg.vhd:9:14
  n345_o <= wrap_carrier_data_i (143 downto 126);
  -- ../fixed_pkg.vhd:24:14
  n346_o <= wrap_carrier_data_i (161 downto 144);
  -- ../fixed_pkg.vhd:24:14
  n347_o <= wrap_carrier_data_i (179 downto 162);
  n348_o <= wrap_carrier_data_i (197 downto 180);
  -- ../fixed_pkg.vhd:24:14
  n349_o <= wrap_carrier_data_i (215 downto 198);
  -- Mixer.vhd:80:95
  n350_o <= n78_o (1 downto 0);
  -- Mixer.vhd:80:95
  with n350_o select n351_o <=
    n338_o when "00",
    n339_o when "01",
    n340_o when "10",
    n341_o when "11",
    (17 downto 0 => 'X') when others;
  -- Mixer.vhd:80:95
  n352_o <= n78_o (1 downto 0);
  -- Mixer.vhd:80:95
  with n352_o select n353_o <=
    n342_o when "00",
    n343_o when "01",
    n344_o when "10",
    n345_o when "11",
    (17 downto 0 => 'X') when others;
  -- Mixer.vhd:80:95
  n354_o <= n78_o (1 downto 0);
  -- Mixer.vhd:80:95
  with n354_o select n355_o <=
    n346_o when "00",
    n347_o when "01",
    n348_o when "10",
    n349_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../fixed_pkg.vhd:185:17
  n356_o <= n78_o (2);
  -- Mixer.vhd:80:95
  n357_o <= n351_o when n356_o = '0' else n353_o;
  n358_o <= n78_o (3);
  -- Mixer.vhd:80:95
  n359_o <= n357_o when n358_o = '0' else n355_o;
end rtl;
