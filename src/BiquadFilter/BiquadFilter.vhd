
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

    type state_t is (READY_STATE, STEP1, STEP2, STEP3, STEP4, VALID_STATE);
    signal state_reg                  : state_t;
    signal x_reg, y_reg, w_reg, v_reg : biquad_data_t;
    signal y, a, c                    : biquad_data_t;
    signal b                          : vocoder_coef_t;

begin

    p_data_reg : process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            x_reg     <= (others => '0');
            w_reg     <= (others => '0');
            v_reg     <= (others => '0');
            y_reg     <= (others => '0');
            a         <= (others => '0');
            b         <= (others => '0');
            c         <= (others => '0');
            data_o    <= (others => '0');
            state_reg <= READY_STATE;
            valid_o   <= '0';
            ready_o   <= '0';
        elsif rising_edge(clk_i) then

            case state_reg is

                -- Attente d'un echantillon a traiter
                when READY_STATE =>
                    if valid_i = '1' then
                        x_reg     <= biquad_resize(data_i);
                        --y_reg     <= biquad_resize(data_i * B0 + w_reg);
                        a         <= biquad_resize(data_i);
                        b         <= B0;
                        c         <= w_reg;
                        state_reg <= STEP1;
                        ready_o   <= '0';
                    end if;

                when STEP1 =>
                    --w_reg     <= biquad_resize(x_reg * B1 + v_reg);
                    a         <= x_reg;
                    b         <= B1;
                    c         <= v_reg;
                    y_reg     <= y;
                    state_reg <= STEP2;

                when STEP2 =>
                    --w_reg     <= biquad_resize(w_reg - y_reg * A1);
                    a         <= -y_reg;
                    b         <= A1;
                    c         <= w_reg;
                    w_reg     <= y;
                    state_reg <= STEP3;

                when STEP3 =>
                    --v_reg     <= biquad_resize(x_reg * B2);
                    a         <= x_reg;
                    b         <= B2;
                    c         <= (others => '0');
                    w_reg     <= y;
                    state_reg <= STEP4;

                when STEP4 =>
                    --v_reg     <= biquad_resize(v_reg - y_reg * A2);
                    a         <= x_reg;
                    b         <= B2;
                    c         <= (others => '0');
                    v_reg     <= y;
                    state_reg <= VALID_STATE;
                    valid_o   <= '1';

                -- Attente que l'echantillon soit consomme		
                when VALID_STATE =>
                    --data_o <= vocoder_resize(y_reg);
                    data_o <= vocoder_resize(y);
                    v_reg <= y;
                    if ready_i = '1' then
                        state_reg <= READY_STATE;
                        valid_o   <= '0';
                        ready_o   <= '1';
                    end if;

            end case;
        end if;
    end process p_data_reg;

    -- MAC
    y <= biquad_resize(a * b + c);

end RTL;
