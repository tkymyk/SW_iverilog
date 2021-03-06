`include "sw.vh"
//module ib(input [`PKTW:0] pkti, output [`PKTW:0] pkto, [`PORT:0] req, input ack, output full, input clk, rst);

module ib(input [`PKTW:0] pkti, output [`PKTW:0] pkto, output [`PORT:0] req, input ack, output full, input clk, rst);

    //logic [`PKTW:0] pkti;
    logic [`PORT:0] reqi;
    //mkwe mkwe(pkti, we);
    fifo fifo(pkti, we, full, pkto, re, empty, clk, rst);
    mkwe mkwe(pkti, we);
    mkreq mkreq(pkto, reqi, clk, rst);
    ibsm ibsm(reqi, pkto, empty, ack, clk, rst, req, re);
endmodule




