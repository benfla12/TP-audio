
entity I2STransmitterTestbench is
end I2STransmitterTestbench;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.I2STransmitterTestbench_pkg.all;

architecture Simulation of I2STransmitterTestbench is
    constant CLK_PERIOD                : time := 1 sec / CLK_FREQUENCY_HZ;
    constant I2S_MASTER_CLK_PERIOD     : time := CLK_PERIOD * (CLK_FREQUENCY_HZ / I2S_MASTER_FREQUENCY_HZ);
    constant I2S_LEFT_RIGHT_CLK_PERIOD : time := I2S_MASTER_CLK_PERIOD * (I2S_MASTER_FREQUENCY_HZ / I2S_SAMPLE_RATE_HZ);
    constant I2S_SERIAL_CLK_PERIOD     : time := I2S_LEFT_RIGHT_CLK_PERIOD / I2S_BITS_PER_SAMPLE / 2;

    signal clk                : std_logic := '0';
    signal reset              : std_logic := '1';
    signal i2s_ready          : std_logic;
    signal i2s_serial_clk     : std_logic;
    signal i2s_serial_data    : std_logic;
    signal i2s_left_right_clk : std_logic;
    signal i2s_master_clk     : std_logic;
    signal left_data_i : signed(I2S_BITS_PER_SAMPLE - 1 downto 0);
    signal right_data_i : signed(I2S_BITS_PER_SAMPLE - 1 downto 0);
begin
    clk   <= not clk  after CLK_PERIOD / 2;
    reset <= '0' after CLK_PERIOD;

    transmitter_inst : entity work.I2STransmitter
        generic map(
            CLK_FREQUENCY_HZ    => CLK_FREQUENCY_HZ,
            MASTER_FREQUENCY_HZ => I2S_MASTER_FREQUENCY_HZ,
            SAMPLE_RATE_HZ      => I2S_SAMPLE_RATE_HZ,
            BITS_PER_SAMPLE     => I2S_BITS_PER_SAMPLE
        )
        port map(
            clk_i            => clk,
            reset_i          => reset,
            valid_i          => '1',
            ready_o          => i2s_ready,
            left_data_i      => left_data_i,
            right_data_i     => right_data_i,
            master_clk_o     => i2s_master_clk,
            serial_clk_o     => i2s_serial_clk,
            serial_data_o    => i2s_serial_data,
            left_right_clk_o => i2s_left_right_clk
        );

        name : process (clk, reset) is
        begin
            if reset = '1' then
                left_data_i <= (others => '0');
                right_data_i <= (others => '0');
            elsif rising_edge(clk) then
                if i2s_ready = '1' then
                    left_data_i <= left_data_i + 1;
                    right_data_i <= right_data_i + 1;
                end if;
            end if;
        end process name;
        

    p_check_master_clk : process
        variable t_rise, t_fall, t_low, t_high, period : time;
    begin
        wait until rising_edge(i2s_master_clk);
        t_rise := now;

        loop
            -- Measure high phase of master clock.
            wait until falling_edge(i2s_master_clk);
            t_fall := now;
            t_high := t_fall - t_rise;

            -- Measure low phase of master clock.
            wait until rising_edge(i2s_master_clk);
            t_rise := now;
            t_low  := t_rise - t_fall;

            period := t_high + t_low;

            -- Check master clock period.
            assert period = I2S_MASTER_CLK_PERIOD
                report "Incorrect period for master_clk: " & time'image(period) & " (expected " & time'image(I2S_MASTER_CLK_PERIOD) & ")"
                severity ERROR;

            -- Check master clock duty cycle.
            assert t_high >= I2S_DUTY_CYCLE_MIN * period and t_high <= I2S_DUTY_CYCLE_MAX * period
                report "Incorrect duty cycle for master_clk: high time=" &  time'image(t_high) & " low time=" & time'image(t_low)
                severity ERROR;
        end loop;
    end process p_check_master_clk;

    -- Check serial clock.

    -- Check left-right clock.

    -- Check ready.

    -- Check serial data.

    p_check_alignment : process(reset, i2s_serial_clk, i2s_serial_data, i2s_left_right_clk)
    begin
        if reset = '0' then
            if i2s_serial_clk'event then
                assert falling_edge(i2s_master_clk)
                    report "serial_clk events are not aligned with falling edges of master_clk"
                    severity ERROR;
            end if;

            if i2s_serial_data'event then
                assert falling_edge(i2s_serial_clk)
                    report "serial_data events are not aligned with falling edges of serial_clk"
                    severity ERROR;
            end if;

            if i2s_left_right_clk'event then
                assert falling_edge(i2s_serial_clk)
                    report "left_right_clk events are not aligned with falling edges of serial_clk"
                    severity ERROR;
            end if;
        end if;
    end process p_check_alignment;
end architecture Simulation;
