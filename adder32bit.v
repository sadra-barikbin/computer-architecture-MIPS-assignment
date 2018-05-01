module adder32bit(input [31:0] num1, num2, output reg [31:0] result);

	always@(num1, num2) result = num1 + num2;

endmodule