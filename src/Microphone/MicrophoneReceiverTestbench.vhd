
entity MicrophoneReceiverTestbench is
end MicrophoneReceiverTestbench;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.MicrophoneReceiverTestbench_pkg.all;

architecture Simulation of MicrophoneReceiverTestbench is
    constant CLK_PERIOD            : time      := 1 sec / CLK_FREQUENCY_HZ;
    constant MIC_SERIAL_CLK_PERIOD : time      := 1 sec / MIC_BIT_RATE_HZ;
    constant MIC_SAMPLE_PERIOD     : time      := 1 sec / MIC_SAMPLE_RATE_HZ;

    signal clk                     : std_logic := '0';
    signal reset                   : std_logic := '1';
    signal ready                   : std_logic := '0';
    signal chip_select_n, valid    : std_logic;
    signal serial_clk, serial_data : std_logic;
    signal data                    : signed(MIC_BITS_PER_SAMPLE - 1 downto 0);

    function signed_image(s : signed) return string is
        variable sv : signed(1 to s'length) := s;
        variable res : string(1 to s'length);
    begin
        for i in sv'range loop
            case sv(i) is
                when '0' => res(i) := '0';
                when '1' => res(i) := '1';
                when 'X' => res(i) := 'X';
                when 'L' => res(i) := 'L';
                when 'H' => res(i) := 'H';
                when 'Z' => res(i) := 'Z';
                when 'W' => res(i) := 'W';
                when 'U' => res(i) := 'U';
                when '-' => res(i) := '-';
            end case;
        end loop;

        return res;
    end signed_image;
begin
    clk   <= not clk after CLK_PERIOD / 2;
    reset <= '0'     after CLK_PERIOD;

    receiver_inst : entity work.MicrophoneReceiver
        generic map(
            CLK_FREQUENCY_HZ => CLK_FREQUENCY_HZ,
            BIT_RATE_HZ      => MIC_BIT_RATE_HZ,
            BITS_PER_SAMPLE  => MIC_BITS_PER_SAMPLE
        )
        port map(
            clk_i           => clk,
            reset_i         => reset,
            valid_o         => valid,
            ready_i         => ready,
            data_o          => data,
            chip_select_n_o => chip_select_n,
            serial_clk_o    => serial_clk,
            serial_data_i   => serial_data
        );

    p_ready_check_valid : process is
        variable t : time;
    begin
        loop
            t := now;
            wait until rising_edge(clk) and valid = '1';
            ready <= '1';
            wait until rising_edge(clk);
            ready <= '0';
            assert now - t <= MIC_SAMPLE_PERIOD
                report "Receiver is too slow"
                severity ERROR;
        end loop;
    end process p_ready_check_valid;

    p_check_chip_select_serial_clk : process is
        variable t_cs   : time;
        variable t_sclk : time;
    begin
        wait until chip_select_n = '1' and serial_clk = '1';

        t_cs := now;

        wait until falling_edge(chip_select_n) or falling_edge(serial_clk);

        -- CS must go low first
        assert serial_clk = '1'
            report "Expected serial_clk = '1'"
            severity ERROR;

        -- Check minimum CS pulse width (t1)
        assert now - t_cs >= MIC_CS_PULSE_MIN
            report "chip_select_n is low too early"
            severity ERROR;

        t_cs := now;

        for i in 1 to MIC_BITS_PER_SAMPLE loop
            wait until falling_edge(serial_clk) or rising_edge(chip_select_n);

            -- CS must not go high before the last bit has been received
            assert chip_select_n = '0'
                report "chip_select_n is high too early - CS must not go high before the last bit has been received"
                severity ERROR;

            if i = 1 then
                -- Check CS to SCLK setup time (t2)
                assert now - t_cs >= MIC_CS_TO_SCLK
                    report "serial_clk is low too early: " & time'image(now - t_cs) & " after CS (expected >= " & time'image(MIC_CS_TO_SCLK) & ")"
                    severity ERROR;
            else
                -- Check SCLK high pulse width (t6)
                assert now - t_sclk >= MIC_DUTY_CYCLE_MIN * MIC_SERIAL_CLK_PERIOD
                    report "Wrong serial_clk high pulse duration: " & time'image(now - t_sclk) & " (expected >= " & time'image(MIC_DUTY_CYCLE_MIN * MIC_SERIAL_CLK_PERIOD) & ")"
                    severity ERROR;
            end if;

            t_sclk := now;

            wait until rising_edge(serial_clk) or rising_edge(chip_select_n);

            -- CS must not go high before last bit has been received
            assert i = MIC_BITS_PER_SAMPLE or chip_select_n = '0'
                report "chip_select_n is high too early"
                severity ERROR;

            -- Check SCLK low pulse width (t5)
            assert now - t_sclk >= MIC_DUTY_CYCLE_MIN * MIC_SERIAL_CLK_PERIOD
                report "Wrong serial_clk low pulse duration: " & time'image(now - t_sclk) & " (expected >= " & time'image(MIC_DUTY_CYCLE_MIN * MIC_SERIAL_CLK_PERIOD) & ")"
                severity ERROR;

            t_sclk := now;
        end loop;

        wait until rising_edge(chip_select_n);

    end process p_check_chip_select_serial_clk;

    p_serial_data : process is
    begin
        serial_data <= 'Z';
        wait until falling_edge(chip_select_n);

        -- CS to data tri-state disable (t3)
        wait for MIC_CS_TO_SDATA;
        serial_data <= '0';

        -- Wait 4 falling edges of SCLK, 3 if SCLK is already low
        if serial_clk = '1' then
            wait until falling_edge(serial_clk);
        end if;
        for i in 1 to 3 loop
            wait until falling_edge(serial_clk);
        end loop;

        -- Send sign bit
        serial_data <= not MIC_AUDIO_DATA(11);
        wait until falling_edge(serial_clk);

        -- Send remaining 11 bits
        for i in 10 downto 1 loop
            serial_data <= MIC_AUDIO_DATA(i);
            wait until falling_edge(serial_clk);
        end loop;
        serial_data <= MIC_AUDIO_DATA(0);
        wait until rising_edge(chip_select_n);
    end process p_serial_data;

    p_check_data : process is
    begin
        wait until rising_edge(clk) and valid = '1';

        assert data = MIC_AUDIO_DATA
            report "Wrong value for data: " & signed_image(data) & " (expected: " & signed_image(MIC_AUDIO_DATA) & ")"
            severity ERROR;
    end process p_check_data;

end Simulation;
