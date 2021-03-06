`include "sw.vh"
module cbsel(input [`PKTW:0] i0, i1, i2, i3, output [`PKTW:0] o, input [`PORT:0] d);
    reg o;

//create cbsel0-3 

//d0 = {ack03, ack02, ack01, ack00}
//d1 = {ack13, ack12, ack11, ack10}
//d2 = {ack23, ack22, ack21, ack20}
//d3 = {ack33, ack32, ack31, ack30}

    always_comb begin
        if(d[0]) o = i0;  
        else if(d[1]) o = i1;
        else if(d[2]) o = i2;
        else if(d[3]) o = i3;
        else o = 0;
    end
endmodule