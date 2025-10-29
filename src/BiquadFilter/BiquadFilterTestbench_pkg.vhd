
library ieee;
use ieee.std_logic_1164.all;

package BiquadFilterTestbench_pkg is
    constant CLK_FREQUENCY_HZ      : positive := 51_200_000;
    constant FILTER_SAMPLE_RATE_HZ : positive := 20_000;
    constant FILTER_CHANNEL        : positive := 4;
    constant OSC_STEP              : integer  := 5;
end BiquadFilterTestbench_pkg;
