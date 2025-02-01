`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 05:08:49 PM
// Design Name: 
// Module Name: pwm_basic
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
 

 reg [7:0]counter; 


    always@(posedge clk)begin 
    if(counter < 99 )
        counter <= counter + 1;
    else 
        counter <= 0;
    end 
    
    always @(posedge clk)begin
    if(counter < duty)
        pwm_out <= 1'b1;
        
     else if (counter == 99)
        pwm_out <= 1'b1;
     else 
        pwm_out <= 1'b0;
        
     end 


endmodule



