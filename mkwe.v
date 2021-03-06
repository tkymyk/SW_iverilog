`include "sw.vh"
module mkwe(input [`PKTW:0] pkti, output we);
    logic we;
    always_comb begin
        if(pkti[`FLOWBH:`FLOWBL] != `EMPT) we = `ASSERT; // if no data
        else we = `NEGATE;
    end
endmodule