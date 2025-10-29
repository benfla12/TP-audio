
# -----------------------------------------------------------------------------
# Push buttons
# -----------------------------------------------------------------------------

set_property PACKAGE_PIN U18 [get_ports btn_center_i]
set_property IOSTANDARD LVCMOS33 [get_ports btn_*]

# -----------------------------------------------------------------------------
# LEDs
# -----------------------------------------------------------------------------

set_property PACKAGE_PIN U16 [get_ports led_o]
set_property IOSTANDARD LVCMOS33 [get_ports led_o]

# -----------------------------------------------------------------------------
# Global clock
# -----------------------------------------------------------------------------

set_property PACKAGE_PIN W5 [get_ports clk_i]
set_property IOSTANDARD LVCMOS33 [get_ports clk_i]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk_i]

# -----------------------------------------------------------------------------
# I2S output on connector PmodA
#
# The datasheet provided by Digilent shows a wrong pinout.
# See the schematics for the correct pinout.
# -----------------------------------------------------------------------------

set_property PACKAGE_PIN J1 [get_ports i2s_master_clk_o]
set_property PACKAGE_PIN L2 [get_ports i2s_left_right_clk_o]
set_property PACKAGE_PIN J2 [get_ports i2s_serial_clk_o]
set_property PACKAGE_PIN G2 [get_ports i2s_serial_data_o]
set_property IOSTANDARD LVCMOS33 [get_ports i2s_*]

# -----------------------------------------------------------------------------
# Microphone input on connector PmodB
# -----------------------------------------------------------------------------

set_property PACKAGE_PIN A14 [get_ports mic_chip_select_n_o]
set_property PACKAGE_PIN B16 [get_ports mic_serial_clk_o]
set_property PACKAGE_PIN B15 [get_ports mic_serial_data_i]
set_property IOSTANDARD LVCMOS33 [get_ports mic_*]

set_property MARK_DEBUG true [get_nets {data0[6]}]
set_property MARK_DEBUG true [get_nets {addra[5]}]
set_property MARK_DEBUG true [get_nets {addra[1]}]
set_property MARK_DEBUG true [get_nets {addra[7]}]
set_property MARK_DEBUG true [get_nets {addra[9]}]
set_property MARK_DEBUG true [get_nets {addra[11]}]
set_property MARK_DEBUG true [get_nets {data0[9]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[1]}]
set_property MARK_DEBUG true [get_nets {rom_data[4]}]
set_property MARK_DEBUG true [get_nets {data0[12]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[14]}]
set_property MARK_DEBUG true [get_nets {addra[6]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[14]}]
set_property MARK_DEBUG true [get_nets {addra[13]}]
set_property MARK_DEBUG true [get_nets {addra[14]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[12]}]
set_property MARK_DEBUG true [get_nets {rom_data[0]}]
set_property MARK_DEBUG true [get_nets {rom_data[3]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[4]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[17]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[11]}]
set_property MARK_DEBUG true [get_nets {addra[2]}]
set_property MARK_DEBUG true [get_nets {addra[10]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[8]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[10]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[11]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[8]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[9]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[10]}]
set_property MARK_DEBUG true [get_nets {data0[14]}]
set_property MARK_DEBUG true [get_nets {addra[8]}]
set_property MARK_DEBUG true [get_nets {addra[15]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[13]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[7]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[2]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[5]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[7]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[12]}]
set_property MARK_DEBUG true [get_nets {data0[8]}]
set_property MARK_DEBUG true [get_nets {addra[3]}]
set_property MARK_DEBUG true [get_nets {addra[4]}]
set_property MARK_DEBUG true [get_nets {data0[2]}]
set_property MARK_DEBUG true [get_nets {data0[7]}]
set_property MARK_DEBUG true [get_nets {data0[11]}]
set_property MARK_DEBUG true [get_nets {rom_data[6]}]
set_property MARK_DEBUG true [get_nets {rom_data[7]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[2]}]
set_property MARK_DEBUG true [get_nets {data0[15]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[5]}]
set_property MARK_DEBUG true [get_nets {data0[16]}]
set_property MARK_DEBUG true [get_nets {data0[1]}]
set_property MARK_DEBUG true [get_nets {data0[3]}]
set_property MARK_DEBUG true [get_nets {data0[5]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[3]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[16]}]
set_property MARK_DEBUG true [get_nets {rom_data[2]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[6]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[15]}]
set_property MARK_DEBUG true [get_nets {addra[12]}]
set_property MARK_DEBUG true [get_nets {addra[0]}]
set_property MARK_DEBUG true [get_nets {addra[16]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[6]}]
set_property MARK_DEBUG true [get_nets {rom_data[5]}]
set_property MARK_DEBUG true [get_nets {timer_div10_reg_reg[3]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[13]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[16]}]
set_property MARK_DEBUG true [get_nets {data0[10]}]
set_property MARK_DEBUG true [get_nets {data0[4]}]
set_property MARK_DEBUG true [get_nets {data0[13]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[15]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[4]}]
set_property MARK_DEBUG true [get_nets {rom_address_reg[9]}]
set_property MARK_DEBUG true [get_nets {rom_data[1]}]
set_property MARK_DEBUG true [get_nets {vocoder_data_to_i2s[3]}]
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list audio_clk_inst/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {rom_address_reg[1]} {rom_address_reg[2]} {rom_address_reg[3]} {rom_address_reg[4]} {rom_address_reg[5]} {rom_address_reg[6]} {rom_address_reg[7]} {rom_address_reg[8]} {rom_address_reg[9]} {rom_address_reg[10]} {rom_address_reg[11]} {rom_address_reg[12]} {rom_address_reg[13]} {rom_address_reg[14]} {rom_address_reg[15]} {rom_address_reg[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {rom_data[0]} {rom_data[1]} {rom_data[2]} {rom_data[3]} {rom_data[4]} {rom_data[5]} {rom_data[6]} {rom_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {vocoder_data_to_i2s[2]} {vocoder_data_to_i2s[3]} {vocoder_data_to_i2s[4]} {vocoder_data_to_i2s[5]} {vocoder_data_to_i2s[6]} {vocoder_data_to_i2s[7]} {vocoder_data_to_i2s[8]} {vocoder_data_to_i2s[9]} {vocoder_data_to_i2s[10]} {vocoder_data_to_i2s[11]} {vocoder_data_to_i2s[12]} {vocoder_data_to_i2s[13]} {vocoder_data_to_i2s[14]} {vocoder_data_to_i2s[15]} {vocoder_data_to_i2s[16]} {vocoder_data_to_i2s[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 16 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {data0[1]} {data0[2]} {data0[3]} {data0[4]} {data0[5]} {data0[6]} {data0[7]} {data0[8]} {data0[9]} {data0[10]} {data0[11]} {data0[12]} {data0[13]} {data0[14]} {data0[15]} {data0[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 17 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {addra[0]} {addra[1]} {addra[2]} {addra[3]} {addra[4]} {addra[5]} {addra[6]} {addra[7]} {addra[8]} {addra[9]} {addra[10]} {addra[11]} {addra[12]} {addra[13]} {addra[14]} {addra[15]} {addra[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {timer_div10_reg_reg[3]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_out1]
