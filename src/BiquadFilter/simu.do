vcom -reportprogress 300 -work work ../fixed_pkg.vhd
vcom -reportprogress 300 -work work ../Vocoder/Vocoder_pkg.vhd
vcom -reportprogress 300 -work work ../BiquadFilter/BiquadFilterTestbench_pkg.vhd
vcom -reportprogress 300 -work work ../BiquadFilter/BiquadFilter.vhd
vcom -reportprogress 300 -work work ../Oscillator/Oscillator-ref.vhd
vcom -reportprogress 300 -work work ../BiquadFilter/BiquadFilterTestbench.vhd

vsim -gui work.biquadfiltertestbench -t fs

do wave.do

run 1 us