library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package I2STransmitterTestbench_pkg is
    constant CLK_FREQUENCY_HZ               : positive                                 := 51_200_000;

    constant I2S_SAMPLE_RATE_HZ             : positive                                 := 20_000;
    constant I2S_MASTER_FREQUENCY_HZ        : positive                                 := I2S_SAMPLE_RATE_HZ * 256;
    constant I2S_BITS_PER_SAMPLE            : positive                                 := 16;
    constant I2S_LEFT_DATA                  : signed(I2S_BITS_PER_SAMPLE - 1 downto 0) := "0011010111001010";
    constant I2S_RIGHT_DATA                 : signed(I2S_BITS_PER_SAMPLE - 1 downto 0) := "1010001101011100";
    constant I2S_DUTY_CYCLE_MIN             : real                                     := 0.45;
    constant I2S_DUTY_CYCLE_MAX             : real                                     := 0.55;
end I2STransmitterTestbench_pkg;
