library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;
use work.vocoder_pkg.all;
entity Vocoder is
  port (
    clk_i: in std_logic;
    reset_i: in std_logic;
    valid_i: in std_logic;
    ready_o: out std_logic;
    data_i: in vocoder_data_t;
    valid_o: out std_logic;
    ready_i: in std_logic;
    data_o: out vocoder_data_t
  );
end Vocoder;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mixer is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    env_data_i : in std_logic_vector (215 downto 0);
    carrier_data_i : in std_logic_vector (215 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity mixer;

architecture rtl of mixer is
  signal state_reg : std_logic_vector (1 downto 0);
  signal channel_reg : std_logic_vector (3 downto 0);
  signal data_reg : std_logic_vector (17 downto 0);
  signal n15260_o : std_logic_vector (1 downto 0);
  signal n15262_o : std_logic;
  signal n15263_o : std_logic_vector (31 downto 0);
  signal n15265_o : std_logic;
  signal n15267_o : std_logic_vector (1 downto 0);
  signal n15269_o : std_logic;
  signal n15271_o : std_logic_vector (1 downto 0);
  signal n15273_o : std_logic;
  signal n15274_o : std_logic_vector (2 downto 0);
  signal n15276_o : std_logic_vector (1 downto 0);
  signal n15281_q : std_logic_vector (1 downto 0);
  signal n15284_o : std_logic;
  signal n15285_o : std_logic;
  signal n15289_o : std_logic;
  signal n15290_o : std_logic;
  signal n15295_o : std_logic_vector (3 downto 0);
  signal n15297_o : std_logic;
  signal n15298_o : std_logic_vector (31 downto 0);
  signal n15300_o : std_logic;
  signal n15301_o : std_logic_vector (31 downto 0);
  signal n15303_o : std_logic_vector (31 downto 0);
  signal n15304_o : std_logic_vector (3 downto 0);
  signal n15306_o : std_logic_vector (3 downto 0);
  signal n15308_o : std_logic;
  signal n15309_o : std_logic_vector (1 downto 0);
  signal n15310_o : std_logic_vector (3 downto 0);
  signal n15315_q : std_logic_vector (3 downto 0);
  signal n15319_o : std_logic;
  signal n15320_o : std_logic;
  signal n15322_o : std_logic;
  signal n15323_o : std_logic;
  signal n15328_o : std_logic_vector (3 downto 0);
  signal n15332_o : std_logic_vector (3 downto 0);
  signal n15349_o : std_logic_vector (35 downto 0);
  signal n15350_o : std_logic_vector (35 downto 0);
  signal n15351_o : std_logic_vector (35 downto 0);
  signal n15368_o : std_logic_vector (20 downto 0);
  constant n15372_o : std_logic_vector (36 downto 0) := "0000000000000000000000000000000000000";
  signal n15373_o : std_logic_vector (15 downto 0);
  signal n15374_o : std_logic_vector (36 downto 0);
  signal n15385_o : std_logic_vector (36 downto 0);
  signal n15400_o : std_logic_vector (36 downto 0);
  signal n15411_o : std_logic_vector (35 downto 0);
  signal n15412_o : std_logic;
  signal n15416_o : std_logic;
  signal n15417_o : std_logic;
  signal n15424_o : std_logic;
  signal n15430_o : std_logic;
  signal n15431_o : std_logic;
  signal n15432_o : std_logic;
  signal n15433_o : std_logic;
  signal n15434_o : std_logic;
  signal n15435_o : std_logic;
  signal n15436_o : std_logic;
  signal n15437_o : std_logic;
  signal n15438_o : std_logic;
  signal n15439_o : std_logic;
  signal n15440_o : std_logic;
  signal n15441_o : std_logic;
  signal n15442_o : std_logic;
  signal n15443_o : std_logic;
  signal n15444_o : std_logic;
  signal n15445_o : std_logic;
  signal n15446_o : std_logic;
  signal n15447_o : std_logic;
  signal n15448_o : std_logic;
  signal n15449_o : std_logic;
  signal n15450_o : std_logic;
  signal n15451_o : std_logic;
  signal n15452_o : std_logic;
  signal n15453_o : std_logic;
  signal n15454_o : std_logic;
  signal n15455_o : std_logic;
  signal n15456_o : std_logic;
  signal n15457_o : std_logic;
  signal n15458_o : std_logic;
  signal n15459_o : std_logic;
  signal n15460_o : std_logic;
  signal n15461_o : std_logic;
  signal n15462_o : std_logic;
  signal n15463_o : std_logic;
  signal n15464_o : std_logic;
  signal n15465_o : std_logic;
  signal n15466_o : std_logic_vector (3 downto 0);
  signal n15467_o : std_logic_vector (3 downto 0);
  signal n15468_o : std_logic_vector (3 downto 0);
  signal n15469_o : std_logic_vector (3 downto 0);
  signal n15470_o : std_logic_vector (3 downto 0);
  signal n15471_o : std_logic_vector (3 downto 0);
  signal n15472_o : std_logic_vector (3 downto 0);
  signal n15473_o : std_logic_vector (3 downto 0);
  signal n15474_o : std_logic_vector (3 downto 0);
  signal n15475_o : std_logic_vector (15 downto 0);
  signal n15476_o : std_logic_vector (15 downto 0);
  signal n15477_o : std_logic_vector (35 downto 0);
  signal n15478_o : std_logic_vector (34 downto 0);
  signal n15479_o : std_logic_vector (35 downto 0);
  signal n15480_o : std_logic_vector (35 downto 0);
  signal n15496_o : std_logic_vector (33 downto 0);
  signal n15497_o : std_logic;
  signal n15501_o : std_logic;
  signal n15502_o : std_logic;
  signal n15509_o : std_logic;
  signal n15513_o : std_logic;
  signal n15515_o : std_logic;
  signal n15516_o : std_logic;
  signal n15518_o : std_logic;
  signal n15524_o : std_logic;
  signal n15527_o : std_logic;
  signal n15529_o : std_logic;
  signal n15530_o : std_logic;
  signal n15531_o : std_logic;
  signal n15532_o : std_logic;
  signal n15533_o : std_logic;
  signal n15534_o : std_logic;
  signal n15535_o : std_logic;
  signal n15536_o : std_logic;
  signal n15537_o : std_logic;
  signal n15538_o : std_logic;
  signal n15539_o : std_logic;
  signal n15540_o : std_logic;
  signal n15541_o : std_logic;
  signal n15542_o : std_logic;
  signal n15543_o : std_logic;
  signal n15544_o : std_logic;
  signal n15545_o : std_logic;
  signal n15546_o : std_logic;
  signal n15547_o : std_logic_vector (3 downto 0);
  signal n15548_o : std_logic_vector (3 downto 0);
  signal n15549_o : std_logic_vector (3 downto 0);
  signal n15550_o : std_logic_vector (3 downto 0);
  signal n15551_o : std_logic_vector (1 downto 0);
  signal n15552_o : std_logic_vector (15 downto 0);
  signal n15553_o : std_logic_vector (17 downto 0);
  signal n15554_o : std_logic_vector (16 downto 0);
  signal n15555_o : std_logic_vector (17 downto 0);
  signal n15556_o : std_logic_vector (17 downto 0);
  signal n15557_o : std_logic_vector (17 downto 0);
  signal n15560_o : std_logic;
  signal n15561_o : std_logic;
  signal n15563_o : std_logic_vector (17 downto 0);
  signal n15564_o : std_logic_vector (17 downto 0);
  signal n15569_q : std_logic_vector (17 downto 0);
  signal n15570_o : std_logic_vector (17 downto 0);
  signal n15571_o : std_logic_vector (17 downto 0);
  signal n15572_o : std_logic_vector (17 downto 0);
  signal n15573_o : std_logic_vector (17 downto 0);
  signal n15574_o : std_logic_vector (17 downto 0);
  signal n15575_o : std_logic_vector (17 downto 0);
  signal n15576_o : std_logic_vector (17 downto 0);
  signal n15577_o : std_logic_vector (17 downto 0);
  signal n15578_o : std_logic_vector (17 downto 0);
  signal n15579_o : std_logic_vector (17 downto 0);
  signal n15580_o : std_logic_vector (17 downto 0);
  signal n15581_o : std_logic_vector (17 downto 0);
  signal n15582_o : std_logic_vector (1 downto 0);
  signal n15583_o : std_logic_vector (17 downto 0);
  signal n15584_o : std_logic_vector (1 downto 0);
  signal n15585_o : std_logic_vector (17 downto 0);
  signal n15586_o : std_logic_vector (1 downto 0);
  signal n15587_o : std_logic_vector (17 downto 0);
  signal n15588_o : std_logic;
  signal n15589_o : std_logic_vector (17 downto 0);
  signal n15590_o : std_logic;
  signal n15591_o : std_logic_vector (17 downto 0);
  signal n15592_o : std_logic_vector (17 downto 0);
  signal n15593_o : std_logic_vector (17 downto 0);
  signal n15594_o : std_logic_vector (17 downto 0);
  signal n15595_o : std_logic_vector (17 downto 0);
  signal n15596_o : std_logic_vector (17 downto 0);
  signal n15597_o : std_logic_vector (17 downto 0);
  signal n15598_o : std_logic_vector (17 downto 0);
  signal n15599_o : std_logic_vector (17 downto 0);
  signal n15600_o : std_logic_vector (17 downto 0);
  signal n15601_o : std_logic_vector (17 downto 0);
  signal n15602_o : std_logic_vector (17 downto 0);
  signal n15603_o : std_logic_vector (17 downto 0);
  signal n15604_o : std_logic_vector (1 downto 0);
  signal n15605_o : std_logic_vector (17 downto 0);
  signal n15606_o : std_logic_vector (1 downto 0);
  signal n15607_o : std_logic_vector (17 downto 0);
  signal n15608_o : std_logic_vector (1 downto 0);
  signal n15609_o : std_logic_vector (17 downto 0);
  signal n15610_o : std_logic;
  signal n15611_o : std_logic_vector (17 downto 0);
  signal n15612_o : std_logic;
  signal n15613_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n15285_o;
  valid_o <= n15290_o;
  data_o <= data_reg;
  -- ../Mixer/Mixer.vhd:24:12
  state_reg <= n15281_q; -- (signal)
  -- ../Mixer/Mixer.vhd:25:12
  channel_reg <= n15315_q; -- (signal)
  -- ../Mixer/Mixer.vhd:26:12
  data_reg <= n15569_q; -- (signal)
  -- ../Mixer/Mixer.vhd:35:21
  n15260_o <= state_reg when valid_i = '0' else "01";
  -- ../Mixer/Mixer.vhd:34:17
  n15262_o <= '1' when state_reg = "00" else '0';
  -- ../Mixer/Mixer.vhd:39:36
  n15263_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- ../Mixer/Mixer.vhd:39:36
  n15265_o <= '1' when n15263_o = "00000000000000000000000000001011" else '0';
  -- ../Mixer/Mixer.vhd:39:21
  n15267_o <= state_reg when n15265_o = '0' else "10";
  -- ../Mixer/Mixer.vhd:38:17
  n15269_o <= '1' when state_reg = "01" else '0';
  -- ../Mixer/Mixer.vhd:43:21
  n15271_o <= state_reg when ready_i = '0' else "00";
  -- ../Mixer/Mixer.vhd:42:17
  n15273_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:9:14
  n15274_o <= n15273_o & n15269_o & n15262_o;
  -- ../Mixer/Mixer.vhd:33:13
  with n15274_o select n15276_o <=
    n15271_o when "100",
    n15267_o when "010",
    n15260_o when "001",
    "XX" when others;
  -- ../Mixer/Mixer.vhd:32:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n15281_q <= "00";
    elsif rising_edge (clk_i) then
      n15281_q <= n15276_o;
    end if;
  end process;
  -- ../Mixer/Mixer.vhd:50:35
  n15284_o <= '1' when state_reg = "00" else '0';
  -- ../Mixer/Mixer.vhd:50:20
  n15285_o <= '0' when n15284_o = '0' else '1';
  -- ../Mixer/Mixer.vhd:51:35
  n15289_o <= '1' when state_reg = "10" else '0';
  -- ../Mixer/Mixer.vhd:51:20
  n15290_o <= '0' when n15289_o = '0' else '1';
  -- ../Mixer/Mixer.vhd:60:21
  n15295_o <= channel_reg when valid_i = '0' else "0001";
  -- ../Mixer/Mixer.vhd:59:17
  n15297_o <= '1' when state_reg = "00" else '0';
  -- ../Mixer/Mixer.vhd:64:36
  n15298_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- ../Mixer/Mixer.vhd:64:36
  n15300_o <= '1' when n15298_o = "00000000000000000000000000001011" else '0';
  -- ../Mixer/Mixer.vhd:67:52
  n15301_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- ../Mixer/Mixer.vhd:67:52
  n15303_o <= std_logic_vector (unsigned (n15301_o) + unsigned'("00000000000000000000000000000001"));
  -- ../Mixer/Mixer.vhd:67:40
  n15304_o <= n15303_o (3 downto 0);  --  trunc
  -- ../Mixer/Mixer.vhd:64:21
  n15306_o <= n15304_o when n15300_o = '0' else "0000";
  -- ../Mixer/Mixer.vhd:63:17
  n15308_o <= '1' when state_reg = "01" else '0';
  n15309_o <= n15308_o & n15297_o;
  -- ../Mixer/Mixer.vhd:58:13
  with n15309_o select n15310_o <=
    n15306_o when "10",
    n15295_o when "01",
    channel_reg when others;
  -- ../Mixer/Mixer.vhd:57:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n15315_q <= "0000";
    elsif rising_edge (clk_i) then
      n15315_q <= n15310_o;
    end if;
  end process;
  -- ../Mixer/Mixer.vhd:79:27
  n15319_o <= '1' when state_reg = "00" else '0';
  -- ../Mixer/Mixer.vhd:79:41
  n15320_o <= n15319_o and valid_i;
  -- ../Mixer/Mixer.vhd:79:73
  n15322_o <= '1' when state_reg = "01" else '0';
  -- ../Mixer/Mixer.vhd:79:60
  n15323_o <= n15320_o or n15322_o;
  -- ../Mixer/Mixer.vhd:80:65
  n15328_o <= std_logic_vector (unsigned'("1011") - unsigned (channel_reg));
  -- ../Mixer/Mixer.vhd:80:95
  n15332_o <= std_logic_vector (unsigned'("1011") - unsigned (channel_reg));
  -- ../fixed_pkg.vhd:268:100
  n15349_o <= std_logic_vector (resize (signed (n15591_o), 36));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n15350_o <= std_logic_vector (resize (signed (n15613_o), 36));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n15351_o <= std_logic_vector (resize (signed (n15349_o) * signed (n15350_o), 36));
  -- ../fixed_pkg.vhd:168:39
  n15368_o <= std_logic_vector (resize (signed (data_reg), 21));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n15373_o <= n15372_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n15374_o <= n15368_o & n15373_o;
  -- ../fixed_pkg.vhd:168:39
  n15385_o <= std_logic_vector (resize (signed (n15351_o), 37));  --  sext
  -- ../fixed_pkg.vhd:257:67
  n15400_o <= std_logic_vector (unsigned (n15374_o) + unsigned (n15385_o));
  -- ../fixed_pkg.vhd:168:39
  n15411_o <= n15400_o (35 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n15412_o <= n15400_o (36);
  -- ../fixed_pkg.vhd:185:23
  n15416_o <= n15400_o (35);
  -- ../fixed_pkg.vhd:185:27
  n15417_o <= '1' when n15416_o /= n15412_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n15424_o <= '0' when n15417_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n15430_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15431_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15432_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15433_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15434_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15435_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15436_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15437_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15438_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15439_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15440_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15441_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15442_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15443_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15444_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15445_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15446_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15447_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15448_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15449_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15450_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15451_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15452_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15453_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15454_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15455_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15456_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15457_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15458_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15459_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15460_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15461_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15462_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15463_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15464_o <= not n15412_o;
  -- ../fixed_pkg.vhd:196:31
  n15465_o <= not n15412_o;
  -- ../fixed_pkg.vhd:9:14
  n15466_o <= n15430_o & n15431_o & n15432_o & n15433_o;
  -- ../fixed_pkg.vhd:24:14
  n15467_o <= n15434_o & n15435_o & n15436_o & n15437_o;
  -- ../fixed_pkg.vhd:24:14
  n15468_o <= n15438_o & n15439_o & n15440_o & n15441_o;
  n15469_o <= n15442_o & n15443_o & n15444_o & n15445_o;
  -- ../fixed_pkg.vhd:24:14
  n15470_o <= n15446_o & n15447_o & n15448_o & n15449_o;
  -- ../fixed_pkg.vhd:9:14
  n15471_o <= n15450_o & n15451_o & n15452_o & n15453_o;
  -- ../fixed_pkg.vhd:9:14
  n15472_o <= n15454_o & n15455_o & n15456_o & n15457_o;
  n15473_o <= n15458_o & n15459_o & n15460_o & n15461_o;
  -- ../fixed_pkg.vhd:9:14
  n15474_o <= n15462_o & n15463_o & n15464_o & n15465_o;
  -- ../fixed_pkg.vhd:9:14
  n15475_o <= n15466_o & n15467_o & n15468_o & n15469_o;
  -- ../fixed_pkg.vhd:9:14
  n15476_o <= n15470_o & n15471_o & n15472_o & n15473_o;
  n15477_o <= n15475_o & n15476_o & n15474_o;
  -- ../fixed_pkg.vhd:9:14
  n15478_o <= n15477_o (34 downto 0);
  -- ../fixed_pkg.vhd:171:18
  n15479_o <= n15412_o & n15478_o;
  -- ../fixed_pkg.vhd:195:9
  n15480_o <= n15411_o when n15424_o = '0' else n15479_o;
  -- ../fixed_pkg.vhd:168:39
  n15496_o <= n15480_o (33 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n15497_o <= n15480_o (35);
  -- ../fixed_pkg.vhd:185:23
  n15501_o <= n15480_o (34);
  -- ../fixed_pkg.vhd:185:27
  n15502_o <= '1' when n15501_o /= n15497_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n15509_o <= '0' when n15502_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n15513_o <= '1' when n15502_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n15515_o <= n15480_o (33);
  -- ../fixed_pkg.vhd:185:27
  n15516_o <= '1' when n15515_o /= n15497_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n15518_o <= n15509_o when n15527_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n15524_o <= n15516_o and n15513_o;
  -- ../fixed_pkg.vhd:185:17
  n15527_o <= n15513_o and n15524_o;
  -- ../fixed_pkg.vhd:196:31
  n15529_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15530_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15531_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15532_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15533_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15534_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15535_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15536_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15537_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15538_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15539_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15540_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15541_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15542_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15543_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15544_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15545_o <= not n15497_o;
  -- ../fixed_pkg.vhd:196:31
  n15546_o <= not n15497_o;
  -- ../fixed_pkg.vhd:9:14
  n15547_o <= n15529_o & n15530_o & n15531_o & n15532_o;
  -- ../fixed_pkg.vhd:9:14
  n15548_o <= n15533_o & n15534_o & n15535_o & n15536_o;
  -- ../fixed_pkg.vhd:9:14
  n15549_o <= n15537_o & n15538_o & n15539_o & n15540_o;
  -- ../fixed_pkg.vhd:9:14
  n15550_o <= n15541_o & n15542_o & n15543_o & n15544_o;
  -- ../fixed_pkg.vhd:24:14
  n15551_o <= n15545_o & n15546_o;
  -- ../fixed_pkg.vhd:24:14
  n15552_o <= n15547_o & n15548_o & n15549_o & n15550_o;
  -- ../fixed_pkg.vhd:171:18
  n15553_o <= n15552_o & n15551_o;
  -- ../fixed_pkg.vhd:24:14
  n15554_o <= n15553_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n15555_o <= n15496_o (33 downto 16);
  -- ../fixed_pkg.vhd:171:18
  n15556_o <= n15497_o & n15554_o;
  -- ../fixed_pkg.vhd:195:9
  n15557_o <= n15555_o when n15518_o = '0' else n15556_o;
  -- ../Mixer/Mixer.vhd:81:29
  n15560_o <= '1' when state_reg = "10" else '0';
  -- ../Mixer/Mixer.vhd:81:43
  n15561_o <= n15560_o and ready_i;
  -- ../Mixer/Mixer.vhd:81:13
  n15563_o <= data_reg when n15561_o = '0' else "000000000000000000";
  -- ../Mixer/Mixer.vhd:79:13
  n15564_o <= n15563_o when n15323_o = '0' else n15557_o;
  -- ../Mixer/Mixer.vhd:78:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n15569_q <= "000000000000000000";
    elsif rising_edge (clk_i) then
      n15569_q <= n15564_o;
    end if;
  end process;
  -- ../Mixer/Mixer.vhd:18:9
  n15570_o <= env_data_i (17 downto 0);
  -- ../Mixer/Mixer.vhd:16:9
  n15571_o <= env_data_i (35 downto 18);
  -- ../Mixer/Mixer.vhd:13:9
  n15572_o <= env_data_i (53 downto 36);
  -- ../fixed_pkg.vhd:24:14
  n15573_o <= env_data_i (71 downto 54);
  -- ../fixed_pkg.vhd:170:18
  n15574_o <= env_data_i (89 downto 72);
  -- ../fixed_pkg.vhd:185:17
  n15575_o <= env_data_i (107 downto 90);
  -- ../fixed_pkg.vhd:185:17
  n15576_o <= env_data_i (125 downto 108);
  -- ../fixed_pkg.vhd:185:17
  n15577_o <= env_data_i (143 downto 126);
  -- ../fixed_pkg.vhd:185:17
  n15578_o <= env_data_i (161 downto 144);
  -- ../fixed_pkg.vhd:185:17
  n15579_o <= env_data_i (179 downto 162);
  -- ../fixed_pkg.vhd:171:18
  n15580_o <= env_data_i (197 downto 180);
  -- ../fixed_pkg.vhd:185:17
  n15581_o <= env_data_i (215 downto 198);
  -- ../Mixer/Mixer.vhd:80:65
  n15582_o <= n15328_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:65
  with n15582_o select n15583_o <=
    n15570_o when "00",
    n15571_o when "01",
    n15572_o when "10",
    n15573_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../Mixer/Mixer.vhd:80:65
  n15584_o <= n15328_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:65
  with n15584_o select n15585_o <=
    n15574_o when "00",
    n15575_o when "01",
    n15576_o when "10",
    n15577_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../Mixer/Mixer.vhd:80:65
  n15586_o <= n15328_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:65
  with n15586_o select n15587_o <=
    n15578_o when "00",
    n15579_o when "01",
    n15580_o when "10",
    n15581_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../fixed_pkg.vhd:24:14
  n15588_o <= n15328_o (2);
  -- ../Mixer/Mixer.vhd:80:65
  n15589_o <= n15583_o when n15588_o = '0' else n15585_o;
  -- ../fixed_pkg.vhd:171:18
  n15590_o <= n15328_o (3);
  -- ../Mixer/Mixer.vhd:80:65
  n15591_o <= n15589_o when n15590_o = '0' else n15587_o;
  -- ../Mixer/Mixer.vhd:80:66
  n15592_o <= carrier_data_i (17 downto 0);
  -- ../Mixer/Mixer.vhd:80:65
  n15593_o <= carrier_data_i (35 downto 18);
  -- ../fixed_pkg.vhd:170:18
  n15594_o <= carrier_data_i (53 downto 36);
  n15595_o <= carrier_data_i (71 downto 54);
  -- ../fixed_pkg.vhd:9:14
  n15596_o <= carrier_data_i (89 downto 72);
  -- ../fixed_pkg.vhd:9:14
  n15597_o <= carrier_data_i (107 downto 90);
  -- ../fixed_pkg.vhd:24:14
  n15598_o <= carrier_data_i (125 downto 108);
  -- ../fixed_pkg.vhd:9:14
  n15599_o <= carrier_data_i (143 downto 126);
  -- ../fixed_pkg.vhd:24:14
  n15600_o <= carrier_data_i (161 downto 144);
  -- ../fixed_pkg.vhd:24:14
  n15601_o <= carrier_data_i (179 downto 162);
  -- ../fixed_pkg.vhd:9:14
  n15602_o <= carrier_data_i (197 downto 180);
  -- ../fixed_pkg.vhd:24:14
  n15603_o <= carrier_data_i (215 downto 198);
  -- ../Mixer/Mixer.vhd:80:95
  n15604_o <= n15332_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:95
  with n15604_o select n15605_o <=
    n15592_o when "00",
    n15593_o when "01",
    n15594_o when "10",
    n15595_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../Mixer/Mixer.vhd:80:95
  n15606_o <= n15332_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:95
  with n15606_o select n15607_o <=
    n15596_o when "00",
    n15597_o when "01",
    n15598_o when "10",
    n15599_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../Mixer/Mixer.vhd:80:95
  n15608_o <= n15332_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:95
  with n15608_o select n15609_o <=
    n15600_o when "00",
    n15601_o when "01",
    n15602_o when "10",
    n15603_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../fixed_pkg.vhd:185:17
  n15610_o <= n15332_o (2);
  -- ../Mixer/Mixer.vhd:80:95
  n15611_o <= n15605_o when n15610_o = '0' else n15607_o;
  n15612_o <= n15332_o (3);
  -- ../Mixer/Mixer.vhd:80:95
  n15613_o <= n15611_o when n15612_o = '0' else n15609_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_123a8c06fd239d8db9e24de2ddc3cf87b860aaca is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_123a8c06fd239d8db9e24de2ddc3cf87b860aaca;

architecture rtl of biquadfilter_123a8c06fd239d8db9e24de2ddc3cf87b860aaca is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n14192_o : std_logic_vector (1 downto 0);
  signal n14194_o : std_logic;
  signal n14196_o : std_logic;
  signal n14198_o : std_logic_vector (1 downto 0);
  signal n14200_o : std_logic;
  signal n14201_o : std_logic_vector (2 downto 0);
  signal n14204_o : std_logic_vector (1 downto 0);
  signal n14209_q : std_logic_vector (1 downto 0);
  signal n14212_o : std_logic;
  signal n14213_o : std_logic;
  signal n14217_o : std_logic;
  signal n14218_o : std_logic;
  signal n14238_o : std_logic_vector (19 downto 0);
  constant n14242_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n14243_o : std_logic_vector (4 downto 0);
  signal n14244_o : std_logic_vector (24 downto 0);
  signal n14245_o : std_logic_vector (24 downto 0);
  signal n14247_o : std_logic;
  signal n14261_o : std_logic_vector (42 downto 0);
  signal n14264_o : std_logic_vector (42 downto 0);
  signal n14281_o : std_logic_vector (43 downto 0);
  signal n14296_o : std_logic_vector (27 downto 0);
  constant n14300_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n14301_o : std_logic_vector (15 downto 0);
  signal n14302_o : std_logic_vector (43 downto 0);
  signal n14313_o : std_logic_vector (43 downto 0);
  signal n14324_o : std_logic_vector (42 downto 0);
  signal n14325_o : std_logic;
  signal n14329_o : std_logic;
  signal n14330_o : std_logic;
  signal n14337_o : std_logic;
  signal n14343_o : std_logic;
  signal n14344_o : std_logic;
  signal n14345_o : std_logic;
  signal n14346_o : std_logic;
  signal n14347_o : std_logic;
  signal n14348_o : std_logic;
  signal n14349_o : std_logic;
  signal n14350_o : std_logic;
  signal n14351_o : std_logic;
  signal n14352_o : std_logic;
  signal n14353_o : std_logic;
  signal n14354_o : std_logic;
  signal n14355_o : std_logic;
  signal n14356_o : std_logic;
  signal n14357_o : std_logic;
  signal n14358_o : std_logic;
  signal n14359_o : std_logic;
  signal n14360_o : std_logic;
  signal n14361_o : std_logic;
  signal n14362_o : std_logic;
  signal n14363_o : std_logic;
  signal n14364_o : std_logic;
  signal n14365_o : std_logic;
  signal n14366_o : std_logic;
  signal n14367_o : std_logic;
  signal n14368_o : std_logic;
  signal n14369_o : std_logic;
  signal n14370_o : std_logic;
  signal n14371_o : std_logic;
  signal n14372_o : std_logic;
  signal n14373_o : std_logic;
  signal n14374_o : std_logic;
  signal n14375_o : std_logic;
  signal n14376_o : std_logic;
  signal n14377_o : std_logic;
  signal n14378_o : std_logic;
  signal n14379_o : std_logic;
  signal n14380_o : std_logic;
  signal n14381_o : std_logic;
  signal n14382_o : std_logic;
  signal n14383_o : std_logic;
  signal n14384_o : std_logic;
  signal n14385_o : std_logic;
  signal n14386_o : std_logic_vector (3 downto 0);
  signal n14387_o : std_logic_vector (3 downto 0);
  signal n14388_o : std_logic_vector (3 downto 0);
  signal n14389_o : std_logic_vector (3 downto 0);
  signal n14390_o : std_logic_vector (3 downto 0);
  signal n14391_o : std_logic_vector (3 downto 0);
  signal n14392_o : std_logic_vector (3 downto 0);
  signal n14393_o : std_logic_vector (3 downto 0);
  signal n14394_o : std_logic_vector (3 downto 0);
  signal n14395_o : std_logic_vector (3 downto 0);
  signal n14396_o : std_logic_vector (2 downto 0);
  signal n14397_o : std_logic_vector (15 downto 0);
  signal n14398_o : std_logic_vector (15 downto 0);
  signal n14399_o : std_logic_vector (10 downto 0);
  signal n14400_o : std_logic_vector (42 downto 0);
  signal n14401_o : std_logic_vector (41 downto 0);
  signal n14402_o : std_logic_vector (42 downto 0);
  signal n14403_o : std_logic_vector (42 downto 0);
  signal n14419_o : std_logic_vector (40 downto 0);
  signal n14420_o : std_logic;
  signal n14424_o : std_logic;
  signal n14425_o : std_logic;
  signal n14432_o : std_logic;
  signal n14436_o : std_logic;
  signal n14438_o : std_logic;
  signal n14439_o : std_logic;
  signal n14441_o : std_logic;
  signal n14447_o : std_logic;
  signal n14450_o : std_logic;
  signal n14452_o : std_logic;
  signal n14453_o : std_logic;
  signal n14454_o : std_logic;
  signal n14455_o : std_logic;
  signal n14456_o : std_logic;
  signal n14457_o : std_logic;
  signal n14458_o : std_logic;
  signal n14459_o : std_logic;
  signal n14460_o : std_logic;
  signal n14461_o : std_logic;
  signal n14462_o : std_logic;
  signal n14463_o : std_logic;
  signal n14464_o : std_logic;
  signal n14465_o : std_logic;
  signal n14466_o : std_logic;
  signal n14467_o : std_logic;
  signal n14468_o : std_logic;
  signal n14469_o : std_logic;
  signal n14470_o : std_logic;
  signal n14471_o : std_logic;
  signal n14472_o : std_logic;
  signal n14473_o : std_logic;
  signal n14474_o : std_logic;
  signal n14475_o : std_logic;
  signal n14476_o : std_logic;
  signal n14477_o : std_logic_vector (3 downto 0);
  signal n14478_o : std_logic_vector (3 downto 0);
  signal n14479_o : std_logic_vector (3 downto 0);
  signal n14480_o : std_logic_vector (3 downto 0);
  signal n14481_o : std_logic_vector (3 downto 0);
  signal n14482_o : std_logic_vector (3 downto 0);
  signal n14483_o : std_logic_vector (15 downto 0);
  signal n14484_o : std_logic_vector (8 downto 0);
  signal n14485_o : std_logic_vector (24 downto 0);
  signal n14486_o : std_logic_vector (23 downto 0);
  signal n14487_o : std_logic_vector (24 downto 0);
  signal n14488_o : std_logic_vector (24 downto 0);
  signal n14489_o : std_logic_vector (24 downto 0);
  signal n14505_o : std_logic_vector (42 downto 0);
  signal n14508_o : std_logic_vector (42 downto 0);
  signal n14520_o : std_logic_vector (42 downto 0);
  signal n14523_o : std_logic_vector (42 downto 0);
  signal n14540_o : std_logic_vector (43 downto 0);
  signal n14555_o : std_logic_vector (43 downto 0);
  signal n14570_o : std_logic_vector (43 downto 0);
  signal n14581_o : std_logic_vector (42 downto 0);
  signal n14582_o : std_logic;
  signal n14586_o : std_logic;
  signal n14587_o : std_logic;
  signal n14594_o : std_logic;
  signal n14600_o : std_logic;
  signal n14601_o : std_logic;
  signal n14602_o : std_logic;
  signal n14603_o : std_logic;
  signal n14604_o : std_logic;
  signal n14605_o : std_logic;
  signal n14606_o : std_logic;
  signal n14607_o : std_logic;
  signal n14608_o : std_logic;
  signal n14609_o : std_logic;
  signal n14610_o : std_logic;
  signal n14611_o : std_logic;
  signal n14612_o : std_logic;
  signal n14613_o : std_logic;
  signal n14614_o : std_logic;
  signal n14615_o : std_logic;
  signal n14616_o : std_logic;
  signal n14617_o : std_logic;
  signal n14618_o : std_logic;
  signal n14619_o : std_logic;
  signal n14620_o : std_logic;
  signal n14621_o : std_logic;
  signal n14622_o : std_logic;
  signal n14623_o : std_logic;
  signal n14624_o : std_logic;
  signal n14625_o : std_logic;
  signal n14626_o : std_logic;
  signal n14627_o : std_logic;
  signal n14628_o : std_logic;
  signal n14629_o : std_logic;
  signal n14630_o : std_logic;
  signal n14631_o : std_logic;
  signal n14632_o : std_logic;
  signal n14633_o : std_logic;
  signal n14634_o : std_logic;
  signal n14635_o : std_logic;
  signal n14636_o : std_logic;
  signal n14637_o : std_logic;
  signal n14638_o : std_logic;
  signal n14639_o : std_logic;
  signal n14640_o : std_logic;
  signal n14641_o : std_logic;
  signal n14642_o : std_logic;
  signal n14643_o : std_logic_vector (3 downto 0);
  signal n14644_o : std_logic_vector (3 downto 0);
  signal n14645_o : std_logic_vector (3 downto 0);
  signal n14646_o : std_logic_vector (3 downto 0);
  signal n14647_o : std_logic_vector (3 downto 0);
  signal n14648_o : std_logic_vector (3 downto 0);
  signal n14649_o : std_logic_vector (3 downto 0);
  signal n14650_o : std_logic_vector (3 downto 0);
  signal n14651_o : std_logic_vector (3 downto 0);
  signal n14652_o : std_logic_vector (3 downto 0);
  signal n14653_o : std_logic_vector (2 downto 0);
  signal n14654_o : std_logic_vector (15 downto 0);
  signal n14655_o : std_logic_vector (15 downto 0);
  signal n14656_o : std_logic_vector (10 downto 0);
  signal n14657_o : std_logic_vector (42 downto 0);
  signal n14658_o : std_logic_vector (41 downto 0);
  signal n14659_o : std_logic_vector (42 downto 0);
  signal n14660_o : std_logic_vector (42 downto 0);
  signal n14678_o : std_logic_vector (43 downto 0);
  signal n14693_o : std_logic_vector (27 downto 0);
  constant n14697_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n14698_o : std_logic_vector (15 downto 0);
  signal n14699_o : std_logic_vector (43 downto 0);
  signal n14710_o : std_logic_vector (43 downto 0);
  signal n14721_o : std_logic_vector (42 downto 0);
  signal n14722_o : std_logic;
  signal n14726_o : std_logic;
  signal n14727_o : std_logic;
  signal n14734_o : std_logic;
  signal n14740_o : std_logic;
  signal n14741_o : std_logic;
  signal n14742_o : std_logic;
  signal n14743_o : std_logic;
  signal n14744_o : std_logic;
  signal n14745_o : std_logic;
  signal n14746_o : std_logic;
  signal n14747_o : std_logic;
  signal n14748_o : std_logic;
  signal n14749_o : std_logic;
  signal n14750_o : std_logic;
  signal n14751_o : std_logic;
  signal n14752_o : std_logic;
  signal n14753_o : std_logic;
  signal n14754_o : std_logic;
  signal n14755_o : std_logic;
  signal n14756_o : std_logic;
  signal n14757_o : std_logic;
  signal n14758_o : std_logic;
  signal n14759_o : std_logic;
  signal n14760_o : std_logic;
  signal n14761_o : std_logic;
  signal n14762_o : std_logic;
  signal n14763_o : std_logic;
  signal n14764_o : std_logic;
  signal n14765_o : std_logic;
  signal n14766_o : std_logic;
  signal n14767_o : std_logic;
  signal n14768_o : std_logic;
  signal n14769_o : std_logic;
  signal n14770_o : std_logic;
  signal n14771_o : std_logic;
  signal n14772_o : std_logic;
  signal n14773_o : std_logic;
  signal n14774_o : std_logic;
  signal n14775_o : std_logic;
  signal n14776_o : std_logic;
  signal n14777_o : std_logic;
  signal n14778_o : std_logic;
  signal n14779_o : std_logic;
  signal n14780_o : std_logic;
  signal n14781_o : std_logic;
  signal n14782_o : std_logic;
  signal n14783_o : std_logic_vector (3 downto 0);
  signal n14784_o : std_logic_vector (3 downto 0);
  signal n14785_o : std_logic_vector (3 downto 0);
  signal n14786_o : std_logic_vector (3 downto 0);
  signal n14787_o : std_logic_vector (3 downto 0);
  signal n14788_o : std_logic_vector (3 downto 0);
  signal n14789_o : std_logic_vector (3 downto 0);
  signal n14790_o : std_logic_vector (3 downto 0);
  signal n14791_o : std_logic_vector (3 downto 0);
  signal n14792_o : std_logic_vector (3 downto 0);
  signal n14793_o : std_logic_vector (2 downto 0);
  signal n14794_o : std_logic_vector (15 downto 0);
  signal n14795_o : std_logic_vector (15 downto 0);
  signal n14796_o : std_logic_vector (10 downto 0);
  signal n14797_o : std_logic_vector (42 downto 0);
  signal n14798_o : std_logic_vector (41 downto 0);
  signal n14799_o : std_logic_vector (42 downto 0);
  signal n14800_o : std_logic_vector (42 downto 0);
  signal n14816_o : std_logic_vector (40 downto 0);
  signal n14817_o : std_logic;
  signal n14821_o : std_logic;
  signal n14822_o : std_logic;
  signal n14829_o : std_logic;
  signal n14833_o : std_logic;
  signal n14835_o : std_logic;
  signal n14836_o : std_logic;
  signal n14838_o : std_logic;
  signal n14844_o : std_logic;
  signal n14847_o : std_logic;
  signal n14849_o : std_logic;
  signal n14850_o : std_logic;
  signal n14851_o : std_logic;
  signal n14852_o : std_logic;
  signal n14853_o : std_logic;
  signal n14854_o : std_logic;
  signal n14855_o : std_logic;
  signal n14856_o : std_logic;
  signal n14857_o : std_logic;
  signal n14858_o : std_logic;
  signal n14859_o : std_logic;
  signal n14860_o : std_logic;
  signal n14861_o : std_logic;
  signal n14862_o : std_logic;
  signal n14863_o : std_logic;
  signal n14864_o : std_logic;
  signal n14865_o : std_logic;
  signal n14866_o : std_logic;
  signal n14867_o : std_logic;
  signal n14868_o : std_logic;
  signal n14869_o : std_logic;
  signal n14870_o : std_logic;
  signal n14871_o : std_logic;
  signal n14872_o : std_logic;
  signal n14873_o : std_logic;
  signal n14874_o : std_logic_vector (3 downto 0);
  signal n14875_o : std_logic_vector (3 downto 0);
  signal n14876_o : std_logic_vector (3 downto 0);
  signal n14877_o : std_logic_vector (3 downto 0);
  signal n14878_o : std_logic_vector (3 downto 0);
  signal n14879_o : std_logic_vector (3 downto 0);
  signal n14880_o : std_logic_vector (15 downto 0);
  signal n14881_o : std_logic_vector (8 downto 0);
  signal n14882_o : std_logic_vector (24 downto 0);
  signal n14883_o : std_logic_vector (23 downto 0);
  signal n14884_o : std_logic_vector (24 downto 0);
  signal n14885_o : std_logic_vector (24 downto 0);
  signal n14886_o : std_logic_vector (24 downto 0);
  signal n14901_o : std_logic_vector (42 downto 0);
  signal n14904_o : std_logic_vector (42 downto 0);
  signal n14916_o : std_logic_vector (42 downto 0);
  signal n14919_o : std_logic_vector (42 downto 0);
  signal n14936_o : std_logic_vector (43 downto 0);
  signal n14951_o : std_logic_vector (43 downto 0);
  signal n14966_o : std_logic_vector (43 downto 0);
  signal n14977_o : std_logic_vector (42 downto 0);
  signal n14978_o : std_logic;
  signal n14982_o : std_logic;
  signal n14983_o : std_logic;
  signal n14990_o : std_logic;
  signal n14996_o : std_logic;
  signal n14997_o : std_logic;
  signal n14998_o : std_logic;
  signal n14999_o : std_logic;
  signal n15000_o : std_logic;
  signal n15001_o : std_logic;
  signal n15002_o : std_logic;
  signal n15003_o : std_logic;
  signal n15004_o : std_logic;
  signal n15005_o : std_logic;
  signal n15006_o : std_logic;
  signal n15007_o : std_logic;
  signal n15008_o : std_logic;
  signal n15009_o : std_logic;
  signal n15010_o : std_logic;
  signal n15011_o : std_logic;
  signal n15012_o : std_logic;
  signal n15013_o : std_logic;
  signal n15014_o : std_logic;
  signal n15015_o : std_logic;
  signal n15016_o : std_logic;
  signal n15017_o : std_logic;
  signal n15018_o : std_logic;
  signal n15019_o : std_logic;
  signal n15020_o : std_logic;
  signal n15021_o : std_logic;
  signal n15022_o : std_logic;
  signal n15023_o : std_logic;
  signal n15024_o : std_logic;
  signal n15025_o : std_logic;
  signal n15026_o : std_logic;
  signal n15027_o : std_logic;
  signal n15028_o : std_logic;
  signal n15029_o : std_logic;
  signal n15030_o : std_logic;
  signal n15031_o : std_logic;
  signal n15032_o : std_logic;
  signal n15033_o : std_logic;
  signal n15034_o : std_logic;
  signal n15035_o : std_logic;
  signal n15036_o : std_logic;
  signal n15037_o : std_logic;
  signal n15038_o : std_logic;
  signal n15039_o : std_logic_vector (3 downto 0);
  signal n15040_o : std_logic_vector (3 downto 0);
  signal n15041_o : std_logic_vector (3 downto 0);
  signal n15042_o : std_logic_vector (3 downto 0);
  signal n15043_o : std_logic_vector (3 downto 0);
  signal n15044_o : std_logic_vector (3 downto 0);
  signal n15045_o : std_logic_vector (3 downto 0);
  signal n15046_o : std_logic_vector (3 downto 0);
  signal n15047_o : std_logic_vector (3 downto 0);
  signal n15048_o : std_logic_vector (3 downto 0);
  signal n15049_o : std_logic_vector (2 downto 0);
  signal n15050_o : std_logic_vector (15 downto 0);
  signal n15051_o : std_logic_vector (15 downto 0);
  signal n15052_o : std_logic_vector (10 downto 0);
  signal n15053_o : std_logic_vector (42 downto 0);
  signal n15054_o : std_logic_vector (41 downto 0);
  signal n15055_o : std_logic_vector (42 downto 0);
  signal n15056_o : std_logic_vector (42 downto 0);
  signal n15072_o : std_logic_vector (40 downto 0);
  signal n15073_o : std_logic;
  signal n15077_o : std_logic;
  signal n15078_o : std_logic;
  signal n15085_o : std_logic;
  signal n15089_o : std_logic;
  signal n15091_o : std_logic;
  signal n15092_o : std_logic;
  signal n15094_o : std_logic;
  signal n15100_o : std_logic;
  signal n15103_o : std_logic;
  signal n15105_o : std_logic;
  signal n15106_o : std_logic;
  signal n15107_o : std_logic;
  signal n15108_o : std_logic;
  signal n15109_o : std_logic;
  signal n15110_o : std_logic;
  signal n15111_o : std_logic;
  signal n15112_o : std_logic;
  signal n15113_o : std_logic;
  signal n15114_o : std_logic;
  signal n15115_o : std_logic;
  signal n15116_o : std_logic;
  signal n15117_o : std_logic;
  signal n15118_o : std_logic;
  signal n15119_o : std_logic;
  signal n15120_o : std_logic;
  signal n15121_o : std_logic;
  signal n15122_o : std_logic;
  signal n15123_o : std_logic;
  signal n15124_o : std_logic;
  signal n15125_o : std_logic;
  signal n15126_o : std_logic;
  signal n15127_o : std_logic;
  signal n15128_o : std_logic;
  signal n15129_o : std_logic;
  signal n15130_o : std_logic_vector (3 downto 0);
  signal n15131_o : std_logic_vector (3 downto 0);
  signal n15132_o : std_logic_vector (3 downto 0);
  signal n15133_o : std_logic_vector (3 downto 0);
  signal n15134_o : std_logic_vector (3 downto 0);
  signal n15135_o : std_logic_vector (3 downto 0);
  signal n15136_o : std_logic_vector (15 downto 0);
  signal n15137_o : std_logic_vector (8 downto 0);
  signal n15138_o : std_logic_vector (24 downto 0);
  signal n15139_o : std_logic_vector (23 downto 0);
  signal n15140_o : std_logic_vector (24 downto 0);
  signal n15141_o : std_logic_vector (24 downto 0);
  signal n15142_o : std_logic_vector (24 downto 0);
  signal n15145_o : std_logic;
  signal n15146_o : std_logic_vector (1 downto 0);
  signal n15147_o : std_logic_vector (24 downto 0);
  signal n15148_o : std_logic_vector (24 downto 0);
  signal n15149_o : std_logic_vector (24 downto 0);
  signal n15150_o : std_logic_vector (24 downto 0);
  signal n15165_o : std_logic;
  signal n15166_o : std_logic_vector (24 downto 0);
  signal n15167_q : std_logic_vector (24 downto 0);
  signal n15168_o : std_logic;
  signal n15169_o : std_logic_vector (24 downto 0);
  signal n15170_q : std_logic_vector (24 downto 0);
  signal n15171_q : std_logic_vector (24 downto 0);
  signal n15172_q : std_logic_vector (24 downto 0);
  signal n15191_o : std_logic_vector (22 downto 0);
  signal n15192_o : std_logic;
  signal n15196_o : std_logic;
  signal n15197_o : std_logic;
  signal n15204_o : std_logic;
  signal n15208_o : std_logic;
  signal n15210_o : std_logic;
  signal n15211_o : std_logic;
  signal n15213_o : std_logic;
  signal n15219_o : std_logic;
  signal n15222_o : std_logic;
  signal n15224_o : std_logic;
  signal n15225_o : std_logic;
  signal n15226_o : std_logic;
  signal n15227_o : std_logic;
  signal n15228_o : std_logic;
  signal n15229_o : std_logic;
  signal n15230_o : std_logic;
  signal n15231_o : std_logic;
  signal n15232_o : std_logic;
  signal n15233_o : std_logic;
  signal n15234_o : std_logic;
  signal n15235_o : std_logic;
  signal n15236_o : std_logic;
  signal n15237_o : std_logic;
  signal n15238_o : std_logic;
  signal n15239_o : std_logic;
  signal n15240_o : std_logic;
  signal n15241_o : std_logic;
  signal n15242_o : std_logic_vector (3 downto 0);
  signal n15243_o : std_logic_vector (3 downto 0);
  signal n15244_o : std_logic_vector (3 downto 0);
  signal n15245_o : std_logic_vector (3 downto 0);
  signal n15246_o : std_logic_vector (1 downto 0);
  signal n15247_o : std_logic_vector (15 downto 0);
  signal n15248_o : std_logic_vector (17 downto 0);
  signal n15249_o : std_logic_vector (16 downto 0);
  signal n15250_o : std_logic_vector (17 downto 0);
  signal n15251_o : std_logic_vector (17 downto 0);
  signal n15252_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n14213_o;
  valid_o <= n14218_o;
  data_o <= n15252_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n14209_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n15167_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n15170_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n15171_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n15172_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n14192_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n14194_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n14196_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n14198_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n14200_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:170:18
  n14201_o <= n14200_o & n14196_o & n14194_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n14201_o select n14204_o <=
    n14198_o when "100",
    "10" when "010",
    n14192_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n14209_q <= "00";
    elsif rising_edge (clk_i) then
      n14209_q <= n14204_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n14212_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n14213_o <= '0' when n14212_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n14217_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n14218_o <= '0' when n14217_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n14238_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n14243_o <= n14242_o (4 downto 0);
  n14244_o <= n14238_o & n14243_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n14245_o <= x_reg when valid_i = '0' else n14244_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n14247_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n14261_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n14264_o <= std_logic_vector (resize (signed (n14261_o) * signed'("0000000000000000000000000000000100001111001"), 43));
  -- ../fixed_pkg.vhd:168:39
  n14281_o <= std_logic_vector (resize (signed (n14264_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n14296_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n14301_o <= n14300_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n14302_o <= n14296_o & n14301_o;
  -- ../fixed_pkg.vhd:257:67
  n14313_o <= std_logic_vector (unsigned (n14281_o) + unsigned (n14302_o));
  -- ../fixed_pkg.vhd:168:39
  n14324_o <= n14313_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14325_o <= n14313_o (43);
  -- ../fixed_pkg.vhd:185:23
  n14329_o <= n14313_o (42);
  -- ../fixed_pkg.vhd:185:27
  n14330_o <= '1' when n14329_o /= n14325_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14337_o <= '0' when n14330_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n14343_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14344_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14345_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14346_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14347_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14348_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14349_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14350_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14351_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14352_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14353_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14354_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14355_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14356_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14357_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14358_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14359_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14360_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14361_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14362_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14363_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14364_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14365_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14366_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14367_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14368_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14369_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14370_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14371_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14372_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14373_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14374_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14375_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14376_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14377_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14378_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14379_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14380_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14381_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14382_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14383_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14384_o <= not n14325_o;
  -- ../fixed_pkg.vhd:196:31
  n14385_o <= not n14325_o;
  -- ../fixed_pkg.vhd:184:13
  n14386_o <= n14343_o & n14344_o & n14345_o & n14346_o;
  -- ../fixed_pkg.vhd:171:18
  n14387_o <= n14347_o & n14348_o & n14349_o & n14350_o;
  n14388_o <= n14351_o & n14352_o & n14353_o & n14354_o;
  -- ../fixed_pkg.vhd:170:18
  n14389_o <= n14355_o & n14356_o & n14357_o & n14358_o;
  n14390_o <= n14359_o & n14360_o & n14361_o & n14362_o;
  -- ../fixed_pkg.vhd:9:14
  n14391_o <= n14363_o & n14364_o & n14365_o & n14366_o;
  -- ../fixed_pkg.vhd:9:14
  n14392_o <= n14367_o & n14368_o & n14369_o & n14370_o;
  n14393_o <= n14371_o & n14372_o & n14373_o & n14374_o;
  -- ../fixed_pkg.vhd:9:14
  n14394_o <= n14375_o & n14376_o & n14377_o & n14378_o;
  -- ../fixed_pkg.vhd:24:14
  n14395_o <= n14379_o & n14380_o & n14381_o & n14382_o;
  -- ../fixed_pkg.vhd:24:14
  n14396_o <= n14383_o & n14384_o & n14385_o;
  n14397_o <= n14386_o & n14387_o & n14388_o & n14389_o;
  -- ../fixed_pkg.vhd:24:14
  n14398_o <= n14390_o & n14391_o & n14392_o & n14393_o;
  -- ../fixed_pkg.vhd:9:14
  n14399_o <= n14394_o & n14395_o & n14396_o;
  -- ../fixed_pkg.vhd:9:14
  n14400_o <= n14397_o & n14398_o & n14399_o;
  n14401_o <= n14400_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n14402_o <= n14325_o & n14401_o;
  -- ../fixed_pkg.vhd:195:9
  n14403_o <= n14324_o when n14337_o = '0' else n14402_o;
  -- ../fixed_pkg.vhd:168:39
  n14419_o <= n14403_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14420_o <= n14403_o (42);
  -- ../fixed_pkg.vhd:185:23
  n14424_o <= n14403_o (41);
  -- ../fixed_pkg.vhd:185:27
  n14425_o <= '1' when n14424_o /= n14420_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14432_o <= '0' when n14425_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n14436_o <= '1' when n14425_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n14438_o <= n14403_o (40);
  -- ../fixed_pkg.vhd:185:27
  n14439_o <= '1' when n14438_o /= n14420_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14441_o <= n14432_o when n14450_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n14447_o <= n14439_o and n14436_o;
  -- ../fixed_pkg.vhd:185:17
  n14450_o <= n14436_o and n14447_o;
  -- ../fixed_pkg.vhd:196:31
  n14452_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14453_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14454_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14455_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14456_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14457_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14458_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14459_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14460_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14461_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14462_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14463_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14464_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14465_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14466_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14467_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14468_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14469_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14470_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14471_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14472_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14473_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14474_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14475_o <= not n14420_o;
  -- ../fixed_pkg.vhd:196:31
  n14476_o <= not n14420_o;
  -- ../fixed_pkg.vhd:9:14
  n14477_o <= n14452_o & n14453_o & n14454_o & n14455_o;
  -- ../fixed_pkg.vhd:9:14
  n14478_o <= n14456_o & n14457_o & n14458_o & n14459_o;
  -- ../fixed_pkg.vhd:24:14
  n14479_o <= n14460_o & n14461_o & n14462_o & n14463_o;
  -- ../fixed_pkg.vhd:24:14
  n14480_o <= n14464_o & n14465_o & n14466_o & n14467_o;
  -- ../fixed_pkg.vhd:171:18
  n14481_o <= n14468_o & n14469_o & n14470_o & n14471_o;
  -- ../fixed_pkg.vhd:24:14
  n14482_o <= n14472_o & n14473_o & n14474_o & n14475_o;
  -- ../fixed_pkg.vhd:9:14
  n14483_o <= n14477_o & n14478_o & n14479_o & n14480_o;
  -- ../fixed_pkg.vhd:171:18
  n14484_o <= n14481_o & n14482_o & n14476_o;
  -- ../fixed_pkg.vhd:185:17
  n14485_o <= n14483_o & n14484_o;
  -- ../fixed_pkg.vhd:170:18
  n14486_o <= n14485_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n14487_o <= n14419_o (40 downto 16);
  -- ../fixed_pkg.vhd:169:40
  n14488_o <= n14420_o & n14486_o;
  -- ../fixed_pkg.vhd:195:9
  n14489_o <= n14487_o when n14441_o = '0' else n14488_o;
  -- ../fixed_pkg.vhd:268:100
  n14505_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n14508_o <= std_logic_vector (resize (signed (n14505_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n14520_o <= std_logic_vector (resize (signed (n14489_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n14523_o <= std_logic_vector (resize (signed (n14520_o) * signed'("0000000000011111111111111101001011100011111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n14540_o <= std_logic_vector (resize (signed (n14508_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n14555_o <= std_logic_vector (resize (signed (n14523_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n14570_o <= std_logic_vector (unsigned (n14540_o) - unsigned (n14555_o));
  -- ../fixed_pkg.vhd:168:39
  n14581_o <= n14570_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14582_o <= n14570_o (43);
  -- ../fixed_pkg.vhd:185:23
  n14586_o <= n14570_o (42);
  -- ../fixed_pkg.vhd:185:27
  n14587_o <= '1' when n14586_o /= n14582_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14594_o <= '0' when n14587_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n14600_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14601_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14602_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14603_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14604_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14605_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14606_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14607_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14608_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14609_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14610_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14611_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14612_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14613_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14614_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14615_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14616_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14617_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14618_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14619_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14620_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14621_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14622_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14623_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14624_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14625_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14626_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14627_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14628_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14629_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14630_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14631_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14632_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14633_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14634_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14635_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14636_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14637_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14638_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14639_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14640_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14641_o <= not n14582_o;
  -- ../fixed_pkg.vhd:196:31
  n14642_o <= not n14582_o;
  -- ../fixed_pkg.vhd:9:14
  n14643_o <= n14600_o & n14601_o & n14602_o & n14603_o;
  -- ../fixed_pkg.vhd:24:14
  n14644_o <= n14604_o & n14605_o & n14606_o & n14607_o;
  -- ../fixed_pkg.vhd:24:14
  n14645_o <= n14608_o & n14609_o & n14610_o & n14611_o;
  -- ../fixed_pkg.vhd:185:17
  n14646_o <= n14612_o & n14613_o & n14614_o & n14615_o;
  -- ../fixed_pkg.vhd:24:14
  n14647_o <= n14616_o & n14617_o & n14618_o & n14619_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n14648_o <= n14620_o & n14621_o & n14622_o & n14623_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n14649_o <= n14624_o & n14625_o & n14626_o & n14627_o;
  -- ../fixed_pkg.vhd:185:17
  n14650_o <= n14628_o & n14629_o & n14630_o & n14631_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n14651_o <= n14632_o & n14633_o & n14634_o & n14635_o;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n14652_o <= n14636_o & n14637_o & n14638_o & n14639_o;
  -- ../BiquadFilter/BiquadFilter.vhd:53:18
  n14653_o <= n14640_o & n14641_o & n14642_o;
  n14654_o <= n14643_o & n14644_o & n14645_o & n14646_o;
  -- ../fixed_pkg.vhd:24:14
  n14655_o <= n14647_o & n14648_o & n14649_o & n14650_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n14656_o <= n14651_o & n14652_o & n14653_o;
  n14657_o <= n14654_o & n14655_o & n14656_o;
  n14658_o <= n14657_o (41 downto 0);
  n14659_o <= n14582_o & n14658_o;
  -- ../fixed_pkg.vhd:195:9
  n14660_o <= n14581_o when n14594_o = '0' else n14659_o;
  -- ../fixed_pkg.vhd:168:39
  n14678_o <= std_logic_vector (resize (signed (n14660_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n14693_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n14698_o <= n14697_o (15 downto 0);
  n14699_o <= n14693_o & n14698_o;
  -- ../fixed_pkg.vhd:257:67
  n14710_o <= std_logic_vector (unsigned (n14678_o) + unsigned (n14699_o));
  -- ../fixed_pkg.vhd:168:39
  n14721_o <= n14710_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14722_o <= n14710_o (43);
  -- ../fixed_pkg.vhd:185:23
  n14726_o <= n14710_o (42);
  -- ../fixed_pkg.vhd:185:27
  n14727_o <= '1' when n14726_o /= n14722_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14734_o <= '0' when n14727_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n14740_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14741_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14742_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14743_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14744_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14745_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14746_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14747_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14748_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14749_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14750_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14751_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14752_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14753_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14754_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14755_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14756_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14757_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14758_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14759_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14760_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14761_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14762_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14763_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14764_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14765_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14766_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14767_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14768_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14769_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14770_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14771_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14772_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14773_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14774_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14775_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14776_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14777_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14778_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14779_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14780_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14781_o <= not n14722_o;
  -- ../fixed_pkg.vhd:196:31
  n14782_o <= not n14722_o;
  n14783_o <= n14740_o & n14741_o & n14742_o & n14743_o;
  n14784_o <= n14744_o & n14745_o & n14746_o & n14747_o;
  n14785_o <= n14748_o & n14749_o & n14750_o & n14751_o;
  n14786_o <= n14752_o & n14753_o & n14754_o & n14755_o;
  n14787_o <= n14756_o & n14757_o & n14758_o & n14759_o;
  n14788_o <= n14760_o & n14761_o & n14762_o & n14763_o;
  n14789_o <= n14764_o & n14765_o & n14766_o & n14767_o;
  n14790_o <= n14768_o & n14769_o & n14770_o & n14771_o;
  n14791_o <= n14772_o & n14773_o & n14774_o & n14775_o;
  n14792_o <= n14776_o & n14777_o & n14778_o & n14779_o;
  n14793_o <= n14780_o & n14781_o & n14782_o;
  n14794_o <= n14783_o & n14784_o & n14785_o & n14786_o;
  n14795_o <= n14787_o & n14788_o & n14789_o & n14790_o;
  n14796_o <= n14791_o & n14792_o & n14793_o;
  n14797_o <= n14794_o & n14795_o & n14796_o;
  n14798_o <= n14797_o (41 downto 0);
  n14799_o <= n14722_o & n14798_o;
  -- ../fixed_pkg.vhd:195:9
  n14800_o <= n14721_o when n14734_o = '0' else n14799_o;
  -- ../fixed_pkg.vhd:168:39
  n14816_o <= n14800_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14817_o <= n14800_o (42);
  -- ../fixed_pkg.vhd:185:23
  n14821_o <= n14800_o (41);
  -- ../fixed_pkg.vhd:185:27
  n14822_o <= '1' when n14821_o /= n14817_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14829_o <= '0' when n14822_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n14833_o <= '1' when n14822_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n14835_o <= n14800_o (40);
  -- ../fixed_pkg.vhd:185:27
  n14836_o <= '1' when n14835_o /= n14817_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14838_o <= n14829_o when n14847_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n14844_o <= n14836_o and n14833_o;
  -- ../fixed_pkg.vhd:185:17
  n14847_o <= n14833_o and n14844_o;
  -- ../fixed_pkg.vhd:196:31
  n14849_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14850_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14851_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14852_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14853_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14854_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14855_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14856_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14857_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14858_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14859_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14860_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14861_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14862_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14863_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14864_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14865_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14866_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14867_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14868_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14869_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14870_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14871_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14872_o <= not n14817_o;
  -- ../fixed_pkg.vhd:196:31
  n14873_o <= not n14817_o;
  n14874_o <= n14849_o & n14850_o & n14851_o & n14852_o;
  n14875_o <= n14853_o & n14854_o & n14855_o & n14856_o;
  n14876_o <= n14857_o & n14858_o & n14859_o & n14860_o;
  n14877_o <= n14861_o & n14862_o & n14863_o & n14864_o;
  n14878_o <= n14865_o & n14866_o & n14867_o & n14868_o;
  n14879_o <= n14869_o & n14870_o & n14871_o & n14872_o;
  n14880_o <= n14874_o & n14875_o & n14876_o & n14877_o;
  n14881_o <= n14878_o & n14879_o & n14873_o;
  n14882_o <= n14880_o & n14881_o;
  n14883_o <= n14882_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n14884_o <= n14816_o (40 downto 16);
  n14885_o <= n14817_o & n14883_o;
  -- ../fixed_pkg.vhd:195:9
  n14886_o <= n14884_o when n14838_o = '0' else n14885_o;
  -- ../fixed_pkg.vhd:268:100
  n14901_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n14904_o <= std_logic_vector (resize (signed (n14901_o) * signed'("0000000000011111111111111111111011110000111"), 43));
  -- ../fixed_pkg.vhd:268:100
  n14916_o <= std_logic_vector (resize (signed (n14489_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n14919_o <= std_logic_vector (resize (signed (n14916_o) * signed'("0000000000000000000000000001110111100001110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n14936_o <= std_logic_vector (resize (signed (n14904_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n14951_o <= std_logic_vector (resize (signed (n14919_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n14966_o <= std_logic_vector (unsigned (n14936_o) - unsigned (n14951_o));
  -- ../fixed_pkg.vhd:168:39
  n14977_o <= n14966_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14978_o <= n14966_o (43);
  -- ../fixed_pkg.vhd:185:23
  n14982_o <= n14966_o (42);
  -- ../fixed_pkg.vhd:185:27
  n14983_o <= '1' when n14982_o /= n14978_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14990_o <= '0' when n14983_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n14996_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n14997_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n14998_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n14999_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15000_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15001_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15002_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15003_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15004_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15005_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15006_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15007_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15008_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15009_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15010_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15011_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15012_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15013_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15014_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15015_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15016_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15017_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15018_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15019_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15020_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15021_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15022_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15023_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15024_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15025_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15026_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15027_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15028_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15029_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15030_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15031_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15032_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15033_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15034_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15035_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15036_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15037_o <= not n14978_o;
  -- ../fixed_pkg.vhd:196:31
  n15038_o <= not n14978_o;
  n15039_o <= n14996_o & n14997_o & n14998_o & n14999_o;
  n15040_o <= n15000_o & n15001_o & n15002_o & n15003_o;
  n15041_o <= n15004_o & n15005_o & n15006_o & n15007_o;
  n15042_o <= n15008_o & n15009_o & n15010_o & n15011_o;
  n15043_o <= n15012_o & n15013_o & n15014_o & n15015_o;
  n15044_o <= n15016_o & n15017_o & n15018_o & n15019_o;
  n15045_o <= n15020_o & n15021_o & n15022_o & n15023_o;
  n15046_o <= n15024_o & n15025_o & n15026_o & n15027_o;
  n15047_o <= n15028_o & n15029_o & n15030_o & n15031_o;
  n15048_o <= n15032_o & n15033_o & n15034_o & n15035_o;
  n15049_o <= n15036_o & n15037_o & n15038_o;
  n15050_o <= n15039_o & n15040_o & n15041_o & n15042_o;
  n15051_o <= n15043_o & n15044_o & n15045_o & n15046_o;
  n15052_o <= n15047_o & n15048_o & n15049_o;
  n15053_o <= n15050_o & n15051_o & n15052_o;
  n15054_o <= n15053_o (41 downto 0);
  n15055_o <= n14978_o & n15054_o;
  -- ../fixed_pkg.vhd:195:9
  n15056_o <= n14977_o when n14990_o = '0' else n15055_o;
  -- ../fixed_pkg.vhd:168:39
  n15072_o <= n15056_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n15073_o <= n15056_o (42);
  -- ../fixed_pkg.vhd:185:23
  n15077_o <= n15056_o (41);
  -- ../fixed_pkg.vhd:185:27
  n15078_o <= '1' when n15077_o /= n15073_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n15085_o <= '0' when n15078_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n15089_o <= '1' when n15078_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n15091_o <= n15056_o (40);
  -- ../fixed_pkg.vhd:185:27
  n15092_o <= '1' when n15091_o /= n15073_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n15094_o <= n15085_o when n15103_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n15100_o <= n15092_o and n15089_o;
  -- ../fixed_pkg.vhd:185:17
  n15103_o <= n15089_o and n15100_o;
  -- ../fixed_pkg.vhd:196:31
  n15105_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15106_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15107_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15108_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15109_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15110_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15111_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15112_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15113_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15114_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15115_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15116_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15117_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15118_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15119_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15120_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15121_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15122_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15123_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15124_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15125_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15126_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15127_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15128_o <= not n15073_o;
  -- ../fixed_pkg.vhd:196:31
  n15129_o <= not n15073_o;
  n15130_o <= n15105_o & n15106_o & n15107_o & n15108_o;
  n15131_o <= n15109_o & n15110_o & n15111_o & n15112_o;
  n15132_o <= n15113_o & n15114_o & n15115_o & n15116_o;
  n15133_o <= n15117_o & n15118_o & n15119_o & n15120_o;
  n15134_o <= n15121_o & n15122_o & n15123_o & n15124_o;
  n15135_o <= n15125_o & n15126_o & n15127_o & n15128_o;
  n15136_o <= n15130_o & n15131_o & n15132_o & n15133_o;
  n15137_o <= n15134_o & n15135_o & n15129_o;
  n15138_o <= n15136_o & n15137_o;
  n15139_o <= n15138_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n15140_o <= n15072_o (40 downto 16);
  n15141_o <= n15073_o & n15139_o;
  -- ../fixed_pkg.vhd:195:9
  n15142_o <= n15140_o when n15094_o = '0' else n15141_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n15145_o <= '1' when state_reg = "01" else '0';
  n15146_o <= n15145_o & n14247_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n15146_o select n15147_o <=
    x_reg when "10",
    n14245_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n15146_o select n15148_o <=
    n14489_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n15146_o select n15149_o <=
    n14886_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n15146_o select n15150_o <=
    n15142_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n15165_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n15166_o <= x_reg when n15165_o = '0' else n15147_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n15167_q <= n15166_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n15168_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n15169_o <= y_reg when n15168_o = '0' else n15148_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n15170_q <= n15169_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n15171_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n15171_q <= n15149_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n15172_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n15172_q <= n15150_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n15191_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n15192_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n15196_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n15197_o <= '1' when n15196_o /= n15192_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n15204_o <= '0' when n15197_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n15208_o <= '1' when n15197_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n15210_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n15211_o <= '1' when n15210_o /= n15192_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n15213_o <= n15204_o when n15222_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n15219_o <= n15211_o and n15208_o;
  -- ../fixed_pkg.vhd:185:17
  n15222_o <= n15208_o and n15219_o;
  -- ../fixed_pkg.vhd:196:31
  n15224_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15225_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15226_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15227_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15228_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15229_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15230_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15231_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15232_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15233_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15234_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15235_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15236_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15237_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15238_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15239_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15240_o <= not n15192_o;
  -- ../fixed_pkg.vhd:196:31
  n15241_o <= not n15192_o;
  n15242_o <= n15224_o & n15225_o & n15226_o & n15227_o;
  n15243_o <= n15228_o & n15229_o & n15230_o & n15231_o;
  n15244_o <= n15232_o & n15233_o & n15234_o & n15235_o;
  n15245_o <= n15236_o & n15237_o & n15238_o & n15239_o;
  n15246_o <= n15240_o & n15241_o;
  n15247_o <= n15242_o & n15243_o & n15244_o & n15245_o;
  n15248_o <= n15247_o & n15246_o;
  n15249_o <= n15248_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n15250_o <= n15191_o (22 downto 5);
  n15251_o <= n15192_o & n15249_o;
  -- ../fixed_pkg.vhd:195:9
  n15252_o <= n15250_o when n15213_o = '0' else n15251_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_58287565aee2fcf069d75b2ada116df2a3195e1e is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_58287565aee2fcf069d75b2ada116df2a3195e1e;

architecture rtl of biquadfilter_58287565aee2fcf069d75b2ada116df2a3195e1e is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n13124_o : std_logic_vector (1 downto 0);
  signal n13126_o : std_logic;
  signal n13128_o : std_logic;
  signal n13130_o : std_logic_vector (1 downto 0);
  signal n13132_o : std_logic;
  signal n13133_o : std_logic_vector (2 downto 0);
  signal n13136_o : std_logic_vector (1 downto 0);
  signal n13141_q : std_logic_vector (1 downto 0);
  signal n13144_o : std_logic;
  signal n13145_o : std_logic;
  signal n13149_o : std_logic;
  signal n13150_o : std_logic;
  signal n13170_o : std_logic_vector (19 downto 0);
  constant n13174_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n13175_o : std_logic_vector (4 downto 0);
  signal n13176_o : std_logic_vector (24 downto 0);
  signal n13177_o : std_logic_vector (24 downto 0);
  signal n13179_o : std_logic;
  signal n13193_o : std_logic_vector (42 downto 0);
  signal n13196_o : std_logic_vector (42 downto 0);
  signal n13213_o : std_logic_vector (43 downto 0);
  signal n13228_o : std_logic_vector (27 downto 0);
  constant n13232_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n13233_o : std_logic_vector (15 downto 0);
  signal n13234_o : std_logic_vector (43 downto 0);
  signal n13245_o : std_logic_vector (43 downto 0);
  signal n13256_o : std_logic_vector (42 downto 0);
  signal n13257_o : std_logic;
  signal n13261_o : std_logic;
  signal n13262_o : std_logic;
  signal n13269_o : std_logic;
  signal n13275_o : std_logic;
  signal n13276_o : std_logic;
  signal n13277_o : std_logic;
  signal n13278_o : std_logic;
  signal n13279_o : std_logic;
  signal n13280_o : std_logic;
  signal n13281_o : std_logic;
  signal n13282_o : std_logic;
  signal n13283_o : std_logic;
  signal n13284_o : std_logic;
  signal n13285_o : std_logic;
  signal n13286_o : std_logic;
  signal n13287_o : std_logic;
  signal n13288_o : std_logic;
  signal n13289_o : std_logic;
  signal n13290_o : std_logic;
  signal n13291_o : std_logic;
  signal n13292_o : std_logic;
  signal n13293_o : std_logic;
  signal n13294_o : std_logic;
  signal n13295_o : std_logic;
  signal n13296_o : std_logic;
  signal n13297_o : std_logic;
  signal n13298_o : std_logic;
  signal n13299_o : std_logic;
  signal n13300_o : std_logic;
  signal n13301_o : std_logic;
  signal n13302_o : std_logic;
  signal n13303_o : std_logic;
  signal n13304_o : std_logic;
  signal n13305_o : std_logic;
  signal n13306_o : std_logic;
  signal n13307_o : std_logic;
  signal n13308_o : std_logic;
  signal n13309_o : std_logic;
  signal n13310_o : std_logic;
  signal n13311_o : std_logic;
  signal n13312_o : std_logic;
  signal n13313_o : std_logic;
  signal n13314_o : std_logic;
  signal n13315_o : std_logic;
  signal n13316_o : std_logic;
  signal n13317_o : std_logic;
  signal n13318_o : std_logic_vector (3 downto 0);
  signal n13319_o : std_logic_vector (3 downto 0);
  signal n13320_o : std_logic_vector (3 downto 0);
  signal n13321_o : std_logic_vector (3 downto 0);
  signal n13322_o : std_logic_vector (3 downto 0);
  signal n13323_o : std_logic_vector (3 downto 0);
  signal n13324_o : std_logic_vector (3 downto 0);
  signal n13325_o : std_logic_vector (3 downto 0);
  signal n13326_o : std_logic_vector (3 downto 0);
  signal n13327_o : std_logic_vector (3 downto 0);
  signal n13328_o : std_logic_vector (2 downto 0);
  signal n13329_o : std_logic_vector (15 downto 0);
  signal n13330_o : std_logic_vector (15 downto 0);
  signal n13331_o : std_logic_vector (10 downto 0);
  signal n13332_o : std_logic_vector (42 downto 0);
  signal n13333_o : std_logic_vector (41 downto 0);
  signal n13334_o : std_logic_vector (42 downto 0);
  signal n13335_o : std_logic_vector (42 downto 0);
  signal n13351_o : std_logic_vector (40 downto 0);
  signal n13352_o : std_logic;
  signal n13356_o : std_logic;
  signal n13357_o : std_logic;
  signal n13364_o : std_logic;
  signal n13368_o : std_logic;
  signal n13370_o : std_logic;
  signal n13371_o : std_logic;
  signal n13373_o : std_logic;
  signal n13379_o : std_logic;
  signal n13382_o : std_logic;
  signal n13384_o : std_logic;
  signal n13385_o : std_logic;
  signal n13386_o : std_logic;
  signal n13387_o : std_logic;
  signal n13388_o : std_logic;
  signal n13389_o : std_logic;
  signal n13390_o : std_logic;
  signal n13391_o : std_logic;
  signal n13392_o : std_logic;
  signal n13393_o : std_logic;
  signal n13394_o : std_logic;
  signal n13395_o : std_logic;
  signal n13396_o : std_logic;
  signal n13397_o : std_logic;
  signal n13398_o : std_logic;
  signal n13399_o : std_logic;
  signal n13400_o : std_logic;
  signal n13401_o : std_logic;
  signal n13402_o : std_logic;
  signal n13403_o : std_logic;
  signal n13404_o : std_logic;
  signal n13405_o : std_logic;
  signal n13406_o : std_logic;
  signal n13407_o : std_logic;
  signal n13408_o : std_logic;
  signal n13409_o : std_logic_vector (3 downto 0);
  signal n13410_o : std_logic_vector (3 downto 0);
  signal n13411_o : std_logic_vector (3 downto 0);
  signal n13412_o : std_logic_vector (3 downto 0);
  signal n13413_o : std_logic_vector (3 downto 0);
  signal n13414_o : std_logic_vector (3 downto 0);
  signal n13415_o : std_logic_vector (15 downto 0);
  signal n13416_o : std_logic_vector (8 downto 0);
  signal n13417_o : std_logic_vector (24 downto 0);
  signal n13418_o : std_logic_vector (23 downto 0);
  signal n13419_o : std_logic_vector (24 downto 0);
  signal n13420_o : std_logic_vector (24 downto 0);
  signal n13421_o : std_logic_vector (24 downto 0);
  signal n13437_o : std_logic_vector (42 downto 0);
  signal n13440_o : std_logic_vector (42 downto 0);
  signal n13452_o : std_logic_vector (42 downto 0);
  signal n13455_o : std_logic_vector (42 downto 0);
  signal n13472_o : std_logic_vector (43 downto 0);
  signal n13487_o : std_logic_vector (43 downto 0);
  signal n13502_o : std_logic_vector (43 downto 0);
  signal n13513_o : std_logic_vector (42 downto 0);
  signal n13514_o : std_logic;
  signal n13518_o : std_logic;
  signal n13519_o : std_logic;
  signal n13526_o : std_logic;
  signal n13532_o : std_logic;
  signal n13533_o : std_logic;
  signal n13534_o : std_logic;
  signal n13535_o : std_logic;
  signal n13536_o : std_logic;
  signal n13537_o : std_logic;
  signal n13538_o : std_logic;
  signal n13539_o : std_logic;
  signal n13540_o : std_logic;
  signal n13541_o : std_logic;
  signal n13542_o : std_logic;
  signal n13543_o : std_logic;
  signal n13544_o : std_logic;
  signal n13545_o : std_logic;
  signal n13546_o : std_logic;
  signal n13547_o : std_logic;
  signal n13548_o : std_logic;
  signal n13549_o : std_logic;
  signal n13550_o : std_logic;
  signal n13551_o : std_logic;
  signal n13552_o : std_logic;
  signal n13553_o : std_logic;
  signal n13554_o : std_logic;
  signal n13555_o : std_logic;
  signal n13556_o : std_logic;
  signal n13557_o : std_logic;
  signal n13558_o : std_logic;
  signal n13559_o : std_logic;
  signal n13560_o : std_logic;
  signal n13561_o : std_logic;
  signal n13562_o : std_logic;
  signal n13563_o : std_logic;
  signal n13564_o : std_logic;
  signal n13565_o : std_logic;
  signal n13566_o : std_logic;
  signal n13567_o : std_logic;
  signal n13568_o : std_logic;
  signal n13569_o : std_logic;
  signal n13570_o : std_logic;
  signal n13571_o : std_logic;
  signal n13572_o : std_logic;
  signal n13573_o : std_logic;
  signal n13574_o : std_logic;
  signal n13575_o : std_logic_vector (3 downto 0);
  signal n13576_o : std_logic_vector (3 downto 0);
  signal n13577_o : std_logic_vector (3 downto 0);
  signal n13578_o : std_logic_vector (3 downto 0);
  signal n13579_o : std_logic_vector (3 downto 0);
  signal n13580_o : std_logic_vector (3 downto 0);
  signal n13581_o : std_logic_vector (3 downto 0);
  signal n13582_o : std_logic_vector (3 downto 0);
  signal n13583_o : std_logic_vector (3 downto 0);
  signal n13584_o : std_logic_vector (3 downto 0);
  signal n13585_o : std_logic_vector (2 downto 0);
  signal n13586_o : std_logic_vector (15 downto 0);
  signal n13587_o : std_logic_vector (15 downto 0);
  signal n13588_o : std_logic_vector (10 downto 0);
  signal n13589_o : std_logic_vector (42 downto 0);
  signal n13590_o : std_logic_vector (41 downto 0);
  signal n13591_o : std_logic_vector (42 downto 0);
  signal n13592_o : std_logic_vector (42 downto 0);
  signal n13610_o : std_logic_vector (43 downto 0);
  signal n13625_o : std_logic_vector (27 downto 0);
  constant n13629_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n13630_o : std_logic_vector (15 downto 0);
  signal n13631_o : std_logic_vector (43 downto 0);
  signal n13642_o : std_logic_vector (43 downto 0);
  signal n13653_o : std_logic_vector (42 downto 0);
  signal n13654_o : std_logic;
  signal n13658_o : std_logic;
  signal n13659_o : std_logic;
  signal n13666_o : std_logic;
  signal n13672_o : std_logic;
  signal n13673_o : std_logic;
  signal n13674_o : std_logic;
  signal n13675_o : std_logic;
  signal n13676_o : std_logic;
  signal n13677_o : std_logic;
  signal n13678_o : std_logic;
  signal n13679_o : std_logic;
  signal n13680_o : std_logic;
  signal n13681_o : std_logic;
  signal n13682_o : std_logic;
  signal n13683_o : std_logic;
  signal n13684_o : std_logic;
  signal n13685_o : std_logic;
  signal n13686_o : std_logic;
  signal n13687_o : std_logic;
  signal n13688_o : std_logic;
  signal n13689_o : std_logic;
  signal n13690_o : std_logic;
  signal n13691_o : std_logic;
  signal n13692_o : std_logic;
  signal n13693_o : std_logic;
  signal n13694_o : std_logic;
  signal n13695_o : std_logic;
  signal n13696_o : std_logic;
  signal n13697_o : std_logic;
  signal n13698_o : std_logic;
  signal n13699_o : std_logic;
  signal n13700_o : std_logic;
  signal n13701_o : std_logic;
  signal n13702_o : std_logic;
  signal n13703_o : std_logic;
  signal n13704_o : std_logic;
  signal n13705_o : std_logic;
  signal n13706_o : std_logic;
  signal n13707_o : std_logic;
  signal n13708_o : std_logic;
  signal n13709_o : std_logic;
  signal n13710_o : std_logic;
  signal n13711_o : std_logic;
  signal n13712_o : std_logic;
  signal n13713_o : std_logic;
  signal n13714_o : std_logic;
  signal n13715_o : std_logic_vector (3 downto 0);
  signal n13716_o : std_logic_vector (3 downto 0);
  signal n13717_o : std_logic_vector (3 downto 0);
  signal n13718_o : std_logic_vector (3 downto 0);
  signal n13719_o : std_logic_vector (3 downto 0);
  signal n13720_o : std_logic_vector (3 downto 0);
  signal n13721_o : std_logic_vector (3 downto 0);
  signal n13722_o : std_logic_vector (3 downto 0);
  signal n13723_o : std_logic_vector (3 downto 0);
  signal n13724_o : std_logic_vector (3 downto 0);
  signal n13725_o : std_logic_vector (2 downto 0);
  signal n13726_o : std_logic_vector (15 downto 0);
  signal n13727_o : std_logic_vector (15 downto 0);
  signal n13728_o : std_logic_vector (10 downto 0);
  signal n13729_o : std_logic_vector (42 downto 0);
  signal n13730_o : std_logic_vector (41 downto 0);
  signal n13731_o : std_logic_vector (42 downto 0);
  signal n13732_o : std_logic_vector (42 downto 0);
  signal n13748_o : std_logic_vector (40 downto 0);
  signal n13749_o : std_logic;
  signal n13753_o : std_logic;
  signal n13754_o : std_logic;
  signal n13761_o : std_logic;
  signal n13765_o : std_logic;
  signal n13767_o : std_logic;
  signal n13768_o : std_logic;
  signal n13770_o : std_logic;
  signal n13776_o : std_logic;
  signal n13779_o : std_logic;
  signal n13781_o : std_logic;
  signal n13782_o : std_logic;
  signal n13783_o : std_logic;
  signal n13784_o : std_logic;
  signal n13785_o : std_logic;
  signal n13786_o : std_logic;
  signal n13787_o : std_logic;
  signal n13788_o : std_logic;
  signal n13789_o : std_logic;
  signal n13790_o : std_logic;
  signal n13791_o : std_logic;
  signal n13792_o : std_logic;
  signal n13793_o : std_logic;
  signal n13794_o : std_logic;
  signal n13795_o : std_logic;
  signal n13796_o : std_logic;
  signal n13797_o : std_logic;
  signal n13798_o : std_logic;
  signal n13799_o : std_logic;
  signal n13800_o : std_logic;
  signal n13801_o : std_logic;
  signal n13802_o : std_logic;
  signal n13803_o : std_logic;
  signal n13804_o : std_logic;
  signal n13805_o : std_logic;
  signal n13806_o : std_logic_vector (3 downto 0);
  signal n13807_o : std_logic_vector (3 downto 0);
  signal n13808_o : std_logic_vector (3 downto 0);
  signal n13809_o : std_logic_vector (3 downto 0);
  signal n13810_o : std_logic_vector (3 downto 0);
  signal n13811_o : std_logic_vector (3 downto 0);
  signal n13812_o : std_logic_vector (15 downto 0);
  signal n13813_o : std_logic_vector (8 downto 0);
  signal n13814_o : std_logic_vector (24 downto 0);
  signal n13815_o : std_logic_vector (23 downto 0);
  signal n13816_o : std_logic_vector (24 downto 0);
  signal n13817_o : std_logic_vector (24 downto 0);
  signal n13818_o : std_logic_vector (24 downto 0);
  signal n13833_o : std_logic_vector (42 downto 0);
  signal n13836_o : std_logic_vector (42 downto 0);
  signal n13848_o : std_logic_vector (42 downto 0);
  signal n13851_o : std_logic_vector (42 downto 0);
  signal n13868_o : std_logic_vector (43 downto 0);
  signal n13883_o : std_logic_vector (43 downto 0);
  signal n13898_o : std_logic_vector (43 downto 0);
  signal n13909_o : std_logic_vector (42 downto 0);
  signal n13910_o : std_logic;
  signal n13914_o : std_logic;
  signal n13915_o : std_logic;
  signal n13922_o : std_logic;
  signal n13928_o : std_logic;
  signal n13929_o : std_logic;
  signal n13930_o : std_logic;
  signal n13931_o : std_logic;
  signal n13932_o : std_logic;
  signal n13933_o : std_logic;
  signal n13934_o : std_logic;
  signal n13935_o : std_logic;
  signal n13936_o : std_logic;
  signal n13937_o : std_logic;
  signal n13938_o : std_logic;
  signal n13939_o : std_logic;
  signal n13940_o : std_logic;
  signal n13941_o : std_logic;
  signal n13942_o : std_logic;
  signal n13943_o : std_logic;
  signal n13944_o : std_logic;
  signal n13945_o : std_logic;
  signal n13946_o : std_logic;
  signal n13947_o : std_logic;
  signal n13948_o : std_logic;
  signal n13949_o : std_logic;
  signal n13950_o : std_logic;
  signal n13951_o : std_logic;
  signal n13952_o : std_logic;
  signal n13953_o : std_logic;
  signal n13954_o : std_logic;
  signal n13955_o : std_logic;
  signal n13956_o : std_logic;
  signal n13957_o : std_logic;
  signal n13958_o : std_logic;
  signal n13959_o : std_logic;
  signal n13960_o : std_logic;
  signal n13961_o : std_logic;
  signal n13962_o : std_logic;
  signal n13963_o : std_logic;
  signal n13964_o : std_logic;
  signal n13965_o : std_logic;
  signal n13966_o : std_logic;
  signal n13967_o : std_logic;
  signal n13968_o : std_logic;
  signal n13969_o : std_logic;
  signal n13970_o : std_logic;
  signal n13971_o : std_logic_vector (3 downto 0);
  signal n13972_o : std_logic_vector (3 downto 0);
  signal n13973_o : std_logic_vector (3 downto 0);
  signal n13974_o : std_logic_vector (3 downto 0);
  signal n13975_o : std_logic_vector (3 downto 0);
  signal n13976_o : std_logic_vector (3 downto 0);
  signal n13977_o : std_logic_vector (3 downto 0);
  signal n13978_o : std_logic_vector (3 downto 0);
  signal n13979_o : std_logic_vector (3 downto 0);
  signal n13980_o : std_logic_vector (3 downto 0);
  signal n13981_o : std_logic_vector (2 downto 0);
  signal n13982_o : std_logic_vector (15 downto 0);
  signal n13983_o : std_logic_vector (15 downto 0);
  signal n13984_o : std_logic_vector (10 downto 0);
  signal n13985_o : std_logic_vector (42 downto 0);
  signal n13986_o : std_logic_vector (41 downto 0);
  signal n13987_o : std_logic_vector (42 downto 0);
  signal n13988_o : std_logic_vector (42 downto 0);
  signal n14004_o : std_logic_vector (40 downto 0);
  signal n14005_o : std_logic;
  signal n14009_o : std_logic;
  signal n14010_o : std_logic;
  signal n14017_o : std_logic;
  signal n14021_o : std_logic;
  signal n14023_o : std_logic;
  signal n14024_o : std_logic;
  signal n14026_o : std_logic;
  signal n14032_o : std_logic;
  signal n14035_o : std_logic;
  signal n14037_o : std_logic;
  signal n14038_o : std_logic;
  signal n14039_o : std_logic;
  signal n14040_o : std_logic;
  signal n14041_o : std_logic;
  signal n14042_o : std_logic;
  signal n14043_o : std_logic;
  signal n14044_o : std_logic;
  signal n14045_o : std_logic;
  signal n14046_o : std_logic;
  signal n14047_o : std_logic;
  signal n14048_o : std_logic;
  signal n14049_o : std_logic;
  signal n14050_o : std_logic;
  signal n14051_o : std_logic;
  signal n14052_o : std_logic;
  signal n14053_o : std_logic;
  signal n14054_o : std_logic;
  signal n14055_o : std_logic;
  signal n14056_o : std_logic;
  signal n14057_o : std_logic;
  signal n14058_o : std_logic;
  signal n14059_o : std_logic;
  signal n14060_o : std_logic;
  signal n14061_o : std_logic;
  signal n14062_o : std_logic_vector (3 downto 0);
  signal n14063_o : std_logic_vector (3 downto 0);
  signal n14064_o : std_logic_vector (3 downto 0);
  signal n14065_o : std_logic_vector (3 downto 0);
  signal n14066_o : std_logic_vector (3 downto 0);
  signal n14067_o : std_logic_vector (3 downto 0);
  signal n14068_o : std_logic_vector (15 downto 0);
  signal n14069_o : std_logic_vector (8 downto 0);
  signal n14070_o : std_logic_vector (24 downto 0);
  signal n14071_o : std_logic_vector (23 downto 0);
  signal n14072_o : std_logic_vector (24 downto 0);
  signal n14073_o : std_logic_vector (24 downto 0);
  signal n14074_o : std_logic_vector (24 downto 0);
  signal n14077_o : std_logic;
  signal n14078_o : std_logic_vector (1 downto 0);
  signal n14079_o : std_logic_vector (24 downto 0);
  signal n14080_o : std_logic_vector (24 downto 0);
  signal n14081_o : std_logic_vector (24 downto 0);
  signal n14082_o : std_logic_vector (24 downto 0);
  signal n14097_o : std_logic;
  signal n14098_o : std_logic_vector (24 downto 0);
  signal n14099_q : std_logic_vector (24 downto 0);
  signal n14100_o : std_logic;
  signal n14101_o : std_logic_vector (24 downto 0);
  signal n14102_q : std_logic_vector (24 downto 0);
  signal n14103_q : std_logic_vector (24 downto 0);
  signal n14104_q : std_logic_vector (24 downto 0);
  signal n14123_o : std_logic_vector (22 downto 0);
  signal n14124_o : std_logic;
  signal n14128_o : std_logic;
  signal n14129_o : std_logic;
  signal n14136_o : std_logic;
  signal n14140_o : std_logic;
  signal n14142_o : std_logic;
  signal n14143_o : std_logic;
  signal n14145_o : std_logic;
  signal n14151_o : std_logic;
  signal n14154_o : std_logic;
  signal n14156_o : std_logic;
  signal n14157_o : std_logic;
  signal n14158_o : std_logic;
  signal n14159_o : std_logic;
  signal n14160_o : std_logic;
  signal n14161_o : std_logic;
  signal n14162_o : std_logic;
  signal n14163_o : std_logic;
  signal n14164_o : std_logic;
  signal n14165_o : std_logic;
  signal n14166_o : std_logic;
  signal n14167_o : std_logic;
  signal n14168_o : std_logic;
  signal n14169_o : std_logic;
  signal n14170_o : std_logic;
  signal n14171_o : std_logic;
  signal n14172_o : std_logic;
  signal n14173_o : std_logic;
  signal n14174_o : std_logic_vector (3 downto 0);
  signal n14175_o : std_logic_vector (3 downto 0);
  signal n14176_o : std_logic_vector (3 downto 0);
  signal n14177_o : std_logic_vector (3 downto 0);
  signal n14178_o : std_logic_vector (1 downto 0);
  signal n14179_o : std_logic_vector (15 downto 0);
  signal n14180_o : std_logic_vector (17 downto 0);
  signal n14181_o : std_logic_vector (16 downto 0);
  signal n14182_o : std_logic_vector (17 downto 0);
  signal n14183_o : std_logic_vector (17 downto 0);
  signal n14184_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n13145_o;
  valid_o <= n13150_o;
  data_o <= n14184_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n13141_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n14099_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n14102_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n14103_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n14104_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n13124_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n13126_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n13128_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n13130_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n13132_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:170:18
  n13133_o <= n13132_o & n13128_o & n13126_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n13133_o select n13136_o <=
    n13130_o when "100",
    "10" when "010",
    n13124_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n13141_q <= "00";
    elsif rising_edge (clk_i) then
      n13141_q <= n13136_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n13144_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n13145_o <= '0' when n13144_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n13149_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n13150_o <= '0' when n13149_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n13170_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n13175_o <= n13174_o (4 downto 0);
  n13176_o <= n13170_o & n13175_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n13177_o <= x_reg when valid_i = '0' else n13176_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n13179_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n13193_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n13196_o <= std_logic_vector (resize (signed (n13193_o) * signed'("0000000000000000000000000000000011111101000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n13213_o <= std_logic_vector (resize (signed (n13196_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n13228_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n13233_o <= n13232_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n13234_o <= n13228_o & n13233_o;
  -- ../fixed_pkg.vhd:257:67
  n13245_o <= std_logic_vector (unsigned (n13213_o) + unsigned (n13234_o));
  -- ../fixed_pkg.vhd:168:39
  n13256_o <= n13245_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13257_o <= n13245_o (43);
  -- ../fixed_pkg.vhd:185:23
  n13261_o <= n13245_o (42);
  -- ../fixed_pkg.vhd:185:27
  n13262_o <= '1' when n13261_o /= n13257_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n13269_o <= '0' when n13262_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n13275_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13276_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13277_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13278_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13279_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13280_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13281_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13282_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13283_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13284_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13285_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13286_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13287_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13288_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13289_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13290_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13291_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13292_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13293_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13294_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13295_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13296_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13297_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13298_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13299_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13300_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13301_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13302_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13303_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13304_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13305_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13306_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13307_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13308_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13309_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13310_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13311_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13312_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13313_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13314_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13315_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13316_o <= not n13257_o;
  -- ../fixed_pkg.vhd:196:31
  n13317_o <= not n13257_o;
  -- ../fixed_pkg.vhd:184:13
  n13318_o <= n13275_o & n13276_o & n13277_o & n13278_o;
  -- ../fixed_pkg.vhd:171:18
  n13319_o <= n13279_o & n13280_o & n13281_o & n13282_o;
  n13320_o <= n13283_o & n13284_o & n13285_o & n13286_o;
  -- ../fixed_pkg.vhd:170:18
  n13321_o <= n13287_o & n13288_o & n13289_o & n13290_o;
  n13322_o <= n13291_o & n13292_o & n13293_o & n13294_o;
  -- ../fixed_pkg.vhd:9:14
  n13323_o <= n13295_o & n13296_o & n13297_o & n13298_o;
  -- ../fixed_pkg.vhd:9:14
  n13324_o <= n13299_o & n13300_o & n13301_o & n13302_o;
  n13325_o <= n13303_o & n13304_o & n13305_o & n13306_o;
  -- ../fixed_pkg.vhd:9:14
  n13326_o <= n13307_o & n13308_o & n13309_o & n13310_o;
  -- ../fixed_pkg.vhd:24:14
  n13327_o <= n13311_o & n13312_o & n13313_o & n13314_o;
  -- ../fixed_pkg.vhd:24:14
  n13328_o <= n13315_o & n13316_o & n13317_o;
  n13329_o <= n13318_o & n13319_o & n13320_o & n13321_o;
  -- ../fixed_pkg.vhd:24:14
  n13330_o <= n13322_o & n13323_o & n13324_o & n13325_o;
  -- ../fixed_pkg.vhd:9:14
  n13331_o <= n13326_o & n13327_o & n13328_o;
  -- ../fixed_pkg.vhd:9:14
  n13332_o <= n13329_o & n13330_o & n13331_o;
  n13333_o <= n13332_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n13334_o <= n13257_o & n13333_o;
  -- ../fixed_pkg.vhd:195:9
  n13335_o <= n13256_o when n13269_o = '0' else n13334_o;
  -- ../fixed_pkg.vhd:168:39
  n13351_o <= n13335_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13352_o <= n13335_o (42);
  -- ../fixed_pkg.vhd:185:23
  n13356_o <= n13335_o (41);
  -- ../fixed_pkg.vhd:185:27
  n13357_o <= '1' when n13356_o /= n13352_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n13364_o <= '0' when n13357_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n13368_o <= '1' when n13357_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n13370_o <= n13335_o (40);
  -- ../fixed_pkg.vhd:185:27
  n13371_o <= '1' when n13370_o /= n13352_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n13373_o <= n13364_o when n13382_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n13379_o <= n13371_o and n13368_o;
  -- ../fixed_pkg.vhd:185:17
  n13382_o <= n13368_o and n13379_o;
  -- ../fixed_pkg.vhd:196:31
  n13384_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13385_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13386_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13387_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13388_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13389_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13390_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13391_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13392_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13393_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13394_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13395_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13396_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13397_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13398_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13399_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13400_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13401_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13402_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13403_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13404_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13405_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13406_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13407_o <= not n13352_o;
  -- ../fixed_pkg.vhd:196:31
  n13408_o <= not n13352_o;
  -- ../fixed_pkg.vhd:9:14
  n13409_o <= n13384_o & n13385_o & n13386_o & n13387_o;
  -- ../fixed_pkg.vhd:9:14
  n13410_o <= n13388_o & n13389_o & n13390_o & n13391_o;
  -- ../fixed_pkg.vhd:24:14
  n13411_o <= n13392_o & n13393_o & n13394_o & n13395_o;
  -- ../fixed_pkg.vhd:24:14
  n13412_o <= n13396_o & n13397_o & n13398_o & n13399_o;
  -- ../fixed_pkg.vhd:171:18
  n13413_o <= n13400_o & n13401_o & n13402_o & n13403_o;
  -- ../fixed_pkg.vhd:24:14
  n13414_o <= n13404_o & n13405_o & n13406_o & n13407_o;
  -- ../fixed_pkg.vhd:9:14
  n13415_o <= n13409_o & n13410_o & n13411_o & n13412_o;
  -- ../fixed_pkg.vhd:171:18
  n13416_o <= n13413_o & n13414_o & n13408_o;
  -- ../fixed_pkg.vhd:185:17
  n13417_o <= n13415_o & n13416_o;
  -- ../fixed_pkg.vhd:170:18
  n13418_o <= n13417_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n13419_o <= n13351_o (40 downto 16);
  -- ../fixed_pkg.vhd:169:40
  n13420_o <= n13352_o & n13418_o;
  -- ../fixed_pkg.vhd:195:9
  n13421_o <= n13419_o when n13373_o = '0' else n13420_o;
  -- ../fixed_pkg.vhd:268:100
  n13437_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n13440_o <= std_logic_vector (resize (signed (n13437_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n13452_o <= std_logic_vector (resize (signed (n13421_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n13455_o <= std_logic_vector (resize (signed (n13452_o) * signed'("0000000000011111111111111101000000110101111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n13472_o <= std_logic_vector (resize (signed (n13440_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n13487_o <= std_logic_vector (resize (signed (n13455_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n13502_o <= std_logic_vector (unsigned (n13472_o) - unsigned (n13487_o));
  -- ../fixed_pkg.vhd:168:39
  n13513_o <= n13502_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13514_o <= n13502_o (43);
  -- ../fixed_pkg.vhd:185:23
  n13518_o <= n13502_o (42);
  -- ../fixed_pkg.vhd:185:27
  n13519_o <= '1' when n13518_o /= n13514_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n13526_o <= '0' when n13519_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n13532_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13533_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13534_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13535_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13536_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13537_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13538_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13539_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13540_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13541_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13542_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13543_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13544_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13545_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13546_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13547_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13548_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13549_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13550_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13551_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13552_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13553_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13554_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13555_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13556_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13557_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13558_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13559_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13560_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13561_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13562_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13563_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13564_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13565_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13566_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13567_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13568_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13569_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13570_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13571_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13572_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13573_o <= not n13514_o;
  -- ../fixed_pkg.vhd:196:31
  n13574_o <= not n13514_o;
  -- ../fixed_pkg.vhd:9:14
  n13575_o <= n13532_o & n13533_o & n13534_o & n13535_o;
  -- ../fixed_pkg.vhd:24:14
  n13576_o <= n13536_o & n13537_o & n13538_o & n13539_o;
  -- ../fixed_pkg.vhd:24:14
  n13577_o <= n13540_o & n13541_o & n13542_o & n13543_o;
  -- ../fixed_pkg.vhd:185:17
  n13578_o <= n13544_o & n13545_o & n13546_o & n13547_o;
  -- ../fixed_pkg.vhd:24:14
  n13579_o <= n13548_o & n13549_o & n13550_o & n13551_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n13580_o <= n13552_o & n13553_o & n13554_o & n13555_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n13581_o <= n13556_o & n13557_o & n13558_o & n13559_o;
  -- ../fixed_pkg.vhd:185:17
  n13582_o <= n13560_o & n13561_o & n13562_o & n13563_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n13583_o <= n13564_o & n13565_o & n13566_o & n13567_o;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n13584_o <= n13568_o & n13569_o & n13570_o & n13571_o;
  -- ../BiquadFilter/BiquadFilter.vhd:53:18
  n13585_o <= n13572_o & n13573_o & n13574_o;
  n13586_o <= n13575_o & n13576_o & n13577_o & n13578_o;
  -- ../fixed_pkg.vhd:24:14
  n13587_o <= n13579_o & n13580_o & n13581_o & n13582_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n13588_o <= n13583_o & n13584_o & n13585_o;
  n13589_o <= n13586_o & n13587_o & n13588_o;
  n13590_o <= n13589_o (41 downto 0);
  n13591_o <= n13514_o & n13590_o;
  -- ../fixed_pkg.vhd:195:9
  n13592_o <= n13513_o when n13526_o = '0' else n13591_o;
  -- ../fixed_pkg.vhd:168:39
  n13610_o <= std_logic_vector (resize (signed (n13592_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n13625_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n13630_o <= n13629_o (15 downto 0);
  n13631_o <= n13625_o & n13630_o;
  -- ../fixed_pkg.vhd:257:67
  n13642_o <= std_logic_vector (unsigned (n13610_o) + unsigned (n13631_o));
  -- ../fixed_pkg.vhd:168:39
  n13653_o <= n13642_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13654_o <= n13642_o (43);
  -- ../fixed_pkg.vhd:185:23
  n13658_o <= n13642_o (42);
  -- ../fixed_pkg.vhd:185:27
  n13659_o <= '1' when n13658_o /= n13654_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n13666_o <= '0' when n13659_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n13672_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13673_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13674_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13675_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13676_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13677_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13678_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13679_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13680_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13681_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13682_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13683_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13684_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13685_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13686_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13687_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13688_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13689_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13690_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13691_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13692_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13693_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13694_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13695_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13696_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13697_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13698_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13699_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13700_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13701_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13702_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13703_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13704_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13705_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13706_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13707_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13708_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13709_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13710_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13711_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13712_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13713_o <= not n13654_o;
  -- ../fixed_pkg.vhd:196:31
  n13714_o <= not n13654_o;
  n13715_o <= n13672_o & n13673_o & n13674_o & n13675_o;
  n13716_o <= n13676_o & n13677_o & n13678_o & n13679_o;
  n13717_o <= n13680_o & n13681_o & n13682_o & n13683_o;
  n13718_o <= n13684_o & n13685_o & n13686_o & n13687_o;
  n13719_o <= n13688_o & n13689_o & n13690_o & n13691_o;
  n13720_o <= n13692_o & n13693_o & n13694_o & n13695_o;
  n13721_o <= n13696_o & n13697_o & n13698_o & n13699_o;
  n13722_o <= n13700_o & n13701_o & n13702_o & n13703_o;
  n13723_o <= n13704_o & n13705_o & n13706_o & n13707_o;
  n13724_o <= n13708_o & n13709_o & n13710_o & n13711_o;
  n13725_o <= n13712_o & n13713_o & n13714_o;
  n13726_o <= n13715_o & n13716_o & n13717_o & n13718_o;
  n13727_o <= n13719_o & n13720_o & n13721_o & n13722_o;
  n13728_o <= n13723_o & n13724_o & n13725_o;
  n13729_o <= n13726_o & n13727_o & n13728_o;
  n13730_o <= n13729_o (41 downto 0);
  n13731_o <= n13654_o & n13730_o;
  -- ../fixed_pkg.vhd:195:9
  n13732_o <= n13653_o when n13666_o = '0' else n13731_o;
  -- ../fixed_pkg.vhd:168:39
  n13748_o <= n13732_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13749_o <= n13732_o (42);
  -- ../fixed_pkg.vhd:185:23
  n13753_o <= n13732_o (41);
  -- ../fixed_pkg.vhd:185:27
  n13754_o <= '1' when n13753_o /= n13749_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n13761_o <= '0' when n13754_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n13765_o <= '1' when n13754_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n13767_o <= n13732_o (40);
  -- ../fixed_pkg.vhd:185:27
  n13768_o <= '1' when n13767_o /= n13749_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n13770_o <= n13761_o when n13779_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n13776_o <= n13768_o and n13765_o;
  -- ../fixed_pkg.vhd:185:17
  n13779_o <= n13765_o and n13776_o;
  -- ../fixed_pkg.vhd:196:31
  n13781_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13782_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13783_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13784_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13785_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13786_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13787_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13788_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13789_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13790_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13791_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13792_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13793_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13794_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13795_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13796_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13797_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13798_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13799_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13800_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13801_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13802_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13803_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13804_o <= not n13749_o;
  -- ../fixed_pkg.vhd:196:31
  n13805_o <= not n13749_o;
  n13806_o <= n13781_o & n13782_o & n13783_o & n13784_o;
  n13807_o <= n13785_o & n13786_o & n13787_o & n13788_o;
  n13808_o <= n13789_o & n13790_o & n13791_o & n13792_o;
  n13809_o <= n13793_o & n13794_o & n13795_o & n13796_o;
  n13810_o <= n13797_o & n13798_o & n13799_o & n13800_o;
  n13811_o <= n13801_o & n13802_o & n13803_o & n13804_o;
  n13812_o <= n13806_o & n13807_o & n13808_o & n13809_o;
  n13813_o <= n13810_o & n13811_o & n13805_o;
  n13814_o <= n13812_o & n13813_o;
  n13815_o <= n13814_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n13816_o <= n13748_o (40 downto 16);
  n13817_o <= n13749_o & n13815_o;
  -- ../fixed_pkg.vhd:195:9
  n13818_o <= n13816_o when n13770_o = '0' else n13817_o;
  -- ../fixed_pkg.vhd:268:100
  n13833_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n13836_o <= std_logic_vector (resize (signed (n13833_o) * signed'("0000000000011111111111111111111100000011000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n13848_o <= std_logic_vector (resize (signed (n13421_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n13851_o <= std_logic_vector (resize (signed (n13848_o) * signed'("0000000000000000000000000001111000000110000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n13868_o <= std_logic_vector (resize (signed (n13836_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n13883_o <= std_logic_vector (resize (signed (n13851_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n13898_o <= std_logic_vector (unsigned (n13868_o) - unsigned (n13883_o));
  -- ../fixed_pkg.vhd:168:39
  n13909_o <= n13898_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13910_o <= n13898_o (43);
  -- ../fixed_pkg.vhd:185:23
  n13914_o <= n13898_o (42);
  -- ../fixed_pkg.vhd:185:27
  n13915_o <= '1' when n13914_o /= n13910_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n13922_o <= '0' when n13915_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n13928_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13929_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13930_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13931_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13932_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13933_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13934_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13935_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13936_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13937_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13938_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13939_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13940_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13941_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13942_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13943_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13944_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13945_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13946_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13947_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13948_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13949_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13950_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13951_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13952_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13953_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13954_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13955_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13956_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13957_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13958_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13959_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13960_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13961_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13962_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13963_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13964_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13965_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13966_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13967_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13968_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13969_o <= not n13910_o;
  -- ../fixed_pkg.vhd:196:31
  n13970_o <= not n13910_o;
  n13971_o <= n13928_o & n13929_o & n13930_o & n13931_o;
  n13972_o <= n13932_o & n13933_o & n13934_o & n13935_o;
  n13973_o <= n13936_o & n13937_o & n13938_o & n13939_o;
  n13974_o <= n13940_o & n13941_o & n13942_o & n13943_o;
  n13975_o <= n13944_o & n13945_o & n13946_o & n13947_o;
  n13976_o <= n13948_o & n13949_o & n13950_o & n13951_o;
  n13977_o <= n13952_o & n13953_o & n13954_o & n13955_o;
  n13978_o <= n13956_o & n13957_o & n13958_o & n13959_o;
  n13979_o <= n13960_o & n13961_o & n13962_o & n13963_o;
  n13980_o <= n13964_o & n13965_o & n13966_o & n13967_o;
  n13981_o <= n13968_o & n13969_o & n13970_o;
  n13982_o <= n13971_o & n13972_o & n13973_o & n13974_o;
  n13983_o <= n13975_o & n13976_o & n13977_o & n13978_o;
  n13984_o <= n13979_o & n13980_o & n13981_o;
  n13985_o <= n13982_o & n13983_o & n13984_o;
  n13986_o <= n13985_o (41 downto 0);
  n13987_o <= n13910_o & n13986_o;
  -- ../fixed_pkg.vhd:195:9
  n13988_o <= n13909_o when n13922_o = '0' else n13987_o;
  -- ../fixed_pkg.vhd:168:39
  n14004_o <= n13988_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14005_o <= n13988_o (42);
  -- ../fixed_pkg.vhd:185:23
  n14009_o <= n13988_o (41);
  -- ../fixed_pkg.vhd:185:27
  n14010_o <= '1' when n14009_o /= n14005_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14017_o <= '0' when n14010_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n14021_o <= '1' when n14010_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n14023_o <= n13988_o (40);
  -- ../fixed_pkg.vhd:185:27
  n14024_o <= '1' when n14023_o /= n14005_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14026_o <= n14017_o when n14035_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n14032_o <= n14024_o and n14021_o;
  -- ../fixed_pkg.vhd:185:17
  n14035_o <= n14021_o and n14032_o;
  -- ../fixed_pkg.vhd:196:31
  n14037_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14038_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14039_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14040_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14041_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14042_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14043_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14044_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14045_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14046_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14047_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14048_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14049_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14050_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14051_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14052_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14053_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14054_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14055_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14056_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14057_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14058_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14059_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14060_o <= not n14005_o;
  -- ../fixed_pkg.vhd:196:31
  n14061_o <= not n14005_o;
  n14062_o <= n14037_o & n14038_o & n14039_o & n14040_o;
  n14063_o <= n14041_o & n14042_o & n14043_o & n14044_o;
  n14064_o <= n14045_o & n14046_o & n14047_o & n14048_o;
  n14065_o <= n14049_o & n14050_o & n14051_o & n14052_o;
  n14066_o <= n14053_o & n14054_o & n14055_o & n14056_o;
  n14067_o <= n14057_o & n14058_o & n14059_o & n14060_o;
  n14068_o <= n14062_o & n14063_o & n14064_o & n14065_o;
  n14069_o <= n14066_o & n14067_o & n14061_o;
  n14070_o <= n14068_o & n14069_o;
  n14071_o <= n14070_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n14072_o <= n14004_o (40 downto 16);
  n14073_o <= n14005_o & n14071_o;
  -- ../fixed_pkg.vhd:195:9
  n14074_o <= n14072_o when n14026_o = '0' else n14073_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n14077_o <= '1' when state_reg = "01" else '0';
  n14078_o <= n14077_o & n13179_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n14078_o select n14079_o <=
    x_reg when "10",
    n13177_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n14078_o select n14080_o <=
    n13421_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n14078_o select n14081_o <=
    n13818_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n14078_o select n14082_o <=
    n14074_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n14097_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n14098_o <= x_reg when n14097_o = '0' else n14079_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n14099_q <= n14098_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n14100_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n14101_o <= y_reg when n14100_o = '0' else n14080_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n14102_q <= n14101_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n14103_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n14103_q <= n14081_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n14104_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n14104_q <= n14082_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n14123_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14124_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n14128_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n14129_o <= '1' when n14128_o /= n14124_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14136_o <= '0' when n14129_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n14140_o <= '1' when n14129_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n14142_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n14143_o <= '1' when n14142_o /= n14124_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n14145_o <= n14136_o when n14154_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n14151_o <= n14143_o and n14140_o;
  -- ../fixed_pkg.vhd:185:17
  n14154_o <= n14140_o and n14151_o;
  -- ../fixed_pkg.vhd:196:31
  n14156_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14157_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14158_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14159_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14160_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14161_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14162_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14163_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14164_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14165_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14166_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14167_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14168_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14169_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14170_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14171_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14172_o <= not n14124_o;
  -- ../fixed_pkg.vhd:196:31
  n14173_o <= not n14124_o;
  n14174_o <= n14156_o & n14157_o & n14158_o & n14159_o;
  n14175_o <= n14160_o & n14161_o & n14162_o & n14163_o;
  n14176_o <= n14164_o & n14165_o & n14166_o & n14167_o;
  n14177_o <= n14168_o & n14169_o & n14170_o & n14171_o;
  n14178_o <= n14172_o & n14173_o;
  n14179_o <= n14174_o & n14175_o & n14176_o & n14177_o;
  n14180_o <= n14179_o & n14178_o;
  n14181_o <= n14180_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n14182_o <= n14123_o (22 downto 5);
  n14183_o <= n14124_o & n14181_o;
  -- ../fixed_pkg.vhd:195:9
  n14184_o <= n14182_o when n14145_o = '0' else n14183_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_7ee7919464c974e1ea4a8e43f5092f05f8be8f05 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_7ee7919464c974e1ea4a8e43f5092f05f8be8f05;

architecture rtl of biquadfilter_7ee7919464c974e1ea4a8e43f5092f05f8be8f05 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n12056_o : std_logic_vector (1 downto 0);
  signal n12058_o : std_logic;
  signal n12060_o : std_logic;
  signal n12062_o : std_logic_vector (1 downto 0);
  signal n12064_o : std_logic;
  signal n12065_o : std_logic_vector (2 downto 0);
  signal n12068_o : std_logic_vector (1 downto 0);
  signal n12073_q : std_logic_vector (1 downto 0);
  signal n12076_o : std_logic;
  signal n12077_o : std_logic;
  signal n12081_o : std_logic;
  signal n12082_o : std_logic;
  signal n12102_o : std_logic_vector (19 downto 0);
  constant n12106_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n12107_o : std_logic_vector (4 downto 0);
  signal n12108_o : std_logic_vector (24 downto 0);
  signal n12109_o : std_logic_vector (24 downto 0);
  signal n12111_o : std_logic;
  signal n12125_o : std_logic_vector (42 downto 0);
  signal n12128_o : std_logic_vector (42 downto 0);
  signal n12145_o : std_logic_vector (43 downto 0);
  signal n12160_o : std_logic_vector (27 downto 0);
  constant n12164_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n12165_o : std_logic_vector (15 downto 0);
  signal n12166_o : std_logic_vector (43 downto 0);
  signal n12177_o : std_logic_vector (43 downto 0);
  signal n12188_o : std_logic_vector (42 downto 0);
  signal n12189_o : std_logic;
  signal n12193_o : std_logic;
  signal n12194_o : std_logic;
  signal n12201_o : std_logic;
  signal n12207_o : std_logic;
  signal n12208_o : std_logic;
  signal n12209_o : std_logic;
  signal n12210_o : std_logic;
  signal n12211_o : std_logic;
  signal n12212_o : std_logic;
  signal n12213_o : std_logic;
  signal n12214_o : std_logic;
  signal n12215_o : std_logic;
  signal n12216_o : std_logic;
  signal n12217_o : std_logic;
  signal n12218_o : std_logic;
  signal n12219_o : std_logic;
  signal n12220_o : std_logic;
  signal n12221_o : std_logic;
  signal n12222_o : std_logic;
  signal n12223_o : std_logic;
  signal n12224_o : std_logic;
  signal n12225_o : std_logic;
  signal n12226_o : std_logic;
  signal n12227_o : std_logic;
  signal n12228_o : std_logic;
  signal n12229_o : std_logic;
  signal n12230_o : std_logic;
  signal n12231_o : std_logic;
  signal n12232_o : std_logic;
  signal n12233_o : std_logic;
  signal n12234_o : std_logic;
  signal n12235_o : std_logic;
  signal n12236_o : std_logic;
  signal n12237_o : std_logic;
  signal n12238_o : std_logic;
  signal n12239_o : std_logic;
  signal n12240_o : std_logic;
  signal n12241_o : std_logic;
  signal n12242_o : std_logic;
  signal n12243_o : std_logic;
  signal n12244_o : std_logic;
  signal n12245_o : std_logic;
  signal n12246_o : std_logic;
  signal n12247_o : std_logic;
  signal n12248_o : std_logic;
  signal n12249_o : std_logic;
  signal n12250_o : std_logic_vector (3 downto 0);
  signal n12251_o : std_logic_vector (3 downto 0);
  signal n12252_o : std_logic_vector (3 downto 0);
  signal n12253_o : std_logic_vector (3 downto 0);
  signal n12254_o : std_logic_vector (3 downto 0);
  signal n12255_o : std_logic_vector (3 downto 0);
  signal n12256_o : std_logic_vector (3 downto 0);
  signal n12257_o : std_logic_vector (3 downto 0);
  signal n12258_o : std_logic_vector (3 downto 0);
  signal n12259_o : std_logic_vector (3 downto 0);
  signal n12260_o : std_logic_vector (2 downto 0);
  signal n12261_o : std_logic_vector (15 downto 0);
  signal n12262_o : std_logic_vector (15 downto 0);
  signal n12263_o : std_logic_vector (10 downto 0);
  signal n12264_o : std_logic_vector (42 downto 0);
  signal n12265_o : std_logic_vector (41 downto 0);
  signal n12266_o : std_logic_vector (42 downto 0);
  signal n12267_o : std_logic_vector (42 downto 0);
  signal n12283_o : std_logic_vector (40 downto 0);
  signal n12284_o : std_logic;
  signal n12288_o : std_logic;
  signal n12289_o : std_logic;
  signal n12296_o : std_logic;
  signal n12300_o : std_logic;
  signal n12302_o : std_logic;
  signal n12303_o : std_logic;
  signal n12305_o : std_logic;
  signal n12311_o : std_logic;
  signal n12314_o : std_logic;
  signal n12316_o : std_logic;
  signal n12317_o : std_logic;
  signal n12318_o : std_logic;
  signal n12319_o : std_logic;
  signal n12320_o : std_logic;
  signal n12321_o : std_logic;
  signal n12322_o : std_logic;
  signal n12323_o : std_logic;
  signal n12324_o : std_logic;
  signal n12325_o : std_logic;
  signal n12326_o : std_logic;
  signal n12327_o : std_logic;
  signal n12328_o : std_logic;
  signal n12329_o : std_logic;
  signal n12330_o : std_logic;
  signal n12331_o : std_logic;
  signal n12332_o : std_logic;
  signal n12333_o : std_logic;
  signal n12334_o : std_logic;
  signal n12335_o : std_logic;
  signal n12336_o : std_logic;
  signal n12337_o : std_logic;
  signal n12338_o : std_logic;
  signal n12339_o : std_logic;
  signal n12340_o : std_logic;
  signal n12341_o : std_logic_vector (3 downto 0);
  signal n12342_o : std_logic_vector (3 downto 0);
  signal n12343_o : std_logic_vector (3 downto 0);
  signal n12344_o : std_logic_vector (3 downto 0);
  signal n12345_o : std_logic_vector (3 downto 0);
  signal n12346_o : std_logic_vector (3 downto 0);
  signal n12347_o : std_logic_vector (15 downto 0);
  signal n12348_o : std_logic_vector (8 downto 0);
  signal n12349_o : std_logic_vector (24 downto 0);
  signal n12350_o : std_logic_vector (23 downto 0);
  signal n12351_o : std_logic_vector (24 downto 0);
  signal n12352_o : std_logic_vector (24 downto 0);
  signal n12353_o : std_logic_vector (24 downto 0);
  signal n12369_o : std_logic_vector (42 downto 0);
  signal n12372_o : std_logic_vector (42 downto 0);
  signal n12384_o : std_logic_vector (42 downto 0);
  signal n12387_o : std_logic_vector (42 downto 0);
  signal n12404_o : std_logic_vector (43 downto 0);
  signal n12419_o : std_logic_vector (43 downto 0);
  signal n12434_o : std_logic_vector (43 downto 0);
  signal n12445_o : std_logic_vector (42 downto 0);
  signal n12446_o : std_logic;
  signal n12450_o : std_logic;
  signal n12451_o : std_logic;
  signal n12458_o : std_logic;
  signal n12464_o : std_logic;
  signal n12465_o : std_logic;
  signal n12466_o : std_logic;
  signal n12467_o : std_logic;
  signal n12468_o : std_logic;
  signal n12469_o : std_logic;
  signal n12470_o : std_logic;
  signal n12471_o : std_logic;
  signal n12472_o : std_logic;
  signal n12473_o : std_logic;
  signal n12474_o : std_logic;
  signal n12475_o : std_logic;
  signal n12476_o : std_logic;
  signal n12477_o : std_logic;
  signal n12478_o : std_logic;
  signal n12479_o : std_logic;
  signal n12480_o : std_logic;
  signal n12481_o : std_logic;
  signal n12482_o : std_logic;
  signal n12483_o : std_logic;
  signal n12484_o : std_logic;
  signal n12485_o : std_logic;
  signal n12486_o : std_logic;
  signal n12487_o : std_logic;
  signal n12488_o : std_logic;
  signal n12489_o : std_logic;
  signal n12490_o : std_logic;
  signal n12491_o : std_logic;
  signal n12492_o : std_logic;
  signal n12493_o : std_logic;
  signal n12494_o : std_logic;
  signal n12495_o : std_logic;
  signal n12496_o : std_logic;
  signal n12497_o : std_logic;
  signal n12498_o : std_logic;
  signal n12499_o : std_logic;
  signal n12500_o : std_logic;
  signal n12501_o : std_logic;
  signal n12502_o : std_logic;
  signal n12503_o : std_logic;
  signal n12504_o : std_logic;
  signal n12505_o : std_logic;
  signal n12506_o : std_logic;
  signal n12507_o : std_logic_vector (3 downto 0);
  signal n12508_o : std_logic_vector (3 downto 0);
  signal n12509_o : std_logic_vector (3 downto 0);
  signal n12510_o : std_logic_vector (3 downto 0);
  signal n12511_o : std_logic_vector (3 downto 0);
  signal n12512_o : std_logic_vector (3 downto 0);
  signal n12513_o : std_logic_vector (3 downto 0);
  signal n12514_o : std_logic_vector (3 downto 0);
  signal n12515_o : std_logic_vector (3 downto 0);
  signal n12516_o : std_logic_vector (3 downto 0);
  signal n12517_o : std_logic_vector (2 downto 0);
  signal n12518_o : std_logic_vector (15 downto 0);
  signal n12519_o : std_logic_vector (15 downto 0);
  signal n12520_o : std_logic_vector (10 downto 0);
  signal n12521_o : std_logic_vector (42 downto 0);
  signal n12522_o : std_logic_vector (41 downto 0);
  signal n12523_o : std_logic_vector (42 downto 0);
  signal n12524_o : std_logic_vector (42 downto 0);
  signal n12542_o : std_logic_vector (43 downto 0);
  signal n12557_o : std_logic_vector (27 downto 0);
  constant n12561_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n12562_o : std_logic_vector (15 downto 0);
  signal n12563_o : std_logic_vector (43 downto 0);
  signal n12574_o : std_logic_vector (43 downto 0);
  signal n12585_o : std_logic_vector (42 downto 0);
  signal n12586_o : std_logic;
  signal n12590_o : std_logic;
  signal n12591_o : std_logic;
  signal n12598_o : std_logic;
  signal n12604_o : std_logic;
  signal n12605_o : std_logic;
  signal n12606_o : std_logic;
  signal n12607_o : std_logic;
  signal n12608_o : std_logic;
  signal n12609_o : std_logic;
  signal n12610_o : std_logic;
  signal n12611_o : std_logic;
  signal n12612_o : std_logic;
  signal n12613_o : std_logic;
  signal n12614_o : std_logic;
  signal n12615_o : std_logic;
  signal n12616_o : std_logic;
  signal n12617_o : std_logic;
  signal n12618_o : std_logic;
  signal n12619_o : std_logic;
  signal n12620_o : std_logic;
  signal n12621_o : std_logic;
  signal n12622_o : std_logic;
  signal n12623_o : std_logic;
  signal n12624_o : std_logic;
  signal n12625_o : std_logic;
  signal n12626_o : std_logic;
  signal n12627_o : std_logic;
  signal n12628_o : std_logic;
  signal n12629_o : std_logic;
  signal n12630_o : std_logic;
  signal n12631_o : std_logic;
  signal n12632_o : std_logic;
  signal n12633_o : std_logic;
  signal n12634_o : std_logic;
  signal n12635_o : std_logic;
  signal n12636_o : std_logic;
  signal n12637_o : std_logic;
  signal n12638_o : std_logic;
  signal n12639_o : std_logic;
  signal n12640_o : std_logic;
  signal n12641_o : std_logic;
  signal n12642_o : std_logic;
  signal n12643_o : std_logic;
  signal n12644_o : std_logic;
  signal n12645_o : std_logic;
  signal n12646_o : std_logic;
  signal n12647_o : std_logic_vector (3 downto 0);
  signal n12648_o : std_logic_vector (3 downto 0);
  signal n12649_o : std_logic_vector (3 downto 0);
  signal n12650_o : std_logic_vector (3 downto 0);
  signal n12651_o : std_logic_vector (3 downto 0);
  signal n12652_o : std_logic_vector (3 downto 0);
  signal n12653_o : std_logic_vector (3 downto 0);
  signal n12654_o : std_logic_vector (3 downto 0);
  signal n12655_o : std_logic_vector (3 downto 0);
  signal n12656_o : std_logic_vector (3 downto 0);
  signal n12657_o : std_logic_vector (2 downto 0);
  signal n12658_o : std_logic_vector (15 downto 0);
  signal n12659_o : std_logic_vector (15 downto 0);
  signal n12660_o : std_logic_vector (10 downto 0);
  signal n12661_o : std_logic_vector (42 downto 0);
  signal n12662_o : std_logic_vector (41 downto 0);
  signal n12663_o : std_logic_vector (42 downto 0);
  signal n12664_o : std_logic_vector (42 downto 0);
  signal n12680_o : std_logic_vector (40 downto 0);
  signal n12681_o : std_logic;
  signal n12685_o : std_logic;
  signal n12686_o : std_logic;
  signal n12693_o : std_logic;
  signal n12697_o : std_logic;
  signal n12699_o : std_logic;
  signal n12700_o : std_logic;
  signal n12702_o : std_logic;
  signal n12708_o : std_logic;
  signal n12711_o : std_logic;
  signal n12713_o : std_logic;
  signal n12714_o : std_logic;
  signal n12715_o : std_logic;
  signal n12716_o : std_logic;
  signal n12717_o : std_logic;
  signal n12718_o : std_logic;
  signal n12719_o : std_logic;
  signal n12720_o : std_logic;
  signal n12721_o : std_logic;
  signal n12722_o : std_logic;
  signal n12723_o : std_logic;
  signal n12724_o : std_logic;
  signal n12725_o : std_logic;
  signal n12726_o : std_logic;
  signal n12727_o : std_logic;
  signal n12728_o : std_logic;
  signal n12729_o : std_logic;
  signal n12730_o : std_logic;
  signal n12731_o : std_logic;
  signal n12732_o : std_logic;
  signal n12733_o : std_logic;
  signal n12734_o : std_logic;
  signal n12735_o : std_logic;
  signal n12736_o : std_logic;
  signal n12737_o : std_logic;
  signal n12738_o : std_logic_vector (3 downto 0);
  signal n12739_o : std_logic_vector (3 downto 0);
  signal n12740_o : std_logic_vector (3 downto 0);
  signal n12741_o : std_logic_vector (3 downto 0);
  signal n12742_o : std_logic_vector (3 downto 0);
  signal n12743_o : std_logic_vector (3 downto 0);
  signal n12744_o : std_logic_vector (15 downto 0);
  signal n12745_o : std_logic_vector (8 downto 0);
  signal n12746_o : std_logic_vector (24 downto 0);
  signal n12747_o : std_logic_vector (23 downto 0);
  signal n12748_o : std_logic_vector (24 downto 0);
  signal n12749_o : std_logic_vector (24 downto 0);
  signal n12750_o : std_logic_vector (24 downto 0);
  signal n12765_o : std_logic_vector (42 downto 0);
  signal n12768_o : std_logic_vector (42 downto 0);
  signal n12780_o : std_logic_vector (42 downto 0);
  signal n12783_o : std_logic_vector (42 downto 0);
  signal n12800_o : std_logic_vector (43 downto 0);
  signal n12815_o : std_logic_vector (43 downto 0);
  signal n12830_o : std_logic_vector (43 downto 0);
  signal n12841_o : std_logic_vector (42 downto 0);
  signal n12842_o : std_logic;
  signal n12846_o : std_logic;
  signal n12847_o : std_logic;
  signal n12854_o : std_logic;
  signal n12860_o : std_logic;
  signal n12861_o : std_logic;
  signal n12862_o : std_logic;
  signal n12863_o : std_logic;
  signal n12864_o : std_logic;
  signal n12865_o : std_logic;
  signal n12866_o : std_logic;
  signal n12867_o : std_logic;
  signal n12868_o : std_logic;
  signal n12869_o : std_logic;
  signal n12870_o : std_logic;
  signal n12871_o : std_logic;
  signal n12872_o : std_logic;
  signal n12873_o : std_logic;
  signal n12874_o : std_logic;
  signal n12875_o : std_logic;
  signal n12876_o : std_logic;
  signal n12877_o : std_logic;
  signal n12878_o : std_logic;
  signal n12879_o : std_logic;
  signal n12880_o : std_logic;
  signal n12881_o : std_logic;
  signal n12882_o : std_logic;
  signal n12883_o : std_logic;
  signal n12884_o : std_logic;
  signal n12885_o : std_logic;
  signal n12886_o : std_logic;
  signal n12887_o : std_logic;
  signal n12888_o : std_logic;
  signal n12889_o : std_logic;
  signal n12890_o : std_logic;
  signal n12891_o : std_logic;
  signal n12892_o : std_logic;
  signal n12893_o : std_logic;
  signal n12894_o : std_logic;
  signal n12895_o : std_logic;
  signal n12896_o : std_logic;
  signal n12897_o : std_logic;
  signal n12898_o : std_logic;
  signal n12899_o : std_logic;
  signal n12900_o : std_logic;
  signal n12901_o : std_logic;
  signal n12902_o : std_logic;
  signal n12903_o : std_logic_vector (3 downto 0);
  signal n12904_o : std_logic_vector (3 downto 0);
  signal n12905_o : std_logic_vector (3 downto 0);
  signal n12906_o : std_logic_vector (3 downto 0);
  signal n12907_o : std_logic_vector (3 downto 0);
  signal n12908_o : std_logic_vector (3 downto 0);
  signal n12909_o : std_logic_vector (3 downto 0);
  signal n12910_o : std_logic_vector (3 downto 0);
  signal n12911_o : std_logic_vector (3 downto 0);
  signal n12912_o : std_logic_vector (3 downto 0);
  signal n12913_o : std_logic_vector (2 downto 0);
  signal n12914_o : std_logic_vector (15 downto 0);
  signal n12915_o : std_logic_vector (15 downto 0);
  signal n12916_o : std_logic_vector (10 downto 0);
  signal n12917_o : std_logic_vector (42 downto 0);
  signal n12918_o : std_logic_vector (41 downto 0);
  signal n12919_o : std_logic_vector (42 downto 0);
  signal n12920_o : std_logic_vector (42 downto 0);
  signal n12936_o : std_logic_vector (40 downto 0);
  signal n12937_o : std_logic;
  signal n12941_o : std_logic;
  signal n12942_o : std_logic;
  signal n12949_o : std_logic;
  signal n12953_o : std_logic;
  signal n12955_o : std_logic;
  signal n12956_o : std_logic;
  signal n12958_o : std_logic;
  signal n12964_o : std_logic;
  signal n12967_o : std_logic;
  signal n12969_o : std_logic;
  signal n12970_o : std_logic;
  signal n12971_o : std_logic;
  signal n12972_o : std_logic;
  signal n12973_o : std_logic;
  signal n12974_o : std_logic;
  signal n12975_o : std_logic;
  signal n12976_o : std_logic;
  signal n12977_o : std_logic;
  signal n12978_o : std_logic;
  signal n12979_o : std_logic;
  signal n12980_o : std_logic;
  signal n12981_o : std_logic;
  signal n12982_o : std_logic;
  signal n12983_o : std_logic;
  signal n12984_o : std_logic;
  signal n12985_o : std_logic;
  signal n12986_o : std_logic;
  signal n12987_o : std_logic;
  signal n12988_o : std_logic;
  signal n12989_o : std_logic;
  signal n12990_o : std_logic;
  signal n12991_o : std_logic;
  signal n12992_o : std_logic;
  signal n12993_o : std_logic;
  signal n12994_o : std_logic_vector (3 downto 0);
  signal n12995_o : std_logic_vector (3 downto 0);
  signal n12996_o : std_logic_vector (3 downto 0);
  signal n12997_o : std_logic_vector (3 downto 0);
  signal n12998_o : std_logic_vector (3 downto 0);
  signal n12999_o : std_logic_vector (3 downto 0);
  signal n13000_o : std_logic_vector (15 downto 0);
  signal n13001_o : std_logic_vector (8 downto 0);
  signal n13002_o : std_logic_vector (24 downto 0);
  signal n13003_o : std_logic_vector (23 downto 0);
  signal n13004_o : std_logic_vector (24 downto 0);
  signal n13005_o : std_logic_vector (24 downto 0);
  signal n13006_o : std_logic_vector (24 downto 0);
  signal n13009_o : std_logic;
  signal n13010_o : std_logic_vector (1 downto 0);
  signal n13011_o : std_logic_vector (24 downto 0);
  signal n13012_o : std_logic_vector (24 downto 0);
  signal n13013_o : std_logic_vector (24 downto 0);
  signal n13014_o : std_logic_vector (24 downto 0);
  signal n13029_o : std_logic;
  signal n13030_o : std_logic_vector (24 downto 0);
  signal n13031_q : std_logic_vector (24 downto 0);
  signal n13032_o : std_logic;
  signal n13033_o : std_logic_vector (24 downto 0);
  signal n13034_q : std_logic_vector (24 downto 0);
  signal n13035_q : std_logic_vector (24 downto 0);
  signal n13036_q : std_logic_vector (24 downto 0);
  signal n13055_o : std_logic_vector (22 downto 0);
  signal n13056_o : std_logic;
  signal n13060_o : std_logic;
  signal n13061_o : std_logic;
  signal n13068_o : std_logic;
  signal n13072_o : std_logic;
  signal n13074_o : std_logic;
  signal n13075_o : std_logic;
  signal n13077_o : std_logic;
  signal n13083_o : std_logic;
  signal n13086_o : std_logic;
  signal n13088_o : std_logic;
  signal n13089_o : std_logic;
  signal n13090_o : std_logic;
  signal n13091_o : std_logic;
  signal n13092_o : std_logic;
  signal n13093_o : std_logic;
  signal n13094_o : std_logic;
  signal n13095_o : std_logic;
  signal n13096_o : std_logic;
  signal n13097_o : std_logic;
  signal n13098_o : std_logic;
  signal n13099_o : std_logic;
  signal n13100_o : std_logic;
  signal n13101_o : std_logic;
  signal n13102_o : std_logic;
  signal n13103_o : std_logic;
  signal n13104_o : std_logic;
  signal n13105_o : std_logic;
  signal n13106_o : std_logic_vector (3 downto 0);
  signal n13107_o : std_logic_vector (3 downto 0);
  signal n13108_o : std_logic_vector (3 downto 0);
  signal n13109_o : std_logic_vector (3 downto 0);
  signal n13110_o : std_logic_vector (1 downto 0);
  signal n13111_o : std_logic_vector (15 downto 0);
  signal n13112_o : std_logic_vector (17 downto 0);
  signal n13113_o : std_logic_vector (16 downto 0);
  signal n13114_o : std_logic_vector (17 downto 0);
  signal n13115_o : std_logic_vector (17 downto 0);
  signal n13116_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n12077_o;
  valid_o <= n12082_o;
  data_o <= n13116_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n12073_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n13031_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n13034_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n13035_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n13036_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n12056_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n12058_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n12060_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n12062_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n12064_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:170:18
  n12065_o <= n12064_o & n12060_o & n12058_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n12065_o select n12068_o <=
    n12062_o when "100",
    "10" when "010",
    n12056_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n12073_q <= "00";
    elsif rising_edge (clk_i) then
      n12073_q <= n12068_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n12076_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n12077_o <= '0' when n12076_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n12081_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n12082_o <= '0' when n12081_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n12102_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n12107_o <= n12106_o (4 downto 0);
  n12108_o <= n12102_o & n12107_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n12109_o <= x_reg when valid_i = '0' else n12108_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n12111_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n12125_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n12128_o <= std_logic_vector (resize (signed (n12125_o) * signed'("0000000000000000000000000000000011101001111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n12145_o <= std_logic_vector (resize (signed (n12128_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n12160_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n12165_o <= n12164_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n12166_o <= n12160_o & n12165_o;
  -- ../fixed_pkg.vhd:257:67
  n12177_o <= std_logic_vector (unsigned (n12145_o) + unsigned (n12166_o));
  -- ../fixed_pkg.vhd:168:39
  n12188_o <= n12177_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12189_o <= n12177_o (43);
  -- ../fixed_pkg.vhd:185:23
  n12193_o <= n12177_o (42);
  -- ../fixed_pkg.vhd:185:27
  n12194_o <= '1' when n12193_o /= n12189_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12201_o <= '0' when n12194_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n12207_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12208_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12209_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12210_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12211_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12212_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12213_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12214_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12215_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12216_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12217_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12218_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12219_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12220_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12221_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12222_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12223_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12224_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12225_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12226_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12227_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12228_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12229_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12230_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12231_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12232_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12233_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12234_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12235_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12236_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12237_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12238_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12239_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12240_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12241_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12242_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12243_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12244_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12245_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12246_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12247_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12248_o <= not n12189_o;
  -- ../fixed_pkg.vhd:196:31
  n12249_o <= not n12189_o;
  -- ../fixed_pkg.vhd:184:13
  n12250_o <= n12207_o & n12208_o & n12209_o & n12210_o;
  -- ../fixed_pkg.vhd:171:18
  n12251_o <= n12211_o & n12212_o & n12213_o & n12214_o;
  n12252_o <= n12215_o & n12216_o & n12217_o & n12218_o;
  -- ../fixed_pkg.vhd:170:18
  n12253_o <= n12219_o & n12220_o & n12221_o & n12222_o;
  n12254_o <= n12223_o & n12224_o & n12225_o & n12226_o;
  -- ../fixed_pkg.vhd:9:14
  n12255_o <= n12227_o & n12228_o & n12229_o & n12230_o;
  -- ../fixed_pkg.vhd:9:14
  n12256_o <= n12231_o & n12232_o & n12233_o & n12234_o;
  n12257_o <= n12235_o & n12236_o & n12237_o & n12238_o;
  -- ../fixed_pkg.vhd:9:14
  n12258_o <= n12239_o & n12240_o & n12241_o & n12242_o;
  -- ../fixed_pkg.vhd:24:14
  n12259_o <= n12243_o & n12244_o & n12245_o & n12246_o;
  -- ../fixed_pkg.vhd:24:14
  n12260_o <= n12247_o & n12248_o & n12249_o;
  n12261_o <= n12250_o & n12251_o & n12252_o & n12253_o;
  -- ../fixed_pkg.vhd:24:14
  n12262_o <= n12254_o & n12255_o & n12256_o & n12257_o;
  -- ../fixed_pkg.vhd:9:14
  n12263_o <= n12258_o & n12259_o & n12260_o;
  -- ../fixed_pkg.vhd:9:14
  n12264_o <= n12261_o & n12262_o & n12263_o;
  n12265_o <= n12264_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n12266_o <= n12189_o & n12265_o;
  -- ../fixed_pkg.vhd:195:9
  n12267_o <= n12188_o when n12201_o = '0' else n12266_o;
  -- ../fixed_pkg.vhd:168:39
  n12283_o <= n12267_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12284_o <= n12267_o (42);
  -- ../fixed_pkg.vhd:185:23
  n12288_o <= n12267_o (41);
  -- ../fixed_pkg.vhd:185:27
  n12289_o <= '1' when n12288_o /= n12284_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12296_o <= '0' when n12289_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n12300_o <= '1' when n12289_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n12302_o <= n12267_o (40);
  -- ../fixed_pkg.vhd:185:27
  n12303_o <= '1' when n12302_o /= n12284_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12305_o <= n12296_o when n12314_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n12311_o <= n12303_o and n12300_o;
  -- ../fixed_pkg.vhd:185:17
  n12314_o <= n12300_o and n12311_o;
  -- ../fixed_pkg.vhd:196:31
  n12316_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12317_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12318_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12319_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12320_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12321_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12322_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12323_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12324_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12325_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12326_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12327_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12328_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12329_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12330_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12331_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12332_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12333_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12334_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12335_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12336_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12337_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12338_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12339_o <= not n12284_o;
  -- ../fixed_pkg.vhd:196:31
  n12340_o <= not n12284_o;
  -- ../fixed_pkg.vhd:9:14
  n12341_o <= n12316_o & n12317_o & n12318_o & n12319_o;
  -- ../fixed_pkg.vhd:9:14
  n12342_o <= n12320_o & n12321_o & n12322_o & n12323_o;
  -- ../fixed_pkg.vhd:24:14
  n12343_o <= n12324_o & n12325_o & n12326_o & n12327_o;
  -- ../fixed_pkg.vhd:24:14
  n12344_o <= n12328_o & n12329_o & n12330_o & n12331_o;
  -- ../fixed_pkg.vhd:171:18
  n12345_o <= n12332_o & n12333_o & n12334_o & n12335_o;
  -- ../fixed_pkg.vhd:24:14
  n12346_o <= n12336_o & n12337_o & n12338_o & n12339_o;
  -- ../fixed_pkg.vhd:9:14
  n12347_o <= n12341_o & n12342_o & n12343_o & n12344_o;
  -- ../fixed_pkg.vhd:171:18
  n12348_o <= n12345_o & n12346_o & n12340_o;
  -- ../fixed_pkg.vhd:185:17
  n12349_o <= n12347_o & n12348_o;
  -- ../fixed_pkg.vhd:170:18
  n12350_o <= n12349_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n12351_o <= n12283_o (40 downto 16);
  -- ../fixed_pkg.vhd:169:40
  n12352_o <= n12284_o & n12350_o;
  -- ../fixed_pkg.vhd:195:9
  n12353_o <= n12351_o when n12305_o = '0' else n12352_o;
  -- ../fixed_pkg.vhd:268:100
  n12369_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n12372_o <= std_logic_vector (resize (signed (n12369_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n12384_o <= std_logic_vector (resize (signed (n12353_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n12387_o <= std_logic_vector (resize (signed (n12384_o) * signed'("0000000000011111111111111100110110110011100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n12404_o <= std_logic_vector (resize (signed (n12372_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n12419_o <= std_logic_vector (resize (signed (n12387_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n12434_o <= std_logic_vector (unsigned (n12404_o) - unsigned (n12419_o));
  -- ../fixed_pkg.vhd:168:39
  n12445_o <= n12434_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12446_o <= n12434_o (43);
  -- ../fixed_pkg.vhd:185:23
  n12450_o <= n12434_o (42);
  -- ../fixed_pkg.vhd:185:27
  n12451_o <= '1' when n12450_o /= n12446_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12458_o <= '0' when n12451_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n12464_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12465_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12466_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12467_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12468_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12469_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12470_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12471_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12472_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12473_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12474_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12475_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12476_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12477_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12478_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12479_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12480_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12481_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12482_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12483_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12484_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12485_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12486_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12487_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12488_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12489_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12490_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12491_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12492_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12493_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12494_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12495_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12496_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12497_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12498_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12499_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12500_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12501_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12502_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12503_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12504_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12505_o <= not n12446_o;
  -- ../fixed_pkg.vhd:196:31
  n12506_o <= not n12446_o;
  -- ../fixed_pkg.vhd:9:14
  n12507_o <= n12464_o & n12465_o & n12466_o & n12467_o;
  -- ../fixed_pkg.vhd:24:14
  n12508_o <= n12468_o & n12469_o & n12470_o & n12471_o;
  -- ../fixed_pkg.vhd:24:14
  n12509_o <= n12472_o & n12473_o & n12474_o & n12475_o;
  -- ../fixed_pkg.vhd:185:17
  n12510_o <= n12476_o & n12477_o & n12478_o & n12479_o;
  -- ../fixed_pkg.vhd:24:14
  n12511_o <= n12480_o & n12481_o & n12482_o & n12483_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n12512_o <= n12484_o & n12485_o & n12486_o & n12487_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n12513_o <= n12488_o & n12489_o & n12490_o & n12491_o;
  -- ../fixed_pkg.vhd:185:17
  n12514_o <= n12492_o & n12493_o & n12494_o & n12495_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n12515_o <= n12496_o & n12497_o & n12498_o & n12499_o;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n12516_o <= n12500_o & n12501_o & n12502_o & n12503_o;
  -- ../BiquadFilter/BiquadFilter.vhd:53:18
  n12517_o <= n12504_o & n12505_o & n12506_o;
  n12518_o <= n12507_o & n12508_o & n12509_o & n12510_o;
  -- ../fixed_pkg.vhd:24:14
  n12519_o <= n12511_o & n12512_o & n12513_o & n12514_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n12520_o <= n12515_o & n12516_o & n12517_o;
  n12521_o <= n12518_o & n12519_o & n12520_o;
  n12522_o <= n12521_o (41 downto 0);
  n12523_o <= n12446_o & n12522_o;
  -- ../fixed_pkg.vhd:195:9
  n12524_o <= n12445_o when n12458_o = '0' else n12523_o;
  -- ../fixed_pkg.vhd:168:39
  n12542_o <= std_logic_vector (resize (signed (n12524_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n12557_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n12562_o <= n12561_o (15 downto 0);
  n12563_o <= n12557_o & n12562_o;
  -- ../fixed_pkg.vhd:257:67
  n12574_o <= std_logic_vector (unsigned (n12542_o) + unsigned (n12563_o));
  -- ../fixed_pkg.vhd:168:39
  n12585_o <= n12574_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12586_o <= n12574_o (43);
  -- ../fixed_pkg.vhd:185:23
  n12590_o <= n12574_o (42);
  -- ../fixed_pkg.vhd:185:27
  n12591_o <= '1' when n12590_o /= n12586_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12598_o <= '0' when n12591_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n12604_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12605_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12606_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12607_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12608_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12609_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12610_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12611_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12612_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12613_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12614_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12615_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12616_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12617_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12618_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12619_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12620_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12621_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12622_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12623_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12624_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12625_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12626_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12627_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12628_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12629_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12630_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12631_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12632_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12633_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12634_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12635_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12636_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12637_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12638_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12639_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12640_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12641_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12642_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12643_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12644_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12645_o <= not n12586_o;
  -- ../fixed_pkg.vhd:196:31
  n12646_o <= not n12586_o;
  n12647_o <= n12604_o & n12605_o & n12606_o & n12607_o;
  n12648_o <= n12608_o & n12609_o & n12610_o & n12611_o;
  n12649_o <= n12612_o & n12613_o & n12614_o & n12615_o;
  n12650_o <= n12616_o & n12617_o & n12618_o & n12619_o;
  n12651_o <= n12620_o & n12621_o & n12622_o & n12623_o;
  n12652_o <= n12624_o & n12625_o & n12626_o & n12627_o;
  n12653_o <= n12628_o & n12629_o & n12630_o & n12631_o;
  n12654_o <= n12632_o & n12633_o & n12634_o & n12635_o;
  n12655_o <= n12636_o & n12637_o & n12638_o & n12639_o;
  n12656_o <= n12640_o & n12641_o & n12642_o & n12643_o;
  n12657_o <= n12644_o & n12645_o & n12646_o;
  n12658_o <= n12647_o & n12648_o & n12649_o & n12650_o;
  n12659_o <= n12651_o & n12652_o & n12653_o & n12654_o;
  n12660_o <= n12655_o & n12656_o & n12657_o;
  n12661_o <= n12658_o & n12659_o & n12660_o;
  n12662_o <= n12661_o (41 downto 0);
  n12663_o <= n12586_o & n12662_o;
  -- ../fixed_pkg.vhd:195:9
  n12664_o <= n12585_o when n12598_o = '0' else n12663_o;
  -- ../fixed_pkg.vhd:168:39
  n12680_o <= n12664_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12681_o <= n12664_o (42);
  -- ../fixed_pkg.vhd:185:23
  n12685_o <= n12664_o (41);
  -- ../fixed_pkg.vhd:185:27
  n12686_o <= '1' when n12685_o /= n12681_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12693_o <= '0' when n12686_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n12697_o <= '1' when n12686_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n12699_o <= n12664_o (40);
  -- ../fixed_pkg.vhd:185:27
  n12700_o <= '1' when n12699_o /= n12681_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12702_o <= n12693_o when n12711_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n12708_o <= n12700_o and n12697_o;
  -- ../fixed_pkg.vhd:185:17
  n12711_o <= n12697_o and n12708_o;
  -- ../fixed_pkg.vhd:196:31
  n12713_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12714_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12715_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12716_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12717_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12718_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12719_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12720_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12721_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12722_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12723_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12724_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12725_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12726_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12727_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12728_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12729_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12730_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12731_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12732_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12733_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12734_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12735_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12736_o <= not n12681_o;
  -- ../fixed_pkg.vhd:196:31
  n12737_o <= not n12681_o;
  n12738_o <= n12713_o & n12714_o & n12715_o & n12716_o;
  n12739_o <= n12717_o & n12718_o & n12719_o & n12720_o;
  n12740_o <= n12721_o & n12722_o & n12723_o & n12724_o;
  n12741_o <= n12725_o & n12726_o & n12727_o & n12728_o;
  n12742_o <= n12729_o & n12730_o & n12731_o & n12732_o;
  n12743_o <= n12733_o & n12734_o & n12735_o & n12736_o;
  n12744_o <= n12738_o & n12739_o & n12740_o & n12741_o;
  n12745_o <= n12742_o & n12743_o & n12737_o;
  n12746_o <= n12744_o & n12745_o;
  n12747_o <= n12746_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n12748_o <= n12680_o (40 downto 16);
  n12749_o <= n12681_o & n12747_o;
  -- ../fixed_pkg.vhd:195:9
  n12750_o <= n12748_o when n12702_o = '0' else n12749_o;
  -- ../fixed_pkg.vhd:268:100
  n12765_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n12768_o <= std_logic_vector (resize (signed (n12765_o) * signed'("0000000000011111111111111111111100010110001"), 43));
  -- ../fixed_pkg.vhd:268:100
  n12780_o <= std_logic_vector (resize (signed (n12353_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n12783_o <= std_logic_vector (resize (signed (n12780_o) * signed'("0000000000000000000000000001111000101100010"), 43));
  -- ../fixed_pkg.vhd:168:39
  n12800_o <= std_logic_vector (resize (signed (n12768_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n12815_o <= std_logic_vector (resize (signed (n12783_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n12830_o <= std_logic_vector (unsigned (n12800_o) - unsigned (n12815_o));
  -- ../fixed_pkg.vhd:168:39
  n12841_o <= n12830_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12842_o <= n12830_o (43);
  -- ../fixed_pkg.vhd:185:23
  n12846_o <= n12830_o (42);
  -- ../fixed_pkg.vhd:185:27
  n12847_o <= '1' when n12846_o /= n12842_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12854_o <= '0' when n12847_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n12860_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12861_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12862_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12863_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12864_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12865_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12866_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12867_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12868_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12869_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12870_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12871_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12872_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12873_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12874_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12875_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12876_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12877_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12878_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12879_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12880_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12881_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12882_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12883_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12884_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12885_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12886_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12887_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12888_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12889_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12890_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12891_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12892_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12893_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12894_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12895_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12896_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12897_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12898_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12899_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12900_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12901_o <= not n12842_o;
  -- ../fixed_pkg.vhd:196:31
  n12902_o <= not n12842_o;
  n12903_o <= n12860_o & n12861_o & n12862_o & n12863_o;
  n12904_o <= n12864_o & n12865_o & n12866_o & n12867_o;
  n12905_o <= n12868_o & n12869_o & n12870_o & n12871_o;
  n12906_o <= n12872_o & n12873_o & n12874_o & n12875_o;
  n12907_o <= n12876_o & n12877_o & n12878_o & n12879_o;
  n12908_o <= n12880_o & n12881_o & n12882_o & n12883_o;
  n12909_o <= n12884_o & n12885_o & n12886_o & n12887_o;
  n12910_o <= n12888_o & n12889_o & n12890_o & n12891_o;
  n12911_o <= n12892_o & n12893_o & n12894_o & n12895_o;
  n12912_o <= n12896_o & n12897_o & n12898_o & n12899_o;
  n12913_o <= n12900_o & n12901_o & n12902_o;
  n12914_o <= n12903_o & n12904_o & n12905_o & n12906_o;
  n12915_o <= n12907_o & n12908_o & n12909_o & n12910_o;
  n12916_o <= n12911_o & n12912_o & n12913_o;
  n12917_o <= n12914_o & n12915_o & n12916_o;
  n12918_o <= n12917_o (41 downto 0);
  n12919_o <= n12842_o & n12918_o;
  -- ../fixed_pkg.vhd:195:9
  n12920_o <= n12841_o when n12854_o = '0' else n12919_o;
  -- ../fixed_pkg.vhd:168:39
  n12936_o <= n12920_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12937_o <= n12920_o (42);
  -- ../fixed_pkg.vhd:185:23
  n12941_o <= n12920_o (41);
  -- ../fixed_pkg.vhd:185:27
  n12942_o <= '1' when n12941_o /= n12937_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12949_o <= '0' when n12942_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n12953_o <= '1' when n12942_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n12955_o <= n12920_o (40);
  -- ../fixed_pkg.vhd:185:27
  n12956_o <= '1' when n12955_o /= n12937_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12958_o <= n12949_o when n12967_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n12964_o <= n12956_o and n12953_o;
  -- ../fixed_pkg.vhd:185:17
  n12967_o <= n12953_o and n12964_o;
  -- ../fixed_pkg.vhd:196:31
  n12969_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12970_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12971_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12972_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12973_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12974_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12975_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12976_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12977_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12978_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12979_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12980_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12981_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12982_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12983_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12984_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12985_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12986_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12987_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12988_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12989_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12990_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12991_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12992_o <= not n12937_o;
  -- ../fixed_pkg.vhd:196:31
  n12993_o <= not n12937_o;
  n12994_o <= n12969_o & n12970_o & n12971_o & n12972_o;
  n12995_o <= n12973_o & n12974_o & n12975_o & n12976_o;
  n12996_o <= n12977_o & n12978_o & n12979_o & n12980_o;
  n12997_o <= n12981_o & n12982_o & n12983_o & n12984_o;
  n12998_o <= n12985_o & n12986_o & n12987_o & n12988_o;
  n12999_o <= n12989_o & n12990_o & n12991_o & n12992_o;
  n13000_o <= n12994_o & n12995_o & n12996_o & n12997_o;
  n13001_o <= n12998_o & n12999_o & n12993_o;
  n13002_o <= n13000_o & n13001_o;
  n13003_o <= n13002_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n13004_o <= n12936_o (40 downto 16);
  n13005_o <= n12937_o & n13003_o;
  -- ../fixed_pkg.vhd:195:9
  n13006_o <= n13004_o when n12958_o = '0' else n13005_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n13009_o <= '1' when state_reg = "01" else '0';
  n13010_o <= n13009_o & n12111_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n13010_o select n13011_o <=
    x_reg when "10",
    n12109_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n13010_o select n13012_o <=
    n12353_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n13010_o select n13013_o <=
    n12750_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n13010_o select n13014_o <=
    n13006_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n13029_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n13030_o <= x_reg when n13029_o = '0' else n13011_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n13031_q <= n13030_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n13032_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n13033_o <= y_reg when n13032_o = '0' else n13012_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n13034_q <= n13033_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n13035_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n13035_q <= n13013_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n13036_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n13036_q <= n13014_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n13055_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13056_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n13060_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n13061_o <= '1' when n13060_o /= n13056_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n13068_o <= '0' when n13061_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n13072_o <= '1' when n13061_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n13074_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n13075_o <= '1' when n13074_o /= n13056_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n13077_o <= n13068_o when n13086_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n13083_o <= n13075_o and n13072_o;
  -- ../fixed_pkg.vhd:185:17
  n13086_o <= n13072_o and n13083_o;
  -- ../fixed_pkg.vhd:196:31
  n13088_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13089_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13090_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13091_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13092_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13093_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13094_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13095_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13096_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13097_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13098_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13099_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13100_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13101_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13102_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13103_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13104_o <= not n13056_o;
  -- ../fixed_pkg.vhd:196:31
  n13105_o <= not n13056_o;
  n13106_o <= n13088_o & n13089_o & n13090_o & n13091_o;
  n13107_o <= n13092_o & n13093_o & n13094_o & n13095_o;
  n13108_o <= n13096_o & n13097_o & n13098_o & n13099_o;
  n13109_o <= n13100_o & n13101_o & n13102_o & n13103_o;
  n13110_o <= n13104_o & n13105_o;
  n13111_o <= n13106_o & n13107_o & n13108_o & n13109_o;
  n13112_o <= n13111_o & n13110_o;
  n13113_o <= n13112_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n13114_o <= n13055_o (22 downto 5);
  n13115_o <= n13056_o & n13113_o;
  -- ../fixed_pkg.vhd:195:9
  n13116_o <= n13114_o when n13077_o = '0' else n13115_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_6b9c8d91c4218fd4ae537b4bb7758bc18f168a30 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_6b9c8d91c4218fd4ae537b4bb7758bc18f168a30;

architecture rtl of biquadfilter_6b9c8d91c4218fd4ae537b4bb7758bc18f168a30 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n10988_o : std_logic_vector (1 downto 0);
  signal n10990_o : std_logic;
  signal n10992_o : std_logic;
  signal n10994_o : std_logic_vector (1 downto 0);
  signal n10996_o : std_logic;
  signal n10997_o : std_logic_vector (2 downto 0);
  signal n11000_o : std_logic_vector (1 downto 0);
  signal n11005_q : std_logic_vector (1 downto 0);
  signal n11008_o : std_logic;
  signal n11009_o : std_logic;
  signal n11013_o : std_logic;
  signal n11014_o : std_logic;
  signal n11034_o : std_logic_vector (19 downto 0);
  constant n11038_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n11039_o : std_logic_vector (4 downto 0);
  signal n11040_o : std_logic_vector (24 downto 0);
  signal n11041_o : std_logic_vector (24 downto 0);
  signal n11043_o : std_logic;
  signal n11057_o : std_logic_vector (42 downto 0);
  signal n11060_o : std_logic_vector (42 downto 0);
  signal n11077_o : std_logic_vector (43 downto 0);
  signal n11092_o : std_logic_vector (27 downto 0);
  constant n11096_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n11097_o : std_logic_vector (15 downto 0);
  signal n11098_o : std_logic_vector (43 downto 0);
  signal n11109_o : std_logic_vector (43 downto 0);
  signal n11120_o : std_logic_vector (42 downto 0);
  signal n11121_o : std_logic;
  signal n11125_o : std_logic;
  signal n11126_o : std_logic;
  signal n11133_o : std_logic;
  signal n11139_o : std_logic;
  signal n11140_o : std_logic;
  signal n11141_o : std_logic;
  signal n11142_o : std_logic;
  signal n11143_o : std_logic;
  signal n11144_o : std_logic;
  signal n11145_o : std_logic;
  signal n11146_o : std_logic;
  signal n11147_o : std_logic;
  signal n11148_o : std_logic;
  signal n11149_o : std_logic;
  signal n11150_o : std_logic;
  signal n11151_o : std_logic;
  signal n11152_o : std_logic;
  signal n11153_o : std_logic;
  signal n11154_o : std_logic;
  signal n11155_o : std_logic;
  signal n11156_o : std_logic;
  signal n11157_o : std_logic;
  signal n11158_o : std_logic;
  signal n11159_o : std_logic;
  signal n11160_o : std_logic;
  signal n11161_o : std_logic;
  signal n11162_o : std_logic;
  signal n11163_o : std_logic;
  signal n11164_o : std_logic;
  signal n11165_o : std_logic;
  signal n11166_o : std_logic;
  signal n11167_o : std_logic;
  signal n11168_o : std_logic;
  signal n11169_o : std_logic;
  signal n11170_o : std_logic;
  signal n11171_o : std_logic;
  signal n11172_o : std_logic;
  signal n11173_o : std_logic;
  signal n11174_o : std_logic;
  signal n11175_o : std_logic;
  signal n11176_o : std_logic;
  signal n11177_o : std_logic;
  signal n11178_o : std_logic;
  signal n11179_o : std_logic;
  signal n11180_o : std_logic;
  signal n11181_o : std_logic;
  signal n11182_o : std_logic_vector (3 downto 0);
  signal n11183_o : std_logic_vector (3 downto 0);
  signal n11184_o : std_logic_vector (3 downto 0);
  signal n11185_o : std_logic_vector (3 downto 0);
  signal n11186_o : std_logic_vector (3 downto 0);
  signal n11187_o : std_logic_vector (3 downto 0);
  signal n11188_o : std_logic_vector (3 downto 0);
  signal n11189_o : std_logic_vector (3 downto 0);
  signal n11190_o : std_logic_vector (3 downto 0);
  signal n11191_o : std_logic_vector (3 downto 0);
  signal n11192_o : std_logic_vector (2 downto 0);
  signal n11193_o : std_logic_vector (15 downto 0);
  signal n11194_o : std_logic_vector (15 downto 0);
  signal n11195_o : std_logic_vector (10 downto 0);
  signal n11196_o : std_logic_vector (42 downto 0);
  signal n11197_o : std_logic_vector (41 downto 0);
  signal n11198_o : std_logic_vector (42 downto 0);
  signal n11199_o : std_logic_vector (42 downto 0);
  signal n11215_o : std_logic_vector (40 downto 0);
  signal n11216_o : std_logic;
  signal n11220_o : std_logic;
  signal n11221_o : std_logic;
  signal n11228_o : std_logic;
  signal n11232_o : std_logic;
  signal n11234_o : std_logic;
  signal n11235_o : std_logic;
  signal n11237_o : std_logic;
  signal n11243_o : std_logic;
  signal n11246_o : std_logic;
  signal n11248_o : std_logic;
  signal n11249_o : std_logic;
  signal n11250_o : std_logic;
  signal n11251_o : std_logic;
  signal n11252_o : std_logic;
  signal n11253_o : std_logic;
  signal n11254_o : std_logic;
  signal n11255_o : std_logic;
  signal n11256_o : std_logic;
  signal n11257_o : std_logic;
  signal n11258_o : std_logic;
  signal n11259_o : std_logic;
  signal n11260_o : std_logic;
  signal n11261_o : std_logic;
  signal n11262_o : std_logic;
  signal n11263_o : std_logic;
  signal n11264_o : std_logic;
  signal n11265_o : std_logic;
  signal n11266_o : std_logic;
  signal n11267_o : std_logic;
  signal n11268_o : std_logic;
  signal n11269_o : std_logic;
  signal n11270_o : std_logic;
  signal n11271_o : std_logic;
  signal n11272_o : std_logic;
  signal n11273_o : std_logic_vector (3 downto 0);
  signal n11274_o : std_logic_vector (3 downto 0);
  signal n11275_o : std_logic_vector (3 downto 0);
  signal n11276_o : std_logic_vector (3 downto 0);
  signal n11277_o : std_logic_vector (3 downto 0);
  signal n11278_o : std_logic_vector (3 downto 0);
  signal n11279_o : std_logic_vector (15 downto 0);
  signal n11280_o : std_logic_vector (8 downto 0);
  signal n11281_o : std_logic_vector (24 downto 0);
  signal n11282_o : std_logic_vector (23 downto 0);
  signal n11283_o : std_logic_vector (24 downto 0);
  signal n11284_o : std_logic_vector (24 downto 0);
  signal n11285_o : std_logic_vector (24 downto 0);
  signal n11301_o : std_logic_vector (42 downto 0);
  signal n11304_o : std_logic_vector (42 downto 0);
  signal n11316_o : std_logic_vector (42 downto 0);
  signal n11319_o : std_logic_vector (42 downto 0);
  signal n11336_o : std_logic_vector (43 downto 0);
  signal n11351_o : std_logic_vector (43 downto 0);
  signal n11366_o : std_logic_vector (43 downto 0);
  signal n11377_o : std_logic_vector (42 downto 0);
  signal n11378_o : std_logic;
  signal n11382_o : std_logic;
  signal n11383_o : std_logic;
  signal n11390_o : std_logic;
  signal n11396_o : std_logic;
  signal n11397_o : std_logic;
  signal n11398_o : std_logic;
  signal n11399_o : std_logic;
  signal n11400_o : std_logic;
  signal n11401_o : std_logic;
  signal n11402_o : std_logic;
  signal n11403_o : std_logic;
  signal n11404_o : std_logic;
  signal n11405_o : std_logic;
  signal n11406_o : std_logic;
  signal n11407_o : std_logic;
  signal n11408_o : std_logic;
  signal n11409_o : std_logic;
  signal n11410_o : std_logic;
  signal n11411_o : std_logic;
  signal n11412_o : std_logic;
  signal n11413_o : std_logic;
  signal n11414_o : std_logic;
  signal n11415_o : std_logic;
  signal n11416_o : std_logic;
  signal n11417_o : std_logic;
  signal n11418_o : std_logic;
  signal n11419_o : std_logic;
  signal n11420_o : std_logic;
  signal n11421_o : std_logic;
  signal n11422_o : std_logic;
  signal n11423_o : std_logic;
  signal n11424_o : std_logic;
  signal n11425_o : std_logic;
  signal n11426_o : std_logic;
  signal n11427_o : std_logic;
  signal n11428_o : std_logic;
  signal n11429_o : std_logic;
  signal n11430_o : std_logic;
  signal n11431_o : std_logic;
  signal n11432_o : std_logic;
  signal n11433_o : std_logic;
  signal n11434_o : std_logic;
  signal n11435_o : std_logic;
  signal n11436_o : std_logic;
  signal n11437_o : std_logic;
  signal n11438_o : std_logic;
  signal n11439_o : std_logic_vector (3 downto 0);
  signal n11440_o : std_logic_vector (3 downto 0);
  signal n11441_o : std_logic_vector (3 downto 0);
  signal n11442_o : std_logic_vector (3 downto 0);
  signal n11443_o : std_logic_vector (3 downto 0);
  signal n11444_o : std_logic_vector (3 downto 0);
  signal n11445_o : std_logic_vector (3 downto 0);
  signal n11446_o : std_logic_vector (3 downto 0);
  signal n11447_o : std_logic_vector (3 downto 0);
  signal n11448_o : std_logic_vector (3 downto 0);
  signal n11449_o : std_logic_vector (2 downto 0);
  signal n11450_o : std_logic_vector (15 downto 0);
  signal n11451_o : std_logic_vector (15 downto 0);
  signal n11452_o : std_logic_vector (10 downto 0);
  signal n11453_o : std_logic_vector (42 downto 0);
  signal n11454_o : std_logic_vector (41 downto 0);
  signal n11455_o : std_logic_vector (42 downto 0);
  signal n11456_o : std_logic_vector (42 downto 0);
  signal n11474_o : std_logic_vector (43 downto 0);
  signal n11489_o : std_logic_vector (27 downto 0);
  constant n11493_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n11494_o : std_logic_vector (15 downto 0);
  signal n11495_o : std_logic_vector (43 downto 0);
  signal n11506_o : std_logic_vector (43 downto 0);
  signal n11517_o : std_logic_vector (42 downto 0);
  signal n11518_o : std_logic;
  signal n11522_o : std_logic;
  signal n11523_o : std_logic;
  signal n11530_o : std_logic;
  signal n11536_o : std_logic;
  signal n11537_o : std_logic;
  signal n11538_o : std_logic;
  signal n11539_o : std_logic;
  signal n11540_o : std_logic;
  signal n11541_o : std_logic;
  signal n11542_o : std_logic;
  signal n11543_o : std_logic;
  signal n11544_o : std_logic;
  signal n11545_o : std_logic;
  signal n11546_o : std_logic;
  signal n11547_o : std_logic;
  signal n11548_o : std_logic;
  signal n11549_o : std_logic;
  signal n11550_o : std_logic;
  signal n11551_o : std_logic;
  signal n11552_o : std_logic;
  signal n11553_o : std_logic;
  signal n11554_o : std_logic;
  signal n11555_o : std_logic;
  signal n11556_o : std_logic;
  signal n11557_o : std_logic;
  signal n11558_o : std_logic;
  signal n11559_o : std_logic;
  signal n11560_o : std_logic;
  signal n11561_o : std_logic;
  signal n11562_o : std_logic;
  signal n11563_o : std_logic;
  signal n11564_o : std_logic;
  signal n11565_o : std_logic;
  signal n11566_o : std_logic;
  signal n11567_o : std_logic;
  signal n11568_o : std_logic;
  signal n11569_o : std_logic;
  signal n11570_o : std_logic;
  signal n11571_o : std_logic;
  signal n11572_o : std_logic;
  signal n11573_o : std_logic;
  signal n11574_o : std_logic;
  signal n11575_o : std_logic;
  signal n11576_o : std_logic;
  signal n11577_o : std_logic;
  signal n11578_o : std_logic;
  signal n11579_o : std_logic_vector (3 downto 0);
  signal n11580_o : std_logic_vector (3 downto 0);
  signal n11581_o : std_logic_vector (3 downto 0);
  signal n11582_o : std_logic_vector (3 downto 0);
  signal n11583_o : std_logic_vector (3 downto 0);
  signal n11584_o : std_logic_vector (3 downto 0);
  signal n11585_o : std_logic_vector (3 downto 0);
  signal n11586_o : std_logic_vector (3 downto 0);
  signal n11587_o : std_logic_vector (3 downto 0);
  signal n11588_o : std_logic_vector (3 downto 0);
  signal n11589_o : std_logic_vector (2 downto 0);
  signal n11590_o : std_logic_vector (15 downto 0);
  signal n11591_o : std_logic_vector (15 downto 0);
  signal n11592_o : std_logic_vector (10 downto 0);
  signal n11593_o : std_logic_vector (42 downto 0);
  signal n11594_o : std_logic_vector (41 downto 0);
  signal n11595_o : std_logic_vector (42 downto 0);
  signal n11596_o : std_logic_vector (42 downto 0);
  signal n11612_o : std_logic_vector (40 downto 0);
  signal n11613_o : std_logic;
  signal n11617_o : std_logic;
  signal n11618_o : std_logic;
  signal n11625_o : std_logic;
  signal n11629_o : std_logic;
  signal n11631_o : std_logic;
  signal n11632_o : std_logic;
  signal n11634_o : std_logic;
  signal n11640_o : std_logic;
  signal n11643_o : std_logic;
  signal n11645_o : std_logic;
  signal n11646_o : std_logic;
  signal n11647_o : std_logic;
  signal n11648_o : std_logic;
  signal n11649_o : std_logic;
  signal n11650_o : std_logic;
  signal n11651_o : std_logic;
  signal n11652_o : std_logic;
  signal n11653_o : std_logic;
  signal n11654_o : std_logic;
  signal n11655_o : std_logic;
  signal n11656_o : std_logic;
  signal n11657_o : std_logic;
  signal n11658_o : std_logic;
  signal n11659_o : std_logic;
  signal n11660_o : std_logic;
  signal n11661_o : std_logic;
  signal n11662_o : std_logic;
  signal n11663_o : std_logic;
  signal n11664_o : std_logic;
  signal n11665_o : std_logic;
  signal n11666_o : std_logic;
  signal n11667_o : std_logic;
  signal n11668_o : std_logic;
  signal n11669_o : std_logic;
  signal n11670_o : std_logic_vector (3 downto 0);
  signal n11671_o : std_logic_vector (3 downto 0);
  signal n11672_o : std_logic_vector (3 downto 0);
  signal n11673_o : std_logic_vector (3 downto 0);
  signal n11674_o : std_logic_vector (3 downto 0);
  signal n11675_o : std_logic_vector (3 downto 0);
  signal n11676_o : std_logic_vector (15 downto 0);
  signal n11677_o : std_logic_vector (8 downto 0);
  signal n11678_o : std_logic_vector (24 downto 0);
  signal n11679_o : std_logic_vector (23 downto 0);
  signal n11680_o : std_logic_vector (24 downto 0);
  signal n11681_o : std_logic_vector (24 downto 0);
  signal n11682_o : std_logic_vector (24 downto 0);
  signal n11697_o : std_logic_vector (42 downto 0);
  signal n11700_o : std_logic_vector (42 downto 0);
  signal n11712_o : std_logic_vector (42 downto 0);
  signal n11715_o : std_logic_vector (42 downto 0);
  signal n11732_o : std_logic_vector (43 downto 0);
  signal n11747_o : std_logic_vector (43 downto 0);
  signal n11762_o : std_logic_vector (43 downto 0);
  signal n11773_o : std_logic_vector (42 downto 0);
  signal n11774_o : std_logic;
  signal n11778_o : std_logic;
  signal n11779_o : std_logic;
  signal n11786_o : std_logic;
  signal n11792_o : std_logic;
  signal n11793_o : std_logic;
  signal n11794_o : std_logic;
  signal n11795_o : std_logic;
  signal n11796_o : std_logic;
  signal n11797_o : std_logic;
  signal n11798_o : std_logic;
  signal n11799_o : std_logic;
  signal n11800_o : std_logic;
  signal n11801_o : std_logic;
  signal n11802_o : std_logic;
  signal n11803_o : std_logic;
  signal n11804_o : std_logic;
  signal n11805_o : std_logic;
  signal n11806_o : std_logic;
  signal n11807_o : std_logic;
  signal n11808_o : std_logic;
  signal n11809_o : std_logic;
  signal n11810_o : std_logic;
  signal n11811_o : std_logic;
  signal n11812_o : std_logic;
  signal n11813_o : std_logic;
  signal n11814_o : std_logic;
  signal n11815_o : std_logic;
  signal n11816_o : std_logic;
  signal n11817_o : std_logic;
  signal n11818_o : std_logic;
  signal n11819_o : std_logic;
  signal n11820_o : std_logic;
  signal n11821_o : std_logic;
  signal n11822_o : std_logic;
  signal n11823_o : std_logic;
  signal n11824_o : std_logic;
  signal n11825_o : std_logic;
  signal n11826_o : std_logic;
  signal n11827_o : std_logic;
  signal n11828_o : std_logic;
  signal n11829_o : std_logic;
  signal n11830_o : std_logic;
  signal n11831_o : std_logic;
  signal n11832_o : std_logic;
  signal n11833_o : std_logic;
  signal n11834_o : std_logic;
  signal n11835_o : std_logic_vector (3 downto 0);
  signal n11836_o : std_logic_vector (3 downto 0);
  signal n11837_o : std_logic_vector (3 downto 0);
  signal n11838_o : std_logic_vector (3 downto 0);
  signal n11839_o : std_logic_vector (3 downto 0);
  signal n11840_o : std_logic_vector (3 downto 0);
  signal n11841_o : std_logic_vector (3 downto 0);
  signal n11842_o : std_logic_vector (3 downto 0);
  signal n11843_o : std_logic_vector (3 downto 0);
  signal n11844_o : std_logic_vector (3 downto 0);
  signal n11845_o : std_logic_vector (2 downto 0);
  signal n11846_o : std_logic_vector (15 downto 0);
  signal n11847_o : std_logic_vector (15 downto 0);
  signal n11848_o : std_logic_vector (10 downto 0);
  signal n11849_o : std_logic_vector (42 downto 0);
  signal n11850_o : std_logic_vector (41 downto 0);
  signal n11851_o : std_logic_vector (42 downto 0);
  signal n11852_o : std_logic_vector (42 downto 0);
  signal n11868_o : std_logic_vector (40 downto 0);
  signal n11869_o : std_logic;
  signal n11873_o : std_logic;
  signal n11874_o : std_logic;
  signal n11881_o : std_logic;
  signal n11885_o : std_logic;
  signal n11887_o : std_logic;
  signal n11888_o : std_logic;
  signal n11890_o : std_logic;
  signal n11896_o : std_logic;
  signal n11899_o : std_logic;
  signal n11901_o : std_logic;
  signal n11902_o : std_logic;
  signal n11903_o : std_logic;
  signal n11904_o : std_logic;
  signal n11905_o : std_logic;
  signal n11906_o : std_logic;
  signal n11907_o : std_logic;
  signal n11908_o : std_logic;
  signal n11909_o : std_logic;
  signal n11910_o : std_logic;
  signal n11911_o : std_logic;
  signal n11912_o : std_logic;
  signal n11913_o : std_logic;
  signal n11914_o : std_logic;
  signal n11915_o : std_logic;
  signal n11916_o : std_logic;
  signal n11917_o : std_logic;
  signal n11918_o : std_logic;
  signal n11919_o : std_logic;
  signal n11920_o : std_logic;
  signal n11921_o : std_logic;
  signal n11922_o : std_logic;
  signal n11923_o : std_logic;
  signal n11924_o : std_logic;
  signal n11925_o : std_logic;
  signal n11926_o : std_logic_vector (3 downto 0);
  signal n11927_o : std_logic_vector (3 downto 0);
  signal n11928_o : std_logic_vector (3 downto 0);
  signal n11929_o : std_logic_vector (3 downto 0);
  signal n11930_o : std_logic_vector (3 downto 0);
  signal n11931_o : std_logic_vector (3 downto 0);
  signal n11932_o : std_logic_vector (15 downto 0);
  signal n11933_o : std_logic_vector (8 downto 0);
  signal n11934_o : std_logic_vector (24 downto 0);
  signal n11935_o : std_logic_vector (23 downto 0);
  signal n11936_o : std_logic_vector (24 downto 0);
  signal n11937_o : std_logic_vector (24 downto 0);
  signal n11938_o : std_logic_vector (24 downto 0);
  signal n11941_o : std_logic;
  signal n11942_o : std_logic_vector (1 downto 0);
  signal n11943_o : std_logic_vector (24 downto 0);
  signal n11944_o : std_logic_vector (24 downto 0);
  signal n11945_o : std_logic_vector (24 downto 0);
  signal n11946_o : std_logic_vector (24 downto 0);
  signal n11961_o : std_logic;
  signal n11962_o : std_logic_vector (24 downto 0);
  signal n11963_q : std_logic_vector (24 downto 0);
  signal n11964_o : std_logic;
  signal n11965_o : std_logic_vector (24 downto 0);
  signal n11966_q : std_logic_vector (24 downto 0);
  signal n11967_q : std_logic_vector (24 downto 0);
  signal n11968_q : std_logic_vector (24 downto 0);
  signal n11987_o : std_logic_vector (22 downto 0);
  signal n11988_o : std_logic;
  signal n11992_o : std_logic;
  signal n11993_o : std_logic;
  signal n12000_o : std_logic;
  signal n12004_o : std_logic;
  signal n12006_o : std_logic;
  signal n12007_o : std_logic;
  signal n12009_o : std_logic;
  signal n12015_o : std_logic;
  signal n12018_o : std_logic;
  signal n12020_o : std_logic;
  signal n12021_o : std_logic;
  signal n12022_o : std_logic;
  signal n12023_o : std_logic;
  signal n12024_o : std_logic;
  signal n12025_o : std_logic;
  signal n12026_o : std_logic;
  signal n12027_o : std_logic;
  signal n12028_o : std_logic;
  signal n12029_o : std_logic;
  signal n12030_o : std_logic;
  signal n12031_o : std_logic;
  signal n12032_o : std_logic;
  signal n12033_o : std_logic;
  signal n12034_o : std_logic;
  signal n12035_o : std_logic;
  signal n12036_o : std_logic;
  signal n12037_o : std_logic;
  signal n12038_o : std_logic_vector (3 downto 0);
  signal n12039_o : std_logic_vector (3 downto 0);
  signal n12040_o : std_logic_vector (3 downto 0);
  signal n12041_o : std_logic_vector (3 downto 0);
  signal n12042_o : std_logic_vector (1 downto 0);
  signal n12043_o : std_logic_vector (15 downto 0);
  signal n12044_o : std_logic_vector (17 downto 0);
  signal n12045_o : std_logic_vector (16 downto 0);
  signal n12046_o : std_logic_vector (17 downto 0);
  signal n12047_o : std_logic_vector (17 downto 0);
  signal n12048_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n11009_o;
  valid_o <= n11014_o;
  data_o <= n12048_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n11005_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n11963_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n11966_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n11967_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n11968_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n10988_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n10990_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n10992_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n10994_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n10996_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:170:18
  n10997_o <= n10996_o & n10992_o & n10990_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n10997_o select n11000_o <=
    n10994_o when "100",
    "10" when "010",
    n10988_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n11005_q <= "00";
    elsif rising_edge (clk_i) then
      n11005_q <= n11000_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n11008_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n11009_o <= '0' when n11008_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n11013_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n11014_o <= '0' when n11013_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n11034_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n11039_o <= n11038_o (4 downto 0);
  n11040_o <= n11034_o & n11039_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n11041_o <= x_reg when valid_i = '0' else n11040_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n11043_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n11057_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n11060_o <= std_logic_vector (resize (signed (n11057_o) * signed'("0000000000000000000000000000000011010101110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n11077_o <= std_logic_vector (resize (signed (n11060_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n11092_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n11097_o <= n11096_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n11098_o <= n11092_o & n11097_o;
  -- ../fixed_pkg.vhd:257:67
  n11109_o <= std_logic_vector (unsigned (n11077_o) + unsigned (n11098_o));
  -- ../fixed_pkg.vhd:168:39
  n11120_o <= n11109_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11121_o <= n11109_o (43);
  -- ../fixed_pkg.vhd:185:23
  n11125_o <= n11109_o (42);
  -- ../fixed_pkg.vhd:185:27
  n11126_o <= '1' when n11125_o /= n11121_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n11133_o <= '0' when n11126_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n11139_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11140_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11141_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11142_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11143_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11144_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11145_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11146_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11147_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11148_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11149_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11150_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11151_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11152_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11153_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11154_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11155_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11156_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11157_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11158_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11159_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11160_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11161_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11162_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11163_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11164_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11165_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11166_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11167_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11168_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11169_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11170_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11171_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11172_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11173_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11174_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11175_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11176_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11177_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11178_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11179_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11180_o <= not n11121_o;
  -- ../fixed_pkg.vhd:196:31
  n11181_o <= not n11121_o;
  -- ../fixed_pkg.vhd:184:13
  n11182_o <= n11139_o & n11140_o & n11141_o & n11142_o;
  -- ../fixed_pkg.vhd:171:18
  n11183_o <= n11143_o & n11144_o & n11145_o & n11146_o;
  n11184_o <= n11147_o & n11148_o & n11149_o & n11150_o;
  -- ../fixed_pkg.vhd:170:18
  n11185_o <= n11151_o & n11152_o & n11153_o & n11154_o;
  n11186_o <= n11155_o & n11156_o & n11157_o & n11158_o;
  -- ../fixed_pkg.vhd:9:14
  n11187_o <= n11159_o & n11160_o & n11161_o & n11162_o;
  -- ../fixed_pkg.vhd:9:14
  n11188_o <= n11163_o & n11164_o & n11165_o & n11166_o;
  n11189_o <= n11167_o & n11168_o & n11169_o & n11170_o;
  -- ../fixed_pkg.vhd:9:14
  n11190_o <= n11171_o & n11172_o & n11173_o & n11174_o;
  -- ../fixed_pkg.vhd:24:14
  n11191_o <= n11175_o & n11176_o & n11177_o & n11178_o;
  -- ../fixed_pkg.vhd:24:14
  n11192_o <= n11179_o & n11180_o & n11181_o;
  n11193_o <= n11182_o & n11183_o & n11184_o & n11185_o;
  -- ../fixed_pkg.vhd:24:14
  n11194_o <= n11186_o & n11187_o & n11188_o & n11189_o;
  -- ../fixed_pkg.vhd:9:14
  n11195_o <= n11190_o & n11191_o & n11192_o;
  -- ../fixed_pkg.vhd:9:14
  n11196_o <= n11193_o & n11194_o & n11195_o;
  n11197_o <= n11196_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n11198_o <= n11121_o & n11197_o;
  -- ../fixed_pkg.vhd:195:9
  n11199_o <= n11120_o when n11133_o = '0' else n11198_o;
  -- ../fixed_pkg.vhd:168:39
  n11215_o <= n11199_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11216_o <= n11199_o (42);
  -- ../fixed_pkg.vhd:185:23
  n11220_o <= n11199_o (41);
  -- ../fixed_pkg.vhd:185:27
  n11221_o <= '1' when n11220_o /= n11216_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n11228_o <= '0' when n11221_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n11232_o <= '1' when n11221_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n11234_o <= n11199_o (40);
  -- ../fixed_pkg.vhd:185:27
  n11235_o <= '1' when n11234_o /= n11216_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n11237_o <= n11228_o when n11246_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n11243_o <= n11235_o and n11232_o;
  -- ../fixed_pkg.vhd:185:17
  n11246_o <= n11232_o and n11243_o;
  -- ../fixed_pkg.vhd:196:31
  n11248_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11249_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11250_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11251_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11252_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11253_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11254_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11255_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11256_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11257_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11258_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11259_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11260_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11261_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11262_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11263_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11264_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11265_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11266_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11267_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11268_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11269_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11270_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11271_o <= not n11216_o;
  -- ../fixed_pkg.vhd:196:31
  n11272_o <= not n11216_o;
  -- ../fixed_pkg.vhd:9:14
  n11273_o <= n11248_o & n11249_o & n11250_o & n11251_o;
  -- ../fixed_pkg.vhd:9:14
  n11274_o <= n11252_o & n11253_o & n11254_o & n11255_o;
  -- ../fixed_pkg.vhd:24:14
  n11275_o <= n11256_o & n11257_o & n11258_o & n11259_o;
  -- ../fixed_pkg.vhd:24:14
  n11276_o <= n11260_o & n11261_o & n11262_o & n11263_o;
  -- ../fixed_pkg.vhd:171:18
  n11277_o <= n11264_o & n11265_o & n11266_o & n11267_o;
  -- ../fixed_pkg.vhd:24:14
  n11278_o <= n11268_o & n11269_o & n11270_o & n11271_o;
  -- ../fixed_pkg.vhd:9:14
  n11279_o <= n11273_o & n11274_o & n11275_o & n11276_o;
  -- ../fixed_pkg.vhd:171:18
  n11280_o <= n11277_o & n11278_o & n11272_o;
  -- ../fixed_pkg.vhd:185:17
  n11281_o <= n11279_o & n11280_o;
  -- ../fixed_pkg.vhd:170:18
  n11282_o <= n11281_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n11283_o <= n11215_o (40 downto 16);
  -- ../fixed_pkg.vhd:169:40
  n11284_o <= n11216_o & n11282_o;
  -- ../fixed_pkg.vhd:195:9
  n11285_o <= n11283_o when n11237_o = '0' else n11284_o;
  -- ../fixed_pkg.vhd:268:100
  n11301_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n11304_o <= std_logic_vector (resize (signed (n11301_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n11316_o <= std_logic_vector (resize (signed (n11285_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n11319_o <= std_logic_vector (resize (signed (n11316_o) * signed'("0000000000011111111111111100101101011111100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n11336_o <= std_logic_vector (resize (signed (n11304_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n11351_o <= std_logic_vector (resize (signed (n11319_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n11366_o <= std_logic_vector (unsigned (n11336_o) - unsigned (n11351_o));
  -- ../fixed_pkg.vhd:168:39
  n11377_o <= n11366_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11378_o <= n11366_o (43);
  -- ../fixed_pkg.vhd:185:23
  n11382_o <= n11366_o (42);
  -- ../fixed_pkg.vhd:185:27
  n11383_o <= '1' when n11382_o /= n11378_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n11390_o <= '0' when n11383_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n11396_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11397_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11398_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11399_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11400_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11401_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11402_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11403_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11404_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11405_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11406_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11407_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11408_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11409_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11410_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11411_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11412_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11413_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11414_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11415_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11416_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11417_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11418_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11419_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11420_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11421_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11422_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11423_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11424_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11425_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11426_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11427_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11428_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11429_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11430_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11431_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11432_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11433_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11434_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11435_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11436_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11437_o <= not n11378_o;
  -- ../fixed_pkg.vhd:196:31
  n11438_o <= not n11378_o;
  -- ../fixed_pkg.vhd:9:14
  n11439_o <= n11396_o & n11397_o & n11398_o & n11399_o;
  -- ../fixed_pkg.vhd:24:14
  n11440_o <= n11400_o & n11401_o & n11402_o & n11403_o;
  -- ../fixed_pkg.vhd:24:14
  n11441_o <= n11404_o & n11405_o & n11406_o & n11407_o;
  -- ../fixed_pkg.vhd:185:17
  n11442_o <= n11408_o & n11409_o & n11410_o & n11411_o;
  -- ../fixed_pkg.vhd:24:14
  n11443_o <= n11412_o & n11413_o & n11414_o & n11415_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n11444_o <= n11416_o & n11417_o & n11418_o & n11419_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n11445_o <= n11420_o & n11421_o & n11422_o & n11423_o;
  -- ../fixed_pkg.vhd:185:17
  n11446_o <= n11424_o & n11425_o & n11426_o & n11427_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n11447_o <= n11428_o & n11429_o & n11430_o & n11431_o;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n11448_o <= n11432_o & n11433_o & n11434_o & n11435_o;
  -- ../BiquadFilter/BiquadFilter.vhd:53:18
  n11449_o <= n11436_o & n11437_o & n11438_o;
  n11450_o <= n11439_o & n11440_o & n11441_o & n11442_o;
  -- ../fixed_pkg.vhd:24:14
  n11451_o <= n11443_o & n11444_o & n11445_o & n11446_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n11452_o <= n11447_o & n11448_o & n11449_o;
  n11453_o <= n11450_o & n11451_o & n11452_o;
  n11454_o <= n11453_o (41 downto 0);
  n11455_o <= n11378_o & n11454_o;
  -- ../fixed_pkg.vhd:195:9
  n11456_o <= n11377_o when n11390_o = '0' else n11455_o;
  -- ../fixed_pkg.vhd:168:39
  n11474_o <= std_logic_vector (resize (signed (n11456_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n11489_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n11494_o <= n11493_o (15 downto 0);
  n11495_o <= n11489_o & n11494_o;
  -- ../fixed_pkg.vhd:257:67
  n11506_o <= std_logic_vector (unsigned (n11474_o) + unsigned (n11495_o));
  -- ../fixed_pkg.vhd:168:39
  n11517_o <= n11506_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11518_o <= n11506_o (43);
  -- ../fixed_pkg.vhd:185:23
  n11522_o <= n11506_o (42);
  -- ../fixed_pkg.vhd:185:27
  n11523_o <= '1' when n11522_o /= n11518_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n11530_o <= '0' when n11523_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n11536_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11537_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11538_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11539_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11540_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11541_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11542_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11543_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11544_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11545_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11546_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11547_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11548_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11549_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11550_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11551_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11552_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11553_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11554_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11555_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11556_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11557_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11558_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11559_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11560_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11561_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11562_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11563_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11564_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11565_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11566_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11567_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11568_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11569_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11570_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11571_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11572_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11573_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11574_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11575_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11576_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11577_o <= not n11518_o;
  -- ../fixed_pkg.vhd:196:31
  n11578_o <= not n11518_o;
  n11579_o <= n11536_o & n11537_o & n11538_o & n11539_o;
  n11580_o <= n11540_o & n11541_o & n11542_o & n11543_o;
  n11581_o <= n11544_o & n11545_o & n11546_o & n11547_o;
  n11582_o <= n11548_o & n11549_o & n11550_o & n11551_o;
  n11583_o <= n11552_o & n11553_o & n11554_o & n11555_o;
  n11584_o <= n11556_o & n11557_o & n11558_o & n11559_o;
  n11585_o <= n11560_o & n11561_o & n11562_o & n11563_o;
  n11586_o <= n11564_o & n11565_o & n11566_o & n11567_o;
  n11587_o <= n11568_o & n11569_o & n11570_o & n11571_o;
  n11588_o <= n11572_o & n11573_o & n11574_o & n11575_o;
  n11589_o <= n11576_o & n11577_o & n11578_o;
  n11590_o <= n11579_o & n11580_o & n11581_o & n11582_o;
  n11591_o <= n11583_o & n11584_o & n11585_o & n11586_o;
  n11592_o <= n11587_o & n11588_o & n11589_o;
  n11593_o <= n11590_o & n11591_o & n11592_o;
  n11594_o <= n11593_o (41 downto 0);
  n11595_o <= n11518_o & n11594_o;
  -- ../fixed_pkg.vhd:195:9
  n11596_o <= n11517_o when n11530_o = '0' else n11595_o;
  -- ../fixed_pkg.vhd:168:39
  n11612_o <= n11596_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11613_o <= n11596_o (42);
  -- ../fixed_pkg.vhd:185:23
  n11617_o <= n11596_o (41);
  -- ../fixed_pkg.vhd:185:27
  n11618_o <= '1' when n11617_o /= n11613_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n11625_o <= '0' when n11618_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n11629_o <= '1' when n11618_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n11631_o <= n11596_o (40);
  -- ../fixed_pkg.vhd:185:27
  n11632_o <= '1' when n11631_o /= n11613_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n11634_o <= n11625_o when n11643_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n11640_o <= n11632_o and n11629_o;
  -- ../fixed_pkg.vhd:185:17
  n11643_o <= n11629_o and n11640_o;
  -- ../fixed_pkg.vhd:196:31
  n11645_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11646_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11647_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11648_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11649_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11650_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11651_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11652_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11653_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11654_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11655_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11656_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11657_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11658_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11659_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11660_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11661_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11662_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11663_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11664_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11665_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11666_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11667_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11668_o <= not n11613_o;
  -- ../fixed_pkg.vhd:196:31
  n11669_o <= not n11613_o;
  n11670_o <= n11645_o & n11646_o & n11647_o & n11648_o;
  n11671_o <= n11649_o & n11650_o & n11651_o & n11652_o;
  n11672_o <= n11653_o & n11654_o & n11655_o & n11656_o;
  n11673_o <= n11657_o & n11658_o & n11659_o & n11660_o;
  n11674_o <= n11661_o & n11662_o & n11663_o & n11664_o;
  n11675_o <= n11665_o & n11666_o & n11667_o & n11668_o;
  n11676_o <= n11670_o & n11671_o & n11672_o & n11673_o;
  n11677_o <= n11674_o & n11675_o & n11669_o;
  n11678_o <= n11676_o & n11677_o;
  n11679_o <= n11678_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n11680_o <= n11612_o (40 downto 16);
  n11681_o <= n11613_o & n11679_o;
  -- ../fixed_pkg.vhd:195:9
  n11682_o <= n11680_o when n11634_o = '0' else n11681_o;
  -- ../fixed_pkg.vhd:268:100
  n11697_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n11700_o <= std_logic_vector (resize (signed (n11697_o) * signed'("0000000000011111111111111111111100101010010"), 43));
  -- ../fixed_pkg.vhd:268:100
  n11712_o <= std_logic_vector (resize (signed (n11285_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n11715_o <= std_logic_vector (resize (signed (n11712_o) * signed'("0000000000000000000000000001111001010100100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n11732_o <= std_logic_vector (resize (signed (n11700_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n11747_o <= std_logic_vector (resize (signed (n11715_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n11762_o <= std_logic_vector (unsigned (n11732_o) - unsigned (n11747_o));
  -- ../fixed_pkg.vhd:168:39
  n11773_o <= n11762_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11774_o <= n11762_o (43);
  -- ../fixed_pkg.vhd:185:23
  n11778_o <= n11762_o (42);
  -- ../fixed_pkg.vhd:185:27
  n11779_o <= '1' when n11778_o /= n11774_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n11786_o <= '0' when n11779_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n11792_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11793_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11794_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11795_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11796_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11797_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11798_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11799_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11800_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11801_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11802_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11803_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11804_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11805_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11806_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11807_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11808_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11809_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11810_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11811_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11812_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11813_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11814_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11815_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11816_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11817_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11818_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11819_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11820_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11821_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11822_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11823_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11824_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11825_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11826_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11827_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11828_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11829_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11830_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11831_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11832_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11833_o <= not n11774_o;
  -- ../fixed_pkg.vhd:196:31
  n11834_o <= not n11774_o;
  n11835_o <= n11792_o & n11793_o & n11794_o & n11795_o;
  n11836_o <= n11796_o & n11797_o & n11798_o & n11799_o;
  n11837_o <= n11800_o & n11801_o & n11802_o & n11803_o;
  n11838_o <= n11804_o & n11805_o & n11806_o & n11807_o;
  n11839_o <= n11808_o & n11809_o & n11810_o & n11811_o;
  n11840_o <= n11812_o & n11813_o & n11814_o & n11815_o;
  n11841_o <= n11816_o & n11817_o & n11818_o & n11819_o;
  n11842_o <= n11820_o & n11821_o & n11822_o & n11823_o;
  n11843_o <= n11824_o & n11825_o & n11826_o & n11827_o;
  n11844_o <= n11828_o & n11829_o & n11830_o & n11831_o;
  n11845_o <= n11832_o & n11833_o & n11834_o;
  n11846_o <= n11835_o & n11836_o & n11837_o & n11838_o;
  n11847_o <= n11839_o & n11840_o & n11841_o & n11842_o;
  n11848_o <= n11843_o & n11844_o & n11845_o;
  n11849_o <= n11846_o & n11847_o & n11848_o;
  n11850_o <= n11849_o (41 downto 0);
  n11851_o <= n11774_o & n11850_o;
  -- ../fixed_pkg.vhd:195:9
  n11852_o <= n11773_o when n11786_o = '0' else n11851_o;
  -- ../fixed_pkg.vhd:168:39
  n11868_o <= n11852_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11869_o <= n11852_o (42);
  -- ../fixed_pkg.vhd:185:23
  n11873_o <= n11852_o (41);
  -- ../fixed_pkg.vhd:185:27
  n11874_o <= '1' when n11873_o /= n11869_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n11881_o <= '0' when n11874_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n11885_o <= '1' when n11874_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n11887_o <= n11852_o (40);
  -- ../fixed_pkg.vhd:185:27
  n11888_o <= '1' when n11887_o /= n11869_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n11890_o <= n11881_o when n11899_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n11896_o <= n11888_o and n11885_o;
  -- ../fixed_pkg.vhd:185:17
  n11899_o <= n11885_o and n11896_o;
  -- ../fixed_pkg.vhd:196:31
  n11901_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11902_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11903_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11904_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11905_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11906_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11907_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11908_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11909_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11910_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11911_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11912_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11913_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11914_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11915_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11916_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11917_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11918_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11919_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11920_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11921_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11922_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11923_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11924_o <= not n11869_o;
  -- ../fixed_pkg.vhd:196:31
  n11925_o <= not n11869_o;
  n11926_o <= n11901_o & n11902_o & n11903_o & n11904_o;
  n11927_o <= n11905_o & n11906_o & n11907_o & n11908_o;
  n11928_o <= n11909_o & n11910_o & n11911_o & n11912_o;
  n11929_o <= n11913_o & n11914_o & n11915_o & n11916_o;
  n11930_o <= n11917_o & n11918_o & n11919_o & n11920_o;
  n11931_o <= n11921_o & n11922_o & n11923_o & n11924_o;
  n11932_o <= n11926_o & n11927_o & n11928_o & n11929_o;
  n11933_o <= n11930_o & n11931_o & n11925_o;
  n11934_o <= n11932_o & n11933_o;
  n11935_o <= n11934_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n11936_o <= n11868_o (40 downto 16);
  n11937_o <= n11869_o & n11935_o;
  -- ../fixed_pkg.vhd:195:9
  n11938_o <= n11936_o when n11890_o = '0' else n11937_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n11941_o <= '1' when state_reg = "01" else '0';
  n11942_o <= n11941_o & n11043_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n11942_o select n11943_o <=
    x_reg when "10",
    n11041_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n11942_o select n11944_o <=
    n11285_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n11942_o select n11945_o <=
    n11682_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n11942_o select n11946_o <=
    n11938_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n11961_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n11962_o <= x_reg when n11961_o = '0' else n11943_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n11963_q <= n11962_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n11964_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n11965_o <= y_reg when n11964_o = '0' else n11944_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n11966_q <= n11965_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n11967_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n11967_q <= n11945_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n11968_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n11968_q <= n11946_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n11987_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11988_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n11992_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n11993_o <= '1' when n11992_o /= n11988_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12000_o <= '0' when n11993_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n12004_o <= '1' when n11993_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n12006_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n12007_o <= '1' when n12006_o /= n11988_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n12009_o <= n12000_o when n12018_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n12015_o <= n12007_o and n12004_o;
  -- ../fixed_pkg.vhd:185:17
  n12018_o <= n12004_o and n12015_o;
  -- ../fixed_pkg.vhd:196:31
  n12020_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12021_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12022_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12023_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12024_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12025_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12026_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12027_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12028_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12029_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12030_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12031_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12032_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12033_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12034_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12035_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12036_o <= not n11988_o;
  -- ../fixed_pkg.vhd:196:31
  n12037_o <= not n11988_o;
  n12038_o <= n12020_o & n12021_o & n12022_o & n12023_o;
  n12039_o <= n12024_o & n12025_o & n12026_o & n12027_o;
  n12040_o <= n12028_o & n12029_o & n12030_o & n12031_o;
  n12041_o <= n12032_o & n12033_o & n12034_o & n12035_o;
  n12042_o <= n12036_o & n12037_o;
  n12043_o <= n12038_o & n12039_o & n12040_o & n12041_o;
  n12044_o <= n12043_o & n12042_o;
  n12045_o <= n12044_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n12046_o <= n11987_o (22 downto 5);
  n12047_o <= n11988_o & n12045_o;
  -- ../fixed_pkg.vhd:195:9
  n12048_o <= n12046_o when n12009_o = '0' else n12047_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_ec985945a1ffc882d4b5d12ff1518d1a793a38b9 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_ec985945a1ffc882d4b5d12ff1518d1a793a38b9;

architecture rtl of biquadfilter_ec985945a1ffc882d4b5d12ff1518d1a793a38b9 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n9920_o : std_logic_vector (1 downto 0);
  signal n9922_o : std_logic;
  signal n9924_o : std_logic;
  signal n9926_o : std_logic_vector (1 downto 0);
  signal n9928_o : std_logic;
  signal n9929_o : std_logic_vector (2 downto 0);
  signal n9932_o : std_logic_vector (1 downto 0);
  signal n9937_q : std_logic_vector (1 downto 0);
  signal n9940_o : std_logic;
  signal n9941_o : std_logic;
  signal n9945_o : std_logic;
  signal n9946_o : std_logic;
  signal n9966_o : std_logic_vector (19 downto 0);
  constant n9970_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n9971_o : std_logic_vector (4 downto 0);
  signal n9972_o : std_logic_vector (24 downto 0);
  signal n9973_o : std_logic_vector (24 downto 0);
  signal n9975_o : std_logic;
  signal n9989_o : std_logic_vector (42 downto 0);
  signal n9992_o : std_logic_vector (42 downto 0);
  signal n10009_o : std_logic_vector (43 downto 0);
  signal n10024_o : std_logic_vector (27 downto 0);
  constant n10028_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n10029_o : std_logic_vector (15 downto 0);
  signal n10030_o : std_logic_vector (43 downto 0);
  signal n10041_o : std_logic_vector (43 downto 0);
  signal n10052_o : std_logic_vector (42 downto 0);
  signal n10053_o : std_logic;
  signal n10057_o : std_logic;
  signal n10058_o : std_logic;
  signal n10065_o : std_logic;
  signal n10071_o : std_logic;
  signal n10072_o : std_logic;
  signal n10073_o : std_logic;
  signal n10074_o : std_logic;
  signal n10075_o : std_logic;
  signal n10076_o : std_logic;
  signal n10077_o : std_logic;
  signal n10078_o : std_logic;
  signal n10079_o : std_logic;
  signal n10080_o : std_logic;
  signal n10081_o : std_logic;
  signal n10082_o : std_logic;
  signal n10083_o : std_logic;
  signal n10084_o : std_logic;
  signal n10085_o : std_logic;
  signal n10086_o : std_logic;
  signal n10087_o : std_logic;
  signal n10088_o : std_logic;
  signal n10089_o : std_logic;
  signal n10090_o : std_logic;
  signal n10091_o : std_logic;
  signal n10092_o : std_logic;
  signal n10093_o : std_logic;
  signal n10094_o : std_logic;
  signal n10095_o : std_logic;
  signal n10096_o : std_logic;
  signal n10097_o : std_logic;
  signal n10098_o : std_logic;
  signal n10099_o : std_logic;
  signal n10100_o : std_logic;
  signal n10101_o : std_logic;
  signal n10102_o : std_logic;
  signal n10103_o : std_logic;
  signal n10104_o : std_logic;
  signal n10105_o : std_logic;
  signal n10106_o : std_logic;
  signal n10107_o : std_logic;
  signal n10108_o : std_logic;
  signal n10109_o : std_logic;
  signal n10110_o : std_logic;
  signal n10111_o : std_logic;
  signal n10112_o : std_logic;
  signal n10113_o : std_logic;
  signal n10114_o : std_logic_vector (3 downto 0);
  signal n10115_o : std_logic_vector (3 downto 0);
  signal n10116_o : std_logic_vector (3 downto 0);
  signal n10117_o : std_logic_vector (3 downto 0);
  signal n10118_o : std_logic_vector (3 downto 0);
  signal n10119_o : std_logic_vector (3 downto 0);
  signal n10120_o : std_logic_vector (3 downto 0);
  signal n10121_o : std_logic_vector (3 downto 0);
  signal n10122_o : std_logic_vector (3 downto 0);
  signal n10123_o : std_logic_vector (3 downto 0);
  signal n10124_o : std_logic_vector (2 downto 0);
  signal n10125_o : std_logic_vector (15 downto 0);
  signal n10126_o : std_logic_vector (15 downto 0);
  signal n10127_o : std_logic_vector (10 downto 0);
  signal n10128_o : std_logic_vector (42 downto 0);
  signal n10129_o : std_logic_vector (41 downto 0);
  signal n10130_o : std_logic_vector (42 downto 0);
  signal n10131_o : std_logic_vector (42 downto 0);
  signal n10147_o : std_logic_vector (40 downto 0);
  signal n10148_o : std_logic;
  signal n10152_o : std_logic;
  signal n10153_o : std_logic;
  signal n10160_o : std_logic;
  signal n10164_o : std_logic;
  signal n10166_o : std_logic;
  signal n10167_o : std_logic;
  signal n10169_o : std_logic;
  signal n10175_o : std_logic;
  signal n10178_o : std_logic;
  signal n10180_o : std_logic;
  signal n10181_o : std_logic;
  signal n10182_o : std_logic;
  signal n10183_o : std_logic;
  signal n10184_o : std_logic;
  signal n10185_o : std_logic;
  signal n10186_o : std_logic;
  signal n10187_o : std_logic;
  signal n10188_o : std_logic;
  signal n10189_o : std_logic;
  signal n10190_o : std_logic;
  signal n10191_o : std_logic;
  signal n10192_o : std_logic;
  signal n10193_o : std_logic;
  signal n10194_o : std_logic;
  signal n10195_o : std_logic;
  signal n10196_o : std_logic;
  signal n10197_o : std_logic;
  signal n10198_o : std_logic;
  signal n10199_o : std_logic;
  signal n10200_o : std_logic;
  signal n10201_o : std_logic;
  signal n10202_o : std_logic;
  signal n10203_o : std_logic;
  signal n10204_o : std_logic;
  signal n10205_o : std_logic_vector (3 downto 0);
  signal n10206_o : std_logic_vector (3 downto 0);
  signal n10207_o : std_logic_vector (3 downto 0);
  signal n10208_o : std_logic_vector (3 downto 0);
  signal n10209_o : std_logic_vector (3 downto 0);
  signal n10210_o : std_logic_vector (3 downto 0);
  signal n10211_o : std_logic_vector (15 downto 0);
  signal n10212_o : std_logic_vector (8 downto 0);
  signal n10213_o : std_logic_vector (24 downto 0);
  signal n10214_o : std_logic_vector (23 downto 0);
  signal n10215_o : std_logic_vector (24 downto 0);
  signal n10216_o : std_logic_vector (24 downto 0);
  signal n10217_o : std_logic_vector (24 downto 0);
  signal n10233_o : std_logic_vector (42 downto 0);
  signal n10236_o : std_logic_vector (42 downto 0);
  signal n10248_o : std_logic_vector (42 downto 0);
  signal n10251_o : std_logic_vector (42 downto 0);
  signal n10268_o : std_logic_vector (43 downto 0);
  signal n10283_o : std_logic_vector (43 downto 0);
  signal n10298_o : std_logic_vector (43 downto 0);
  signal n10309_o : std_logic_vector (42 downto 0);
  signal n10310_o : std_logic;
  signal n10314_o : std_logic;
  signal n10315_o : std_logic;
  signal n10322_o : std_logic;
  signal n10328_o : std_logic;
  signal n10329_o : std_logic;
  signal n10330_o : std_logic;
  signal n10331_o : std_logic;
  signal n10332_o : std_logic;
  signal n10333_o : std_logic;
  signal n10334_o : std_logic;
  signal n10335_o : std_logic;
  signal n10336_o : std_logic;
  signal n10337_o : std_logic;
  signal n10338_o : std_logic;
  signal n10339_o : std_logic;
  signal n10340_o : std_logic;
  signal n10341_o : std_logic;
  signal n10342_o : std_logic;
  signal n10343_o : std_logic;
  signal n10344_o : std_logic;
  signal n10345_o : std_logic;
  signal n10346_o : std_logic;
  signal n10347_o : std_logic;
  signal n10348_o : std_logic;
  signal n10349_o : std_logic;
  signal n10350_o : std_logic;
  signal n10351_o : std_logic;
  signal n10352_o : std_logic;
  signal n10353_o : std_logic;
  signal n10354_o : std_logic;
  signal n10355_o : std_logic;
  signal n10356_o : std_logic;
  signal n10357_o : std_logic;
  signal n10358_o : std_logic;
  signal n10359_o : std_logic;
  signal n10360_o : std_logic;
  signal n10361_o : std_logic;
  signal n10362_o : std_logic;
  signal n10363_o : std_logic;
  signal n10364_o : std_logic;
  signal n10365_o : std_logic;
  signal n10366_o : std_logic;
  signal n10367_o : std_logic;
  signal n10368_o : std_logic;
  signal n10369_o : std_logic;
  signal n10370_o : std_logic;
  signal n10371_o : std_logic_vector (3 downto 0);
  signal n10372_o : std_logic_vector (3 downto 0);
  signal n10373_o : std_logic_vector (3 downto 0);
  signal n10374_o : std_logic_vector (3 downto 0);
  signal n10375_o : std_logic_vector (3 downto 0);
  signal n10376_o : std_logic_vector (3 downto 0);
  signal n10377_o : std_logic_vector (3 downto 0);
  signal n10378_o : std_logic_vector (3 downto 0);
  signal n10379_o : std_logic_vector (3 downto 0);
  signal n10380_o : std_logic_vector (3 downto 0);
  signal n10381_o : std_logic_vector (2 downto 0);
  signal n10382_o : std_logic_vector (15 downto 0);
  signal n10383_o : std_logic_vector (15 downto 0);
  signal n10384_o : std_logic_vector (10 downto 0);
  signal n10385_o : std_logic_vector (42 downto 0);
  signal n10386_o : std_logic_vector (41 downto 0);
  signal n10387_o : std_logic_vector (42 downto 0);
  signal n10388_o : std_logic_vector (42 downto 0);
  signal n10406_o : std_logic_vector (43 downto 0);
  signal n10421_o : std_logic_vector (27 downto 0);
  constant n10425_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n10426_o : std_logic_vector (15 downto 0);
  signal n10427_o : std_logic_vector (43 downto 0);
  signal n10438_o : std_logic_vector (43 downto 0);
  signal n10449_o : std_logic_vector (42 downto 0);
  signal n10450_o : std_logic;
  signal n10454_o : std_logic;
  signal n10455_o : std_logic;
  signal n10462_o : std_logic;
  signal n10468_o : std_logic;
  signal n10469_o : std_logic;
  signal n10470_o : std_logic;
  signal n10471_o : std_logic;
  signal n10472_o : std_logic;
  signal n10473_o : std_logic;
  signal n10474_o : std_logic;
  signal n10475_o : std_logic;
  signal n10476_o : std_logic;
  signal n10477_o : std_logic;
  signal n10478_o : std_logic;
  signal n10479_o : std_logic;
  signal n10480_o : std_logic;
  signal n10481_o : std_logic;
  signal n10482_o : std_logic;
  signal n10483_o : std_logic;
  signal n10484_o : std_logic;
  signal n10485_o : std_logic;
  signal n10486_o : std_logic;
  signal n10487_o : std_logic;
  signal n10488_o : std_logic;
  signal n10489_o : std_logic;
  signal n10490_o : std_logic;
  signal n10491_o : std_logic;
  signal n10492_o : std_logic;
  signal n10493_o : std_logic;
  signal n10494_o : std_logic;
  signal n10495_o : std_logic;
  signal n10496_o : std_logic;
  signal n10497_o : std_logic;
  signal n10498_o : std_logic;
  signal n10499_o : std_logic;
  signal n10500_o : std_logic;
  signal n10501_o : std_logic;
  signal n10502_o : std_logic;
  signal n10503_o : std_logic;
  signal n10504_o : std_logic;
  signal n10505_o : std_logic;
  signal n10506_o : std_logic;
  signal n10507_o : std_logic;
  signal n10508_o : std_logic;
  signal n10509_o : std_logic;
  signal n10510_o : std_logic;
  signal n10511_o : std_logic_vector (3 downto 0);
  signal n10512_o : std_logic_vector (3 downto 0);
  signal n10513_o : std_logic_vector (3 downto 0);
  signal n10514_o : std_logic_vector (3 downto 0);
  signal n10515_o : std_logic_vector (3 downto 0);
  signal n10516_o : std_logic_vector (3 downto 0);
  signal n10517_o : std_logic_vector (3 downto 0);
  signal n10518_o : std_logic_vector (3 downto 0);
  signal n10519_o : std_logic_vector (3 downto 0);
  signal n10520_o : std_logic_vector (3 downto 0);
  signal n10521_o : std_logic_vector (2 downto 0);
  signal n10522_o : std_logic_vector (15 downto 0);
  signal n10523_o : std_logic_vector (15 downto 0);
  signal n10524_o : std_logic_vector (10 downto 0);
  signal n10525_o : std_logic_vector (42 downto 0);
  signal n10526_o : std_logic_vector (41 downto 0);
  signal n10527_o : std_logic_vector (42 downto 0);
  signal n10528_o : std_logic_vector (42 downto 0);
  signal n10544_o : std_logic_vector (40 downto 0);
  signal n10545_o : std_logic;
  signal n10549_o : std_logic;
  signal n10550_o : std_logic;
  signal n10557_o : std_logic;
  signal n10561_o : std_logic;
  signal n10563_o : std_logic;
  signal n10564_o : std_logic;
  signal n10566_o : std_logic;
  signal n10572_o : std_logic;
  signal n10575_o : std_logic;
  signal n10577_o : std_logic;
  signal n10578_o : std_logic;
  signal n10579_o : std_logic;
  signal n10580_o : std_logic;
  signal n10581_o : std_logic;
  signal n10582_o : std_logic;
  signal n10583_o : std_logic;
  signal n10584_o : std_logic;
  signal n10585_o : std_logic;
  signal n10586_o : std_logic;
  signal n10587_o : std_logic;
  signal n10588_o : std_logic;
  signal n10589_o : std_logic;
  signal n10590_o : std_logic;
  signal n10591_o : std_logic;
  signal n10592_o : std_logic;
  signal n10593_o : std_logic;
  signal n10594_o : std_logic;
  signal n10595_o : std_logic;
  signal n10596_o : std_logic;
  signal n10597_o : std_logic;
  signal n10598_o : std_logic;
  signal n10599_o : std_logic;
  signal n10600_o : std_logic;
  signal n10601_o : std_logic;
  signal n10602_o : std_logic_vector (3 downto 0);
  signal n10603_o : std_logic_vector (3 downto 0);
  signal n10604_o : std_logic_vector (3 downto 0);
  signal n10605_o : std_logic_vector (3 downto 0);
  signal n10606_o : std_logic_vector (3 downto 0);
  signal n10607_o : std_logic_vector (3 downto 0);
  signal n10608_o : std_logic_vector (15 downto 0);
  signal n10609_o : std_logic_vector (8 downto 0);
  signal n10610_o : std_logic_vector (24 downto 0);
  signal n10611_o : std_logic_vector (23 downto 0);
  signal n10612_o : std_logic_vector (24 downto 0);
  signal n10613_o : std_logic_vector (24 downto 0);
  signal n10614_o : std_logic_vector (24 downto 0);
  signal n10629_o : std_logic_vector (42 downto 0);
  signal n10632_o : std_logic_vector (42 downto 0);
  signal n10644_o : std_logic_vector (42 downto 0);
  signal n10647_o : std_logic_vector (42 downto 0);
  signal n10664_o : std_logic_vector (43 downto 0);
  signal n10679_o : std_logic_vector (43 downto 0);
  signal n10694_o : std_logic_vector (43 downto 0);
  signal n10705_o : std_logic_vector (42 downto 0);
  signal n10706_o : std_logic;
  signal n10710_o : std_logic;
  signal n10711_o : std_logic;
  signal n10718_o : std_logic;
  signal n10724_o : std_logic;
  signal n10725_o : std_logic;
  signal n10726_o : std_logic;
  signal n10727_o : std_logic;
  signal n10728_o : std_logic;
  signal n10729_o : std_logic;
  signal n10730_o : std_logic;
  signal n10731_o : std_logic;
  signal n10732_o : std_logic;
  signal n10733_o : std_logic;
  signal n10734_o : std_logic;
  signal n10735_o : std_logic;
  signal n10736_o : std_logic;
  signal n10737_o : std_logic;
  signal n10738_o : std_logic;
  signal n10739_o : std_logic;
  signal n10740_o : std_logic;
  signal n10741_o : std_logic;
  signal n10742_o : std_logic;
  signal n10743_o : std_logic;
  signal n10744_o : std_logic;
  signal n10745_o : std_logic;
  signal n10746_o : std_logic;
  signal n10747_o : std_logic;
  signal n10748_o : std_logic;
  signal n10749_o : std_logic;
  signal n10750_o : std_logic;
  signal n10751_o : std_logic;
  signal n10752_o : std_logic;
  signal n10753_o : std_logic;
  signal n10754_o : std_logic;
  signal n10755_o : std_logic;
  signal n10756_o : std_logic;
  signal n10757_o : std_logic;
  signal n10758_o : std_logic;
  signal n10759_o : std_logic;
  signal n10760_o : std_logic;
  signal n10761_o : std_logic;
  signal n10762_o : std_logic;
  signal n10763_o : std_logic;
  signal n10764_o : std_logic;
  signal n10765_o : std_logic;
  signal n10766_o : std_logic;
  signal n10767_o : std_logic_vector (3 downto 0);
  signal n10768_o : std_logic_vector (3 downto 0);
  signal n10769_o : std_logic_vector (3 downto 0);
  signal n10770_o : std_logic_vector (3 downto 0);
  signal n10771_o : std_logic_vector (3 downto 0);
  signal n10772_o : std_logic_vector (3 downto 0);
  signal n10773_o : std_logic_vector (3 downto 0);
  signal n10774_o : std_logic_vector (3 downto 0);
  signal n10775_o : std_logic_vector (3 downto 0);
  signal n10776_o : std_logic_vector (3 downto 0);
  signal n10777_o : std_logic_vector (2 downto 0);
  signal n10778_o : std_logic_vector (15 downto 0);
  signal n10779_o : std_logic_vector (15 downto 0);
  signal n10780_o : std_logic_vector (10 downto 0);
  signal n10781_o : std_logic_vector (42 downto 0);
  signal n10782_o : std_logic_vector (41 downto 0);
  signal n10783_o : std_logic_vector (42 downto 0);
  signal n10784_o : std_logic_vector (42 downto 0);
  signal n10800_o : std_logic_vector (40 downto 0);
  signal n10801_o : std_logic;
  signal n10805_o : std_logic;
  signal n10806_o : std_logic;
  signal n10813_o : std_logic;
  signal n10817_o : std_logic;
  signal n10819_o : std_logic;
  signal n10820_o : std_logic;
  signal n10822_o : std_logic;
  signal n10828_o : std_logic;
  signal n10831_o : std_logic;
  signal n10833_o : std_logic;
  signal n10834_o : std_logic;
  signal n10835_o : std_logic;
  signal n10836_o : std_logic;
  signal n10837_o : std_logic;
  signal n10838_o : std_logic;
  signal n10839_o : std_logic;
  signal n10840_o : std_logic;
  signal n10841_o : std_logic;
  signal n10842_o : std_logic;
  signal n10843_o : std_logic;
  signal n10844_o : std_logic;
  signal n10845_o : std_logic;
  signal n10846_o : std_logic;
  signal n10847_o : std_logic;
  signal n10848_o : std_logic;
  signal n10849_o : std_logic;
  signal n10850_o : std_logic;
  signal n10851_o : std_logic;
  signal n10852_o : std_logic;
  signal n10853_o : std_logic;
  signal n10854_o : std_logic;
  signal n10855_o : std_logic;
  signal n10856_o : std_logic;
  signal n10857_o : std_logic;
  signal n10858_o : std_logic_vector (3 downto 0);
  signal n10859_o : std_logic_vector (3 downto 0);
  signal n10860_o : std_logic_vector (3 downto 0);
  signal n10861_o : std_logic_vector (3 downto 0);
  signal n10862_o : std_logic_vector (3 downto 0);
  signal n10863_o : std_logic_vector (3 downto 0);
  signal n10864_o : std_logic_vector (15 downto 0);
  signal n10865_o : std_logic_vector (8 downto 0);
  signal n10866_o : std_logic_vector (24 downto 0);
  signal n10867_o : std_logic_vector (23 downto 0);
  signal n10868_o : std_logic_vector (24 downto 0);
  signal n10869_o : std_logic_vector (24 downto 0);
  signal n10870_o : std_logic_vector (24 downto 0);
  signal n10873_o : std_logic;
  signal n10874_o : std_logic_vector (1 downto 0);
  signal n10875_o : std_logic_vector (24 downto 0);
  signal n10876_o : std_logic_vector (24 downto 0);
  signal n10877_o : std_logic_vector (24 downto 0);
  signal n10878_o : std_logic_vector (24 downto 0);
  signal n10893_o : std_logic;
  signal n10894_o : std_logic_vector (24 downto 0);
  signal n10895_q : std_logic_vector (24 downto 0);
  signal n10896_o : std_logic;
  signal n10897_o : std_logic_vector (24 downto 0);
  signal n10898_q : std_logic_vector (24 downto 0);
  signal n10899_q : std_logic_vector (24 downto 0);
  signal n10900_q : std_logic_vector (24 downto 0);
  signal n10919_o : std_logic_vector (22 downto 0);
  signal n10920_o : std_logic;
  signal n10924_o : std_logic;
  signal n10925_o : std_logic;
  signal n10932_o : std_logic;
  signal n10936_o : std_logic;
  signal n10938_o : std_logic;
  signal n10939_o : std_logic;
  signal n10941_o : std_logic;
  signal n10947_o : std_logic;
  signal n10950_o : std_logic;
  signal n10952_o : std_logic;
  signal n10953_o : std_logic;
  signal n10954_o : std_logic;
  signal n10955_o : std_logic;
  signal n10956_o : std_logic;
  signal n10957_o : std_logic;
  signal n10958_o : std_logic;
  signal n10959_o : std_logic;
  signal n10960_o : std_logic;
  signal n10961_o : std_logic;
  signal n10962_o : std_logic;
  signal n10963_o : std_logic;
  signal n10964_o : std_logic;
  signal n10965_o : std_logic;
  signal n10966_o : std_logic;
  signal n10967_o : std_logic;
  signal n10968_o : std_logic;
  signal n10969_o : std_logic;
  signal n10970_o : std_logic_vector (3 downto 0);
  signal n10971_o : std_logic_vector (3 downto 0);
  signal n10972_o : std_logic_vector (3 downto 0);
  signal n10973_o : std_logic_vector (3 downto 0);
  signal n10974_o : std_logic_vector (1 downto 0);
  signal n10975_o : std_logic_vector (15 downto 0);
  signal n10976_o : std_logic_vector (17 downto 0);
  signal n10977_o : std_logic_vector (16 downto 0);
  signal n10978_o : std_logic_vector (17 downto 0);
  signal n10979_o : std_logic_vector (17 downto 0);
  signal n10980_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n9941_o;
  valid_o <= n9946_o;
  data_o <= n10980_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n9937_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n10895_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n10898_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n10899_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n10900_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n9920_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n9922_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n9924_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n9926_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n9928_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:170:18
  n9929_o <= n9928_o & n9924_o & n9922_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n9929_o select n9932_o <=
    n9926_o when "100",
    "10" when "010",
    n9920_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n9937_q <= "00";
    elsif rising_edge (clk_i) then
      n9937_q <= n9932_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n9940_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n9941_o <= '0' when n9940_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n9945_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n9946_o <= '0' when n9945_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n9966_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n9971_o <= n9970_o (4 downto 0);
  n9972_o <= n9966_o & n9971_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n9973_o <= x_reg when valid_i = '0' else n9972_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n9975_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n9989_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n9992_o <= std_logic_vector (resize (signed (n9989_o) * signed'("0000000000000000000000000000000011000000101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n10009_o <= std_logic_vector (resize (signed (n9992_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n10024_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n10029_o <= n10028_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n10030_o <= n10024_o & n10029_o;
  -- ../fixed_pkg.vhd:257:67
  n10041_o <= std_logic_vector (unsigned (n10009_o) + unsigned (n10030_o));
  -- ../fixed_pkg.vhd:168:39
  n10052_o <= n10041_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10053_o <= n10041_o (43);
  -- ../fixed_pkg.vhd:185:23
  n10057_o <= n10041_o (42);
  -- ../fixed_pkg.vhd:185:27
  n10058_o <= '1' when n10057_o /= n10053_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10065_o <= '0' when n10058_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n10071_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10072_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10073_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10074_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10075_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10076_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10077_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10078_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10079_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10080_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10081_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10082_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10083_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10084_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10085_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10086_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10087_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10088_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10089_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10090_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10091_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10092_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10093_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10094_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10095_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10096_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10097_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10098_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10099_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10100_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10101_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10102_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10103_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10104_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10105_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10106_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10107_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10108_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10109_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10110_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10111_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10112_o <= not n10053_o;
  -- ../fixed_pkg.vhd:196:31
  n10113_o <= not n10053_o;
  -- ../fixed_pkg.vhd:184:13
  n10114_o <= n10071_o & n10072_o & n10073_o & n10074_o;
  -- ../fixed_pkg.vhd:171:18
  n10115_o <= n10075_o & n10076_o & n10077_o & n10078_o;
  n10116_o <= n10079_o & n10080_o & n10081_o & n10082_o;
  -- ../fixed_pkg.vhd:170:18
  n10117_o <= n10083_o & n10084_o & n10085_o & n10086_o;
  n10118_o <= n10087_o & n10088_o & n10089_o & n10090_o;
  -- ../fixed_pkg.vhd:9:14
  n10119_o <= n10091_o & n10092_o & n10093_o & n10094_o;
  -- ../fixed_pkg.vhd:9:14
  n10120_o <= n10095_o & n10096_o & n10097_o & n10098_o;
  n10121_o <= n10099_o & n10100_o & n10101_o & n10102_o;
  -- ../fixed_pkg.vhd:9:14
  n10122_o <= n10103_o & n10104_o & n10105_o & n10106_o;
  -- ../fixed_pkg.vhd:24:14
  n10123_o <= n10107_o & n10108_o & n10109_o & n10110_o;
  -- ../fixed_pkg.vhd:24:14
  n10124_o <= n10111_o & n10112_o & n10113_o;
  n10125_o <= n10114_o & n10115_o & n10116_o & n10117_o;
  -- ../fixed_pkg.vhd:24:14
  n10126_o <= n10118_o & n10119_o & n10120_o & n10121_o;
  -- ../fixed_pkg.vhd:9:14
  n10127_o <= n10122_o & n10123_o & n10124_o;
  -- ../fixed_pkg.vhd:9:14
  n10128_o <= n10125_o & n10126_o & n10127_o;
  n10129_o <= n10128_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n10130_o <= n10053_o & n10129_o;
  -- ../fixed_pkg.vhd:195:9
  n10131_o <= n10052_o when n10065_o = '0' else n10130_o;
  -- ../fixed_pkg.vhd:168:39
  n10147_o <= n10131_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10148_o <= n10131_o (42);
  -- ../fixed_pkg.vhd:185:23
  n10152_o <= n10131_o (41);
  -- ../fixed_pkg.vhd:185:27
  n10153_o <= '1' when n10152_o /= n10148_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10160_o <= '0' when n10153_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n10164_o <= '1' when n10153_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n10166_o <= n10131_o (40);
  -- ../fixed_pkg.vhd:185:27
  n10167_o <= '1' when n10166_o /= n10148_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10169_o <= n10160_o when n10178_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n10175_o <= n10167_o and n10164_o;
  -- ../fixed_pkg.vhd:185:17
  n10178_o <= n10164_o and n10175_o;
  -- ../fixed_pkg.vhd:196:31
  n10180_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10181_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10182_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10183_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10184_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10185_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10186_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10187_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10188_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10189_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10190_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10191_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10192_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10193_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10194_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10195_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10196_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10197_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10198_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10199_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10200_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10201_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10202_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10203_o <= not n10148_o;
  -- ../fixed_pkg.vhd:196:31
  n10204_o <= not n10148_o;
  -- ../fixed_pkg.vhd:9:14
  n10205_o <= n10180_o & n10181_o & n10182_o & n10183_o;
  -- ../fixed_pkg.vhd:9:14
  n10206_o <= n10184_o & n10185_o & n10186_o & n10187_o;
  -- ../fixed_pkg.vhd:24:14
  n10207_o <= n10188_o & n10189_o & n10190_o & n10191_o;
  -- ../fixed_pkg.vhd:24:14
  n10208_o <= n10192_o & n10193_o & n10194_o & n10195_o;
  -- ../fixed_pkg.vhd:171:18
  n10209_o <= n10196_o & n10197_o & n10198_o & n10199_o;
  -- ../fixed_pkg.vhd:24:14
  n10210_o <= n10200_o & n10201_o & n10202_o & n10203_o;
  -- ../fixed_pkg.vhd:9:14
  n10211_o <= n10205_o & n10206_o & n10207_o & n10208_o;
  -- ../fixed_pkg.vhd:171:18
  n10212_o <= n10209_o & n10210_o & n10204_o;
  -- ../fixed_pkg.vhd:185:17
  n10213_o <= n10211_o & n10212_o;
  -- ../fixed_pkg.vhd:170:18
  n10214_o <= n10213_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n10215_o <= n10147_o (40 downto 16);
  -- ../fixed_pkg.vhd:169:40
  n10216_o <= n10148_o & n10214_o;
  -- ../fixed_pkg.vhd:195:9
  n10217_o <= n10215_o when n10169_o = '0' else n10216_o;
  -- ../fixed_pkg.vhd:268:100
  n10233_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n10236_o <= std_logic_vector (resize (signed (n10233_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n10248_o <= std_logic_vector (resize (signed (n10217_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n10251_o <= std_logic_vector (resize (signed (n10248_o) * signed'("0000000000011111111111111100100100111100010"), 43));
  -- ../fixed_pkg.vhd:168:39
  n10268_o <= std_logic_vector (resize (signed (n10236_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n10283_o <= std_logic_vector (resize (signed (n10251_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n10298_o <= std_logic_vector (unsigned (n10268_o) - unsigned (n10283_o));
  -- ../fixed_pkg.vhd:168:39
  n10309_o <= n10298_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10310_o <= n10298_o (43);
  -- ../fixed_pkg.vhd:185:23
  n10314_o <= n10298_o (42);
  -- ../fixed_pkg.vhd:185:27
  n10315_o <= '1' when n10314_o /= n10310_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10322_o <= '0' when n10315_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n10328_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10329_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10330_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10331_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10332_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10333_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10334_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10335_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10336_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10337_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10338_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10339_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10340_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10341_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10342_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10343_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10344_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10345_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10346_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10347_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10348_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10349_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10350_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10351_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10352_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10353_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10354_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10355_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10356_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10357_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10358_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10359_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10360_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10361_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10362_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10363_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10364_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10365_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10366_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10367_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10368_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10369_o <= not n10310_o;
  -- ../fixed_pkg.vhd:196:31
  n10370_o <= not n10310_o;
  -- ../fixed_pkg.vhd:9:14
  n10371_o <= n10328_o & n10329_o & n10330_o & n10331_o;
  -- ../fixed_pkg.vhd:24:14
  n10372_o <= n10332_o & n10333_o & n10334_o & n10335_o;
  -- ../fixed_pkg.vhd:24:14
  n10373_o <= n10336_o & n10337_o & n10338_o & n10339_o;
  -- ../fixed_pkg.vhd:185:17
  n10374_o <= n10340_o & n10341_o & n10342_o & n10343_o;
  -- ../fixed_pkg.vhd:24:14
  n10375_o <= n10344_o & n10345_o & n10346_o & n10347_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n10376_o <= n10348_o & n10349_o & n10350_o & n10351_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n10377_o <= n10352_o & n10353_o & n10354_o & n10355_o;
  -- ../fixed_pkg.vhd:185:17
  n10378_o <= n10356_o & n10357_o & n10358_o & n10359_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n10379_o <= n10360_o & n10361_o & n10362_o & n10363_o;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n10380_o <= n10364_o & n10365_o & n10366_o & n10367_o;
  -- ../BiquadFilter/BiquadFilter.vhd:53:18
  n10381_o <= n10368_o & n10369_o & n10370_o;
  n10382_o <= n10371_o & n10372_o & n10373_o & n10374_o;
  -- ../fixed_pkg.vhd:24:14
  n10383_o <= n10375_o & n10376_o & n10377_o & n10378_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n10384_o <= n10379_o & n10380_o & n10381_o;
  n10385_o <= n10382_o & n10383_o & n10384_o;
  n10386_o <= n10385_o (41 downto 0);
  n10387_o <= n10310_o & n10386_o;
  -- ../fixed_pkg.vhd:195:9
  n10388_o <= n10309_o when n10322_o = '0' else n10387_o;
  -- ../fixed_pkg.vhd:168:39
  n10406_o <= std_logic_vector (resize (signed (n10388_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n10421_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n10426_o <= n10425_o (15 downto 0);
  n10427_o <= n10421_o & n10426_o;
  -- ../fixed_pkg.vhd:257:67
  n10438_o <= std_logic_vector (unsigned (n10406_o) + unsigned (n10427_o));
  -- ../fixed_pkg.vhd:168:39
  n10449_o <= n10438_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10450_o <= n10438_o (43);
  -- ../fixed_pkg.vhd:185:23
  n10454_o <= n10438_o (42);
  -- ../fixed_pkg.vhd:185:27
  n10455_o <= '1' when n10454_o /= n10450_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10462_o <= '0' when n10455_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n10468_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10469_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10470_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10471_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10472_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10473_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10474_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10475_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10476_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10477_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10478_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10479_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10480_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10481_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10482_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10483_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10484_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10485_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10486_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10487_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10488_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10489_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10490_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10491_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10492_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10493_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10494_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10495_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10496_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10497_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10498_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10499_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10500_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10501_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10502_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10503_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10504_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10505_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10506_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10507_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10508_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10509_o <= not n10450_o;
  -- ../fixed_pkg.vhd:196:31
  n10510_o <= not n10450_o;
  n10511_o <= n10468_o & n10469_o & n10470_o & n10471_o;
  n10512_o <= n10472_o & n10473_o & n10474_o & n10475_o;
  n10513_o <= n10476_o & n10477_o & n10478_o & n10479_o;
  n10514_o <= n10480_o & n10481_o & n10482_o & n10483_o;
  n10515_o <= n10484_o & n10485_o & n10486_o & n10487_o;
  n10516_o <= n10488_o & n10489_o & n10490_o & n10491_o;
  n10517_o <= n10492_o & n10493_o & n10494_o & n10495_o;
  n10518_o <= n10496_o & n10497_o & n10498_o & n10499_o;
  n10519_o <= n10500_o & n10501_o & n10502_o & n10503_o;
  n10520_o <= n10504_o & n10505_o & n10506_o & n10507_o;
  n10521_o <= n10508_o & n10509_o & n10510_o;
  n10522_o <= n10511_o & n10512_o & n10513_o & n10514_o;
  n10523_o <= n10515_o & n10516_o & n10517_o & n10518_o;
  n10524_o <= n10519_o & n10520_o & n10521_o;
  n10525_o <= n10522_o & n10523_o & n10524_o;
  n10526_o <= n10525_o (41 downto 0);
  n10527_o <= n10450_o & n10526_o;
  -- ../fixed_pkg.vhd:195:9
  n10528_o <= n10449_o when n10462_o = '0' else n10527_o;
  -- ../fixed_pkg.vhd:168:39
  n10544_o <= n10528_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10545_o <= n10528_o (42);
  -- ../fixed_pkg.vhd:185:23
  n10549_o <= n10528_o (41);
  -- ../fixed_pkg.vhd:185:27
  n10550_o <= '1' when n10549_o /= n10545_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10557_o <= '0' when n10550_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n10561_o <= '1' when n10550_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n10563_o <= n10528_o (40);
  -- ../fixed_pkg.vhd:185:27
  n10564_o <= '1' when n10563_o /= n10545_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10566_o <= n10557_o when n10575_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n10572_o <= n10564_o and n10561_o;
  -- ../fixed_pkg.vhd:185:17
  n10575_o <= n10561_o and n10572_o;
  -- ../fixed_pkg.vhd:196:31
  n10577_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10578_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10579_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10580_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10581_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10582_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10583_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10584_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10585_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10586_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10587_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10588_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10589_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10590_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10591_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10592_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10593_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10594_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10595_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10596_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10597_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10598_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10599_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10600_o <= not n10545_o;
  -- ../fixed_pkg.vhd:196:31
  n10601_o <= not n10545_o;
  n10602_o <= n10577_o & n10578_o & n10579_o & n10580_o;
  n10603_o <= n10581_o & n10582_o & n10583_o & n10584_o;
  n10604_o <= n10585_o & n10586_o & n10587_o & n10588_o;
  n10605_o <= n10589_o & n10590_o & n10591_o & n10592_o;
  n10606_o <= n10593_o & n10594_o & n10595_o & n10596_o;
  n10607_o <= n10597_o & n10598_o & n10599_o & n10600_o;
  n10608_o <= n10602_o & n10603_o & n10604_o & n10605_o;
  n10609_o <= n10606_o & n10607_o & n10601_o;
  n10610_o <= n10608_o & n10609_o;
  n10611_o <= n10610_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n10612_o <= n10544_o (40 downto 16);
  n10613_o <= n10545_o & n10611_o;
  -- ../fixed_pkg.vhd:195:9
  n10614_o <= n10612_o when n10566_o = '0' else n10613_o;
  -- ../fixed_pkg.vhd:268:100
  n10629_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n10632_o <= std_logic_vector (resize (signed (n10629_o) * signed'("0000000000011111111111111111111100111111011"), 43));
  -- ../fixed_pkg.vhd:268:100
  n10644_o <= std_logic_vector (resize (signed (n10217_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n10647_o <= std_logic_vector (resize (signed (n10644_o) * signed'("0000000000000000000000000001111001111110101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n10664_o <= std_logic_vector (resize (signed (n10632_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n10679_o <= std_logic_vector (resize (signed (n10647_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n10694_o <= std_logic_vector (unsigned (n10664_o) - unsigned (n10679_o));
  -- ../fixed_pkg.vhd:168:39
  n10705_o <= n10694_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10706_o <= n10694_o (43);
  -- ../fixed_pkg.vhd:185:23
  n10710_o <= n10694_o (42);
  -- ../fixed_pkg.vhd:185:27
  n10711_o <= '1' when n10710_o /= n10706_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10718_o <= '0' when n10711_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n10724_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10725_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10726_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10727_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10728_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10729_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10730_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10731_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10732_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10733_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10734_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10735_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10736_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10737_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10738_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10739_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10740_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10741_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10742_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10743_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10744_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10745_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10746_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10747_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10748_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10749_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10750_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10751_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10752_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10753_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10754_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10755_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10756_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10757_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10758_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10759_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10760_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10761_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10762_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10763_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10764_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10765_o <= not n10706_o;
  -- ../fixed_pkg.vhd:196:31
  n10766_o <= not n10706_o;
  n10767_o <= n10724_o & n10725_o & n10726_o & n10727_o;
  n10768_o <= n10728_o & n10729_o & n10730_o & n10731_o;
  n10769_o <= n10732_o & n10733_o & n10734_o & n10735_o;
  n10770_o <= n10736_o & n10737_o & n10738_o & n10739_o;
  n10771_o <= n10740_o & n10741_o & n10742_o & n10743_o;
  n10772_o <= n10744_o & n10745_o & n10746_o & n10747_o;
  n10773_o <= n10748_o & n10749_o & n10750_o & n10751_o;
  n10774_o <= n10752_o & n10753_o & n10754_o & n10755_o;
  n10775_o <= n10756_o & n10757_o & n10758_o & n10759_o;
  n10776_o <= n10760_o & n10761_o & n10762_o & n10763_o;
  n10777_o <= n10764_o & n10765_o & n10766_o;
  n10778_o <= n10767_o & n10768_o & n10769_o & n10770_o;
  n10779_o <= n10771_o & n10772_o & n10773_o & n10774_o;
  n10780_o <= n10775_o & n10776_o & n10777_o;
  n10781_o <= n10778_o & n10779_o & n10780_o;
  n10782_o <= n10781_o (41 downto 0);
  n10783_o <= n10706_o & n10782_o;
  -- ../fixed_pkg.vhd:195:9
  n10784_o <= n10705_o when n10718_o = '0' else n10783_o;
  -- ../fixed_pkg.vhd:168:39
  n10800_o <= n10784_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10801_o <= n10784_o (42);
  -- ../fixed_pkg.vhd:185:23
  n10805_o <= n10784_o (41);
  -- ../fixed_pkg.vhd:185:27
  n10806_o <= '1' when n10805_o /= n10801_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10813_o <= '0' when n10806_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n10817_o <= '1' when n10806_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n10819_o <= n10784_o (40);
  -- ../fixed_pkg.vhd:185:27
  n10820_o <= '1' when n10819_o /= n10801_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10822_o <= n10813_o when n10831_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n10828_o <= n10820_o and n10817_o;
  -- ../fixed_pkg.vhd:185:17
  n10831_o <= n10817_o and n10828_o;
  -- ../fixed_pkg.vhd:196:31
  n10833_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10834_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10835_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10836_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10837_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10838_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10839_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10840_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10841_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10842_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10843_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10844_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10845_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10846_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10847_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10848_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10849_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10850_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10851_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10852_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10853_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10854_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10855_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10856_o <= not n10801_o;
  -- ../fixed_pkg.vhd:196:31
  n10857_o <= not n10801_o;
  n10858_o <= n10833_o & n10834_o & n10835_o & n10836_o;
  n10859_o <= n10837_o & n10838_o & n10839_o & n10840_o;
  n10860_o <= n10841_o & n10842_o & n10843_o & n10844_o;
  n10861_o <= n10845_o & n10846_o & n10847_o & n10848_o;
  n10862_o <= n10849_o & n10850_o & n10851_o & n10852_o;
  n10863_o <= n10853_o & n10854_o & n10855_o & n10856_o;
  n10864_o <= n10858_o & n10859_o & n10860_o & n10861_o;
  n10865_o <= n10862_o & n10863_o & n10857_o;
  n10866_o <= n10864_o & n10865_o;
  n10867_o <= n10866_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n10868_o <= n10800_o (40 downto 16);
  n10869_o <= n10801_o & n10867_o;
  -- ../fixed_pkg.vhd:195:9
  n10870_o <= n10868_o when n10822_o = '0' else n10869_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n10873_o <= '1' when state_reg = "01" else '0';
  n10874_o <= n10873_o & n9975_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n10874_o select n10875_o <=
    x_reg when "10",
    n9973_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n10874_o select n10876_o <=
    n10217_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n10874_o select n10877_o <=
    n10614_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n10874_o select n10878_o <=
    n10870_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n10893_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n10894_o <= x_reg when n10893_o = '0' else n10875_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n10895_q <= n10894_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n10896_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n10897_o <= y_reg when n10896_o = '0' else n10876_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n10898_q <= n10897_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n10899_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n10899_q <= n10877_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n10900_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n10900_q <= n10878_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n10919_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10920_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n10924_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n10925_o <= '1' when n10924_o /= n10920_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10932_o <= '0' when n10925_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n10936_o <= '1' when n10925_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n10938_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n10939_o <= '1' when n10938_o /= n10920_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n10941_o <= n10932_o when n10950_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n10947_o <= n10939_o and n10936_o;
  -- ../fixed_pkg.vhd:185:17
  n10950_o <= n10936_o and n10947_o;
  -- ../fixed_pkg.vhd:196:31
  n10952_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10953_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10954_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10955_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10956_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10957_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10958_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10959_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10960_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10961_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10962_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10963_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10964_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10965_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10966_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10967_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10968_o <= not n10920_o;
  -- ../fixed_pkg.vhd:196:31
  n10969_o <= not n10920_o;
  n10970_o <= n10952_o & n10953_o & n10954_o & n10955_o;
  n10971_o <= n10956_o & n10957_o & n10958_o & n10959_o;
  n10972_o <= n10960_o & n10961_o & n10962_o & n10963_o;
  n10973_o <= n10964_o & n10965_o & n10966_o & n10967_o;
  n10974_o <= n10968_o & n10969_o;
  n10975_o <= n10970_o & n10971_o & n10972_o & n10973_o;
  n10976_o <= n10975_o & n10974_o;
  n10977_o <= n10976_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n10978_o <= n10919_o (22 downto 5);
  n10979_o <= n10920_o & n10977_o;
  -- ../fixed_pkg.vhd:195:9
  n10980_o <= n10978_o when n10941_o = '0' else n10979_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_a12ffe86a0a36f7b398f45b49289aca300d75514 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_a12ffe86a0a36f7b398f45b49289aca300d75514;

architecture rtl of biquadfilter_a12ffe86a0a36f7b398f45b49289aca300d75514 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n8852_o : std_logic_vector (1 downto 0);
  signal n8854_o : std_logic;
  signal n8856_o : std_logic;
  signal n8858_o : std_logic_vector (1 downto 0);
  signal n8860_o : std_logic;
  signal n8861_o : std_logic_vector (2 downto 0);
  signal n8864_o : std_logic_vector (1 downto 0);
  signal n8869_q : std_logic_vector (1 downto 0);
  signal n8872_o : std_logic;
  signal n8873_o : std_logic;
  signal n8877_o : std_logic;
  signal n8878_o : std_logic;
  signal n8898_o : std_logic_vector (19 downto 0);
  constant n8902_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n8903_o : std_logic_vector (4 downto 0);
  signal n8904_o : std_logic_vector (24 downto 0);
  signal n8905_o : std_logic_vector (24 downto 0);
  signal n8907_o : std_logic;
  signal n8921_o : std_logic_vector (42 downto 0);
  signal n8924_o : std_logic_vector (42 downto 0);
  signal n8941_o : std_logic_vector (43 downto 0);
  signal n8956_o : std_logic_vector (27 downto 0);
  constant n8960_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n8961_o : std_logic_vector (15 downto 0);
  signal n8962_o : std_logic_vector (43 downto 0);
  signal n8973_o : std_logic_vector (43 downto 0);
  signal n8984_o : std_logic_vector (42 downto 0);
  signal n8985_o : std_logic;
  signal n8989_o : std_logic;
  signal n8990_o : std_logic;
  signal n8997_o : std_logic;
  signal n9003_o : std_logic;
  signal n9004_o : std_logic;
  signal n9005_o : std_logic;
  signal n9006_o : std_logic;
  signal n9007_o : std_logic;
  signal n9008_o : std_logic;
  signal n9009_o : std_logic;
  signal n9010_o : std_logic;
  signal n9011_o : std_logic;
  signal n9012_o : std_logic;
  signal n9013_o : std_logic;
  signal n9014_o : std_logic;
  signal n9015_o : std_logic;
  signal n9016_o : std_logic;
  signal n9017_o : std_logic;
  signal n9018_o : std_logic;
  signal n9019_o : std_logic;
  signal n9020_o : std_logic;
  signal n9021_o : std_logic;
  signal n9022_o : std_logic;
  signal n9023_o : std_logic;
  signal n9024_o : std_logic;
  signal n9025_o : std_logic;
  signal n9026_o : std_logic;
  signal n9027_o : std_logic;
  signal n9028_o : std_logic;
  signal n9029_o : std_logic;
  signal n9030_o : std_logic;
  signal n9031_o : std_logic;
  signal n9032_o : std_logic;
  signal n9033_o : std_logic;
  signal n9034_o : std_logic;
  signal n9035_o : std_logic;
  signal n9036_o : std_logic;
  signal n9037_o : std_logic;
  signal n9038_o : std_logic;
  signal n9039_o : std_logic;
  signal n9040_o : std_logic;
  signal n9041_o : std_logic;
  signal n9042_o : std_logic;
  signal n9043_o : std_logic;
  signal n9044_o : std_logic;
  signal n9045_o : std_logic;
  signal n9046_o : std_logic_vector (3 downto 0);
  signal n9047_o : std_logic_vector (3 downto 0);
  signal n9048_o : std_logic_vector (3 downto 0);
  signal n9049_o : std_logic_vector (3 downto 0);
  signal n9050_o : std_logic_vector (3 downto 0);
  signal n9051_o : std_logic_vector (3 downto 0);
  signal n9052_o : std_logic_vector (3 downto 0);
  signal n9053_o : std_logic_vector (3 downto 0);
  signal n9054_o : std_logic_vector (3 downto 0);
  signal n9055_o : std_logic_vector (3 downto 0);
  signal n9056_o : std_logic_vector (2 downto 0);
  signal n9057_o : std_logic_vector (15 downto 0);
  signal n9058_o : std_logic_vector (15 downto 0);
  signal n9059_o : std_logic_vector (10 downto 0);
  signal n9060_o : std_logic_vector (42 downto 0);
  signal n9061_o : std_logic_vector (41 downto 0);
  signal n9062_o : std_logic_vector (42 downto 0);
  signal n9063_o : std_logic_vector (42 downto 0);
  signal n9079_o : std_logic_vector (40 downto 0);
  signal n9080_o : std_logic;
  signal n9084_o : std_logic;
  signal n9085_o : std_logic;
  signal n9092_o : std_logic;
  signal n9096_o : std_logic;
  signal n9098_o : std_logic;
  signal n9099_o : std_logic;
  signal n9101_o : std_logic;
  signal n9107_o : std_logic;
  signal n9110_o : std_logic;
  signal n9112_o : std_logic;
  signal n9113_o : std_logic;
  signal n9114_o : std_logic;
  signal n9115_o : std_logic;
  signal n9116_o : std_logic;
  signal n9117_o : std_logic;
  signal n9118_o : std_logic;
  signal n9119_o : std_logic;
  signal n9120_o : std_logic;
  signal n9121_o : std_logic;
  signal n9122_o : std_logic;
  signal n9123_o : std_logic;
  signal n9124_o : std_logic;
  signal n9125_o : std_logic;
  signal n9126_o : std_logic;
  signal n9127_o : std_logic;
  signal n9128_o : std_logic;
  signal n9129_o : std_logic;
  signal n9130_o : std_logic;
  signal n9131_o : std_logic;
  signal n9132_o : std_logic;
  signal n9133_o : std_logic;
  signal n9134_o : std_logic;
  signal n9135_o : std_logic;
  signal n9136_o : std_logic;
  signal n9137_o : std_logic_vector (3 downto 0);
  signal n9138_o : std_logic_vector (3 downto 0);
  signal n9139_o : std_logic_vector (3 downto 0);
  signal n9140_o : std_logic_vector (3 downto 0);
  signal n9141_o : std_logic_vector (3 downto 0);
  signal n9142_o : std_logic_vector (3 downto 0);
  signal n9143_o : std_logic_vector (15 downto 0);
  signal n9144_o : std_logic_vector (8 downto 0);
  signal n9145_o : std_logic_vector (24 downto 0);
  signal n9146_o : std_logic_vector (23 downto 0);
  signal n9147_o : std_logic_vector (24 downto 0);
  signal n9148_o : std_logic_vector (24 downto 0);
  signal n9149_o : std_logic_vector (24 downto 0);
  signal n9165_o : std_logic_vector (42 downto 0);
  signal n9168_o : std_logic_vector (42 downto 0);
  signal n9180_o : std_logic_vector (42 downto 0);
  signal n9183_o : std_logic_vector (42 downto 0);
  signal n9200_o : std_logic_vector (43 downto 0);
  signal n9215_o : std_logic_vector (43 downto 0);
  signal n9230_o : std_logic_vector (43 downto 0);
  signal n9241_o : std_logic_vector (42 downto 0);
  signal n9242_o : std_logic;
  signal n9246_o : std_logic;
  signal n9247_o : std_logic;
  signal n9254_o : std_logic;
  signal n9260_o : std_logic;
  signal n9261_o : std_logic;
  signal n9262_o : std_logic;
  signal n9263_o : std_logic;
  signal n9264_o : std_logic;
  signal n9265_o : std_logic;
  signal n9266_o : std_logic;
  signal n9267_o : std_logic;
  signal n9268_o : std_logic;
  signal n9269_o : std_logic;
  signal n9270_o : std_logic;
  signal n9271_o : std_logic;
  signal n9272_o : std_logic;
  signal n9273_o : std_logic;
  signal n9274_o : std_logic;
  signal n9275_o : std_logic;
  signal n9276_o : std_logic;
  signal n9277_o : std_logic;
  signal n9278_o : std_logic;
  signal n9279_o : std_logic;
  signal n9280_o : std_logic;
  signal n9281_o : std_logic;
  signal n9282_o : std_logic;
  signal n9283_o : std_logic;
  signal n9284_o : std_logic;
  signal n9285_o : std_logic;
  signal n9286_o : std_logic;
  signal n9287_o : std_logic;
  signal n9288_o : std_logic;
  signal n9289_o : std_logic;
  signal n9290_o : std_logic;
  signal n9291_o : std_logic;
  signal n9292_o : std_logic;
  signal n9293_o : std_logic;
  signal n9294_o : std_logic;
  signal n9295_o : std_logic;
  signal n9296_o : std_logic;
  signal n9297_o : std_logic;
  signal n9298_o : std_logic;
  signal n9299_o : std_logic;
  signal n9300_o : std_logic;
  signal n9301_o : std_logic;
  signal n9302_o : std_logic;
  signal n9303_o : std_logic_vector (3 downto 0);
  signal n9304_o : std_logic_vector (3 downto 0);
  signal n9305_o : std_logic_vector (3 downto 0);
  signal n9306_o : std_logic_vector (3 downto 0);
  signal n9307_o : std_logic_vector (3 downto 0);
  signal n9308_o : std_logic_vector (3 downto 0);
  signal n9309_o : std_logic_vector (3 downto 0);
  signal n9310_o : std_logic_vector (3 downto 0);
  signal n9311_o : std_logic_vector (3 downto 0);
  signal n9312_o : std_logic_vector (3 downto 0);
  signal n9313_o : std_logic_vector (2 downto 0);
  signal n9314_o : std_logic_vector (15 downto 0);
  signal n9315_o : std_logic_vector (15 downto 0);
  signal n9316_o : std_logic_vector (10 downto 0);
  signal n9317_o : std_logic_vector (42 downto 0);
  signal n9318_o : std_logic_vector (41 downto 0);
  signal n9319_o : std_logic_vector (42 downto 0);
  signal n9320_o : std_logic_vector (42 downto 0);
  signal n9338_o : std_logic_vector (43 downto 0);
  signal n9353_o : std_logic_vector (27 downto 0);
  constant n9357_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n9358_o : std_logic_vector (15 downto 0);
  signal n9359_o : std_logic_vector (43 downto 0);
  signal n9370_o : std_logic_vector (43 downto 0);
  signal n9381_o : std_logic_vector (42 downto 0);
  signal n9382_o : std_logic;
  signal n9386_o : std_logic;
  signal n9387_o : std_logic;
  signal n9394_o : std_logic;
  signal n9400_o : std_logic;
  signal n9401_o : std_logic;
  signal n9402_o : std_logic;
  signal n9403_o : std_logic;
  signal n9404_o : std_logic;
  signal n9405_o : std_logic;
  signal n9406_o : std_logic;
  signal n9407_o : std_logic;
  signal n9408_o : std_logic;
  signal n9409_o : std_logic;
  signal n9410_o : std_logic;
  signal n9411_o : std_logic;
  signal n9412_o : std_logic;
  signal n9413_o : std_logic;
  signal n9414_o : std_logic;
  signal n9415_o : std_logic;
  signal n9416_o : std_logic;
  signal n9417_o : std_logic;
  signal n9418_o : std_logic;
  signal n9419_o : std_logic;
  signal n9420_o : std_logic;
  signal n9421_o : std_logic;
  signal n9422_o : std_logic;
  signal n9423_o : std_logic;
  signal n9424_o : std_logic;
  signal n9425_o : std_logic;
  signal n9426_o : std_logic;
  signal n9427_o : std_logic;
  signal n9428_o : std_logic;
  signal n9429_o : std_logic;
  signal n9430_o : std_logic;
  signal n9431_o : std_logic;
  signal n9432_o : std_logic;
  signal n9433_o : std_logic;
  signal n9434_o : std_logic;
  signal n9435_o : std_logic;
  signal n9436_o : std_logic;
  signal n9437_o : std_logic;
  signal n9438_o : std_logic;
  signal n9439_o : std_logic;
  signal n9440_o : std_logic;
  signal n9441_o : std_logic;
  signal n9442_o : std_logic;
  signal n9443_o : std_logic_vector (3 downto 0);
  signal n9444_o : std_logic_vector (3 downto 0);
  signal n9445_o : std_logic_vector (3 downto 0);
  signal n9446_o : std_logic_vector (3 downto 0);
  signal n9447_o : std_logic_vector (3 downto 0);
  signal n9448_o : std_logic_vector (3 downto 0);
  signal n9449_o : std_logic_vector (3 downto 0);
  signal n9450_o : std_logic_vector (3 downto 0);
  signal n9451_o : std_logic_vector (3 downto 0);
  signal n9452_o : std_logic_vector (3 downto 0);
  signal n9453_o : std_logic_vector (2 downto 0);
  signal n9454_o : std_logic_vector (15 downto 0);
  signal n9455_o : std_logic_vector (15 downto 0);
  signal n9456_o : std_logic_vector (10 downto 0);
  signal n9457_o : std_logic_vector (42 downto 0);
  signal n9458_o : std_logic_vector (41 downto 0);
  signal n9459_o : std_logic_vector (42 downto 0);
  signal n9460_o : std_logic_vector (42 downto 0);
  signal n9476_o : std_logic_vector (40 downto 0);
  signal n9477_o : std_logic;
  signal n9481_o : std_logic;
  signal n9482_o : std_logic;
  signal n9489_o : std_logic;
  signal n9493_o : std_logic;
  signal n9495_o : std_logic;
  signal n9496_o : std_logic;
  signal n9498_o : std_logic;
  signal n9504_o : std_logic;
  signal n9507_o : std_logic;
  signal n9509_o : std_logic;
  signal n9510_o : std_logic;
  signal n9511_o : std_logic;
  signal n9512_o : std_logic;
  signal n9513_o : std_logic;
  signal n9514_o : std_logic;
  signal n9515_o : std_logic;
  signal n9516_o : std_logic;
  signal n9517_o : std_logic;
  signal n9518_o : std_logic;
  signal n9519_o : std_logic;
  signal n9520_o : std_logic;
  signal n9521_o : std_logic;
  signal n9522_o : std_logic;
  signal n9523_o : std_logic;
  signal n9524_o : std_logic;
  signal n9525_o : std_logic;
  signal n9526_o : std_logic;
  signal n9527_o : std_logic;
  signal n9528_o : std_logic;
  signal n9529_o : std_logic;
  signal n9530_o : std_logic;
  signal n9531_o : std_logic;
  signal n9532_o : std_logic;
  signal n9533_o : std_logic;
  signal n9534_o : std_logic_vector (3 downto 0);
  signal n9535_o : std_logic_vector (3 downto 0);
  signal n9536_o : std_logic_vector (3 downto 0);
  signal n9537_o : std_logic_vector (3 downto 0);
  signal n9538_o : std_logic_vector (3 downto 0);
  signal n9539_o : std_logic_vector (3 downto 0);
  signal n9540_o : std_logic_vector (15 downto 0);
  signal n9541_o : std_logic_vector (8 downto 0);
  signal n9542_o : std_logic_vector (24 downto 0);
  signal n9543_o : std_logic_vector (23 downto 0);
  signal n9544_o : std_logic_vector (24 downto 0);
  signal n9545_o : std_logic_vector (24 downto 0);
  signal n9546_o : std_logic_vector (24 downto 0);
  signal n9561_o : std_logic_vector (42 downto 0);
  signal n9564_o : std_logic_vector (42 downto 0);
  signal n9576_o : std_logic_vector (42 downto 0);
  signal n9579_o : std_logic_vector (42 downto 0);
  signal n9596_o : std_logic_vector (43 downto 0);
  signal n9611_o : std_logic_vector (43 downto 0);
  signal n9626_o : std_logic_vector (43 downto 0);
  signal n9637_o : std_logic_vector (42 downto 0);
  signal n9638_o : std_logic;
  signal n9642_o : std_logic;
  signal n9643_o : std_logic;
  signal n9650_o : std_logic;
  signal n9656_o : std_logic;
  signal n9657_o : std_logic;
  signal n9658_o : std_logic;
  signal n9659_o : std_logic;
  signal n9660_o : std_logic;
  signal n9661_o : std_logic;
  signal n9662_o : std_logic;
  signal n9663_o : std_logic;
  signal n9664_o : std_logic;
  signal n9665_o : std_logic;
  signal n9666_o : std_logic;
  signal n9667_o : std_logic;
  signal n9668_o : std_logic;
  signal n9669_o : std_logic;
  signal n9670_o : std_logic;
  signal n9671_o : std_logic;
  signal n9672_o : std_logic;
  signal n9673_o : std_logic;
  signal n9674_o : std_logic;
  signal n9675_o : std_logic;
  signal n9676_o : std_logic;
  signal n9677_o : std_logic;
  signal n9678_o : std_logic;
  signal n9679_o : std_logic;
  signal n9680_o : std_logic;
  signal n9681_o : std_logic;
  signal n9682_o : std_logic;
  signal n9683_o : std_logic;
  signal n9684_o : std_logic;
  signal n9685_o : std_logic;
  signal n9686_o : std_logic;
  signal n9687_o : std_logic;
  signal n9688_o : std_logic;
  signal n9689_o : std_logic;
  signal n9690_o : std_logic;
  signal n9691_o : std_logic;
  signal n9692_o : std_logic;
  signal n9693_o : std_logic;
  signal n9694_o : std_logic;
  signal n9695_o : std_logic;
  signal n9696_o : std_logic;
  signal n9697_o : std_logic;
  signal n9698_o : std_logic;
  signal n9699_o : std_logic_vector (3 downto 0);
  signal n9700_o : std_logic_vector (3 downto 0);
  signal n9701_o : std_logic_vector (3 downto 0);
  signal n9702_o : std_logic_vector (3 downto 0);
  signal n9703_o : std_logic_vector (3 downto 0);
  signal n9704_o : std_logic_vector (3 downto 0);
  signal n9705_o : std_logic_vector (3 downto 0);
  signal n9706_o : std_logic_vector (3 downto 0);
  signal n9707_o : std_logic_vector (3 downto 0);
  signal n9708_o : std_logic_vector (3 downto 0);
  signal n9709_o : std_logic_vector (2 downto 0);
  signal n9710_o : std_logic_vector (15 downto 0);
  signal n9711_o : std_logic_vector (15 downto 0);
  signal n9712_o : std_logic_vector (10 downto 0);
  signal n9713_o : std_logic_vector (42 downto 0);
  signal n9714_o : std_logic_vector (41 downto 0);
  signal n9715_o : std_logic_vector (42 downto 0);
  signal n9716_o : std_logic_vector (42 downto 0);
  signal n9732_o : std_logic_vector (40 downto 0);
  signal n9733_o : std_logic;
  signal n9737_o : std_logic;
  signal n9738_o : std_logic;
  signal n9745_o : std_logic;
  signal n9749_o : std_logic;
  signal n9751_o : std_logic;
  signal n9752_o : std_logic;
  signal n9754_o : std_logic;
  signal n9760_o : std_logic;
  signal n9763_o : std_logic;
  signal n9765_o : std_logic;
  signal n9766_o : std_logic;
  signal n9767_o : std_logic;
  signal n9768_o : std_logic;
  signal n9769_o : std_logic;
  signal n9770_o : std_logic;
  signal n9771_o : std_logic;
  signal n9772_o : std_logic;
  signal n9773_o : std_logic;
  signal n9774_o : std_logic;
  signal n9775_o : std_logic;
  signal n9776_o : std_logic;
  signal n9777_o : std_logic;
  signal n9778_o : std_logic;
  signal n9779_o : std_logic;
  signal n9780_o : std_logic;
  signal n9781_o : std_logic;
  signal n9782_o : std_logic;
  signal n9783_o : std_logic;
  signal n9784_o : std_logic;
  signal n9785_o : std_logic;
  signal n9786_o : std_logic;
  signal n9787_o : std_logic;
  signal n9788_o : std_logic;
  signal n9789_o : std_logic;
  signal n9790_o : std_logic_vector (3 downto 0);
  signal n9791_o : std_logic_vector (3 downto 0);
  signal n9792_o : std_logic_vector (3 downto 0);
  signal n9793_o : std_logic_vector (3 downto 0);
  signal n9794_o : std_logic_vector (3 downto 0);
  signal n9795_o : std_logic_vector (3 downto 0);
  signal n9796_o : std_logic_vector (15 downto 0);
  signal n9797_o : std_logic_vector (8 downto 0);
  signal n9798_o : std_logic_vector (24 downto 0);
  signal n9799_o : std_logic_vector (23 downto 0);
  signal n9800_o : std_logic_vector (24 downto 0);
  signal n9801_o : std_logic_vector (24 downto 0);
  signal n9802_o : std_logic_vector (24 downto 0);
  signal n9805_o : std_logic;
  signal n9806_o : std_logic_vector (1 downto 0);
  signal n9807_o : std_logic_vector (24 downto 0);
  signal n9808_o : std_logic_vector (24 downto 0);
  signal n9809_o : std_logic_vector (24 downto 0);
  signal n9810_o : std_logic_vector (24 downto 0);
  signal n9825_o : std_logic;
  signal n9826_o : std_logic_vector (24 downto 0);
  signal n9827_q : std_logic_vector (24 downto 0);
  signal n9828_o : std_logic;
  signal n9829_o : std_logic_vector (24 downto 0);
  signal n9830_q : std_logic_vector (24 downto 0);
  signal n9831_q : std_logic_vector (24 downto 0);
  signal n9832_q : std_logic_vector (24 downto 0);
  signal n9851_o : std_logic_vector (22 downto 0);
  signal n9852_o : std_logic;
  signal n9856_o : std_logic;
  signal n9857_o : std_logic;
  signal n9864_o : std_logic;
  signal n9868_o : std_logic;
  signal n9870_o : std_logic;
  signal n9871_o : std_logic;
  signal n9873_o : std_logic;
  signal n9879_o : std_logic;
  signal n9882_o : std_logic;
  signal n9884_o : std_logic;
  signal n9885_o : std_logic;
  signal n9886_o : std_logic;
  signal n9887_o : std_logic;
  signal n9888_o : std_logic;
  signal n9889_o : std_logic;
  signal n9890_o : std_logic;
  signal n9891_o : std_logic;
  signal n9892_o : std_logic;
  signal n9893_o : std_logic;
  signal n9894_o : std_logic;
  signal n9895_o : std_logic;
  signal n9896_o : std_logic;
  signal n9897_o : std_logic;
  signal n9898_o : std_logic;
  signal n9899_o : std_logic;
  signal n9900_o : std_logic;
  signal n9901_o : std_logic;
  signal n9902_o : std_logic_vector (3 downto 0);
  signal n9903_o : std_logic_vector (3 downto 0);
  signal n9904_o : std_logic_vector (3 downto 0);
  signal n9905_o : std_logic_vector (3 downto 0);
  signal n9906_o : std_logic_vector (1 downto 0);
  signal n9907_o : std_logic_vector (15 downto 0);
  signal n9908_o : std_logic_vector (17 downto 0);
  signal n9909_o : std_logic_vector (16 downto 0);
  signal n9910_o : std_logic_vector (17 downto 0);
  signal n9911_o : std_logic_vector (17 downto 0);
  signal n9912_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n8873_o;
  valid_o <= n8878_o;
  data_o <= n9912_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n8869_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n9827_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n9830_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n9831_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n9832_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n8852_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n8854_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n8856_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n8858_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n8860_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:170:18
  n8861_o <= n8860_o & n8856_o & n8854_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n8861_o select n8864_o <=
    n8858_o when "100",
    "10" when "010",
    n8852_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n8869_q <= "00";
    elsif rising_edge (clk_i) then
      n8869_q <= n8864_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n8872_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n8873_o <= '0' when n8872_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n8877_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n8878_o <= '0' when n8877_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n8898_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n8903_o <= n8902_o (4 downto 0);
  n8904_o <= n8898_o & n8903_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n8905_o <= x_reg when valid_i = '0' else n8904_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n8907_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n8921_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n8924_o <= std_logic_vector (resize (signed (n8921_o) * signed'("0000000000000000000000000000000010101010110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n8941_o <= std_logic_vector (resize (signed (n8924_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n8956_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n8961_o <= n8960_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n8962_o <= n8956_o & n8961_o;
  -- ../fixed_pkg.vhd:257:67
  n8973_o <= std_logic_vector (unsigned (n8941_o) + unsigned (n8962_o));
  -- ../fixed_pkg.vhd:168:39
  n8984_o <= n8973_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8985_o <= n8973_o (43);
  -- ../fixed_pkg.vhd:185:23
  n8989_o <= n8973_o (42);
  -- ../fixed_pkg.vhd:185:27
  n8990_o <= '1' when n8989_o /= n8985_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8997_o <= '0' when n8990_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n9003_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9004_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9005_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9006_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9007_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9008_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9009_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9010_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9011_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9012_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9013_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9014_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9015_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9016_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9017_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9018_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9019_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9020_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9021_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9022_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9023_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9024_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9025_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9026_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9027_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9028_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9029_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9030_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9031_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9032_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9033_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9034_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9035_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9036_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9037_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9038_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9039_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9040_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9041_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9042_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9043_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9044_o <= not n8985_o;
  -- ../fixed_pkg.vhd:196:31
  n9045_o <= not n8985_o;
  -- ../fixed_pkg.vhd:184:13
  n9046_o <= n9003_o & n9004_o & n9005_o & n9006_o;
  -- ../fixed_pkg.vhd:171:18
  n9047_o <= n9007_o & n9008_o & n9009_o & n9010_o;
  n9048_o <= n9011_o & n9012_o & n9013_o & n9014_o;
  -- ../fixed_pkg.vhd:170:18
  n9049_o <= n9015_o & n9016_o & n9017_o & n9018_o;
  n9050_o <= n9019_o & n9020_o & n9021_o & n9022_o;
  -- ../fixed_pkg.vhd:9:14
  n9051_o <= n9023_o & n9024_o & n9025_o & n9026_o;
  -- ../fixed_pkg.vhd:9:14
  n9052_o <= n9027_o & n9028_o & n9029_o & n9030_o;
  n9053_o <= n9031_o & n9032_o & n9033_o & n9034_o;
  -- ../fixed_pkg.vhd:9:14
  n9054_o <= n9035_o & n9036_o & n9037_o & n9038_o;
  -- ../fixed_pkg.vhd:24:14
  n9055_o <= n9039_o & n9040_o & n9041_o & n9042_o;
  -- ../fixed_pkg.vhd:24:14
  n9056_o <= n9043_o & n9044_o & n9045_o;
  n9057_o <= n9046_o & n9047_o & n9048_o & n9049_o;
  -- ../fixed_pkg.vhd:24:14
  n9058_o <= n9050_o & n9051_o & n9052_o & n9053_o;
  -- ../fixed_pkg.vhd:9:14
  n9059_o <= n9054_o & n9055_o & n9056_o;
  -- ../fixed_pkg.vhd:9:14
  n9060_o <= n9057_o & n9058_o & n9059_o;
  n9061_o <= n9060_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n9062_o <= n8985_o & n9061_o;
  -- ../fixed_pkg.vhd:195:9
  n9063_o <= n8984_o when n8997_o = '0' else n9062_o;
  -- ../fixed_pkg.vhd:168:39
  n9079_o <= n9063_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9080_o <= n9063_o (42);
  -- ../fixed_pkg.vhd:185:23
  n9084_o <= n9063_o (41);
  -- ../fixed_pkg.vhd:185:27
  n9085_o <= '1' when n9084_o /= n9080_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n9092_o <= '0' when n9085_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n9096_o <= '1' when n9085_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n9098_o <= n9063_o (40);
  -- ../fixed_pkg.vhd:185:27
  n9099_o <= '1' when n9098_o /= n9080_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n9101_o <= n9092_o when n9110_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n9107_o <= n9099_o and n9096_o;
  -- ../fixed_pkg.vhd:185:17
  n9110_o <= n9096_o and n9107_o;
  -- ../fixed_pkg.vhd:196:31
  n9112_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9113_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9114_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9115_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9116_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9117_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9118_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9119_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9120_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9121_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9122_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9123_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9124_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9125_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9126_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9127_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9128_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9129_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9130_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9131_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9132_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9133_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9134_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9135_o <= not n9080_o;
  -- ../fixed_pkg.vhd:196:31
  n9136_o <= not n9080_o;
  -- ../fixed_pkg.vhd:9:14
  n9137_o <= n9112_o & n9113_o & n9114_o & n9115_o;
  -- ../fixed_pkg.vhd:9:14
  n9138_o <= n9116_o & n9117_o & n9118_o & n9119_o;
  -- ../fixed_pkg.vhd:24:14
  n9139_o <= n9120_o & n9121_o & n9122_o & n9123_o;
  -- ../fixed_pkg.vhd:24:14
  n9140_o <= n9124_o & n9125_o & n9126_o & n9127_o;
  -- ../fixed_pkg.vhd:171:18
  n9141_o <= n9128_o & n9129_o & n9130_o & n9131_o;
  -- ../fixed_pkg.vhd:24:14
  n9142_o <= n9132_o & n9133_o & n9134_o & n9135_o;
  -- ../fixed_pkg.vhd:9:14
  n9143_o <= n9137_o & n9138_o & n9139_o & n9140_o;
  -- ../fixed_pkg.vhd:171:18
  n9144_o <= n9141_o & n9142_o & n9136_o;
  -- ../fixed_pkg.vhd:185:17
  n9145_o <= n9143_o & n9144_o;
  -- ../fixed_pkg.vhd:170:18
  n9146_o <= n9145_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n9147_o <= n9079_o (40 downto 16);
  -- ../fixed_pkg.vhd:169:40
  n9148_o <= n9080_o & n9146_o;
  -- ../fixed_pkg.vhd:195:9
  n9149_o <= n9147_o when n9101_o = '0' else n9148_o;
  -- ../fixed_pkg.vhd:268:100
  n9165_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n9168_o <= std_logic_vector (resize (signed (n9165_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n9180_o <= std_logic_vector (resize (signed (n9149_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n9183_o <= std_logic_vector (resize (signed (n9180_o) * signed'("0000000000011111111111111100011101001100011"), 43));
  -- ../fixed_pkg.vhd:168:39
  n9200_o <= std_logic_vector (resize (signed (n9168_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n9215_o <= std_logic_vector (resize (signed (n9183_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n9230_o <= std_logic_vector (unsigned (n9200_o) - unsigned (n9215_o));
  -- ../fixed_pkg.vhd:168:39
  n9241_o <= n9230_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9242_o <= n9230_o (43);
  -- ../fixed_pkg.vhd:185:23
  n9246_o <= n9230_o (42);
  -- ../fixed_pkg.vhd:185:27
  n9247_o <= '1' when n9246_o /= n9242_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n9254_o <= '0' when n9247_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n9260_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9261_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9262_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9263_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9264_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9265_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9266_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9267_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9268_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9269_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9270_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9271_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9272_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9273_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9274_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9275_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9276_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9277_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9278_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9279_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9280_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9281_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9282_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9283_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9284_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9285_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9286_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9287_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9288_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9289_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9290_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9291_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9292_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9293_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9294_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9295_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9296_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9297_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9298_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9299_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9300_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9301_o <= not n9242_o;
  -- ../fixed_pkg.vhd:196:31
  n9302_o <= not n9242_o;
  -- ../fixed_pkg.vhd:9:14
  n9303_o <= n9260_o & n9261_o & n9262_o & n9263_o;
  -- ../fixed_pkg.vhd:24:14
  n9304_o <= n9264_o & n9265_o & n9266_o & n9267_o;
  -- ../fixed_pkg.vhd:24:14
  n9305_o <= n9268_o & n9269_o & n9270_o & n9271_o;
  -- ../fixed_pkg.vhd:185:17
  n9306_o <= n9272_o & n9273_o & n9274_o & n9275_o;
  -- ../fixed_pkg.vhd:24:14
  n9307_o <= n9276_o & n9277_o & n9278_o & n9279_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n9308_o <= n9280_o & n9281_o & n9282_o & n9283_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n9309_o <= n9284_o & n9285_o & n9286_o & n9287_o;
  -- ../fixed_pkg.vhd:185:17
  n9310_o <= n9288_o & n9289_o & n9290_o & n9291_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n9311_o <= n9292_o & n9293_o & n9294_o & n9295_o;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n9312_o <= n9296_o & n9297_o & n9298_o & n9299_o;
  -- ../BiquadFilter/BiquadFilter.vhd:53:18
  n9313_o <= n9300_o & n9301_o & n9302_o;
  n9314_o <= n9303_o & n9304_o & n9305_o & n9306_o;
  -- ../fixed_pkg.vhd:24:14
  n9315_o <= n9307_o & n9308_o & n9309_o & n9310_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n9316_o <= n9311_o & n9312_o & n9313_o;
  n9317_o <= n9314_o & n9315_o & n9316_o;
  n9318_o <= n9317_o (41 downto 0);
  n9319_o <= n9242_o & n9318_o;
  -- ../fixed_pkg.vhd:195:9
  n9320_o <= n9241_o when n9254_o = '0' else n9319_o;
  -- ../fixed_pkg.vhd:168:39
  n9338_o <= std_logic_vector (resize (signed (n9320_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n9353_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n9358_o <= n9357_o (15 downto 0);
  n9359_o <= n9353_o & n9358_o;
  -- ../fixed_pkg.vhd:257:67
  n9370_o <= std_logic_vector (unsigned (n9338_o) + unsigned (n9359_o));
  -- ../fixed_pkg.vhd:168:39
  n9381_o <= n9370_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9382_o <= n9370_o (43);
  -- ../fixed_pkg.vhd:185:23
  n9386_o <= n9370_o (42);
  -- ../fixed_pkg.vhd:185:27
  n9387_o <= '1' when n9386_o /= n9382_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n9394_o <= '0' when n9387_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n9400_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9401_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9402_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9403_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9404_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9405_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9406_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9407_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9408_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9409_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9410_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9411_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9412_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9413_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9414_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9415_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9416_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9417_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9418_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9419_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9420_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9421_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9422_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9423_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9424_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9425_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9426_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9427_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9428_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9429_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9430_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9431_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9432_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9433_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9434_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9435_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9436_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9437_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9438_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9439_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9440_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9441_o <= not n9382_o;
  -- ../fixed_pkg.vhd:196:31
  n9442_o <= not n9382_o;
  n9443_o <= n9400_o & n9401_o & n9402_o & n9403_o;
  n9444_o <= n9404_o & n9405_o & n9406_o & n9407_o;
  n9445_o <= n9408_o & n9409_o & n9410_o & n9411_o;
  n9446_o <= n9412_o & n9413_o & n9414_o & n9415_o;
  n9447_o <= n9416_o & n9417_o & n9418_o & n9419_o;
  n9448_o <= n9420_o & n9421_o & n9422_o & n9423_o;
  n9449_o <= n9424_o & n9425_o & n9426_o & n9427_o;
  n9450_o <= n9428_o & n9429_o & n9430_o & n9431_o;
  n9451_o <= n9432_o & n9433_o & n9434_o & n9435_o;
  n9452_o <= n9436_o & n9437_o & n9438_o & n9439_o;
  n9453_o <= n9440_o & n9441_o & n9442_o;
  n9454_o <= n9443_o & n9444_o & n9445_o & n9446_o;
  n9455_o <= n9447_o & n9448_o & n9449_o & n9450_o;
  n9456_o <= n9451_o & n9452_o & n9453_o;
  n9457_o <= n9454_o & n9455_o & n9456_o;
  n9458_o <= n9457_o (41 downto 0);
  n9459_o <= n9382_o & n9458_o;
  -- ../fixed_pkg.vhd:195:9
  n9460_o <= n9381_o when n9394_o = '0' else n9459_o;
  -- ../fixed_pkg.vhd:168:39
  n9476_o <= n9460_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9477_o <= n9460_o (42);
  -- ../fixed_pkg.vhd:185:23
  n9481_o <= n9460_o (41);
  -- ../fixed_pkg.vhd:185:27
  n9482_o <= '1' when n9481_o /= n9477_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n9489_o <= '0' when n9482_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n9493_o <= '1' when n9482_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n9495_o <= n9460_o (40);
  -- ../fixed_pkg.vhd:185:27
  n9496_o <= '1' when n9495_o /= n9477_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n9498_o <= n9489_o when n9507_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n9504_o <= n9496_o and n9493_o;
  -- ../fixed_pkg.vhd:185:17
  n9507_o <= n9493_o and n9504_o;
  -- ../fixed_pkg.vhd:196:31
  n9509_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9510_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9511_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9512_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9513_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9514_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9515_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9516_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9517_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9518_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9519_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9520_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9521_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9522_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9523_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9524_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9525_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9526_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9527_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9528_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9529_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9530_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9531_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9532_o <= not n9477_o;
  -- ../fixed_pkg.vhd:196:31
  n9533_o <= not n9477_o;
  n9534_o <= n9509_o & n9510_o & n9511_o & n9512_o;
  n9535_o <= n9513_o & n9514_o & n9515_o & n9516_o;
  n9536_o <= n9517_o & n9518_o & n9519_o & n9520_o;
  n9537_o <= n9521_o & n9522_o & n9523_o & n9524_o;
  n9538_o <= n9525_o & n9526_o & n9527_o & n9528_o;
  n9539_o <= n9529_o & n9530_o & n9531_o & n9532_o;
  n9540_o <= n9534_o & n9535_o & n9536_o & n9537_o;
  n9541_o <= n9538_o & n9539_o & n9533_o;
  n9542_o <= n9540_o & n9541_o;
  n9543_o <= n9542_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n9544_o <= n9476_o (40 downto 16);
  n9545_o <= n9477_o & n9543_o;
  -- ../fixed_pkg.vhd:195:9
  n9546_o <= n9544_o when n9498_o = '0' else n9545_o;
  -- ../fixed_pkg.vhd:268:100
  n9561_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n9564_o <= std_logic_vector (resize (signed (n9561_o) * signed'("0000000000011111111111111111111101010101010"), 43));
  -- ../fixed_pkg.vhd:268:100
  n9576_o <= std_logic_vector (resize (signed (n9149_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n9579_o <= std_logic_vector (resize (signed (n9576_o) * signed'("0000000000000000000000000001111010101010100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n9596_o <= std_logic_vector (resize (signed (n9564_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n9611_o <= std_logic_vector (resize (signed (n9579_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n9626_o <= std_logic_vector (unsigned (n9596_o) - unsigned (n9611_o));
  -- ../fixed_pkg.vhd:168:39
  n9637_o <= n9626_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9638_o <= n9626_o (43);
  -- ../fixed_pkg.vhd:185:23
  n9642_o <= n9626_o (42);
  -- ../fixed_pkg.vhd:185:27
  n9643_o <= '1' when n9642_o /= n9638_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n9650_o <= '0' when n9643_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n9656_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9657_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9658_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9659_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9660_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9661_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9662_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9663_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9664_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9665_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9666_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9667_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9668_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9669_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9670_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9671_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9672_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9673_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9674_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9675_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9676_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9677_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9678_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9679_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9680_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9681_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9682_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9683_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9684_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9685_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9686_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9687_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9688_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9689_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9690_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9691_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9692_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9693_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9694_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9695_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9696_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9697_o <= not n9638_o;
  -- ../fixed_pkg.vhd:196:31
  n9698_o <= not n9638_o;
  n9699_o <= n9656_o & n9657_o & n9658_o & n9659_o;
  n9700_o <= n9660_o & n9661_o & n9662_o & n9663_o;
  n9701_o <= n9664_o & n9665_o & n9666_o & n9667_o;
  n9702_o <= n9668_o & n9669_o & n9670_o & n9671_o;
  n9703_o <= n9672_o & n9673_o & n9674_o & n9675_o;
  n9704_o <= n9676_o & n9677_o & n9678_o & n9679_o;
  n9705_o <= n9680_o & n9681_o & n9682_o & n9683_o;
  n9706_o <= n9684_o & n9685_o & n9686_o & n9687_o;
  n9707_o <= n9688_o & n9689_o & n9690_o & n9691_o;
  n9708_o <= n9692_o & n9693_o & n9694_o & n9695_o;
  n9709_o <= n9696_o & n9697_o & n9698_o;
  n9710_o <= n9699_o & n9700_o & n9701_o & n9702_o;
  n9711_o <= n9703_o & n9704_o & n9705_o & n9706_o;
  n9712_o <= n9707_o & n9708_o & n9709_o;
  n9713_o <= n9710_o & n9711_o & n9712_o;
  n9714_o <= n9713_o (41 downto 0);
  n9715_o <= n9638_o & n9714_o;
  -- ../fixed_pkg.vhd:195:9
  n9716_o <= n9637_o when n9650_o = '0' else n9715_o;
  -- ../fixed_pkg.vhd:168:39
  n9732_o <= n9716_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9733_o <= n9716_o (42);
  -- ../fixed_pkg.vhd:185:23
  n9737_o <= n9716_o (41);
  -- ../fixed_pkg.vhd:185:27
  n9738_o <= '1' when n9737_o /= n9733_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n9745_o <= '0' when n9738_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n9749_o <= '1' when n9738_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n9751_o <= n9716_o (40);
  -- ../fixed_pkg.vhd:185:27
  n9752_o <= '1' when n9751_o /= n9733_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n9754_o <= n9745_o when n9763_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n9760_o <= n9752_o and n9749_o;
  -- ../fixed_pkg.vhd:185:17
  n9763_o <= n9749_o and n9760_o;
  -- ../fixed_pkg.vhd:196:31
  n9765_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9766_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9767_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9768_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9769_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9770_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9771_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9772_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9773_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9774_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9775_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9776_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9777_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9778_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9779_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9780_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9781_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9782_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9783_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9784_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9785_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9786_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9787_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9788_o <= not n9733_o;
  -- ../fixed_pkg.vhd:196:31
  n9789_o <= not n9733_o;
  n9790_o <= n9765_o & n9766_o & n9767_o & n9768_o;
  n9791_o <= n9769_o & n9770_o & n9771_o & n9772_o;
  n9792_o <= n9773_o & n9774_o & n9775_o & n9776_o;
  n9793_o <= n9777_o & n9778_o & n9779_o & n9780_o;
  n9794_o <= n9781_o & n9782_o & n9783_o & n9784_o;
  n9795_o <= n9785_o & n9786_o & n9787_o & n9788_o;
  n9796_o <= n9790_o & n9791_o & n9792_o & n9793_o;
  n9797_o <= n9794_o & n9795_o & n9789_o;
  n9798_o <= n9796_o & n9797_o;
  n9799_o <= n9798_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n9800_o <= n9732_o (40 downto 16);
  n9801_o <= n9733_o & n9799_o;
  -- ../fixed_pkg.vhd:195:9
  n9802_o <= n9800_o when n9754_o = '0' else n9801_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n9805_o <= '1' when state_reg = "01" else '0';
  n9806_o <= n9805_o & n8907_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n9806_o select n9807_o <=
    x_reg when "10",
    n8905_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n9806_o select n9808_o <=
    n9149_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n9806_o select n9809_o <=
    n9546_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n9806_o select n9810_o <=
    n9802_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n9825_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n9826_o <= x_reg when n9825_o = '0' else n9807_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n9827_q <= n9826_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n9828_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n9829_o <= y_reg when n9828_o = '0' else n9808_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n9830_q <= n9829_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n9831_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n9831_q <= n9809_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n9832_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n9832_q <= n9810_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n9851_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9852_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n9856_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n9857_o <= '1' when n9856_o /= n9852_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n9864_o <= '0' when n9857_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n9868_o <= '1' when n9857_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n9870_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n9871_o <= '1' when n9870_o /= n9852_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n9873_o <= n9864_o when n9882_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n9879_o <= n9871_o and n9868_o;
  -- ../fixed_pkg.vhd:185:17
  n9882_o <= n9868_o and n9879_o;
  -- ../fixed_pkg.vhd:196:31
  n9884_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9885_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9886_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9887_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9888_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9889_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9890_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9891_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9892_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9893_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9894_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9895_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9896_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9897_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9898_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9899_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9900_o <= not n9852_o;
  -- ../fixed_pkg.vhd:196:31
  n9901_o <= not n9852_o;
  n9902_o <= n9884_o & n9885_o & n9886_o & n9887_o;
  n9903_o <= n9888_o & n9889_o & n9890_o & n9891_o;
  n9904_o <= n9892_o & n9893_o & n9894_o & n9895_o;
  n9905_o <= n9896_o & n9897_o & n9898_o & n9899_o;
  n9906_o <= n9900_o & n9901_o;
  n9907_o <= n9902_o & n9903_o & n9904_o & n9905_o;
  n9908_o <= n9907_o & n9906_o;
  n9909_o <= n9908_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n9910_o <= n9851_o (22 downto 5);
  n9911_o <= n9852_o & n9909_o;
  -- ../fixed_pkg.vhd:195:9
  n9912_o <= n9910_o when n9873_o = '0' else n9911_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_7b2580a4b712e4b7d247f86df16ab6a0b5823514 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_7b2580a4b712e4b7d247f86df16ab6a0b5823514;

architecture rtl of biquadfilter_7b2580a4b712e4b7d247f86df16ab6a0b5823514 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n7784_o : std_logic_vector (1 downto 0);
  signal n7786_o : std_logic;
  signal n7788_o : std_logic;
  signal n7790_o : std_logic_vector (1 downto 0);
  signal n7792_o : std_logic;
  signal n7793_o : std_logic_vector (2 downto 0);
  signal n7796_o : std_logic_vector (1 downto 0);
  signal n7801_q : std_logic_vector (1 downto 0);
  signal n7804_o : std_logic;
  signal n7805_o : std_logic;
  signal n7809_o : std_logic;
  signal n7810_o : std_logic;
  signal n7830_o : std_logic_vector (19 downto 0);
  constant n7834_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n7835_o : std_logic_vector (4 downto 0);
  signal n7836_o : std_logic_vector (24 downto 0);
  signal n7837_o : std_logic_vector (24 downto 0);
  signal n7839_o : std_logic;
  signal n7853_o : std_logic_vector (42 downto 0);
  signal n7856_o : std_logic_vector (42 downto 0);
  signal n7873_o : std_logic_vector (43 downto 0);
  signal n7888_o : std_logic_vector (27 downto 0);
  constant n7892_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n7893_o : std_logic_vector (15 downto 0);
  signal n7894_o : std_logic_vector (43 downto 0);
  signal n7905_o : std_logic_vector (43 downto 0);
  signal n7916_o : std_logic_vector (42 downto 0);
  signal n7917_o : std_logic;
  signal n7921_o : std_logic;
  signal n7922_o : std_logic;
  signal n7929_o : std_logic;
  signal n7935_o : std_logic;
  signal n7936_o : std_logic;
  signal n7937_o : std_logic;
  signal n7938_o : std_logic;
  signal n7939_o : std_logic;
  signal n7940_o : std_logic;
  signal n7941_o : std_logic;
  signal n7942_o : std_logic;
  signal n7943_o : std_logic;
  signal n7944_o : std_logic;
  signal n7945_o : std_logic;
  signal n7946_o : std_logic;
  signal n7947_o : std_logic;
  signal n7948_o : std_logic;
  signal n7949_o : std_logic;
  signal n7950_o : std_logic;
  signal n7951_o : std_logic;
  signal n7952_o : std_logic;
  signal n7953_o : std_logic;
  signal n7954_o : std_logic;
  signal n7955_o : std_logic;
  signal n7956_o : std_logic;
  signal n7957_o : std_logic;
  signal n7958_o : std_logic;
  signal n7959_o : std_logic;
  signal n7960_o : std_logic;
  signal n7961_o : std_logic;
  signal n7962_o : std_logic;
  signal n7963_o : std_logic;
  signal n7964_o : std_logic;
  signal n7965_o : std_logic;
  signal n7966_o : std_logic;
  signal n7967_o : std_logic;
  signal n7968_o : std_logic;
  signal n7969_o : std_logic;
  signal n7970_o : std_logic;
  signal n7971_o : std_logic;
  signal n7972_o : std_logic;
  signal n7973_o : std_logic;
  signal n7974_o : std_logic;
  signal n7975_o : std_logic;
  signal n7976_o : std_logic;
  signal n7977_o : std_logic;
  signal n7978_o : std_logic_vector (3 downto 0);
  signal n7979_o : std_logic_vector (3 downto 0);
  signal n7980_o : std_logic_vector (3 downto 0);
  signal n7981_o : std_logic_vector (3 downto 0);
  signal n7982_o : std_logic_vector (3 downto 0);
  signal n7983_o : std_logic_vector (3 downto 0);
  signal n7984_o : std_logic_vector (3 downto 0);
  signal n7985_o : std_logic_vector (3 downto 0);
  signal n7986_o : std_logic_vector (3 downto 0);
  signal n7987_o : std_logic_vector (3 downto 0);
  signal n7988_o : std_logic_vector (2 downto 0);
  signal n7989_o : std_logic_vector (15 downto 0);
  signal n7990_o : std_logic_vector (15 downto 0);
  signal n7991_o : std_logic_vector (10 downto 0);
  signal n7992_o : std_logic_vector (42 downto 0);
  signal n7993_o : std_logic_vector (41 downto 0);
  signal n7994_o : std_logic_vector (42 downto 0);
  signal n7995_o : std_logic_vector (42 downto 0);
  signal n8011_o : std_logic_vector (40 downto 0);
  signal n8012_o : std_logic;
  signal n8016_o : std_logic;
  signal n8017_o : std_logic;
  signal n8024_o : std_logic;
  signal n8028_o : std_logic;
  signal n8030_o : std_logic;
  signal n8031_o : std_logic;
  signal n8033_o : std_logic;
  signal n8039_o : std_logic;
  signal n8042_o : std_logic;
  signal n8044_o : std_logic;
  signal n8045_o : std_logic;
  signal n8046_o : std_logic;
  signal n8047_o : std_logic;
  signal n8048_o : std_logic;
  signal n8049_o : std_logic;
  signal n8050_o : std_logic;
  signal n8051_o : std_logic;
  signal n8052_o : std_logic;
  signal n8053_o : std_logic;
  signal n8054_o : std_logic;
  signal n8055_o : std_logic;
  signal n8056_o : std_logic;
  signal n8057_o : std_logic;
  signal n8058_o : std_logic;
  signal n8059_o : std_logic;
  signal n8060_o : std_logic;
  signal n8061_o : std_logic;
  signal n8062_o : std_logic;
  signal n8063_o : std_logic;
  signal n8064_o : std_logic;
  signal n8065_o : std_logic;
  signal n8066_o : std_logic;
  signal n8067_o : std_logic;
  signal n8068_o : std_logic;
  signal n8069_o : std_logic_vector (3 downto 0);
  signal n8070_o : std_logic_vector (3 downto 0);
  signal n8071_o : std_logic_vector (3 downto 0);
  signal n8072_o : std_logic_vector (3 downto 0);
  signal n8073_o : std_logic_vector (3 downto 0);
  signal n8074_o : std_logic_vector (3 downto 0);
  signal n8075_o : std_logic_vector (15 downto 0);
  signal n8076_o : std_logic_vector (8 downto 0);
  signal n8077_o : std_logic_vector (24 downto 0);
  signal n8078_o : std_logic_vector (23 downto 0);
  signal n8079_o : std_logic_vector (24 downto 0);
  signal n8080_o : std_logic_vector (24 downto 0);
  signal n8081_o : std_logic_vector (24 downto 0);
  signal n8097_o : std_logic_vector (42 downto 0);
  signal n8100_o : std_logic_vector (42 downto 0);
  signal n8112_o : std_logic_vector (42 downto 0);
  signal n8115_o : std_logic_vector (42 downto 0);
  signal n8132_o : std_logic_vector (43 downto 0);
  signal n8147_o : std_logic_vector (43 downto 0);
  signal n8162_o : std_logic_vector (43 downto 0);
  signal n8173_o : std_logic_vector (42 downto 0);
  signal n8174_o : std_logic;
  signal n8178_o : std_logic;
  signal n8179_o : std_logic;
  signal n8186_o : std_logic;
  signal n8192_o : std_logic;
  signal n8193_o : std_logic;
  signal n8194_o : std_logic;
  signal n8195_o : std_logic;
  signal n8196_o : std_logic;
  signal n8197_o : std_logic;
  signal n8198_o : std_logic;
  signal n8199_o : std_logic;
  signal n8200_o : std_logic;
  signal n8201_o : std_logic;
  signal n8202_o : std_logic;
  signal n8203_o : std_logic;
  signal n8204_o : std_logic;
  signal n8205_o : std_logic;
  signal n8206_o : std_logic;
  signal n8207_o : std_logic;
  signal n8208_o : std_logic;
  signal n8209_o : std_logic;
  signal n8210_o : std_logic;
  signal n8211_o : std_logic;
  signal n8212_o : std_logic;
  signal n8213_o : std_logic;
  signal n8214_o : std_logic;
  signal n8215_o : std_logic;
  signal n8216_o : std_logic;
  signal n8217_o : std_logic;
  signal n8218_o : std_logic;
  signal n8219_o : std_logic;
  signal n8220_o : std_logic;
  signal n8221_o : std_logic;
  signal n8222_o : std_logic;
  signal n8223_o : std_logic;
  signal n8224_o : std_logic;
  signal n8225_o : std_logic;
  signal n8226_o : std_logic;
  signal n8227_o : std_logic;
  signal n8228_o : std_logic;
  signal n8229_o : std_logic;
  signal n8230_o : std_logic;
  signal n8231_o : std_logic;
  signal n8232_o : std_logic;
  signal n8233_o : std_logic;
  signal n8234_o : std_logic;
  signal n8235_o : std_logic_vector (3 downto 0);
  signal n8236_o : std_logic_vector (3 downto 0);
  signal n8237_o : std_logic_vector (3 downto 0);
  signal n8238_o : std_logic_vector (3 downto 0);
  signal n8239_o : std_logic_vector (3 downto 0);
  signal n8240_o : std_logic_vector (3 downto 0);
  signal n8241_o : std_logic_vector (3 downto 0);
  signal n8242_o : std_logic_vector (3 downto 0);
  signal n8243_o : std_logic_vector (3 downto 0);
  signal n8244_o : std_logic_vector (3 downto 0);
  signal n8245_o : std_logic_vector (2 downto 0);
  signal n8246_o : std_logic_vector (15 downto 0);
  signal n8247_o : std_logic_vector (15 downto 0);
  signal n8248_o : std_logic_vector (10 downto 0);
  signal n8249_o : std_logic_vector (42 downto 0);
  signal n8250_o : std_logic_vector (41 downto 0);
  signal n8251_o : std_logic_vector (42 downto 0);
  signal n8252_o : std_logic_vector (42 downto 0);
  signal n8270_o : std_logic_vector (43 downto 0);
  signal n8285_o : std_logic_vector (27 downto 0);
  constant n8289_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n8290_o : std_logic_vector (15 downto 0);
  signal n8291_o : std_logic_vector (43 downto 0);
  signal n8302_o : std_logic_vector (43 downto 0);
  signal n8313_o : std_logic_vector (42 downto 0);
  signal n8314_o : std_logic;
  signal n8318_o : std_logic;
  signal n8319_o : std_logic;
  signal n8326_o : std_logic;
  signal n8332_o : std_logic;
  signal n8333_o : std_logic;
  signal n8334_o : std_logic;
  signal n8335_o : std_logic;
  signal n8336_o : std_logic;
  signal n8337_o : std_logic;
  signal n8338_o : std_logic;
  signal n8339_o : std_logic;
  signal n8340_o : std_logic;
  signal n8341_o : std_logic;
  signal n8342_o : std_logic;
  signal n8343_o : std_logic;
  signal n8344_o : std_logic;
  signal n8345_o : std_logic;
  signal n8346_o : std_logic;
  signal n8347_o : std_logic;
  signal n8348_o : std_logic;
  signal n8349_o : std_logic;
  signal n8350_o : std_logic;
  signal n8351_o : std_logic;
  signal n8352_o : std_logic;
  signal n8353_o : std_logic;
  signal n8354_o : std_logic;
  signal n8355_o : std_logic;
  signal n8356_o : std_logic;
  signal n8357_o : std_logic;
  signal n8358_o : std_logic;
  signal n8359_o : std_logic;
  signal n8360_o : std_logic;
  signal n8361_o : std_logic;
  signal n8362_o : std_logic;
  signal n8363_o : std_logic;
  signal n8364_o : std_logic;
  signal n8365_o : std_logic;
  signal n8366_o : std_logic;
  signal n8367_o : std_logic;
  signal n8368_o : std_logic;
  signal n8369_o : std_logic;
  signal n8370_o : std_logic;
  signal n8371_o : std_logic;
  signal n8372_o : std_logic;
  signal n8373_o : std_logic;
  signal n8374_o : std_logic;
  signal n8375_o : std_logic_vector (3 downto 0);
  signal n8376_o : std_logic_vector (3 downto 0);
  signal n8377_o : std_logic_vector (3 downto 0);
  signal n8378_o : std_logic_vector (3 downto 0);
  signal n8379_o : std_logic_vector (3 downto 0);
  signal n8380_o : std_logic_vector (3 downto 0);
  signal n8381_o : std_logic_vector (3 downto 0);
  signal n8382_o : std_logic_vector (3 downto 0);
  signal n8383_o : std_logic_vector (3 downto 0);
  signal n8384_o : std_logic_vector (3 downto 0);
  signal n8385_o : std_logic_vector (2 downto 0);
  signal n8386_o : std_logic_vector (15 downto 0);
  signal n8387_o : std_logic_vector (15 downto 0);
  signal n8388_o : std_logic_vector (10 downto 0);
  signal n8389_o : std_logic_vector (42 downto 0);
  signal n8390_o : std_logic_vector (41 downto 0);
  signal n8391_o : std_logic_vector (42 downto 0);
  signal n8392_o : std_logic_vector (42 downto 0);
  signal n8408_o : std_logic_vector (40 downto 0);
  signal n8409_o : std_logic;
  signal n8413_o : std_logic;
  signal n8414_o : std_logic;
  signal n8421_o : std_logic;
  signal n8425_o : std_logic;
  signal n8427_o : std_logic;
  signal n8428_o : std_logic;
  signal n8430_o : std_logic;
  signal n8436_o : std_logic;
  signal n8439_o : std_logic;
  signal n8441_o : std_logic;
  signal n8442_o : std_logic;
  signal n8443_o : std_logic;
  signal n8444_o : std_logic;
  signal n8445_o : std_logic;
  signal n8446_o : std_logic;
  signal n8447_o : std_logic;
  signal n8448_o : std_logic;
  signal n8449_o : std_logic;
  signal n8450_o : std_logic;
  signal n8451_o : std_logic;
  signal n8452_o : std_logic;
  signal n8453_o : std_logic;
  signal n8454_o : std_logic;
  signal n8455_o : std_logic;
  signal n8456_o : std_logic;
  signal n8457_o : std_logic;
  signal n8458_o : std_logic;
  signal n8459_o : std_logic;
  signal n8460_o : std_logic;
  signal n8461_o : std_logic;
  signal n8462_o : std_logic;
  signal n8463_o : std_logic;
  signal n8464_o : std_logic;
  signal n8465_o : std_logic;
  signal n8466_o : std_logic_vector (3 downto 0);
  signal n8467_o : std_logic_vector (3 downto 0);
  signal n8468_o : std_logic_vector (3 downto 0);
  signal n8469_o : std_logic_vector (3 downto 0);
  signal n8470_o : std_logic_vector (3 downto 0);
  signal n8471_o : std_logic_vector (3 downto 0);
  signal n8472_o : std_logic_vector (15 downto 0);
  signal n8473_o : std_logic_vector (8 downto 0);
  signal n8474_o : std_logic_vector (24 downto 0);
  signal n8475_o : std_logic_vector (23 downto 0);
  signal n8476_o : std_logic_vector (24 downto 0);
  signal n8477_o : std_logic_vector (24 downto 0);
  signal n8478_o : std_logic_vector (24 downto 0);
  signal n8493_o : std_logic_vector (42 downto 0);
  signal n8496_o : std_logic_vector (42 downto 0);
  signal n8508_o : std_logic_vector (42 downto 0);
  signal n8511_o : std_logic_vector (42 downto 0);
  signal n8528_o : std_logic_vector (43 downto 0);
  signal n8543_o : std_logic_vector (43 downto 0);
  signal n8558_o : std_logic_vector (43 downto 0);
  signal n8569_o : std_logic_vector (42 downto 0);
  signal n8570_o : std_logic;
  signal n8574_o : std_logic;
  signal n8575_o : std_logic;
  signal n8582_o : std_logic;
  signal n8588_o : std_logic;
  signal n8589_o : std_logic;
  signal n8590_o : std_logic;
  signal n8591_o : std_logic;
  signal n8592_o : std_logic;
  signal n8593_o : std_logic;
  signal n8594_o : std_logic;
  signal n8595_o : std_logic;
  signal n8596_o : std_logic;
  signal n8597_o : std_logic;
  signal n8598_o : std_logic;
  signal n8599_o : std_logic;
  signal n8600_o : std_logic;
  signal n8601_o : std_logic;
  signal n8602_o : std_logic;
  signal n8603_o : std_logic;
  signal n8604_o : std_logic;
  signal n8605_o : std_logic;
  signal n8606_o : std_logic;
  signal n8607_o : std_logic;
  signal n8608_o : std_logic;
  signal n8609_o : std_logic;
  signal n8610_o : std_logic;
  signal n8611_o : std_logic;
  signal n8612_o : std_logic;
  signal n8613_o : std_logic;
  signal n8614_o : std_logic;
  signal n8615_o : std_logic;
  signal n8616_o : std_logic;
  signal n8617_o : std_logic;
  signal n8618_o : std_logic;
  signal n8619_o : std_logic;
  signal n8620_o : std_logic;
  signal n8621_o : std_logic;
  signal n8622_o : std_logic;
  signal n8623_o : std_logic;
  signal n8624_o : std_logic;
  signal n8625_o : std_logic;
  signal n8626_o : std_logic;
  signal n8627_o : std_logic;
  signal n8628_o : std_logic;
  signal n8629_o : std_logic;
  signal n8630_o : std_logic;
  signal n8631_o : std_logic_vector (3 downto 0);
  signal n8632_o : std_logic_vector (3 downto 0);
  signal n8633_o : std_logic_vector (3 downto 0);
  signal n8634_o : std_logic_vector (3 downto 0);
  signal n8635_o : std_logic_vector (3 downto 0);
  signal n8636_o : std_logic_vector (3 downto 0);
  signal n8637_o : std_logic_vector (3 downto 0);
  signal n8638_o : std_logic_vector (3 downto 0);
  signal n8639_o : std_logic_vector (3 downto 0);
  signal n8640_o : std_logic_vector (3 downto 0);
  signal n8641_o : std_logic_vector (2 downto 0);
  signal n8642_o : std_logic_vector (15 downto 0);
  signal n8643_o : std_logic_vector (15 downto 0);
  signal n8644_o : std_logic_vector (10 downto 0);
  signal n8645_o : std_logic_vector (42 downto 0);
  signal n8646_o : std_logic_vector (41 downto 0);
  signal n8647_o : std_logic_vector (42 downto 0);
  signal n8648_o : std_logic_vector (42 downto 0);
  signal n8664_o : std_logic_vector (40 downto 0);
  signal n8665_o : std_logic;
  signal n8669_o : std_logic;
  signal n8670_o : std_logic;
  signal n8677_o : std_logic;
  signal n8681_o : std_logic;
  signal n8683_o : std_logic;
  signal n8684_o : std_logic;
  signal n8686_o : std_logic;
  signal n8692_o : std_logic;
  signal n8695_o : std_logic;
  signal n8697_o : std_logic;
  signal n8698_o : std_logic;
  signal n8699_o : std_logic;
  signal n8700_o : std_logic;
  signal n8701_o : std_logic;
  signal n8702_o : std_logic;
  signal n8703_o : std_logic;
  signal n8704_o : std_logic;
  signal n8705_o : std_logic;
  signal n8706_o : std_logic;
  signal n8707_o : std_logic;
  signal n8708_o : std_logic;
  signal n8709_o : std_logic;
  signal n8710_o : std_logic;
  signal n8711_o : std_logic;
  signal n8712_o : std_logic;
  signal n8713_o : std_logic;
  signal n8714_o : std_logic;
  signal n8715_o : std_logic;
  signal n8716_o : std_logic;
  signal n8717_o : std_logic;
  signal n8718_o : std_logic;
  signal n8719_o : std_logic;
  signal n8720_o : std_logic;
  signal n8721_o : std_logic;
  signal n8722_o : std_logic_vector (3 downto 0);
  signal n8723_o : std_logic_vector (3 downto 0);
  signal n8724_o : std_logic_vector (3 downto 0);
  signal n8725_o : std_logic_vector (3 downto 0);
  signal n8726_o : std_logic_vector (3 downto 0);
  signal n8727_o : std_logic_vector (3 downto 0);
  signal n8728_o : std_logic_vector (15 downto 0);
  signal n8729_o : std_logic_vector (8 downto 0);
  signal n8730_o : std_logic_vector (24 downto 0);
  signal n8731_o : std_logic_vector (23 downto 0);
  signal n8732_o : std_logic_vector (24 downto 0);
  signal n8733_o : std_logic_vector (24 downto 0);
  signal n8734_o : std_logic_vector (24 downto 0);
  signal n8737_o : std_logic;
  signal n8738_o : std_logic_vector (1 downto 0);
  signal n8739_o : std_logic_vector (24 downto 0);
  signal n8740_o : std_logic_vector (24 downto 0);
  signal n8741_o : std_logic_vector (24 downto 0);
  signal n8742_o : std_logic_vector (24 downto 0);
  signal n8757_o : std_logic;
  signal n8758_o : std_logic_vector (24 downto 0);
  signal n8759_q : std_logic_vector (24 downto 0);
  signal n8760_o : std_logic;
  signal n8761_o : std_logic_vector (24 downto 0);
  signal n8762_q : std_logic_vector (24 downto 0);
  signal n8763_q : std_logic_vector (24 downto 0);
  signal n8764_q : std_logic_vector (24 downto 0);
  signal n8783_o : std_logic_vector (22 downto 0);
  signal n8784_o : std_logic;
  signal n8788_o : std_logic;
  signal n8789_o : std_logic;
  signal n8796_o : std_logic;
  signal n8800_o : std_logic;
  signal n8802_o : std_logic;
  signal n8803_o : std_logic;
  signal n8805_o : std_logic;
  signal n8811_o : std_logic;
  signal n8814_o : std_logic;
  signal n8816_o : std_logic;
  signal n8817_o : std_logic;
  signal n8818_o : std_logic;
  signal n8819_o : std_logic;
  signal n8820_o : std_logic;
  signal n8821_o : std_logic;
  signal n8822_o : std_logic;
  signal n8823_o : std_logic;
  signal n8824_o : std_logic;
  signal n8825_o : std_logic;
  signal n8826_o : std_logic;
  signal n8827_o : std_logic;
  signal n8828_o : std_logic;
  signal n8829_o : std_logic;
  signal n8830_o : std_logic;
  signal n8831_o : std_logic;
  signal n8832_o : std_logic;
  signal n8833_o : std_logic;
  signal n8834_o : std_logic_vector (3 downto 0);
  signal n8835_o : std_logic_vector (3 downto 0);
  signal n8836_o : std_logic_vector (3 downto 0);
  signal n8837_o : std_logic_vector (3 downto 0);
  signal n8838_o : std_logic_vector (1 downto 0);
  signal n8839_o : std_logic_vector (15 downto 0);
  signal n8840_o : std_logic_vector (17 downto 0);
  signal n8841_o : std_logic_vector (16 downto 0);
  signal n8842_o : std_logic_vector (17 downto 0);
  signal n8843_o : std_logic_vector (17 downto 0);
  signal n8844_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n7805_o;
  valid_o <= n7810_o;
  data_o <= n8844_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n7801_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n8759_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n8762_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n8763_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n8764_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n7784_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n7786_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n7788_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n7790_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n7792_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:170:18
  n7793_o <= n7792_o & n7788_o & n7786_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n7793_o select n7796_o <=
    n7790_o when "100",
    "10" when "010",
    n7784_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n7801_q <= "00";
    elsif rising_edge (clk_i) then
      n7801_q <= n7796_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n7804_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n7805_o <= '0' when n7804_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n7809_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n7810_o <= '0' when n7809_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n7830_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n7835_o <= n7834_o (4 downto 0);
  n7836_o <= n7830_o & n7835_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n7837_o <= x_reg when valid_i = '0' else n7836_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n7839_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n7853_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n7856_o <= std_logic_vector (resize (signed (n7853_o) * signed'("0000000000000000000000000000000010010100000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n7873_o <= std_logic_vector (resize (signed (n7856_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n7888_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n7893_o <= n7892_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n7894_o <= n7888_o & n7893_o;
  -- ../fixed_pkg.vhd:257:67
  n7905_o <= std_logic_vector (unsigned (n7873_o) + unsigned (n7894_o));
  -- ../fixed_pkg.vhd:168:39
  n7916_o <= n7905_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7917_o <= n7905_o (43);
  -- ../fixed_pkg.vhd:185:23
  n7921_o <= n7905_o (42);
  -- ../fixed_pkg.vhd:185:27
  n7922_o <= '1' when n7921_o /= n7917_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n7929_o <= '0' when n7922_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n7935_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7936_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7937_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7938_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7939_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7940_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7941_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7942_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7943_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7944_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7945_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7946_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7947_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7948_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7949_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7950_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7951_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7952_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7953_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7954_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7955_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7956_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7957_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7958_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7959_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7960_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7961_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7962_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7963_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7964_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7965_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7966_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7967_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7968_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7969_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7970_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7971_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7972_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7973_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7974_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7975_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7976_o <= not n7917_o;
  -- ../fixed_pkg.vhd:196:31
  n7977_o <= not n7917_o;
  -- ../fixed_pkg.vhd:184:13
  n7978_o <= n7935_o & n7936_o & n7937_o & n7938_o;
  -- ../fixed_pkg.vhd:171:18
  n7979_o <= n7939_o & n7940_o & n7941_o & n7942_o;
  n7980_o <= n7943_o & n7944_o & n7945_o & n7946_o;
  -- ../fixed_pkg.vhd:170:18
  n7981_o <= n7947_o & n7948_o & n7949_o & n7950_o;
  n7982_o <= n7951_o & n7952_o & n7953_o & n7954_o;
  -- ../fixed_pkg.vhd:9:14
  n7983_o <= n7955_o & n7956_o & n7957_o & n7958_o;
  -- ../fixed_pkg.vhd:9:14
  n7984_o <= n7959_o & n7960_o & n7961_o & n7962_o;
  n7985_o <= n7963_o & n7964_o & n7965_o & n7966_o;
  -- ../fixed_pkg.vhd:9:14
  n7986_o <= n7967_o & n7968_o & n7969_o & n7970_o;
  -- ../fixed_pkg.vhd:24:14
  n7987_o <= n7971_o & n7972_o & n7973_o & n7974_o;
  -- ../fixed_pkg.vhd:24:14
  n7988_o <= n7975_o & n7976_o & n7977_o;
  n7989_o <= n7978_o & n7979_o & n7980_o & n7981_o;
  -- ../fixed_pkg.vhd:24:14
  n7990_o <= n7982_o & n7983_o & n7984_o & n7985_o;
  -- ../fixed_pkg.vhd:9:14
  n7991_o <= n7986_o & n7987_o & n7988_o;
  -- ../fixed_pkg.vhd:9:14
  n7992_o <= n7989_o & n7990_o & n7991_o;
  n7993_o <= n7992_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n7994_o <= n7917_o & n7993_o;
  -- ../fixed_pkg.vhd:195:9
  n7995_o <= n7916_o when n7929_o = '0' else n7994_o;
  -- ../fixed_pkg.vhd:168:39
  n8011_o <= n7995_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8012_o <= n7995_o (42);
  -- ../fixed_pkg.vhd:185:23
  n8016_o <= n7995_o (41);
  -- ../fixed_pkg.vhd:185:27
  n8017_o <= '1' when n8016_o /= n8012_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8024_o <= '0' when n8017_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n8028_o <= '1' when n8017_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n8030_o <= n7995_o (40);
  -- ../fixed_pkg.vhd:185:27
  n8031_o <= '1' when n8030_o /= n8012_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8033_o <= n8024_o when n8042_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n8039_o <= n8031_o and n8028_o;
  -- ../fixed_pkg.vhd:185:17
  n8042_o <= n8028_o and n8039_o;
  -- ../fixed_pkg.vhd:196:31
  n8044_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8045_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8046_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8047_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8048_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8049_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8050_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8051_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8052_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8053_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8054_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8055_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8056_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8057_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8058_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8059_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8060_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8061_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8062_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8063_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8064_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8065_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8066_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8067_o <= not n8012_o;
  -- ../fixed_pkg.vhd:196:31
  n8068_o <= not n8012_o;
  -- ../fixed_pkg.vhd:9:14
  n8069_o <= n8044_o & n8045_o & n8046_o & n8047_o;
  -- ../fixed_pkg.vhd:9:14
  n8070_o <= n8048_o & n8049_o & n8050_o & n8051_o;
  -- ../fixed_pkg.vhd:24:14
  n8071_o <= n8052_o & n8053_o & n8054_o & n8055_o;
  -- ../fixed_pkg.vhd:24:14
  n8072_o <= n8056_o & n8057_o & n8058_o & n8059_o;
  -- ../fixed_pkg.vhd:171:18
  n8073_o <= n8060_o & n8061_o & n8062_o & n8063_o;
  -- ../fixed_pkg.vhd:24:14
  n8074_o <= n8064_o & n8065_o & n8066_o & n8067_o;
  -- ../fixed_pkg.vhd:9:14
  n8075_o <= n8069_o & n8070_o & n8071_o & n8072_o;
  -- ../fixed_pkg.vhd:171:18
  n8076_o <= n8073_o & n8074_o & n8068_o;
  -- ../fixed_pkg.vhd:185:17
  n8077_o <= n8075_o & n8076_o;
  -- ../fixed_pkg.vhd:170:18
  n8078_o <= n8077_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n8079_o <= n8011_o (40 downto 16);
  -- ../fixed_pkg.vhd:169:40
  n8080_o <= n8012_o & n8078_o;
  -- ../fixed_pkg.vhd:195:9
  n8081_o <= n8079_o when n8033_o = '0' else n8080_o;
  -- ../fixed_pkg.vhd:268:100
  n8097_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n8100_o <= std_logic_vector (resize (signed (n8097_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n8112_o <= std_logic_vector (resize (signed (n8081_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n8115_o <= std_logic_vector (resize (signed (n8112_o) * signed'("0000000000011111111111111100010110010001111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n8132_o <= std_logic_vector (resize (signed (n8100_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n8147_o <= std_logic_vector (resize (signed (n8115_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n8162_o <= std_logic_vector (unsigned (n8132_o) - unsigned (n8147_o));
  -- ../fixed_pkg.vhd:168:39
  n8173_o <= n8162_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8174_o <= n8162_o (43);
  -- ../fixed_pkg.vhd:185:23
  n8178_o <= n8162_o (42);
  -- ../fixed_pkg.vhd:185:27
  n8179_o <= '1' when n8178_o /= n8174_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8186_o <= '0' when n8179_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n8192_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8193_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8194_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8195_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8196_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8197_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8198_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8199_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8200_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8201_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8202_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8203_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8204_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8205_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8206_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8207_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8208_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8209_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8210_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8211_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8212_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8213_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8214_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8215_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8216_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8217_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8218_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8219_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8220_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8221_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8222_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8223_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8224_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8225_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8226_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8227_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8228_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8229_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8230_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8231_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8232_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8233_o <= not n8174_o;
  -- ../fixed_pkg.vhd:196:31
  n8234_o <= not n8174_o;
  -- ../fixed_pkg.vhd:9:14
  n8235_o <= n8192_o & n8193_o & n8194_o & n8195_o;
  -- ../fixed_pkg.vhd:24:14
  n8236_o <= n8196_o & n8197_o & n8198_o & n8199_o;
  -- ../fixed_pkg.vhd:24:14
  n8237_o <= n8200_o & n8201_o & n8202_o & n8203_o;
  -- ../fixed_pkg.vhd:185:17
  n8238_o <= n8204_o & n8205_o & n8206_o & n8207_o;
  -- ../fixed_pkg.vhd:24:14
  n8239_o <= n8208_o & n8209_o & n8210_o & n8211_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n8240_o <= n8212_o & n8213_o & n8214_o & n8215_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n8241_o <= n8216_o & n8217_o & n8218_o & n8219_o;
  -- ../fixed_pkg.vhd:185:17
  n8242_o <= n8220_o & n8221_o & n8222_o & n8223_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n8243_o <= n8224_o & n8225_o & n8226_o & n8227_o;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n8244_o <= n8228_o & n8229_o & n8230_o & n8231_o;
  -- ../BiquadFilter/BiquadFilter.vhd:53:18
  n8245_o <= n8232_o & n8233_o & n8234_o;
  n8246_o <= n8235_o & n8236_o & n8237_o & n8238_o;
  -- ../fixed_pkg.vhd:24:14
  n8247_o <= n8239_o & n8240_o & n8241_o & n8242_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n8248_o <= n8243_o & n8244_o & n8245_o;
  n8249_o <= n8246_o & n8247_o & n8248_o;
  n8250_o <= n8249_o (41 downto 0);
  n8251_o <= n8174_o & n8250_o;
  -- ../fixed_pkg.vhd:195:9
  n8252_o <= n8173_o when n8186_o = '0' else n8251_o;
  -- ../fixed_pkg.vhd:168:39
  n8270_o <= std_logic_vector (resize (signed (n8252_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n8285_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n8290_o <= n8289_o (15 downto 0);
  n8291_o <= n8285_o & n8290_o;
  -- ../fixed_pkg.vhd:257:67
  n8302_o <= std_logic_vector (unsigned (n8270_o) + unsigned (n8291_o));
  -- ../fixed_pkg.vhd:168:39
  n8313_o <= n8302_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8314_o <= n8302_o (43);
  -- ../fixed_pkg.vhd:185:23
  n8318_o <= n8302_o (42);
  -- ../fixed_pkg.vhd:185:27
  n8319_o <= '1' when n8318_o /= n8314_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8326_o <= '0' when n8319_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n8332_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8333_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8334_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8335_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8336_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8337_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8338_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8339_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8340_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8341_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8342_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8343_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8344_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8345_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8346_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8347_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8348_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8349_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8350_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8351_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8352_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8353_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8354_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8355_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8356_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8357_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8358_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8359_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8360_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8361_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8362_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8363_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8364_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8365_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8366_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8367_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8368_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8369_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8370_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8371_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8372_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8373_o <= not n8314_o;
  -- ../fixed_pkg.vhd:196:31
  n8374_o <= not n8314_o;
  n8375_o <= n8332_o & n8333_o & n8334_o & n8335_o;
  n8376_o <= n8336_o & n8337_o & n8338_o & n8339_o;
  n8377_o <= n8340_o & n8341_o & n8342_o & n8343_o;
  n8378_o <= n8344_o & n8345_o & n8346_o & n8347_o;
  n8379_o <= n8348_o & n8349_o & n8350_o & n8351_o;
  n8380_o <= n8352_o & n8353_o & n8354_o & n8355_o;
  n8381_o <= n8356_o & n8357_o & n8358_o & n8359_o;
  n8382_o <= n8360_o & n8361_o & n8362_o & n8363_o;
  n8383_o <= n8364_o & n8365_o & n8366_o & n8367_o;
  n8384_o <= n8368_o & n8369_o & n8370_o & n8371_o;
  n8385_o <= n8372_o & n8373_o & n8374_o;
  n8386_o <= n8375_o & n8376_o & n8377_o & n8378_o;
  n8387_o <= n8379_o & n8380_o & n8381_o & n8382_o;
  n8388_o <= n8383_o & n8384_o & n8385_o;
  n8389_o <= n8386_o & n8387_o & n8388_o;
  n8390_o <= n8389_o (41 downto 0);
  n8391_o <= n8314_o & n8390_o;
  -- ../fixed_pkg.vhd:195:9
  n8392_o <= n8313_o when n8326_o = '0' else n8391_o;
  -- ../fixed_pkg.vhd:168:39
  n8408_o <= n8392_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8409_o <= n8392_o (42);
  -- ../fixed_pkg.vhd:185:23
  n8413_o <= n8392_o (41);
  -- ../fixed_pkg.vhd:185:27
  n8414_o <= '1' when n8413_o /= n8409_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8421_o <= '0' when n8414_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n8425_o <= '1' when n8414_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n8427_o <= n8392_o (40);
  -- ../fixed_pkg.vhd:185:27
  n8428_o <= '1' when n8427_o /= n8409_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8430_o <= n8421_o when n8439_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n8436_o <= n8428_o and n8425_o;
  -- ../fixed_pkg.vhd:185:17
  n8439_o <= n8425_o and n8436_o;
  -- ../fixed_pkg.vhd:196:31
  n8441_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8442_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8443_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8444_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8445_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8446_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8447_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8448_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8449_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8450_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8451_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8452_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8453_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8454_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8455_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8456_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8457_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8458_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8459_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8460_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8461_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8462_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8463_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8464_o <= not n8409_o;
  -- ../fixed_pkg.vhd:196:31
  n8465_o <= not n8409_o;
  n8466_o <= n8441_o & n8442_o & n8443_o & n8444_o;
  n8467_o <= n8445_o & n8446_o & n8447_o & n8448_o;
  n8468_o <= n8449_o & n8450_o & n8451_o & n8452_o;
  n8469_o <= n8453_o & n8454_o & n8455_o & n8456_o;
  n8470_o <= n8457_o & n8458_o & n8459_o & n8460_o;
  n8471_o <= n8461_o & n8462_o & n8463_o & n8464_o;
  n8472_o <= n8466_o & n8467_o & n8468_o & n8469_o;
  n8473_o <= n8470_o & n8471_o & n8465_o;
  n8474_o <= n8472_o & n8473_o;
  n8475_o <= n8474_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n8476_o <= n8408_o (40 downto 16);
  n8477_o <= n8409_o & n8475_o;
  -- ../fixed_pkg.vhd:195:9
  n8478_o <= n8476_o when n8430_o = '0' else n8477_o;
  -- ../fixed_pkg.vhd:268:100
  n8493_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n8496_o <= std_logic_vector (resize (signed (n8493_o) * signed'("0000000000011111111111111111111101101100000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n8508_o <= std_logic_vector (resize (signed (n8081_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n8511_o <= std_logic_vector (resize (signed (n8508_o) * signed'("0000000000000000000000000001111011010111111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n8528_o <= std_logic_vector (resize (signed (n8496_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n8543_o <= std_logic_vector (resize (signed (n8511_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n8558_o <= std_logic_vector (unsigned (n8528_o) - unsigned (n8543_o));
  -- ../fixed_pkg.vhd:168:39
  n8569_o <= n8558_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8570_o <= n8558_o (43);
  -- ../fixed_pkg.vhd:185:23
  n8574_o <= n8558_o (42);
  -- ../fixed_pkg.vhd:185:27
  n8575_o <= '1' when n8574_o /= n8570_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8582_o <= '0' when n8575_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n8588_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8589_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8590_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8591_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8592_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8593_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8594_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8595_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8596_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8597_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8598_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8599_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8600_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8601_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8602_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8603_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8604_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8605_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8606_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8607_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8608_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8609_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8610_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8611_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8612_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8613_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8614_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8615_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8616_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8617_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8618_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8619_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8620_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8621_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8622_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8623_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8624_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8625_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8626_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8627_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8628_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8629_o <= not n8570_o;
  -- ../fixed_pkg.vhd:196:31
  n8630_o <= not n8570_o;
  n8631_o <= n8588_o & n8589_o & n8590_o & n8591_o;
  n8632_o <= n8592_o & n8593_o & n8594_o & n8595_o;
  n8633_o <= n8596_o & n8597_o & n8598_o & n8599_o;
  n8634_o <= n8600_o & n8601_o & n8602_o & n8603_o;
  n8635_o <= n8604_o & n8605_o & n8606_o & n8607_o;
  n8636_o <= n8608_o & n8609_o & n8610_o & n8611_o;
  n8637_o <= n8612_o & n8613_o & n8614_o & n8615_o;
  n8638_o <= n8616_o & n8617_o & n8618_o & n8619_o;
  n8639_o <= n8620_o & n8621_o & n8622_o & n8623_o;
  n8640_o <= n8624_o & n8625_o & n8626_o & n8627_o;
  n8641_o <= n8628_o & n8629_o & n8630_o;
  n8642_o <= n8631_o & n8632_o & n8633_o & n8634_o;
  n8643_o <= n8635_o & n8636_o & n8637_o & n8638_o;
  n8644_o <= n8639_o & n8640_o & n8641_o;
  n8645_o <= n8642_o & n8643_o & n8644_o;
  n8646_o <= n8645_o (41 downto 0);
  n8647_o <= n8570_o & n8646_o;
  -- ../fixed_pkg.vhd:195:9
  n8648_o <= n8569_o when n8582_o = '0' else n8647_o;
  -- ../fixed_pkg.vhd:168:39
  n8664_o <= n8648_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8665_o <= n8648_o (42);
  -- ../fixed_pkg.vhd:185:23
  n8669_o <= n8648_o (41);
  -- ../fixed_pkg.vhd:185:27
  n8670_o <= '1' when n8669_o /= n8665_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8677_o <= '0' when n8670_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n8681_o <= '1' when n8670_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n8683_o <= n8648_o (40);
  -- ../fixed_pkg.vhd:185:27
  n8684_o <= '1' when n8683_o /= n8665_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8686_o <= n8677_o when n8695_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n8692_o <= n8684_o and n8681_o;
  -- ../fixed_pkg.vhd:185:17
  n8695_o <= n8681_o and n8692_o;
  -- ../fixed_pkg.vhd:196:31
  n8697_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8698_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8699_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8700_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8701_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8702_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8703_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8704_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8705_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8706_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8707_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8708_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8709_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8710_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8711_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8712_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8713_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8714_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8715_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8716_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8717_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8718_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8719_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8720_o <= not n8665_o;
  -- ../fixed_pkg.vhd:196:31
  n8721_o <= not n8665_o;
  n8722_o <= n8697_o & n8698_o & n8699_o & n8700_o;
  n8723_o <= n8701_o & n8702_o & n8703_o & n8704_o;
  n8724_o <= n8705_o & n8706_o & n8707_o & n8708_o;
  n8725_o <= n8709_o & n8710_o & n8711_o & n8712_o;
  n8726_o <= n8713_o & n8714_o & n8715_o & n8716_o;
  n8727_o <= n8717_o & n8718_o & n8719_o & n8720_o;
  n8728_o <= n8722_o & n8723_o & n8724_o & n8725_o;
  n8729_o <= n8726_o & n8727_o & n8721_o;
  n8730_o <= n8728_o & n8729_o;
  n8731_o <= n8730_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n8732_o <= n8664_o (40 downto 16);
  n8733_o <= n8665_o & n8731_o;
  -- ../fixed_pkg.vhd:195:9
  n8734_o <= n8732_o when n8686_o = '0' else n8733_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n8737_o <= '1' when state_reg = "01" else '0';
  n8738_o <= n8737_o & n7839_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n8738_o select n8739_o <=
    x_reg when "10",
    n7837_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n8738_o select n8740_o <=
    n8081_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n8738_o select n8741_o <=
    n8478_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n8738_o select n8742_o <=
    n8734_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n8757_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n8758_o <= x_reg when n8757_o = '0' else n8739_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n8759_q <= n8758_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n8760_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n8761_o <= y_reg when n8760_o = '0' else n8740_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n8762_q <= n8761_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n8763_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n8763_q <= n8741_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n8764_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n8764_q <= n8742_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n8783_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8784_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n8788_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n8789_o <= '1' when n8788_o /= n8784_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8796_o <= '0' when n8789_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n8800_o <= '1' when n8789_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n8802_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n8803_o <= '1' when n8802_o /= n8784_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n8805_o <= n8796_o when n8814_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n8811_o <= n8803_o and n8800_o;
  -- ../fixed_pkg.vhd:185:17
  n8814_o <= n8800_o and n8811_o;
  -- ../fixed_pkg.vhd:196:31
  n8816_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8817_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8818_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8819_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8820_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8821_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8822_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8823_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8824_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8825_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8826_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8827_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8828_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8829_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8830_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8831_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8832_o <= not n8784_o;
  -- ../fixed_pkg.vhd:196:31
  n8833_o <= not n8784_o;
  n8834_o <= n8816_o & n8817_o & n8818_o & n8819_o;
  n8835_o <= n8820_o & n8821_o & n8822_o & n8823_o;
  n8836_o <= n8824_o & n8825_o & n8826_o & n8827_o;
  n8837_o <= n8828_o & n8829_o & n8830_o & n8831_o;
  n8838_o <= n8832_o & n8833_o;
  n8839_o <= n8834_o & n8835_o & n8836_o & n8837_o;
  n8840_o <= n8839_o & n8838_o;
  n8841_o <= n8840_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n8842_o <= n8783_o (22 downto 5);
  n8843_o <= n8784_o & n8841_o;
  -- ../fixed_pkg.vhd:195:9
  n8844_o <= n8842_o when n8805_o = '0' else n8843_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_fe6dfdc304e908e186d08440fe9f1574ff586857 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_fe6dfdc304e908e186d08440fe9f1574ff586857;

architecture rtl of biquadfilter_fe6dfdc304e908e186d08440fe9f1574ff586857 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n6716_o : std_logic_vector (1 downto 0);
  signal n6718_o : std_logic;
  signal n6720_o : std_logic;
  signal n6722_o : std_logic_vector (1 downto 0);
  signal n6724_o : std_logic;
  signal n6725_o : std_logic_vector (2 downto 0);
  signal n6728_o : std_logic_vector (1 downto 0);
  signal n6733_q : std_logic_vector (1 downto 0);
  signal n6736_o : std_logic;
  signal n6737_o : std_logic;
  signal n6741_o : std_logic;
  signal n6742_o : std_logic;
  signal n6762_o : std_logic_vector (19 downto 0);
  constant n6766_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n6767_o : std_logic_vector (4 downto 0);
  signal n6768_o : std_logic_vector (24 downto 0);
  signal n6769_o : std_logic_vector (24 downto 0);
  signal n6771_o : std_logic;
  signal n6785_o : std_logic_vector (42 downto 0);
  signal n6788_o : std_logic_vector (42 downto 0);
  signal n6805_o : std_logic_vector (43 downto 0);
  signal n6820_o : std_logic_vector (27 downto 0);
  constant n6824_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n6825_o : std_logic_vector (15 downto 0);
  signal n6826_o : std_logic_vector (43 downto 0);
  signal n6837_o : std_logic_vector (43 downto 0);
  signal n6848_o : std_logic_vector (42 downto 0);
  signal n6849_o : std_logic;
  signal n6853_o : std_logic;
  signal n6854_o : std_logic;
  signal n6861_o : std_logic;
  signal n6867_o : std_logic;
  signal n6868_o : std_logic;
  signal n6869_o : std_logic;
  signal n6870_o : std_logic;
  signal n6871_o : std_logic;
  signal n6872_o : std_logic;
  signal n6873_o : std_logic;
  signal n6874_o : std_logic;
  signal n6875_o : std_logic;
  signal n6876_o : std_logic;
  signal n6877_o : std_logic;
  signal n6878_o : std_logic;
  signal n6879_o : std_logic;
  signal n6880_o : std_logic;
  signal n6881_o : std_logic;
  signal n6882_o : std_logic;
  signal n6883_o : std_logic;
  signal n6884_o : std_logic;
  signal n6885_o : std_logic;
  signal n6886_o : std_logic;
  signal n6887_o : std_logic;
  signal n6888_o : std_logic;
  signal n6889_o : std_logic;
  signal n6890_o : std_logic;
  signal n6891_o : std_logic;
  signal n6892_o : std_logic;
  signal n6893_o : std_logic;
  signal n6894_o : std_logic;
  signal n6895_o : std_logic;
  signal n6896_o : std_logic;
  signal n6897_o : std_logic;
  signal n6898_o : std_logic;
  signal n6899_o : std_logic;
  signal n6900_o : std_logic;
  signal n6901_o : std_logic;
  signal n6902_o : std_logic;
  signal n6903_o : std_logic;
  signal n6904_o : std_logic;
  signal n6905_o : std_logic;
  signal n6906_o : std_logic;
  signal n6907_o : std_logic;
  signal n6908_o : std_logic;
  signal n6909_o : std_logic;
  signal n6910_o : std_logic_vector (3 downto 0);
  signal n6911_o : std_logic_vector (3 downto 0);
  signal n6912_o : std_logic_vector (3 downto 0);
  signal n6913_o : std_logic_vector (3 downto 0);
  signal n6914_o : std_logic_vector (3 downto 0);
  signal n6915_o : std_logic_vector (3 downto 0);
  signal n6916_o : std_logic_vector (3 downto 0);
  signal n6917_o : std_logic_vector (3 downto 0);
  signal n6918_o : std_logic_vector (3 downto 0);
  signal n6919_o : std_logic_vector (3 downto 0);
  signal n6920_o : std_logic_vector (2 downto 0);
  signal n6921_o : std_logic_vector (15 downto 0);
  signal n6922_o : std_logic_vector (15 downto 0);
  signal n6923_o : std_logic_vector (10 downto 0);
  signal n6924_o : std_logic_vector (42 downto 0);
  signal n6925_o : std_logic_vector (41 downto 0);
  signal n6926_o : std_logic_vector (42 downto 0);
  signal n6927_o : std_logic_vector (42 downto 0);
  signal n6943_o : std_logic_vector (40 downto 0);
  signal n6944_o : std_logic;
  signal n6948_o : std_logic;
  signal n6949_o : std_logic;
  signal n6956_o : std_logic;
  signal n6960_o : std_logic;
  signal n6962_o : std_logic;
  signal n6963_o : std_logic;
  signal n6965_o : std_logic;
  signal n6971_o : std_logic;
  signal n6974_o : std_logic;
  signal n6976_o : std_logic;
  signal n6977_o : std_logic;
  signal n6978_o : std_logic;
  signal n6979_o : std_logic;
  signal n6980_o : std_logic;
  signal n6981_o : std_logic;
  signal n6982_o : std_logic;
  signal n6983_o : std_logic;
  signal n6984_o : std_logic;
  signal n6985_o : std_logic;
  signal n6986_o : std_logic;
  signal n6987_o : std_logic;
  signal n6988_o : std_logic;
  signal n6989_o : std_logic;
  signal n6990_o : std_logic;
  signal n6991_o : std_logic;
  signal n6992_o : std_logic;
  signal n6993_o : std_logic;
  signal n6994_o : std_logic;
  signal n6995_o : std_logic;
  signal n6996_o : std_logic;
  signal n6997_o : std_logic;
  signal n6998_o : std_logic;
  signal n6999_o : std_logic;
  signal n7000_o : std_logic;
  signal n7001_o : std_logic_vector (3 downto 0);
  signal n7002_o : std_logic_vector (3 downto 0);
  signal n7003_o : std_logic_vector (3 downto 0);
  signal n7004_o : std_logic_vector (3 downto 0);
  signal n7005_o : std_logic_vector (3 downto 0);
  signal n7006_o : std_logic_vector (3 downto 0);
  signal n7007_o : std_logic_vector (15 downto 0);
  signal n7008_o : std_logic_vector (8 downto 0);
  signal n7009_o : std_logic_vector (24 downto 0);
  signal n7010_o : std_logic_vector (23 downto 0);
  signal n7011_o : std_logic_vector (24 downto 0);
  signal n7012_o : std_logic_vector (24 downto 0);
  signal n7013_o : std_logic_vector (24 downto 0);
  signal n7029_o : std_logic_vector (42 downto 0);
  signal n7032_o : std_logic_vector (42 downto 0);
  signal n7044_o : std_logic_vector (42 downto 0);
  signal n7047_o : std_logic_vector (42 downto 0);
  signal n7064_o : std_logic_vector (43 downto 0);
  signal n7079_o : std_logic_vector (43 downto 0);
  signal n7094_o : std_logic_vector (43 downto 0);
  signal n7105_o : std_logic_vector (42 downto 0);
  signal n7106_o : std_logic;
  signal n7110_o : std_logic;
  signal n7111_o : std_logic;
  signal n7118_o : std_logic;
  signal n7124_o : std_logic;
  signal n7125_o : std_logic;
  signal n7126_o : std_logic;
  signal n7127_o : std_logic;
  signal n7128_o : std_logic;
  signal n7129_o : std_logic;
  signal n7130_o : std_logic;
  signal n7131_o : std_logic;
  signal n7132_o : std_logic;
  signal n7133_o : std_logic;
  signal n7134_o : std_logic;
  signal n7135_o : std_logic;
  signal n7136_o : std_logic;
  signal n7137_o : std_logic;
  signal n7138_o : std_logic;
  signal n7139_o : std_logic;
  signal n7140_o : std_logic;
  signal n7141_o : std_logic;
  signal n7142_o : std_logic;
  signal n7143_o : std_logic;
  signal n7144_o : std_logic;
  signal n7145_o : std_logic;
  signal n7146_o : std_logic;
  signal n7147_o : std_logic;
  signal n7148_o : std_logic;
  signal n7149_o : std_logic;
  signal n7150_o : std_logic;
  signal n7151_o : std_logic;
  signal n7152_o : std_logic;
  signal n7153_o : std_logic;
  signal n7154_o : std_logic;
  signal n7155_o : std_logic;
  signal n7156_o : std_logic;
  signal n7157_o : std_logic;
  signal n7158_o : std_logic;
  signal n7159_o : std_logic;
  signal n7160_o : std_logic;
  signal n7161_o : std_logic;
  signal n7162_o : std_logic;
  signal n7163_o : std_logic;
  signal n7164_o : std_logic;
  signal n7165_o : std_logic;
  signal n7166_o : std_logic;
  signal n7167_o : std_logic_vector (3 downto 0);
  signal n7168_o : std_logic_vector (3 downto 0);
  signal n7169_o : std_logic_vector (3 downto 0);
  signal n7170_o : std_logic_vector (3 downto 0);
  signal n7171_o : std_logic_vector (3 downto 0);
  signal n7172_o : std_logic_vector (3 downto 0);
  signal n7173_o : std_logic_vector (3 downto 0);
  signal n7174_o : std_logic_vector (3 downto 0);
  signal n7175_o : std_logic_vector (3 downto 0);
  signal n7176_o : std_logic_vector (3 downto 0);
  signal n7177_o : std_logic_vector (2 downto 0);
  signal n7178_o : std_logic_vector (15 downto 0);
  signal n7179_o : std_logic_vector (15 downto 0);
  signal n7180_o : std_logic_vector (10 downto 0);
  signal n7181_o : std_logic_vector (42 downto 0);
  signal n7182_o : std_logic_vector (41 downto 0);
  signal n7183_o : std_logic_vector (42 downto 0);
  signal n7184_o : std_logic_vector (42 downto 0);
  signal n7202_o : std_logic_vector (43 downto 0);
  signal n7217_o : std_logic_vector (27 downto 0);
  constant n7221_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n7222_o : std_logic_vector (15 downto 0);
  signal n7223_o : std_logic_vector (43 downto 0);
  signal n7234_o : std_logic_vector (43 downto 0);
  signal n7245_o : std_logic_vector (42 downto 0);
  signal n7246_o : std_logic;
  signal n7250_o : std_logic;
  signal n7251_o : std_logic;
  signal n7258_o : std_logic;
  signal n7264_o : std_logic;
  signal n7265_o : std_logic;
  signal n7266_o : std_logic;
  signal n7267_o : std_logic;
  signal n7268_o : std_logic;
  signal n7269_o : std_logic;
  signal n7270_o : std_logic;
  signal n7271_o : std_logic;
  signal n7272_o : std_logic;
  signal n7273_o : std_logic;
  signal n7274_o : std_logic;
  signal n7275_o : std_logic;
  signal n7276_o : std_logic;
  signal n7277_o : std_logic;
  signal n7278_o : std_logic;
  signal n7279_o : std_logic;
  signal n7280_o : std_logic;
  signal n7281_o : std_logic;
  signal n7282_o : std_logic;
  signal n7283_o : std_logic;
  signal n7284_o : std_logic;
  signal n7285_o : std_logic;
  signal n7286_o : std_logic;
  signal n7287_o : std_logic;
  signal n7288_o : std_logic;
  signal n7289_o : std_logic;
  signal n7290_o : std_logic;
  signal n7291_o : std_logic;
  signal n7292_o : std_logic;
  signal n7293_o : std_logic;
  signal n7294_o : std_logic;
  signal n7295_o : std_logic;
  signal n7296_o : std_logic;
  signal n7297_o : std_logic;
  signal n7298_o : std_logic;
  signal n7299_o : std_logic;
  signal n7300_o : std_logic;
  signal n7301_o : std_logic;
  signal n7302_o : std_logic;
  signal n7303_o : std_logic;
  signal n7304_o : std_logic;
  signal n7305_o : std_logic;
  signal n7306_o : std_logic;
  signal n7307_o : std_logic_vector (3 downto 0);
  signal n7308_o : std_logic_vector (3 downto 0);
  signal n7309_o : std_logic_vector (3 downto 0);
  signal n7310_o : std_logic_vector (3 downto 0);
  signal n7311_o : std_logic_vector (3 downto 0);
  signal n7312_o : std_logic_vector (3 downto 0);
  signal n7313_o : std_logic_vector (3 downto 0);
  signal n7314_o : std_logic_vector (3 downto 0);
  signal n7315_o : std_logic_vector (3 downto 0);
  signal n7316_o : std_logic_vector (3 downto 0);
  signal n7317_o : std_logic_vector (2 downto 0);
  signal n7318_o : std_logic_vector (15 downto 0);
  signal n7319_o : std_logic_vector (15 downto 0);
  signal n7320_o : std_logic_vector (10 downto 0);
  signal n7321_o : std_logic_vector (42 downto 0);
  signal n7322_o : std_logic_vector (41 downto 0);
  signal n7323_o : std_logic_vector (42 downto 0);
  signal n7324_o : std_logic_vector (42 downto 0);
  signal n7340_o : std_logic_vector (40 downto 0);
  signal n7341_o : std_logic;
  signal n7345_o : std_logic;
  signal n7346_o : std_logic;
  signal n7353_o : std_logic;
  signal n7357_o : std_logic;
  signal n7359_o : std_logic;
  signal n7360_o : std_logic;
  signal n7362_o : std_logic;
  signal n7368_o : std_logic;
  signal n7371_o : std_logic;
  signal n7373_o : std_logic;
  signal n7374_o : std_logic;
  signal n7375_o : std_logic;
  signal n7376_o : std_logic;
  signal n7377_o : std_logic;
  signal n7378_o : std_logic;
  signal n7379_o : std_logic;
  signal n7380_o : std_logic;
  signal n7381_o : std_logic;
  signal n7382_o : std_logic;
  signal n7383_o : std_logic;
  signal n7384_o : std_logic;
  signal n7385_o : std_logic;
  signal n7386_o : std_logic;
  signal n7387_o : std_logic;
  signal n7388_o : std_logic;
  signal n7389_o : std_logic;
  signal n7390_o : std_logic;
  signal n7391_o : std_logic;
  signal n7392_o : std_logic;
  signal n7393_o : std_logic;
  signal n7394_o : std_logic;
  signal n7395_o : std_logic;
  signal n7396_o : std_logic;
  signal n7397_o : std_logic;
  signal n7398_o : std_logic_vector (3 downto 0);
  signal n7399_o : std_logic_vector (3 downto 0);
  signal n7400_o : std_logic_vector (3 downto 0);
  signal n7401_o : std_logic_vector (3 downto 0);
  signal n7402_o : std_logic_vector (3 downto 0);
  signal n7403_o : std_logic_vector (3 downto 0);
  signal n7404_o : std_logic_vector (15 downto 0);
  signal n7405_o : std_logic_vector (8 downto 0);
  signal n7406_o : std_logic_vector (24 downto 0);
  signal n7407_o : std_logic_vector (23 downto 0);
  signal n7408_o : std_logic_vector (24 downto 0);
  signal n7409_o : std_logic_vector (24 downto 0);
  signal n7410_o : std_logic_vector (24 downto 0);
  signal n7425_o : std_logic_vector (42 downto 0);
  signal n7428_o : std_logic_vector (42 downto 0);
  signal n7440_o : std_logic_vector (42 downto 0);
  signal n7443_o : std_logic_vector (42 downto 0);
  signal n7460_o : std_logic_vector (43 downto 0);
  signal n7475_o : std_logic_vector (43 downto 0);
  signal n7490_o : std_logic_vector (43 downto 0);
  signal n7501_o : std_logic_vector (42 downto 0);
  signal n7502_o : std_logic;
  signal n7506_o : std_logic;
  signal n7507_o : std_logic;
  signal n7514_o : std_logic;
  signal n7520_o : std_logic;
  signal n7521_o : std_logic;
  signal n7522_o : std_logic;
  signal n7523_o : std_logic;
  signal n7524_o : std_logic;
  signal n7525_o : std_logic;
  signal n7526_o : std_logic;
  signal n7527_o : std_logic;
  signal n7528_o : std_logic;
  signal n7529_o : std_logic;
  signal n7530_o : std_logic;
  signal n7531_o : std_logic;
  signal n7532_o : std_logic;
  signal n7533_o : std_logic;
  signal n7534_o : std_logic;
  signal n7535_o : std_logic;
  signal n7536_o : std_logic;
  signal n7537_o : std_logic;
  signal n7538_o : std_logic;
  signal n7539_o : std_logic;
  signal n7540_o : std_logic;
  signal n7541_o : std_logic;
  signal n7542_o : std_logic;
  signal n7543_o : std_logic;
  signal n7544_o : std_logic;
  signal n7545_o : std_logic;
  signal n7546_o : std_logic;
  signal n7547_o : std_logic;
  signal n7548_o : std_logic;
  signal n7549_o : std_logic;
  signal n7550_o : std_logic;
  signal n7551_o : std_logic;
  signal n7552_o : std_logic;
  signal n7553_o : std_logic;
  signal n7554_o : std_logic;
  signal n7555_o : std_logic;
  signal n7556_o : std_logic;
  signal n7557_o : std_logic;
  signal n7558_o : std_logic;
  signal n7559_o : std_logic;
  signal n7560_o : std_logic;
  signal n7561_o : std_logic;
  signal n7562_o : std_logic;
  signal n7563_o : std_logic_vector (3 downto 0);
  signal n7564_o : std_logic_vector (3 downto 0);
  signal n7565_o : std_logic_vector (3 downto 0);
  signal n7566_o : std_logic_vector (3 downto 0);
  signal n7567_o : std_logic_vector (3 downto 0);
  signal n7568_o : std_logic_vector (3 downto 0);
  signal n7569_o : std_logic_vector (3 downto 0);
  signal n7570_o : std_logic_vector (3 downto 0);
  signal n7571_o : std_logic_vector (3 downto 0);
  signal n7572_o : std_logic_vector (3 downto 0);
  signal n7573_o : std_logic_vector (2 downto 0);
  signal n7574_o : std_logic_vector (15 downto 0);
  signal n7575_o : std_logic_vector (15 downto 0);
  signal n7576_o : std_logic_vector (10 downto 0);
  signal n7577_o : std_logic_vector (42 downto 0);
  signal n7578_o : std_logic_vector (41 downto 0);
  signal n7579_o : std_logic_vector (42 downto 0);
  signal n7580_o : std_logic_vector (42 downto 0);
  signal n7596_o : std_logic_vector (40 downto 0);
  signal n7597_o : std_logic;
  signal n7601_o : std_logic;
  signal n7602_o : std_logic;
  signal n7609_o : std_logic;
  signal n7613_o : std_logic;
  signal n7615_o : std_logic;
  signal n7616_o : std_logic;
  signal n7618_o : std_logic;
  signal n7624_o : std_logic;
  signal n7627_o : std_logic;
  signal n7629_o : std_logic;
  signal n7630_o : std_logic;
  signal n7631_o : std_logic;
  signal n7632_o : std_logic;
  signal n7633_o : std_logic;
  signal n7634_o : std_logic;
  signal n7635_o : std_logic;
  signal n7636_o : std_logic;
  signal n7637_o : std_logic;
  signal n7638_o : std_logic;
  signal n7639_o : std_logic;
  signal n7640_o : std_logic;
  signal n7641_o : std_logic;
  signal n7642_o : std_logic;
  signal n7643_o : std_logic;
  signal n7644_o : std_logic;
  signal n7645_o : std_logic;
  signal n7646_o : std_logic;
  signal n7647_o : std_logic;
  signal n7648_o : std_logic;
  signal n7649_o : std_logic;
  signal n7650_o : std_logic;
  signal n7651_o : std_logic;
  signal n7652_o : std_logic;
  signal n7653_o : std_logic;
  signal n7654_o : std_logic_vector (3 downto 0);
  signal n7655_o : std_logic_vector (3 downto 0);
  signal n7656_o : std_logic_vector (3 downto 0);
  signal n7657_o : std_logic_vector (3 downto 0);
  signal n7658_o : std_logic_vector (3 downto 0);
  signal n7659_o : std_logic_vector (3 downto 0);
  signal n7660_o : std_logic_vector (15 downto 0);
  signal n7661_o : std_logic_vector (8 downto 0);
  signal n7662_o : std_logic_vector (24 downto 0);
  signal n7663_o : std_logic_vector (23 downto 0);
  signal n7664_o : std_logic_vector (24 downto 0);
  signal n7665_o : std_logic_vector (24 downto 0);
  signal n7666_o : std_logic_vector (24 downto 0);
  signal n7669_o : std_logic;
  signal n7670_o : std_logic_vector (1 downto 0);
  signal n7671_o : std_logic_vector (24 downto 0);
  signal n7672_o : std_logic_vector (24 downto 0);
  signal n7673_o : std_logic_vector (24 downto 0);
  signal n7674_o : std_logic_vector (24 downto 0);
  signal n7689_o : std_logic;
  signal n7690_o : std_logic_vector (24 downto 0);
  signal n7691_q : std_logic_vector (24 downto 0);
  signal n7692_o : std_logic;
  signal n7693_o : std_logic_vector (24 downto 0);
  signal n7694_q : std_logic_vector (24 downto 0);
  signal n7695_q : std_logic_vector (24 downto 0);
  signal n7696_q : std_logic_vector (24 downto 0);
  signal n7715_o : std_logic_vector (22 downto 0);
  signal n7716_o : std_logic;
  signal n7720_o : std_logic;
  signal n7721_o : std_logic;
  signal n7728_o : std_logic;
  signal n7732_o : std_logic;
  signal n7734_o : std_logic;
  signal n7735_o : std_logic;
  signal n7737_o : std_logic;
  signal n7743_o : std_logic;
  signal n7746_o : std_logic;
  signal n7748_o : std_logic;
  signal n7749_o : std_logic;
  signal n7750_o : std_logic;
  signal n7751_o : std_logic;
  signal n7752_o : std_logic;
  signal n7753_o : std_logic;
  signal n7754_o : std_logic;
  signal n7755_o : std_logic;
  signal n7756_o : std_logic;
  signal n7757_o : std_logic;
  signal n7758_o : std_logic;
  signal n7759_o : std_logic;
  signal n7760_o : std_logic;
  signal n7761_o : std_logic;
  signal n7762_o : std_logic;
  signal n7763_o : std_logic;
  signal n7764_o : std_logic;
  signal n7765_o : std_logic;
  signal n7766_o : std_logic_vector (3 downto 0);
  signal n7767_o : std_logic_vector (3 downto 0);
  signal n7768_o : std_logic_vector (3 downto 0);
  signal n7769_o : std_logic_vector (3 downto 0);
  signal n7770_o : std_logic_vector (1 downto 0);
  signal n7771_o : std_logic_vector (15 downto 0);
  signal n7772_o : std_logic_vector (17 downto 0);
  signal n7773_o : std_logic_vector (16 downto 0);
  signal n7774_o : std_logic_vector (17 downto 0);
  signal n7775_o : std_logic_vector (17 downto 0);
  signal n7776_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n6737_o;
  valid_o <= n6742_o;
  data_o <= n7776_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n6733_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n7691_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n7694_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n7695_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n7696_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n6716_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n6718_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n6720_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n6722_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n6724_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:170:18
  n6725_o <= n6724_o & n6720_o & n6718_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n6725_o select n6728_o <=
    n6722_o when "100",
    "10" when "010",
    n6716_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n6733_q <= "00";
    elsif rising_edge (clk_i) then
      n6733_q <= n6728_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n6736_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n6737_o <= '0' when n6736_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n6741_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n6742_o <= '0' when n6741_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n6762_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n6767_o <= n6766_o (4 downto 0);
  n6768_o <= n6762_o & n6767_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n6769_o <= x_reg when valid_i = '0' else n6768_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n6771_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n6785_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n6788_o <= std_logic_vector (resize (signed (n6785_o) * signed'("0000000000000000000000000000000001111100101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n6805_o <= std_logic_vector (resize (signed (n6788_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n6820_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n6825_o <= n6824_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n6826_o <= n6820_o & n6825_o;
  -- ../fixed_pkg.vhd:257:67
  n6837_o <= std_logic_vector (unsigned (n6805_o) + unsigned (n6826_o));
  -- ../fixed_pkg.vhd:168:39
  n6848_o <= n6837_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6849_o <= n6837_o (43);
  -- ../fixed_pkg.vhd:185:23
  n6853_o <= n6837_o (42);
  -- ../fixed_pkg.vhd:185:27
  n6854_o <= '1' when n6853_o /= n6849_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6861_o <= '0' when n6854_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n6867_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6868_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6869_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6870_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6871_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6872_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6873_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6874_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6875_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6876_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6877_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6878_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6879_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6880_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6881_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6882_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6883_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6884_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6885_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6886_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6887_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6888_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6889_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6890_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6891_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6892_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6893_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6894_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6895_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6896_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6897_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6898_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6899_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6900_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6901_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6902_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6903_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6904_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6905_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6906_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6907_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6908_o <= not n6849_o;
  -- ../fixed_pkg.vhd:196:31
  n6909_o <= not n6849_o;
  -- ../fixed_pkg.vhd:184:13
  n6910_o <= n6867_o & n6868_o & n6869_o & n6870_o;
  -- ../fixed_pkg.vhd:171:18
  n6911_o <= n6871_o & n6872_o & n6873_o & n6874_o;
  n6912_o <= n6875_o & n6876_o & n6877_o & n6878_o;
  -- ../fixed_pkg.vhd:170:18
  n6913_o <= n6879_o & n6880_o & n6881_o & n6882_o;
  n6914_o <= n6883_o & n6884_o & n6885_o & n6886_o;
  -- ../fixed_pkg.vhd:9:14
  n6915_o <= n6887_o & n6888_o & n6889_o & n6890_o;
  -- ../fixed_pkg.vhd:9:14
  n6916_o <= n6891_o & n6892_o & n6893_o & n6894_o;
  n6917_o <= n6895_o & n6896_o & n6897_o & n6898_o;
  -- ../fixed_pkg.vhd:9:14
  n6918_o <= n6899_o & n6900_o & n6901_o & n6902_o;
  -- ../fixed_pkg.vhd:24:14
  n6919_o <= n6903_o & n6904_o & n6905_o & n6906_o;
  -- ../fixed_pkg.vhd:24:14
  n6920_o <= n6907_o & n6908_o & n6909_o;
  n6921_o <= n6910_o & n6911_o & n6912_o & n6913_o;
  -- ../fixed_pkg.vhd:24:14
  n6922_o <= n6914_o & n6915_o & n6916_o & n6917_o;
  -- ../fixed_pkg.vhd:9:14
  n6923_o <= n6918_o & n6919_o & n6920_o;
  -- ../fixed_pkg.vhd:9:14
  n6924_o <= n6921_o & n6922_o & n6923_o;
  n6925_o <= n6924_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n6926_o <= n6849_o & n6925_o;
  -- ../fixed_pkg.vhd:195:9
  n6927_o <= n6848_o when n6861_o = '0' else n6926_o;
  -- ../fixed_pkg.vhd:168:39
  n6943_o <= n6927_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6944_o <= n6927_o (42);
  -- ../fixed_pkg.vhd:185:23
  n6948_o <= n6927_o (41);
  -- ../fixed_pkg.vhd:185:27
  n6949_o <= '1' when n6948_o /= n6944_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6956_o <= '0' when n6949_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n6960_o <= '1' when n6949_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n6962_o <= n6927_o (40);
  -- ../fixed_pkg.vhd:185:27
  n6963_o <= '1' when n6962_o /= n6944_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6965_o <= n6956_o when n6974_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n6971_o <= n6963_o and n6960_o;
  -- ../fixed_pkg.vhd:185:17
  n6974_o <= n6960_o and n6971_o;
  -- ../fixed_pkg.vhd:196:31
  n6976_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6977_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6978_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6979_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6980_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6981_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6982_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6983_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6984_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6985_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6986_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6987_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6988_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6989_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6990_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6991_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6992_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6993_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6994_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6995_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6996_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6997_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6998_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n6999_o <= not n6944_o;
  -- ../fixed_pkg.vhd:196:31
  n7000_o <= not n6944_o;
  -- ../fixed_pkg.vhd:9:14
  n7001_o <= n6976_o & n6977_o & n6978_o & n6979_o;
  -- ../fixed_pkg.vhd:9:14
  n7002_o <= n6980_o & n6981_o & n6982_o & n6983_o;
  -- ../fixed_pkg.vhd:24:14
  n7003_o <= n6984_o & n6985_o & n6986_o & n6987_o;
  -- ../fixed_pkg.vhd:24:14
  n7004_o <= n6988_o & n6989_o & n6990_o & n6991_o;
  -- ../fixed_pkg.vhd:171:18
  n7005_o <= n6992_o & n6993_o & n6994_o & n6995_o;
  -- ../fixed_pkg.vhd:24:14
  n7006_o <= n6996_o & n6997_o & n6998_o & n6999_o;
  -- ../fixed_pkg.vhd:9:14
  n7007_o <= n7001_o & n7002_o & n7003_o & n7004_o;
  -- ../fixed_pkg.vhd:171:18
  n7008_o <= n7005_o & n7006_o & n7000_o;
  -- ../fixed_pkg.vhd:185:17
  n7009_o <= n7007_o & n7008_o;
  -- ../fixed_pkg.vhd:170:18
  n7010_o <= n7009_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n7011_o <= n6943_o (40 downto 16);
  -- ../fixed_pkg.vhd:169:40
  n7012_o <= n6944_o & n7010_o;
  -- ../fixed_pkg.vhd:195:9
  n7013_o <= n7011_o when n6965_o = '0' else n7012_o;
  -- ../fixed_pkg.vhd:268:100
  n7029_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n7032_o <= std_logic_vector (resize (signed (n7029_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n7044_o <= std_logic_vector (resize (signed (n7013_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n7047_o <= std_logic_vector (resize (signed (n7044_o) * signed'("0000000000011111111111111100010000001111000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n7064_o <= std_logic_vector (resize (signed (n7032_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n7079_o <= std_logic_vector (resize (signed (n7047_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n7094_o <= std_logic_vector (unsigned (n7064_o) - unsigned (n7079_o));
  -- ../fixed_pkg.vhd:168:39
  n7105_o <= n7094_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7106_o <= n7094_o (43);
  -- ../fixed_pkg.vhd:185:23
  n7110_o <= n7094_o (42);
  -- ../fixed_pkg.vhd:185:27
  n7111_o <= '1' when n7110_o /= n7106_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n7118_o <= '0' when n7111_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n7124_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7125_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7126_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7127_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7128_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7129_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7130_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7131_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7132_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7133_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7134_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7135_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7136_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7137_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7138_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7139_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7140_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7141_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7142_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7143_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7144_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7145_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7146_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7147_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7148_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7149_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7150_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7151_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7152_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7153_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7154_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7155_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7156_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7157_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7158_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7159_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7160_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7161_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7162_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7163_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7164_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7165_o <= not n7106_o;
  -- ../fixed_pkg.vhd:196:31
  n7166_o <= not n7106_o;
  -- ../fixed_pkg.vhd:9:14
  n7167_o <= n7124_o & n7125_o & n7126_o & n7127_o;
  -- ../fixed_pkg.vhd:24:14
  n7168_o <= n7128_o & n7129_o & n7130_o & n7131_o;
  -- ../fixed_pkg.vhd:24:14
  n7169_o <= n7132_o & n7133_o & n7134_o & n7135_o;
  -- ../fixed_pkg.vhd:185:17
  n7170_o <= n7136_o & n7137_o & n7138_o & n7139_o;
  -- ../fixed_pkg.vhd:24:14
  n7171_o <= n7140_o & n7141_o & n7142_o & n7143_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n7172_o <= n7144_o & n7145_o & n7146_o & n7147_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n7173_o <= n7148_o & n7149_o & n7150_o & n7151_o;
  -- ../fixed_pkg.vhd:185:17
  n7174_o <= n7152_o & n7153_o & n7154_o & n7155_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n7175_o <= n7156_o & n7157_o & n7158_o & n7159_o;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n7176_o <= n7160_o & n7161_o & n7162_o & n7163_o;
  -- ../BiquadFilter/BiquadFilter.vhd:53:18
  n7177_o <= n7164_o & n7165_o & n7166_o;
  n7178_o <= n7167_o & n7168_o & n7169_o & n7170_o;
  -- ../fixed_pkg.vhd:24:14
  n7179_o <= n7171_o & n7172_o & n7173_o & n7174_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n7180_o <= n7175_o & n7176_o & n7177_o;
  n7181_o <= n7178_o & n7179_o & n7180_o;
  n7182_o <= n7181_o (41 downto 0);
  n7183_o <= n7106_o & n7182_o;
  -- ../fixed_pkg.vhd:195:9
  n7184_o <= n7105_o when n7118_o = '0' else n7183_o;
  -- ../fixed_pkg.vhd:168:39
  n7202_o <= std_logic_vector (resize (signed (n7184_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n7217_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n7222_o <= n7221_o (15 downto 0);
  n7223_o <= n7217_o & n7222_o;
  -- ../fixed_pkg.vhd:257:67
  n7234_o <= std_logic_vector (unsigned (n7202_o) + unsigned (n7223_o));
  -- ../fixed_pkg.vhd:168:39
  n7245_o <= n7234_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7246_o <= n7234_o (43);
  -- ../fixed_pkg.vhd:185:23
  n7250_o <= n7234_o (42);
  -- ../fixed_pkg.vhd:185:27
  n7251_o <= '1' when n7250_o /= n7246_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n7258_o <= '0' when n7251_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n7264_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7265_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7266_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7267_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7268_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7269_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7270_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7271_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7272_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7273_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7274_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7275_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7276_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7277_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7278_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7279_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7280_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7281_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7282_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7283_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7284_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7285_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7286_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7287_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7288_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7289_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7290_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7291_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7292_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7293_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7294_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7295_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7296_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7297_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7298_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7299_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7300_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7301_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7302_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7303_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7304_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7305_o <= not n7246_o;
  -- ../fixed_pkg.vhd:196:31
  n7306_o <= not n7246_o;
  n7307_o <= n7264_o & n7265_o & n7266_o & n7267_o;
  n7308_o <= n7268_o & n7269_o & n7270_o & n7271_o;
  n7309_o <= n7272_o & n7273_o & n7274_o & n7275_o;
  n7310_o <= n7276_o & n7277_o & n7278_o & n7279_o;
  n7311_o <= n7280_o & n7281_o & n7282_o & n7283_o;
  n7312_o <= n7284_o & n7285_o & n7286_o & n7287_o;
  n7313_o <= n7288_o & n7289_o & n7290_o & n7291_o;
  n7314_o <= n7292_o & n7293_o & n7294_o & n7295_o;
  n7315_o <= n7296_o & n7297_o & n7298_o & n7299_o;
  n7316_o <= n7300_o & n7301_o & n7302_o & n7303_o;
  n7317_o <= n7304_o & n7305_o & n7306_o;
  n7318_o <= n7307_o & n7308_o & n7309_o & n7310_o;
  n7319_o <= n7311_o & n7312_o & n7313_o & n7314_o;
  n7320_o <= n7315_o & n7316_o & n7317_o;
  n7321_o <= n7318_o & n7319_o & n7320_o;
  n7322_o <= n7321_o (41 downto 0);
  n7323_o <= n7246_o & n7322_o;
  -- ../fixed_pkg.vhd:195:9
  n7324_o <= n7245_o when n7258_o = '0' else n7323_o;
  -- ../fixed_pkg.vhd:168:39
  n7340_o <= n7324_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7341_o <= n7324_o (42);
  -- ../fixed_pkg.vhd:185:23
  n7345_o <= n7324_o (41);
  -- ../fixed_pkg.vhd:185:27
  n7346_o <= '1' when n7345_o /= n7341_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n7353_o <= '0' when n7346_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n7357_o <= '1' when n7346_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n7359_o <= n7324_o (40);
  -- ../fixed_pkg.vhd:185:27
  n7360_o <= '1' when n7359_o /= n7341_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n7362_o <= n7353_o when n7371_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n7368_o <= n7360_o and n7357_o;
  -- ../fixed_pkg.vhd:185:17
  n7371_o <= n7357_o and n7368_o;
  -- ../fixed_pkg.vhd:196:31
  n7373_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7374_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7375_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7376_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7377_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7378_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7379_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7380_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7381_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7382_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7383_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7384_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7385_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7386_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7387_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7388_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7389_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7390_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7391_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7392_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7393_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7394_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7395_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7396_o <= not n7341_o;
  -- ../fixed_pkg.vhd:196:31
  n7397_o <= not n7341_o;
  n7398_o <= n7373_o & n7374_o & n7375_o & n7376_o;
  n7399_o <= n7377_o & n7378_o & n7379_o & n7380_o;
  n7400_o <= n7381_o & n7382_o & n7383_o & n7384_o;
  n7401_o <= n7385_o & n7386_o & n7387_o & n7388_o;
  n7402_o <= n7389_o & n7390_o & n7391_o & n7392_o;
  n7403_o <= n7393_o & n7394_o & n7395_o & n7396_o;
  n7404_o <= n7398_o & n7399_o & n7400_o & n7401_o;
  n7405_o <= n7402_o & n7403_o & n7397_o;
  n7406_o <= n7404_o & n7405_o;
  n7407_o <= n7406_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n7408_o <= n7340_o (40 downto 16);
  n7409_o <= n7341_o & n7407_o;
  -- ../fixed_pkg.vhd:195:9
  n7410_o <= n7408_o when n7362_o = '0' else n7409_o;
  -- ../fixed_pkg.vhd:268:100
  n7425_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n7428_o <= std_logic_vector (resize (signed (n7425_o) * signed'("0000000000011111111111111111111110000011011"), 43));
  -- ../fixed_pkg.vhd:268:100
  n7440_o <= std_logic_vector (resize (signed (n7013_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n7443_o <= std_logic_vector (resize (signed (n7440_o) * signed'("0000000000000000000000000001111100000110110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n7460_o <= std_logic_vector (resize (signed (n7428_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n7475_o <= std_logic_vector (resize (signed (n7443_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n7490_o <= std_logic_vector (unsigned (n7460_o) - unsigned (n7475_o));
  -- ../fixed_pkg.vhd:168:39
  n7501_o <= n7490_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7502_o <= n7490_o (43);
  -- ../fixed_pkg.vhd:185:23
  n7506_o <= n7490_o (42);
  -- ../fixed_pkg.vhd:185:27
  n7507_o <= '1' when n7506_o /= n7502_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n7514_o <= '0' when n7507_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n7520_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7521_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7522_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7523_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7524_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7525_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7526_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7527_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7528_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7529_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7530_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7531_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7532_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7533_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7534_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7535_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7536_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7537_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7538_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7539_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7540_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7541_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7542_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7543_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7544_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7545_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7546_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7547_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7548_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7549_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7550_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7551_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7552_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7553_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7554_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7555_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7556_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7557_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7558_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7559_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7560_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7561_o <= not n7502_o;
  -- ../fixed_pkg.vhd:196:31
  n7562_o <= not n7502_o;
  n7563_o <= n7520_o & n7521_o & n7522_o & n7523_o;
  n7564_o <= n7524_o & n7525_o & n7526_o & n7527_o;
  n7565_o <= n7528_o & n7529_o & n7530_o & n7531_o;
  n7566_o <= n7532_o & n7533_o & n7534_o & n7535_o;
  n7567_o <= n7536_o & n7537_o & n7538_o & n7539_o;
  n7568_o <= n7540_o & n7541_o & n7542_o & n7543_o;
  n7569_o <= n7544_o & n7545_o & n7546_o & n7547_o;
  n7570_o <= n7548_o & n7549_o & n7550_o & n7551_o;
  n7571_o <= n7552_o & n7553_o & n7554_o & n7555_o;
  n7572_o <= n7556_o & n7557_o & n7558_o & n7559_o;
  n7573_o <= n7560_o & n7561_o & n7562_o;
  n7574_o <= n7563_o & n7564_o & n7565_o & n7566_o;
  n7575_o <= n7567_o & n7568_o & n7569_o & n7570_o;
  n7576_o <= n7571_o & n7572_o & n7573_o;
  n7577_o <= n7574_o & n7575_o & n7576_o;
  n7578_o <= n7577_o (41 downto 0);
  n7579_o <= n7502_o & n7578_o;
  -- ../fixed_pkg.vhd:195:9
  n7580_o <= n7501_o when n7514_o = '0' else n7579_o;
  -- ../fixed_pkg.vhd:168:39
  n7596_o <= n7580_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7597_o <= n7580_o (42);
  -- ../fixed_pkg.vhd:185:23
  n7601_o <= n7580_o (41);
  -- ../fixed_pkg.vhd:185:27
  n7602_o <= '1' when n7601_o /= n7597_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n7609_o <= '0' when n7602_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n7613_o <= '1' when n7602_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n7615_o <= n7580_o (40);
  -- ../fixed_pkg.vhd:185:27
  n7616_o <= '1' when n7615_o /= n7597_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n7618_o <= n7609_o when n7627_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n7624_o <= n7616_o and n7613_o;
  -- ../fixed_pkg.vhd:185:17
  n7627_o <= n7613_o and n7624_o;
  -- ../fixed_pkg.vhd:196:31
  n7629_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7630_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7631_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7632_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7633_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7634_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7635_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7636_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7637_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7638_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7639_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7640_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7641_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7642_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7643_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7644_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7645_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7646_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7647_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7648_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7649_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7650_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7651_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7652_o <= not n7597_o;
  -- ../fixed_pkg.vhd:196:31
  n7653_o <= not n7597_o;
  n7654_o <= n7629_o & n7630_o & n7631_o & n7632_o;
  n7655_o <= n7633_o & n7634_o & n7635_o & n7636_o;
  n7656_o <= n7637_o & n7638_o & n7639_o & n7640_o;
  n7657_o <= n7641_o & n7642_o & n7643_o & n7644_o;
  n7658_o <= n7645_o & n7646_o & n7647_o & n7648_o;
  n7659_o <= n7649_o & n7650_o & n7651_o & n7652_o;
  n7660_o <= n7654_o & n7655_o & n7656_o & n7657_o;
  n7661_o <= n7658_o & n7659_o & n7653_o;
  n7662_o <= n7660_o & n7661_o;
  n7663_o <= n7662_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n7664_o <= n7596_o (40 downto 16);
  n7665_o <= n7597_o & n7663_o;
  -- ../fixed_pkg.vhd:195:9
  n7666_o <= n7664_o when n7618_o = '0' else n7665_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n7669_o <= '1' when state_reg = "01" else '0';
  n7670_o <= n7669_o & n6771_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n7670_o select n7671_o <=
    x_reg when "10",
    n6769_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n7670_o select n7672_o <=
    n7013_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n7670_o select n7673_o <=
    n7410_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n7670_o select n7674_o <=
    n7666_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n7689_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n7690_o <= x_reg when n7689_o = '0' else n7671_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n7691_q <= n7690_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n7692_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n7693_o <= y_reg when n7692_o = '0' else n7672_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n7694_q <= n7693_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n7695_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n7695_q <= n7673_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n7696_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n7696_q <= n7674_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n7715_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7716_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n7720_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n7721_o <= '1' when n7720_o /= n7716_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n7728_o <= '0' when n7721_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n7732_o <= '1' when n7721_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n7734_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n7735_o <= '1' when n7734_o /= n7716_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n7737_o <= n7728_o when n7746_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n7743_o <= n7735_o and n7732_o;
  -- ../fixed_pkg.vhd:185:17
  n7746_o <= n7732_o and n7743_o;
  -- ../fixed_pkg.vhd:196:31
  n7748_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7749_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7750_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7751_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7752_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7753_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7754_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7755_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7756_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7757_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7758_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7759_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7760_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7761_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7762_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7763_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7764_o <= not n7716_o;
  -- ../fixed_pkg.vhd:196:31
  n7765_o <= not n7716_o;
  n7766_o <= n7748_o & n7749_o & n7750_o & n7751_o;
  n7767_o <= n7752_o & n7753_o & n7754_o & n7755_o;
  n7768_o <= n7756_o & n7757_o & n7758_o & n7759_o;
  n7769_o <= n7760_o & n7761_o & n7762_o & n7763_o;
  n7770_o <= n7764_o & n7765_o;
  n7771_o <= n7766_o & n7767_o & n7768_o & n7769_o;
  n7772_o <= n7771_o & n7770_o;
  n7773_o <= n7772_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n7774_o <= n7715_o (22 downto 5);
  n7775_o <= n7716_o & n7773_o;
  -- ../fixed_pkg.vhd:195:9
  n7776_o <= n7774_o when n7737_o = '0' else n7775_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_1c66bf3a8e40435213527cf7b156d31cf673b516 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_1c66bf3a8e40435213527cf7b156d31cf673b516;

architecture rtl of biquadfilter_1c66bf3a8e40435213527cf7b156d31cf673b516 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n5648_o : std_logic_vector (1 downto 0);
  signal n5650_o : std_logic;
  signal n5652_o : std_logic;
  signal n5654_o : std_logic_vector (1 downto 0);
  signal n5656_o : std_logic;
  signal n5657_o : std_logic_vector (2 downto 0);
  signal n5660_o : std_logic_vector (1 downto 0);
  signal n5665_q : std_logic_vector (1 downto 0);
  signal n5668_o : std_logic;
  signal n5669_o : std_logic;
  signal n5673_o : std_logic;
  signal n5674_o : std_logic;
  signal n5694_o : std_logic_vector (19 downto 0);
  constant n5698_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n5699_o : std_logic_vector (4 downto 0);
  signal n5700_o : std_logic_vector (24 downto 0);
  signal n5701_o : std_logic_vector (24 downto 0);
  signal n5703_o : std_logic;
  signal n5717_o : std_logic_vector (42 downto 0);
  signal n5720_o : std_logic_vector (42 downto 0);
  signal n5737_o : std_logic_vector (43 downto 0);
  signal n5752_o : std_logic_vector (27 downto 0);
  constant n5756_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n5757_o : std_logic_vector (15 downto 0);
  signal n5758_o : std_logic_vector (43 downto 0);
  signal n5769_o : std_logic_vector (43 downto 0);
  signal n5780_o : std_logic_vector (42 downto 0);
  signal n5781_o : std_logic;
  signal n5785_o : std_logic;
  signal n5786_o : std_logic;
  signal n5793_o : std_logic;
  signal n5799_o : std_logic;
  signal n5800_o : std_logic;
  signal n5801_o : std_logic;
  signal n5802_o : std_logic;
  signal n5803_o : std_logic;
  signal n5804_o : std_logic;
  signal n5805_o : std_logic;
  signal n5806_o : std_logic;
  signal n5807_o : std_logic;
  signal n5808_o : std_logic;
  signal n5809_o : std_logic;
  signal n5810_o : std_logic;
  signal n5811_o : std_logic;
  signal n5812_o : std_logic;
  signal n5813_o : std_logic;
  signal n5814_o : std_logic;
  signal n5815_o : std_logic;
  signal n5816_o : std_logic;
  signal n5817_o : std_logic;
  signal n5818_o : std_logic;
  signal n5819_o : std_logic;
  signal n5820_o : std_logic;
  signal n5821_o : std_logic;
  signal n5822_o : std_logic;
  signal n5823_o : std_logic;
  signal n5824_o : std_logic;
  signal n5825_o : std_logic;
  signal n5826_o : std_logic;
  signal n5827_o : std_logic;
  signal n5828_o : std_logic;
  signal n5829_o : std_logic;
  signal n5830_o : std_logic;
  signal n5831_o : std_logic;
  signal n5832_o : std_logic;
  signal n5833_o : std_logic;
  signal n5834_o : std_logic;
  signal n5835_o : std_logic;
  signal n5836_o : std_logic;
  signal n5837_o : std_logic;
  signal n5838_o : std_logic;
  signal n5839_o : std_logic;
  signal n5840_o : std_logic;
  signal n5841_o : std_logic;
  signal n5842_o : std_logic_vector (3 downto 0);
  signal n5843_o : std_logic_vector (3 downto 0);
  signal n5844_o : std_logic_vector (3 downto 0);
  signal n5845_o : std_logic_vector (3 downto 0);
  signal n5846_o : std_logic_vector (3 downto 0);
  signal n5847_o : std_logic_vector (3 downto 0);
  signal n5848_o : std_logic_vector (3 downto 0);
  signal n5849_o : std_logic_vector (3 downto 0);
  signal n5850_o : std_logic_vector (3 downto 0);
  signal n5851_o : std_logic_vector (3 downto 0);
  signal n5852_o : std_logic_vector (2 downto 0);
  signal n5853_o : std_logic_vector (15 downto 0);
  signal n5854_o : std_logic_vector (15 downto 0);
  signal n5855_o : std_logic_vector (10 downto 0);
  signal n5856_o : std_logic_vector (42 downto 0);
  signal n5857_o : std_logic_vector (41 downto 0);
  signal n5858_o : std_logic_vector (42 downto 0);
  signal n5859_o : std_logic_vector (42 downto 0);
  signal n5875_o : std_logic_vector (40 downto 0);
  signal n5876_o : std_logic;
  signal n5880_o : std_logic;
  signal n5881_o : std_logic;
  signal n5888_o : std_logic;
  signal n5892_o : std_logic;
  signal n5894_o : std_logic;
  signal n5895_o : std_logic;
  signal n5897_o : std_logic;
  signal n5903_o : std_logic;
  signal n5906_o : std_logic;
  signal n5908_o : std_logic;
  signal n5909_o : std_logic;
  signal n5910_o : std_logic;
  signal n5911_o : std_logic;
  signal n5912_o : std_logic;
  signal n5913_o : std_logic;
  signal n5914_o : std_logic;
  signal n5915_o : std_logic;
  signal n5916_o : std_logic;
  signal n5917_o : std_logic;
  signal n5918_o : std_logic;
  signal n5919_o : std_logic;
  signal n5920_o : std_logic;
  signal n5921_o : std_logic;
  signal n5922_o : std_logic;
  signal n5923_o : std_logic;
  signal n5924_o : std_logic;
  signal n5925_o : std_logic;
  signal n5926_o : std_logic;
  signal n5927_o : std_logic;
  signal n5928_o : std_logic;
  signal n5929_o : std_logic;
  signal n5930_o : std_logic;
  signal n5931_o : std_logic;
  signal n5932_o : std_logic;
  signal n5933_o : std_logic_vector (3 downto 0);
  signal n5934_o : std_logic_vector (3 downto 0);
  signal n5935_o : std_logic_vector (3 downto 0);
  signal n5936_o : std_logic_vector (3 downto 0);
  signal n5937_o : std_logic_vector (3 downto 0);
  signal n5938_o : std_logic_vector (3 downto 0);
  signal n5939_o : std_logic_vector (15 downto 0);
  signal n5940_o : std_logic_vector (8 downto 0);
  signal n5941_o : std_logic_vector (24 downto 0);
  signal n5942_o : std_logic_vector (23 downto 0);
  signal n5943_o : std_logic_vector (24 downto 0);
  signal n5944_o : std_logic_vector (24 downto 0);
  signal n5945_o : std_logic_vector (24 downto 0);
  signal n5961_o : std_logic_vector (42 downto 0);
  signal n5964_o : std_logic_vector (42 downto 0);
  signal n5976_o : std_logic_vector (42 downto 0);
  signal n5979_o : std_logic_vector (42 downto 0);
  signal n5996_o : std_logic_vector (43 downto 0);
  signal n6011_o : std_logic_vector (43 downto 0);
  signal n6026_o : std_logic_vector (43 downto 0);
  signal n6037_o : std_logic_vector (42 downto 0);
  signal n6038_o : std_logic;
  signal n6042_o : std_logic;
  signal n6043_o : std_logic;
  signal n6050_o : std_logic;
  signal n6056_o : std_logic;
  signal n6057_o : std_logic;
  signal n6058_o : std_logic;
  signal n6059_o : std_logic;
  signal n6060_o : std_logic;
  signal n6061_o : std_logic;
  signal n6062_o : std_logic;
  signal n6063_o : std_logic;
  signal n6064_o : std_logic;
  signal n6065_o : std_logic;
  signal n6066_o : std_logic;
  signal n6067_o : std_logic;
  signal n6068_o : std_logic;
  signal n6069_o : std_logic;
  signal n6070_o : std_logic;
  signal n6071_o : std_logic;
  signal n6072_o : std_logic;
  signal n6073_o : std_logic;
  signal n6074_o : std_logic;
  signal n6075_o : std_logic;
  signal n6076_o : std_logic;
  signal n6077_o : std_logic;
  signal n6078_o : std_logic;
  signal n6079_o : std_logic;
  signal n6080_o : std_logic;
  signal n6081_o : std_logic;
  signal n6082_o : std_logic;
  signal n6083_o : std_logic;
  signal n6084_o : std_logic;
  signal n6085_o : std_logic;
  signal n6086_o : std_logic;
  signal n6087_o : std_logic;
  signal n6088_o : std_logic;
  signal n6089_o : std_logic;
  signal n6090_o : std_logic;
  signal n6091_o : std_logic;
  signal n6092_o : std_logic;
  signal n6093_o : std_logic;
  signal n6094_o : std_logic;
  signal n6095_o : std_logic;
  signal n6096_o : std_logic;
  signal n6097_o : std_logic;
  signal n6098_o : std_logic;
  signal n6099_o : std_logic_vector (3 downto 0);
  signal n6100_o : std_logic_vector (3 downto 0);
  signal n6101_o : std_logic_vector (3 downto 0);
  signal n6102_o : std_logic_vector (3 downto 0);
  signal n6103_o : std_logic_vector (3 downto 0);
  signal n6104_o : std_logic_vector (3 downto 0);
  signal n6105_o : std_logic_vector (3 downto 0);
  signal n6106_o : std_logic_vector (3 downto 0);
  signal n6107_o : std_logic_vector (3 downto 0);
  signal n6108_o : std_logic_vector (3 downto 0);
  signal n6109_o : std_logic_vector (2 downto 0);
  signal n6110_o : std_logic_vector (15 downto 0);
  signal n6111_o : std_logic_vector (15 downto 0);
  signal n6112_o : std_logic_vector (10 downto 0);
  signal n6113_o : std_logic_vector (42 downto 0);
  signal n6114_o : std_logic_vector (41 downto 0);
  signal n6115_o : std_logic_vector (42 downto 0);
  signal n6116_o : std_logic_vector (42 downto 0);
  signal n6134_o : std_logic_vector (43 downto 0);
  signal n6149_o : std_logic_vector (27 downto 0);
  constant n6153_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n6154_o : std_logic_vector (15 downto 0);
  signal n6155_o : std_logic_vector (43 downto 0);
  signal n6166_o : std_logic_vector (43 downto 0);
  signal n6177_o : std_logic_vector (42 downto 0);
  signal n6178_o : std_logic;
  signal n6182_o : std_logic;
  signal n6183_o : std_logic;
  signal n6190_o : std_logic;
  signal n6196_o : std_logic;
  signal n6197_o : std_logic;
  signal n6198_o : std_logic;
  signal n6199_o : std_logic;
  signal n6200_o : std_logic;
  signal n6201_o : std_logic;
  signal n6202_o : std_logic;
  signal n6203_o : std_logic;
  signal n6204_o : std_logic;
  signal n6205_o : std_logic;
  signal n6206_o : std_logic;
  signal n6207_o : std_logic;
  signal n6208_o : std_logic;
  signal n6209_o : std_logic;
  signal n6210_o : std_logic;
  signal n6211_o : std_logic;
  signal n6212_o : std_logic;
  signal n6213_o : std_logic;
  signal n6214_o : std_logic;
  signal n6215_o : std_logic;
  signal n6216_o : std_logic;
  signal n6217_o : std_logic;
  signal n6218_o : std_logic;
  signal n6219_o : std_logic;
  signal n6220_o : std_logic;
  signal n6221_o : std_logic;
  signal n6222_o : std_logic;
  signal n6223_o : std_logic;
  signal n6224_o : std_logic;
  signal n6225_o : std_logic;
  signal n6226_o : std_logic;
  signal n6227_o : std_logic;
  signal n6228_o : std_logic;
  signal n6229_o : std_logic;
  signal n6230_o : std_logic;
  signal n6231_o : std_logic;
  signal n6232_o : std_logic;
  signal n6233_o : std_logic;
  signal n6234_o : std_logic;
  signal n6235_o : std_logic;
  signal n6236_o : std_logic;
  signal n6237_o : std_logic;
  signal n6238_o : std_logic;
  signal n6239_o : std_logic_vector (3 downto 0);
  signal n6240_o : std_logic_vector (3 downto 0);
  signal n6241_o : std_logic_vector (3 downto 0);
  signal n6242_o : std_logic_vector (3 downto 0);
  signal n6243_o : std_logic_vector (3 downto 0);
  signal n6244_o : std_logic_vector (3 downto 0);
  signal n6245_o : std_logic_vector (3 downto 0);
  signal n6246_o : std_logic_vector (3 downto 0);
  signal n6247_o : std_logic_vector (3 downto 0);
  signal n6248_o : std_logic_vector (3 downto 0);
  signal n6249_o : std_logic_vector (2 downto 0);
  signal n6250_o : std_logic_vector (15 downto 0);
  signal n6251_o : std_logic_vector (15 downto 0);
  signal n6252_o : std_logic_vector (10 downto 0);
  signal n6253_o : std_logic_vector (42 downto 0);
  signal n6254_o : std_logic_vector (41 downto 0);
  signal n6255_o : std_logic_vector (42 downto 0);
  signal n6256_o : std_logic_vector (42 downto 0);
  signal n6272_o : std_logic_vector (40 downto 0);
  signal n6273_o : std_logic;
  signal n6277_o : std_logic;
  signal n6278_o : std_logic;
  signal n6285_o : std_logic;
  signal n6289_o : std_logic;
  signal n6291_o : std_logic;
  signal n6292_o : std_logic;
  signal n6294_o : std_logic;
  signal n6300_o : std_logic;
  signal n6303_o : std_logic;
  signal n6305_o : std_logic;
  signal n6306_o : std_logic;
  signal n6307_o : std_logic;
  signal n6308_o : std_logic;
  signal n6309_o : std_logic;
  signal n6310_o : std_logic;
  signal n6311_o : std_logic;
  signal n6312_o : std_logic;
  signal n6313_o : std_logic;
  signal n6314_o : std_logic;
  signal n6315_o : std_logic;
  signal n6316_o : std_logic;
  signal n6317_o : std_logic;
  signal n6318_o : std_logic;
  signal n6319_o : std_logic;
  signal n6320_o : std_logic;
  signal n6321_o : std_logic;
  signal n6322_o : std_logic;
  signal n6323_o : std_logic;
  signal n6324_o : std_logic;
  signal n6325_o : std_logic;
  signal n6326_o : std_logic;
  signal n6327_o : std_logic;
  signal n6328_o : std_logic;
  signal n6329_o : std_logic;
  signal n6330_o : std_logic_vector (3 downto 0);
  signal n6331_o : std_logic_vector (3 downto 0);
  signal n6332_o : std_logic_vector (3 downto 0);
  signal n6333_o : std_logic_vector (3 downto 0);
  signal n6334_o : std_logic_vector (3 downto 0);
  signal n6335_o : std_logic_vector (3 downto 0);
  signal n6336_o : std_logic_vector (15 downto 0);
  signal n6337_o : std_logic_vector (8 downto 0);
  signal n6338_o : std_logic_vector (24 downto 0);
  signal n6339_o : std_logic_vector (23 downto 0);
  signal n6340_o : std_logic_vector (24 downto 0);
  signal n6341_o : std_logic_vector (24 downto 0);
  signal n6342_o : std_logic_vector (24 downto 0);
  signal n6357_o : std_logic_vector (42 downto 0);
  signal n6360_o : std_logic_vector (42 downto 0);
  signal n6372_o : std_logic_vector (42 downto 0);
  signal n6375_o : std_logic_vector (42 downto 0);
  signal n6392_o : std_logic_vector (43 downto 0);
  signal n6407_o : std_logic_vector (43 downto 0);
  signal n6422_o : std_logic_vector (43 downto 0);
  signal n6433_o : std_logic_vector (42 downto 0);
  signal n6434_o : std_logic;
  signal n6438_o : std_logic;
  signal n6439_o : std_logic;
  signal n6446_o : std_logic;
  signal n6452_o : std_logic;
  signal n6453_o : std_logic;
  signal n6454_o : std_logic;
  signal n6455_o : std_logic;
  signal n6456_o : std_logic;
  signal n6457_o : std_logic;
  signal n6458_o : std_logic;
  signal n6459_o : std_logic;
  signal n6460_o : std_logic;
  signal n6461_o : std_logic;
  signal n6462_o : std_logic;
  signal n6463_o : std_logic;
  signal n6464_o : std_logic;
  signal n6465_o : std_logic;
  signal n6466_o : std_logic;
  signal n6467_o : std_logic;
  signal n6468_o : std_logic;
  signal n6469_o : std_logic;
  signal n6470_o : std_logic;
  signal n6471_o : std_logic;
  signal n6472_o : std_logic;
  signal n6473_o : std_logic;
  signal n6474_o : std_logic;
  signal n6475_o : std_logic;
  signal n6476_o : std_logic;
  signal n6477_o : std_logic;
  signal n6478_o : std_logic;
  signal n6479_o : std_logic;
  signal n6480_o : std_logic;
  signal n6481_o : std_logic;
  signal n6482_o : std_logic;
  signal n6483_o : std_logic;
  signal n6484_o : std_logic;
  signal n6485_o : std_logic;
  signal n6486_o : std_logic;
  signal n6487_o : std_logic;
  signal n6488_o : std_logic;
  signal n6489_o : std_logic;
  signal n6490_o : std_logic;
  signal n6491_o : std_logic;
  signal n6492_o : std_logic;
  signal n6493_o : std_logic;
  signal n6494_o : std_logic;
  signal n6495_o : std_logic_vector (3 downto 0);
  signal n6496_o : std_logic_vector (3 downto 0);
  signal n6497_o : std_logic_vector (3 downto 0);
  signal n6498_o : std_logic_vector (3 downto 0);
  signal n6499_o : std_logic_vector (3 downto 0);
  signal n6500_o : std_logic_vector (3 downto 0);
  signal n6501_o : std_logic_vector (3 downto 0);
  signal n6502_o : std_logic_vector (3 downto 0);
  signal n6503_o : std_logic_vector (3 downto 0);
  signal n6504_o : std_logic_vector (3 downto 0);
  signal n6505_o : std_logic_vector (2 downto 0);
  signal n6506_o : std_logic_vector (15 downto 0);
  signal n6507_o : std_logic_vector (15 downto 0);
  signal n6508_o : std_logic_vector (10 downto 0);
  signal n6509_o : std_logic_vector (42 downto 0);
  signal n6510_o : std_logic_vector (41 downto 0);
  signal n6511_o : std_logic_vector (42 downto 0);
  signal n6512_o : std_logic_vector (42 downto 0);
  signal n6528_o : std_logic_vector (40 downto 0);
  signal n6529_o : std_logic;
  signal n6533_o : std_logic;
  signal n6534_o : std_logic;
  signal n6541_o : std_logic;
  signal n6545_o : std_logic;
  signal n6547_o : std_logic;
  signal n6548_o : std_logic;
  signal n6550_o : std_logic;
  signal n6556_o : std_logic;
  signal n6559_o : std_logic;
  signal n6561_o : std_logic;
  signal n6562_o : std_logic;
  signal n6563_o : std_logic;
  signal n6564_o : std_logic;
  signal n6565_o : std_logic;
  signal n6566_o : std_logic;
  signal n6567_o : std_logic;
  signal n6568_o : std_logic;
  signal n6569_o : std_logic;
  signal n6570_o : std_logic;
  signal n6571_o : std_logic;
  signal n6572_o : std_logic;
  signal n6573_o : std_logic;
  signal n6574_o : std_logic;
  signal n6575_o : std_logic;
  signal n6576_o : std_logic;
  signal n6577_o : std_logic;
  signal n6578_o : std_logic;
  signal n6579_o : std_logic;
  signal n6580_o : std_logic;
  signal n6581_o : std_logic;
  signal n6582_o : std_logic;
  signal n6583_o : std_logic;
  signal n6584_o : std_logic;
  signal n6585_o : std_logic;
  signal n6586_o : std_logic_vector (3 downto 0);
  signal n6587_o : std_logic_vector (3 downto 0);
  signal n6588_o : std_logic_vector (3 downto 0);
  signal n6589_o : std_logic_vector (3 downto 0);
  signal n6590_o : std_logic_vector (3 downto 0);
  signal n6591_o : std_logic_vector (3 downto 0);
  signal n6592_o : std_logic_vector (15 downto 0);
  signal n6593_o : std_logic_vector (8 downto 0);
  signal n6594_o : std_logic_vector (24 downto 0);
  signal n6595_o : std_logic_vector (23 downto 0);
  signal n6596_o : std_logic_vector (24 downto 0);
  signal n6597_o : std_logic_vector (24 downto 0);
  signal n6598_o : std_logic_vector (24 downto 0);
  signal n6601_o : std_logic;
  signal n6602_o : std_logic_vector (1 downto 0);
  signal n6603_o : std_logic_vector (24 downto 0);
  signal n6604_o : std_logic_vector (24 downto 0);
  signal n6605_o : std_logic_vector (24 downto 0);
  signal n6606_o : std_logic_vector (24 downto 0);
  signal n6621_o : std_logic;
  signal n6622_o : std_logic_vector (24 downto 0);
  signal n6623_q : std_logic_vector (24 downto 0);
  signal n6624_o : std_logic;
  signal n6625_o : std_logic_vector (24 downto 0);
  signal n6626_q : std_logic_vector (24 downto 0);
  signal n6627_q : std_logic_vector (24 downto 0);
  signal n6628_q : std_logic_vector (24 downto 0);
  signal n6647_o : std_logic_vector (22 downto 0);
  signal n6648_o : std_logic;
  signal n6652_o : std_logic;
  signal n6653_o : std_logic;
  signal n6660_o : std_logic;
  signal n6664_o : std_logic;
  signal n6666_o : std_logic;
  signal n6667_o : std_logic;
  signal n6669_o : std_logic;
  signal n6675_o : std_logic;
  signal n6678_o : std_logic;
  signal n6680_o : std_logic;
  signal n6681_o : std_logic;
  signal n6682_o : std_logic;
  signal n6683_o : std_logic;
  signal n6684_o : std_logic;
  signal n6685_o : std_logic;
  signal n6686_o : std_logic;
  signal n6687_o : std_logic;
  signal n6688_o : std_logic;
  signal n6689_o : std_logic;
  signal n6690_o : std_logic;
  signal n6691_o : std_logic;
  signal n6692_o : std_logic;
  signal n6693_o : std_logic;
  signal n6694_o : std_logic;
  signal n6695_o : std_logic;
  signal n6696_o : std_logic;
  signal n6697_o : std_logic;
  signal n6698_o : std_logic_vector (3 downto 0);
  signal n6699_o : std_logic_vector (3 downto 0);
  signal n6700_o : std_logic_vector (3 downto 0);
  signal n6701_o : std_logic_vector (3 downto 0);
  signal n6702_o : std_logic_vector (1 downto 0);
  signal n6703_o : std_logic_vector (15 downto 0);
  signal n6704_o : std_logic_vector (17 downto 0);
  signal n6705_o : std_logic_vector (16 downto 0);
  signal n6706_o : std_logic_vector (17 downto 0);
  signal n6707_o : std_logic_vector (17 downto 0);
  signal n6708_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n5669_o;
  valid_o <= n5674_o;
  data_o <= n6708_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n5665_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n6623_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n6626_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n6627_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n6628_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n5648_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n5650_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n5652_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n5654_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n5656_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:170:18
  n5657_o <= n5656_o & n5652_o & n5650_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n5657_o select n5660_o <=
    n5654_o when "100",
    "10" when "010",
    n5648_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n5665_q <= "00";
    elsif rising_edge (clk_i) then
      n5665_q <= n5660_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n5668_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n5669_o <= '0' when n5668_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n5673_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n5674_o <= '0' when n5673_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n5694_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n5699_o <= n5698_o (4 downto 0);
  n5700_o <= n5694_o & n5699_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n5701_o <= x_reg when valid_i = '0' else n5700_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n5703_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n5717_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n5720_o <= std_logic_vector (resize (signed (n5717_o) * signed'("0000000000000000000000000000000001100100101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n5737_o <= std_logic_vector (resize (signed (n5720_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n5752_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n5757_o <= n5756_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n5758_o <= n5752_o & n5757_o;
  -- ../fixed_pkg.vhd:257:67
  n5769_o <= std_logic_vector (unsigned (n5737_o) + unsigned (n5758_o));
  -- ../fixed_pkg.vhd:168:39
  n5780_o <= n5769_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5781_o <= n5769_o (43);
  -- ../fixed_pkg.vhd:185:23
  n5785_o <= n5769_o (42);
  -- ../fixed_pkg.vhd:185:27
  n5786_o <= '1' when n5785_o /= n5781_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n5793_o <= '0' when n5786_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n5799_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5800_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5801_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5802_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5803_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5804_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5805_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5806_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5807_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5808_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5809_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5810_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5811_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5812_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5813_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5814_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5815_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5816_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5817_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5818_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5819_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5820_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5821_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5822_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5823_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5824_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5825_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5826_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5827_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5828_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5829_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5830_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5831_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5832_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5833_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5834_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5835_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5836_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5837_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5838_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5839_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5840_o <= not n5781_o;
  -- ../fixed_pkg.vhd:196:31
  n5841_o <= not n5781_o;
  -- ../fixed_pkg.vhd:184:13
  n5842_o <= n5799_o & n5800_o & n5801_o & n5802_o;
  -- ../fixed_pkg.vhd:171:18
  n5843_o <= n5803_o & n5804_o & n5805_o & n5806_o;
  n5844_o <= n5807_o & n5808_o & n5809_o & n5810_o;
  -- ../fixed_pkg.vhd:170:18
  n5845_o <= n5811_o & n5812_o & n5813_o & n5814_o;
  n5846_o <= n5815_o & n5816_o & n5817_o & n5818_o;
  -- ../fixed_pkg.vhd:9:14
  n5847_o <= n5819_o & n5820_o & n5821_o & n5822_o;
  -- ../fixed_pkg.vhd:9:14
  n5848_o <= n5823_o & n5824_o & n5825_o & n5826_o;
  n5849_o <= n5827_o & n5828_o & n5829_o & n5830_o;
  -- ../fixed_pkg.vhd:9:14
  n5850_o <= n5831_o & n5832_o & n5833_o & n5834_o;
  -- ../fixed_pkg.vhd:24:14
  n5851_o <= n5835_o & n5836_o & n5837_o & n5838_o;
  -- ../fixed_pkg.vhd:24:14
  n5852_o <= n5839_o & n5840_o & n5841_o;
  n5853_o <= n5842_o & n5843_o & n5844_o & n5845_o;
  -- ../fixed_pkg.vhd:24:14
  n5854_o <= n5846_o & n5847_o & n5848_o & n5849_o;
  -- ../fixed_pkg.vhd:9:14
  n5855_o <= n5850_o & n5851_o & n5852_o;
  -- ../fixed_pkg.vhd:9:14
  n5856_o <= n5853_o & n5854_o & n5855_o;
  n5857_o <= n5856_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n5858_o <= n5781_o & n5857_o;
  -- ../fixed_pkg.vhd:195:9
  n5859_o <= n5780_o when n5793_o = '0' else n5858_o;
  -- ../fixed_pkg.vhd:168:39
  n5875_o <= n5859_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5876_o <= n5859_o (42);
  -- ../fixed_pkg.vhd:185:23
  n5880_o <= n5859_o (41);
  -- ../fixed_pkg.vhd:185:27
  n5881_o <= '1' when n5880_o /= n5876_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n5888_o <= '0' when n5881_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n5892_o <= '1' when n5881_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n5894_o <= n5859_o (40);
  -- ../fixed_pkg.vhd:185:27
  n5895_o <= '1' when n5894_o /= n5876_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n5897_o <= n5888_o when n5906_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n5903_o <= n5895_o and n5892_o;
  -- ../fixed_pkg.vhd:185:17
  n5906_o <= n5892_o and n5903_o;
  -- ../fixed_pkg.vhd:196:31
  n5908_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5909_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5910_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5911_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5912_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5913_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5914_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5915_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5916_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5917_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5918_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5919_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5920_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5921_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5922_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5923_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5924_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5925_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5926_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5927_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5928_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5929_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5930_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5931_o <= not n5876_o;
  -- ../fixed_pkg.vhd:196:31
  n5932_o <= not n5876_o;
  -- ../fixed_pkg.vhd:9:14
  n5933_o <= n5908_o & n5909_o & n5910_o & n5911_o;
  -- ../fixed_pkg.vhd:9:14
  n5934_o <= n5912_o & n5913_o & n5914_o & n5915_o;
  -- ../fixed_pkg.vhd:24:14
  n5935_o <= n5916_o & n5917_o & n5918_o & n5919_o;
  -- ../fixed_pkg.vhd:24:14
  n5936_o <= n5920_o & n5921_o & n5922_o & n5923_o;
  -- ../fixed_pkg.vhd:171:18
  n5937_o <= n5924_o & n5925_o & n5926_o & n5927_o;
  -- ../fixed_pkg.vhd:24:14
  n5938_o <= n5928_o & n5929_o & n5930_o & n5931_o;
  -- ../fixed_pkg.vhd:185:17
  n5939_o <= n5933_o & n5934_o & n5935_o & n5936_o;
  -- ../fixed_pkg.vhd:171:18
  n5940_o <= n5937_o & n5938_o & n5932_o;
  -- ../fixed_pkg.vhd:185:17
  n5941_o <= n5939_o & n5940_o;
  -- ../fixed_pkg.vhd:170:18
  n5942_o <= n5941_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n5943_o <= n5875_o (40 downto 16);
  -- ../fixed_pkg.vhd:169:40
  n5944_o <= n5876_o & n5942_o;
  -- ../fixed_pkg.vhd:195:9
  n5945_o <= n5943_o when n5897_o = '0' else n5944_o;
  -- ../fixed_pkg.vhd:268:100
  n5961_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n5964_o <= std_logic_vector (resize (signed (n5961_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n5976_o <= std_logic_vector (resize (signed (n5945_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n5979_o <= std_logic_vector (resize (signed (n5976_o) * signed'("0000000000011111111111111100001011000101101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n5996_o <= std_logic_vector (resize (signed (n5964_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n6011_o <= std_logic_vector (resize (signed (n5979_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n6026_o <= std_logic_vector (unsigned (n5996_o) - unsigned (n6011_o));
  -- ../fixed_pkg.vhd:168:39
  n6037_o <= n6026_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6038_o <= n6026_o (43);
  -- ../fixed_pkg.vhd:185:23
  n6042_o <= n6026_o (42);
  -- ../fixed_pkg.vhd:185:27
  n6043_o <= '1' when n6042_o /= n6038_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6050_o <= '0' when n6043_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n6056_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6057_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6058_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6059_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6060_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6061_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6062_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6063_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6064_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6065_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6066_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6067_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6068_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6069_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6070_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6071_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6072_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6073_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6074_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6075_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6076_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6077_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6078_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6079_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6080_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6081_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6082_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6083_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6084_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6085_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6086_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6087_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6088_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6089_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6090_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6091_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6092_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6093_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6094_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6095_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6096_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6097_o <= not n6038_o;
  -- ../fixed_pkg.vhd:196:31
  n6098_o <= not n6038_o;
  -- ../fixed_pkg.vhd:9:14
  n6099_o <= n6056_o & n6057_o & n6058_o & n6059_o;
  -- ../fixed_pkg.vhd:24:14
  n6100_o <= n6060_o & n6061_o & n6062_o & n6063_o;
  -- ../fixed_pkg.vhd:24:14
  n6101_o <= n6064_o & n6065_o & n6066_o & n6067_o;
  -- ../fixed_pkg.vhd:185:17
  n6102_o <= n6068_o & n6069_o & n6070_o & n6071_o;
  -- ../fixed_pkg.vhd:24:14
  n6103_o <= n6072_o & n6073_o & n6074_o & n6075_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n6104_o <= n6076_o & n6077_o & n6078_o & n6079_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n6105_o <= n6080_o & n6081_o & n6082_o & n6083_o;
  -- ../fixed_pkg.vhd:185:17
  n6106_o <= n6084_o & n6085_o & n6086_o & n6087_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n6107_o <= n6088_o & n6089_o & n6090_o & n6091_o;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n6108_o <= n6092_o & n6093_o & n6094_o & n6095_o;
  -- ../BiquadFilter/BiquadFilter.vhd:53:18
  n6109_o <= n6096_o & n6097_o & n6098_o;
  n6110_o <= n6099_o & n6100_o & n6101_o & n6102_o;
  -- ../fixed_pkg.vhd:24:14
  n6111_o <= n6103_o & n6104_o & n6105_o & n6106_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n6112_o <= n6107_o & n6108_o & n6109_o;
  n6113_o <= n6110_o & n6111_o & n6112_o;
  n6114_o <= n6113_o (41 downto 0);
  n6115_o <= n6038_o & n6114_o;
  -- ../fixed_pkg.vhd:195:9
  n6116_o <= n6037_o when n6050_o = '0' else n6115_o;
  -- ../fixed_pkg.vhd:168:39
  n6134_o <= std_logic_vector (resize (signed (n6116_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n6149_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n6154_o <= n6153_o (15 downto 0);
  n6155_o <= n6149_o & n6154_o;
  -- ../fixed_pkg.vhd:257:67
  n6166_o <= std_logic_vector (unsigned (n6134_o) + unsigned (n6155_o));
  -- ../fixed_pkg.vhd:168:39
  n6177_o <= n6166_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6178_o <= n6166_o (43);
  -- ../fixed_pkg.vhd:185:23
  n6182_o <= n6166_o (42);
  -- ../fixed_pkg.vhd:185:27
  n6183_o <= '1' when n6182_o /= n6178_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6190_o <= '0' when n6183_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n6196_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6197_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6198_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6199_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6200_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6201_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6202_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6203_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6204_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6205_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6206_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6207_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6208_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6209_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6210_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6211_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6212_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6213_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6214_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6215_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6216_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6217_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6218_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6219_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6220_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6221_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6222_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6223_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6224_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6225_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6226_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6227_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6228_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6229_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6230_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6231_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6232_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6233_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6234_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6235_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6236_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6237_o <= not n6178_o;
  -- ../fixed_pkg.vhd:196:31
  n6238_o <= not n6178_o;
  n6239_o <= n6196_o & n6197_o & n6198_o & n6199_o;
  n6240_o <= n6200_o & n6201_o & n6202_o & n6203_o;
  n6241_o <= n6204_o & n6205_o & n6206_o & n6207_o;
  n6242_o <= n6208_o & n6209_o & n6210_o & n6211_o;
  n6243_o <= n6212_o & n6213_o & n6214_o & n6215_o;
  n6244_o <= n6216_o & n6217_o & n6218_o & n6219_o;
  n6245_o <= n6220_o & n6221_o & n6222_o & n6223_o;
  n6246_o <= n6224_o & n6225_o & n6226_o & n6227_o;
  n6247_o <= n6228_o & n6229_o & n6230_o & n6231_o;
  n6248_o <= n6232_o & n6233_o & n6234_o & n6235_o;
  n6249_o <= n6236_o & n6237_o & n6238_o;
  n6250_o <= n6239_o & n6240_o & n6241_o & n6242_o;
  n6251_o <= n6243_o & n6244_o & n6245_o & n6246_o;
  n6252_o <= n6247_o & n6248_o & n6249_o;
  n6253_o <= n6250_o & n6251_o & n6252_o;
  n6254_o <= n6253_o (41 downto 0);
  n6255_o <= n6178_o & n6254_o;
  -- ../fixed_pkg.vhd:195:9
  n6256_o <= n6177_o when n6190_o = '0' else n6255_o;
  -- ../fixed_pkg.vhd:168:39
  n6272_o <= n6256_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6273_o <= n6256_o (42);
  -- ../fixed_pkg.vhd:185:23
  n6277_o <= n6256_o (41);
  -- ../fixed_pkg.vhd:185:27
  n6278_o <= '1' when n6277_o /= n6273_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6285_o <= '0' when n6278_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n6289_o <= '1' when n6278_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n6291_o <= n6256_o (40);
  -- ../fixed_pkg.vhd:185:27
  n6292_o <= '1' when n6291_o /= n6273_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6294_o <= n6285_o when n6303_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n6300_o <= n6292_o and n6289_o;
  -- ../fixed_pkg.vhd:185:17
  n6303_o <= n6289_o and n6300_o;
  -- ../fixed_pkg.vhd:196:31
  n6305_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6306_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6307_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6308_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6309_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6310_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6311_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6312_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6313_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6314_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6315_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6316_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6317_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6318_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6319_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6320_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6321_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6322_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6323_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6324_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6325_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6326_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6327_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6328_o <= not n6273_o;
  -- ../fixed_pkg.vhd:196:31
  n6329_o <= not n6273_o;
  n6330_o <= n6305_o & n6306_o & n6307_o & n6308_o;
  n6331_o <= n6309_o & n6310_o & n6311_o & n6312_o;
  n6332_o <= n6313_o & n6314_o & n6315_o & n6316_o;
  n6333_o <= n6317_o & n6318_o & n6319_o & n6320_o;
  n6334_o <= n6321_o & n6322_o & n6323_o & n6324_o;
  n6335_o <= n6325_o & n6326_o & n6327_o & n6328_o;
  n6336_o <= n6330_o & n6331_o & n6332_o & n6333_o;
  n6337_o <= n6334_o & n6335_o & n6329_o;
  n6338_o <= n6336_o & n6337_o;
  n6339_o <= n6338_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n6340_o <= n6272_o (40 downto 16);
  n6341_o <= n6273_o & n6339_o;
  -- ../fixed_pkg.vhd:195:9
  n6342_o <= n6340_o when n6294_o = '0' else n6341_o;
  -- ../fixed_pkg.vhd:268:100
  n6357_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n6360_o <= std_logic_vector (resize (signed (n6357_o) * signed'("0000000000011111111111111111111110011011011"), 43));
  -- ../fixed_pkg.vhd:268:100
  n6372_o <= std_logic_vector (resize (signed (n5945_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n6375_o <= std_logic_vector (resize (signed (n6372_o) * signed'("0000000000000000000000000001111100110110110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n6392_o <= std_logic_vector (resize (signed (n6360_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n6407_o <= std_logic_vector (resize (signed (n6375_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n6422_o <= std_logic_vector (unsigned (n6392_o) - unsigned (n6407_o));
  -- ../fixed_pkg.vhd:168:39
  n6433_o <= n6422_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6434_o <= n6422_o (43);
  -- ../fixed_pkg.vhd:185:23
  n6438_o <= n6422_o (42);
  -- ../fixed_pkg.vhd:185:27
  n6439_o <= '1' when n6438_o /= n6434_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6446_o <= '0' when n6439_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n6452_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6453_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6454_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6455_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6456_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6457_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6458_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6459_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6460_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6461_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6462_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6463_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6464_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6465_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6466_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6467_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6468_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6469_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6470_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6471_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6472_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6473_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6474_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6475_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6476_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6477_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6478_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6479_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6480_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6481_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6482_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6483_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6484_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6485_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6486_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6487_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6488_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6489_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6490_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6491_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6492_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6493_o <= not n6434_o;
  -- ../fixed_pkg.vhd:196:31
  n6494_o <= not n6434_o;
  n6495_o <= n6452_o & n6453_o & n6454_o & n6455_o;
  n6496_o <= n6456_o & n6457_o & n6458_o & n6459_o;
  n6497_o <= n6460_o & n6461_o & n6462_o & n6463_o;
  n6498_o <= n6464_o & n6465_o & n6466_o & n6467_o;
  n6499_o <= n6468_o & n6469_o & n6470_o & n6471_o;
  n6500_o <= n6472_o & n6473_o & n6474_o & n6475_o;
  n6501_o <= n6476_o & n6477_o & n6478_o & n6479_o;
  n6502_o <= n6480_o & n6481_o & n6482_o & n6483_o;
  n6503_o <= n6484_o & n6485_o & n6486_o & n6487_o;
  n6504_o <= n6488_o & n6489_o & n6490_o & n6491_o;
  n6505_o <= n6492_o & n6493_o & n6494_o;
  n6506_o <= n6495_o & n6496_o & n6497_o & n6498_o;
  n6507_o <= n6499_o & n6500_o & n6501_o & n6502_o;
  n6508_o <= n6503_o & n6504_o & n6505_o;
  n6509_o <= n6506_o & n6507_o & n6508_o;
  n6510_o <= n6509_o (41 downto 0);
  n6511_o <= n6434_o & n6510_o;
  -- ../fixed_pkg.vhd:195:9
  n6512_o <= n6433_o when n6446_o = '0' else n6511_o;
  -- ../fixed_pkg.vhd:168:39
  n6528_o <= n6512_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6529_o <= n6512_o (42);
  -- ../fixed_pkg.vhd:185:23
  n6533_o <= n6512_o (41);
  -- ../fixed_pkg.vhd:185:27
  n6534_o <= '1' when n6533_o /= n6529_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6541_o <= '0' when n6534_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n6545_o <= '1' when n6534_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n6547_o <= n6512_o (40);
  -- ../fixed_pkg.vhd:185:27
  n6548_o <= '1' when n6547_o /= n6529_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6550_o <= n6541_o when n6559_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n6556_o <= n6548_o and n6545_o;
  -- ../fixed_pkg.vhd:185:17
  n6559_o <= n6545_o and n6556_o;
  -- ../fixed_pkg.vhd:196:31
  n6561_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6562_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6563_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6564_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6565_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6566_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6567_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6568_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6569_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6570_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6571_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6572_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6573_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6574_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6575_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6576_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6577_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6578_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6579_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6580_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6581_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6582_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6583_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6584_o <= not n6529_o;
  -- ../fixed_pkg.vhd:196:31
  n6585_o <= not n6529_o;
  n6586_o <= n6561_o & n6562_o & n6563_o & n6564_o;
  n6587_o <= n6565_o & n6566_o & n6567_o & n6568_o;
  n6588_o <= n6569_o & n6570_o & n6571_o & n6572_o;
  n6589_o <= n6573_o & n6574_o & n6575_o & n6576_o;
  n6590_o <= n6577_o & n6578_o & n6579_o & n6580_o;
  n6591_o <= n6581_o & n6582_o & n6583_o & n6584_o;
  n6592_o <= n6586_o & n6587_o & n6588_o & n6589_o;
  n6593_o <= n6590_o & n6591_o & n6585_o;
  n6594_o <= n6592_o & n6593_o;
  n6595_o <= n6594_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n6596_o <= n6528_o (40 downto 16);
  n6597_o <= n6529_o & n6595_o;
  -- ../fixed_pkg.vhd:195:9
  n6598_o <= n6596_o when n6550_o = '0' else n6597_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n6601_o <= '1' when state_reg = "01" else '0';
  n6602_o <= n6601_o & n5703_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n6602_o select n6603_o <=
    x_reg when "10",
    n5701_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n6602_o select n6604_o <=
    n5945_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n6602_o select n6605_o <=
    n6342_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n6602_o select n6606_o <=
    n6598_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n6621_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n6622_o <= x_reg when n6621_o = '0' else n6603_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n6623_q <= n6622_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n6624_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n6625_o <= y_reg when n6624_o = '0' else n6604_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n6626_q <= n6625_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n6627_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n6627_q <= n6605_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n6628_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n6628_q <= n6606_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n6647_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6648_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n6652_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n6653_o <= '1' when n6652_o /= n6648_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6660_o <= '0' when n6653_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n6664_o <= '1' when n6653_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n6666_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n6667_o <= '1' when n6666_o /= n6648_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n6669_o <= n6660_o when n6678_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n6675_o <= n6667_o and n6664_o;
  -- ../fixed_pkg.vhd:185:17
  n6678_o <= n6664_o and n6675_o;
  -- ../fixed_pkg.vhd:196:31
  n6680_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6681_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6682_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6683_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6684_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6685_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6686_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6687_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6688_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6689_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6690_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6691_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6692_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6693_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6694_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6695_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6696_o <= not n6648_o;
  -- ../fixed_pkg.vhd:196:31
  n6697_o <= not n6648_o;
  n6698_o <= n6680_o & n6681_o & n6682_o & n6683_o;
  n6699_o <= n6684_o & n6685_o & n6686_o & n6687_o;
  n6700_o <= n6688_o & n6689_o & n6690_o & n6691_o;
  n6701_o <= n6692_o & n6693_o & n6694_o & n6695_o;
  n6702_o <= n6696_o & n6697_o;
  n6703_o <= n6698_o & n6699_o & n6700_o & n6701_o;
  n6704_o <= n6703_o & n6702_o;
  n6705_o <= n6704_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n6706_o <= n6647_o (22 downto 5);
  n6707_o <= n6648_o & n6705_o;
  -- ../fixed_pkg.vhd:195:9
  n6708_o <= n6706_o when n6669_o = '0' else n6707_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_7219f090b8e97a5f56406d3102d0d9a2fe57c6ac is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_7219f090b8e97a5f56406d3102d0d9a2fe57c6ac;

architecture rtl of biquadfilter_7219f090b8e97a5f56406d3102d0d9a2fe57c6ac is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n4580_o : std_logic_vector (1 downto 0);
  signal n4582_o : std_logic;
  signal n4584_o : std_logic;
  signal n4586_o : std_logic_vector (1 downto 0);
  signal n4588_o : std_logic;
  signal n4589_o : std_logic_vector (2 downto 0);
  signal n4592_o : std_logic_vector (1 downto 0);
  signal n4597_q : std_logic_vector (1 downto 0);
  signal n4600_o : std_logic;
  signal n4601_o : std_logic;
  signal n4605_o : std_logic;
  signal n4606_o : std_logic;
  signal n4626_o : std_logic_vector (19 downto 0);
  constant n4630_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n4631_o : std_logic_vector (4 downto 0);
  signal n4632_o : std_logic_vector (24 downto 0);
  signal n4633_o : std_logic_vector (24 downto 0);
  signal n4635_o : std_logic;
  signal n4649_o : std_logic_vector (42 downto 0);
  signal n4652_o : std_logic_vector (42 downto 0);
  signal n4669_o : std_logic_vector (43 downto 0);
  signal n4684_o : std_logic_vector (27 downto 0);
  constant n4688_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n4689_o : std_logic_vector (15 downto 0);
  signal n4690_o : std_logic_vector (43 downto 0);
  signal n4701_o : std_logic_vector (43 downto 0);
  signal n4712_o : std_logic_vector (42 downto 0);
  signal n4713_o : std_logic;
  signal n4717_o : std_logic;
  signal n4718_o : std_logic;
  signal n4725_o : std_logic;
  signal n4731_o : std_logic;
  signal n4732_o : std_logic;
  signal n4733_o : std_logic;
  signal n4734_o : std_logic;
  signal n4735_o : std_logic;
  signal n4736_o : std_logic;
  signal n4737_o : std_logic;
  signal n4738_o : std_logic;
  signal n4739_o : std_logic;
  signal n4740_o : std_logic;
  signal n4741_o : std_logic;
  signal n4742_o : std_logic;
  signal n4743_o : std_logic;
  signal n4744_o : std_logic;
  signal n4745_o : std_logic;
  signal n4746_o : std_logic;
  signal n4747_o : std_logic;
  signal n4748_o : std_logic;
  signal n4749_o : std_logic;
  signal n4750_o : std_logic;
  signal n4751_o : std_logic;
  signal n4752_o : std_logic;
  signal n4753_o : std_logic;
  signal n4754_o : std_logic;
  signal n4755_o : std_logic;
  signal n4756_o : std_logic;
  signal n4757_o : std_logic;
  signal n4758_o : std_logic;
  signal n4759_o : std_logic;
  signal n4760_o : std_logic;
  signal n4761_o : std_logic;
  signal n4762_o : std_logic;
  signal n4763_o : std_logic;
  signal n4764_o : std_logic;
  signal n4765_o : std_logic;
  signal n4766_o : std_logic;
  signal n4767_o : std_logic;
  signal n4768_o : std_logic;
  signal n4769_o : std_logic;
  signal n4770_o : std_logic;
  signal n4771_o : std_logic;
  signal n4772_o : std_logic;
  signal n4773_o : std_logic;
  signal n4774_o : std_logic_vector (3 downto 0);
  signal n4775_o : std_logic_vector (3 downto 0);
  signal n4776_o : std_logic_vector (3 downto 0);
  signal n4777_o : std_logic_vector (3 downto 0);
  signal n4778_o : std_logic_vector (3 downto 0);
  signal n4779_o : std_logic_vector (3 downto 0);
  signal n4780_o : std_logic_vector (3 downto 0);
  signal n4781_o : std_logic_vector (3 downto 0);
  signal n4782_o : std_logic_vector (3 downto 0);
  signal n4783_o : std_logic_vector (3 downto 0);
  signal n4784_o : std_logic_vector (2 downto 0);
  signal n4785_o : std_logic_vector (15 downto 0);
  signal n4786_o : std_logic_vector (15 downto 0);
  signal n4787_o : std_logic_vector (10 downto 0);
  signal n4788_o : std_logic_vector (42 downto 0);
  signal n4789_o : std_logic_vector (41 downto 0);
  signal n4790_o : std_logic_vector (42 downto 0);
  signal n4791_o : std_logic_vector (42 downto 0);
  signal n4807_o : std_logic_vector (40 downto 0);
  signal n4808_o : std_logic;
  signal n4812_o : std_logic;
  signal n4813_o : std_logic;
  signal n4820_o : std_logic;
  signal n4824_o : std_logic;
  signal n4826_o : std_logic;
  signal n4827_o : std_logic;
  signal n4829_o : std_logic;
  signal n4835_o : std_logic;
  signal n4838_o : std_logic;
  signal n4840_o : std_logic;
  signal n4841_o : std_logic;
  signal n4842_o : std_logic;
  signal n4843_o : std_logic;
  signal n4844_o : std_logic;
  signal n4845_o : std_logic;
  signal n4846_o : std_logic;
  signal n4847_o : std_logic;
  signal n4848_o : std_logic;
  signal n4849_o : std_logic;
  signal n4850_o : std_logic;
  signal n4851_o : std_logic;
  signal n4852_o : std_logic;
  signal n4853_o : std_logic;
  signal n4854_o : std_logic;
  signal n4855_o : std_logic;
  signal n4856_o : std_logic;
  signal n4857_o : std_logic;
  signal n4858_o : std_logic;
  signal n4859_o : std_logic;
  signal n4860_o : std_logic;
  signal n4861_o : std_logic;
  signal n4862_o : std_logic;
  signal n4863_o : std_logic;
  signal n4864_o : std_logic;
  signal n4865_o : std_logic_vector (3 downto 0);
  signal n4866_o : std_logic_vector (3 downto 0);
  signal n4867_o : std_logic_vector (3 downto 0);
  signal n4868_o : std_logic_vector (3 downto 0);
  signal n4869_o : std_logic_vector (3 downto 0);
  signal n4870_o : std_logic_vector (3 downto 0);
  signal n4871_o : std_logic_vector (15 downto 0);
  signal n4872_o : std_logic_vector (8 downto 0);
  signal n4873_o : std_logic_vector (24 downto 0);
  signal n4874_o : std_logic_vector (23 downto 0);
  signal n4875_o : std_logic_vector (24 downto 0);
  signal n4876_o : std_logic_vector (24 downto 0);
  signal n4877_o : std_logic_vector (24 downto 0);
  signal n4893_o : std_logic_vector (42 downto 0);
  signal n4896_o : std_logic_vector (42 downto 0);
  signal n4908_o : std_logic_vector (42 downto 0);
  signal n4911_o : std_logic_vector (42 downto 0);
  signal n4928_o : std_logic_vector (43 downto 0);
  signal n4943_o : std_logic_vector (43 downto 0);
  signal n4958_o : std_logic_vector (43 downto 0);
  signal n4969_o : std_logic_vector (42 downto 0);
  signal n4970_o : std_logic;
  signal n4974_o : std_logic;
  signal n4975_o : std_logic;
  signal n4982_o : std_logic;
  signal n4988_o : std_logic;
  signal n4989_o : std_logic;
  signal n4990_o : std_logic;
  signal n4991_o : std_logic;
  signal n4992_o : std_logic;
  signal n4993_o : std_logic;
  signal n4994_o : std_logic;
  signal n4995_o : std_logic;
  signal n4996_o : std_logic;
  signal n4997_o : std_logic;
  signal n4998_o : std_logic;
  signal n4999_o : std_logic;
  signal n5000_o : std_logic;
  signal n5001_o : std_logic;
  signal n5002_o : std_logic;
  signal n5003_o : std_logic;
  signal n5004_o : std_logic;
  signal n5005_o : std_logic;
  signal n5006_o : std_logic;
  signal n5007_o : std_logic;
  signal n5008_o : std_logic;
  signal n5009_o : std_logic;
  signal n5010_o : std_logic;
  signal n5011_o : std_logic;
  signal n5012_o : std_logic;
  signal n5013_o : std_logic;
  signal n5014_o : std_logic;
  signal n5015_o : std_logic;
  signal n5016_o : std_logic;
  signal n5017_o : std_logic;
  signal n5018_o : std_logic;
  signal n5019_o : std_logic;
  signal n5020_o : std_logic;
  signal n5021_o : std_logic;
  signal n5022_o : std_logic;
  signal n5023_o : std_logic;
  signal n5024_o : std_logic;
  signal n5025_o : std_logic;
  signal n5026_o : std_logic;
  signal n5027_o : std_logic;
  signal n5028_o : std_logic;
  signal n5029_o : std_logic;
  signal n5030_o : std_logic;
  signal n5031_o : std_logic_vector (3 downto 0);
  signal n5032_o : std_logic_vector (3 downto 0);
  signal n5033_o : std_logic_vector (3 downto 0);
  signal n5034_o : std_logic_vector (3 downto 0);
  signal n5035_o : std_logic_vector (3 downto 0);
  signal n5036_o : std_logic_vector (3 downto 0);
  signal n5037_o : std_logic_vector (3 downto 0);
  signal n5038_o : std_logic_vector (3 downto 0);
  signal n5039_o : std_logic_vector (3 downto 0);
  signal n5040_o : std_logic_vector (3 downto 0);
  signal n5041_o : std_logic_vector (2 downto 0);
  signal n5042_o : std_logic_vector (15 downto 0);
  signal n5043_o : std_logic_vector (15 downto 0);
  signal n5044_o : std_logic_vector (10 downto 0);
  signal n5045_o : std_logic_vector (42 downto 0);
  signal n5046_o : std_logic_vector (41 downto 0);
  signal n5047_o : std_logic_vector (42 downto 0);
  signal n5048_o : std_logic_vector (42 downto 0);
  signal n5066_o : std_logic_vector (43 downto 0);
  signal n5081_o : std_logic_vector (27 downto 0);
  constant n5085_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n5086_o : std_logic_vector (15 downto 0);
  signal n5087_o : std_logic_vector (43 downto 0);
  signal n5098_o : std_logic_vector (43 downto 0);
  signal n5109_o : std_logic_vector (42 downto 0);
  signal n5110_o : std_logic;
  signal n5114_o : std_logic;
  signal n5115_o : std_logic;
  signal n5122_o : std_logic;
  signal n5128_o : std_logic;
  signal n5129_o : std_logic;
  signal n5130_o : std_logic;
  signal n5131_o : std_logic;
  signal n5132_o : std_logic;
  signal n5133_o : std_logic;
  signal n5134_o : std_logic;
  signal n5135_o : std_logic;
  signal n5136_o : std_logic;
  signal n5137_o : std_logic;
  signal n5138_o : std_logic;
  signal n5139_o : std_logic;
  signal n5140_o : std_logic;
  signal n5141_o : std_logic;
  signal n5142_o : std_logic;
  signal n5143_o : std_logic;
  signal n5144_o : std_logic;
  signal n5145_o : std_logic;
  signal n5146_o : std_logic;
  signal n5147_o : std_logic;
  signal n5148_o : std_logic;
  signal n5149_o : std_logic;
  signal n5150_o : std_logic;
  signal n5151_o : std_logic;
  signal n5152_o : std_logic;
  signal n5153_o : std_logic;
  signal n5154_o : std_logic;
  signal n5155_o : std_logic;
  signal n5156_o : std_logic;
  signal n5157_o : std_logic;
  signal n5158_o : std_logic;
  signal n5159_o : std_logic;
  signal n5160_o : std_logic;
  signal n5161_o : std_logic;
  signal n5162_o : std_logic;
  signal n5163_o : std_logic;
  signal n5164_o : std_logic;
  signal n5165_o : std_logic;
  signal n5166_o : std_logic;
  signal n5167_o : std_logic;
  signal n5168_o : std_logic;
  signal n5169_o : std_logic;
  signal n5170_o : std_logic;
  signal n5171_o : std_logic_vector (3 downto 0);
  signal n5172_o : std_logic_vector (3 downto 0);
  signal n5173_o : std_logic_vector (3 downto 0);
  signal n5174_o : std_logic_vector (3 downto 0);
  signal n5175_o : std_logic_vector (3 downto 0);
  signal n5176_o : std_logic_vector (3 downto 0);
  signal n5177_o : std_logic_vector (3 downto 0);
  signal n5178_o : std_logic_vector (3 downto 0);
  signal n5179_o : std_logic_vector (3 downto 0);
  signal n5180_o : std_logic_vector (3 downto 0);
  signal n5181_o : std_logic_vector (2 downto 0);
  signal n5182_o : std_logic_vector (15 downto 0);
  signal n5183_o : std_logic_vector (15 downto 0);
  signal n5184_o : std_logic_vector (10 downto 0);
  signal n5185_o : std_logic_vector (42 downto 0);
  signal n5186_o : std_logic_vector (41 downto 0);
  signal n5187_o : std_logic_vector (42 downto 0);
  signal n5188_o : std_logic_vector (42 downto 0);
  signal n5204_o : std_logic_vector (40 downto 0);
  signal n5205_o : std_logic;
  signal n5209_o : std_logic;
  signal n5210_o : std_logic;
  signal n5217_o : std_logic;
  signal n5221_o : std_logic;
  signal n5223_o : std_logic;
  signal n5224_o : std_logic;
  signal n5226_o : std_logic;
  signal n5232_o : std_logic;
  signal n5235_o : std_logic;
  signal n5237_o : std_logic;
  signal n5238_o : std_logic;
  signal n5239_o : std_logic;
  signal n5240_o : std_logic;
  signal n5241_o : std_logic;
  signal n5242_o : std_logic;
  signal n5243_o : std_logic;
  signal n5244_o : std_logic;
  signal n5245_o : std_logic;
  signal n5246_o : std_logic;
  signal n5247_o : std_logic;
  signal n5248_o : std_logic;
  signal n5249_o : std_logic;
  signal n5250_o : std_logic;
  signal n5251_o : std_logic;
  signal n5252_o : std_logic;
  signal n5253_o : std_logic;
  signal n5254_o : std_logic;
  signal n5255_o : std_logic;
  signal n5256_o : std_logic;
  signal n5257_o : std_logic;
  signal n5258_o : std_logic;
  signal n5259_o : std_logic;
  signal n5260_o : std_logic;
  signal n5261_o : std_logic;
  signal n5262_o : std_logic_vector (3 downto 0);
  signal n5263_o : std_logic_vector (3 downto 0);
  signal n5264_o : std_logic_vector (3 downto 0);
  signal n5265_o : std_logic_vector (3 downto 0);
  signal n5266_o : std_logic_vector (3 downto 0);
  signal n5267_o : std_logic_vector (3 downto 0);
  signal n5268_o : std_logic_vector (15 downto 0);
  signal n5269_o : std_logic_vector (8 downto 0);
  signal n5270_o : std_logic_vector (24 downto 0);
  signal n5271_o : std_logic_vector (23 downto 0);
  signal n5272_o : std_logic_vector (24 downto 0);
  signal n5273_o : std_logic_vector (24 downto 0);
  signal n5274_o : std_logic_vector (24 downto 0);
  signal n5289_o : std_logic_vector (42 downto 0);
  signal n5292_o : std_logic_vector (42 downto 0);
  signal n5304_o : std_logic_vector (42 downto 0);
  signal n5307_o : std_logic_vector (42 downto 0);
  signal n5324_o : std_logic_vector (43 downto 0);
  signal n5339_o : std_logic_vector (43 downto 0);
  signal n5354_o : std_logic_vector (43 downto 0);
  signal n5365_o : std_logic_vector (42 downto 0);
  signal n5366_o : std_logic;
  signal n5370_o : std_logic;
  signal n5371_o : std_logic;
  signal n5378_o : std_logic;
  signal n5384_o : std_logic;
  signal n5385_o : std_logic;
  signal n5386_o : std_logic;
  signal n5387_o : std_logic;
  signal n5388_o : std_logic;
  signal n5389_o : std_logic;
  signal n5390_o : std_logic;
  signal n5391_o : std_logic;
  signal n5392_o : std_logic;
  signal n5393_o : std_logic;
  signal n5394_o : std_logic;
  signal n5395_o : std_logic;
  signal n5396_o : std_logic;
  signal n5397_o : std_logic;
  signal n5398_o : std_logic;
  signal n5399_o : std_logic;
  signal n5400_o : std_logic;
  signal n5401_o : std_logic;
  signal n5402_o : std_logic;
  signal n5403_o : std_logic;
  signal n5404_o : std_logic;
  signal n5405_o : std_logic;
  signal n5406_o : std_logic;
  signal n5407_o : std_logic;
  signal n5408_o : std_logic;
  signal n5409_o : std_logic;
  signal n5410_o : std_logic;
  signal n5411_o : std_logic;
  signal n5412_o : std_logic;
  signal n5413_o : std_logic;
  signal n5414_o : std_logic;
  signal n5415_o : std_logic;
  signal n5416_o : std_logic;
  signal n5417_o : std_logic;
  signal n5418_o : std_logic;
  signal n5419_o : std_logic;
  signal n5420_o : std_logic;
  signal n5421_o : std_logic;
  signal n5422_o : std_logic;
  signal n5423_o : std_logic;
  signal n5424_o : std_logic;
  signal n5425_o : std_logic;
  signal n5426_o : std_logic;
  signal n5427_o : std_logic_vector (3 downto 0);
  signal n5428_o : std_logic_vector (3 downto 0);
  signal n5429_o : std_logic_vector (3 downto 0);
  signal n5430_o : std_logic_vector (3 downto 0);
  signal n5431_o : std_logic_vector (3 downto 0);
  signal n5432_o : std_logic_vector (3 downto 0);
  signal n5433_o : std_logic_vector (3 downto 0);
  signal n5434_o : std_logic_vector (3 downto 0);
  signal n5435_o : std_logic_vector (3 downto 0);
  signal n5436_o : std_logic_vector (3 downto 0);
  signal n5437_o : std_logic_vector (2 downto 0);
  signal n5438_o : std_logic_vector (15 downto 0);
  signal n5439_o : std_logic_vector (15 downto 0);
  signal n5440_o : std_logic_vector (10 downto 0);
  signal n5441_o : std_logic_vector (42 downto 0);
  signal n5442_o : std_logic_vector (41 downto 0);
  signal n5443_o : std_logic_vector (42 downto 0);
  signal n5444_o : std_logic_vector (42 downto 0);
  signal n5460_o : std_logic_vector (40 downto 0);
  signal n5461_o : std_logic;
  signal n5465_o : std_logic;
  signal n5466_o : std_logic;
  signal n5473_o : std_logic;
  signal n5477_o : std_logic;
  signal n5479_o : std_logic;
  signal n5480_o : std_logic;
  signal n5482_o : std_logic;
  signal n5488_o : std_logic;
  signal n5491_o : std_logic;
  signal n5493_o : std_logic;
  signal n5494_o : std_logic;
  signal n5495_o : std_logic;
  signal n5496_o : std_logic;
  signal n5497_o : std_logic;
  signal n5498_o : std_logic;
  signal n5499_o : std_logic;
  signal n5500_o : std_logic;
  signal n5501_o : std_logic;
  signal n5502_o : std_logic;
  signal n5503_o : std_logic;
  signal n5504_o : std_logic;
  signal n5505_o : std_logic;
  signal n5506_o : std_logic;
  signal n5507_o : std_logic;
  signal n5508_o : std_logic;
  signal n5509_o : std_logic;
  signal n5510_o : std_logic;
  signal n5511_o : std_logic;
  signal n5512_o : std_logic;
  signal n5513_o : std_logic;
  signal n5514_o : std_logic;
  signal n5515_o : std_logic;
  signal n5516_o : std_logic;
  signal n5517_o : std_logic;
  signal n5518_o : std_logic_vector (3 downto 0);
  signal n5519_o : std_logic_vector (3 downto 0);
  signal n5520_o : std_logic_vector (3 downto 0);
  signal n5521_o : std_logic_vector (3 downto 0);
  signal n5522_o : std_logic_vector (3 downto 0);
  signal n5523_o : std_logic_vector (3 downto 0);
  signal n5524_o : std_logic_vector (15 downto 0);
  signal n5525_o : std_logic_vector (8 downto 0);
  signal n5526_o : std_logic_vector (24 downto 0);
  signal n5527_o : std_logic_vector (23 downto 0);
  signal n5528_o : std_logic_vector (24 downto 0);
  signal n5529_o : std_logic_vector (24 downto 0);
  signal n5530_o : std_logic_vector (24 downto 0);
  signal n5533_o : std_logic;
  signal n5534_o : std_logic_vector (1 downto 0);
  signal n5535_o : std_logic_vector (24 downto 0);
  signal n5536_o : std_logic_vector (24 downto 0);
  signal n5537_o : std_logic_vector (24 downto 0);
  signal n5538_o : std_logic_vector (24 downto 0);
  signal n5553_o : std_logic;
  signal n5554_o : std_logic_vector (24 downto 0);
  signal n5555_q : std_logic_vector (24 downto 0);
  signal n5556_o : std_logic;
  signal n5557_o : std_logic_vector (24 downto 0);
  signal n5558_q : std_logic_vector (24 downto 0);
  signal n5559_q : std_logic_vector (24 downto 0);
  signal n5560_q : std_logic_vector (24 downto 0);
  signal n5579_o : std_logic_vector (22 downto 0);
  signal n5580_o : std_logic;
  signal n5584_o : std_logic;
  signal n5585_o : std_logic;
  signal n5592_o : std_logic;
  signal n5596_o : std_logic;
  signal n5598_o : std_logic;
  signal n5599_o : std_logic;
  signal n5601_o : std_logic;
  signal n5607_o : std_logic;
  signal n5610_o : std_logic;
  signal n5612_o : std_logic;
  signal n5613_o : std_logic;
  signal n5614_o : std_logic;
  signal n5615_o : std_logic;
  signal n5616_o : std_logic;
  signal n5617_o : std_logic;
  signal n5618_o : std_logic;
  signal n5619_o : std_logic;
  signal n5620_o : std_logic;
  signal n5621_o : std_logic;
  signal n5622_o : std_logic;
  signal n5623_o : std_logic;
  signal n5624_o : std_logic;
  signal n5625_o : std_logic;
  signal n5626_o : std_logic;
  signal n5627_o : std_logic;
  signal n5628_o : std_logic;
  signal n5629_o : std_logic;
  signal n5630_o : std_logic_vector (3 downto 0);
  signal n5631_o : std_logic_vector (3 downto 0);
  signal n5632_o : std_logic_vector (3 downto 0);
  signal n5633_o : std_logic_vector (3 downto 0);
  signal n5634_o : std_logic_vector (1 downto 0);
  signal n5635_o : std_logic_vector (15 downto 0);
  signal n5636_o : std_logic_vector (17 downto 0);
  signal n5637_o : std_logic_vector (16 downto 0);
  signal n5638_o : std_logic_vector (17 downto 0);
  signal n5639_o : std_logic_vector (17 downto 0);
  signal n5640_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n4601_o;
  valid_o <= n4606_o;
  data_o <= n5640_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n4597_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n5555_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n5558_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n5559_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n5560_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n4580_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n4582_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n4584_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n4586_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n4588_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:170:18
  n4589_o <= n4588_o & n4584_o & n4582_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n4589_o select n4592_o <=
    n4586_o when "100",
    "10" when "010",
    n4580_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n4597_q <= "00";
    elsif rising_edge (clk_i) then
      n4597_q <= n4592_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n4600_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n4601_o <= '0' when n4600_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n4605_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n4606_o <= '0' when n4605_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n4626_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n4631_o <= n4630_o (4 downto 0);
  n4632_o <= n4626_o & n4631_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n4633_o <= x_reg when valid_i = '0' else n4632_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n4635_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n4649_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n4652_o <= std_logic_vector (resize (signed (n4649_o) * signed'("0000000000000000000000000000000001001100000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n4669_o <= std_logic_vector (resize (signed (n4652_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n4684_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n4689_o <= n4688_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n4690_o <= n4684_o & n4689_o;
  -- ../fixed_pkg.vhd:257:67
  n4701_o <= std_logic_vector (unsigned (n4669_o) + unsigned (n4690_o));
  -- ../fixed_pkg.vhd:168:39
  n4712_o <= n4701_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4713_o <= n4701_o (43);
  -- ../fixed_pkg.vhd:185:23
  n4717_o <= n4701_o (42);
  -- ../fixed_pkg.vhd:185:27
  n4718_o <= '1' when n4717_o /= n4713_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4725_o <= '0' when n4718_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n4731_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4732_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4733_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4734_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4735_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4736_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4737_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4738_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4739_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4740_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4741_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4742_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4743_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4744_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4745_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4746_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4747_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4748_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4749_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4750_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4751_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4752_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4753_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4754_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4755_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4756_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4757_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4758_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4759_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4760_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4761_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4762_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4763_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4764_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4765_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4766_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4767_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4768_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4769_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4770_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4771_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4772_o <= not n4713_o;
  -- ../fixed_pkg.vhd:196:31
  n4773_o <= not n4713_o;
  -- ../fixed_pkg.vhd:184:13
  n4774_o <= n4731_o & n4732_o & n4733_o & n4734_o;
  -- ../fixed_pkg.vhd:171:18
  n4775_o <= n4735_o & n4736_o & n4737_o & n4738_o;
  n4776_o <= n4739_o & n4740_o & n4741_o & n4742_o;
  -- ../fixed_pkg.vhd:170:18
  n4777_o <= n4743_o & n4744_o & n4745_o & n4746_o;
  n4778_o <= n4747_o & n4748_o & n4749_o & n4750_o;
  -- ../fixed_pkg.vhd:9:14
  n4779_o <= n4751_o & n4752_o & n4753_o & n4754_o;
  -- ../fixed_pkg.vhd:9:14
  n4780_o <= n4755_o & n4756_o & n4757_o & n4758_o;
  n4781_o <= n4759_o & n4760_o & n4761_o & n4762_o;
  -- ../fixed_pkg.vhd:9:14
  n4782_o <= n4763_o & n4764_o & n4765_o & n4766_o;
  -- ../fixed_pkg.vhd:24:14
  n4783_o <= n4767_o & n4768_o & n4769_o & n4770_o;
  -- ../fixed_pkg.vhd:24:14
  n4784_o <= n4771_o & n4772_o & n4773_o;
  n4785_o <= n4774_o & n4775_o & n4776_o & n4777_o;
  -- ../fixed_pkg.vhd:24:14
  n4786_o <= n4778_o & n4779_o & n4780_o & n4781_o;
  -- ../fixed_pkg.vhd:9:14
  n4787_o <= n4782_o & n4783_o & n4784_o;
  -- ../fixed_pkg.vhd:9:14
  n4788_o <= n4785_o & n4786_o & n4787_o;
  n4789_o <= n4788_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n4790_o <= n4713_o & n4789_o;
  -- ../fixed_pkg.vhd:195:9
  n4791_o <= n4712_o when n4725_o = '0' else n4790_o;
  -- ../fixed_pkg.vhd:168:39
  n4807_o <= n4791_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4808_o <= n4791_o (42);
  -- ../fixed_pkg.vhd:185:23
  n4812_o <= n4791_o (41);
  -- ../fixed_pkg.vhd:185:27
  n4813_o <= '1' when n4812_o /= n4808_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4820_o <= '0' when n4813_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n4824_o <= '1' when n4813_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n4826_o <= n4791_o (40);
  -- ../fixed_pkg.vhd:185:27
  n4827_o <= '1' when n4826_o /= n4808_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4829_o <= n4820_o when n4838_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n4835_o <= n4827_o and n4824_o;
  -- ../fixed_pkg.vhd:185:17
  n4838_o <= n4824_o and n4835_o;
  -- ../fixed_pkg.vhd:196:31
  n4840_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4841_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4842_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4843_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4844_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4845_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4846_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4847_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4848_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4849_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4850_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4851_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4852_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4853_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4854_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4855_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4856_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4857_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4858_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4859_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4860_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4861_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4862_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4863_o <= not n4808_o;
  -- ../fixed_pkg.vhd:196:31
  n4864_o <= not n4808_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n4865_o <= n4840_o & n4841_o & n4842_o & n4843_o;
  -- ../fixed_pkg.vhd:9:14
  n4866_o <= n4844_o & n4845_o & n4846_o & n4847_o;
  -- ../fixed_pkg.vhd:24:14
  n4867_o <= n4848_o & n4849_o & n4850_o & n4851_o;
  -- ../fixed_pkg.vhd:24:14
  n4868_o <= n4852_o & n4853_o & n4854_o & n4855_o;
  -- ../fixed_pkg.vhd:24:14
  n4869_o <= n4856_o & n4857_o & n4858_o & n4859_o;
  -- ../fixed_pkg.vhd:24:14
  n4870_o <= n4860_o & n4861_o & n4862_o & n4863_o;
  -- ../fixed_pkg.vhd:9:14
  n4871_o <= n4865_o & n4866_o & n4867_o & n4868_o;
  -- ../fixed_pkg.vhd:171:18
  n4872_o <= n4869_o & n4870_o & n4864_o;
  -- ../fixed_pkg.vhd:9:14
  n4873_o <= n4871_o & n4872_o;
  -- ../fixed_pkg.vhd:170:18
  n4874_o <= n4873_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n4875_o <= n4807_o (40 downto 16);
  -- ../fixed_pkg.vhd:169:40
  n4876_o <= n4808_o & n4874_o;
  -- ../fixed_pkg.vhd:195:9
  n4877_o <= n4875_o when n4829_o = '0' else n4876_o;
  -- ../fixed_pkg.vhd:268:100
  n4893_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n4896_o <= std_logic_vector (resize (signed (n4893_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n4908_o <= std_logic_vector (resize (signed (n4877_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n4911_o <= std_logic_vector (resize (signed (n4908_o) * signed'("0000000000011111111111111100000110110111101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n4928_o <= std_logic_vector (resize (signed (n4896_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n4943_o <= std_logic_vector (resize (signed (n4911_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n4958_o <= std_logic_vector (unsigned (n4928_o) - unsigned (n4943_o));
  -- ../fixed_pkg.vhd:168:39
  n4969_o <= n4958_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4970_o <= n4958_o (43);
  -- ../fixed_pkg.vhd:185:23
  n4974_o <= n4958_o (42);
  -- ../fixed_pkg.vhd:185:27
  n4975_o <= '1' when n4974_o /= n4970_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4982_o <= '0' when n4975_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n4988_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n4989_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n4990_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n4991_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n4992_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n4993_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n4994_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n4995_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n4996_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n4997_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n4998_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n4999_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5000_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5001_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5002_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5003_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5004_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5005_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5006_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5007_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5008_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5009_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5010_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5011_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5012_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5013_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5014_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5015_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5016_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5017_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5018_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5019_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5020_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5021_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5022_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5023_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5024_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5025_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5026_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5027_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5028_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5029_o <= not n4970_o;
  -- ../fixed_pkg.vhd:196:31
  n5030_o <= not n4970_o;
  -- ../fixed_pkg.vhd:9:14
  n5031_o <= n4988_o & n4989_o & n4990_o & n4991_o;
  -- ../fixed_pkg.vhd:24:14
  n5032_o <= n4992_o & n4993_o & n4994_o & n4995_o;
  -- ../fixed_pkg.vhd:24:14
  n5033_o <= n4996_o & n4997_o & n4998_o & n4999_o;
  -- ../Oscillator/Oscillator.vhd:22:5
  n5034_o <= n5000_o & n5001_o & n5002_o & n5003_o;
  -- ../fixed_pkg.vhd:24:14
  n5035_o <= n5004_o & n5005_o & n5006_o & n5007_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n5036_o <= n5008_o & n5009_o & n5010_o & n5011_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n5037_o <= n5012_o & n5013_o & n5014_o & n5015_o;
  -- ../Oscillator/Oscillator.vhd:29:9
  n5038_o <= n5016_o & n5017_o & n5018_o & n5019_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n5039_o <= n5020_o & n5021_o & n5022_o & n5023_o;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n5040_o <= n5024_o & n5025_o & n5026_o & n5027_o;
  -- ../BiquadFilter/BiquadFilter.vhd:53:18
  n5041_o <= n5028_o & n5029_o & n5030_o;
  -- ../Oscillator/Oscillator.vhd:29:9
  n5042_o <= n5031_o & n5032_o & n5033_o & n5034_o;
  -- ../fixed_pkg.vhd:25:14
  n5043_o <= n5035_o & n5036_o & n5037_o & n5038_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n5044_o <= n5039_o & n5040_o & n5041_o;
  n5045_o <= n5042_o & n5043_o & n5044_o;
  n5046_o <= n5045_o (41 downto 0);
  n5047_o <= n4970_o & n5046_o;
  -- ../fixed_pkg.vhd:195:9
  n5048_o <= n4969_o when n4982_o = '0' else n5047_o;
  -- ../fixed_pkg.vhd:168:39
  n5066_o <= std_logic_vector (resize (signed (n5048_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n5081_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n5086_o <= n5085_o (15 downto 0);
  n5087_o <= n5081_o & n5086_o;
  -- ../fixed_pkg.vhd:257:67
  n5098_o <= std_logic_vector (unsigned (n5066_o) + unsigned (n5087_o));
  -- ../fixed_pkg.vhd:168:39
  n5109_o <= n5098_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5110_o <= n5098_o (43);
  -- ../fixed_pkg.vhd:185:23
  n5114_o <= n5098_o (42);
  -- ../fixed_pkg.vhd:185:27
  n5115_o <= '1' when n5114_o /= n5110_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n5122_o <= '0' when n5115_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n5128_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5129_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5130_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5131_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5132_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5133_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5134_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5135_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5136_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5137_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5138_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5139_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5140_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5141_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5142_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5143_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5144_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5145_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5146_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5147_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5148_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5149_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5150_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5151_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5152_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5153_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5154_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5155_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5156_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5157_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5158_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5159_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5160_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5161_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5162_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5163_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5164_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5165_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5166_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5167_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5168_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5169_o <= not n5110_o;
  -- ../fixed_pkg.vhd:196:31
  n5170_o <= not n5110_o;
  n5171_o <= n5128_o & n5129_o & n5130_o & n5131_o;
  n5172_o <= n5132_o & n5133_o & n5134_o & n5135_o;
  n5173_o <= n5136_o & n5137_o & n5138_o & n5139_o;
  n5174_o <= n5140_o & n5141_o & n5142_o & n5143_o;
  n5175_o <= n5144_o & n5145_o & n5146_o & n5147_o;
  n5176_o <= n5148_o & n5149_o & n5150_o & n5151_o;
  n5177_o <= n5152_o & n5153_o & n5154_o & n5155_o;
  n5178_o <= n5156_o & n5157_o & n5158_o & n5159_o;
  n5179_o <= n5160_o & n5161_o & n5162_o & n5163_o;
  n5180_o <= n5164_o & n5165_o & n5166_o & n5167_o;
  n5181_o <= n5168_o & n5169_o & n5170_o;
  n5182_o <= n5171_o & n5172_o & n5173_o & n5174_o;
  n5183_o <= n5175_o & n5176_o & n5177_o & n5178_o;
  n5184_o <= n5179_o & n5180_o & n5181_o;
  n5185_o <= n5182_o & n5183_o & n5184_o;
  n5186_o <= n5185_o (41 downto 0);
  n5187_o <= n5110_o & n5186_o;
  -- ../fixed_pkg.vhd:195:9
  n5188_o <= n5109_o when n5122_o = '0' else n5187_o;
  -- ../fixed_pkg.vhd:168:39
  n5204_o <= n5188_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5205_o <= n5188_o (42);
  -- ../fixed_pkg.vhd:185:23
  n5209_o <= n5188_o (41);
  -- ../fixed_pkg.vhd:185:27
  n5210_o <= '1' when n5209_o /= n5205_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n5217_o <= '0' when n5210_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n5221_o <= '1' when n5210_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n5223_o <= n5188_o (40);
  -- ../fixed_pkg.vhd:185:27
  n5224_o <= '1' when n5223_o /= n5205_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n5226_o <= n5217_o when n5235_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n5232_o <= n5224_o and n5221_o;
  -- ../fixed_pkg.vhd:185:17
  n5235_o <= n5221_o and n5232_o;
  -- ../fixed_pkg.vhd:196:31
  n5237_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5238_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5239_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5240_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5241_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5242_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5243_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5244_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5245_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5246_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5247_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5248_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5249_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5250_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5251_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5252_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5253_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5254_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5255_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5256_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5257_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5258_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5259_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5260_o <= not n5205_o;
  -- ../fixed_pkg.vhd:196:31
  n5261_o <= not n5205_o;
  n5262_o <= n5237_o & n5238_o & n5239_o & n5240_o;
  n5263_o <= n5241_o & n5242_o & n5243_o & n5244_o;
  n5264_o <= n5245_o & n5246_o & n5247_o & n5248_o;
  n5265_o <= n5249_o & n5250_o & n5251_o & n5252_o;
  n5266_o <= n5253_o & n5254_o & n5255_o & n5256_o;
  n5267_o <= n5257_o & n5258_o & n5259_o & n5260_o;
  n5268_o <= n5262_o & n5263_o & n5264_o & n5265_o;
  n5269_o <= n5266_o & n5267_o & n5261_o;
  n5270_o <= n5268_o & n5269_o;
  n5271_o <= n5270_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n5272_o <= n5204_o (40 downto 16);
  n5273_o <= n5205_o & n5271_o;
  -- ../fixed_pkg.vhd:195:9
  n5274_o <= n5272_o when n5226_o = '0' else n5273_o;
  -- ../fixed_pkg.vhd:268:100
  n5289_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n5292_o <= std_logic_vector (resize (signed (n5289_o) * signed'("0000000000011111111111111111111110110100000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n5304_o <= std_logic_vector (resize (signed (n4877_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n5307_o <= std_logic_vector (resize (signed (n5304_o) * signed'("0000000000000000000000000001111101100111111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n5324_o <= std_logic_vector (resize (signed (n5292_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n5339_o <= std_logic_vector (resize (signed (n5307_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n5354_o <= std_logic_vector (unsigned (n5324_o) - unsigned (n5339_o));
  -- ../fixed_pkg.vhd:168:39
  n5365_o <= n5354_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5366_o <= n5354_o (43);
  -- ../fixed_pkg.vhd:185:23
  n5370_o <= n5354_o (42);
  -- ../fixed_pkg.vhd:185:27
  n5371_o <= '1' when n5370_o /= n5366_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n5378_o <= '0' when n5371_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n5384_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5385_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5386_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5387_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5388_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5389_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5390_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5391_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5392_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5393_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5394_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5395_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5396_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5397_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5398_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5399_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5400_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5401_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5402_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5403_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5404_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5405_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5406_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5407_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5408_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5409_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5410_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5411_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5412_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5413_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5414_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5415_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5416_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5417_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5418_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5419_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5420_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5421_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5422_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5423_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5424_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5425_o <= not n5366_o;
  -- ../fixed_pkg.vhd:196:31
  n5426_o <= not n5366_o;
  n5427_o <= n5384_o & n5385_o & n5386_o & n5387_o;
  n5428_o <= n5388_o & n5389_o & n5390_o & n5391_o;
  n5429_o <= n5392_o & n5393_o & n5394_o & n5395_o;
  n5430_o <= n5396_o & n5397_o & n5398_o & n5399_o;
  n5431_o <= n5400_o & n5401_o & n5402_o & n5403_o;
  n5432_o <= n5404_o & n5405_o & n5406_o & n5407_o;
  n5433_o <= n5408_o & n5409_o & n5410_o & n5411_o;
  n5434_o <= n5412_o & n5413_o & n5414_o & n5415_o;
  n5435_o <= n5416_o & n5417_o & n5418_o & n5419_o;
  n5436_o <= n5420_o & n5421_o & n5422_o & n5423_o;
  n5437_o <= n5424_o & n5425_o & n5426_o;
  n5438_o <= n5427_o & n5428_o & n5429_o & n5430_o;
  n5439_o <= n5431_o & n5432_o & n5433_o & n5434_o;
  n5440_o <= n5435_o & n5436_o & n5437_o;
  n5441_o <= n5438_o & n5439_o & n5440_o;
  n5442_o <= n5441_o (41 downto 0);
  n5443_o <= n5366_o & n5442_o;
  -- ../fixed_pkg.vhd:195:9
  n5444_o <= n5365_o when n5378_o = '0' else n5443_o;
  -- ../fixed_pkg.vhd:168:39
  n5460_o <= n5444_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5461_o <= n5444_o (42);
  -- ../fixed_pkg.vhd:185:23
  n5465_o <= n5444_o (41);
  -- ../fixed_pkg.vhd:185:27
  n5466_o <= '1' when n5465_o /= n5461_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n5473_o <= '0' when n5466_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n5477_o <= '1' when n5466_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n5479_o <= n5444_o (40);
  -- ../fixed_pkg.vhd:185:27
  n5480_o <= '1' when n5479_o /= n5461_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n5482_o <= n5473_o when n5491_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n5488_o <= n5480_o and n5477_o;
  -- ../fixed_pkg.vhd:185:17
  n5491_o <= n5477_o and n5488_o;
  -- ../fixed_pkg.vhd:196:31
  n5493_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5494_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5495_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5496_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5497_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5498_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5499_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5500_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5501_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5502_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5503_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5504_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5505_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5506_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5507_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5508_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5509_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5510_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5511_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5512_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5513_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5514_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5515_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5516_o <= not n5461_o;
  -- ../fixed_pkg.vhd:196:31
  n5517_o <= not n5461_o;
  n5518_o <= n5493_o & n5494_o & n5495_o & n5496_o;
  n5519_o <= n5497_o & n5498_o & n5499_o & n5500_o;
  n5520_o <= n5501_o & n5502_o & n5503_o & n5504_o;
  n5521_o <= n5505_o & n5506_o & n5507_o & n5508_o;
  n5522_o <= n5509_o & n5510_o & n5511_o & n5512_o;
  n5523_o <= n5513_o & n5514_o & n5515_o & n5516_o;
  n5524_o <= n5518_o & n5519_o & n5520_o & n5521_o;
  n5525_o <= n5522_o & n5523_o & n5517_o;
  n5526_o <= n5524_o & n5525_o;
  n5527_o <= n5526_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n5528_o <= n5460_o (40 downto 16);
  n5529_o <= n5461_o & n5527_o;
  -- ../fixed_pkg.vhd:195:9
  n5530_o <= n5528_o when n5482_o = '0' else n5529_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n5533_o <= '1' when state_reg = "01" else '0';
  n5534_o <= n5533_o & n4635_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n5534_o select n5535_o <=
    x_reg when "10",
    n4633_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n5534_o select n5536_o <=
    n4877_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n5534_o select n5537_o <=
    n5274_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n5534_o select n5538_o <=
    n5530_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n5553_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n5554_o <= x_reg when n5553_o = '0' else n5535_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n5555_q <= n5554_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n5556_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n5557_o <= y_reg when n5556_o = '0' else n5536_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n5558_q <= n5557_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n5559_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n5559_q <= n5537_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n5560_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n5560_q <= n5538_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n5579_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5580_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n5584_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n5585_o <= '1' when n5584_o /= n5580_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n5592_o <= '0' when n5585_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n5596_o <= '1' when n5585_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n5598_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n5599_o <= '1' when n5598_o /= n5580_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n5601_o <= n5592_o when n5610_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n5607_o <= n5599_o and n5596_o;
  -- ../fixed_pkg.vhd:185:17
  n5610_o <= n5596_o and n5607_o;
  -- ../fixed_pkg.vhd:196:31
  n5612_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5613_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5614_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5615_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5616_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5617_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5618_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5619_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5620_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5621_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5622_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5623_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5624_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5625_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5626_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5627_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5628_o <= not n5580_o;
  -- ../fixed_pkg.vhd:196:31
  n5629_o <= not n5580_o;
  n5630_o <= n5612_o & n5613_o & n5614_o & n5615_o;
  n5631_o <= n5616_o & n5617_o & n5618_o & n5619_o;
  n5632_o <= n5620_o & n5621_o & n5622_o & n5623_o;
  n5633_o <= n5624_o & n5625_o & n5626_o & n5627_o;
  n5634_o <= n5628_o & n5629_o;
  n5635_o <= n5630_o & n5631_o & n5632_o & n5633_o;
  n5636_o <= n5635_o & n5634_o;
  n5637_o <= n5636_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n5638_o <= n5579_o (22 downto 5);
  n5639_o <= n5580_o & n5637_o;
  -- ../fixed_pkg.vhd:195:9
  n5640_o <= n5638_o when n5601_o = '0' else n5639_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_a8d8a4d0d0a0f8df06960275d213b2bd370e1dd4 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_a8d8a4d0d0a0f8df06960275d213b2bd370e1dd4;

architecture rtl of biquadfilter_a8d8a4d0d0a0f8df06960275d213b2bd370e1dd4 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n3512_o : std_logic_vector (1 downto 0);
  signal n3514_o : std_logic;
  signal n3516_o : std_logic;
  signal n3518_o : std_logic_vector (1 downto 0);
  signal n3520_o : std_logic;
  signal n3521_o : std_logic_vector (2 downto 0);
  signal n3524_o : std_logic_vector (1 downto 0);
  signal n3529_q : std_logic_vector (1 downto 0);
  signal n3532_o : std_logic;
  signal n3533_o : std_logic;
  signal n3537_o : std_logic;
  signal n3538_o : std_logic;
  signal n3558_o : std_logic_vector (19 downto 0);
  constant n3562_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n3563_o : std_logic_vector (4 downto 0);
  signal n3564_o : std_logic_vector (24 downto 0);
  signal n3565_o : std_logic_vector (24 downto 0);
  signal n3567_o : std_logic;
  signal n3581_o : std_logic_vector (42 downto 0);
  signal n3584_o : std_logic_vector (42 downto 0);
  signal n3601_o : std_logic_vector (43 downto 0);
  signal n3616_o : std_logic_vector (27 downto 0);
  constant n3620_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n3621_o : std_logic_vector (15 downto 0);
  signal n3622_o : std_logic_vector (43 downto 0);
  signal n3633_o : std_logic_vector (43 downto 0);
  signal n3644_o : std_logic_vector (42 downto 0);
  signal n3645_o : std_logic;
  signal n3649_o : std_logic;
  signal n3650_o : std_logic;
  signal n3657_o : std_logic;
  signal n3663_o : std_logic;
  signal n3664_o : std_logic;
  signal n3665_o : std_logic;
  signal n3666_o : std_logic;
  signal n3667_o : std_logic;
  signal n3668_o : std_logic;
  signal n3669_o : std_logic;
  signal n3670_o : std_logic;
  signal n3671_o : std_logic;
  signal n3672_o : std_logic;
  signal n3673_o : std_logic;
  signal n3674_o : std_logic;
  signal n3675_o : std_logic;
  signal n3676_o : std_logic;
  signal n3677_o : std_logic;
  signal n3678_o : std_logic;
  signal n3679_o : std_logic;
  signal n3680_o : std_logic;
  signal n3681_o : std_logic;
  signal n3682_o : std_logic;
  signal n3683_o : std_logic;
  signal n3684_o : std_logic;
  signal n3685_o : std_logic;
  signal n3686_o : std_logic;
  signal n3687_o : std_logic;
  signal n3688_o : std_logic;
  signal n3689_o : std_logic;
  signal n3690_o : std_logic;
  signal n3691_o : std_logic;
  signal n3692_o : std_logic;
  signal n3693_o : std_logic;
  signal n3694_o : std_logic;
  signal n3695_o : std_logic;
  signal n3696_o : std_logic;
  signal n3697_o : std_logic;
  signal n3698_o : std_logic;
  signal n3699_o : std_logic;
  signal n3700_o : std_logic;
  signal n3701_o : std_logic;
  signal n3702_o : std_logic;
  signal n3703_o : std_logic;
  signal n3704_o : std_logic;
  signal n3705_o : std_logic;
  signal n3706_o : std_logic_vector (3 downto 0);
  signal n3707_o : std_logic_vector (3 downto 0);
  signal n3708_o : std_logic_vector (3 downto 0);
  signal n3709_o : std_logic_vector (3 downto 0);
  signal n3710_o : std_logic_vector (3 downto 0);
  signal n3711_o : std_logic_vector (3 downto 0);
  signal n3712_o : std_logic_vector (3 downto 0);
  signal n3713_o : std_logic_vector (3 downto 0);
  signal n3714_o : std_logic_vector (3 downto 0);
  signal n3715_o : std_logic_vector (3 downto 0);
  signal n3716_o : std_logic_vector (2 downto 0);
  signal n3717_o : std_logic_vector (15 downto 0);
  signal n3718_o : std_logic_vector (15 downto 0);
  signal n3719_o : std_logic_vector (10 downto 0);
  signal n3720_o : std_logic_vector (42 downto 0);
  signal n3721_o : std_logic_vector (41 downto 0);
  signal n3722_o : std_logic_vector (42 downto 0);
  signal n3723_o : std_logic_vector (42 downto 0);
  signal n3739_o : std_logic_vector (40 downto 0);
  signal n3740_o : std_logic;
  signal n3744_o : std_logic;
  signal n3745_o : std_logic;
  signal n3752_o : std_logic;
  signal n3756_o : std_logic;
  signal n3758_o : std_logic;
  signal n3759_o : std_logic;
  signal n3761_o : std_logic;
  signal n3767_o : std_logic;
  signal n3770_o : std_logic;
  signal n3772_o : std_logic;
  signal n3773_o : std_logic;
  signal n3774_o : std_logic;
  signal n3775_o : std_logic;
  signal n3776_o : std_logic;
  signal n3777_o : std_logic;
  signal n3778_o : std_logic;
  signal n3779_o : std_logic;
  signal n3780_o : std_logic;
  signal n3781_o : std_logic;
  signal n3782_o : std_logic;
  signal n3783_o : std_logic;
  signal n3784_o : std_logic;
  signal n3785_o : std_logic;
  signal n3786_o : std_logic;
  signal n3787_o : std_logic;
  signal n3788_o : std_logic;
  signal n3789_o : std_logic;
  signal n3790_o : std_logic;
  signal n3791_o : std_logic;
  signal n3792_o : std_logic;
  signal n3793_o : std_logic;
  signal n3794_o : std_logic;
  signal n3795_o : std_logic;
  signal n3796_o : std_logic;
  signal n3797_o : std_logic_vector (3 downto 0);
  signal n3798_o : std_logic_vector (3 downto 0);
  signal n3799_o : std_logic_vector (3 downto 0);
  signal n3800_o : std_logic_vector (3 downto 0);
  signal n3801_o : std_logic_vector (3 downto 0);
  signal n3802_o : std_logic_vector (3 downto 0);
  signal n3803_o : std_logic_vector (15 downto 0);
  signal n3804_o : std_logic_vector (8 downto 0);
  signal n3805_o : std_logic_vector (24 downto 0);
  signal n3806_o : std_logic_vector (23 downto 0);
  signal n3807_o : std_logic_vector (24 downto 0);
  signal n3808_o : std_logic_vector (24 downto 0);
  signal n3809_o : std_logic_vector (24 downto 0);
  signal n3825_o : std_logic_vector (42 downto 0);
  signal n3828_o : std_logic_vector (42 downto 0);
  signal n3840_o : std_logic_vector (42 downto 0);
  signal n3843_o : std_logic_vector (42 downto 0);
  signal n3860_o : std_logic_vector (43 downto 0);
  signal n3875_o : std_logic_vector (43 downto 0);
  signal n3890_o : std_logic_vector (43 downto 0);
  signal n3901_o : std_logic_vector (42 downto 0);
  signal n3902_o : std_logic;
  signal n3906_o : std_logic;
  signal n3907_o : std_logic;
  signal n3914_o : std_logic;
  signal n3920_o : std_logic;
  signal n3921_o : std_logic;
  signal n3922_o : std_logic;
  signal n3923_o : std_logic;
  signal n3924_o : std_logic;
  signal n3925_o : std_logic;
  signal n3926_o : std_logic;
  signal n3927_o : std_logic;
  signal n3928_o : std_logic;
  signal n3929_o : std_logic;
  signal n3930_o : std_logic;
  signal n3931_o : std_logic;
  signal n3932_o : std_logic;
  signal n3933_o : std_logic;
  signal n3934_o : std_logic;
  signal n3935_o : std_logic;
  signal n3936_o : std_logic;
  signal n3937_o : std_logic;
  signal n3938_o : std_logic;
  signal n3939_o : std_logic;
  signal n3940_o : std_logic;
  signal n3941_o : std_logic;
  signal n3942_o : std_logic;
  signal n3943_o : std_logic;
  signal n3944_o : std_logic;
  signal n3945_o : std_logic;
  signal n3946_o : std_logic;
  signal n3947_o : std_logic;
  signal n3948_o : std_logic;
  signal n3949_o : std_logic;
  signal n3950_o : std_logic;
  signal n3951_o : std_logic;
  signal n3952_o : std_logic;
  signal n3953_o : std_logic;
  signal n3954_o : std_logic;
  signal n3955_o : std_logic;
  signal n3956_o : std_logic;
  signal n3957_o : std_logic;
  signal n3958_o : std_logic;
  signal n3959_o : std_logic;
  signal n3960_o : std_logic;
  signal n3961_o : std_logic;
  signal n3962_o : std_logic;
  signal n3963_o : std_logic_vector (3 downto 0);
  signal n3964_o : std_logic_vector (3 downto 0);
  signal n3965_o : std_logic_vector (3 downto 0);
  signal n3966_o : std_logic_vector (3 downto 0);
  signal n3967_o : std_logic_vector (3 downto 0);
  signal n3968_o : std_logic_vector (3 downto 0);
  signal n3969_o : std_logic_vector (3 downto 0);
  signal n3970_o : std_logic_vector (3 downto 0);
  signal n3971_o : std_logic_vector (3 downto 0);
  signal n3972_o : std_logic_vector (3 downto 0);
  signal n3973_o : std_logic_vector (2 downto 0);
  signal n3974_o : std_logic_vector (15 downto 0);
  signal n3975_o : std_logic_vector (15 downto 0);
  signal n3976_o : std_logic_vector (10 downto 0);
  signal n3977_o : std_logic_vector (42 downto 0);
  signal n3978_o : std_logic_vector (41 downto 0);
  signal n3979_o : std_logic_vector (42 downto 0);
  signal n3980_o : std_logic_vector (42 downto 0);
  signal n3998_o : std_logic_vector (43 downto 0);
  signal n4013_o : std_logic_vector (27 downto 0);
  constant n4017_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n4018_o : std_logic_vector (15 downto 0);
  signal n4019_o : std_logic_vector (43 downto 0);
  signal n4030_o : std_logic_vector (43 downto 0);
  signal n4041_o : std_logic_vector (42 downto 0);
  signal n4042_o : std_logic;
  signal n4046_o : std_logic;
  signal n4047_o : std_logic;
  signal n4054_o : std_logic;
  signal n4060_o : std_logic;
  signal n4061_o : std_logic;
  signal n4062_o : std_logic;
  signal n4063_o : std_logic;
  signal n4064_o : std_logic;
  signal n4065_o : std_logic;
  signal n4066_o : std_logic;
  signal n4067_o : std_logic;
  signal n4068_o : std_logic;
  signal n4069_o : std_logic;
  signal n4070_o : std_logic;
  signal n4071_o : std_logic;
  signal n4072_o : std_logic;
  signal n4073_o : std_logic;
  signal n4074_o : std_logic;
  signal n4075_o : std_logic;
  signal n4076_o : std_logic;
  signal n4077_o : std_logic;
  signal n4078_o : std_logic;
  signal n4079_o : std_logic;
  signal n4080_o : std_logic;
  signal n4081_o : std_logic;
  signal n4082_o : std_logic;
  signal n4083_o : std_logic;
  signal n4084_o : std_logic;
  signal n4085_o : std_logic;
  signal n4086_o : std_logic;
  signal n4087_o : std_logic;
  signal n4088_o : std_logic;
  signal n4089_o : std_logic;
  signal n4090_o : std_logic;
  signal n4091_o : std_logic;
  signal n4092_o : std_logic;
  signal n4093_o : std_logic;
  signal n4094_o : std_logic;
  signal n4095_o : std_logic;
  signal n4096_o : std_logic;
  signal n4097_o : std_logic;
  signal n4098_o : std_logic;
  signal n4099_o : std_logic;
  signal n4100_o : std_logic;
  signal n4101_o : std_logic;
  signal n4102_o : std_logic;
  signal n4103_o : std_logic_vector (3 downto 0);
  signal n4104_o : std_logic_vector (3 downto 0);
  signal n4105_o : std_logic_vector (3 downto 0);
  signal n4106_o : std_logic_vector (3 downto 0);
  signal n4107_o : std_logic_vector (3 downto 0);
  signal n4108_o : std_logic_vector (3 downto 0);
  signal n4109_o : std_logic_vector (3 downto 0);
  signal n4110_o : std_logic_vector (3 downto 0);
  signal n4111_o : std_logic_vector (3 downto 0);
  signal n4112_o : std_logic_vector (3 downto 0);
  signal n4113_o : std_logic_vector (2 downto 0);
  signal n4114_o : std_logic_vector (15 downto 0);
  signal n4115_o : std_logic_vector (15 downto 0);
  signal n4116_o : std_logic_vector (10 downto 0);
  signal n4117_o : std_logic_vector (42 downto 0);
  signal n4118_o : std_logic_vector (41 downto 0);
  signal n4119_o : std_logic_vector (42 downto 0);
  signal n4120_o : std_logic_vector (42 downto 0);
  signal n4136_o : std_logic_vector (40 downto 0);
  signal n4137_o : std_logic;
  signal n4141_o : std_logic;
  signal n4142_o : std_logic;
  signal n4149_o : std_logic;
  signal n4153_o : std_logic;
  signal n4155_o : std_logic;
  signal n4156_o : std_logic;
  signal n4158_o : std_logic;
  signal n4164_o : std_logic;
  signal n4167_o : std_logic;
  signal n4169_o : std_logic;
  signal n4170_o : std_logic;
  signal n4171_o : std_logic;
  signal n4172_o : std_logic;
  signal n4173_o : std_logic;
  signal n4174_o : std_logic;
  signal n4175_o : std_logic;
  signal n4176_o : std_logic;
  signal n4177_o : std_logic;
  signal n4178_o : std_logic;
  signal n4179_o : std_logic;
  signal n4180_o : std_logic;
  signal n4181_o : std_logic;
  signal n4182_o : std_logic;
  signal n4183_o : std_logic;
  signal n4184_o : std_logic;
  signal n4185_o : std_logic;
  signal n4186_o : std_logic;
  signal n4187_o : std_logic;
  signal n4188_o : std_logic;
  signal n4189_o : std_logic;
  signal n4190_o : std_logic;
  signal n4191_o : std_logic;
  signal n4192_o : std_logic;
  signal n4193_o : std_logic;
  signal n4194_o : std_logic_vector (3 downto 0);
  signal n4195_o : std_logic_vector (3 downto 0);
  signal n4196_o : std_logic_vector (3 downto 0);
  signal n4197_o : std_logic_vector (3 downto 0);
  signal n4198_o : std_logic_vector (3 downto 0);
  signal n4199_o : std_logic_vector (3 downto 0);
  signal n4200_o : std_logic_vector (15 downto 0);
  signal n4201_o : std_logic_vector (8 downto 0);
  signal n4202_o : std_logic_vector (24 downto 0);
  signal n4203_o : std_logic_vector (23 downto 0);
  signal n4204_o : std_logic_vector (24 downto 0);
  signal n4205_o : std_logic_vector (24 downto 0);
  signal n4206_o : std_logic_vector (24 downto 0);
  signal n4221_o : std_logic_vector (42 downto 0);
  signal n4224_o : std_logic_vector (42 downto 0);
  signal n4236_o : std_logic_vector (42 downto 0);
  signal n4239_o : std_logic_vector (42 downto 0);
  signal n4256_o : std_logic_vector (43 downto 0);
  signal n4271_o : std_logic_vector (43 downto 0);
  signal n4286_o : std_logic_vector (43 downto 0);
  signal n4297_o : std_logic_vector (42 downto 0);
  signal n4298_o : std_logic;
  signal n4302_o : std_logic;
  signal n4303_o : std_logic;
  signal n4310_o : std_logic;
  signal n4316_o : std_logic;
  signal n4317_o : std_logic;
  signal n4318_o : std_logic;
  signal n4319_o : std_logic;
  signal n4320_o : std_logic;
  signal n4321_o : std_logic;
  signal n4322_o : std_logic;
  signal n4323_o : std_logic;
  signal n4324_o : std_logic;
  signal n4325_o : std_logic;
  signal n4326_o : std_logic;
  signal n4327_o : std_logic;
  signal n4328_o : std_logic;
  signal n4329_o : std_logic;
  signal n4330_o : std_logic;
  signal n4331_o : std_logic;
  signal n4332_o : std_logic;
  signal n4333_o : std_logic;
  signal n4334_o : std_logic;
  signal n4335_o : std_logic;
  signal n4336_o : std_logic;
  signal n4337_o : std_logic;
  signal n4338_o : std_logic;
  signal n4339_o : std_logic;
  signal n4340_o : std_logic;
  signal n4341_o : std_logic;
  signal n4342_o : std_logic;
  signal n4343_o : std_logic;
  signal n4344_o : std_logic;
  signal n4345_o : std_logic;
  signal n4346_o : std_logic;
  signal n4347_o : std_logic;
  signal n4348_o : std_logic;
  signal n4349_o : std_logic;
  signal n4350_o : std_logic;
  signal n4351_o : std_logic;
  signal n4352_o : std_logic;
  signal n4353_o : std_logic;
  signal n4354_o : std_logic;
  signal n4355_o : std_logic;
  signal n4356_o : std_logic;
  signal n4357_o : std_logic;
  signal n4358_o : std_logic;
  signal n4359_o : std_logic_vector (3 downto 0);
  signal n4360_o : std_logic_vector (3 downto 0);
  signal n4361_o : std_logic_vector (3 downto 0);
  signal n4362_o : std_logic_vector (3 downto 0);
  signal n4363_o : std_logic_vector (3 downto 0);
  signal n4364_o : std_logic_vector (3 downto 0);
  signal n4365_o : std_logic_vector (3 downto 0);
  signal n4366_o : std_logic_vector (3 downto 0);
  signal n4367_o : std_logic_vector (3 downto 0);
  signal n4368_o : std_logic_vector (3 downto 0);
  signal n4369_o : std_logic_vector (2 downto 0);
  signal n4370_o : std_logic_vector (15 downto 0);
  signal n4371_o : std_logic_vector (15 downto 0);
  signal n4372_o : std_logic_vector (10 downto 0);
  signal n4373_o : std_logic_vector (42 downto 0);
  signal n4374_o : std_logic_vector (41 downto 0);
  signal n4375_o : std_logic_vector (42 downto 0);
  signal n4376_o : std_logic_vector (42 downto 0);
  signal n4392_o : std_logic_vector (40 downto 0);
  signal n4393_o : std_logic;
  signal n4397_o : std_logic;
  signal n4398_o : std_logic;
  signal n4405_o : std_logic;
  signal n4409_o : std_logic;
  signal n4411_o : std_logic;
  signal n4412_o : std_logic;
  signal n4414_o : std_logic;
  signal n4420_o : std_logic;
  signal n4423_o : std_logic;
  signal n4425_o : std_logic;
  signal n4426_o : std_logic;
  signal n4427_o : std_logic;
  signal n4428_o : std_logic;
  signal n4429_o : std_logic;
  signal n4430_o : std_logic;
  signal n4431_o : std_logic;
  signal n4432_o : std_logic;
  signal n4433_o : std_logic;
  signal n4434_o : std_logic;
  signal n4435_o : std_logic;
  signal n4436_o : std_logic;
  signal n4437_o : std_logic;
  signal n4438_o : std_logic;
  signal n4439_o : std_logic;
  signal n4440_o : std_logic;
  signal n4441_o : std_logic;
  signal n4442_o : std_logic;
  signal n4443_o : std_logic;
  signal n4444_o : std_logic;
  signal n4445_o : std_logic;
  signal n4446_o : std_logic;
  signal n4447_o : std_logic;
  signal n4448_o : std_logic;
  signal n4449_o : std_logic;
  signal n4450_o : std_logic_vector (3 downto 0);
  signal n4451_o : std_logic_vector (3 downto 0);
  signal n4452_o : std_logic_vector (3 downto 0);
  signal n4453_o : std_logic_vector (3 downto 0);
  signal n4454_o : std_logic_vector (3 downto 0);
  signal n4455_o : std_logic_vector (3 downto 0);
  signal n4456_o : std_logic_vector (15 downto 0);
  signal n4457_o : std_logic_vector (8 downto 0);
  signal n4458_o : std_logic_vector (24 downto 0);
  signal n4459_o : std_logic_vector (23 downto 0);
  signal n4460_o : std_logic_vector (24 downto 0);
  signal n4461_o : std_logic_vector (24 downto 0);
  signal n4462_o : std_logic_vector (24 downto 0);
  signal n4465_o : std_logic;
  signal n4466_o : std_logic_vector (1 downto 0);
  signal n4467_o : std_logic_vector (24 downto 0);
  signal n4468_o : std_logic_vector (24 downto 0);
  signal n4469_o : std_logic_vector (24 downto 0);
  signal n4470_o : std_logic_vector (24 downto 0);
  signal n4485_o : std_logic;
  signal n4486_o : std_logic_vector (24 downto 0);
  signal n4487_q : std_logic_vector (24 downto 0);
  signal n4488_o : std_logic;
  signal n4489_o : std_logic_vector (24 downto 0);
  signal n4490_q : std_logic_vector (24 downto 0);
  signal n4491_q : std_logic_vector (24 downto 0);
  signal n4492_q : std_logic_vector (24 downto 0);
  signal n4511_o : std_logic_vector (22 downto 0);
  signal n4512_o : std_logic;
  signal n4516_o : std_logic;
  signal n4517_o : std_logic;
  signal n4524_o : std_logic;
  signal n4528_o : std_logic;
  signal n4530_o : std_logic;
  signal n4531_o : std_logic;
  signal n4533_o : std_logic;
  signal n4539_o : std_logic;
  signal n4542_o : std_logic;
  signal n4544_o : std_logic;
  signal n4545_o : std_logic;
  signal n4546_o : std_logic;
  signal n4547_o : std_logic;
  signal n4548_o : std_logic;
  signal n4549_o : std_logic;
  signal n4550_o : std_logic;
  signal n4551_o : std_logic;
  signal n4552_o : std_logic;
  signal n4553_o : std_logic;
  signal n4554_o : std_logic;
  signal n4555_o : std_logic;
  signal n4556_o : std_logic;
  signal n4557_o : std_logic;
  signal n4558_o : std_logic;
  signal n4559_o : std_logic;
  signal n4560_o : std_logic;
  signal n4561_o : std_logic;
  signal n4562_o : std_logic_vector (3 downto 0);
  signal n4563_o : std_logic_vector (3 downto 0);
  signal n4564_o : std_logic_vector (3 downto 0);
  signal n4565_o : std_logic_vector (3 downto 0);
  signal n4566_o : std_logic_vector (1 downto 0);
  signal n4567_o : std_logic_vector (15 downto 0);
  signal n4568_o : std_logic_vector (17 downto 0);
  signal n4569_o : std_logic_vector (16 downto 0);
  signal n4570_o : std_logic_vector (17 downto 0);
  signal n4571_o : std_logic_vector (17 downto 0);
  signal n4572_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n3533_o;
  valid_o <= n3538_o;
  data_o <= n4572_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n3529_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n4487_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n4490_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n4491_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n4492_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n3512_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n3514_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n3516_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n3518_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n3520_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:24:14
  n3521_o <= n3520_o & n3516_o & n3514_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n3521_o select n3524_o <=
    n3518_o when "100",
    "10" when "010",
    n3512_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3529_q <= "00";
    elsif rising_edge (clk_i) then
      n3529_q <= n3524_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n3532_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n3533_o <= '0' when n3532_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n3537_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n3538_o <= '0' when n3537_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n3558_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:185:17
  n3563_o <= n3562_o (4 downto 0);
  n3564_o <= n3558_o & n3563_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n3565_o <= x_reg when valid_i = '0' else n3564_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n3567_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n3581_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n3584_o <= std_logic_vector (resize (signed (n3581_o) * signed'("0000000000000000000000000000000000110011000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n3601_o <= std_logic_vector (resize (signed (n3584_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n3616_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n3621_o <= n3620_o (15 downto 0);
  n3622_o <= n3616_o & n3621_o;
  -- ../fixed_pkg.vhd:257:67
  n3633_o <= std_logic_vector (unsigned (n3601_o) + unsigned (n3622_o));
  -- ../fixed_pkg.vhd:168:39
  n3644_o <= n3633_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3645_o <= n3633_o (43);
  -- ../fixed_pkg.vhd:185:23
  n3649_o <= n3633_o (42);
  -- ../fixed_pkg.vhd:185:27
  n3650_o <= '1' when n3649_o /= n3645_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n3657_o <= '0' when n3650_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n3663_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3664_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3665_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3666_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3667_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3668_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3669_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3670_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3671_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3672_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3673_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3674_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3675_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3676_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3677_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3678_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3679_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3680_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3681_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3682_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3683_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3684_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3685_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3686_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3687_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3688_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3689_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3690_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3691_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3692_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3693_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3694_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3695_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3696_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3697_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3698_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3699_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3700_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3701_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3702_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3703_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3704_o <= not n3645_o;
  -- ../fixed_pkg.vhd:196:31
  n3705_o <= not n3645_o;
  -- ../fixed_pkg.vhd:9:14
  n3706_o <= n3663_o & n3664_o & n3665_o & n3666_o;
  -- ../fixed_pkg.vhd:171:18
  n3707_o <= n3667_o & n3668_o & n3669_o & n3670_o;
  -- ../fixed_pkg.vhd:185:17
  n3708_o <= n3671_o & n3672_o & n3673_o & n3674_o;
  -- ../fixed_pkg.vhd:170:18
  n3709_o <= n3675_o & n3676_o & n3677_o & n3678_o;
  -- ../fixed_pkg.vhd:25:14
  n3710_o <= n3679_o & n3680_o & n3681_o & n3682_o;
  -- ../fixed_pkg.vhd:169:40
  n3711_o <= n3683_o & n3684_o & n3685_o & n3686_o;
  -- ../fixed_pkg.vhd:9:14
  n3712_o <= n3687_o & n3688_o & n3689_o & n3690_o;
  -- ../fixed_pkg.vhd:9:14
  n3713_o <= n3691_o & n3692_o & n3693_o & n3694_o;
  -- ../fixed_pkg.vhd:185:17
  n3714_o <= n3695_o & n3696_o & n3697_o & n3698_o;
  -- ../fixed_pkg.vhd:9:14
  n3715_o <= n3699_o & n3700_o & n3701_o & n3702_o;
  -- ../fixed_pkg.vhd:24:14
  n3716_o <= n3703_o & n3704_o & n3705_o;
  -- ../fixed_pkg.vhd:24:14
  n3717_o <= n3706_o & n3707_o & n3708_o & n3709_o;
  -- ../fixed_pkg.vhd:185:17
  n3718_o <= n3710_o & n3711_o & n3712_o & n3713_o;
  -- ../fixed_pkg.vhd:24:14
  n3719_o <= n3714_o & n3715_o & n3716_o;
  -- ../fixed_pkg.vhd:34:14
  n3720_o <= n3717_o & n3718_o & n3719_o;
  -- ../fixed_pkg.vhd:34:14
  n3721_o <= n3720_o (41 downto 0);
  -- ../fixed_pkg.vhd:40:14
  n3722_o <= n3645_o & n3721_o;
  -- ../fixed_pkg.vhd:195:9
  n3723_o <= n3644_o when n3657_o = '0' else n3722_o;
  -- ../fixed_pkg.vhd:168:39
  n3739_o <= n3723_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3740_o <= n3723_o (42);
  -- ../fixed_pkg.vhd:185:23
  n3744_o <= n3723_o (41);
  -- ../fixed_pkg.vhd:185:27
  n3745_o <= '1' when n3744_o /= n3740_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n3752_o <= '0' when n3745_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n3756_o <= '1' when n3745_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n3758_o <= n3723_o (40);
  -- ../fixed_pkg.vhd:185:27
  n3759_o <= '1' when n3758_o /= n3740_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n3761_o <= n3752_o when n3770_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n3767_o <= n3759_o and n3756_o;
  -- ../fixed_pkg.vhd:185:17
  n3770_o <= n3756_o and n3767_o;
  -- ../fixed_pkg.vhd:196:31
  n3772_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3773_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3774_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3775_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3776_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3777_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3778_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3779_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3780_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3781_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3782_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3783_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3784_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3785_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3786_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3787_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3788_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3789_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3790_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3791_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3792_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3793_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3794_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3795_o <= not n3740_o;
  -- ../fixed_pkg.vhd:196:31
  n3796_o <= not n3740_o;
  -- ../fixed_pkg.vhd:9:14
  n3797_o <= n3772_o & n3773_o & n3774_o & n3775_o;
  -- ../fixed_pkg.vhd:9:14
  n3798_o <= n3776_o & n3777_o & n3778_o & n3779_o;
  n3799_o <= n3780_o & n3781_o & n3782_o & n3783_o;
  -- ../fixed_pkg.vhd:9:14
  n3800_o <= n3784_o & n3785_o & n3786_o & n3787_o;
  -- ../fixed_pkg.vhd:9:14
  n3801_o <= n3788_o & n3789_o & n3790_o & n3791_o;
  -- ../fixed_pkg.vhd:9:14
  n3802_o <= n3792_o & n3793_o & n3794_o & n3795_o;
  n3803_o <= n3797_o & n3798_o & n3799_o & n3800_o;
  -- ../fixed_pkg.vhd:9:14
  n3804_o <= n3801_o & n3802_o & n3796_o;
  -- ../fixed_pkg.vhd:171:18
  n3805_o <= n3803_o & n3804_o;
  -- ../fixed_pkg.vhd:9:14
  n3806_o <= n3805_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n3807_o <= n3739_o (40 downto 16);
  n3808_o <= n3740_o & n3806_o;
  -- ../fixed_pkg.vhd:195:9
  n3809_o <= n3807_o when n3761_o = '0' else n3808_o;
  -- ../fixed_pkg.vhd:268:100
  n3825_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n3828_o <= std_logic_vector (resize (signed (n3825_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n3840_o <= std_logic_vector (resize (signed (n3809_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n3843_o <= std_logic_vector (resize (signed (n3840_o) * signed'("0000000000011111111111111100000011100110011"), 43));
  -- ../fixed_pkg.vhd:168:39
  n3860_o <= std_logic_vector (resize (signed (n3828_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n3875_o <= std_logic_vector (resize (signed (n3843_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n3890_o <= std_logic_vector (unsigned (n3860_o) - unsigned (n3875_o));
  -- ../fixed_pkg.vhd:168:39
  n3901_o <= n3890_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3902_o <= n3890_o (43);
  -- ../fixed_pkg.vhd:185:23
  n3906_o <= n3890_o (42);
  -- ../fixed_pkg.vhd:185:27
  n3907_o <= '1' when n3906_o /= n3902_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n3914_o <= '0' when n3907_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n3920_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3921_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3922_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3923_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3924_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3925_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3926_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3927_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3928_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3929_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3930_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3931_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3932_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3933_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3934_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3935_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3936_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3937_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3938_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3939_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3940_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3941_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3942_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3943_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3944_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3945_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3946_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3947_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3948_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3949_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3950_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3951_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3952_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3953_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3954_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3955_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3956_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3957_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3958_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3959_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3960_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3961_o <= not n3902_o;
  -- ../fixed_pkg.vhd:196:31
  n3962_o <= not n3902_o;
  n3963_o <= n3920_o & n3921_o & n3922_o & n3923_o;
  n3964_o <= n3924_o & n3925_o & n3926_o & n3927_o;
  n3965_o <= n3928_o & n3929_o & n3930_o & n3931_o;
  n3966_o <= n3932_o & n3933_o & n3934_o & n3935_o;
  n3967_o <= n3936_o & n3937_o & n3938_o & n3939_o;
  n3968_o <= n3940_o & n3941_o & n3942_o & n3943_o;
  n3969_o <= n3944_o & n3945_o & n3946_o & n3947_o;
  n3970_o <= n3948_o & n3949_o & n3950_o & n3951_o;
  n3971_o <= n3952_o & n3953_o & n3954_o & n3955_o;
  n3972_o <= n3956_o & n3957_o & n3958_o & n3959_o;
  n3973_o <= n3960_o & n3961_o & n3962_o;
  n3974_o <= n3963_o & n3964_o & n3965_o & n3966_o;
  n3975_o <= n3967_o & n3968_o & n3969_o & n3970_o;
  n3976_o <= n3971_o & n3972_o & n3973_o;
  n3977_o <= n3974_o & n3975_o & n3976_o;
  n3978_o <= n3977_o (41 downto 0);
  n3979_o <= n3902_o & n3978_o;
  -- ../fixed_pkg.vhd:195:9
  n3980_o <= n3901_o when n3914_o = '0' else n3979_o;
  -- ../fixed_pkg.vhd:168:39
  n3998_o <= std_logic_vector (resize (signed (n3980_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n4013_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n4018_o <= n4017_o (15 downto 0);
  n4019_o <= n4013_o & n4018_o;
  -- ../fixed_pkg.vhd:257:67
  n4030_o <= std_logic_vector (unsigned (n3998_o) + unsigned (n4019_o));
  -- ../fixed_pkg.vhd:168:39
  n4041_o <= n4030_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4042_o <= n4030_o (43);
  -- ../fixed_pkg.vhd:185:23
  n4046_o <= n4030_o (42);
  -- ../fixed_pkg.vhd:185:27
  n4047_o <= '1' when n4046_o /= n4042_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4054_o <= '0' when n4047_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n4060_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4061_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4062_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4063_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4064_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4065_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4066_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4067_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4068_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4069_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4070_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4071_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4072_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4073_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4074_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4075_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4076_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4077_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4078_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4079_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4080_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4081_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4082_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4083_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4084_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4085_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4086_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4087_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4088_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4089_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4090_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4091_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4092_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4093_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4094_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4095_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4096_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4097_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4098_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4099_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4100_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4101_o <= not n4042_o;
  -- ../fixed_pkg.vhd:196:31
  n4102_o <= not n4042_o;
  n4103_o <= n4060_o & n4061_o & n4062_o & n4063_o;
  n4104_o <= n4064_o & n4065_o & n4066_o & n4067_o;
  n4105_o <= n4068_o & n4069_o & n4070_o & n4071_o;
  n4106_o <= n4072_o & n4073_o & n4074_o & n4075_o;
  n4107_o <= n4076_o & n4077_o & n4078_o & n4079_o;
  n4108_o <= n4080_o & n4081_o & n4082_o & n4083_o;
  n4109_o <= n4084_o & n4085_o & n4086_o & n4087_o;
  n4110_o <= n4088_o & n4089_o & n4090_o & n4091_o;
  n4111_o <= n4092_o & n4093_o & n4094_o & n4095_o;
  n4112_o <= n4096_o & n4097_o & n4098_o & n4099_o;
  n4113_o <= n4100_o & n4101_o & n4102_o;
  n4114_o <= n4103_o & n4104_o & n4105_o & n4106_o;
  n4115_o <= n4107_o & n4108_o & n4109_o & n4110_o;
  n4116_o <= n4111_o & n4112_o & n4113_o;
  n4117_o <= n4114_o & n4115_o & n4116_o;
  n4118_o <= n4117_o (41 downto 0);
  n4119_o <= n4042_o & n4118_o;
  -- ../fixed_pkg.vhd:195:9
  n4120_o <= n4041_o when n4054_o = '0' else n4119_o;
  -- ../fixed_pkg.vhd:168:39
  n4136_o <= n4120_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4137_o <= n4120_o (42);
  -- ../fixed_pkg.vhd:185:23
  n4141_o <= n4120_o (41);
  -- ../fixed_pkg.vhd:185:27
  n4142_o <= '1' when n4141_o /= n4137_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4149_o <= '0' when n4142_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n4153_o <= '1' when n4142_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n4155_o <= n4120_o (40);
  -- ../fixed_pkg.vhd:185:27
  n4156_o <= '1' when n4155_o /= n4137_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4158_o <= n4149_o when n4167_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n4164_o <= n4156_o and n4153_o;
  -- ../fixed_pkg.vhd:185:17
  n4167_o <= n4153_o and n4164_o;
  -- ../fixed_pkg.vhd:196:31
  n4169_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4170_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4171_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4172_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4173_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4174_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4175_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4176_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4177_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4178_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4179_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4180_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4181_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4182_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4183_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4184_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4185_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4186_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4187_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4188_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4189_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4190_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4191_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4192_o <= not n4137_o;
  -- ../fixed_pkg.vhd:196:31
  n4193_o <= not n4137_o;
  n4194_o <= n4169_o & n4170_o & n4171_o & n4172_o;
  n4195_o <= n4173_o & n4174_o & n4175_o & n4176_o;
  n4196_o <= n4177_o & n4178_o & n4179_o & n4180_o;
  n4197_o <= n4181_o & n4182_o & n4183_o & n4184_o;
  n4198_o <= n4185_o & n4186_o & n4187_o & n4188_o;
  n4199_o <= n4189_o & n4190_o & n4191_o & n4192_o;
  n4200_o <= n4194_o & n4195_o & n4196_o & n4197_o;
  n4201_o <= n4198_o & n4199_o & n4193_o;
  n4202_o <= n4200_o & n4201_o;
  n4203_o <= n4202_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n4204_o <= n4136_o (40 downto 16);
  n4205_o <= n4137_o & n4203_o;
  -- ../fixed_pkg.vhd:195:9
  n4206_o <= n4204_o when n4158_o = '0' else n4205_o;
  -- ../fixed_pkg.vhd:268:100
  n4221_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n4224_o <= std_logic_vector (resize (signed (n4221_o) * signed'("0000000000011111111111111111111111001101000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n4236_o <= std_logic_vector (resize (signed (n3809_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n4239_o <= std_logic_vector (resize (signed (n4236_o) * signed'("0000000000000000000000000001111110011010000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n4256_o <= std_logic_vector (resize (signed (n4224_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n4271_o <= std_logic_vector (resize (signed (n4239_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n4286_o <= std_logic_vector (unsigned (n4256_o) - unsigned (n4271_o));
  -- ../fixed_pkg.vhd:168:39
  n4297_o <= n4286_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4298_o <= n4286_o (43);
  -- ../fixed_pkg.vhd:185:23
  n4302_o <= n4286_o (42);
  -- ../fixed_pkg.vhd:185:27
  n4303_o <= '1' when n4302_o /= n4298_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4310_o <= '0' when n4303_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n4316_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4317_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4318_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4319_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4320_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4321_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4322_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4323_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4324_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4325_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4326_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4327_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4328_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4329_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4330_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4331_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4332_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4333_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4334_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4335_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4336_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4337_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4338_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4339_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4340_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4341_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4342_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4343_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4344_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4345_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4346_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4347_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4348_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4349_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4350_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4351_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4352_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4353_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4354_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4355_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4356_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4357_o <= not n4298_o;
  -- ../fixed_pkg.vhd:196:31
  n4358_o <= not n4298_o;
  n4359_o <= n4316_o & n4317_o & n4318_o & n4319_o;
  n4360_o <= n4320_o & n4321_o & n4322_o & n4323_o;
  n4361_o <= n4324_o & n4325_o & n4326_o & n4327_o;
  n4362_o <= n4328_o & n4329_o & n4330_o & n4331_o;
  n4363_o <= n4332_o & n4333_o & n4334_o & n4335_o;
  n4364_o <= n4336_o & n4337_o & n4338_o & n4339_o;
  n4365_o <= n4340_o & n4341_o & n4342_o & n4343_o;
  n4366_o <= n4344_o & n4345_o & n4346_o & n4347_o;
  n4367_o <= n4348_o & n4349_o & n4350_o & n4351_o;
  n4368_o <= n4352_o & n4353_o & n4354_o & n4355_o;
  n4369_o <= n4356_o & n4357_o & n4358_o;
  n4370_o <= n4359_o & n4360_o & n4361_o & n4362_o;
  n4371_o <= n4363_o & n4364_o & n4365_o & n4366_o;
  n4372_o <= n4367_o & n4368_o & n4369_o;
  n4373_o <= n4370_o & n4371_o & n4372_o;
  n4374_o <= n4373_o (41 downto 0);
  n4375_o <= n4298_o & n4374_o;
  -- ../fixed_pkg.vhd:195:9
  n4376_o <= n4297_o when n4310_o = '0' else n4375_o;
  -- ../fixed_pkg.vhd:168:39
  n4392_o <= n4376_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4393_o <= n4376_o (42);
  -- ../fixed_pkg.vhd:185:23
  n4397_o <= n4376_o (41);
  -- ../fixed_pkg.vhd:185:27
  n4398_o <= '1' when n4397_o /= n4393_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4405_o <= '0' when n4398_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n4409_o <= '1' when n4398_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n4411_o <= n4376_o (40);
  -- ../fixed_pkg.vhd:185:27
  n4412_o <= '1' when n4411_o /= n4393_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4414_o <= n4405_o when n4423_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n4420_o <= n4412_o and n4409_o;
  -- ../fixed_pkg.vhd:185:17
  n4423_o <= n4409_o and n4420_o;
  -- ../fixed_pkg.vhd:196:31
  n4425_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4426_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4427_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4428_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4429_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4430_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4431_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4432_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4433_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4434_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4435_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4436_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4437_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4438_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4439_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4440_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4441_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4442_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4443_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4444_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4445_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4446_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4447_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4448_o <= not n4393_o;
  -- ../fixed_pkg.vhd:196:31
  n4449_o <= not n4393_o;
  n4450_o <= n4425_o & n4426_o & n4427_o & n4428_o;
  n4451_o <= n4429_o & n4430_o & n4431_o & n4432_o;
  n4452_o <= n4433_o & n4434_o & n4435_o & n4436_o;
  n4453_o <= n4437_o & n4438_o & n4439_o & n4440_o;
  n4454_o <= n4441_o & n4442_o & n4443_o & n4444_o;
  n4455_o <= n4445_o & n4446_o & n4447_o & n4448_o;
  n4456_o <= n4450_o & n4451_o & n4452_o & n4453_o;
  n4457_o <= n4454_o & n4455_o & n4449_o;
  n4458_o <= n4456_o & n4457_o;
  n4459_o <= n4458_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n4460_o <= n4392_o (40 downto 16);
  n4461_o <= n4393_o & n4459_o;
  -- ../fixed_pkg.vhd:195:9
  n4462_o <= n4460_o when n4414_o = '0' else n4461_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n4465_o <= '1' when state_reg = "01" else '0';
  n4466_o <= n4465_o & n3567_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n4466_o select n4467_o <=
    x_reg when "10",
    n3565_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n4466_o select n4468_o <=
    n3809_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n4466_o select n4469_o <=
    n4206_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n4466_o select n4470_o <=
    n4462_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n4485_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n4486_o <= x_reg when n4485_o = '0' else n4467_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n4487_q <= n4486_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n4488_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n4489_o <= y_reg when n4488_o = '0' else n4468_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n4490_q <= n4489_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n4491_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n4491_q <= n4469_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n4492_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n4492_q <= n4470_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n4511_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4512_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n4516_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n4517_o <= '1' when n4516_o /= n4512_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4524_o <= '0' when n4517_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n4528_o <= '1' when n4517_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n4530_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n4531_o <= '1' when n4530_o /= n4512_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n4533_o <= n4524_o when n4542_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n4539_o <= n4531_o and n4528_o;
  -- ../fixed_pkg.vhd:185:17
  n4542_o <= n4528_o and n4539_o;
  -- ../fixed_pkg.vhd:196:31
  n4544_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4545_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4546_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4547_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4548_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4549_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4550_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4551_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4552_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4553_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4554_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4555_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4556_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4557_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4558_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4559_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4560_o <= not n4512_o;
  -- ../fixed_pkg.vhd:196:31
  n4561_o <= not n4512_o;
  n4562_o <= n4544_o & n4545_o & n4546_o & n4547_o;
  n4563_o <= n4548_o & n4549_o & n4550_o & n4551_o;
  n4564_o <= n4552_o & n4553_o & n4554_o & n4555_o;
  n4565_o <= n4556_o & n4557_o & n4558_o & n4559_o;
  n4566_o <= n4560_o & n4561_o;
  n4567_o <= n4562_o & n4563_o & n4564_o & n4565_o;
  n4568_o <= n4567_o & n4566_o;
  n4569_o <= n4568_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n4570_o <= n4511_o (22 downto 5);
  n4571_o <= n4512_o & n4569_o;
  -- ../fixed_pkg.vhd:195:9
  n4572_o <= n4570_o when n4533_o = '0' else n4571_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity oscillator is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    step_i : in std_logic_vector (4 downto 0);
    ready_i : in std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity oscillator;

architecture rtl of oscillator is
  signal down_reg : std_logic;
  signal sign_reg : std_logic;
  signal index_reg : std_logic_vector (4 downto 0);
  signal n3352_o : std_logic_vector (31 downto 0);
  signal n3353_o : std_logic_vector (31 downto 0);
  signal n3354_o : std_logic_vector (31 downto 0);
  signal n3355_o : std_logic_vector (6 downto 0);
  signal n3356_o : std_logic_vector (31 downto 0);
  signal n3357_o : std_logic_vector (31 downto 0);
  signal n3358_o : std_logic_vector (31 downto 0);
  signal n3359_o : std_logic_vector (6 downto 0);
  signal n3360_o : std_logic_vector (6 downto 0);
  signal n3361_o : std_logic_vector (31 downto 0);
  signal n3363_o : std_logic;
  signal n3364_o : std_logic_vector (31 downto 0);
  signal n3366_o : std_logic_vector (31 downto 0);
  signal n3367_o : std_logic_vector (4 downto 0);
  signal n3368_o : std_logic_vector (31 downto 0);
  signal n3370_o : std_logic;
  signal n3371_o : std_logic_vector (31 downto 0);
  signal n3372_o : std_logic_vector (31 downto 0);
  signal n3373_o : std_logic_vector (4 downto 0);
  signal n3374_o : std_logic;
  signal n3375_o : std_logic_vector (4 downto 0);
  signal n3377_o : std_logic;
  signal n3378_o : std_logic;
  signal n3379_o : std_logic_vector (4 downto 0);
  signal n3381_o : std_logic;
  signal n3382_o : std_logic;
  signal n3383_o : std_logic_vector (4 downto 0);
  signal n3400_o : std_logic;
  signal n3401_q : std_logic;
  signal n3402_o : std_logic;
  signal n3403_q : std_logic;
  signal n3404_o : std_logic_vector (4 downto 0);
  signal n3405_q : std_logic_vector (4 downto 0);
  signal n3412_o : std_logic;
  signal n3414_o : std_logic_vector (4 downto 0);
  signal n3420_o : std_logic_vector (4 downto 0);
  signal n3433_o : std_logic_vector (18 downto 0);
  signal n3434_o : std_logic_vector (18 downto 0);
  signal n3450_o : std_logic_vector (17 downto 0);
  signal n3451_o : std_logic;
  signal n3455_o : std_logic;
  signal n3456_o : std_logic;
  signal n3463_o : std_logic;
  signal n3469_o : std_logic;
  signal n3470_o : std_logic;
  signal n3471_o : std_logic;
  signal n3472_o : std_logic;
  signal n3473_o : std_logic;
  signal n3474_o : std_logic;
  signal n3475_o : std_logic;
  signal n3476_o : std_logic;
  signal n3477_o : std_logic;
  signal n3478_o : std_logic;
  signal n3479_o : std_logic;
  signal n3480_o : std_logic;
  signal n3481_o : std_logic;
  signal n3482_o : std_logic;
  signal n3483_o : std_logic;
  signal n3484_o : std_logic;
  signal n3485_o : std_logic;
  signal n3486_o : std_logic;
  signal n3487_o : std_logic_vector (3 downto 0);
  signal n3488_o : std_logic_vector (3 downto 0);
  signal n3489_o : std_logic_vector (3 downto 0);
  signal n3490_o : std_logic_vector (3 downto 0);
  signal n3491_o : std_logic_vector (1 downto 0);
  signal n3492_o : std_logic_vector (15 downto 0);
  signal n3493_o : std_logic_vector (17 downto 0);
  signal n3494_o : std_logic_vector (16 downto 0);
  signal n3495_o : std_logic_vector (17 downto 0);
  signal n3496_o : std_logic_vector (17 downto 0);
  signal n3498_o : std_logic_vector (17 downto 0);
  signal n3501_q : std_logic_vector (17 downto 0);
  signal n3503_data : std_logic_vector (17 downto 0);
  signal n3505_data : std_logic_vector (17 downto 0);
begin
  data_o <= n3501_q;
  -- ../Oscillator/Oscillator.vhd:19:12
  down_reg <= n3401_q; -- (signal)
  -- ../Oscillator/Oscillator.vhd:19:22
  sign_reg <= n3403_q; -- (signal)
  -- ../Oscillator/Oscillator.vhd:20:12
  index_reg <= n3405_q; -- (signal)
  -- ../Oscillator/Oscillator.vhd:32:45
  n3352_o <= "000000000000000000000000000" & index_reg;  --  uext
  -- ../Oscillator/Oscillator.vhd:32:45
  n3353_o <= "000000000000000000000000000" & step_i;  --  uext
  -- ../Oscillator/Oscillator.vhd:32:45
  n3354_o <= std_logic_vector (unsigned (n3352_o) - unsigned (n3353_o));
  -- ../Oscillator/Oscillator.vhd:32:21
  n3355_o <= n3354_o (6 downto 0);  --  trunc
  -- ../Oscillator/Oscillator.vhd:34:45
  n3356_o <= "000000000000000000000000000" & index_reg;  --  uext
  -- ../Oscillator/Oscillator.vhd:34:45
  n3357_o <= "000000000000000000000000000" & step_i;  --  uext
  -- ../Oscillator/Oscillator.vhd:34:45
  n3358_o <= std_logic_vector (unsigned (n3356_o) + unsigned (n3357_o));
  -- ../Oscillator/Oscillator.vhd:34:21
  n3359_o <= n3358_o (6 downto 0);  --  trunc
  -- ../Oscillator/Oscillator.vhd:31:17
  n3360_o <= n3359_o when down_reg = '0' else n3355_o;
  -- ../Oscillator/Oscillator.vhd:36:31
  n3361_o <= std_logic_vector (resize (signed (n3360_o), 32));  --  sext
  -- ../Oscillator/Oscillator.vhd:36:31
  n3363_o <= '1' when signed (n3361_o) >= signed'("00000000000000000000000000011001") else '0';
  -- ../Oscillator/Oscillator.vhd:37:53
  n3364_o <= std_logic_vector (resize (signed (n3360_o), 32));  --  sext
  -- ../Oscillator/Oscillator.vhd:37:53
  n3366_o <= std_logic_vector (unsigned'("00000000000000000000000000110010") - unsigned (n3364_o));
  -- ../Oscillator/Oscillator.vhd:37:34
  n3367_o <= n3366_o (4 downto 0);  --  trunc
  -- ../Oscillator/Oscillator.vhd:39:34
  n3368_o <= std_logic_vector (resize (signed (n3360_o), 32));  --  sext
  -- ../Oscillator/Oscillator.vhd:39:34
  n3370_o <= '1' when signed (n3368_o) <= signed'("00000000000000000000000000000000") else '0';
  -- ../Oscillator/Oscillator.vhd:40:34
  n3371_o <= std_logic_vector (resize (signed (n3360_o), 32));  --  sext
  -- ../Oscillator/Oscillator.vhd:40:34
  n3372_o <= std_logic_vector(-signed (n3371_o));
  -- ../Oscillator/Oscillator.vhd:40:34
  n3373_o <= n3372_o (4 downto 0);  --  trunc
  -- ../Oscillator/Oscillator.vhd:42:34
  n3374_o <= not sign_reg;
  -- ../Oscillator/Oscillator.vhd:44:34
  n3375_o <= n3360_o (4 downto 0);  --  trunc
  -- ../Oscillator/Oscillator.vhd:39:17
  n3377_o <= down_reg when n3370_o = '0' else '0';
  -- ../Oscillator/Oscillator.vhd:39:17
  n3378_o <= sign_reg when n3370_o = '0' else n3374_o;
  -- ../Oscillator/Oscillator.vhd:39:17
  n3379_o <= n3375_o when n3370_o = '0' else n3373_o;
  -- ../Oscillator/Oscillator.vhd:36:17
  n3381_o <= n3377_o when n3363_o = '0' else '1';
  -- ../Oscillator/Oscillator.vhd:36:17
  n3382_o <= n3378_o when n3363_o = '0' else sign_reg;
  -- ../Oscillator/Oscillator.vhd:36:17
  n3383_o <= n3379_o when n3363_o = '0' else n3367_o;
  -- ../Oscillator/Oscillator.vhd:8:8
  n3400_o <= down_reg when ready_i = '0' else n3381_o;
  -- ../Oscillator/Oscillator.vhd:29:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3401_q <= '0';
    elsif rising_edge (clk_i) then
      n3401_q <= n3400_o;
    end if;
  end process;
  -- ../Oscillator/Oscillator.vhd:8:8
  n3402_o <= sign_reg when ready_i = '0' else n3382_o;
  -- ../Oscillator/Oscillator.vhd:29:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3403_q <= '0';
    elsif rising_edge (clk_i) then
      n3403_q <= n3402_o;
    end if;
  end process;
  -- ../Oscillator/Oscillator.vhd:8:8
  n3404_o <= index_reg when ready_i = '0' else n3383_o;
  -- ../Oscillator/Oscillator.vhd:29:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3405_q <= "00000";
    elsif rising_edge (clk_i) then
      n3405_q <= n3404_o;
    end if;
  end process;
  -- ../Oscillator/Oscillator.vhd:53:25
  n3412_o <= not sign_reg;
  -- ../Oscillator/Oscillator.vhd:54:37
  n3414_o <= std_logic_vector (unsigned'("11001") - unsigned (index_reg));
  -- ../Oscillator/Oscillator.vhd:56:38
  n3420_o <= std_logic_vector (unsigned'("11001") - unsigned (index_reg));
  -- ../fixed_pkg.vhd:231:32
  n3433_o <= std_logic_vector (resize (signed (n3505_data), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n3434_o <= std_logic_vector(-signed (n3433_o));
  -- ../fixed_pkg.vhd:168:39
  n3450_o <= n3434_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3451_o <= n3434_o (18);
  -- ../fixed_pkg.vhd:185:23
  n3455_o <= n3434_o (17);
  -- ../fixed_pkg.vhd:185:27
  n3456_o <= '1' when n3455_o /= n3451_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n3463_o <= '0' when n3456_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n3469_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3470_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3471_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3472_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3473_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3474_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3475_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3476_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3477_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3478_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3479_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3480_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3481_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3482_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3483_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3484_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3485_o <= not n3451_o;
  -- ../fixed_pkg.vhd:196:31
  n3486_o <= not n3451_o;
  n3487_o <= n3469_o & n3470_o & n3471_o & n3472_o;
  -- ../fixed_pkg.vhd:34:14
  n3488_o <= n3473_o & n3474_o & n3475_o & n3476_o;
  n3489_o <= n3477_o & n3478_o & n3479_o & n3480_o;
  -- ../fixed_pkg.vhd:9:14
  n3490_o <= n3481_o & n3482_o & n3483_o & n3484_o;
  -- ../fixed_pkg.vhd:9:14
  n3491_o <= n3485_o & n3486_o;
  n3492_o <= n3487_o & n3488_o & n3489_o & n3490_o;
  -- ../fixed_pkg.vhd:9:14
  n3493_o <= n3492_o & n3491_o;
  -- ../fixed_pkg.vhd:40:14
  n3494_o <= n3493_o (16 downto 0);
  -- ../fixed_pkg.vhd:40:14
  n3495_o <= n3451_o & n3494_o;
  -- ../fixed_pkg.vhd:195:9
  n3496_o <= n3450_o when n3463_o = '0' else n3495_o;
  -- ../Oscillator/Oscillator.vhd:53:13
  n3498_o <= n3496_o when n3412_o = '0' else n3503_data;
  -- ../Oscillator/Oscillator.vhd:52:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n3501_q <= n3498_o;
    end if;
  end process;
  -- ../Oscillator/Oscillator.vhd:14:9
  process (n3414_o) is
    type n3502_oport_type is array (0 to 25)
      of std_logic_vector (17 downto 0);
    variable n3502_oport : n3502_oport_type :=
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
    n3503_data <= n3502_oport(to_integer (unsigned (n3414_o)));
  end process;
  -- ../Oscillator/Oscillator.vhd:54:38
  -- ../Oscillator/Oscillator.vhd:54:37
  process (n3420_o) is
    type n3504_oport_type is array (0 to 25)
      of std_logic_vector (17 downto 0);
    variable n3504_oport : n3504_oport_type :=
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
    n3505_data <= n3504_oport(to_integer (unsigned (n3420_o)));
  end process;
  -- ../Oscillator/Oscillator.vhd:56:39
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b;

architecture rtl of biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n2286_o : std_logic_vector (1 downto 0);
  signal n2288_o : std_logic;
  signal n2290_o : std_logic;
  signal n2292_o : std_logic_vector (1 downto 0);
  signal n2294_o : std_logic;
  signal n2295_o : std_logic_vector (2 downto 0);
  signal n2298_o : std_logic_vector (1 downto 0);
  signal n2303_q : std_logic_vector (1 downto 0);
  signal n2306_o : std_logic;
  signal n2307_o : std_logic;
  signal n2311_o : std_logic;
  signal n2312_o : std_logic;
  signal n2332_o : std_logic_vector (19 downto 0);
  constant n2336_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n2337_o : std_logic_vector (4 downto 0);
  signal n2338_o : std_logic_vector (24 downto 0);
  signal n2339_o : std_logic_vector (24 downto 0);
  signal n2341_o : std_logic;
  signal n2355_o : std_logic_vector (42 downto 0);
  signal n2358_o : std_logic_vector (42 downto 0);
  signal n2375_o : std_logic_vector (43 downto 0);
  signal n2390_o : std_logic_vector (27 downto 0);
  constant n2394_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n2395_o : std_logic_vector (15 downto 0);
  signal n2396_o : std_logic_vector (43 downto 0);
  signal n2407_o : std_logic_vector (43 downto 0);
  signal n2418_o : std_logic_vector (42 downto 0);
  signal n2419_o : std_logic;
  signal n2423_o : std_logic;
  signal n2424_o : std_logic;
  signal n2431_o : std_logic;
  signal n2437_o : std_logic;
  signal n2438_o : std_logic;
  signal n2439_o : std_logic;
  signal n2440_o : std_logic;
  signal n2441_o : std_logic;
  signal n2442_o : std_logic;
  signal n2443_o : std_logic;
  signal n2444_o : std_logic;
  signal n2445_o : std_logic;
  signal n2446_o : std_logic;
  signal n2447_o : std_logic;
  signal n2448_o : std_logic;
  signal n2449_o : std_logic;
  signal n2450_o : std_logic;
  signal n2451_o : std_logic;
  signal n2452_o : std_logic;
  signal n2453_o : std_logic;
  signal n2454_o : std_logic;
  signal n2455_o : std_logic;
  signal n2456_o : std_logic;
  signal n2457_o : std_logic;
  signal n2458_o : std_logic;
  signal n2459_o : std_logic;
  signal n2460_o : std_logic;
  signal n2461_o : std_logic;
  signal n2462_o : std_logic;
  signal n2463_o : std_logic;
  signal n2464_o : std_logic;
  signal n2465_o : std_logic;
  signal n2466_o : std_logic;
  signal n2467_o : std_logic;
  signal n2468_o : std_logic;
  signal n2469_o : std_logic;
  signal n2470_o : std_logic;
  signal n2471_o : std_logic;
  signal n2472_o : std_logic;
  signal n2473_o : std_logic;
  signal n2474_o : std_logic;
  signal n2475_o : std_logic;
  signal n2476_o : std_logic;
  signal n2477_o : std_logic;
  signal n2478_o : std_logic;
  signal n2479_o : std_logic;
  signal n2480_o : std_logic_vector (3 downto 0);
  signal n2481_o : std_logic_vector (3 downto 0);
  signal n2482_o : std_logic_vector (3 downto 0);
  signal n2483_o : std_logic_vector (3 downto 0);
  signal n2484_o : std_logic_vector (3 downto 0);
  signal n2485_o : std_logic_vector (3 downto 0);
  signal n2486_o : std_logic_vector (3 downto 0);
  signal n2487_o : std_logic_vector (3 downto 0);
  signal n2488_o : std_logic_vector (3 downto 0);
  signal n2489_o : std_logic_vector (3 downto 0);
  signal n2490_o : std_logic_vector (2 downto 0);
  signal n2491_o : std_logic_vector (15 downto 0);
  signal n2492_o : std_logic_vector (15 downto 0);
  signal n2493_o : std_logic_vector (10 downto 0);
  signal n2494_o : std_logic_vector (42 downto 0);
  signal n2495_o : std_logic_vector (41 downto 0);
  signal n2496_o : std_logic_vector (42 downto 0);
  signal n2497_o : std_logic_vector (42 downto 0);
  signal n2513_o : std_logic_vector (40 downto 0);
  signal n2514_o : std_logic;
  signal n2518_o : std_logic;
  signal n2519_o : std_logic;
  signal n2526_o : std_logic;
  signal n2530_o : std_logic;
  signal n2532_o : std_logic;
  signal n2533_o : std_logic;
  signal n2535_o : std_logic;
  signal n2541_o : std_logic;
  signal n2544_o : std_logic;
  signal n2546_o : std_logic;
  signal n2547_o : std_logic;
  signal n2548_o : std_logic;
  signal n2549_o : std_logic;
  signal n2550_o : std_logic;
  signal n2551_o : std_logic;
  signal n2552_o : std_logic;
  signal n2553_o : std_logic;
  signal n2554_o : std_logic;
  signal n2555_o : std_logic;
  signal n2556_o : std_logic;
  signal n2557_o : std_logic;
  signal n2558_o : std_logic;
  signal n2559_o : std_logic;
  signal n2560_o : std_logic;
  signal n2561_o : std_logic;
  signal n2562_o : std_logic;
  signal n2563_o : std_logic;
  signal n2564_o : std_logic;
  signal n2565_o : std_logic;
  signal n2566_o : std_logic;
  signal n2567_o : std_logic;
  signal n2568_o : std_logic;
  signal n2569_o : std_logic;
  signal n2570_o : std_logic;
  signal n2571_o : std_logic_vector (3 downto 0);
  signal n2572_o : std_logic_vector (3 downto 0);
  signal n2573_o : std_logic_vector (3 downto 0);
  signal n2574_o : std_logic_vector (3 downto 0);
  signal n2575_o : std_logic_vector (3 downto 0);
  signal n2576_o : std_logic_vector (3 downto 0);
  signal n2577_o : std_logic_vector (15 downto 0);
  signal n2578_o : std_logic_vector (8 downto 0);
  signal n2579_o : std_logic_vector (24 downto 0);
  signal n2580_o : std_logic_vector (23 downto 0);
  signal n2581_o : std_logic_vector (24 downto 0);
  signal n2582_o : std_logic_vector (24 downto 0);
  signal n2583_o : std_logic_vector (24 downto 0);
  signal n2599_o : std_logic_vector (42 downto 0);
  signal n2602_o : std_logic_vector (42 downto 0);
  signal n2614_o : std_logic_vector (42 downto 0);
  signal n2617_o : std_logic_vector (42 downto 0);
  signal n2634_o : std_logic_vector (43 downto 0);
  signal n2649_o : std_logic_vector (43 downto 0);
  signal n2664_o : std_logic_vector (43 downto 0);
  signal n2675_o : std_logic_vector (42 downto 0);
  signal n2676_o : std_logic;
  signal n2680_o : std_logic;
  signal n2681_o : std_logic;
  signal n2688_o : std_logic;
  signal n2694_o : std_logic;
  signal n2695_o : std_logic;
  signal n2696_o : std_logic;
  signal n2697_o : std_logic;
  signal n2698_o : std_logic;
  signal n2699_o : std_logic;
  signal n2700_o : std_logic;
  signal n2701_o : std_logic;
  signal n2702_o : std_logic;
  signal n2703_o : std_logic;
  signal n2704_o : std_logic;
  signal n2705_o : std_logic;
  signal n2706_o : std_logic;
  signal n2707_o : std_logic;
  signal n2708_o : std_logic;
  signal n2709_o : std_logic;
  signal n2710_o : std_logic;
  signal n2711_o : std_logic;
  signal n2712_o : std_logic;
  signal n2713_o : std_logic;
  signal n2714_o : std_logic;
  signal n2715_o : std_logic;
  signal n2716_o : std_logic;
  signal n2717_o : std_logic;
  signal n2718_o : std_logic;
  signal n2719_o : std_logic;
  signal n2720_o : std_logic;
  signal n2721_o : std_logic;
  signal n2722_o : std_logic;
  signal n2723_o : std_logic;
  signal n2724_o : std_logic;
  signal n2725_o : std_logic;
  signal n2726_o : std_logic;
  signal n2727_o : std_logic;
  signal n2728_o : std_logic;
  signal n2729_o : std_logic;
  signal n2730_o : std_logic;
  signal n2731_o : std_logic;
  signal n2732_o : std_logic;
  signal n2733_o : std_logic;
  signal n2734_o : std_logic;
  signal n2735_o : std_logic;
  signal n2736_o : std_logic;
  signal n2737_o : std_logic_vector (3 downto 0);
  signal n2738_o : std_logic_vector (3 downto 0);
  signal n2739_o : std_logic_vector (3 downto 0);
  signal n2740_o : std_logic_vector (3 downto 0);
  signal n2741_o : std_logic_vector (3 downto 0);
  signal n2742_o : std_logic_vector (3 downto 0);
  signal n2743_o : std_logic_vector (3 downto 0);
  signal n2744_o : std_logic_vector (3 downto 0);
  signal n2745_o : std_logic_vector (3 downto 0);
  signal n2746_o : std_logic_vector (3 downto 0);
  signal n2747_o : std_logic_vector (2 downto 0);
  signal n2748_o : std_logic_vector (15 downto 0);
  signal n2749_o : std_logic_vector (15 downto 0);
  signal n2750_o : std_logic_vector (10 downto 0);
  signal n2751_o : std_logic_vector (42 downto 0);
  signal n2752_o : std_logic_vector (41 downto 0);
  signal n2753_o : std_logic_vector (42 downto 0);
  signal n2754_o : std_logic_vector (42 downto 0);
  signal n2772_o : std_logic_vector (43 downto 0);
  signal n2787_o : std_logic_vector (27 downto 0);
  constant n2791_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n2792_o : std_logic_vector (15 downto 0);
  signal n2793_o : std_logic_vector (43 downto 0);
  signal n2804_o : std_logic_vector (43 downto 0);
  signal n2815_o : std_logic_vector (42 downto 0);
  signal n2816_o : std_logic;
  signal n2820_o : std_logic;
  signal n2821_o : std_logic;
  signal n2828_o : std_logic;
  signal n2834_o : std_logic;
  signal n2835_o : std_logic;
  signal n2836_o : std_logic;
  signal n2837_o : std_logic;
  signal n2838_o : std_logic;
  signal n2839_o : std_logic;
  signal n2840_o : std_logic;
  signal n2841_o : std_logic;
  signal n2842_o : std_logic;
  signal n2843_o : std_logic;
  signal n2844_o : std_logic;
  signal n2845_o : std_logic;
  signal n2846_o : std_logic;
  signal n2847_o : std_logic;
  signal n2848_o : std_logic;
  signal n2849_o : std_logic;
  signal n2850_o : std_logic;
  signal n2851_o : std_logic;
  signal n2852_o : std_logic;
  signal n2853_o : std_logic;
  signal n2854_o : std_logic;
  signal n2855_o : std_logic;
  signal n2856_o : std_logic;
  signal n2857_o : std_logic;
  signal n2858_o : std_logic;
  signal n2859_o : std_logic;
  signal n2860_o : std_logic;
  signal n2861_o : std_logic;
  signal n2862_o : std_logic;
  signal n2863_o : std_logic;
  signal n2864_o : std_logic;
  signal n2865_o : std_logic;
  signal n2866_o : std_logic;
  signal n2867_o : std_logic;
  signal n2868_o : std_logic;
  signal n2869_o : std_logic;
  signal n2870_o : std_logic;
  signal n2871_o : std_logic;
  signal n2872_o : std_logic;
  signal n2873_o : std_logic;
  signal n2874_o : std_logic;
  signal n2875_o : std_logic;
  signal n2876_o : std_logic;
  signal n2877_o : std_logic_vector (3 downto 0);
  signal n2878_o : std_logic_vector (3 downto 0);
  signal n2879_o : std_logic_vector (3 downto 0);
  signal n2880_o : std_logic_vector (3 downto 0);
  signal n2881_o : std_logic_vector (3 downto 0);
  signal n2882_o : std_logic_vector (3 downto 0);
  signal n2883_o : std_logic_vector (3 downto 0);
  signal n2884_o : std_logic_vector (3 downto 0);
  signal n2885_o : std_logic_vector (3 downto 0);
  signal n2886_o : std_logic_vector (3 downto 0);
  signal n2887_o : std_logic_vector (2 downto 0);
  signal n2888_o : std_logic_vector (15 downto 0);
  signal n2889_o : std_logic_vector (15 downto 0);
  signal n2890_o : std_logic_vector (10 downto 0);
  signal n2891_o : std_logic_vector (42 downto 0);
  signal n2892_o : std_logic_vector (41 downto 0);
  signal n2893_o : std_logic_vector (42 downto 0);
  signal n2894_o : std_logic_vector (42 downto 0);
  signal n2910_o : std_logic_vector (40 downto 0);
  signal n2911_o : std_logic;
  signal n2915_o : std_logic;
  signal n2916_o : std_logic;
  signal n2923_o : std_logic;
  signal n2927_o : std_logic;
  signal n2929_o : std_logic;
  signal n2930_o : std_logic;
  signal n2932_o : std_logic;
  signal n2938_o : std_logic;
  signal n2941_o : std_logic;
  signal n2943_o : std_logic;
  signal n2944_o : std_logic;
  signal n2945_o : std_logic;
  signal n2946_o : std_logic;
  signal n2947_o : std_logic;
  signal n2948_o : std_logic;
  signal n2949_o : std_logic;
  signal n2950_o : std_logic;
  signal n2951_o : std_logic;
  signal n2952_o : std_logic;
  signal n2953_o : std_logic;
  signal n2954_o : std_logic;
  signal n2955_o : std_logic;
  signal n2956_o : std_logic;
  signal n2957_o : std_logic;
  signal n2958_o : std_logic;
  signal n2959_o : std_logic;
  signal n2960_o : std_logic;
  signal n2961_o : std_logic;
  signal n2962_o : std_logic;
  signal n2963_o : std_logic;
  signal n2964_o : std_logic;
  signal n2965_o : std_logic;
  signal n2966_o : std_logic;
  signal n2967_o : std_logic;
  signal n2968_o : std_logic_vector (3 downto 0);
  signal n2969_o : std_logic_vector (3 downto 0);
  signal n2970_o : std_logic_vector (3 downto 0);
  signal n2971_o : std_logic_vector (3 downto 0);
  signal n2972_o : std_logic_vector (3 downto 0);
  signal n2973_o : std_logic_vector (3 downto 0);
  signal n2974_o : std_logic_vector (15 downto 0);
  signal n2975_o : std_logic_vector (8 downto 0);
  signal n2976_o : std_logic_vector (24 downto 0);
  signal n2977_o : std_logic_vector (23 downto 0);
  signal n2978_o : std_logic_vector (24 downto 0);
  signal n2979_o : std_logic_vector (24 downto 0);
  signal n2980_o : std_logic_vector (24 downto 0);
  signal n2995_o : std_logic_vector (42 downto 0);
  signal n2998_o : std_logic_vector (42 downto 0);
  signal n3010_o : std_logic_vector (42 downto 0);
  signal n3013_o : std_logic_vector (42 downto 0);
  signal n3030_o : std_logic_vector (43 downto 0);
  signal n3045_o : std_logic_vector (43 downto 0);
  signal n3060_o : std_logic_vector (43 downto 0);
  signal n3071_o : std_logic_vector (42 downto 0);
  signal n3072_o : std_logic;
  signal n3076_o : std_logic;
  signal n3077_o : std_logic;
  signal n3084_o : std_logic;
  signal n3090_o : std_logic;
  signal n3091_o : std_logic;
  signal n3092_o : std_logic;
  signal n3093_o : std_logic;
  signal n3094_o : std_logic;
  signal n3095_o : std_logic;
  signal n3096_o : std_logic;
  signal n3097_o : std_logic;
  signal n3098_o : std_logic;
  signal n3099_o : std_logic;
  signal n3100_o : std_logic;
  signal n3101_o : std_logic;
  signal n3102_o : std_logic;
  signal n3103_o : std_logic;
  signal n3104_o : std_logic;
  signal n3105_o : std_logic;
  signal n3106_o : std_logic;
  signal n3107_o : std_logic;
  signal n3108_o : std_logic;
  signal n3109_o : std_logic;
  signal n3110_o : std_logic;
  signal n3111_o : std_logic;
  signal n3112_o : std_logic;
  signal n3113_o : std_logic;
  signal n3114_o : std_logic;
  signal n3115_o : std_logic;
  signal n3116_o : std_logic;
  signal n3117_o : std_logic;
  signal n3118_o : std_logic;
  signal n3119_o : std_logic;
  signal n3120_o : std_logic;
  signal n3121_o : std_logic;
  signal n3122_o : std_logic;
  signal n3123_o : std_logic;
  signal n3124_o : std_logic;
  signal n3125_o : std_logic;
  signal n3126_o : std_logic;
  signal n3127_o : std_logic;
  signal n3128_o : std_logic;
  signal n3129_o : std_logic;
  signal n3130_o : std_logic;
  signal n3131_o : std_logic;
  signal n3132_o : std_logic;
  signal n3133_o : std_logic_vector (3 downto 0);
  signal n3134_o : std_logic_vector (3 downto 0);
  signal n3135_o : std_logic_vector (3 downto 0);
  signal n3136_o : std_logic_vector (3 downto 0);
  signal n3137_o : std_logic_vector (3 downto 0);
  signal n3138_o : std_logic_vector (3 downto 0);
  signal n3139_o : std_logic_vector (3 downto 0);
  signal n3140_o : std_logic_vector (3 downto 0);
  signal n3141_o : std_logic_vector (3 downto 0);
  signal n3142_o : std_logic_vector (3 downto 0);
  signal n3143_o : std_logic_vector (2 downto 0);
  signal n3144_o : std_logic_vector (15 downto 0);
  signal n3145_o : std_logic_vector (15 downto 0);
  signal n3146_o : std_logic_vector (10 downto 0);
  signal n3147_o : std_logic_vector (42 downto 0);
  signal n3148_o : std_logic_vector (41 downto 0);
  signal n3149_o : std_logic_vector (42 downto 0);
  signal n3150_o : std_logic_vector (42 downto 0);
  signal n3166_o : std_logic_vector (40 downto 0);
  signal n3167_o : std_logic;
  signal n3171_o : std_logic;
  signal n3172_o : std_logic;
  signal n3179_o : std_logic;
  signal n3183_o : std_logic;
  signal n3185_o : std_logic;
  signal n3186_o : std_logic;
  signal n3188_o : std_logic;
  signal n3194_o : std_logic;
  signal n3197_o : std_logic;
  signal n3199_o : std_logic;
  signal n3200_o : std_logic;
  signal n3201_o : std_logic;
  signal n3202_o : std_logic;
  signal n3203_o : std_logic;
  signal n3204_o : std_logic;
  signal n3205_o : std_logic;
  signal n3206_o : std_logic;
  signal n3207_o : std_logic;
  signal n3208_o : std_logic;
  signal n3209_o : std_logic;
  signal n3210_o : std_logic;
  signal n3211_o : std_logic;
  signal n3212_o : std_logic;
  signal n3213_o : std_logic;
  signal n3214_o : std_logic;
  signal n3215_o : std_logic;
  signal n3216_o : std_logic;
  signal n3217_o : std_logic;
  signal n3218_o : std_logic;
  signal n3219_o : std_logic;
  signal n3220_o : std_logic;
  signal n3221_o : std_logic;
  signal n3222_o : std_logic;
  signal n3223_o : std_logic;
  signal n3224_o : std_logic_vector (3 downto 0);
  signal n3225_o : std_logic_vector (3 downto 0);
  signal n3226_o : std_logic_vector (3 downto 0);
  signal n3227_o : std_logic_vector (3 downto 0);
  signal n3228_o : std_logic_vector (3 downto 0);
  signal n3229_o : std_logic_vector (3 downto 0);
  signal n3230_o : std_logic_vector (15 downto 0);
  signal n3231_o : std_logic_vector (8 downto 0);
  signal n3232_o : std_logic_vector (24 downto 0);
  signal n3233_o : std_logic_vector (23 downto 0);
  signal n3234_o : std_logic_vector (24 downto 0);
  signal n3235_o : std_logic_vector (24 downto 0);
  signal n3236_o : std_logic_vector (24 downto 0);
  signal n3239_o : std_logic;
  signal n3240_o : std_logic_vector (1 downto 0);
  signal n3241_o : std_logic_vector (24 downto 0);
  signal n3242_o : std_logic_vector (24 downto 0);
  signal n3243_o : std_logic_vector (24 downto 0);
  signal n3244_o : std_logic_vector (24 downto 0);
  signal n3259_o : std_logic;
  signal n3260_o : std_logic_vector (24 downto 0);
  signal n3261_q : std_logic_vector (24 downto 0);
  signal n3262_o : std_logic;
  signal n3263_o : std_logic_vector (24 downto 0);
  signal n3264_q : std_logic_vector (24 downto 0);
  signal n3265_q : std_logic_vector (24 downto 0);
  signal n3266_q : std_logic_vector (24 downto 0);
  signal n3285_o : std_logic_vector (22 downto 0);
  signal n3286_o : std_logic;
  signal n3290_o : std_logic;
  signal n3291_o : std_logic;
  signal n3298_o : std_logic;
  signal n3302_o : std_logic;
  signal n3304_o : std_logic;
  signal n3305_o : std_logic;
  signal n3307_o : std_logic;
  signal n3313_o : std_logic;
  signal n3316_o : std_logic;
  signal n3318_o : std_logic;
  signal n3319_o : std_logic;
  signal n3320_o : std_logic;
  signal n3321_o : std_logic;
  signal n3322_o : std_logic;
  signal n3323_o : std_logic;
  signal n3324_o : std_logic;
  signal n3325_o : std_logic;
  signal n3326_o : std_logic;
  signal n3327_o : std_logic;
  signal n3328_o : std_logic;
  signal n3329_o : std_logic;
  signal n3330_o : std_logic;
  signal n3331_o : std_logic;
  signal n3332_o : std_logic;
  signal n3333_o : std_logic;
  signal n3334_o : std_logic;
  signal n3335_o : std_logic;
  signal n3336_o : std_logic_vector (3 downto 0);
  signal n3337_o : std_logic_vector (3 downto 0);
  signal n3338_o : std_logic_vector (3 downto 0);
  signal n3339_o : std_logic_vector (3 downto 0);
  signal n3340_o : std_logic_vector (1 downto 0);
  signal n3341_o : std_logic_vector (15 downto 0);
  signal n3342_o : std_logic_vector (17 downto 0);
  signal n3343_o : std_logic_vector (16 downto 0);
  signal n3344_o : std_logic_vector (17 downto 0);
  signal n3345_o : std_logic_vector (17 downto 0);
  signal n3346_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n2307_o;
  valid_o <= n2312_o;
  data_o <= n3346_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n2303_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n3261_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n3264_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n3265_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n3266_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n2286_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n2288_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n2290_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n2292_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n2294_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:170:18
  n2295_o <= n2294_o & n2290_o & n2288_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n2295_o select n2298_o <=
    n2292_o when "100",
    "10" when "010",
    n2286_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n2303_q <= "00";
    elsif rising_edge (clk_i) then
      n2303_q <= n2298_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n2306_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n2307_o <= '0' when n2306_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n2311_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n2312_o <= '0' when n2311_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n2332_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n2337_o <= n2336_o (4 downto 0);
  n2338_o <= n2332_o & n2337_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n2339_o <= x_reg when valid_i = '0' else n2338_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n2341_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n2355_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n2358_o <= std_logic_vector (resize (signed (n2355_o) * signed'("0000000000000000000000000000000000000000100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n2375_o <= std_logic_vector (resize (signed (n2358_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n2390_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n2395_o <= n2394_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n2396_o <= n2390_o & n2395_o;
  -- ../fixed_pkg.vhd:257:67
  n2407_o <= std_logic_vector (unsigned (n2375_o) + unsigned (n2396_o));
  -- ../fixed_pkg.vhd:168:39
  n2418_o <= n2407_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2419_o <= n2407_o (43);
  -- ../fixed_pkg.vhd:185:23
  n2423_o <= n2407_o (42);
  -- ../fixed_pkg.vhd:185:27
  n2424_o <= '1' when n2423_o /= n2419_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2431_o <= '0' when n2424_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n2437_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2438_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2439_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2440_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2441_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2442_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2443_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2444_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2445_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2446_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2447_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2448_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2449_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2450_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2451_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2452_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2453_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2454_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2455_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2456_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2457_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2458_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2459_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2460_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2461_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2462_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2463_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2464_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2465_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2466_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2467_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2468_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2469_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2470_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2471_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2472_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2473_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2474_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2475_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2476_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2477_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2478_o <= not n2419_o;
  -- ../fixed_pkg.vhd:196:31
  n2479_o <= not n2419_o;
  -- ../fixed_pkg.vhd:184:13
  n2480_o <= n2437_o & n2438_o & n2439_o & n2440_o;
  -- ../fixed_pkg.vhd:171:18
  n2481_o <= n2441_o & n2442_o & n2443_o & n2444_o;
  -- ../fixed_pkg.vhd:28:14
  n2482_o <= n2445_o & n2446_o & n2447_o & n2448_o;
  -- ../fixed_pkg.vhd:170:18
  n2483_o <= n2449_o & n2450_o & n2451_o & n2452_o;
  -- ../fixed_pkg.vhd:28:14
  n2484_o <= n2453_o & n2454_o & n2455_o & n2456_o;
  -- ../fixed_pkg.vhd:9:14
  n2485_o <= n2457_o & n2458_o & n2459_o & n2460_o;
  -- ../fixed_pkg.vhd:9:14
  n2486_o <= n2461_o & n2462_o & n2463_o & n2464_o;
  -- ../fixed_pkg.vhd:32:14
  n2487_o <= n2465_o & n2466_o & n2467_o & n2468_o;
  -- ../fixed_pkg.vhd:9:14
  n2488_o <= n2469_o & n2470_o & n2471_o & n2472_o;
  -- ../fixed_pkg.vhd:24:14
  n2489_o <= n2473_o & n2474_o & n2475_o & n2476_o;
  -- ../fixed_pkg.vhd:24:14
  n2490_o <= n2477_o & n2478_o & n2479_o;
  -- ../fixed_pkg.vhd:9:14
  n2491_o <= n2480_o & n2481_o & n2482_o & n2483_o;
  -- ../fixed_pkg.vhd:24:14
  n2492_o <= n2484_o & n2485_o & n2486_o & n2487_o;
  -- ../fixed_pkg.vhd:9:14
  n2493_o <= n2488_o & n2489_o & n2490_o;
  -- ../fixed_pkg.vhd:9:14
  n2494_o <= n2491_o & n2492_o & n2493_o;
  -- ../fixed_pkg.vhd:24:14
  n2495_o <= n2494_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n2496_o <= n2419_o & n2495_o;
  -- ../fixed_pkg.vhd:195:9
  n2497_o <= n2418_o when n2431_o = '0' else n2496_o;
  -- ../fixed_pkg.vhd:168:39
  n2513_o <= n2497_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2514_o <= n2497_o (42);
  -- ../fixed_pkg.vhd:185:23
  n2518_o <= n2497_o (41);
  -- ../fixed_pkg.vhd:185:27
  n2519_o <= '1' when n2518_o /= n2514_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2526_o <= '0' when n2519_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n2530_o <= '1' when n2519_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n2532_o <= n2497_o (40);
  -- ../fixed_pkg.vhd:185:27
  n2533_o <= '1' when n2532_o /= n2514_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2535_o <= n2526_o when n2544_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n2541_o <= n2533_o and n2530_o;
  -- ../fixed_pkg.vhd:185:17
  n2544_o <= n2530_o and n2541_o;
  -- ../fixed_pkg.vhd:196:31
  n2546_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2547_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2548_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2549_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2550_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2551_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2552_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2553_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2554_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2555_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2556_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2557_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2558_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2559_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2560_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2561_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2562_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2563_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2564_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2565_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2566_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2567_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2568_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2569_o <= not n2514_o;
  -- ../fixed_pkg.vhd:196:31
  n2570_o <= not n2514_o;
  n2571_o <= n2546_o & n2547_o & n2548_o & n2549_o;
  -- ../fixed_pkg.vhd:9:14
  n2572_o <= n2550_o & n2551_o & n2552_o & n2553_o;
  -- ../fixed_pkg.vhd:24:14
  n2573_o <= n2554_o & n2555_o & n2556_o & n2557_o;
  -- ../fixed_pkg.vhd:24:14
  n2574_o <= n2558_o & n2559_o & n2560_o & n2561_o;
  -- ../fixed_pkg.vhd:30:14
  n2575_o <= n2562_o & n2563_o & n2564_o & n2565_o;
  -- ../fixed_pkg.vhd:24:14
  n2576_o <= n2566_o & n2567_o & n2568_o & n2569_o;
  n2577_o <= n2571_o & n2572_o & n2573_o & n2574_o;
  -- ../fixed_pkg.vhd:171:18
  n2578_o <= n2575_o & n2576_o & n2570_o;
  -- ../fixed_pkg.vhd:28:14
  n2579_o <= n2577_o & n2578_o;
  -- ../fixed_pkg.vhd:170:18
  n2580_o <= n2579_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n2581_o <= n2513_o (40 downto 16);
  -- ../fixed_pkg.vhd:169:40
  n2582_o <= n2514_o & n2580_o;
  -- ../fixed_pkg.vhd:195:9
  n2583_o <= n2581_o when n2535_o = '0' else n2582_o;
  -- ../fixed_pkg.vhd:268:100
  n2599_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n2602_o <= std_logic_vector (resize (signed (n2599_o) * signed'("0000000000000000000000000000000000000001000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n2614_o <= std_logic_vector (resize (signed (n2583_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n2617_o <= std_logic_vector (resize (signed (n2614_o) * signed'("0000000000011111111111111100000010110111110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n2634_o <= std_logic_vector (resize (signed (n2602_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n2649_o <= std_logic_vector (resize (signed (n2617_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n2664_o <= std_logic_vector (unsigned (n2634_o) - unsigned (n2649_o));
  -- ../fixed_pkg.vhd:168:39
  n2675_o <= n2664_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2676_o <= n2664_o (43);
  -- ../fixed_pkg.vhd:185:23
  n2680_o <= n2664_o (42);
  -- ../fixed_pkg.vhd:185:27
  n2681_o <= '1' when n2680_o /= n2676_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2688_o <= '0' when n2681_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n2694_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2695_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2696_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2697_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2698_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2699_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2700_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2701_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2702_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2703_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2704_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2705_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2706_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2707_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2708_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2709_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2710_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2711_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2712_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2713_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2714_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2715_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2716_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2717_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2718_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2719_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2720_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2721_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2722_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2723_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2724_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2725_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2726_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2727_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2728_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2729_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2730_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2731_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2732_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2733_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2734_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2735_o <= not n2676_o;
  -- ../fixed_pkg.vhd:196:31
  n2736_o <= not n2676_o;
  -- ../fixed_pkg.vhd:9:14
  n2737_o <= n2694_o & n2695_o & n2696_o & n2697_o;
  -- ../fixed_pkg.vhd:24:14
  n2738_o <= n2698_o & n2699_o & n2700_o & n2701_o;
  -- ../fixed_pkg.vhd:24:14
  n2739_o <= n2702_o & n2703_o & n2704_o & n2705_o;
  -- Vocoder.vhd:65:28
  n2740_o <= n2706_o & n2707_o & n2708_o & n2709_o;
  -- ../fixed_pkg.vhd:24:14
  n2741_o <= n2710_o & n2711_o & n2712_o & n2713_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n2742_o <= n2714_o & n2715_o & n2716_o & n2717_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n2743_o <= n2718_o & n2719_o & n2720_o & n2721_o;
  -- Vocoder.vhd:44:28
  n2744_o <= n2722_o & n2723_o & n2724_o & n2725_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n2745_o <= n2726_o & n2727_o & n2728_o & n2729_o;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n2746_o <= n2730_o & n2731_o & n2732_o & n2733_o;
  -- ../BiquadFilter/BiquadFilter.vhd:53:18
  n2747_o <= n2734_o & n2735_o & n2736_o;
  -- Vocoder.vhd:76:28
  n2748_o <= n2737_o & n2738_o & n2739_o & n2740_o;
  -- Vocoder.vhd:46:28
  n2749_o <= n2741_o & n2742_o & n2743_o & n2744_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n2750_o <= n2745_o & n2746_o & n2747_o;
  n2751_o <= n2748_o & n2749_o & n2750_o;
  n2752_o <= n2751_o (41 downto 0);
  n2753_o <= n2676_o & n2752_o;
  -- ../fixed_pkg.vhd:195:9
  n2754_o <= n2675_o when n2688_o = '0' else n2753_o;
  -- ../fixed_pkg.vhd:168:39
  n2772_o <= std_logic_vector (resize (signed (n2754_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n2787_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  n2792_o <= n2791_o (15 downto 0);
  n2793_o <= n2787_o & n2792_o;
  -- ../fixed_pkg.vhd:257:67
  n2804_o <= std_logic_vector (unsigned (n2772_o) + unsigned (n2793_o));
  -- ../fixed_pkg.vhd:168:39
  n2815_o <= n2804_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2816_o <= n2804_o (43);
  -- ../fixed_pkg.vhd:185:23
  n2820_o <= n2804_o (42);
  -- ../fixed_pkg.vhd:185:27
  n2821_o <= '1' when n2820_o /= n2816_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2828_o <= '0' when n2821_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n2834_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2835_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2836_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2837_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2838_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2839_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2840_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2841_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2842_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2843_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2844_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2845_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2846_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2847_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2848_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2849_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2850_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2851_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2852_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2853_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2854_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2855_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2856_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2857_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2858_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2859_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2860_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2861_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2862_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2863_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2864_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2865_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2866_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2867_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2868_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2869_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2870_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2871_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2872_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2873_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2874_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2875_o <= not n2816_o;
  -- ../fixed_pkg.vhd:196:31
  n2876_o <= not n2816_o;
  n2877_o <= n2834_o & n2835_o & n2836_o & n2837_o;
  n2878_o <= n2838_o & n2839_o & n2840_o & n2841_o;
  n2879_o <= n2842_o & n2843_o & n2844_o & n2845_o;
  n2880_o <= n2846_o & n2847_o & n2848_o & n2849_o;
  n2881_o <= n2850_o & n2851_o & n2852_o & n2853_o;
  n2882_o <= n2854_o & n2855_o & n2856_o & n2857_o;
  n2883_o <= n2858_o & n2859_o & n2860_o & n2861_o;
  n2884_o <= n2862_o & n2863_o & n2864_o & n2865_o;
  n2885_o <= n2866_o & n2867_o & n2868_o & n2869_o;
  n2886_o <= n2870_o & n2871_o & n2872_o & n2873_o;
  n2887_o <= n2874_o & n2875_o & n2876_o;
  n2888_o <= n2877_o & n2878_o & n2879_o & n2880_o;
  n2889_o <= n2881_o & n2882_o & n2883_o & n2884_o;
  n2890_o <= n2885_o & n2886_o & n2887_o;
  n2891_o <= n2888_o & n2889_o & n2890_o;
  n2892_o <= n2891_o (41 downto 0);
  n2893_o <= n2816_o & n2892_o;
  -- ../fixed_pkg.vhd:195:9
  n2894_o <= n2815_o when n2828_o = '0' else n2893_o;
  -- ../fixed_pkg.vhd:168:39
  n2910_o <= n2894_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2911_o <= n2894_o (42);
  -- ../fixed_pkg.vhd:185:23
  n2915_o <= n2894_o (41);
  -- ../fixed_pkg.vhd:185:27
  n2916_o <= '1' when n2915_o /= n2911_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2923_o <= '0' when n2916_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n2927_o <= '1' when n2916_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n2929_o <= n2894_o (40);
  -- ../fixed_pkg.vhd:185:27
  n2930_o <= '1' when n2929_o /= n2911_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2932_o <= n2923_o when n2941_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n2938_o <= n2930_o and n2927_o;
  -- ../fixed_pkg.vhd:185:17
  n2941_o <= n2927_o and n2938_o;
  -- ../fixed_pkg.vhd:196:31
  n2943_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2944_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2945_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2946_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2947_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2948_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2949_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2950_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2951_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2952_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2953_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2954_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2955_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2956_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2957_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2958_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2959_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2960_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2961_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2962_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2963_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2964_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2965_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2966_o <= not n2911_o;
  -- ../fixed_pkg.vhd:196:31
  n2967_o <= not n2911_o;
  n2968_o <= n2943_o & n2944_o & n2945_o & n2946_o;
  n2969_o <= n2947_o & n2948_o & n2949_o & n2950_o;
  n2970_o <= n2951_o & n2952_o & n2953_o & n2954_o;
  n2971_o <= n2955_o & n2956_o & n2957_o & n2958_o;
  n2972_o <= n2959_o & n2960_o & n2961_o & n2962_o;
  n2973_o <= n2963_o & n2964_o & n2965_o & n2966_o;
  n2974_o <= n2968_o & n2969_o & n2970_o & n2971_o;
  n2975_o <= n2972_o & n2973_o & n2967_o;
  n2976_o <= n2974_o & n2975_o;
  n2977_o <= n2976_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n2978_o <= n2910_o (40 downto 16);
  n2979_o <= n2911_o & n2977_o;
  -- ../fixed_pkg.vhd:195:9
  n2980_o <= n2978_o when n2932_o = '0' else n2979_o;
  -- ../fixed_pkg.vhd:268:100
  n2995_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n2998_o <= std_logic_vector (resize (signed (n2995_o) * signed'("0000000000000000000000000000000000000000100"), 43));
  -- ../fixed_pkg.vhd:268:100
  n3010_o <= std_logic_vector (resize (signed (n2583_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n3013_o <= std_logic_vector (resize (signed (n3010_o) * signed'("0000000000000000000000000001111101001010010"), 43));
  -- ../fixed_pkg.vhd:168:39
  n3030_o <= std_logic_vector (resize (signed (n2998_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n3045_o <= std_logic_vector (resize (signed (n3013_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n3060_o <= std_logic_vector (unsigned (n3030_o) - unsigned (n3045_o));
  -- ../fixed_pkg.vhd:168:39
  n3071_o <= n3060_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3072_o <= n3060_o (43);
  -- ../fixed_pkg.vhd:185:23
  n3076_o <= n3060_o (42);
  -- ../fixed_pkg.vhd:185:27
  n3077_o <= '1' when n3076_o /= n3072_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n3084_o <= '0' when n3077_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n3090_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3091_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3092_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3093_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3094_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3095_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3096_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3097_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3098_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3099_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3100_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3101_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3102_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3103_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3104_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3105_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3106_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3107_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3108_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3109_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3110_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3111_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3112_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3113_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3114_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3115_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3116_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3117_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3118_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3119_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3120_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3121_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3122_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3123_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3124_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3125_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3126_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3127_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3128_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3129_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3130_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3131_o <= not n3072_o;
  -- ../fixed_pkg.vhd:196:31
  n3132_o <= not n3072_o;
  n3133_o <= n3090_o & n3091_o & n3092_o & n3093_o;
  n3134_o <= n3094_o & n3095_o & n3096_o & n3097_o;
  n3135_o <= n3098_o & n3099_o & n3100_o & n3101_o;
  n3136_o <= n3102_o & n3103_o & n3104_o & n3105_o;
  n3137_o <= n3106_o & n3107_o & n3108_o & n3109_o;
  n3138_o <= n3110_o & n3111_o & n3112_o & n3113_o;
  n3139_o <= n3114_o & n3115_o & n3116_o & n3117_o;
  n3140_o <= n3118_o & n3119_o & n3120_o & n3121_o;
  n3141_o <= n3122_o & n3123_o & n3124_o & n3125_o;
  n3142_o <= n3126_o & n3127_o & n3128_o & n3129_o;
  n3143_o <= n3130_o & n3131_o & n3132_o;
  n3144_o <= n3133_o & n3134_o & n3135_o & n3136_o;
  n3145_o <= n3137_o & n3138_o & n3139_o & n3140_o;
  n3146_o <= n3141_o & n3142_o & n3143_o;
  n3147_o <= n3144_o & n3145_o & n3146_o;
  n3148_o <= n3147_o (41 downto 0);
  n3149_o <= n3072_o & n3148_o;
  -- ../fixed_pkg.vhd:195:9
  n3150_o <= n3071_o when n3084_o = '0' else n3149_o;
  -- ../fixed_pkg.vhd:168:39
  n3166_o <= n3150_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3167_o <= n3150_o (42);
  -- ../fixed_pkg.vhd:185:23
  n3171_o <= n3150_o (41);
  -- ../fixed_pkg.vhd:185:27
  n3172_o <= '1' when n3171_o /= n3167_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n3179_o <= '0' when n3172_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n3183_o <= '1' when n3172_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n3185_o <= n3150_o (40);
  -- ../fixed_pkg.vhd:185:27
  n3186_o <= '1' when n3185_o /= n3167_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n3188_o <= n3179_o when n3197_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n3194_o <= n3186_o and n3183_o;
  -- ../fixed_pkg.vhd:185:17
  n3197_o <= n3183_o and n3194_o;
  -- ../fixed_pkg.vhd:196:31
  n3199_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3200_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3201_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3202_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3203_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3204_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3205_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3206_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3207_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3208_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3209_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3210_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3211_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3212_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3213_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3214_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3215_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3216_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3217_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3218_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3219_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3220_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3221_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3222_o <= not n3167_o;
  -- ../fixed_pkg.vhd:196:31
  n3223_o <= not n3167_o;
  n3224_o <= n3199_o & n3200_o & n3201_o & n3202_o;
  n3225_o <= n3203_o & n3204_o & n3205_o & n3206_o;
  n3226_o <= n3207_o & n3208_o & n3209_o & n3210_o;
  n3227_o <= n3211_o & n3212_o & n3213_o & n3214_o;
  n3228_o <= n3215_o & n3216_o & n3217_o & n3218_o;
  n3229_o <= n3219_o & n3220_o & n3221_o & n3222_o;
  n3230_o <= n3224_o & n3225_o & n3226_o & n3227_o;
  n3231_o <= n3228_o & n3229_o & n3223_o;
  n3232_o <= n3230_o & n3231_o;
  n3233_o <= n3232_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n3234_o <= n3166_o (40 downto 16);
  n3235_o <= n3167_o & n3233_o;
  -- ../fixed_pkg.vhd:195:9
  n3236_o <= n3234_o when n3188_o = '0' else n3235_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n3239_o <= '1' when state_reg = "01" else '0';
  n3240_o <= n3239_o & n2341_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n3240_o select n3241_o <=
    x_reg when "10",
    n2339_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n3240_o select n3242_o <=
    n2583_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n3240_o select n3243_o <=
    n2980_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n3240_o select n3244_o <=
    n3236_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n3259_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n3260_o <= x_reg when n3259_o = '0' else n3241_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n3261_q <= n3260_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n3262_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n3263_o <= y_reg when n3262_o = '0' else n3242_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n3264_q <= n3263_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3265_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n3265_q <= n3243_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3266_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n3266_q <= n3244_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n3285_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3286_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n3290_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n3291_o <= '1' when n3290_o /= n3286_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n3298_o <= '0' when n3291_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n3302_o <= '1' when n3291_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n3304_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n3305_o <= '1' when n3304_o /= n3286_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n3307_o <= n3298_o when n3316_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n3313_o <= n3305_o and n3302_o;
  -- ../fixed_pkg.vhd:185:17
  n3316_o <= n3302_o and n3313_o;
  -- ../fixed_pkg.vhd:196:31
  n3318_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3319_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3320_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3321_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3322_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3323_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3324_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3325_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3326_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3327_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3328_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3329_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3330_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3331_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3332_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3333_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3334_o <= not n3286_o;
  -- ../fixed_pkg.vhd:196:31
  n3335_o <= not n3286_o;
  n3336_o <= n3318_o & n3319_o & n3320_o & n3321_o;
  n3337_o <= n3322_o & n3323_o & n3324_o & n3325_o;
  n3338_o <= n3326_o & n3327_o & n3328_o & n3329_o;
  n3339_o <= n3330_o & n3331_o & n3332_o & n3333_o;
  n3340_o <= n3334_o & n3335_o;
  n3341_o <= n3336_o & n3337_o & n3338_o & n3339_o;
  n3342_o <= n3341_o & n3340_o;
  n3343_o <= n3342_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n3344_o <= n3285_o (22 downto 5);
  n3345_o <= n3286_o & n3343_o;
  -- ../fixed_pkg.vhd:195:9
  n3346_o <= n3344_o when n3307_o = '0' else n3345_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_b8edb8c1ddb8ce49b98343d308dc8c4d73c37c7f is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_b8edb8c1ddb8ce49b98343d308dc8c4d73c37c7f;

architecture rtl of biquadfilter_b8edb8c1ddb8ce49b98343d308dc8c4d73c37c7f is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n1218_o : std_logic_vector (1 downto 0);
  signal n1220_o : std_logic;
  signal n1222_o : std_logic;
  signal n1224_o : std_logic_vector (1 downto 0);
  signal n1226_o : std_logic;
  signal n1227_o : std_logic_vector (2 downto 0);
  signal n1230_o : std_logic_vector (1 downto 0);
  signal n1235_q : std_logic_vector (1 downto 0);
  signal n1238_o : std_logic;
  signal n1239_o : std_logic;
  signal n1243_o : std_logic;
  signal n1244_o : std_logic;
  signal n1264_o : std_logic_vector (19 downto 0);
  constant n1268_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n1269_o : std_logic_vector (4 downto 0);
  signal n1270_o : std_logic_vector (24 downto 0);
  signal n1271_o : std_logic_vector (24 downto 0);
  signal n1273_o : std_logic;
  signal n1287_o : std_logic_vector (42 downto 0);
  signal n1290_o : std_logic_vector (42 downto 0);
  signal n1307_o : std_logic_vector (43 downto 0);
  signal n1322_o : std_logic_vector (27 downto 0);
  constant n1326_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n1327_o : std_logic_vector (15 downto 0);
  signal n1328_o : std_logic_vector (43 downto 0);
  signal n1339_o : std_logic_vector (43 downto 0);
  signal n1350_o : std_logic_vector (42 downto 0);
  signal n1351_o : std_logic;
  signal n1355_o : std_logic;
  signal n1356_o : std_logic;
  signal n1363_o : std_logic;
  signal n1369_o : std_logic;
  signal n1370_o : std_logic;
  signal n1371_o : std_logic;
  signal n1372_o : std_logic;
  signal n1373_o : std_logic;
  signal n1374_o : std_logic;
  signal n1375_o : std_logic;
  signal n1376_o : std_logic;
  signal n1377_o : std_logic;
  signal n1378_o : std_logic;
  signal n1379_o : std_logic;
  signal n1380_o : std_logic;
  signal n1381_o : std_logic;
  signal n1382_o : std_logic;
  signal n1383_o : std_logic;
  signal n1384_o : std_logic;
  signal n1385_o : std_logic;
  signal n1386_o : std_logic;
  signal n1387_o : std_logic;
  signal n1388_o : std_logic;
  signal n1389_o : std_logic;
  signal n1390_o : std_logic;
  signal n1391_o : std_logic;
  signal n1392_o : std_logic;
  signal n1393_o : std_logic;
  signal n1394_o : std_logic;
  signal n1395_o : std_logic;
  signal n1396_o : std_logic;
  signal n1397_o : std_logic;
  signal n1398_o : std_logic;
  signal n1399_o : std_logic;
  signal n1400_o : std_logic;
  signal n1401_o : std_logic;
  signal n1402_o : std_logic;
  signal n1403_o : std_logic;
  signal n1404_o : std_logic;
  signal n1405_o : std_logic;
  signal n1406_o : std_logic;
  signal n1407_o : std_logic;
  signal n1408_o : std_logic;
  signal n1409_o : std_logic;
  signal n1410_o : std_logic;
  signal n1411_o : std_logic;
  signal n1412_o : std_logic_vector (3 downto 0);
  signal n1413_o : std_logic_vector (3 downto 0);
  signal n1414_o : std_logic_vector (3 downto 0);
  signal n1415_o : std_logic_vector (3 downto 0);
  signal n1416_o : std_logic_vector (3 downto 0);
  signal n1417_o : std_logic_vector (3 downto 0);
  signal n1418_o : std_logic_vector (3 downto 0);
  signal n1419_o : std_logic_vector (3 downto 0);
  signal n1420_o : std_logic_vector (3 downto 0);
  signal n1421_o : std_logic_vector (3 downto 0);
  signal n1422_o : std_logic_vector (2 downto 0);
  signal n1423_o : std_logic_vector (15 downto 0);
  signal n1424_o : std_logic_vector (15 downto 0);
  signal n1425_o : std_logic_vector (10 downto 0);
  signal n1426_o : std_logic_vector (42 downto 0);
  signal n1427_o : std_logic_vector (41 downto 0);
  signal n1428_o : std_logic_vector (42 downto 0);
  signal n1429_o : std_logic_vector (42 downto 0);
  signal n1445_o : std_logic_vector (40 downto 0);
  signal n1446_o : std_logic;
  signal n1450_o : std_logic;
  signal n1451_o : std_logic;
  signal n1458_o : std_logic;
  signal n1462_o : std_logic;
  signal n1464_o : std_logic;
  signal n1465_o : std_logic;
  signal n1467_o : std_logic;
  signal n1473_o : std_logic;
  signal n1476_o : std_logic;
  signal n1478_o : std_logic;
  signal n1479_o : std_logic;
  signal n1480_o : std_logic;
  signal n1481_o : std_logic;
  signal n1482_o : std_logic;
  signal n1483_o : std_logic;
  signal n1484_o : std_logic;
  signal n1485_o : std_logic;
  signal n1486_o : std_logic;
  signal n1487_o : std_logic;
  signal n1488_o : std_logic;
  signal n1489_o : std_logic;
  signal n1490_o : std_logic;
  signal n1491_o : std_logic;
  signal n1492_o : std_logic;
  signal n1493_o : std_logic;
  signal n1494_o : std_logic;
  signal n1495_o : std_logic;
  signal n1496_o : std_logic;
  signal n1497_o : std_logic;
  signal n1498_o : std_logic;
  signal n1499_o : std_logic;
  signal n1500_o : std_logic;
  signal n1501_o : std_logic;
  signal n1502_o : std_logic;
  signal n1503_o : std_logic_vector (3 downto 0);
  signal n1504_o : std_logic_vector (3 downto 0);
  signal n1505_o : std_logic_vector (3 downto 0);
  signal n1506_o : std_logic_vector (3 downto 0);
  signal n1507_o : std_logic_vector (3 downto 0);
  signal n1508_o : std_logic_vector (3 downto 0);
  signal n1509_o : std_logic_vector (15 downto 0);
  signal n1510_o : std_logic_vector (8 downto 0);
  signal n1511_o : std_logic_vector (24 downto 0);
  signal n1512_o : std_logic_vector (23 downto 0);
  signal n1513_o : std_logic_vector (24 downto 0);
  signal n1514_o : std_logic_vector (24 downto 0);
  signal n1515_o : std_logic_vector (24 downto 0);
  signal n1531_o : std_logic_vector (42 downto 0);
  signal n1534_o : std_logic_vector (42 downto 0);
  signal n1546_o : std_logic_vector (42 downto 0);
  signal n1549_o : std_logic_vector (42 downto 0);
  signal n1566_o : std_logic_vector (43 downto 0);
  signal n1581_o : std_logic_vector (43 downto 0);
  signal n1596_o : std_logic_vector (43 downto 0);
  signal n1607_o : std_logic_vector (42 downto 0);
  signal n1608_o : std_logic;
  signal n1612_o : std_logic;
  signal n1613_o : std_logic;
  signal n1620_o : std_logic;
  signal n1626_o : std_logic;
  signal n1627_o : std_logic;
  signal n1628_o : std_logic;
  signal n1629_o : std_logic;
  signal n1630_o : std_logic;
  signal n1631_o : std_logic;
  signal n1632_o : std_logic;
  signal n1633_o : std_logic;
  signal n1634_o : std_logic;
  signal n1635_o : std_logic;
  signal n1636_o : std_logic;
  signal n1637_o : std_logic;
  signal n1638_o : std_logic;
  signal n1639_o : std_logic;
  signal n1640_o : std_logic;
  signal n1641_o : std_logic;
  signal n1642_o : std_logic;
  signal n1643_o : std_logic;
  signal n1644_o : std_logic;
  signal n1645_o : std_logic;
  signal n1646_o : std_logic;
  signal n1647_o : std_logic;
  signal n1648_o : std_logic;
  signal n1649_o : std_logic;
  signal n1650_o : std_logic;
  signal n1651_o : std_logic;
  signal n1652_o : std_logic;
  signal n1653_o : std_logic;
  signal n1654_o : std_logic;
  signal n1655_o : std_logic;
  signal n1656_o : std_logic;
  signal n1657_o : std_logic;
  signal n1658_o : std_logic;
  signal n1659_o : std_logic;
  signal n1660_o : std_logic;
  signal n1661_o : std_logic;
  signal n1662_o : std_logic;
  signal n1663_o : std_logic;
  signal n1664_o : std_logic;
  signal n1665_o : std_logic;
  signal n1666_o : std_logic;
  signal n1667_o : std_logic;
  signal n1668_o : std_logic;
  signal n1669_o : std_logic_vector (3 downto 0);
  signal n1670_o : std_logic_vector (3 downto 0);
  signal n1671_o : std_logic_vector (3 downto 0);
  signal n1672_o : std_logic_vector (3 downto 0);
  signal n1673_o : std_logic_vector (3 downto 0);
  signal n1674_o : std_logic_vector (3 downto 0);
  signal n1675_o : std_logic_vector (3 downto 0);
  signal n1676_o : std_logic_vector (3 downto 0);
  signal n1677_o : std_logic_vector (3 downto 0);
  signal n1678_o : std_logic_vector (3 downto 0);
  signal n1679_o : std_logic_vector (2 downto 0);
  signal n1680_o : std_logic_vector (15 downto 0);
  signal n1681_o : std_logic_vector (15 downto 0);
  signal n1682_o : std_logic_vector (10 downto 0);
  signal n1683_o : std_logic_vector (42 downto 0);
  signal n1684_o : std_logic_vector (41 downto 0);
  signal n1685_o : std_logic_vector (42 downto 0);
  signal n1686_o : std_logic_vector (42 downto 0);
  signal n1704_o : std_logic_vector (43 downto 0);
  signal n1719_o : std_logic_vector (27 downto 0);
  constant n1723_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n1724_o : std_logic_vector (15 downto 0);
  signal n1725_o : std_logic_vector (43 downto 0);
  signal n1736_o : std_logic_vector (43 downto 0);
  signal n1747_o : std_logic_vector (42 downto 0);
  signal n1748_o : std_logic;
  signal n1752_o : std_logic;
  signal n1753_o : std_logic;
  signal n1760_o : std_logic;
  signal n1766_o : std_logic;
  signal n1767_o : std_logic;
  signal n1768_o : std_logic;
  signal n1769_o : std_logic;
  signal n1770_o : std_logic;
  signal n1771_o : std_logic;
  signal n1772_o : std_logic;
  signal n1773_o : std_logic;
  signal n1774_o : std_logic;
  signal n1775_o : std_logic;
  signal n1776_o : std_logic;
  signal n1777_o : std_logic;
  signal n1778_o : std_logic;
  signal n1779_o : std_logic;
  signal n1780_o : std_logic;
  signal n1781_o : std_logic;
  signal n1782_o : std_logic;
  signal n1783_o : std_logic;
  signal n1784_o : std_logic;
  signal n1785_o : std_logic;
  signal n1786_o : std_logic;
  signal n1787_o : std_logic;
  signal n1788_o : std_logic;
  signal n1789_o : std_logic;
  signal n1790_o : std_logic;
  signal n1791_o : std_logic;
  signal n1792_o : std_logic;
  signal n1793_o : std_logic;
  signal n1794_o : std_logic;
  signal n1795_o : std_logic;
  signal n1796_o : std_logic;
  signal n1797_o : std_logic;
  signal n1798_o : std_logic;
  signal n1799_o : std_logic;
  signal n1800_o : std_logic;
  signal n1801_o : std_logic;
  signal n1802_o : std_logic;
  signal n1803_o : std_logic;
  signal n1804_o : std_logic;
  signal n1805_o : std_logic;
  signal n1806_o : std_logic;
  signal n1807_o : std_logic;
  signal n1808_o : std_logic;
  signal n1809_o : std_logic_vector (3 downto 0);
  signal n1810_o : std_logic_vector (3 downto 0);
  signal n1811_o : std_logic_vector (3 downto 0);
  signal n1812_o : std_logic_vector (3 downto 0);
  signal n1813_o : std_logic_vector (3 downto 0);
  signal n1814_o : std_logic_vector (3 downto 0);
  signal n1815_o : std_logic_vector (3 downto 0);
  signal n1816_o : std_logic_vector (3 downto 0);
  signal n1817_o : std_logic_vector (3 downto 0);
  signal n1818_o : std_logic_vector (3 downto 0);
  signal n1819_o : std_logic_vector (2 downto 0);
  signal n1820_o : std_logic_vector (15 downto 0);
  signal n1821_o : std_logic_vector (15 downto 0);
  signal n1822_o : std_logic_vector (10 downto 0);
  signal n1823_o : std_logic_vector (42 downto 0);
  signal n1824_o : std_logic_vector (41 downto 0);
  signal n1825_o : std_logic_vector (42 downto 0);
  signal n1826_o : std_logic_vector (42 downto 0);
  signal n1842_o : std_logic_vector (40 downto 0);
  signal n1843_o : std_logic;
  signal n1847_o : std_logic;
  signal n1848_o : std_logic;
  signal n1855_o : std_logic;
  signal n1859_o : std_logic;
  signal n1861_o : std_logic;
  signal n1862_o : std_logic;
  signal n1864_o : std_logic;
  signal n1870_o : std_logic;
  signal n1873_o : std_logic;
  signal n1875_o : std_logic;
  signal n1876_o : std_logic;
  signal n1877_o : std_logic;
  signal n1878_o : std_logic;
  signal n1879_o : std_logic;
  signal n1880_o : std_logic;
  signal n1881_o : std_logic;
  signal n1882_o : std_logic;
  signal n1883_o : std_logic;
  signal n1884_o : std_logic;
  signal n1885_o : std_logic;
  signal n1886_o : std_logic;
  signal n1887_o : std_logic;
  signal n1888_o : std_logic;
  signal n1889_o : std_logic;
  signal n1890_o : std_logic;
  signal n1891_o : std_logic;
  signal n1892_o : std_logic;
  signal n1893_o : std_logic;
  signal n1894_o : std_logic;
  signal n1895_o : std_logic;
  signal n1896_o : std_logic;
  signal n1897_o : std_logic;
  signal n1898_o : std_logic;
  signal n1899_o : std_logic;
  signal n1900_o : std_logic_vector (3 downto 0);
  signal n1901_o : std_logic_vector (3 downto 0);
  signal n1902_o : std_logic_vector (3 downto 0);
  signal n1903_o : std_logic_vector (3 downto 0);
  signal n1904_o : std_logic_vector (3 downto 0);
  signal n1905_o : std_logic_vector (3 downto 0);
  signal n1906_o : std_logic_vector (15 downto 0);
  signal n1907_o : std_logic_vector (8 downto 0);
  signal n1908_o : std_logic_vector (24 downto 0);
  signal n1909_o : std_logic_vector (23 downto 0);
  signal n1910_o : std_logic_vector (24 downto 0);
  signal n1911_o : std_logic_vector (24 downto 0);
  signal n1912_o : std_logic_vector (24 downto 0);
  signal n1927_o : std_logic_vector (42 downto 0);
  signal n1930_o : std_logic_vector (42 downto 0);
  signal n1942_o : std_logic_vector (42 downto 0);
  signal n1945_o : std_logic_vector (42 downto 0);
  signal n1962_o : std_logic_vector (43 downto 0);
  signal n1977_o : std_logic_vector (43 downto 0);
  signal n1992_o : std_logic_vector (43 downto 0);
  signal n2003_o : std_logic_vector (42 downto 0);
  signal n2004_o : std_logic;
  signal n2008_o : std_logic;
  signal n2009_o : std_logic;
  signal n2016_o : std_logic;
  signal n2022_o : std_logic;
  signal n2023_o : std_logic;
  signal n2024_o : std_logic;
  signal n2025_o : std_logic;
  signal n2026_o : std_logic;
  signal n2027_o : std_logic;
  signal n2028_o : std_logic;
  signal n2029_o : std_logic;
  signal n2030_o : std_logic;
  signal n2031_o : std_logic;
  signal n2032_o : std_logic;
  signal n2033_o : std_logic;
  signal n2034_o : std_logic;
  signal n2035_o : std_logic;
  signal n2036_o : std_logic;
  signal n2037_o : std_logic;
  signal n2038_o : std_logic;
  signal n2039_o : std_logic;
  signal n2040_o : std_logic;
  signal n2041_o : std_logic;
  signal n2042_o : std_logic;
  signal n2043_o : std_logic;
  signal n2044_o : std_logic;
  signal n2045_o : std_logic;
  signal n2046_o : std_logic;
  signal n2047_o : std_logic;
  signal n2048_o : std_logic;
  signal n2049_o : std_logic;
  signal n2050_o : std_logic;
  signal n2051_o : std_logic;
  signal n2052_o : std_logic;
  signal n2053_o : std_logic;
  signal n2054_o : std_logic;
  signal n2055_o : std_logic;
  signal n2056_o : std_logic;
  signal n2057_o : std_logic;
  signal n2058_o : std_logic;
  signal n2059_o : std_logic;
  signal n2060_o : std_logic;
  signal n2061_o : std_logic;
  signal n2062_o : std_logic;
  signal n2063_o : std_logic;
  signal n2064_o : std_logic;
  signal n2065_o : std_logic_vector (3 downto 0);
  signal n2066_o : std_logic_vector (3 downto 0);
  signal n2067_o : std_logic_vector (3 downto 0);
  signal n2068_o : std_logic_vector (3 downto 0);
  signal n2069_o : std_logic_vector (3 downto 0);
  signal n2070_o : std_logic_vector (3 downto 0);
  signal n2071_o : std_logic_vector (3 downto 0);
  signal n2072_o : std_logic_vector (3 downto 0);
  signal n2073_o : std_logic_vector (3 downto 0);
  signal n2074_o : std_logic_vector (3 downto 0);
  signal n2075_o : std_logic_vector (2 downto 0);
  signal n2076_o : std_logic_vector (15 downto 0);
  signal n2077_o : std_logic_vector (15 downto 0);
  signal n2078_o : std_logic_vector (10 downto 0);
  signal n2079_o : std_logic_vector (42 downto 0);
  signal n2080_o : std_logic_vector (41 downto 0);
  signal n2081_o : std_logic_vector (42 downto 0);
  signal n2082_o : std_logic_vector (42 downto 0);
  signal n2098_o : std_logic_vector (40 downto 0);
  signal n2099_o : std_logic;
  signal n2103_o : std_logic;
  signal n2104_o : std_logic;
  signal n2111_o : std_logic;
  signal n2115_o : std_logic;
  signal n2117_o : std_logic;
  signal n2118_o : std_logic;
  signal n2120_o : std_logic;
  signal n2126_o : std_logic;
  signal n2129_o : std_logic;
  signal n2131_o : std_logic;
  signal n2132_o : std_logic;
  signal n2133_o : std_logic;
  signal n2134_o : std_logic;
  signal n2135_o : std_logic;
  signal n2136_o : std_logic;
  signal n2137_o : std_logic;
  signal n2138_o : std_logic;
  signal n2139_o : std_logic;
  signal n2140_o : std_logic;
  signal n2141_o : std_logic;
  signal n2142_o : std_logic;
  signal n2143_o : std_logic;
  signal n2144_o : std_logic;
  signal n2145_o : std_logic;
  signal n2146_o : std_logic;
  signal n2147_o : std_logic;
  signal n2148_o : std_logic;
  signal n2149_o : std_logic;
  signal n2150_o : std_logic;
  signal n2151_o : std_logic;
  signal n2152_o : std_logic;
  signal n2153_o : std_logic;
  signal n2154_o : std_logic;
  signal n2155_o : std_logic;
  signal n2156_o : std_logic_vector (3 downto 0);
  signal n2157_o : std_logic_vector (3 downto 0);
  signal n2158_o : std_logic_vector (3 downto 0);
  signal n2159_o : std_logic_vector (3 downto 0);
  signal n2160_o : std_logic_vector (3 downto 0);
  signal n2161_o : std_logic_vector (3 downto 0);
  signal n2162_o : std_logic_vector (15 downto 0);
  signal n2163_o : std_logic_vector (8 downto 0);
  signal n2164_o : std_logic_vector (24 downto 0);
  signal n2165_o : std_logic_vector (23 downto 0);
  signal n2166_o : std_logic_vector (24 downto 0);
  signal n2167_o : std_logic_vector (24 downto 0);
  signal n2168_o : std_logic_vector (24 downto 0);
  signal n2171_o : std_logic;
  signal n2172_o : std_logic_vector (1 downto 0);
  signal n2173_o : std_logic_vector (24 downto 0);
  signal n2174_o : std_logic_vector (24 downto 0);
  signal n2175_o : std_logic_vector (24 downto 0);
  signal n2176_o : std_logic_vector (24 downto 0);
  signal n2191_o : std_logic;
  signal n2192_o : std_logic_vector (24 downto 0);
  signal n2193_q : std_logic_vector (24 downto 0);
  signal n2194_o : std_logic;
  signal n2195_o : std_logic_vector (24 downto 0);
  signal n2196_q : std_logic_vector (24 downto 0);
  signal n2197_q : std_logic_vector (24 downto 0);
  signal n2198_q : std_logic_vector (24 downto 0);
  signal n2217_o : std_logic_vector (22 downto 0);
  signal n2218_o : std_logic;
  signal n2222_o : std_logic;
  signal n2223_o : std_logic;
  signal n2230_o : std_logic;
  signal n2234_o : std_logic;
  signal n2236_o : std_logic;
  signal n2237_o : std_logic;
  signal n2239_o : std_logic;
  signal n2245_o : std_logic;
  signal n2248_o : std_logic;
  signal n2250_o : std_logic;
  signal n2251_o : std_logic;
  signal n2252_o : std_logic;
  signal n2253_o : std_logic;
  signal n2254_o : std_logic;
  signal n2255_o : std_logic;
  signal n2256_o : std_logic;
  signal n2257_o : std_logic;
  signal n2258_o : std_logic;
  signal n2259_o : std_logic;
  signal n2260_o : std_logic;
  signal n2261_o : std_logic;
  signal n2262_o : std_logic;
  signal n2263_o : std_logic;
  signal n2264_o : std_logic;
  signal n2265_o : std_logic;
  signal n2266_o : std_logic;
  signal n2267_o : std_logic;
  signal n2268_o : std_logic_vector (3 downto 0);
  signal n2269_o : std_logic_vector (3 downto 0);
  signal n2270_o : std_logic_vector (3 downto 0);
  signal n2271_o : std_logic_vector (3 downto 0);
  signal n2272_o : std_logic_vector (1 downto 0);
  signal n2273_o : std_logic_vector (15 downto 0);
  signal n2274_o : std_logic_vector (17 downto 0);
  signal n2275_o : std_logic_vector (16 downto 0);
  signal n2276_o : std_logic_vector (17 downto 0);
  signal n2277_o : std_logic_vector (17 downto 0);
  signal n2278_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n1239_o;
  valid_o <= n1244_o;
  data_o <= n2278_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n1235_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n2193_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n2196_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n2197_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n2198_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n1218_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n1220_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n1222_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:42:21
  n1224_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n1226_o <= '1' when state_reg = "10" else '0';
  -- Vocoder.vhd:46:28
  n1227_o <= n1226_o & n1222_o & n1220_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n1227_o select n1230_o <=
    n1224_o when "100",
    "10" when "010",
    n1218_o when "001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n1235_q <= "00";
    elsif rising_edge (clk_i) then
      n1235_q <= n1230_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:49:35
  n1238_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:49:20
  n1239_o <= '0' when n1238_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:50:35
  n1243_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:50:20
  n1244_o <= '0' when n1243_o = '0' else '1';
  -- ../fixed_pkg.vhd:168:39
  n1264_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- Vocoder.vhd:65:28
  n1269_o <= n1268_o (4 downto 0);
  -- Vocoder.vhd:63:28
  n1270_o <= n1264_o & n1269_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:21
  n1271_o <= x_reg when valid_i = '0' else n1270_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:17
  n1273_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:268:100
  n1287_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n1290_o <= std_logic_vector (resize (signed (n1287_o) * signed'("0000000000000000000000000000000000011001101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n1307_o <= std_logic_vector (resize (signed (n1290_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n1322_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:24:14
  n1327_o <= n1326_o (15 downto 0);
  -- ../fixed_pkg.vhd:25:14
  n1328_o <= n1322_o & n1327_o;
  -- ../fixed_pkg.vhd:257:67
  n1339_o <= std_logic_vector (unsigned (n1307_o) + unsigned (n1328_o));
  -- ../fixed_pkg.vhd:168:39
  n1350_o <= n1339_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1351_o <= n1339_o (43);
  -- ../fixed_pkg.vhd:185:23
  n1355_o <= n1339_o (42);
  -- ../fixed_pkg.vhd:185:27
  n1356_o <= '1' when n1355_o /= n1351_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n1363_o <= '0' when n1356_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n1369_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1370_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1371_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1372_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1373_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1374_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1375_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1376_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1377_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1378_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1379_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1380_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1381_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1382_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1383_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1384_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1385_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1386_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1387_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1388_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1389_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1390_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1391_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1392_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1393_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1394_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1395_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1396_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1397_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1398_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1399_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1400_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1401_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1402_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1403_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1404_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1405_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1406_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1407_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1408_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1409_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1410_o <= not n1351_o;
  -- ../fixed_pkg.vhd:196:31
  n1411_o <= not n1351_o;
  -- ../fixed_pkg.vhd:24:14
  n1412_o <= n1369_o & n1370_o & n1371_o & n1372_o;
  -- ../fixed_pkg.vhd:24:14
  n1413_o <= n1373_o & n1374_o & n1375_o & n1376_o;
  n1414_o <= n1377_o & n1378_o & n1379_o & n1380_o;
  -- ../fixed_pkg.vhd:24:14
  n1415_o <= n1381_o & n1382_o & n1383_o & n1384_o;
  -- ../fixed_pkg.vhd:25:14
  n1416_o <= n1385_o & n1386_o & n1387_o & n1388_o;
  -- ../fixed_pkg.vhd:25:14
  n1417_o <= n1389_o & n1390_o & n1391_o & n1392_o;
  n1418_o <= n1393_o & n1394_o & n1395_o & n1396_o;
  -- ../fixed_pkg.vhd:25:14
  n1419_o <= n1397_o & n1398_o & n1399_o & n1400_o;
  -- ../fixed_pkg.vhd:9:14
  n1420_o <= n1401_o & n1402_o & n1403_o & n1404_o;
  -- ../fixed_pkg.vhd:9:14
  n1421_o <= n1405_o & n1406_o & n1407_o & n1408_o;
  n1422_o <= n1409_o & n1410_o & n1411_o;
  -- ../fixed_pkg.vhd:9:14
  n1423_o <= n1412_o & n1413_o & n1414_o & n1415_o;
  -- ../fixed_pkg.vhd:32:14
  n1424_o <= n1416_o & n1417_o & n1418_o & n1419_o;
  -- ../fixed_pkg.vhd:32:14
  n1425_o <= n1420_o & n1421_o & n1422_o;
  n1426_o <= n1423_o & n1424_o & n1425_o;
  -- ../fixed_pkg.vhd:32:14
  n1427_o <= n1426_o (41 downto 0);
  -- ../fixed_pkg.vhd:28:14
  n1428_o <= n1351_o & n1427_o;
  -- ../fixed_pkg.vhd:195:9
  n1429_o <= n1350_o when n1363_o = '0' else n1428_o;
  -- ../fixed_pkg.vhd:168:39
  n1445_o <= n1429_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1446_o <= n1429_o (42);
  -- ../fixed_pkg.vhd:185:23
  n1450_o <= n1429_o (41);
  -- ../fixed_pkg.vhd:185:27
  n1451_o <= '1' when n1450_o /= n1446_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n1458_o <= '0' when n1451_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n1462_o <= '1' when n1451_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n1464_o <= n1429_o (40);
  -- ../fixed_pkg.vhd:185:27
  n1465_o <= '1' when n1464_o /= n1446_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n1467_o <= n1458_o when n1476_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n1473_o <= n1465_o and n1462_o;
  -- ../fixed_pkg.vhd:185:17
  n1476_o <= n1462_o and n1473_o;
  -- ../fixed_pkg.vhd:196:31
  n1478_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1479_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1480_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1481_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1482_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1483_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1484_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1485_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1486_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1487_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1488_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1489_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1490_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1491_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1492_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1493_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1494_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1495_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1496_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1497_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1498_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1499_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1500_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1501_o <= not n1446_o;
  -- ../fixed_pkg.vhd:196:31
  n1502_o <= not n1446_o;
  -- ../fixed_pkg.vhd:25:14
  n1503_o <= n1478_o & n1479_o & n1480_o & n1481_o;
  n1504_o <= n1482_o & n1483_o & n1484_o & n1485_o;
  -- ../fixed_pkg.vhd:25:14
  n1505_o <= n1486_o & n1487_o & n1488_o & n1489_o;
  -- ../fixed_pkg.vhd:9:14
  n1506_o <= n1490_o & n1491_o & n1492_o & n1493_o;
  -- ../fixed_pkg.vhd:9:14
  n1507_o <= n1494_o & n1495_o & n1496_o & n1497_o;
  n1508_o <= n1498_o & n1499_o & n1500_o & n1501_o;
  -- ../fixed_pkg.vhd:9:14
  n1509_o <= n1503_o & n1504_o & n1505_o & n1506_o;
  -- ../fixed_pkg.vhd:32:14
  n1510_o <= n1507_o & n1508_o & n1502_o;
  -- ../fixed_pkg.vhd:32:14
  n1511_o <= n1509_o & n1510_o;
  n1512_o <= n1511_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n1513_o <= n1445_o (40 downto 16);
  -- ../fixed_pkg.vhd:28:14
  n1514_o <= n1446_o & n1512_o;
  -- ../fixed_pkg.vhd:195:9
  n1515_o <= n1513_o when n1467_o = '0' else n1514_o;
  -- ../fixed_pkg.vhd:268:100
  n1531_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n1534_o <= std_logic_vector (resize (signed (n1531_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:268:100
  n1546_o <= std_logic_vector (resize (signed (n1515_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n1549_o <= std_logic_vector (resize (signed (n1546_o) * signed'("0000000000011111111111111100000001010011100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n1566_o <= std_logic_vector (resize (signed (n1534_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n1581_o <= std_logic_vector (resize (signed (n1549_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n1596_o <= std_logic_vector (unsigned (n1566_o) - unsigned (n1581_o));
  -- ../fixed_pkg.vhd:168:39
  n1607_o <= n1596_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1608_o <= n1596_o (43);
  -- ../fixed_pkg.vhd:185:23
  n1612_o <= n1596_o (42);
  -- ../fixed_pkg.vhd:185:27
  n1613_o <= '1' when n1612_o /= n1608_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n1620_o <= '0' when n1613_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n1626_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1627_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1628_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1629_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1630_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1631_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1632_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1633_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1634_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1635_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1636_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1637_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1638_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1639_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1640_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1641_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1642_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1643_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1644_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1645_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1646_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1647_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1648_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1649_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1650_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1651_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1652_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1653_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1654_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1655_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1656_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1657_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1658_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1659_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1660_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1661_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1662_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1663_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1664_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1665_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1666_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1667_o <= not n1608_o;
  -- ../fixed_pkg.vhd:196:31
  n1668_o <= not n1608_o;
  n1669_o <= n1626_o & n1627_o & n1628_o & n1629_o;
  n1670_o <= n1630_o & n1631_o & n1632_o & n1633_o;
  -- ../fixed_pkg.vhd:185:17
  n1671_o <= n1634_o & n1635_o & n1636_o & n1637_o;
  n1672_o <= n1638_o & n1639_o & n1640_o & n1641_o;
  n1673_o <= n1642_o & n1643_o & n1644_o & n1645_o;
  -- ../fixed_pkg.vhd:184:13
  n1674_o <= n1646_o & n1647_o & n1648_o & n1649_o;
  -- ../fixed_pkg.vhd:171:18
  n1675_o <= n1650_o & n1651_o & n1652_o & n1653_o;
  n1676_o <= n1654_o & n1655_o & n1656_o & n1657_o;
  -- ../fixed_pkg.vhd:170:18
  n1677_o <= n1658_o & n1659_o & n1660_o & n1661_o;
  n1678_o <= n1662_o & n1663_o & n1664_o & n1665_o;
  -- ../fixed_pkg.vhd:9:14
  n1679_o <= n1666_o & n1667_o & n1668_o;
  -- ../fixed_pkg.vhd:9:14
  n1680_o <= n1669_o & n1670_o & n1671_o & n1672_o;
  n1681_o <= n1673_o & n1674_o & n1675_o & n1676_o;
  -- ../fixed_pkg.vhd:9:14
  n1682_o <= n1677_o & n1678_o & n1679_o;
  -- ../fixed_pkg.vhd:24:14
  n1683_o <= n1680_o & n1681_o & n1682_o;
  -- ../fixed_pkg.vhd:24:14
  n1684_o <= n1683_o (41 downto 0);
  n1685_o <= n1608_o & n1684_o;
  -- ../fixed_pkg.vhd:195:9
  n1686_o <= n1607_o when n1620_o = '0' else n1685_o;
  -- ../fixed_pkg.vhd:168:39
  n1704_o <= std_logic_vector (resize (signed (n1686_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n1719_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:9:14
  n1724_o <= n1723_o (15 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n1725_o <= n1719_o & n1724_o;
  -- ../fixed_pkg.vhd:257:67
  n1736_o <= std_logic_vector (unsigned (n1704_o) + unsigned (n1725_o));
  -- ../fixed_pkg.vhd:168:39
  n1747_o <= n1736_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1748_o <= n1736_o (43);
  -- ../fixed_pkg.vhd:185:23
  n1752_o <= n1736_o (42);
  -- ../fixed_pkg.vhd:185:27
  n1753_o <= '1' when n1752_o /= n1748_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n1760_o <= '0' when n1753_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n1766_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1767_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1768_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1769_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1770_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1771_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1772_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1773_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1774_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1775_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1776_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1777_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1778_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1779_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1780_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1781_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1782_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1783_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1784_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1785_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1786_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1787_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1788_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1789_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1790_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1791_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1792_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1793_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1794_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1795_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1796_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1797_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1798_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1799_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1800_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1801_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1802_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1803_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1804_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1805_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1806_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1807_o <= not n1748_o;
  -- ../fixed_pkg.vhd:196:31
  n1808_o <= not n1748_o;
  n1809_o <= n1766_o & n1767_o & n1768_o & n1769_o;
  -- ../fixed_pkg.vhd:170:18
  n1810_o <= n1770_o & n1771_o & n1772_o & n1773_o;
  n1811_o <= n1774_o & n1775_o & n1776_o & n1777_o;
  -- ../fixed_pkg.vhd:9:14
  n1812_o <= n1778_o & n1779_o & n1780_o & n1781_o;
  -- ../fixed_pkg.vhd:9:14
  n1813_o <= n1782_o & n1783_o & n1784_o & n1785_o;
  n1814_o <= n1786_o & n1787_o & n1788_o & n1789_o;
  -- ../fixed_pkg.vhd:9:14
  n1815_o <= n1790_o & n1791_o & n1792_o & n1793_o;
  -- ../fixed_pkg.vhd:24:14
  n1816_o <= n1794_o & n1795_o & n1796_o & n1797_o;
  -- ../fixed_pkg.vhd:24:14
  n1817_o <= n1798_o & n1799_o & n1800_o & n1801_o;
  n1818_o <= n1802_o & n1803_o & n1804_o & n1805_o;
  -- ../fixed_pkg.vhd:24:14
  n1819_o <= n1806_o & n1807_o & n1808_o;
  -- ../fixed_pkg.vhd:25:14
  n1820_o <= n1809_o & n1810_o & n1811_o & n1812_o;
  -- ../fixed_pkg.vhd:25:14
  n1821_o <= n1813_o & n1814_o & n1815_o & n1816_o;
  n1822_o <= n1817_o & n1818_o & n1819_o;
  -- ../fixed_pkg.vhd:25:14
  n1823_o <= n1820_o & n1821_o & n1822_o;
  -- ../fixed_pkg.vhd:9:14
  n1824_o <= n1823_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n1825_o <= n1748_o & n1824_o;
  -- ../fixed_pkg.vhd:195:9
  n1826_o <= n1747_o when n1760_o = '0' else n1825_o;
  -- ../fixed_pkg.vhd:168:39
  n1842_o <= n1826_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1843_o <= n1826_o (42);
  -- ../fixed_pkg.vhd:185:23
  n1847_o <= n1826_o (41);
  -- ../fixed_pkg.vhd:185:27
  n1848_o <= '1' when n1847_o /= n1843_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n1855_o <= '0' when n1848_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n1859_o <= '1' when n1848_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n1861_o <= n1826_o (40);
  -- ../fixed_pkg.vhd:185:27
  n1862_o <= '1' when n1861_o /= n1843_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n1864_o <= n1855_o when n1873_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n1870_o <= n1862_o and n1859_o;
  -- ../fixed_pkg.vhd:185:17
  n1873_o <= n1859_o and n1870_o;
  -- ../fixed_pkg.vhd:196:31
  n1875_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1876_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1877_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1878_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1879_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1880_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1881_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1882_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1883_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1884_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1885_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1886_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1887_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1888_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1889_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1890_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1891_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1892_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1893_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1894_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1895_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1896_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1897_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1898_o <= not n1843_o;
  -- ../fixed_pkg.vhd:196:31
  n1899_o <= not n1843_o;
  n1900_o <= n1875_o & n1876_o & n1877_o & n1878_o;
  n1901_o <= n1879_o & n1880_o & n1881_o & n1882_o;
  n1902_o <= n1883_o & n1884_o & n1885_o & n1886_o;
  n1903_o <= n1887_o & n1888_o & n1889_o & n1890_o;
  n1904_o <= n1891_o & n1892_o & n1893_o & n1894_o;
  n1905_o <= n1895_o & n1896_o & n1897_o & n1898_o;
  n1906_o <= n1900_o & n1901_o & n1902_o & n1903_o;
  n1907_o <= n1904_o & n1905_o & n1899_o;
  n1908_o <= n1906_o & n1907_o;
  n1909_o <= n1908_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n1910_o <= n1842_o (40 downto 16);
  n1911_o <= n1843_o & n1909_o;
  -- ../fixed_pkg.vhd:195:9
  n1912_o <= n1910_o when n1864_o = '0' else n1911_o;
  -- ../fixed_pkg.vhd:268:100
  n1927_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n1930_o <= std_logic_vector (resize (signed (n1927_o) * signed'("0000000000011111111111111111111111100110011"), 43));
  -- ../fixed_pkg.vhd:268:100
  n1942_o <= std_logic_vector (resize (signed (n1515_o), 43));  --  sext
  -- ../fixed_pkg.vhd:268:100
  n1945_o <= std_logic_vector (resize (signed (n1942_o) * signed'("0000000000000000000000000001111111001100110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n1962_o <= std_logic_vector (resize (signed (n1930_o), 44));  --  sext
  -- ../fixed_pkg.vhd:168:39
  n1977_o <= std_logic_vector (resize (signed (n1945_o), 44));  --  sext
  -- ../fixed_pkg.vhd:242:67
  n1992_o <= std_logic_vector (unsigned (n1962_o) - unsigned (n1977_o));
  -- ../fixed_pkg.vhd:168:39
  n2003_o <= n1992_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2004_o <= n1992_o (43);
  -- ../fixed_pkg.vhd:185:23
  n2008_o <= n1992_o (42);
  -- ../fixed_pkg.vhd:185:27
  n2009_o <= '1' when n2008_o /= n2004_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2016_o <= '0' when n2009_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n2022_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2023_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2024_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2025_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2026_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2027_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2028_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2029_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2030_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2031_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2032_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2033_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2034_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2035_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2036_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2037_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2038_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2039_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2040_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2041_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2042_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2043_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2044_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2045_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2046_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2047_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2048_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2049_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2050_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2051_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2052_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2053_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2054_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2055_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2056_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2057_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2058_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2059_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2060_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2061_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2062_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2063_o <= not n2004_o;
  -- ../fixed_pkg.vhd:196:31
  n2064_o <= not n2004_o;
  n2065_o <= n2022_o & n2023_o & n2024_o & n2025_o;
  n2066_o <= n2026_o & n2027_o & n2028_o & n2029_o;
  n2067_o <= n2030_o & n2031_o & n2032_o & n2033_o;
  n2068_o <= n2034_o & n2035_o & n2036_o & n2037_o;
  n2069_o <= n2038_o & n2039_o & n2040_o & n2041_o;
  n2070_o <= n2042_o & n2043_o & n2044_o & n2045_o;
  n2071_o <= n2046_o & n2047_o & n2048_o & n2049_o;
  n2072_o <= n2050_o & n2051_o & n2052_o & n2053_o;
  n2073_o <= n2054_o & n2055_o & n2056_o & n2057_o;
  n2074_o <= n2058_o & n2059_o & n2060_o & n2061_o;
  n2075_o <= n2062_o & n2063_o & n2064_o;
  n2076_o <= n2065_o & n2066_o & n2067_o & n2068_o;
  n2077_o <= n2069_o & n2070_o & n2071_o & n2072_o;
  n2078_o <= n2073_o & n2074_o & n2075_o;
  n2079_o <= n2076_o & n2077_o & n2078_o;
  n2080_o <= n2079_o (41 downto 0);
  n2081_o <= n2004_o & n2080_o;
  -- ../fixed_pkg.vhd:195:9
  n2082_o <= n2003_o when n2016_o = '0' else n2081_o;
  -- ../fixed_pkg.vhd:168:39
  n2098_o <= n2082_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2099_o <= n2082_o (42);
  -- ../fixed_pkg.vhd:185:23
  n2103_o <= n2082_o (41);
  -- ../fixed_pkg.vhd:185:27
  n2104_o <= '1' when n2103_o /= n2099_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2111_o <= '0' when n2104_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n2115_o <= '1' when n2104_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n2117_o <= n2082_o (40);
  -- ../fixed_pkg.vhd:185:27
  n2118_o <= '1' when n2117_o /= n2099_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2120_o <= n2111_o when n2129_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n2126_o <= n2118_o and n2115_o;
  -- ../fixed_pkg.vhd:185:17
  n2129_o <= n2115_o and n2126_o;
  -- ../fixed_pkg.vhd:196:31
  n2131_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2132_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2133_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2134_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2135_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2136_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2137_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2138_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2139_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2140_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2141_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2142_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2143_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2144_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2145_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2146_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2147_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2148_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2149_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2150_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2151_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2152_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2153_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2154_o <= not n2099_o;
  -- ../fixed_pkg.vhd:196:31
  n2155_o <= not n2099_o;
  n2156_o <= n2131_o & n2132_o & n2133_o & n2134_o;
  n2157_o <= n2135_o & n2136_o & n2137_o & n2138_o;
  n2158_o <= n2139_o & n2140_o & n2141_o & n2142_o;
  n2159_o <= n2143_o & n2144_o & n2145_o & n2146_o;
  n2160_o <= n2147_o & n2148_o & n2149_o & n2150_o;
  n2161_o <= n2151_o & n2152_o & n2153_o & n2154_o;
  n2162_o <= n2156_o & n2157_o & n2158_o & n2159_o;
  n2163_o <= n2160_o & n2161_o & n2155_o;
  n2164_o <= n2162_o & n2163_o;
  n2165_o <= n2164_o (23 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n2166_o <= n2098_o (40 downto 16);
  n2167_o <= n2099_o & n2165_o;
  -- ../fixed_pkg.vhd:195:9
  n2168_o <= n2166_o when n2120_o = '0' else n2167_o;
  -- ../BiquadFilter/BiquadFilter.vhd:64:17
  n2171_o <= '1' when state_reg = "01" else '0';
  n2172_o <= n2171_o & n1273_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n2172_o select n2173_o <=
    x_reg when "10",
    n1271_o when "01",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n2172_o select n2174_o <=
    n1515_o when "10",
    y_reg when "01",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n2172_o select n2175_o <=
    n1912_o when "10",
    w_reg when "01",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:59:13
  with n2172_o select n2176_o <=
    n2168_o when "10",
    v_reg when "01",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n2191_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n2192_o <= x_reg when n2191_o = '0' else n2173_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n2193_q <= n2192_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n2194_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:52:5
  n2195_o <= y_reg when n2194_o = '0' else n2174_o;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n2196_q <= n2195_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n2197_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n2197_q <= n2175_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:58:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n2198_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n2198_q <= n2176_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n2217_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2218_o <= y_reg (24);
  -- ../fixed_pkg.vhd:185:23
  n2222_o <= y_reg (23);
  -- ../fixed_pkg.vhd:185:27
  n2223_o <= '1' when n2222_o /= n2218_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2230_o <= '0' when n2223_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n2234_o <= '1' when n2223_o = '0' else '0';
  -- ../fixed_pkg.vhd:185:23
  n2236_o <= y_reg (22);
  -- ../fixed_pkg.vhd:185:27
  n2237_o <= '1' when n2236_o /= n2218_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n2239_o <= n2230_o when n2248_o = '0' else '1';
  -- ../fixed_pkg.vhd:185:17
  n2245_o <= n2237_o and n2234_o;
  -- ../fixed_pkg.vhd:185:17
  n2248_o <= n2234_o and n2245_o;
  -- ../fixed_pkg.vhd:196:31
  n2250_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2251_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2252_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2253_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2254_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2255_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2256_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2257_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2258_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2259_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2260_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2261_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2262_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2263_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2264_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2265_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2266_o <= not n2218_o;
  -- ../fixed_pkg.vhd:196:31
  n2267_o <= not n2218_o;
  n2268_o <= n2250_o & n2251_o & n2252_o & n2253_o;
  n2269_o <= n2254_o & n2255_o & n2256_o & n2257_o;
  n2270_o <= n2258_o & n2259_o & n2260_o & n2261_o;
  n2271_o <= n2262_o & n2263_o & n2264_o & n2265_o;
  n2272_o <= n2266_o & n2267_o;
  n2273_o <= n2268_o & n2269_o & n2270_o & n2271_o;
  n2274_o <= n2273_o & n2272_o;
  n2275_o <= n2274_o (16 downto 0);
  -- ../fixed_pkg.vhd:201:40
  n2276_o <= n2217_o (22 downto 5);
  n2277_o <= n2218_o & n2275_o;
  -- ../fixed_pkg.vhd:195:9
  n2278_o <= n2276_o when n2239_o = '0' else n2277_o;
end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of vocoder is
  signal wrap_clk_i: std_logic;
  signal wrap_reset_i: std_logic;
  signal wrap_valid_i: std_logic;
  subtype typwrap_data_i is std_logic_vector (17 downto 0);
  signal wrap_data_i: typwrap_data_i;
  signal wrap_ready_i: std_logic;
  signal wrap_ready_o: std_logic;
  signal wrap_valid_o: std_logic;
  subtype typwrap_data_o is std_logic_vector (17 downto 0);
  signal wrap_data_o: typwrap_data_o;
  signal bandpass_ready : std_logic_vector (11 downto 0);
  signal bandpass_valid : std_logic_vector (11 downto 0);
  signal lowpass_ready : std_logic_vector (11 downto 0);
  signal lowpass_valid : std_logic_vector (11 downto 0);
  signal bandpass_data : std_logic_vector (215 downto 0);
  signal abs_data : std_logic_vector (215 downto 0);
  signal lowpass_data : std_logic_vector (215 downto 0);
  signal osc_data : std_logic_vector (215 downto 0);
  signal all_lowpass_valid : std_logic;
  signal mixer_ready : std_logic;
  signal channels_gen_n0_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n0_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n0_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n5_o : std_logic;
  signal n8_o : std_logic_vector (17 downto 0);
  signal n18_o : std_logic;
  signal n29_o : std_logic_vector (18 downto 0);
  signal n30_o : std_logic_vector (18 downto 0);
  signal n46_o : std_logic_vector (17 downto 0);
  signal n47_o : std_logic;
  signal n51_o : std_logic;
  signal n52_o : std_logic;
  signal n59_o : std_logic;
  signal n65_o : std_logic;
  signal n66_o : std_logic;
  signal n67_o : std_logic;
  signal n68_o : std_logic;
  signal n69_o : std_logic;
  signal n70_o : std_logic;
  signal n71_o : std_logic;
  signal n72_o : std_logic;
  signal n73_o : std_logic;
  signal n74_o : std_logic;
  signal n75_o : std_logic;
  signal n76_o : std_logic;
  signal n77_o : std_logic;
  signal n78_o : std_logic;
  signal n79_o : std_logic;
  signal n80_o : std_logic;
  signal n81_o : std_logic;
  signal n82_o : std_logic;
  signal n83_o : std_logic_vector (3 downto 0);
  signal n84_o : std_logic_vector (3 downto 0);
  signal n85_o : std_logic_vector (3 downto 0);
  signal n86_o : std_logic_vector (3 downto 0);
  signal n87_o : std_logic_vector (1 downto 0);
  signal n88_o : std_logic_vector (15 downto 0);
  signal n89_o : std_logic_vector (17 downto 0);
  signal n90_o : std_logic_vector (16 downto 0);
  signal n91_o : std_logic_vector (17 downto 0);
  signal n92_o : std_logic_vector (17 downto 0);
  signal n94_o : std_logic_vector (17 downto 0);
  signal channels_gen_n0_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n0_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n0_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n95_o : std_logic;
  signal n97_o : std_logic_vector (17 downto 0);
  signal channels_gen_n0_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n100_o : std_logic_vector (4 downto 0) := "00001";
  signal channels_gen_n1_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n1_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n1_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n104_o : std_logic;
  signal n107_o : std_logic_vector (17 downto 0);
  signal n117_o : std_logic;
  signal n128_o : std_logic_vector (18 downto 0);
  signal n129_o : std_logic_vector (18 downto 0);
  signal n145_o : std_logic_vector (17 downto 0);
  signal n146_o : std_logic;
  signal n150_o : std_logic;
  signal n151_o : std_logic;
  signal n158_o : std_logic;
  signal n164_o : std_logic;
  signal n165_o : std_logic;
  signal n166_o : std_logic;
  signal n167_o : std_logic;
  signal n168_o : std_logic;
  signal n169_o : std_logic;
  signal n170_o : std_logic;
  signal n171_o : std_logic;
  signal n172_o : std_logic;
  signal n173_o : std_logic;
  signal n174_o : std_logic;
  signal n175_o : std_logic;
  signal n176_o : std_logic;
  signal n177_o : std_logic;
  signal n178_o : std_logic;
  signal n179_o : std_logic;
  signal n180_o : std_logic;
  signal n181_o : std_logic;
  signal n182_o : std_logic_vector (3 downto 0);
  signal n183_o : std_logic_vector (3 downto 0);
  signal n184_o : std_logic_vector (3 downto 0);
  signal n185_o : std_logic_vector (3 downto 0);
  signal n186_o : std_logic_vector (1 downto 0);
  signal n187_o : std_logic_vector (15 downto 0);
  signal n188_o : std_logic_vector (17 downto 0);
  signal n189_o : std_logic_vector (16 downto 0);
  signal n190_o : std_logic_vector (17 downto 0);
  signal n191_o : std_logic_vector (17 downto 0);
  signal n193_o : std_logic_vector (17 downto 0);
  signal channels_gen_n1_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n1_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n1_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n194_o : std_logic;
  signal n196_o : std_logic_vector (17 downto 0);
  signal channels_gen_n1_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n199_o : std_logic_vector (4 downto 0) := "00010";
  signal channels_gen_n2_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n2_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n2_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n203_o : std_logic;
  signal n206_o : std_logic_vector (17 downto 0);
  signal n216_o : std_logic;
  signal n227_o : std_logic_vector (18 downto 0);
  signal n228_o : std_logic_vector (18 downto 0);
  signal n244_o : std_logic_vector (17 downto 0);
  signal n245_o : std_logic;
  signal n249_o : std_logic;
  signal n250_o : std_logic;
  signal n257_o : std_logic;
  signal n263_o : std_logic;
  signal n264_o : std_logic;
  signal n265_o : std_logic;
  signal n266_o : std_logic;
  signal n267_o : std_logic;
  signal n268_o : std_logic;
  signal n269_o : std_logic;
  signal n270_o : std_logic;
  signal n271_o : std_logic;
  signal n272_o : std_logic;
  signal n273_o : std_logic;
  signal n274_o : std_logic;
  signal n275_o : std_logic;
  signal n276_o : std_logic;
  signal n277_o : std_logic;
  signal n278_o : std_logic;
  signal n279_o : std_logic;
  signal n280_o : std_logic;
  signal n281_o : std_logic_vector (3 downto 0);
  signal n282_o : std_logic_vector (3 downto 0);
  signal n283_o : std_logic_vector (3 downto 0);
  signal n284_o : std_logic_vector (3 downto 0);
  signal n285_o : std_logic_vector (1 downto 0);
  signal n286_o : std_logic_vector (15 downto 0);
  signal n287_o : std_logic_vector (17 downto 0);
  signal n288_o : std_logic_vector (16 downto 0);
  signal n289_o : std_logic_vector (17 downto 0);
  signal n290_o : std_logic_vector (17 downto 0);
  signal n292_o : std_logic_vector (17 downto 0);
  signal channels_gen_n2_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n2_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n2_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n293_o : std_logic;
  signal n295_o : std_logic_vector (17 downto 0);
  signal channels_gen_n2_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n298_o : std_logic_vector (4 downto 0) := "00011";
  signal channels_gen_n3_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n3_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n3_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n302_o : std_logic;
  signal n305_o : std_logic_vector (17 downto 0);
  signal n315_o : std_logic;
  signal n326_o : std_logic_vector (18 downto 0);
  signal n327_o : std_logic_vector (18 downto 0);
  signal n343_o : std_logic_vector (17 downto 0);
  signal n344_o : std_logic;
  signal n348_o : std_logic;
  signal n349_o : std_logic;
  signal n356_o : std_logic;
  signal n362_o : std_logic;
  signal n363_o : std_logic;
  signal n364_o : std_logic;
  signal n365_o : std_logic;
  signal n366_o : std_logic;
  signal n367_o : std_logic;
  signal n368_o : std_logic;
  signal n369_o : std_logic;
  signal n370_o : std_logic;
  signal n371_o : std_logic;
  signal n372_o : std_logic;
  signal n373_o : std_logic;
  signal n374_o : std_logic;
  signal n375_o : std_logic;
  signal n376_o : std_logic;
  signal n377_o : std_logic;
  signal n378_o : std_logic;
  signal n379_o : std_logic;
  signal n380_o : std_logic_vector (3 downto 0);
  signal n381_o : std_logic_vector (3 downto 0);
  signal n382_o : std_logic_vector (3 downto 0);
  signal n383_o : std_logic_vector (3 downto 0);
  signal n384_o : std_logic_vector (1 downto 0);
  signal n385_o : std_logic_vector (15 downto 0);
  signal n386_o : std_logic_vector (17 downto 0);
  signal n387_o : std_logic_vector (16 downto 0);
  signal n388_o : std_logic_vector (17 downto 0);
  signal n389_o : std_logic_vector (17 downto 0);
  signal n391_o : std_logic_vector (17 downto 0);
  signal channels_gen_n3_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n3_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n3_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n392_o : std_logic;
  signal n394_o : std_logic_vector (17 downto 0);
  signal channels_gen_n3_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n397_o : std_logic_vector (4 downto 0) := "00100";
  signal channels_gen_n4_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n4_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n4_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n401_o : std_logic;
  signal n404_o : std_logic_vector (17 downto 0);
  signal n414_o : std_logic;
  signal n425_o : std_logic_vector (18 downto 0);
  signal n426_o : std_logic_vector (18 downto 0);
  signal n442_o : std_logic_vector (17 downto 0);
  signal n443_o : std_logic;
  signal n447_o : std_logic;
  signal n448_o : std_logic;
  signal n455_o : std_logic;
  signal n461_o : std_logic;
  signal n462_o : std_logic;
  signal n463_o : std_logic;
  signal n464_o : std_logic;
  signal n465_o : std_logic;
  signal n466_o : std_logic;
  signal n467_o : std_logic;
  signal n468_o : std_logic;
  signal n469_o : std_logic;
  signal n470_o : std_logic;
  signal n471_o : std_logic;
  signal n472_o : std_logic;
  signal n473_o : std_logic;
  signal n474_o : std_logic;
  signal n475_o : std_logic;
  signal n476_o : std_logic;
  signal n477_o : std_logic;
  signal n478_o : std_logic;
  signal n479_o : std_logic_vector (3 downto 0);
  signal n480_o : std_logic_vector (3 downto 0);
  signal n481_o : std_logic_vector (3 downto 0);
  signal n482_o : std_logic_vector (3 downto 0);
  signal n483_o : std_logic_vector (1 downto 0);
  signal n484_o : std_logic_vector (15 downto 0);
  signal n485_o : std_logic_vector (17 downto 0);
  signal n486_o : std_logic_vector (16 downto 0);
  signal n487_o : std_logic_vector (17 downto 0);
  signal n488_o : std_logic_vector (17 downto 0);
  signal n490_o : std_logic_vector (17 downto 0);
  signal channels_gen_n4_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n4_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n4_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n491_o : std_logic;
  signal n493_o : std_logic_vector (17 downto 0);
  signal channels_gen_n4_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n496_o : std_logic_vector (4 downto 0) := "00101";
  signal channels_gen_n5_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n5_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n5_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n500_o : std_logic;
  signal n503_o : std_logic_vector (17 downto 0);
  signal n513_o : std_logic;
  signal n524_o : std_logic_vector (18 downto 0);
  signal n525_o : std_logic_vector (18 downto 0);
  signal n541_o : std_logic_vector (17 downto 0);
  signal n542_o : std_logic;
  signal n546_o : std_logic;
  signal n547_o : std_logic;
  signal n554_o : std_logic;
  signal n560_o : std_logic;
  signal n561_o : std_logic;
  signal n562_o : std_logic;
  signal n563_o : std_logic;
  signal n564_o : std_logic;
  signal n565_o : std_logic;
  signal n566_o : std_logic;
  signal n567_o : std_logic;
  signal n568_o : std_logic;
  signal n569_o : std_logic;
  signal n570_o : std_logic;
  signal n571_o : std_logic;
  signal n572_o : std_logic;
  signal n573_o : std_logic;
  signal n574_o : std_logic;
  signal n575_o : std_logic;
  signal n576_o : std_logic;
  signal n577_o : std_logic;
  signal n578_o : std_logic_vector (3 downto 0);
  signal n579_o : std_logic_vector (3 downto 0);
  signal n580_o : std_logic_vector (3 downto 0);
  signal n581_o : std_logic_vector (3 downto 0);
  signal n582_o : std_logic_vector (1 downto 0);
  signal n583_o : std_logic_vector (15 downto 0);
  signal n584_o : std_logic_vector (17 downto 0);
  signal n585_o : std_logic_vector (16 downto 0);
  signal n586_o : std_logic_vector (17 downto 0);
  signal n587_o : std_logic_vector (17 downto 0);
  signal n589_o : std_logic_vector (17 downto 0);
  signal channels_gen_n5_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n5_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n5_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n590_o : std_logic;
  signal n592_o : std_logic_vector (17 downto 0);
  signal channels_gen_n5_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n595_o : std_logic_vector (4 downto 0) := "00110";
  signal channels_gen_n6_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n6_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n6_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n599_o : std_logic;
  signal n602_o : std_logic_vector (17 downto 0);
  signal n612_o : std_logic;
  signal n623_o : std_logic_vector (18 downto 0);
  signal n624_o : std_logic_vector (18 downto 0);
  signal n640_o : std_logic_vector (17 downto 0);
  signal n641_o : std_logic;
  signal n645_o : std_logic;
  signal n646_o : std_logic;
  signal n653_o : std_logic;
  signal n659_o : std_logic;
  signal n660_o : std_logic;
  signal n661_o : std_logic;
  signal n662_o : std_logic;
  signal n663_o : std_logic;
  signal n664_o : std_logic;
  signal n665_o : std_logic;
  signal n666_o : std_logic;
  signal n667_o : std_logic;
  signal n668_o : std_logic;
  signal n669_o : std_logic;
  signal n670_o : std_logic;
  signal n671_o : std_logic;
  signal n672_o : std_logic;
  signal n673_o : std_logic;
  signal n674_o : std_logic;
  signal n675_o : std_logic;
  signal n676_o : std_logic;
  signal n677_o : std_logic_vector (3 downto 0);
  signal n678_o : std_logic_vector (3 downto 0);
  signal n679_o : std_logic_vector (3 downto 0);
  signal n680_o : std_logic_vector (3 downto 0);
  signal n681_o : std_logic_vector (1 downto 0);
  signal n682_o : std_logic_vector (15 downto 0);
  signal n683_o : std_logic_vector (17 downto 0);
  signal n684_o : std_logic_vector (16 downto 0);
  signal n685_o : std_logic_vector (17 downto 0);
  signal n686_o : std_logic_vector (17 downto 0);
  signal n688_o : std_logic_vector (17 downto 0);
  signal channels_gen_n6_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n6_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n6_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n689_o : std_logic;
  signal n691_o : std_logic_vector (17 downto 0);
  signal channels_gen_n6_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n694_o : std_logic_vector (4 downto 0) := "00111";
  signal channels_gen_n7_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n7_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n7_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n698_o : std_logic;
  signal n701_o : std_logic_vector (17 downto 0);
  signal n711_o : std_logic;
  signal n722_o : std_logic_vector (18 downto 0);
  signal n723_o : std_logic_vector (18 downto 0);
  signal n739_o : std_logic_vector (17 downto 0);
  signal n740_o : std_logic;
  signal n744_o : std_logic;
  signal n745_o : std_logic;
  signal n752_o : std_logic;
  signal n758_o : std_logic;
  signal n759_o : std_logic;
  signal n760_o : std_logic;
  signal n761_o : std_logic;
  signal n762_o : std_logic;
  signal n763_o : std_logic;
  signal n764_o : std_logic;
  signal n765_o : std_logic;
  signal n766_o : std_logic;
  signal n767_o : std_logic;
  signal n768_o : std_logic;
  signal n769_o : std_logic;
  signal n770_o : std_logic;
  signal n771_o : std_logic;
  signal n772_o : std_logic;
  signal n773_o : std_logic;
  signal n774_o : std_logic;
  signal n775_o : std_logic;
  signal n776_o : std_logic_vector (3 downto 0);
  signal n777_o : std_logic_vector (3 downto 0);
  signal n778_o : std_logic_vector (3 downto 0);
  signal n779_o : std_logic_vector (3 downto 0);
  signal n780_o : std_logic_vector (1 downto 0);
  signal n781_o : std_logic_vector (15 downto 0);
  signal n782_o : std_logic_vector (17 downto 0);
  signal n783_o : std_logic_vector (16 downto 0);
  signal n784_o : std_logic_vector (17 downto 0);
  signal n785_o : std_logic_vector (17 downto 0);
  signal n787_o : std_logic_vector (17 downto 0);
  signal channels_gen_n7_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n7_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n7_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n788_o : std_logic;
  signal n790_o : std_logic_vector (17 downto 0);
  signal channels_gen_n7_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n793_o : std_logic_vector (4 downto 0) := "01000";
  signal channels_gen_n8_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n8_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n8_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n797_o : std_logic;
  signal n800_o : std_logic_vector (17 downto 0);
  signal n810_o : std_logic;
  signal n821_o : std_logic_vector (18 downto 0);
  signal n822_o : std_logic_vector (18 downto 0);
  signal n838_o : std_logic_vector (17 downto 0);
  signal n839_o : std_logic;
  signal n843_o : std_logic;
  signal n844_o : std_logic;
  signal n851_o : std_logic;
  signal n857_o : std_logic;
  signal n858_o : std_logic;
  signal n859_o : std_logic;
  signal n860_o : std_logic;
  signal n861_o : std_logic;
  signal n862_o : std_logic;
  signal n863_o : std_logic;
  signal n864_o : std_logic;
  signal n865_o : std_logic;
  signal n866_o : std_logic;
  signal n867_o : std_logic;
  signal n868_o : std_logic;
  signal n869_o : std_logic;
  signal n870_o : std_logic;
  signal n871_o : std_logic;
  signal n872_o : std_logic;
  signal n873_o : std_logic;
  signal n874_o : std_logic;
  signal n875_o : std_logic_vector (3 downto 0);
  signal n876_o : std_logic_vector (3 downto 0);
  signal n877_o : std_logic_vector (3 downto 0);
  signal n878_o : std_logic_vector (3 downto 0);
  signal n879_o : std_logic_vector (1 downto 0);
  signal n880_o : std_logic_vector (15 downto 0);
  signal n881_o : std_logic_vector (17 downto 0);
  signal n882_o : std_logic_vector (16 downto 0);
  signal n883_o : std_logic_vector (17 downto 0);
  signal n884_o : std_logic_vector (17 downto 0);
  signal n886_o : std_logic_vector (17 downto 0);
  signal channels_gen_n8_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n8_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n8_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n887_o : std_logic;
  signal n889_o : std_logic_vector (17 downto 0);
  signal channels_gen_n8_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n892_o : std_logic_vector (4 downto 0) := "01001";
  signal channels_gen_n9_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n9_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n9_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n896_o : std_logic;
  signal n899_o : std_logic_vector (17 downto 0);
  signal n909_o : std_logic;
  signal n920_o : std_logic_vector (18 downto 0);
  signal n921_o : std_logic_vector (18 downto 0);
  signal n937_o : std_logic_vector (17 downto 0);
  signal n938_o : std_logic;
  signal n942_o : std_logic;
  signal n943_o : std_logic;
  signal n950_o : std_logic;
  signal n956_o : std_logic;
  signal n957_o : std_logic;
  signal n958_o : std_logic;
  signal n959_o : std_logic;
  signal n960_o : std_logic;
  signal n961_o : std_logic;
  signal n962_o : std_logic;
  signal n963_o : std_logic;
  signal n964_o : std_logic;
  signal n965_o : std_logic;
  signal n966_o : std_logic;
  signal n967_o : std_logic;
  signal n968_o : std_logic;
  signal n969_o : std_logic;
  signal n970_o : std_logic;
  signal n971_o : std_logic;
  signal n972_o : std_logic;
  signal n973_o : std_logic;
  signal n974_o : std_logic_vector (3 downto 0);
  signal n975_o : std_logic_vector (3 downto 0);
  signal n976_o : std_logic_vector (3 downto 0);
  signal n977_o : std_logic_vector (3 downto 0);
  signal n978_o : std_logic_vector (1 downto 0);
  signal n979_o : std_logic_vector (15 downto 0);
  signal n980_o : std_logic_vector (17 downto 0);
  signal n981_o : std_logic_vector (16 downto 0);
  signal n982_o : std_logic_vector (17 downto 0);
  signal n983_o : std_logic_vector (17 downto 0);
  signal n985_o : std_logic_vector (17 downto 0);
  signal channels_gen_n9_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n9_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n9_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n986_o : std_logic;
  signal n988_o : std_logic_vector (17 downto 0);
  signal channels_gen_n9_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n991_o : std_logic_vector (4 downto 0) := "01010";
  signal channels_gen_n10_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n10_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n10_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n995_o : std_logic;
  signal n998_o : std_logic_vector (17 downto 0);
  signal n1008_o : std_logic;
  signal n1019_o : std_logic_vector (18 downto 0);
  signal n1020_o : std_logic_vector (18 downto 0);
  signal n1036_o : std_logic_vector (17 downto 0);
  signal n1037_o : std_logic;
  signal n1041_o : std_logic;
  signal n1042_o : std_logic;
  signal n1049_o : std_logic;
  signal n1055_o : std_logic;
  signal n1056_o : std_logic;
  signal n1057_o : std_logic;
  signal n1058_o : std_logic;
  signal n1059_o : std_logic;
  signal n1060_o : std_logic;
  signal n1061_o : std_logic;
  signal n1062_o : std_logic;
  signal n1063_o : std_logic;
  signal n1064_o : std_logic;
  signal n1065_o : std_logic;
  signal n1066_o : std_logic;
  signal n1067_o : std_logic;
  signal n1068_o : std_logic;
  signal n1069_o : std_logic;
  signal n1070_o : std_logic;
  signal n1071_o : std_logic;
  signal n1072_o : std_logic;
  signal n1073_o : std_logic_vector (3 downto 0);
  signal n1074_o : std_logic_vector (3 downto 0);
  signal n1075_o : std_logic_vector (3 downto 0);
  signal n1076_o : std_logic_vector (3 downto 0);
  signal n1077_o : std_logic_vector (1 downto 0);
  signal n1078_o : std_logic_vector (15 downto 0);
  signal n1079_o : std_logic_vector (17 downto 0);
  signal n1080_o : std_logic_vector (16 downto 0);
  signal n1081_o : std_logic_vector (17 downto 0);
  signal n1082_o : std_logic_vector (17 downto 0);
  signal n1084_o : std_logic_vector (17 downto 0);
  signal channels_gen_n10_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n10_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n10_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n1085_o : std_logic;
  signal n1087_o : std_logic_vector (17 downto 0);
  signal channels_gen_n10_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n1090_o : std_logic_vector (4 downto 0) := "01011";
  signal channels_gen_n11_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n11_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n11_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n1094_o : std_logic;
  signal n1097_o : std_logic_vector (17 downto 0);
  signal n1107_o : std_logic;
  signal n1118_o : std_logic_vector (18 downto 0);
  signal n1119_o : std_logic_vector (18 downto 0);
  signal n1135_o : std_logic_vector (17 downto 0);
  signal n1136_o : std_logic;
  signal n1140_o : std_logic;
  signal n1141_o : std_logic;
  signal n1148_o : std_logic;
  signal n1154_o : std_logic;
  signal n1155_o : std_logic;
  signal n1156_o : std_logic;
  signal n1157_o : std_logic;
  signal n1158_o : std_logic;
  signal n1159_o : std_logic;
  signal n1160_o : std_logic;
  signal n1161_o : std_logic;
  signal n1162_o : std_logic;
  signal n1163_o : std_logic;
  signal n1164_o : std_logic;
  signal n1165_o : std_logic;
  signal n1166_o : std_logic;
  signal n1167_o : std_logic;
  signal n1168_o : std_logic;
  signal n1169_o : std_logic;
  signal n1170_o : std_logic;
  signal n1171_o : std_logic;
  signal n1172_o : std_logic_vector (3 downto 0);
  signal n1173_o : std_logic_vector (3 downto 0);
  signal n1174_o : std_logic_vector (3 downto 0);
  signal n1175_o : std_logic_vector (3 downto 0);
  signal n1176_o : std_logic_vector (1 downto 0);
  signal n1177_o : std_logic_vector (15 downto 0);
  signal n1178_o : std_logic_vector (17 downto 0);
  signal n1179_o : std_logic_vector (16 downto 0);
  signal n1180_o : std_logic_vector (17 downto 0);
  signal n1181_o : std_logic_vector (17 downto 0);
  signal n1183_o : std_logic_vector (17 downto 0);
  signal channels_gen_n11_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n11_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n11_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n1184_o : std_logic;
  signal n1186_o : std_logic_vector (17 downto 0);
  signal channels_gen_n11_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n1189_o : std_logic_vector (4 downto 0) := "01100";
  signal mixer_inst_ready_o : std_logic;
  signal mixer_inst_valid_o : std_logic;
  signal mixer_inst_data_o : std_logic_vector (17 downto 0);
  signal n1196_o : std_logic;
  signal n1197_o : std_logic;
  signal n1201_o : std_logic;
  signal n1202_o : std_logic;
  signal n1204_o : std_logic_vector (11 downto 0);
  signal n1205_o : std_logic_vector (11 downto 0);
  signal n1206_o : std_logic_vector (11 downto 0);
  signal n1207_o : std_logic_vector (11 downto 0);
  signal n1208_o : std_logic_vector (215 downto 0);
  signal n1209_o : std_logic_vector (215 downto 0);
  signal n1210_o : std_logic_vector (215 downto 0);
  signal n1211_o : std_logic_vector (215 downto 0);
begin
  wrap_clk_i <= clk_i;
  wrap_reset_i <= reset_i;
  wrap_valid_i <= valid_i;
  wrap_data_i <= typwrap_data_i(data_i);
  wrap_ready_i <= ready_i;
  ready_o <= wrap_ready_o;
  valid_o <= wrap_valid_o;
  data_o <= sfixed(wrap_data_o);
  wrap_ready_o <= n1202_o;
  wrap_valid_o <= mixer_inst_valid_o;
  wrap_data_o <= mixer_inst_data_o;
  -- Vocoder.vhd:23:12
  bandpass_ready <= n1204_o; -- (signal)
  -- Vocoder.vhd:23:28
  bandpass_valid <= n1205_o; -- (signal)
  -- Vocoder.vhd:24:12
  lowpass_ready <= n1206_o; -- (signal)
  -- Vocoder.vhd:24:27
  lowpass_valid <= n1207_o; -- (signal)
  -- Vocoder.vhd:25:12
  bandpass_data <= n1208_o; -- (signal)
  -- Vocoder.vhd:25:27
  abs_data <= n1209_o; -- (signal)
  -- Vocoder.vhd:25:37
  lowpass_data <= n1210_o; -- (signal)
  -- Vocoder.vhd:26:12
  osc_data <= n1211_o; -- (signal)
  -- Vocoder.vhd:27:12
  all_lowpass_valid <= n1197_o; -- (signal)
  -- Vocoder.vhd:27:31
  mixer_ready <= mixer_inst_ready_o; -- (signal)
  -- Vocoder.vhd:30:9
  channels_gen_n0_bandpass_inst : entity work.biquadfilter_b8edb8c1ddb8ce49b98343d308dc8c4d73c37c7f port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n5_o,
    ready_o => channels_gen_n0_bandpass_inst_ready_o,
    valid_o => channels_gen_n0_bandpass_inst_valid_o,
    data_o => channels_gen_n0_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n5_o <= lowpass_ready (11);
  -- Vocoder.vhd:49:41
  n8_o <= bandpass_data (215 downto 198);
  -- ../fixed_pkg.vhd:218:26
  n18_o <= n8_o (17);
  -- ../fixed_pkg.vhd:231:32
  n29_o <= std_logic_vector (resize (signed (n8_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n30_o <= std_logic_vector(-signed (n29_o));
  -- ../fixed_pkg.vhd:168:39
  n46_o <= n30_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n47_o <= n30_o (18);
  -- ../fixed_pkg.vhd:185:23
  n51_o <= n30_o (17);
  -- ../fixed_pkg.vhd:185:27
  n52_o <= '1' when n51_o /= n47_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n59_o <= '0' when n52_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n65_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n66_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n67_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n68_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n69_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n70_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n71_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n72_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n73_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n74_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n75_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n76_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n77_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n78_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n79_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n80_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n81_o <= not n47_o;
  -- ../fixed_pkg.vhd:196:31
  n82_o <= not n47_o;
  n83_o <= n65_o & n66_o & n67_o & n68_o;
  n84_o <= n69_o & n70_o & n71_o & n72_o;
  n85_o <= n73_o & n74_o & n75_o & n76_o;
  n86_o <= n77_o & n78_o & n79_o & n80_o;
  n87_o <= n81_o & n82_o;
  n88_o <= n83_o & n84_o & n85_o & n86_o;
  n89_o <= n88_o & n87_o;
  n90_o <= n89_o (16 downto 0);
  n91_o <= n47_o & n90_o;
  -- ../fixed_pkg.vhd:195:9
  n92_o <= n46_o when n59_o = '0' else n91_o;
  -- ../fixed_pkg.vhd:223:9
  n94_o <= n8_o when n18_o = '0' else n92_o;
  -- Vocoder.vhd:51:9
  channels_gen_n0_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n95_o,
    data_i => n97_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n0_lowpass_inst_ready_o,
    valid_o => channels_gen_n0_lowpass_inst_valid_o,
    data_o => channels_gen_n0_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n95_o <= bandpass_valid (11);
  -- Vocoder.vhd:64:36
  n97_o <= abs_data (215 downto 198);
  -- Vocoder.vhd:70:9
  channels_gen_n0_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n100_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n0_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n1_bandpass_inst : entity work.biquadfilter_a8d8a4d0d0a0f8df06960275d213b2bd370e1dd4 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n104_o,
    ready_o => channels_gen_n1_bandpass_inst_ready_o,
    valid_o => channels_gen_n1_bandpass_inst_valid_o,
    data_o => channels_gen_n1_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n104_o <= lowpass_ready (10);
  -- Vocoder.vhd:49:41
  n107_o <= bandpass_data (197 downto 180);
  -- ../fixed_pkg.vhd:218:26
  n117_o <= n107_o (17);
  -- ../fixed_pkg.vhd:231:32
  n128_o <= std_logic_vector (resize (signed (n107_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n129_o <= std_logic_vector(-signed (n128_o));
  -- ../fixed_pkg.vhd:168:39
  n145_o <= n129_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n146_o <= n129_o (18);
  -- ../fixed_pkg.vhd:185:23
  n150_o <= n129_o (17);
  -- ../fixed_pkg.vhd:185:27
  n151_o <= '1' when n150_o /= n146_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n158_o <= '0' when n151_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n164_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n165_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n166_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n167_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n168_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n169_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n170_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n171_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n172_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n173_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n174_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n175_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n176_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n177_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n178_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n179_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n180_o <= not n146_o;
  -- ../fixed_pkg.vhd:196:31
  n181_o <= not n146_o;
  n182_o <= n164_o & n165_o & n166_o & n167_o;
  n183_o <= n168_o & n169_o & n170_o & n171_o;
  n184_o <= n172_o & n173_o & n174_o & n175_o;
  n185_o <= n176_o & n177_o & n178_o & n179_o;
  n186_o <= n180_o & n181_o;
  n187_o <= n182_o & n183_o & n184_o & n185_o;
  n188_o <= n187_o & n186_o;
  n189_o <= n188_o (16 downto 0);
  n190_o <= n146_o & n189_o;
  -- ../fixed_pkg.vhd:195:9
  n191_o <= n145_o when n158_o = '0' else n190_o;
  -- ../fixed_pkg.vhd:223:9
  n193_o <= n107_o when n117_o = '0' else n191_o;
  -- Vocoder.vhd:51:9
  channels_gen_n1_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n194_o,
    data_i => n196_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n1_lowpass_inst_ready_o,
    valid_o => channels_gen_n1_lowpass_inst_valid_o,
    data_o => channels_gen_n1_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n194_o <= bandpass_valid (10);
  -- Vocoder.vhd:64:36
  n196_o <= abs_data (197 downto 180);
  -- Vocoder.vhd:70:9
  channels_gen_n1_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n199_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n1_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n2_bandpass_inst : entity work.biquadfilter_7219f090b8e97a5f56406d3102d0d9a2fe57c6ac port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n203_o,
    ready_o => channels_gen_n2_bandpass_inst_ready_o,
    valid_o => channels_gen_n2_bandpass_inst_valid_o,
    data_o => channels_gen_n2_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n203_o <= lowpass_ready (9);
  -- Vocoder.vhd:49:41
  n206_o <= bandpass_data (179 downto 162);
  -- ../fixed_pkg.vhd:218:26
  n216_o <= n206_o (17);
  -- ../fixed_pkg.vhd:231:32
  n227_o <= std_logic_vector (resize (signed (n206_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n228_o <= std_logic_vector(-signed (n227_o));
  -- ../fixed_pkg.vhd:168:39
  n244_o <= n228_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n245_o <= n228_o (18);
  -- ../fixed_pkg.vhd:185:23
  n249_o <= n228_o (17);
  -- ../fixed_pkg.vhd:185:27
  n250_o <= '1' when n249_o /= n245_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n257_o <= '0' when n250_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n263_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n264_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n265_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n266_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n267_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n268_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n269_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n270_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n271_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n272_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n273_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n274_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n275_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n276_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n277_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n278_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n279_o <= not n245_o;
  -- ../fixed_pkg.vhd:196:31
  n280_o <= not n245_o;
  n281_o <= n263_o & n264_o & n265_o & n266_o;
  n282_o <= n267_o & n268_o & n269_o & n270_o;
  n283_o <= n271_o & n272_o & n273_o & n274_o;
  n284_o <= n275_o & n276_o & n277_o & n278_o;
  n285_o <= n279_o & n280_o;
  n286_o <= n281_o & n282_o & n283_o & n284_o;
  n287_o <= n286_o & n285_o;
  n288_o <= n287_o (16 downto 0);
  n289_o <= n245_o & n288_o;
  -- ../fixed_pkg.vhd:195:9
  n290_o <= n244_o when n257_o = '0' else n289_o;
  -- ../fixed_pkg.vhd:223:9
  n292_o <= n206_o when n216_o = '0' else n290_o;
  -- Vocoder.vhd:51:9
  channels_gen_n2_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n293_o,
    data_i => n295_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n2_lowpass_inst_ready_o,
    valid_o => channels_gen_n2_lowpass_inst_valid_o,
    data_o => channels_gen_n2_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n293_o <= bandpass_valid (9);
  -- Vocoder.vhd:64:36
  n295_o <= abs_data (179 downto 162);
  -- Vocoder.vhd:70:9
  channels_gen_n2_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n298_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n2_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n3_bandpass_inst : entity work.biquadfilter_1c66bf3a8e40435213527cf7b156d31cf673b516 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n302_o,
    ready_o => channels_gen_n3_bandpass_inst_ready_o,
    valid_o => channels_gen_n3_bandpass_inst_valid_o,
    data_o => channels_gen_n3_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n302_o <= lowpass_ready (8);
  -- Vocoder.vhd:49:41
  n305_o <= bandpass_data (161 downto 144);
  -- ../fixed_pkg.vhd:218:26
  n315_o <= n305_o (17);
  -- ../fixed_pkg.vhd:231:32
  n326_o <= std_logic_vector (resize (signed (n305_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n327_o <= std_logic_vector(-signed (n326_o));
  -- ../fixed_pkg.vhd:168:39
  n343_o <= n327_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n344_o <= n327_o (18);
  -- ../fixed_pkg.vhd:185:23
  n348_o <= n327_o (17);
  -- ../fixed_pkg.vhd:185:27
  n349_o <= '1' when n348_o /= n344_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n356_o <= '0' when n349_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n362_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n363_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n364_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n365_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n366_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n367_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n368_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n369_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n370_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n371_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n372_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n373_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n374_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n375_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n376_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n377_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n378_o <= not n344_o;
  -- ../fixed_pkg.vhd:196:31
  n379_o <= not n344_o;
  n380_o <= n362_o & n363_o & n364_o & n365_o;
  n381_o <= n366_o & n367_o & n368_o & n369_o;
  n382_o <= n370_o & n371_o & n372_o & n373_o;
  n383_o <= n374_o & n375_o & n376_o & n377_o;
  n384_o <= n378_o & n379_o;
  n385_o <= n380_o & n381_o & n382_o & n383_o;
  n386_o <= n385_o & n384_o;
  n387_o <= n386_o (16 downto 0);
  n388_o <= n344_o & n387_o;
  -- ../fixed_pkg.vhd:195:9
  n389_o <= n343_o when n356_o = '0' else n388_o;
  -- ../fixed_pkg.vhd:223:9
  n391_o <= n305_o when n315_o = '0' else n389_o;
  -- Vocoder.vhd:51:9
  channels_gen_n3_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n392_o,
    data_i => n394_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n3_lowpass_inst_ready_o,
    valid_o => channels_gen_n3_lowpass_inst_valid_o,
    data_o => channels_gen_n3_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n392_o <= bandpass_valid (8);
  -- Vocoder.vhd:64:36
  n394_o <= abs_data (161 downto 144);
  -- Vocoder.vhd:70:9
  channels_gen_n3_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n397_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n3_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n4_bandpass_inst : entity work.biquadfilter_fe6dfdc304e908e186d08440fe9f1574ff586857 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n401_o,
    ready_o => channels_gen_n4_bandpass_inst_ready_o,
    valid_o => channels_gen_n4_bandpass_inst_valid_o,
    data_o => channels_gen_n4_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n401_o <= lowpass_ready (7);
  -- Vocoder.vhd:49:41
  n404_o <= bandpass_data (143 downto 126);
  -- ../fixed_pkg.vhd:218:26
  n414_o <= n404_o (17);
  -- ../fixed_pkg.vhd:231:32
  n425_o <= std_logic_vector (resize (signed (n404_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n426_o <= std_logic_vector(-signed (n425_o));
  -- ../fixed_pkg.vhd:168:39
  n442_o <= n426_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n443_o <= n426_o (18);
  -- ../fixed_pkg.vhd:185:23
  n447_o <= n426_o (17);
  -- ../fixed_pkg.vhd:185:27
  n448_o <= '1' when n447_o /= n443_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n455_o <= '0' when n448_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n461_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n462_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n463_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n464_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n465_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n466_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n467_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n468_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n469_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n470_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n471_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n472_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n473_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n474_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n475_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n476_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n477_o <= not n443_o;
  -- ../fixed_pkg.vhd:196:31
  n478_o <= not n443_o;
  n479_o <= n461_o & n462_o & n463_o & n464_o;
  n480_o <= n465_o & n466_o & n467_o & n468_o;
  n481_o <= n469_o & n470_o & n471_o & n472_o;
  n482_o <= n473_o & n474_o & n475_o & n476_o;
  n483_o <= n477_o & n478_o;
  n484_o <= n479_o & n480_o & n481_o & n482_o;
  n485_o <= n484_o & n483_o;
  n486_o <= n485_o (16 downto 0);
  n487_o <= n443_o & n486_o;
  -- ../fixed_pkg.vhd:195:9
  n488_o <= n442_o when n455_o = '0' else n487_o;
  -- ../fixed_pkg.vhd:223:9
  n490_o <= n404_o when n414_o = '0' else n488_o;
  -- Vocoder.vhd:51:9
  channels_gen_n4_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n491_o,
    data_i => n493_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n4_lowpass_inst_ready_o,
    valid_o => channels_gen_n4_lowpass_inst_valid_o,
    data_o => channels_gen_n4_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n491_o <= bandpass_valid (7);
  -- Vocoder.vhd:64:36
  n493_o <= abs_data (143 downto 126);
  -- Vocoder.vhd:70:9
  channels_gen_n4_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n496_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n4_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n5_bandpass_inst : entity work.biquadfilter_7b2580a4b712e4b7d247f86df16ab6a0b5823514 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n500_o,
    ready_o => channels_gen_n5_bandpass_inst_ready_o,
    valid_o => channels_gen_n5_bandpass_inst_valid_o,
    data_o => channels_gen_n5_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n500_o <= lowpass_ready (6);
  -- Vocoder.vhd:49:41
  n503_o <= bandpass_data (125 downto 108);
  -- ../fixed_pkg.vhd:218:26
  n513_o <= n503_o (17);
  -- ../fixed_pkg.vhd:231:32
  n524_o <= std_logic_vector (resize (signed (n503_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n525_o <= std_logic_vector(-signed (n524_o));
  -- ../fixed_pkg.vhd:168:39
  n541_o <= n525_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n542_o <= n525_o (18);
  -- ../fixed_pkg.vhd:185:23
  n546_o <= n525_o (17);
  -- ../fixed_pkg.vhd:185:27
  n547_o <= '1' when n546_o /= n542_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n554_o <= '0' when n547_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n560_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n561_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n562_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n563_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n564_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n565_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n566_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n567_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n568_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n569_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n570_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n571_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n572_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n573_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n574_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n575_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n576_o <= not n542_o;
  -- ../fixed_pkg.vhd:196:31
  n577_o <= not n542_o;
  n578_o <= n560_o & n561_o & n562_o & n563_o;
  n579_o <= n564_o & n565_o & n566_o & n567_o;
  n580_o <= n568_o & n569_o & n570_o & n571_o;
  n581_o <= n572_o & n573_o & n574_o & n575_o;
  n582_o <= n576_o & n577_o;
  n583_o <= n578_o & n579_o & n580_o & n581_o;
  n584_o <= n583_o & n582_o;
  n585_o <= n584_o (16 downto 0);
  n586_o <= n542_o & n585_o;
  -- ../fixed_pkg.vhd:195:9
  n587_o <= n541_o when n554_o = '0' else n586_o;
  -- ../fixed_pkg.vhd:223:9
  n589_o <= n503_o when n513_o = '0' else n587_o;
  -- Vocoder.vhd:51:9
  channels_gen_n5_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n590_o,
    data_i => n592_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n5_lowpass_inst_ready_o,
    valid_o => channels_gen_n5_lowpass_inst_valid_o,
    data_o => channels_gen_n5_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n590_o <= bandpass_valid (6);
  -- Vocoder.vhd:64:36
  n592_o <= abs_data (125 downto 108);
  -- Vocoder.vhd:70:9
  channels_gen_n5_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n595_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n5_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n6_bandpass_inst : entity work.biquadfilter_a12ffe86a0a36f7b398f45b49289aca300d75514 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n599_o,
    ready_o => channels_gen_n6_bandpass_inst_ready_o,
    valid_o => channels_gen_n6_bandpass_inst_valid_o,
    data_o => channels_gen_n6_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n599_o <= lowpass_ready (5);
  -- Vocoder.vhd:49:41
  n602_o <= bandpass_data (107 downto 90);
  -- ../fixed_pkg.vhd:218:26
  n612_o <= n602_o (17);
  -- ../fixed_pkg.vhd:231:32
  n623_o <= std_logic_vector (resize (signed (n602_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n624_o <= std_logic_vector(-signed (n623_o));
  -- ../fixed_pkg.vhd:168:39
  n640_o <= n624_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n641_o <= n624_o (18);
  -- ../fixed_pkg.vhd:185:23
  n645_o <= n624_o (17);
  -- ../fixed_pkg.vhd:185:27
  n646_o <= '1' when n645_o /= n641_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n653_o <= '0' when n646_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n659_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n660_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n661_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n662_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n663_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n664_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n665_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n666_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n667_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n668_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n669_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n670_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n671_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n672_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n673_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n674_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n675_o <= not n641_o;
  -- ../fixed_pkg.vhd:196:31
  n676_o <= not n641_o;
  n677_o <= n659_o & n660_o & n661_o & n662_o;
  n678_o <= n663_o & n664_o & n665_o & n666_o;
  n679_o <= n667_o & n668_o & n669_o & n670_o;
  n680_o <= n671_o & n672_o & n673_o & n674_o;
  n681_o <= n675_o & n676_o;
  n682_o <= n677_o & n678_o & n679_o & n680_o;
  n683_o <= n682_o & n681_o;
  n684_o <= n683_o (16 downto 0);
  n685_o <= n641_o & n684_o;
  -- ../fixed_pkg.vhd:195:9
  n686_o <= n640_o when n653_o = '0' else n685_o;
  -- ../fixed_pkg.vhd:223:9
  n688_o <= n602_o when n612_o = '0' else n686_o;
  -- Vocoder.vhd:51:9
  channels_gen_n6_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n689_o,
    data_i => n691_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n6_lowpass_inst_ready_o,
    valid_o => channels_gen_n6_lowpass_inst_valid_o,
    data_o => channels_gen_n6_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n689_o <= bandpass_valid (5);
  -- Vocoder.vhd:64:36
  n691_o <= abs_data (107 downto 90);
  -- Vocoder.vhd:70:9
  channels_gen_n6_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n694_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n6_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n7_bandpass_inst : entity work.biquadfilter_ec985945a1ffc882d4b5d12ff1518d1a793a38b9 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n698_o,
    ready_o => channels_gen_n7_bandpass_inst_ready_o,
    valid_o => channels_gen_n7_bandpass_inst_valid_o,
    data_o => channels_gen_n7_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n698_o <= lowpass_ready (4);
  -- Vocoder.vhd:49:41
  n701_o <= bandpass_data (89 downto 72);
  -- ../fixed_pkg.vhd:218:26
  n711_o <= n701_o (17);
  -- ../fixed_pkg.vhd:231:32
  n722_o <= std_logic_vector (resize (signed (n701_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n723_o <= std_logic_vector(-signed (n722_o));
  -- ../fixed_pkg.vhd:168:39
  n739_o <= n723_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n740_o <= n723_o (18);
  -- ../fixed_pkg.vhd:185:23
  n744_o <= n723_o (17);
  -- ../fixed_pkg.vhd:185:27
  n745_o <= '1' when n744_o /= n740_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n752_o <= '0' when n745_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n758_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n759_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n760_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n761_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n762_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n763_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n764_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n765_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n766_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n767_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n768_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n769_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n770_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n771_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n772_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n773_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n774_o <= not n740_o;
  -- ../fixed_pkg.vhd:196:31
  n775_o <= not n740_o;
  n776_o <= n758_o & n759_o & n760_o & n761_o;
  n777_o <= n762_o & n763_o & n764_o & n765_o;
  n778_o <= n766_o & n767_o & n768_o & n769_o;
  n779_o <= n770_o & n771_o & n772_o & n773_o;
  n780_o <= n774_o & n775_o;
  n781_o <= n776_o & n777_o & n778_o & n779_o;
  n782_o <= n781_o & n780_o;
  n783_o <= n782_o (16 downto 0);
  n784_o <= n740_o & n783_o;
  -- ../fixed_pkg.vhd:195:9
  n785_o <= n739_o when n752_o = '0' else n784_o;
  -- ../fixed_pkg.vhd:223:9
  n787_o <= n701_o when n711_o = '0' else n785_o;
  -- Vocoder.vhd:51:9
  channels_gen_n7_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n788_o,
    data_i => n790_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n7_lowpass_inst_ready_o,
    valid_o => channels_gen_n7_lowpass_inst_valid_o,
    data_o => channels_gen_n7_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n788_o <= bandpass_valid (4);
  -- Vocoder.vhd:64:36
  n790_o <= abs_data (89 downto 72);
  -- Vocoder.vhd:70:9
  channels_gen_n7_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n793_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n7_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n8_bandpass_inst : entity work.biquadfilter_6b9c8d91c4218fd4ae537b4bb7758bc18f168a30 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n797_o,
    ready_o => channels_gen_n8_bandpass_inst_ready_o,
    valid_o => channels_gen_n8_bandpass_inst_valid_o,
    data_o => channels_gen_n8_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n797_o <= lowpass_ready (3);
  -- Vocoder.vhd:49:41
  n800_o <= bandpass_data (71 downto 54);
  -- ../fixed_pkg.vhd:218:26
  n810_o <= n800_o (17);
  -- ../fixed_pkg.vhd:231:32
  n821_o <= std_logic_vector (resize (signed (n800_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n822_o <= std_logic_vector(-signed (n821_o));
  -- ../fixed_pkg.vhd:168:39
  n838_o <= n822_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n839_o <= n822_o (18);
  -- ../fixed_pkg.vhd:185:23
  n843_o <= n822_o (17);
  -- ../fixed_pkg.vhd:185:27
  n844_o <= '1' when n843_o /= n839_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n851_o <= '0' when n844_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n857_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n858_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n859_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n860_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n861_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n862_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n863_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n864_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n865_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n866_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n867_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n868_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n869_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n870_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n871_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n872_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n873_o <= not n839_o;
  -- ../fixed_pkg.vhd:196:31
  n874_o <= not n839_o;
  n875_o <= n857_o & n858_o & n859_o & n860_o;
  n876_o <= n861_o & n862_o & n863_o & n864_o;
  n877_o <= n865_o & n866_o & n867_o & n868_o;
  n878_o <= n869_o & n870_o & n871_o & n872_o;
  n879_o <= n873_o & n874_o;
  n880_o <= n875_o & n876_o & n877_o & n878_o;
  n881_o <= n880_o & n879_o;
  n882_o <= n881_o (16 downto 0);
  n883_o <= n839_o & n882_o;
  -- ../fixed_pkg.vhd:195:9
  n884_o <= n838_o when n851_o = '0' else n883_o;
  -- ../fixed_pkg.vhd:223:9
  n886_o <= n800_o when n810_o = '0' else n884_o;
  -- Vocoder.vhd:51:9
  channels_gen_n8_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n887_o,
    data_i => n889_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n8_lowpass_inst_ready_o,
    valid_o => channels_gen_n8_lowpass_inst_valid_o,
    data_o => channels_gen_n8_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n887_o <= bandpass_valid (3);
  -- Vocoder.vhd:64:36
  n889_o <= abs_data (71 downto 54);
  -- Vocoder.vhd:70:9
  channels_gen_n8_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n892_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n8_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n9_bandpass_inst : entity work.biquadfilter_7ee7919464c974e1ea4a8e43f5092f05f8be8f05 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n896_o,
    ready_o => channels_gen_n9_bandpass_inst_ready_o,
    valid_o => channels_gen_n9_bandpass_inst_valid_o,
    data_o => channels_gen_n9_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n896_o <= lowpass_ready (2);
  -- Vocoder.vhd:49:41
  n899_o <= bandpass_data (53 downto 36);
  -- ../fixed_pkg.vhd:218:26
  n909_o <= n899_o (17);
  -- ../fixed_pkg.vhd:231:32
  n920_o <= std_logic_vector (resize (signed (n899_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n921_o <= std_logic_vector(-signed (n920_o));
  -- ../fixed_pkg.vhd:168:39
  n937_o <= n921_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n938_o <= n921_o (18);
  -- ../fixed_pkg.vhd:185:23
  n942_o <= n921_o (17);
  -- ../fixed_pkg.vhd:185:27
  n943_o <= '1' when n942_o /= n938_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n950_o <= '0' when n943_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n956_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n957_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n958_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n959_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n960_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n961_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n962_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n963_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n964_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n965_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n966_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n967_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n968_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n969_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n970_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n971_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n972_o <= not n938_o;
  -- ../fixed_pkg.vhd:196:31
  n973_o <= not n938_o;
  n974_o <= n956_o & n957_o & n958_o & n959_o;
  n975_o <= n960_o & n961_o & n962_o & n963_o;
  n976_o <= n964_o & n965_o & n966_o & n967_o;
  n977_o <= n968_o & n969_o & n970_o & n971_o;
  n978_o <= n972_o & n973_o;
  n979_o <= n974_o & n975_o & n976_o & n977_o;
  n980_o <= n979_o & n978_o;
  n981_o <= n980_o (16 downto 0);
  n982_o <= n938_o & n981_o;
  -- ../fixed_pkg.vhd:195:9
  n983_o <= n937_o when n950_o = '0' else n982_o;
  -- ../fixed_pkg.vhd:223:9
  n985_o <= n899_o when n909_o = '0' else n983_o;
  -- Vocoder.vhd:51:9
  channels_gen_n9_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n986_o,
    data_i => n988_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n9_lowpass_inst_ready_o,
    valid_o => channels_gen_n9_lowpass_inst_valid_o,
    data_o => channels_gen_n9_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n986_o <= bandpass_valid (2);
  -- Vocoder.vhd:64:36
  n988_o <= abs_data (53 downto 36);
  -- Vocoder.vhd:70:9
  channels_gen_n9_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n991_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n9_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n10_bandpass_inst : entity work.biquadfilter_58287565aee2fcf069d75b2ada116df2a3195e1e port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n995_o,
    ready_o => channels_gen_n10_bandpass_inst_ready_o,
    valid_o => channels_gen_n10_bandpass_inst_valid_o,
    data_o => channels_gen_n10_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n995_o <= lowpass_ready (1);
  -- Vocoder.vhd:49:41
  n998_o <= bandpass_data (35 downto 18);
  -- ../fixed_pkg.vhd:218:26
  n1008_o <= n998_o (17);
  -- ../fixed_pkg.vhd:231:32
  n1019_o <= std_logic_vector (resize (signed (n998_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n1020_o <= std_logic_vector(-signed (n1019_o));
  -- ../fixed_pkg.vhd:168:39
  n1036_o <= n1020_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1037_o <= n1020_o (18);
  -- ../fixed_pkg.vhd:185:23
  n1041_o <= n1020_o (17);
  -- ../fixed_pkg.vhd:185:27
  n1042_o <= '1' when n1041_o /= n1037_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n1049_o <= '0' when n1042_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n1055_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1056_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1057_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1058_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1059_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1060_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1061_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1062_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1063_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1064_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1065_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1066_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1067_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1068_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1069_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1070_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1071_o <= not n1037_o;
  -- ../fixed_pkg.vhd:196:31
  n1072_o <= not n1037_o;
  n1073_o <= n1055_o & n1056_o & n1057_o & n1058_o;
  n1074_o <= n1059_o & n1060_o & n1061_o & n1062_o;
  n1075_o <= n1063_o & n1064_o & n1065_o & n1066_o;
  n1076_o <= n1067_o & n1068_o & n1069_o & n1070_o;
  n1077_o <= n1071_o & n1072_o;
  n1078_o <= n1073_o & n1074_o & n1075_o & n1076_o;
  n1079_o <= n1078_o & n1077_o;
  n1080_o <= n1079_o (16 downto 0);
  n1081_o <= n1037_o & n1080_o;
  -- ../fixed_pkg.vhd:195:9
  n1082_o <= n1036_o when n1049_o = '0' else n1081_o;
  -- ../fixed_pkg.vhd:223:9
  n1084_o <= n998_o when n1008_o = '0' else n1082_o;
  -- Vocoder.vhd:51:9
  channels_gen_n10_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n1085_o,
    data_i => n1087_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n10_lowpass_inst_ready_o,
    valid_o => channels_gen_n10_lowpass_inst_valid_o,
    data_o => channels_gen_n10_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n1085_o <= bandpass_valid (1);
  -- Vocoder.vhd:64:36
  n1087_o <= abs_data (35 downto 18);
  -- Vocoder.vhd:70:9
  channels_gen_n10_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n1090_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n10_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n11_bandpass_inst : entity work.biquadfilter_123a8c06fd239d8db9e24de2ddc3cf87b860aaca port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n1094_o,
    ready_o => channels_gen_n11_bandpass_inst_ready_o,
    valid_o => channels_gen_n11_bandpass_inst_valid_o,
    data_o => channels_gen_n11_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n1094_o <= lowpass_ready (0);
  -- Vocoder.vhd:49:41
  n1097_o <= bandpass_data (17 downto 0);
  -- ../fixed_pkg.vhd:218:26
  n1107_o <= n1097_o (17);
  -- ../fixed_pkg.vhd:231:32
  n1118_o <= std_logic_vector (resize (signed (n1097_o), 19));  --  sext
  -- ../fixed_pkg.vhd:232:68
  n1119_o <= std_logic_vector(-signed (n1118_o));
  -- ../fixed_pkg.vhd:168:39
  n1135_o <= n1119_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1136_o <= n1119_o (18);
  -- ../fixed_pkg.vhd:185:23
  n1140_o <= n1119_o (17);
  -- ../fixed_pkg.vhd:185:27
  n1141_o <= '1' when n1140_o /= n1136_o else '0';
  -- ../fixed_pkg.vhd:185:17
  n1148_o <= '0' when n1141_o = '0' else '1';
  -- ../fixed_pkg.vhd:196:31
  n1154_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1155_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1156_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1157_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1158_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1159_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1160_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1161_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1162_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1163_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1164_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1165_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1166_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1167_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1168_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1169_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1170_o <= not n1136_o;
  -- ../fixed_pkg.vhd:196:31
  n1171_o <= not n1136_o;
  n1172_o <= n1154_o & n1155_o & n1156_o & n1157_o;
  n1173_o <= n1158_o & n1159_o & n1160_o & n1161_o;
  n1174_o <= n1162_o & n1163_o & n1164_o & n1165_o;
  n1175_o <= n1166_o & n1167_o & n1168_o & n1169_o;
  n1176_o <= n1170_o & n1171_o;
  n1177_o <= n1172_o & n1173_o & n1174_o & n1175_o;
  n1178_o <= n1177_o & n1176_o;
  n1179_o <= n1178_o (16 downto 0);
  n1180_o <= n1136_o & n1179_o;
  -- ../fixed_pkg.vhd:195:9
  n1181_o <= n1135_o when n1148_o = '0' else n1180_o;
  -- ../fixed_pkg.vhd:223:9
  n1183_o <= n1097_o when n1107_o = '0' else n1181_o;
  -- Vocoder.vhd:51:9
  channels_gen_n11_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n1184_o,
    data_i => n1186_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n11_lowpass_inst_ready_o,
    valid_o => channels_gen_n11_lowpass_inst_valid_o,
    data_o => channels_gen_n11_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n1184_o <= bandpass_valid (0);
  -- Vocoder.vhd:64:36
  n1186_o <= abs_data (17 downto 0);
  -- Vocoder.vhd:70:9
  channels_gen_n11_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n1189_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n11_osc_inst_data_o);
  -- Vocoder.vhd:80:5
  mixer_inst : entity work.mixer port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => all_lowpass_valid,
    env_data_i => lowpass_data,
    carrier_data_i => osc_data,
    ready_i => wrap_ready_i,
    ready_o => mixer_inst_ready_o,
    valid_o => mixer_inst_valid_o,
    data_o => mixer_inst_data_o);
  -- Vocoder.vhd:93:50
  n1196_o <= '1' when lowpass_valid = "111111111111" else '0';
  -- Vocoder.vhd:93:30
  n1197_o <= '0' when n1196_o = '0' else '1';
  -- Vocoder.vhd:94:50
  n1201_o <= '1' when bandpass_ready = "111111111111" else '0';
  -- Vocoder.vhd:94:30
  n1202_o <= '0' when n1201_o = '0' else '1';
  n1204_o <= channels_gen_n0_bandpass_inst_ready_o & channels_gen_n1_bandpass_inst_ready_o & channels_gen_n2_bandpass_inst_ready_o & channels_gen_n3_bandpass_inst_ready_o & channels_gen_n4_bandpass_inst_ready_o & channels_gen_n5_bandpass_inst_ready_o & channels_gen_n6_bandpass_inst_ready_o & channels_gen_n7_bandpass_inst_ready_o & channels_gen_n8_bandpass_inst_ready_o & channels_gen_n9_bandpass_inst_ready_o & channels_gen_n10_bandpass_inst_ready_o & channels_gen_n11_bandpass_inst_ready_o;
  n1205_o <= channels_gen_n0_bandpass_inst_valid_o & channels_gen_n1_bandpass_inst_valid_o & channels_gen_n2_bandpass_inst_valid_o & channels_gen_n3_bandpass_inst_valid_o & channels_gen_n4_bandpass_inst_valid_o & channels_gen_n5_bandpass_inst_valid_o & channels_gen_n6_bandpass_inst_valid_o & channels_gen_n7_bandpass_inst_valid_o & channels_gen_n8_bandpass_inst_valid_o & channels_gen_n9_bandpass_inst_valid_o & channels_gen_n10_bandpass_inst_valid_o & channels_gen_n11_bandpass_inst_valid_o;
  n1206_o <= channels_gen_n0_lowpass_inst_ready_o & channels_gen_n1_lowpass_inst_ready_o & channels_gen_n2_lowpass_inst_ready_o & channels_gen_n3_lowpass_inst_ready_o & channels_gen_n4_lowpass_inst_ready_o & channels_gen_n5_lowpass_inst_ready_o & channels_gen_n6_lowpass_inst_ready_o & channels_gen_n7_lowpass_inst_ready_o & channels_gen_n8_lowpass_inst_ready_o & channels_gen_n9_lowpass_inst_ready_o & channels_gen_n10_lowpass_inst_ready_o & channels_gen_n11_lowpass_inst_ready_o;
  n1207_o <= channels_gen_n0_lowpass_inst_valid_o & channels_gen_n1_lowpass_inst_valid_o & channels_gen_n2_lowpass_inst_valid_o & channels_gen_n3_lowpass_inst_valid_o & channels_gen_n4_lowpass_inst_valid_o & channels_gen_n5_lowpass_inst_valid_o & channels_gen_n6_lowpass_inst_valid_o & channels_gen_n7_lowpass_inst_valid_o & channels_gen_n8_lowpass_inst_valid_o & channels_gen_n9_lowpass_inst_valid_o & channels_gen_n10_lowpass_inst_valid_o & channels_gen_n11_lowpass_inst_valid_o;
  n1208_o <= channels_gen_n0_bandpass_inst_data_o & channels_gen_n1_bandpass_inst_data_o & channels_gen_n2_bandpass_inst_data_o & channels_gen_n3_bandpass_inst_data_o & channels_gen_n4_bandpass_inst_data_o & channels_gen_n5_bandpass_inst_data_o & channels_gen_n6_bandpass_inst_data_o & channels_gen_n7_bandpass_inst_data_o & channels_gen_n8_bandpass_inst_data_o & channels_gen_n9_bandpass_inst_data_o & channels_gen_n10_bandpass_inst_data_o & channels_gen_n11_bandpass_inst_data_o;
  n1209_o <= n94_o & n193_o & n292_o & n391_o & n490_o & n589_o & n688_o & n787_o & n886_o & n985_o & n1084_o & n1183_o;
  n1210_o <= channels_gen_n0_lowpass_inst_data_o & channels_gen_n1_lowpass_inst_data_o & channels_gen_n2_lowpass_inst_data_o & channels_gen_n3_lowpass_inst_data_o & channels_gen_n4_lowpass_inst_data_o & channels_gen_n5_lowpass_inst_data_o & channels_gen_n6_lowpass_inst_data_o & channels_gen_n7_lowpass_inst_data_o & channels_gen_n8_lowpass_inst_data_o & channels_gen_n9_lowpass_inst_data_o & channels_gen_n10_lowpass_inst_data_o & channels_gen_n11_lowpass_inst_data_o;
  n1211_o <= channels_gen_n0_osc_inst_data_o & channels_gen_n1_osc_inst_data_o & channels_gen_n2_osc_inst_data_o & channels_gen_n3_osc_inst_data_o & channels_gen_n4_osc_inst_data_o & channels_gen_n5_osc_inst_data_o & channels_gen_n6_osc_inst_data_o & channels_gen_n7_osc_inst_data_o & channels_gen_n8_osc_inst_data_o & channels_gen_n9_osc_inst_data_o & channels_gen_n10_osc_inst_data_o & channels_gen_n11_osc_inst_data_o;
end rtl;
