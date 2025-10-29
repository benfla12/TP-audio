
entity OscillatorTestbench is
end OscillatorTestbench;

library ieee;
use ieee.std_logic_1164.all;

use work.Vocoder_pkg.all;
use work.OscillatorTestbench_pkg.all;

architecture Simulation of OscillatorTestbench is
    constant CLK_PERIOD        : time := 1 sec / CLK_FREQUENCY_HZ;
    constant OSC_SAMPLE_PERIOD : time := 1 sec / OSC_SAMPLE_RATE_HZ;

    signal clk       : std_logic := '0';
    signal reset     : std_logic := '1';
    signal osc_ready : std_logic := '0';
    signal osc_data  : vocoder_data_t;
begin
    clk   <= not clk  after CLK_PERIOD / 2;
    reset <= '0'      after CLK_PERIOD;

    p_osc_ready : process
    begin
        osc_ready <= '0';
        wait for OSC_SAMPLE_PERIOD - CLK_PERIOD;
        osc_ready <= '1';
        wait for CLK_PERIOD;
    end process p_osc_ready;

    osc_inst : entity work.Oscillator
        port map(
            clk_i   => clk,
            reset_i => reset,
            step_i  => OSC_STEP,
            ready_i => osc_ready,
            data_o  => osc_data
        );
end Simulation;
