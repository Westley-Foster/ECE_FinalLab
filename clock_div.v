module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input reset,
    input clock,

    output reg div_clock
);
assign NotClock = ~clock;
   genvar i; 
    generate 
        for (i = 0; i < DIVIDE_BY; i = i + 1) begin 
            dFF inst( 
                .D(NotClock), 
                .clock(clock),
                .reset(reset)
            );
        end
    endgenerate
    
endmodule