`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 11:44:09 AM
// Design Name: 
// Module Name: lfsr
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


module lfsr #(parameter n = 3)(
input clk,rst,
output [1:n]q
    );
    
    reg [1:n]Q_reg,Q_next;
    wire out ;
    always@(posedge clk , posedge rst)begin 
    if(rst)
        Q_reg <= 'd1;           // because lfsr couldn't start with zero 
     else 
        Q_reg <= Q_next;
     end 
     
     always@(out , Q_reg) begin
        Q_next = {out,Q_reg[1:n-1]};
      end 
      
      
      assign q = Q_reg;
      
      assign out = Q_reg[3] ^ Q_reg[2];   
        
endmodule
