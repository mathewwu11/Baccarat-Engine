`define blank 4'b0000
`define ace 4'b0001
`define two 4'b0010
`define three 4'b0011
`define four 4'b0100
`define five 4'b0101
`define six 4'b0110
`define seven 4'b0111
`define eight 4'b1000
`define nine 4'b1001
`define zero 4'b1010
`define jack 4'b1011
`define queen 4'b1100
`define king 4'b1101

module card7seg(input [3:0] card, output[6:0] seg7);

   reg [6:0] hex_wire;
   assign seg7 = hex_wire;

   always_comb begin : card_comb
      case(card)
         `blank: begin
            hex_wire[6] = 1'b1;
            hex_wire[5] = 1'b1;
            hex_wire[4] = 1'b1;
            hex_wire[3] = 1'b1;
            hex_wire[2] = 1'b1;
            hex_wire[1] = 1'b1;
            hex_wire[0] = 1'b1;
         end
         `ace: begin
            hex_wire[6] = 1'b0;
            hex_wire[5] = 1'b0;
            hex_wire[4] = 1'b0;
            hex_wire[3] = 1'b1;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b0;
            hex_wire[0] = 1'b0;
         end
         `two: begin
            hex_wire[6] = 1'b0;
            hex_wire[5] = 1'b1;
            hex_wire[4] = 1'b0;
            hex_wire[3] = 1'b0;
            hex_wire[2] = 1'b1;
            hex_wire[1] = 1'b0;
            hex_wire[0] = 1'b0;
         end
         `three: begin
            hex_wire[6] = 1'b0;
            hex_wire[5] = 1'b1;
            hex_wire[4] = 1'b1;
            hex_wire[3] = 1'b0;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b0;
            hex_wire[0] = 1'b0;
         end
         `four: begin
            hex_wire[6] = 1'b0;
            hex_wire[5] = 1'b0;
            hex_wire[4] = 1'b1;
            hex_wire[3] = 1'b1;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b0;
            hex_wire[0] = 1'b1;
         end
         `five: begin
            hex_wire[6] = 1'b0;
            hex_wire[5] = 1'b0;
            hex_wire[4] = 1'b1;
            hex_wire[3] = 1'b0;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b1;
            hex_wire[0] = 1'b0;
         end
         `six: begin
            hex_wire[6] = 1'b0;
            hex_wire[5] = 1'b0;
            hex_wire[4] = 1'b0;
            hex_wire[3] = 1'b0;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b1;
            hex_wire[0] = 1'b0;
         end
         `seven: begin
            hex_wire[6] = 1'b1;
            hex_wire[5] = 1'b1;
            hex_wire[4] = 1'b1;
            hex_wire[3] = 1'b1;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b0;
            hex_wire[0] = 1'b0;
         end
         `eight: begin
            hex_wire[6] = 1'b0;
            hex_wire[5] = 1'b0;
            hex_wire[4] = 1'b0;
            hex_wire[3] = 1'b0;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b0;
            hex_wire[0] = 1'b0;
         end
         `nine: begin
            hex_wire[6] = 1'b0;
            hex_wire[5] = 1'b0;
            hex_wire[4] = 1'b1;
            hex_wire[3] = 1'b0;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b0;
            hex_wire[0] = 1'b0;
         end
         `zero: begin
            hex_wire[6] = 1'b1;
            hex_wire[5] = 1'b0;
            hex_wire[4] = 1'b0;
            hex_wire[3] = 1'b0;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b0;
            hex_wire[0] = 1'b0;
         end
         `jack: begin
            hex_wire[6] = 1'b1;
            hex_wire[5] = 1'b1;
            hex_wire[4] = 1'b0;
            hex_wire[3] = 1'b0;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b0;
            hex_wire[0] = 1'b1;
         end
         `queen: begin
            hex_wire[6] = 1'b0;
            hex_wire[5] = 1'b0;
            hex_wire[4] = 1'b1;
            hex_wire[3] = 1'b1;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b0;
            hex_wire[0] = 1'b0;
         end
         `king: begin
            hex_wire[6] = 1'b0;
            hex_wire[5] = 1'b0;
            hex_wire[4] = 1'b0;
            hex_wire[3] = 1'b1;
            hex_wire[2] = 1'b0;
            hex_wire[1] = 1'b0;
            hex_wire[0] = 1'b1;
         end
         default: begin
            hex_wire[6] = 1'b0;
            hex_wire[5] = 1'b0;
            hex_wire[4] = 1'b0;
            hex_wire[3] = 1'b0;
            hex_wire[2] = 1'b1;
            hex_wire[1] = 1'b1;
            hex_wire[0] = 1'b0;
         end
      endcase
   end

endmodule

