module datapath(input slow_clock, input fast_clock, input resetb,
                input load_pcard1, input load_pcard2, input load_pcard3,
                input load_dcard1, input load_dcard2, input load_dcard3,
                output [3:0] pcard3_out,
                output [3:0] pscore_out, output [3:0] dscore_out,
                output[6:0] HEX5, output[6:0] HEX4, output[6:0] HEX3,
                output[6:0] HEX2, output[6:0] HEX1, output[6:0] HEX0);
						

reg [3:0] new_card;
reg [3:0] p1card;
reg [3:0] p2card;
reg [3:0] p3card;
reg [3:0] d1card;
reg [3:0] d2card;
reg [3:0] d3card;
reg [6:0] p1_hex;
reg [6:0] p2_hex;
reg [6:0] p3_hex;
reg [6:0] d1_hex;
reg [6:0] d2_hex;
reg [6:0] d3_hex;
reg [3:0] pscore;
reg [3:0] dscore;

assign pcard3_out = p3card;
assign pscore_out = pscore;
assign dscore_out = dscore;
assign HEX0 = p1_hex;
assign HEX1 = p2_hex;
assign HEX2 = p3_hex;
assign HEX3 = d1_hex;
assign HEX4 = d2_hex;
assign HEX5 = d3_hex;


dealcard givencard(fast_clock, resetb, new_card);

reg4 pcard1(slow_clock, resetb, new_card, load_pcard1, p1card);
reg4 pcard2(slow_clock, resetb, new_card, load_pcard2, p2card);
reg4 pcard3(slow_clock, resetb, new_card, load_pcard3, p3card);
reg4 dcard1(slow_clock, resetb, new_card, load_dcard1, d1card);
reg4 dcard2(slow_clock, resetb, new_card, load_dcard2, d2card);
reg4 dcard3(slow_clock, resetb, new_card, load_dcard3, d3card);

card7seg p1seg(p1card, p1_hex);
card7seg p2seg(p2card, p2_hex);
card7seg p3seg(p3card, p3_hex);
card7seg d1seg(d1card, d1_hex);
card7seg d2seg(d2card, d2_hex);
card7seg d3seg(d3card, d3_hex);

scorehand p_hand(p1card, p2card, p3card, pscore);
scorehand d_hand(d1card, d2card, d3card, dscore);


endmodule


module reg4(input slow_clock, input resetb, input [3:0] in_card, input load_en, output [3:0] out_card);

reg [3:0] out_wire;

assign out_card = out_wire;

always_ff@(posedge slow_clock) begin
    if(resetb == 0) begin
        out_wire <= 4'b0000;
    end
    else if(load_en == 1) begin
        out_wire <= in_card;
    end
end


endmodule

