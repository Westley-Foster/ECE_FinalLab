module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);
    wire [3:0] add_carry;   //carry wires for addition
    wire [3:0] sub_carry;  //carry wires for subtraction
    wire [3:0] B_complement; //wire for two's complement subtraction

    assign B_complement = ~B;    

    full_adder add0 (
	.A(A[0]),
	.B(B[0]),
	.Cin(1'b0),
	.Y(AplusB[0]),
	.Cout(add_carry[0])
    );

    full_adder add1 (
	.A(A[1]),
	.B(B[1]),
	.Cin(add_carry[0]),
	.Y(AplusB[1]),
	.Cout(add_carry[1])
    );

    full_adder add2 (
	.A(A[2]),
	.B(B[2]),
	.Cin(add_carry[1]),
	.Y(AplusB[2]),
	.Cout(add_carry[2])
    );

    full_adder add3 (
	.A(A[3]),
	.B(B[3]),
	.Cin(add_carry[2]),
	.Y(AplusB[3])
    );

    //two's complement of B
    full_adder sub0 (
	.A(A[0]),
	.B(B_complement[0]),
	.Cin(1'b1),
	.Y(AminusB[0]),
	.Cout(sub_carry[0])
    );

    full_adder sub1 (
	.A(A[1]),
	.B(B_complement[1]),
	.Cin(sub_carry[0]),
	.Y(AminusB[1]),
	.Cout(sub_carry[1])
    );

    full_adder sub2 (
	.A(A[2]),
	.B(B_complement[2]),
	.Cin(sub_carry[1]),
	.Y(AminusB[2]),
	.Cout(sub_carry[2])
    );

    full_adder sub3 (
	.A(A[3]),
	.B(B_complement[3]),
	.Cin(sub_carry[2]),
	.Y(AminusB[3])
    );

endmodule


