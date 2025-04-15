module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB,
     output Borrow

);
    wire [3:0]carry;

 full_adder bit0(
        .A(~A[0]),
        .B(1),
        .Y(AplusB[0]),
        .Cin(1'b0),
        .Cout(carry[0])
    );

    full_adder bit1(
        .A(~A[1]),
        .B(0),
        .Y(AplusB[1]),
        .Cin(carry[0]),
        .Cout(carry[1])
    );
        full_adder bit2(
        .A(~A[2]),
        .B(0),
        .Y(AplusB[2]),
        .Cin(carry[1]), 
        .Cout(carry[2])
    );
    
    full_adder bit3(
        .A(~A[3]),
        .B(0),
        .Y(AplusB[3]),
        .Cin(carry[2])
    );
    
assign AplusB = ;

endmodule