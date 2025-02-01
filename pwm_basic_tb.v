`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 05:15:43 PM
// Design Name: 
// Module Name: pwm_basic_tb
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


module pwm_basic_tb ();
reg clk;
reg[7:0]duty;
wire pwm_out;

pwm_basic  uut(.clk(clk),.duty(duty),.pwm_out(pwm_out));

always #10 clk = ~ clk;

initial begin 

clk = 0;

//rst = 1;
//duty = 8'd0;
//#50 rst = 0 ;
// duty = 0.25 * (2**r);
 
//// repeat (2 * (2**r)) @(posedge clk);
//// duty = 0.50 * (2**r);
 
//// repeat (2* (2**r)) @(posedge clk);
//// duty = 0.75 * (2**r);
#0      duty = 8'd10;
#2000   duty = 8'd20;
#2000   duty = 8'd30;
#2000   duty = 8'd40;
#2000   duty = 8'd50;
#2000   duty = 8'd60;
#2000   duty = 8'd70;
#2000   duty = 8'd80;
#2000   duty = 8'd90;
#2000   $finish;
 
 
end 
endmodule
