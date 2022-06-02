if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vcom -work work xadrez.vhd
vcom -work work tb_xadrez.vhd

vsim -voptargs=+acc=lprn -t ns work.tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1

do wave.do 

run 11 us

