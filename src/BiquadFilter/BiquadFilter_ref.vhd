
library ieee;
use ieee.std_logic_1164.all;

use work.fixed_pkg.all;
use work.Vocoder_pkg.all;

entity BiquadFilter is
    generic(
        A1, A2, B0, B1, B2 : vocoder_coef_t
    );
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
end BiquadFilter;

architecture RTL of BiquadFilter is
    type state_t is (READY_STATE, BUSY_STATE, VALID_STATE);
    signal state_reg : state_t;
    signal x_reg, y_reg, w_reg, v_reg : biquad_data_t;
begin
    p_state_reg : process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            state_reg <= READY_STATE;
        elsif rising_edge(clk_i) then
            case state_reg is
                when READY_STATE =>
                    if valid_i = '1' then
                        state_reg <= BUSY_STATE;
                    end if;
                when BUSY_STATE =>
                    state_reg <= VALID_STATE;
                when VALID_STATE =>
                    if ready_i = '1' then
                        state_reg <= READY_STATE;
                    end if;
            end case;
        end if;
    end process p_state_reg;

    ready_o <= '1' when state_reg = READY_STATE else '0';
    valid_o <= '1' when state_reg = VALID_STATE else '0';

    p_data_reg : process(clk_i, reset_i)
        variable y : biquad_data_t;
    begin
        if reset_i = '1' then
            w_reg <= (others => '0');
            v_reg <= (others => '0');
        elsif rising_edge(clk_i) then
            case state_reg is
                when READY_STATE =>
                    if valid_i = '1' then
                        x_reg <= biquad_resize(data_i);
                    end if;
                when BUSY_STATE =>
                    y     := biquad_resize(x_reg * B0 + w_reg);
                    y_reg <= y;
                    w_reg <= biquad_resize(x_reg * B1 - y * A1 + v_reg);
                    v_reg <= biquad_resize(x_reg * B2 - y * A2);
                when others =>
            end case;
        end if;
    end process p_data_reg;

    data_o <= vocoder_resize(y_reg);
end RTL;
