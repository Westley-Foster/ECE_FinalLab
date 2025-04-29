module seven_seg_scanner(
    input div_clock,
    input reset,
    output reg [3:0] anode
);
    wire [1:0] state;
    wire [1:0] nextState;
//    parameter A = 2'b00,
//              B = 2'b01,
//              C = 2'b11,
//              D = 2'b10;


    // Use the D FlipFlops from previous labs, and implement all other logic
    // purely combinatorial.
    dff firstDFF (
        .D(nextState[0]),
        .clk(div_clock),
        .reset(reset),
        .Q(state[0]),
        .NotQ(state[1])
    );

    dff secondDFF (
        .D(nextState[1]),
        .clk(div_clock),
        .reset(reset),
        .Q(state[1]),
        .NotQ(state[0])
    );

    assign nextState = state + 1; //counts A through D 

//    assign anode = (state == 2'b00) ? 4'b1110 : // Right
//                   (state == 2'b01) ? 4'b1101 : // Right Center
//                   (state == 2'b10) ? 4'b1011 : // Left Center
//                   (state == 2'b11) ? 4'b0111 : // Left
//                   4'b1111;

       always @(*) begin
            case (state)
                2'd00: anode[3:0] = 4'b1110;
                2'd01: anode[3:0] = 4'b1101;
                2'd10: anode[3:0] = 4'b1011;
                2'd11: anode[3:0] = 4'b0111;
            endcase
       end

endmodule