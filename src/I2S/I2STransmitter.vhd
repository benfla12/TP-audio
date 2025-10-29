
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
    port(
        -- The general clock (from the on-board oscillator)
        clk_i            : in  std_logic;
        -- The general reset.
        reset_i          : in  std_logic;
        -- Indicates that a new sample is available (from the audio producer)
        valid_i          : in  std_logic;
        -- Request a new sample (to the audio producer)
        ready_o          : out std_logic;
        -- The sample value for the left audio channel (from the audio producer)
        left_data_i      : in  signed(BITS_PER_SAMPLE - 1 downto 0);
        -- The sample value for the right audio channel (from the audio producer)
        right_data_i     : in  signed(BITS_PER_SAMPLE - 1 downto 0);
        -- The master clock for audio data processing (to the receiver)
        master_clk_o     : out std_logic;
        -- The I2S serial communication clock (to the receiver)
        serial_clk_o     : out std_logic;
        -- The I2S serial data (to the receiver)
        serial_data_o    : out std_logic;
        -- The I2S channel selection clock (to the receiver)
        left_right_clk_o : out std_logic
    );
end I2STransmitter;

architecture RTL of I2STransmitter is

    signal timer_div10_reg         : integer range 0 to 9;
    signal half_div10, cycle_div10 : std_logic;
    signal timer_div80_reg         : integer range 0 to 7;
    signal half_div80, cycle_div80 : std_logic;

    signal bit_index_reg   : integer range 0 to 31;
    signal data_reg : signed(31 downto 0);

begin

    -- Clock divider for the master clock (master_clk_o = clk_i / 10)
    p_timer_div10_reg : process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            timer_div10_reg <= 0;
        elsif rising_edge(clk_i) then
            if cycle_div10 = '1' then
                timer_div10_reg <= 0;
            else
                timer_div10_reg <= timer_div10_reg + 1;
            end if;

            
            timer_div10_reg <= timer_div10_reg + 1;
        end if;
    end process p_timer_div10_reg;

    half_div10  <= '1' when timer_div10_reg = 4 else '0';
    cycle_div10 <= '1' when timer_div10_reg = 9 else '0';

    p_clk_div10_reg : process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            master_clk_o <= '0';
        elsif rising_edge(clk_i) then
            if half_div10 = '1' or cycle_div10 = '1' then
                master_clk_o <= not master_clk_o;
            end if;
        end if;
    end process p_clk_div10_reg;


    -- Clock divider for the master clock (serial_clk_o = master_clk_o / 8)
    p_timer_div80_reg : process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            timer_div80_reg <= 0;
        elsif rising_edge(clk_i) then
            if cycle_div80 = '1' then
                timer_div80_reg <= 0;
            elsif cycle_div10 = '1' then
                timer_div80_reg <= timer_div80_reg + 1;
            end if;
        end if;
    end process p_timer_div80_reg;

    half_div80  <= cycle_div10 when timer_div80_reg = 3 else '0';
    cycle_div80 <= cycle_div10 when timer_div80_reg = 7 else '0';

    p_clk_div80_reg : process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            serial_clk_o <= '0';
        elsif rising_edge(clk_i) then
            if half_div80 = '1' or cycle_div80 = '1' then
                serial_clk_o <= not serial_clk_o;
            end if;
        end if;
    end process p_clk_div80_reg;

    

    p_serialiser : process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            bit_index_reg    <= 31;
            left_right_clk_o <= '0';
            data_reg         <= (others => '0');
            ready_o          <= '0';
            serial_data_o    <= '0';

        elsif rising_edge(clk_i) then
            ready_o <= '0';

            if cycle_div80 = '1' then

                if bit_index_reg = 0 then
                    bit_index_reg <= 31;
                    serial_data_o <= left_data_i(15);

                    if valid_i = '1' then
                        data_reg <= left_data_i & right_data_i;
                        ready_o  <= '1';
                    end if;
                else
                    bit_index_reg <= bit_index_reg - 1;
                    serial_data_o <= data_reg(bit_index_reg - 1);
                end if;

                if bit_index_reg = 17 then
                    left_right_clk_o <= '1';
                elsif bit_index_reg = 1 then
                    left_right_clk_o <= '0';
                end if;

            end if;
        end if;
    end process p_serialiser;

end RTL;
