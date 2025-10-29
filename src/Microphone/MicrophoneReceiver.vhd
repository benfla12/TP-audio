
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MicrophoneReceiver is
    generic(
        -- The general clock frequency, in Hz
        CLK_FREQUENCY_HZ : positive;
        -- The serial clock frequency for data transfer, in Hz
        BIT_RATE_HZ      : positive range 1 to 20e6;
        -- The number of data bits per samples
        BITS_PER_SAMPLE  : positive range 12 to 32
    );
    port(
        -- The general clock (from the on-board oscillator)
        clk_i           : in  std_logic;
        -- The general reset.
        reset_i         : in  std_logic;
        -- Indicates that a new sample is available (to the audio consumer)
        valid_o         : out std_logic;
        -- Request a new sample (from the audio consumer)
        ready_i         : in  std_logic;
        -- Audio data sample value.
        data_o          : out signed(BITS_PER_SAMPLE - 1 downto 0);
        -- The chip select command (to the microphone)
        chip_select_n_o : out std_logic;
        -- The serial communication clock (to the microphone)
        serial_clk_o    : out std_logic;
        -- The serial data (from the microphone)
        serial_data_i   : in  std_logic
    );
end MicrophoneReceiver;

architecture Behavioral of MicrophoneReceiver is

    type T_FSM_SPI is (INIT_STATE, BUSY_STATE, VALID_STATE);
    signal fsm_spi      : T_FSM_SPI;
    signal cpt_bit      : integer range 0 to 16;
    signal cpt_serial   : integer range 0 to 3;
    signal half_serial  : std_logic;
    signal cycle_serial : std_logic;
    signal serial_clk   : std_logic;
    signal data_reg     : signed(15 downto 0);

begin

    p_gestion_fsm : process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            fsm_spi         <= INIT_STATE;
            cpt_bit         <= 0;
            chip_select_n_o <= '1';
            valid_o         <= '0';
            serial_clk      <= '1';
            cpt_serial      <= 0;
            data_reg        <= (others => '1');
            data_o          <= (others => '0');
        elsif rising_edge(clk_i) then

            case fsm_spi is
                -- lecture automatique d'un nouvel echantillon audio
                when INIT_STATE =>
                    fsm_spi         <= BUSY_STATE;
                    cpt_bit         <= 16;
                    chip_select_n_o <= '0';

                when BUSY_STATE =>
                    -- Division par 4 pour avoir un rapport cyclique de 50%. Serial_clk doit etre inferieure à 20 MHz(51.2/4=12.8)
                    if cpt_serial < 3 then
                        cpt_serial <= cpt_serial + 1;
                    else
                        cpt_serial <= 0;
                    end if;

                    if (half_serial = '1') or (cycle_serial = '1') then
                        serial_clk <= not (serial_clk);
                    end if;

                    --if half_serial = '1' then
                    if cpt_serial = 0 then
                        if cpt_bit /= 16 and cpt_bit /= 0 then
                            data_reg(cpt_bit - 1) <= serial_data_i;
                        end if;
                        if cpt_bit > 0 then
                            cpt_bit <= cpt_bit - 1;
                        else
                            fsm_spi         <= VALID_STATE;
                            data_o          <= resize(not (data_reg(11)) & data_reg(10 downto 1) & serial_data_i, BITS_PER_SAMPLE); -- conversion binaire decale -> complement a 2
                            valid_o         <= '1';
                            chip_select_n_o <= '1';
                            serial_clk      <= '1';
                            cpt_serial      <= 0;
                        end if;
                    end if;

                when VALID_STATE =>
                    if ready_i = '1' then
                        valid_o         <= '0';
                        fsm_spi         <= BUSY_STATE;
                        cpt_bit         <= 16;
                        chip_select_n_o <= '0';
                    end if;
            end case;
        end if;
    end process p_gestion_fsm;

    half_serial  <= '1' when cpt_serial = 1 else '0';
    cycle_serial <= '1' when cpt_serial = 3 else '0';

    serial_clk_o <= serial_clk;

end Behavioral;
