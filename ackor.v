`include "sw.vh"
module ackor(input ack0x, ack1x, ack2x, ack3x, output ack);
  
    assign ack = ack0x | ack1x | ack2x | ack3x;

endmodule