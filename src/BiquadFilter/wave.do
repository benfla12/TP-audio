onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /biquadfiltertestbench/filter_inst/clk_i
add wave -noupdate /biquadfiltertestbench/filter_inst/reset_i
add wave -noupdate /biquadfiltertestbench/filter_inst/valid_i
add wave -noupdate /biquadfiltertestbench/filter_inst/ready_o
add wave -noupdate /biquadfiltertestbench/filter_inst/data_i
add wave -noupdate /biquadfiltertestbench/filter_inst/valid_o
add wave -noupdate /biquadfiltertestbench/filter_inst/ready_i
add wave -noupdate /biquadfiltertestbench/filter_inst/data_o
add wave -noupdate /biquadfiltertestbench/filter_inst/state_reg
add wave -noupdate /biquadfiltertestbench/filter_inst/x_reg
add wave -noupdate /biquadfiltertestbench/filter_inst/y_reg
add wave -noupdate /biquadfiltertestbench/filter_inst/w_reg
add wave -noupdate /biquadfiltertestbench/filter_inst/v_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {172 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits fs
update
WaveRestoreZoom {0 fs} {1 ps}
