`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2025 11:13:07 AM
// Design Name: 
// Module Name: elevator_tb
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


module elevator_tb();
reg clk ,rst,emergency_stop;
reg [3:0]floor_request;
wire [1:0]state;
wire [1:0]current_floor;
wire door_open;

elevator_design uut(.clk(clk),.rst(rst),.emergency_stop(emergency_stop),.floor_request(floor_request),.state(state),.current_floor(current_floor),.door_open(door_open));

always #5 clk = ~ clk;

initial begin 
    clk = 0;
    rst = 1;
    floor_request = 0;
    emergency_stop = 0;
    
    #10 rst = 0;
    #10 floor_request = 3;
    #50 floor_request = 0;
    
    #20 emergency_stop = 1;
    #10 emergency_stop = 0;
    
    #10 floor_request = 1;
    #50 floor_request = 0;
    #10 floor_request = 4;
    #50 floor_request = 0;
    
    #50 $finish;
    
    end 
     
endmodule
