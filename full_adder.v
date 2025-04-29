module full_adder(
  input Cin,
  input A, 
  input B,
  output Y,
  output Cout

);
assign Cout = (A & B) | (B & Cin) | (A & Cin);
assign Y = A ^ B ^ Cin;

endmodule