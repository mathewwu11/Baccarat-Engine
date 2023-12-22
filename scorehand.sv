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

module scorehand(input [3:0] card1, input [3:0] card2, input [3:0] card3, output [3:0] total);

reg [3:0] card1_val;
reg [3:0] card2_val;
reg [3:0] card3_val;

assign total = (card1_val + card2_val + card3_val) % 10;

always_comb begin : card_logic1
    case(card1)
        `ace:   card1_val = 4'd1;
        `two:   card1_val = 4'd2;
        `three: card1_val = 4'd3;
        `four:  card1_val = 4'd4;
        `five:  card1_val = 4'd5;
        `six:   card1_val = 4'd6;
        `seven: card1_val = 4'd7;
        `eight: card1_val = 4'd8;
        `nine:  card1_val = 4'd9;
        `zero, `jack, `queen, `king, `blank: card1_val = 4'd0; 
        default: card1_val = 4'd0;
    endcase
end

always_comb begin : card_logic2
    case(card2)
        `ace:   card2_val = 4'd1;
        `two:   card2_val = 4'd2;
        `three: card2_val = 4'd3;
        `four:  card2_val = 4'd4;
        `five:  card2_val = 4'd5;
        `six:   card2_val = 4'd6;
        `seven: card2_val = 4'd7;
        `eight: card2_val = 4'd8;
        `nine:  card2_val = 4'd9;
        `zero, `jack, `queen, `king, `blank: card2_val = 4'd0; 
        default: card2_val = 4'd0;
    endcase
end

always_comb begin : card_logic3
    case(card3)
        `ace:   card3_val = 4'd1;
        `two:   card3_val = 4'd2;
        `three: card3_val = 4'd3;
        `four:  card3_val = 4'd4;
        `five:  card3_val = 4'd5;
        `six:   card3_val = 4'd6;
        `seven: card3_val = 4'd7;
        `eight: card3_val = 4'd8;
        `nine:  card3_val = 4'd9;
        `zero, `jack, `queen, `king, `blank: card3_val = 4'd0; 
        default: card3_val = 4'd0;
    endcase
end

endmodule

