module dff(
    input D,
    input clk,
    input reset,
    output reg Q = 0,
    output NotQ
);


    initial begin
        Q <= D;
    end
    
    always @(posedge clk or posedge reset) begin
          if (reset) begin
               Q <= 0;
          end else if (clk) begin
               Q <= D;
          end
    end
    
    assign NotQ = ~Q;

endmodule

module dff_default(
    input Default,
    input D,
    input clk,
    input reset,
    output reg Q,
    output NotQ
);

    initial begin
        Q <= Default;
    end

    always @(posedge clk, posedge reset) begin
        if (reset)
            Q <= Default;
        else
            Q <= D;
    end
    
    assign NotQ = ~Q;

endmodule
