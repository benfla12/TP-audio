
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package MicrophoneReceiverTestbench_pkg is
    constant CLK_FREQUENCY_HZ    : positive                                 := 51_200_000;

    constant MIC_SAMPLE_RATE_HZ  : integer                                  := 20_000;
    constant MIC_BIT_RATE_HZ     : integer                                  := CLK_FREQUENCY_HZ / 4;
    constant MIC_BITS_PER_SAMPLE : integer                                  := 16;
    constant MIC_AUDIO_DATA      : signed(MIC_BITS_PER_SAMPLE - 1 downto 0) := "1111100111001010";
    constant MIC_DUTY_CYCLE_MIN  : real                                     := 0.4;
    constant MIC_CS_PULSE_MIN    : time                                     := 10 ns;
    constant MIC_CS_TO_SCLK      : time                                     := 10 ns;
    constant MIC_CS_TO_SDATA     : time                                     := 20 ns;
end package MicrophoneReceiverTestbench_pkg;
