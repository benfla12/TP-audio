library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity MicrophoneReceiver is
  generic (
    CLK_FREQUENCY_HZ: positive := 51200000;
    BIT_RATE_HZ: positive range 1 to 20e6 := 12800000;
    BITS_PER_SAMPLE: positive range 12 to 32 := 12
  );
  port (
    clk_i: in std_logic;
    reset_i: in std_logic;
    valid_o: out std_logic;
    ready_i: in std_logic;
    data_o: out signed (BITS_PER_SAMPLE - 1 downto 0);
    chip_select_n_o: out std_logic;
    serial_clk_o: out std_logic;
    serial_data_i: in std_logic
  );
end MicrophoneReceiver;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of microphonereceiver is
  signal wrap_clk_i: std_logic;
  signal wrap_reset_i: std_logic;
  signal wrap_ready_i: std_logic;
  signal wrap_serial_data_i: std_logic;
  signal wrap_valid_o: std_logic;
  subtype typwrap_data_o is std_logic_vector (11 downto 0);
  signal wrap_data_o: typwrap_data_o;
  signal wrap_chip_select_n_o: std_logic;
  signal wrap_serial_clk_o: std_logic;
  signal state_reg : std_logic_vector (1 downto 0);
  signal serial_timer_reg : std_logic_vector (1 downto 0);
  signal serial_half : std_logic;
  signal serial_cycle : std_logic;
  signal serial_clk_reg : std_logic;
  signal bit_index_reg : std_logic_vector (3 downto 0);
  signal data_reg : std_logic_vector (11 downto 0);
  signal n6_o : std_logic;
  signal n8_o : std_logic;
  signal n9_o : std_logic_vector (31 downto 0);
  signal n11_o : std_logic;
  signal n12_o : std_logic;
  signal n14_o : std_logic_vector (1 downto 0);
  signal n16_o : std_logic;
  signal n18_o : std_logic_vector (1 downto 0);
  signal n20_o : std_logic;
  signal n21_o : std_logic_vector (2 downto 0);
  signal n24_o : std_logic_vector (1 downto 0);
  signal n29_q : std_logic_vector (1 downto 0);
  signal n32_o : std_logic;
  signal n33_o : std_logic;
  signal n37_o : std_logic;
  signal n38_o : std_logic;
  signal n41_o : std_logic;
  signal n43_o : std_logic;
  signal n44_o : std_logic_vector (31 downto 0);
  signal n46_o : std_logic_vector (31 downto 0);
  signal n47_o : std_logic_vector (1 downto 0);
  signal n49_o : std_logic_vector (1 downto 0);
  signal n55_o : std_logic_vector (1 downto 0);
  signal n56_q : std_logic_vector (1 downto 0);
  signal n57_o : std_logic_vector (31 downto 0);
  signal n59_o : std_logic;
  signal n60_o : std_logic_vector (31 downto 0);
  signal n62_o : std_logic;
  signal n64_o : std_logic;
  signal n65_o : std_logic;
  signal n66_o : std_logic;
  signal n72_o : std_logic;
  signal n73_q : std_logic;
  signal n75_o : std_logic;
  signal n76_o : std_logic_vector (31 downto 0);
  signal n78_o : std_logic;
  signal n79_o : std_logic_vector (31 downto 0);
  signal n81_o : std_logic_vector (31 downto 0);
  signal n82_o : std_logic_vector (3 downto 0);
  signal n84_o : std_logic_vector (3 downto 0);
  signal n90_o : std_logic_vector (3 downto 0);
  signal n91_q : std_logic_vector (3 downto 0);
  signal n94_o : std_logic;
  signal n95_o : std_logic_vector (31 downto 0);
  signal n97_o : std_logic;
  signal n98_o : std_logic;
  signal n99_o : std_logic_vector (31 downto 0);
  signal n101_o : std_logic;
  signal n102_o : std_logic;
  signal n103_o : std_logic;
  signal n104_o : std_logic_vector (10 downto 0);
  signal n105_o : std_logic_vector (11 downto 0);
  signal n114_o : std_logic_vector (11 downto 0);
  signal n115_q : std_logic_vector (11 downto 0) := "000000000000";
begin
  wrap_clk_i <= clk_i;
  wrap_reset_i <= reset_i;
  wrap_ready_i <= ready_i;
  wrap_serial_data_i <= serial_data_i;
  valid_o <= wrap_valid_o;
  data_o <= signed(wrap_data_o);
  chip_select_n_o <= wrap_chip_select_n_o;
  serial_clk_o <= wrap_serial_clk_o;
  wrap_valid_o <= n38_o;
  wrap_data_o <= data_reg;
  wrap_chip_select_n_o <= n33_o;
  wrap_serial_clk_o <= serial_clk_reg;
  -- MicrophoneReceiver.vhd:37:12
  state_reg <= n29_q; -- (signal)
  -- MicrophoneReceiver.vhd:41:12
  serial_timer_reg <= n56_q; -- (signal)
  -- MicrophoneReceiver.vhd:43:12
  serial_half <= n59_o; -- (signal)
  -- MicrophoneReceiver.vhd:43:25
  serial_cycle <= n62_o; -- (signal)
  -- MicrophoneReceiver.vhd:45:12
  serial_clk_reg <= n73_q; -- (signal)
  -- MicrophoneReceiver.vhd:51:12
  bit_index_reg <= n91_q; -- (signal)
  -- MicrophoneReceiver.vhd:53:12
  data_reg <= n115_q; -- (isignal)
  -- MicrophoneReceiver.vhd:63:15
  -- n6_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- MicrophoneReceiver.vhd:65:17
  n8_o <= '1' when state_reg = "00" else '0';
  -- MicrophoneReceiver.vhd:68:55
  n9_o <= "0000000000000000000000000000" & bit_index_reg;  --  uext
  -- MicrophoneReceiver.vhd:68:55
  n11_o <= '1' when n9_o = "00000000000000000000000000001111" else '0';
  -- MicrophoneReceiver.vhd:68:37
  n12_o <= serial_cycle and n11_o;
  -- MicrophoneReceiver.vhd:68:21
  n14_o <= state_reg when n12_o = '0' else "10";
  -- MicrophoneReceiver.vhd:67:17
  n16_o <= '1' when state_reg = "01" else '0';
  -- MicrophoneReceiver.vhd:72:21
  n18_o <= state_reg when wrap_ready_i = '0' else "01";
  -- MicrophoneReceiver.vhd:71:17
  n20_o <= '1' when state_reg = "10" else '0';
  n21_o <= n20_o & n16_o & n8_o;
  -- MicrophoneReceiver.vhd:64:13
  with n21_o select n24_o <=
    n18_o when "100",
    n14_o when "010",
    "01" when "001",
    "XX" when others;
  -- MicrophoneReceiver.vhd:63:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n29_q <= "00";
    elsif rising_edge (wrap_clk_i) then
      n29_q <= n24_o;
    end if;
  end process;
  -- MicrophoneReceiver.vhd:79:43
  n32_o <= '1' when state_reg = "01" else '0';
  -- MicrophoneReceiver.vhd:79:28
  n33_o <= '1' when n32_o = '0' else '0';
  -- MicrophoneReceiver.vhd:80:43
  n37_o <= '1' when state_reg = "10" else '0';
  -- MicrophoneReceiver.vhd:80:28
  n38_o <= '0' when n37_o = '0' else '1';
  -- MicrophoneReceiver.vhd:90:15
  -- n41_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- MicrophoneReceiver.vhd:91:26
  n43_o <= '1' when state_reg = "01" else '0';
  -- MicrophoneReceiver.vhd:95:58
  n44_o <= "000000000000000000000000000000" & serial_timer_reg;  --  uext
  -- MicrophoneReceiver.vhd:95:58
  n46_o <= std_logic_vector (unsigned (n44_o) + unsigned'("00000000000000000000000000000001"));
  -- MicrophoneReceiver.vhd:95:41
  n47_o <= n46_o (1 downto 0);  --  trunc
  -- MicrophoneReceiver.vhd:92:17
  n49_o <= n47_o when serial_cycle = '0' else "00";
  -- MicrophoneReceiver.vhd:91:26
  n55_o <= serial_timer_reg when n43_o = '0' else n49_o;
  -- MicrophoneReceiver.vhd:90:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n56_q <= "00";
    elsif rising_edge (wrap_clk_i) then
      n56_q <= n55_o;
    end if;
  end process;
  -- MicrophoneReceiver.vhd:101:38
  n57_o <= "000000000000000000000000000000" & serial_timer_reg;  --  uext
  -- MicrophoneReceiver.vhd:101:38
  n59_o <= '1' when n57_o = "00000000000000000000000000000001" else '0';
  -- MicrophoneReceiver.vhd:102:38
  n60_o <= "000000000000000000000000000000" & serial_timer_reg;  --  uext
  -- MicrophoneReceiver.vhd:102:38
  n62_o <= '1' when n60_o = "00000000000000000000000000000011" else '0';
  -- MicrophoneReceiver.vhd:108:15
  -- n64_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- MicrophoneReceiver.vhd:109:28
  n65_o <= serial_half or serial_cycle;
  -- MicrophoneReceiver.vhd:110:35
  n66_o <= not serial_clk_reg;
  -- MicrophoneReceiver.vhd:109:28
  n72_o <= serial_clk_reg when n65_o = '0' else n66_o;
  -- MicrophoneReceiver.vhd:108:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n73_q <= '1';
    elsif rising_edge (wrap_clk_i) then
      n73_q <= n72_o;
    end if;
  end process;
  -- MicrophoneReceiver.vhd:125:15
  -- n75_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- MicrophoneReceiver.vhd:127:34
  n76_o <= "0000000000000000000000000000" & bit_index_reg;  --  uext
  -- MicrophoneReceiver.vhd:127:34
  n78_o <= '1' when n76_o = "00000000000000000000000000001111" else '0';
  -- MicrophoneReceiver.vhd:130:52
  n79_o <= "0000000000000000000000000000" & bit_index_reg;  --  uext
  -- MicrophoneReceiver.vhd:130:52
  n81_o <= std_logic_vector (unsigned (n79_o) + unsigned'("00000000000000000000000000000001"));
  -- MicrophoneReceiver.vhd:130:38
  n82_o <= n81_o (3 downto 0);  --  trunc
  -- MicrophoneReceiver.vhd:127:17
  n84_o <= n82_o when n78_o = '0' else "0000";
  -- MicrophoneReceiver.vhd:43:25
  n90_o <= bit_index_reg when serial_cycle = '0' else n84_o;
  -- MicrophoneReceiver.vhd:125:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n91_q <= "0000";
    elsif rising_edge (wrap_clk_i) then
      n91_q <= n90_o;
    end if;
  end process;
  -- MicrophoneReceiver.vhd:141:15
  -- n94_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- MicrophoneReceiver.vhd:142:47
  n95_o <= "0000000000000000000000000000" & bit_index_reg;  --  uext
  -- MicrophoneReceiver.vhd:142:47
  n97_o <= '1' when signed (n95_o) < signed'("00000000000000000000000000001111") else '0';
  -- MicrophoneReceiver.vhd:142:29
  n98_o <= serial_cycle and n97_o;
  -- MicrophoneReceiver.vhd:143:34
  n99_o <= "0000000000000000000000000000" & bit_index_reg;  --  uext
  -- MicrophoneReceiver.vhd:143:34
  n101_o <= '1' when n99_o = "00000000000000000000000000000011" else '0';
  -- MicrophoneReceiver.vhd:144:26
  n102_o <= not wrap_serial_data_i;
  -- MicrophoneReceiver.vhd:143:17
  n103_o <= wrap_serial_data_i when n101_o = '0' else n102_o;
  -- MicrophoneReceiver.vhd:148:37
  n104_o <= data_reg (10 downto 0);
  -- MicrophoneReceiver.vhd:148:51
  n105_o <= n104_o & n103_o;
  -- MicrophoneReceiver.vhd:142:29
  n114_o <= data_reg when n98_o = '0' else n105_o;
  -- MicrophoneReceiver.vhd:141:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n115_q <= "000000000000";
    elsif rising_edge (wrap_clk_i) then
      n115_q <= n114_o;
    end if;
  end process;
end rtl;
