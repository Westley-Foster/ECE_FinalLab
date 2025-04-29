module dff(
    input Default,
    input D,
    input clk,
    input reset,
    output reg Q
);

    //note: initial blocks work for synthesizers, but typically get ignored by FPGAs, so I omitted it
    //initial begin
    //    Q <= Default;
    //end

    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= Default;
        else
            Q <= D;
    end

endmodule