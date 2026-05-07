vlib work
vmap work work

vlog -sv rtl/alu.sv
vlog -sv tb/alu_if.sv
vlog -sv tb/alu_pkg.sv
vlog -sv tb/top.sv

vsim -sv_seed random -voptargs=+acc work.top
add wave -r /top/*
run -all