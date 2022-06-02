onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/reset
add wave -noupdate /tb/ck
add wave -noupdate /tb/load
add wave -noupdate /tb/value
add wave -noupdate /tb/j1
add wave -noupdate /tb/cont1
add wave -noupdate /tb/j2
add wave -noupdate /tb/cont2
add wave -noupdate /tb/winJ1
add wave -noupdate /tb/winJ2
add wave -noupdate /tb/relogio/EA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {162 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ns} {11 us}
