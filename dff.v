module dff(
    input D,
    input clk,
    input reset,
    output reg Q,
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