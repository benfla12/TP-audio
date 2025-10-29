
# Close simulator if a simulation session is already open.
if {[current_sim] ne ""} {
    close_sim -force
}

# Set top module.
set_property top MicrophoneReceiverTestbench [get_filesets sim_1]

# Set time prevision to 1fs
set_property -name xsim.elaborate.xelab.more_options -value {-timeprecision_vhdl 1fs} -objects [get_filesets sim_1]

# Start the simulator.
launch_simulation
restart

# Add waves for signals in Microphone.
set tbdiv [add_wave_divider -before_wave clk     MicrophoneReceiverTestbench]
set div   [add_wave_divider -before_wave $tbdiv  MicrophoneReceiver]
add_wave -after_wave $div receiver_inst/*

# Run.
run 10us
