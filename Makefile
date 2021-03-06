all:
	iverilog -g2012 sw.v ib.v ibsm.v fifo.v mkreq.v mkwe.v arb.v cb.v ackor.v cbsel.v swtest.v
	vvp a.out
show:
	gtkwave sw.vcd
syn:
	yosys sw.ys
synsim:
	iverilog -gspecify ‒Ttyp synth.v swtest.v ../osu018_stdcells.v vvp a.out
