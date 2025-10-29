
# Close simulator if a simulation session is already open.
if {[current_sim] ne ""} {
    close_sim -force
}

# Set top module.
set_property top BiquadFilterTestbench [get_filesets sim_1]

# Start the simulator.
launch_simulation
restart

# Add waves for signals in BiquadFilter.
set tbdiv [add_wave_divider -before_wave clk    BiquadFilterTestbench]
set div   [add_wave_divider -before_wave $tbdiv BiquadFilter]
add_wave -after_wave $div filter_inst/*

# Run.
run 50 ms
