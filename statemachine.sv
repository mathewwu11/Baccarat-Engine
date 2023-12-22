module statemachine(input slow_clock, input resetb,
                    input [3:0] dscore, input [3:0] pscore, input [3:0] pcard3,
                    output load_pcard1, output load_pcard2,output load_pcard3,
                    output load_dcard1, output load_dcard2, output load_dcard3,
                    output player_win_light, output dealer_win_light);

// The code describing your state machine will go here.  Remember that
// a state machine consists of next state logic, output logic, and the 
// registers that hold the state.  You will want to review your notes from
// CPEN 211 or equivalent if you have forgotten how to write a state machine.

reg load_next_d1;
reg load_next_d2;
reg load_next_d3;
reg load_next_p1;
reg load_next_p2;
reg load_next_p3;
reg next_plight;
reg next_dlight;

reg [2:0] current_state;
reg [2:0] next_state;

assign load_dcard1 = load_next_d1;
assign load_dcard2 = load_next_d2;
assign load_dcard3 = load_next_d3;
assign load_pcard1 = load_next_p1;
assign load_pcard2 = load_next_p2;
assign load_pcard3 = load_next_p3;
assign dealer_win_light = next_dlight;
assign player_win_light = next_plight;

always_ff@(posedge slow_clock) begin
    if(~resetb) begin
        current_state <= 3'b000;
    end
    else begin
        current_state <= next_state; 
    end
end


always_comb begin : state_logic
    case(current_state)
        3'b000:begin
            next_state = 3'b001;
            load_next_d1 = 1'b0;
            load_next_d2 = 1'b0;
            load_next_d3 = 1'b0;
            load_next_p1 = 1'b1;
            load_next_p2 = 1'b0;
            load_next_p3 = 1'b0;
            next_dlight = 1'b0;
            next_plight = 1'b0;
        end
        3'b001:begin
            next_state = 3'b010;
            load_next_d1 = 1'b1;
            load_next_d2 = 1'b0;
            load_next_d3 = 1'b0;
            load_next_p1 = 1'b0;
            load_next_p2 = 1'b0;
            load_next_p3 = 1'b0;
            next_dlight = 1'b0;
            next_plight = 1'b0;
        end
        3'b010:begin
            next_state = 3'b011;
            load_next_d1 = 1'b0;
            load_next_d2 = 1'b0;
            load_next_d3 = 1'b0;
            load_next_p1 = 1'b0;
            load_next_p2 = 1'b1;
            load_next_p3 = 1'b0;
            next_dlight = 1'b0;
            next_plight = 1'b0;
        end
        3'b011:begin
            next_state = 3'b100;
            load_next_d1 = 1'b0;
            load_next_d2 = 1'b1;
            load_next_d3 = 1'b0;
            load_next_p1 = 1'b0;
            load_next_p2 = 1'b0;
            load_next_p3 = 1'b0;
            next_dlight = 1'b0;
            next_plight = 1'b0;
        end
        3'b100:begin
            if(pscore > 4'd7 || dscore > 4'd7) begin //check for natural
                next_state = 3'b110;
                load_next_d3 = 1'b0;
                load_next_p3 = 1'b0;
                if(pscore > dscore) begin
                    next_dlight = 1'b0;
                    next_plight = 1'b1;
                end
                else if(dscore > pscore) begin
                    next_dlight = 1'b1;
                    next_plight = 1'b0;
                end
                else begin
                    next_dlight = 1'b1;
                    next_plight = 1'b1;
                end
            end
            else if(pscore > 4'd5 && dscore > 4'd5) begin //check for 6/7
                next_state = 3'b110;
                load_next_d3 = 1'b0;
                load_next_p3 = 1'b0;
                if(pscore > dscore) begin
                    next_dlight = 1'b0;
                    next_plight = 1'b1;
                end
                else if(dscore > pscore) begin
                    next_dlight = 1'b1;
                    next_plight = 1'b0;
                end
                else begin
                    next_dlight = 1'b1;
                    next_plight = 1'b1;
                end
            end
            else begin
                next_dlight = 1'b0;
                next_plight = 1'b0;
                if(pscore > 4'd5) begin
                    next_state = 3'b110;
                    load_next_d3 = 1'b1;
                    load_next_p3 = 1'b0;
                end
                else begin
                    next_state = 3'b101;
                    load_next_d3 = 1'b0;
                    load_next_p3 = 1'b1;
                end
            end
            load_next_d1 = 1'b0;
            load_next_d2 = 1'b0;
            load_next_p1 = 1'b0;
            load_next_p2 = 1'b0;            
        end
        3'b101:begin
            if((pcard3 < 4'd8 && pcard3 > 4'd5 && dscore == 4'd6) || (pcard3 < 4'd8 && pcard3 > 4'd3 && dscore == 4'd5) 
            || (pcard3 < 4'd8 && pcard3 > 4'd1 && dscore == 4'd4) || (pcard3 != 8 && dscore == 3) || (dscore < 3)) begin
                next_state = 3'b110;
                load_next_d3 = 1'b1;
                next_dlight = 1'b0;
                next_plight = 1'b0;
            end
            else begin
                next_state = 3'b110;
                load_next_d3 = 1'b0;
                if(pscore > dscore) begin
                    next_dlight = 1'b0;
                    next_plight = 1'b1;
                end
                else if(dscore > pscore) begin
                    next_dlight = 1'b1;
                    next_plight = 1'b0;
                end
                else begin
                    next_dlight = 1'b1;
                    next_plight = 1'b1;
                end
            end
            load_next_d1 = 1'b0;
            load_next_d2 = 1'b0;
            load_next_p1 = 1'b0;
            load_next_p2 = 1'b0;
            load_next_p3 = 1'b0;          
        end
        3'b110:begin
            next_state = 3'b110;
            load_next_d1 = 1'b0;
            load_next_d2 = 1'b0;
            load_next_d3 = 1'b0;
            load_next_p1 = 1'b0;
            load_next_p2 = 1'b0;
            load_next_p3 = 1'b0;
            if(pscore > dscore) begin
                next_dlight = 1'b0;
                next_plight = 1'b1;
            end
            else if(dscore > pscore) begin
                next_dlight = 1'b1;
                next_plight = 1'b0;
            end
            else begin
                next_dlight = 1'b1;
                next_plight = 1'b1;
            end
        end
        default:begin
            next_state = 3'b000;
            load_next_d1 = 1'b0;
            load_next_d2 = 1'b0;
            load_next_d3 = 1'b0;
            load_next_p1 = 1'b0;
            load_next_p2 = 1'b0;
            load_next_p3 = 1'b0;
            next_dlight = 1'b0;
            next_plight = 1'b0;
        end
    endcase
end

endmodule

