`include "sw.vh"
module arb(input req0, req1, req2, req3, output ackx0, ackx1, ackx2, ackx3, input clk, rst);

//req0[1] from 0 to 1
//create arb 0-3
/*
    if(req0 == 1) ackx0 <= 1;
    if(req1 == 1) ackx1 <= 1;
    if(req2 == 1) ackx2 <= 1;
    if(req3 == 1) ackx3 <= 1;
*/
    logic turn = 0;
    logic ackx0, ackx1, ackx2, ackx3;

    always @(posedge clk) begin
        if(rst) begin
            turn <= 0;
            ackx0 <= `NEGATE;
            ackx1 <= `NEGATE;
            ackx2 <= `NEGATE;
            ackx3 <= `NEGATE;
        end

        /*
        if(ack00 == 0 && ack10 == 0 && ack20 == 0 && ack30 == 0)  o0 <= 0;  // all 0
        else if(ack00 == 1 && ack10 == 0 && ack20 == 0 && ack30 == 0) o0 <= co0; // without competition
        else if(ack00 == 0 && ack10 == 1 && ack20 == 0 && ack30 == 0) o0 <= co1;
        else if(ack00 == 0 && ack10 == 0 && ack20 == 1 && ack30 == 0) o0 <= co2;
        else if(ack00 == 0 && ack10 == 0 && ack20 == 0 && ack30 == 1) o0 <= co3;
        else begin 
            */
        ackx0 <= `NEGATE;
        ackx1 <= `NEGATE;
        ackx2 <= `NEGATE;
        ackx3 <= `NEGATE;
        case (turn)
            0: begin  //from port 0
                if(req0) ackx0 <= `ASSERT;   //want to send to port 0
                else if(req1) ackx1 <= `ASSERT;
                else if(req2) ackx2 <= `ASSERT;
                else if(req3) ackx3 <= `ASSERT;
                else turn = turn + 1;
            end
            1: begin  //from port 1
                if(req0) ackx0 <= `ASSERT;   //want to send to port 0
                else if(req1) ackx1 <= `ASSERT;
                else if(req2) ackx2 <= `ASSERT;
                else if(req3) ackx3 <= `ASSERT;
                else turn = turn + 1;
            end
            2: begin  //from port 2
                if(req0) ackx0 <= `ASSERT;   //want to send to port 0
                else if(req1) ackx1 <= `ASSERT;
                else if(req2) ackx2 <= `ASSERT;
                else if(req3) ackx3 <= `ASSERT;
                else turn = turn + 1;
            end
            3: begin  //from port 3
                if(req0) ackx0 <= `ASSERT;   //want to send to port 0
                else if(req1) ackx1 <= `ASSERT;
                else if(req2) ackx2 <= `ASSERT;
                else if(req3) ackx3 <= `ASSERT;
                else turn = 0;
            end
        endcase
    end

/*
                if(next0 == 0) begin
                    
                    o0 <= co0;  // from 0
                    if(co0[9:8] == `TAIL) begin // after sending the chunk of packet0
                        o0 <= co0;
                        next0 == 1; 
                    end
                end
                if(next0 == 1) begin 
                    o0 <= co1;  // from 1
                    if(co1[9:8] == `TAIL) begin
                        o0 <= co1;
                        next1 == 1; 
                        next0 == 0;
                    end
                end
                if(next1 == 1) begin
                    o0 <= co2;
                    if(co2[9:8] == `TAIL) begin
                        o0 <= co2;
                        next2 == 1;
                        next1 == 0;
                    end
                end
                if(next2 == 1) begin
                    o0 <= co3;
                    if(co3[9:8] == `TAIL) begin
                        o0 <= co3;
                        next2 == 0;
                    end
                end
                
            end
            */
endmodule