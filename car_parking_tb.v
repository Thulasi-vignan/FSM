`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 03:36:17 PM
// Design Name: 
// Module Name: car_parking_tb
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

//module tb_parking_system;

//  // Inputs
//  reg clk;
//  reg reset_n;
//  reg sensor_entrance;
//  reg sensor_exit;
//  reg [1:0] password_1;
//  reg [1:0] password_2;

//  // Outputs
//  wire GREEN_LED;
//  wire RED_LED;
//  wire [6:0] HEX_1;
//  wire [6:0] HEX_2;
//  parking_system uut (
//  .clk(clk), 
//  .reset_n(reset_n), 
//  .sensor_entrance(sensor_entrance), 
//  .sensor_exit(sensor_exit), 
//  .password_1(password_1), 
//  .password_2(password_2), 
//  .GREEN_LED(GREEN_LED), 
//  .RED_LED(RED_LED), 
//  .HEX_1(HEX_1), 
// .HEX_2(HEX_2)
// );
// initial begin
// clk = 0;
// forever #10 clk = ~clk;
// end
// initial begin
// // Initialize Inputs
// reset_n = 0;
//// sensor_entrance = 0;
// sensor_exit = 0;
//// password_1 = 0;
//// password_2 = 0;
// // Wait 100 ns for global reset to finish
// #100;
//      reset_n = 1;
// #20;
// sensor_entrance = 1;
// password_1 = 2;
// password_2 = 2;
// #2000;
// sensor_exit =1;
 
// #100
//  sensor_entrance = 1;
// password_1 = 0;
// password_2 = 2;
// sensor_exit=0;
// #2000
// $finish;
 
 
//end
      
//endmodule



module car_parking_tb();
    parameter capacity = 10;
    reg clk, rst, entry_sensor, exit_sensor;
    wire [7:0] count;
    wire parking_full;

    car_parking #(capacity) uut (
        .clk(clk),
        .rst(rst),
        .entry_sensor(entry_sensor),
        .exit_sensor(exit_sensor),
        .count(count),
        .parking_full(parking_full)
    );

    always #5 clk = ~clk;  // 10ns clock period

    initial begin
        clk = 0;
        rst = 0;
        entry_sensor = 0;
        exit_sensor = 0;

        // Reset the system
        #10 rst = 1;
        #10 rst = 0;
        #10 rst = 1;

        // Simulate car entries
        #10 entry_sensor = 1; #10 entry_sensor = 0;
        #10 entry_sensor = 1; #10 entry_sensor = 0;
        #10 entry_sensor = 1; #10 entry_sensor = 0;
        #10 entry_sensor = 1; #10 entry_sensor = 0;
        #10 entry_sensor = 1; #10 entry_sensor = 0;
        #10 entry_sensor = 1; #10 entry_sensor = 0;

        // Simulate car exits
        #10 exit_sensor = 1; #10 exit_sensor = 0;
        #10 exit_sensor = 1; #10 exit_sensor = 0;

        // Fill parking lot to capacity
        repeat(capacity) begin
            #10 entry_sensor = 1;
            #10 entry_sensor = 0;
        end

        // Attempt entry when full
        #10 entry_sensor = 1; #10 entry_sensor = 0;

        // Empty parking lot
        repeat(capacity) begin
            #10 exit_sensor = 1;
            #10 exit_sensor = 0;
        end
    end
endmodule

    