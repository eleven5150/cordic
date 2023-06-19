project open CORDIC.mpf

project compileall

vsim -gui work.tb

add wave -position insertpoint  \
sim:/tb/clock \
sim:/tb/reset \
sim:/tb/x_i \
sim:/tb/y_i \
sim:/tb/x_o \
sim:/tb/y_o

run -all