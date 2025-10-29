vlib work

vcom -reportprogress 300 -2008 -work work MicrophoneReceiverTestbench_pkg.vhd
vcom -reportprogress 300 -2008 -work work MicrophoneReceiver.vhd
vcom -reportprogress 300 -2008 -work work MicrophoneReceiverTestbench.vhd

vsim -gui work.MicrophoneReceiverTestbench -t fs

do wave.do

run 200 us
