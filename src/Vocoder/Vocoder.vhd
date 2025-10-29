
library ieee;
use ieee.std_logic_1164.all;

use work.fixed_pkg.all;
use work.Vocoder_pkg.all;

entity Vocoder is
    port(
        clk_i   : in  std_logic;
        reset_i : in  std_logic;
        valid_i : in  std_logic;
        ready_o : out std_logic;
        data_i  : in  vocoder_data_t;
        valid_o : out std_logic;
        ready_i : in  std_logic;
        data_o  : out vocoder_data_t
    );
end Vocoder;

architecture RTL of Vocoder is
    constant ALL_CHANNELS                        : std_logic_vector(0 to CHANNELS - 1) := (others => '1');
    signal bandpass_ready, bandpass_valid        : std_logic_vector(0 to CHANNELS - 1);
    signal lowpass_ready, lowpass_valid          : std_logic_vector(0 to CHANNELS - 1);
    signal bandpass_data, abs_data, lowpass_data : vocoder_data_vector_t(0 to CHANNELS - 1);
    signal osc_data                              : vocoder_coef_vector_t(0 to CHANNELS - 1);
    signal all_lowpass_valid, mixer_ready        : std_logic;
begin
    channels_gen : for c in 0 to CHANNELS - 1 generate
	
		bandpass_inst : entity work.BiquadFilter
			generic map (
				A1 => BANDPASS_A1(c),
				A2 => BANDPASS_A2(c),
				B0 => BANDPASS_B0(c),
				B1 => BANDPASS_B1(c),
				B2 => BANDPASS_B2(c)
			)
			port map (
				clk_i   => clk_i,
				reset_i => reset_i,
				valid_i => valid_i,
				ready_o => bandpass_ready(c),
				data_i  => data_i,
				valid_o => bandpass_valid(c),
				ready_i => lowpass_ready(c),
				data_o  => bandpass_data(c)
			);
			
		abs_data(c) <= abs(bandpass_data(c));
			
		low_pass_inst : entity work.BiquadFilter
			generic map (
				A1 => LOWPASS_A1,
				A2 => LOWPASS_A2,
				B0 => LOWPASS_B0,
				B1 => LOWPASS_B1,
				B2 => LOWPASS_B2
			)
			port map (
				clk_i   => clk_i,
				reset_i => reset_i,
				valid_i => bandpass_valid(c),
				ready_o => lowpass_ready(c),
				data_i  => abs_data(c),				
				valid_o => lowpass_valid(c),
				ready_i => mixer_ready,
				data_o  => lowpass_data(c)
			);
		
		osc_inst : entity work.Oscillator
	    port map (
			clk_i   => clk_i,
            reset_i => reset_i,
			step_i  => c+1,
			ready_i => mixer_ready,
			data_o  => osc_data(c)
		);

    end generate channels_gen;
	
	

    mixer_inst : entity work.Mixer
        port map(
            clk_i          => clk_i,
            reset_i        => reset_i,
            valid_i        => all_lowpass_valid,
            ready_o        => mixer_ready,
            env_data_i     => lowpass_data,
            carrier_data_i => osc_data,
            valid_o        => valid_o,
            ready_i        => ready_i,
            data_o         => data_o
        );

    all_lowpass_valid <= '1' when lowpass_valid  = ALL_CHANNELS else '0';
    ready_o           <= '1' when bandpass_ready = ALL_CHANNELS else '0';
	
end RTL;
