module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input reset,
    input clock,
    output reg div_clock
);
    reg [$clog2(DIVIDE_BY) - 1:0] count;

    always @(posedge clock or posedge reset) begin
	if (reset) begin
	   count <= 0;
	   div_clock <= 0;
	end 
        else if (count == (DIVIDE_BY - 1)) begin
	   count <= 0;
	   div_clock <= ~div_clock;
	end
	else begin
	   count <= count + 1;
	end
    end

endmodule