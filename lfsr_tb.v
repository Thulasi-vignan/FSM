`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 11:58:13 AM
// Design Name: 
// Module Name: lfsr_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lfsr_tb();
localparam n=3;
reg clk,rst;
wire [1:n]q;

lfsr #(.n(n))uut(.clk(clk),.rst(rst),.q(q));

always #5 clk = ~clk;

initial begin 

clk = 1'b0;

rst = 1'b1;

#5 rst = 1'b0;

#100 $finish ; 

end 

endmodule
