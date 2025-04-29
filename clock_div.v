module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input reset,
    input clock,
    output div_clock
);
    wire [DIVIDE_BY:0] dffInLine;
    wire [DIVIDE_BY:0] dffClkLine;
    
    assign clock = dffClkLine[0];
    assign div_clock = dffInLine[DIVIDE_BY - 1];
    
    genvar i; 
    generate 
        for (i = 0; i < DIVIDE_BY; i = i + 1) 
        begin
            dff inst(
                .D(dffInLine[i + 1]), 
                .clk(dffClkLine[i]),
                .reset(reset),
                .Q(dffClkLine[i + 1]),
                .NotQ(dffInLine[i + 1])
            );
        end
    endgenerate

//    assign wirelink[0] = clock;
//    assign wirelink[DIVIDE_BY] = div_clock;
endmodule
