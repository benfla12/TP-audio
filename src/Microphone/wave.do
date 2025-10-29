onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /microphonereceivertestbench/receiver_inst/clk_i
add wave -noupdate /microphonereceivertestbench/receiver_inst/reset_i
add wave -noupdate /microphonereceivertestbench/receiver_inst/valid_o
add wave -noupdate /microphonereceivertestbench/receiver_inst/ready_i
add wave -noupdate /microphonereceivertestbench/receiver_inst/data_o
add wave -noupdate /microphonereceivertestbench/receiver_inst/cpt_bit
add wave -noupdate /microphonereceivertestbench/receiver_inst/chip_select_n_o
add wave -noupdate /microphonereceivertestbench/receiver_inst/serial_clk
add wave -noupdate /microphonereceivertestbench/receiver_inst/serial_data_i
add wave -noupdate /microphonereceivertestbench/receiver_inst/fsm_spi
add wave -noupdate /microphonereceivertestbench/receiver_inst/cpt_serial
add wave -noupdate /microphonereceivertestbench/receiver_inst/half_serial
add wave -noupdate /microphonereceivertestbench/receiver_inst/cycle_serial
add wave -noupdate /microphonereceivertestbench/receiver_inst/data_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {302734375 fs} 0} {{Cursor 2} {167894750 fs} 0}
quietly wave cursor active 2
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 fs} {477824600 fs}
