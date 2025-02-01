`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2025 03:45:30 PM
// Design Name: 
// Module Name: washing_machine_tb
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


module washing_machine_tb();

reg clk, rst, door_closed, water_level, cycle_complete, start;
wire [2:0] state;
wire motor_on;
wire water_valve;
wire drain_valve;
wire buzzer;

// Instantiate the washing machine module
washing_machine uut (
    .clk(clk), .rst(rst), .start(start), .door_closed(door_closed),
    .water_level(water_level), .cycle_complete(cycle_complete),
    .state(state), .motor_on(motor_on), .water_valve(water_valve),
    .drain_valve(drain_valve), .buzzer(buzzer)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    start = 0;
    door_closed = 0;
    water_level = 0;
    cycle_complete = 0;

    // Reset the design
    $display("Time=%0d: Applying reset", $time);
    #10 rst = 1; // Assert reset
    #10 rst = 0; // Deassert reset
    $display("Time=%0d: Reset deasserted", $time);

    // Test sequence
    #10 start = 1; door_closed = 1; // Start machine with door closed
    $display("Time=%0d: Start asserted, door closed", $time);

    #20 water_level = 1; // Fill water
    $display("Time=%0d: Water level high", $time);

    #50 cycle_complete = 1; // Wash complete
    #10 cycle_complete = 0;

    #50 cycle_complete = 1; // Rinse complete
    #10 cycle_complete = 0;

    #50 cycle_complete = 1; // Spin complete
    #10 cycle_complete = 0;

    #50 cycle_complete = 1; // Drain water complete
    #10 cycle_complete = 0;

    #20 door_closed = 0; // Open door during END state
    $display("Time=%0d: Door opened", $time);
    #10 door_closed = 1;
    $display("Time=%0d: Door closed", $time);

    start = 0; // Stop the machine
    $display("Time=%0d: Start deasserted", $time);
    #10;

    $finish; // End simulation
end

// Monitor the outputs
initial begin
    $monitor("Time=%0d: State=%b, Motor=%b, WaterValve=%b, DrainValve=%b, Buzzer=%b",
             $time, state, motor_on, water_valve, drain_valve, buzzer);
end

endmodule


