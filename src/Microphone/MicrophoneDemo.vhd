
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MicrophoneDemo is
    port (
        clk_i                : in  std_logic;
        btn_center_i         : in  std_logic;
        led_o                : out std_logic;
        mic_chip_select_n_o  : out std_logic;
        mic_serial_clk_o     : out std_logic;
        mic_serial_data_i    : in  std_logic;
        i2s_master_clk_o     : out std_logic;
        i2s_left_right_clk_o : out std_logic;
        i2s_serial_clk_o     : out std_logic;
        i2s_serial_data_o    : out std_logic
    );
end MicrophoneDemo;

architecture Structural of MicrophoneDemo is
    constant AUDIO_CLK_FREQUENCY_HZ  : positive := 51_200_000;
    constant I2S_SAMPLE_RATE_HZ      : positive := 20_000;
    constant I2S_MASTER_FREQUENCY_HZ : positive := I2S_SAMPLE_RATE_HZ * 256;
    constant I2S_BITS_PER_SAMPLE     : positive := 16;
    constant MIC_BITS_PER_SAMPLE     : positive := 12;
    constant MIC_BIT_RATE_HZ         : positive := AUDIO_CLK_FREQUENCY_HZ / 4;

    alias reset_i                    : std_logic is btn_center_i;
    signal audio_clk                 : std_logic;

    signal mic_valid, i2s_ready      : std_logic;
    signal mic_data                  : signed(MIC_BITS_PER_SAMPLE - 1 downto 0);
    signal i2s_data                  : signed(I2S_BITS_PER_SAMPLE - 1 downto 0);

    -- Clock generator.
    -- Input frequency: 100 MHz.
    -- Output frequency: 51.2 MHz.
    component AudioClock
        port(
            reset    : in  std_logic;
            clk_in1  : in  std_logic;
            clk_out1 : out std_logic;
            locked   : out std_logic
        );
    end component;
begin
    audio_clk_inst : AudioClock
        port map(
            reset    => reset_i,
            clk_in1  => clk_i,
            clk_out1 => audio_clk,
            locked   => led_o
        );

    mic_inst : entity work.MicrophoneReceiver
        generic map(
            CLK_FREQUENCY_HZ => AUDIO_CLK_FREQUENCY_HZ,
            BIT_RATE_HZ      => MIC_BIT_RATE_HZ,
            BITS_PER_SAMPLE  => MIC_BITS_PER_SAMPLE
        )
        port map(
            clk_i           => audio_clk,
            reset_i         => reset_i,
            valid_o         => mic_valid,
            ready_i         => i2s_ready,
            data_o          => mic_data,
            chip_select_n_o => mic_chip_select_n_o,
            serial_clk_o    => mic_serial_clk_o,
            serial_data_i   => mic_serial_data_i
        );

    i2s_data <= resize(mic_data, I2S_BITS_PER_SAMPLE) sll (I2S_BITS_PER_SAMPLE - MIC_BITS_PER_SAMPLE);

    i2s_inst : entity work.I2STransmitter
        generic map(
            CLK_FREQUENCY_HZ    => AUDIO_CLK_FREQUENCY_HZ,
            MASTER_FREQUENCY_HZ => I2S_MASTER_FREQUENCY_HZ,
            SAMPLE_RATE_HZ      => I2S_SAMPLE_RATE_HZ,
            BITS_PER_SAMPLE     => I2S_BITS_PER_SAMPLE
        )
        port map(
            clk_i            => audio_clk,
            reset_i          => reset_i,
            valid_i          => mic_valid,
            ready_o          => i2s_ready,
            left_data_i      => i2s_data,
            right_data_i     => i2s_data,
            master_clk_o     => i2s_master_clk_o,
            serial_clk_o     => i2s_serial_clk_o,
            left_right_clk_o => i2s_left_right_clk_o,
            serial_data_o    => i2s_serial_data_o
        );
end Structural;
