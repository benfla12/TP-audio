vlib work

vcom -reportprogress 300 -2008 -work work I2STransmitterTestbench_pkg.vhd
vcom -reportprogress 300 -2008 -work work I2STransmitter.vhd
vcom -reportprogress 300 -2008 -work work I2STransmitterTestbench.vhd

vsim -gui work.i2stransmittertestbench -t fs

do wave.do

run 200 us
