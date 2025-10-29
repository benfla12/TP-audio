
# Close simulator if a simulation session is already open.
if {[current_sim] ne ""} {
    close_sim -force
}

# Set top module.
set_property top OscillatorTestbench [get_filesets sim_1]

# Start the simulator.
launch_simulation
restart

# Add waves for signals in Oscillator.
set tbdiv [add_wave_divider -before_wave clk    OscillatorTestbench]
set div   [add_wave_divider -before_wave $tbdiv Oscillator]
add_wave -after_wave $div osc_inst/*

# Run.
run 50 ms
