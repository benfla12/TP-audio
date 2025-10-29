
library ieee;
use ieee.std_logic_1164.all;

use work.fixed_pkg.all;
use work.Vocoder_pkg.all;

entity Mixer is
    port(
        clk_i          : in  std_logic;
        reset_i        : in  std_logic;
        valid_i        : in  std_logic;
        ready_o        : out std_logic;
        env_data_i     : in  vocoder_data_vector_t(0 to CHANNELS - 1);
        carrier_data_i : in  vocoder_coef_vector_t(0 to CHANNELS - 1);
        valid_o        : out std_logic;
        ready_i        : in  std_logic;
        data_o         : out vocoder_data_t
    );
end Mixer;

architecture RTL of Mixer is
    type state_t is (READY_STATE, BUSY_STATE, VALID_STATE);
    signal state_reg   : state_t;
    signal channel_reg : natural range 0 to CHANNELS - 1;
    signal data_reg    : vocoder_data_t;
begin
    -- Concurrent statements.
end RTL;
