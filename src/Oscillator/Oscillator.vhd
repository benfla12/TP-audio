
library ieee;
use ieee.std_logic_1164.all;

use work.fixed_pkg.all;
use work.Vocoder_pkg.all;

entity Oscillator is
    port(
        clk_i   : in  std_logic;
        reset_i : in  std_logic;
        step_i  : in  natural range 0 to SINE_INDEX_MAX;
        ready_i : in  std_logic;
        data_o  : out vocoder_coef_t
    );
end Oscillator;

architecture RTL of Oscillator is
    signal down_reg, sign_reg : std_logic;
    signal index_reg          : natural range 0 to SINE_INDEX_MAX;
begin
    -- Concurrent statements.
end RTL;
