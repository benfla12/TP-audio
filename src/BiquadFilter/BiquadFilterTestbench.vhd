
entity BiquadFilterTestbench is
end BiquadFilterTestbench;

library ieee;
use ieee.std_logic_1164.all;

use work.Vocoder_pkg.all;
use work.BiquadFilterTestbench_pkg.all;

architecture Simulation of BiquadFilterTestbench is
    constant CLK_PERIOD           : time := 1 sec / CLK_FREQUENCY_HZ;
    constant FILTER_SAMPLE_PERIOD : time := 1 sec / FILTER_SAMPLE_RATE_HZ;

    signal clk                                   : std_logic := '0';
    signal reset                                 : std_logic := '1';
    signal osc_ready, filter_valid, filter_ready : std_logic;
    signal osc_data                              : vocoder_coef_t;
    signal osc_data_to_filter, filter_data       : vocoder_data_t;
begin
    clk   <= not clk  after CLK_PERIOD / 2;
    reset <= '0'      after CLK_PERIOD;

    p_filter_ready : process
    begin
        filter_ready <= '0';
        wait for FILTER_SAMPLE_PERIOD - CLK_PERIOD;
        filter_ready <= '1';
        wait for CLK_PERIOD;
    end process p_filter_ready;

    osc_inst : entity work.Oscillator
        port map(
            clk_i   => clk,
            reset_i => reset,
            step_i  => OSC_STEP,
            ready_i => osc_ready,
            data_o  => osc_data
        );

    osc_data_to_filter <= vocoder_resize(osc_data);

    filter_inst : entity work.BiquadFilter
        generic map(
            A1 => BANDPASS_A1(FILTER_CHANNEL),
            A2 => BANDPASS_A2(FILTER_CHANNEL),
            B0 => BANDPASS_B0(FILTER_CHANNEL),
            B1 => BANDPASS_B1(FILTER_CHANNEL),
            B2 => BANDPASS_B2(FILTER_CHANNEL)
        )
        port map(
            clk_i   => clk,
            reset_i => reset,
            valid_i => '1',
            ready_o => osc_ready,
            data_i  => osc_data_to_filter,
            valid_o => filter_valid,
            ready_i => filter_ready,
            data_o  => filter_data
        );
end Simulation;
