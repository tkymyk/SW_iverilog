`include "sw.vh"
module mkreq(input [`PKTW:0] pkti, output [`PORT:0] req, input clk, rst);
    logic [`PORT:0] req;
    always@ (posedge clk) begin
        if(rst) req <= 4'b0000;
        else if(pkti[`FLOWBH:`FLOWBL] == `HEAD) begin   // if header
            case(pkti[1:0]) // create reqest depending on the destination
                2'b00: req <= 4'b0001;
                2'b01: req <= 4'b0010;
                2'b10: req <= 4'b0100;
                2'b11: req <= 4'b1000;
            endcase
        end else if(pkti[`FLOWBH:`FLOWBL] == `EMPT) begin
            req <= 4'b0000;
        end else if(pkti[`FLOWBH:`FLOWBL] == `TAIL) begin
            req <= 4'b0000;
        end

    end
endmodule