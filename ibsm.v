`include "sw.vh"
module ibsm(input [`PORT:0] reqi, input [`PKTW:0] pout, input empty, input ack, input clk, rst, output [`PORT:0] req, output re);
    logic re;
    reg req;

    logic [1:0] state;
    logic [1:0] nstate;
    //state 00 : before sending req
    //state 01 : waiting ack
    //state 10 : sending packet
    //state 11 : finished

    always @(posedge clk) begin
        if(rst) begin
        re <= 0;
        req <= 4'b0000;
        state <= 0;
        end else begin
            if(reqi != 0) req <= reqi; 
            if(pout[`FLOWBH:`FLOWBL] == `TAIL) req <= 0;

            state <= nstate;
/*
            if(state == 2'b00) begin
                if(reqi != 0) begin
                    req <= reqi; 
                end
                if(pout[`FLOWBH:`FLOWBL] == `TAIL) req <= 0;
            end

            if(state == 2'b01) begin
                req <= 0;
            end

            if(state == 2'b10) begin
                
            end
            */
        end
    end

 
    always_comb begin
        if(state == 2'b00) begin
            re = 0;
            if(req != 0) nstate = 2'b01;
            else nstate = 2'b00;
        end

        if(state == 2'b01) begin
            if(ack) begin
                if(empty) begin
                    nstate = 2'b11;
                    re = 0;
                end
                else begin
                    nstate = 2'b10;
                    re = 1;
                end
            end else begin
                nstate = 2'b01;
                re = 0;
            end
        end
        if(state == 2'b10) begin
            if(empty || pout[`FLOWBH:`FLOWBL] == `TAIL) begin
                re = 0;
                nstate = 2'b11;
            end
            else begin
                re = 1;
                nstate = 2'b10;
            end
        end
        if(state == 2'b11) begin
            nstate = 2'b00;
            re = 1;
        end
    end

endmodule