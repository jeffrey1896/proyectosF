vcom -work work Waveform5.vwf.vht
vsim -novopt -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.partefuncional_vhd_vec_tst -voptargs="+acc"
add wave /*
run -all
