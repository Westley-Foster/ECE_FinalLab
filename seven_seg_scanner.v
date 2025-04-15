module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);
    reg [1:0] state;

    always @(posedge div_clock or posedge reset) begin
        if (reset)
            state <= 2'b00;
        else
            state <= state + 1;
    end
    
   // Use the D FlipFlops from previous labs, and implement all other logic
    // purely combinatorial.
    
    always @(*) begin
        case (state)
            2'b00: anode = 4'b1110; // Right 
            2'b01: anode = 4'b1101; // RC 
            2'b10: anode = 4'b1011; // LC 
            2'b11: anode = 4'b0111; // Left
        endcase
    end

endmodule