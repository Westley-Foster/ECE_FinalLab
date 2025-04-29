module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);
    wire [1:0] state;
    wire [1:0] nextState;

    // Use the D FlipFlops from previous labs, and implement all other logic
    // purely combinatorial.
    dff firstDFF (
	.Default(1'b0),
	.D(nextState[0]),
	.clk(div_clock),
	.reset(reset),
	.Q(state[0])
    );

    dff secondDFF (
	.Default(1'b0),
	.D(nextState[1]),
	.clk(div_clock),
	.reset(reset),
	.Q(state[1])
    );

    assign nextState = state + 1; //counts A through D 

    assign anode = (state == 2'b00) ? 4'b1110 : // Right
                   (state == 2'b01) ? 4'b1101 : // Right Center
                   (state == 2'b10) ? 4'b1011 : // Left Center
                   (state == 2'b11) ? 4'b0111 : // Left
                   4'b1111;

endmodule