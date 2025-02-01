`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2025 03:22:30 PM
// Design Name: 
// Module Name: washing_machine
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


module washing_machine(
    input clk, rst, start, door_closed, water_level, cycle_complete,
    output reg [2:0] state,
    output reg motor_on, water_valve, drain_valve, buzzer
);
    localparam idle = 3'b000,
               fill_water = 3'b001,
               wash = 3'b010,
               rinse = 3'b011,
               spin = 3'b100,
               drain_water = 3'b101,
               END = 3'b110,
               ERROR = 3'b111;

    reg [2:0] nxt_state;

    // State transition on clock edge
    always @(posedge clk or negedge rst) begin
        if (!rst)
            state <= idle;
        else
            state <= nxt_state;
    end

    // State transition logic
    always @(*) begin
        nxt_state = state; // Default to current state
        case (state)
            idle: begin
                if (start && door_closed)
                    nxt_state = fill_water;
                else if (start && !door_closed)
                    nxt_state = ERROR;
            end
            fill_water: begin
                if (!door_closed)
                    nxt_state = ERROR;
                else if (water_level)
                    nxt_state = wash;
            end
            wash: begin
                if (!door_closed)
                    nxt_state = ERROR;
                else if (cycle_complete)
                    nxt_state = rinse;
            end
            rinse: begin
                if (!door_closed)
                    nxt_state = ERROR;
                else if (cycle_complete)
                    nxt_state = spin;
            end
            spin: begin
                if (!door_closed)
                    nxt_state = ERROR; // Changed to ERROR for consistency
                else if (cycle_complete)
                    nxt_state = END;
            end
            drain_water: begin
                if (!door_closed)
                    nxt_state = ERROR;
                else if (cycle_complete)
                    nxt_state = END;
            end
            END: begin
                if (!start)
                    nxt_state = idle;
            end
            ERROR: begin
                if (!start)
                    nxt_state = idle;
            end
            default: nxt_state = idle;
        endcase
    end

    // Output logic
    always @(*) begin
        motor_on = 0;
        water_valve = 0;
        drain_valve = 0;
        buzzer = 0;
        case (state)
            fill_water: water_valve = 1;
            wash: motor_on = 1;
            rinse: motor_on = 1;
            spin: motor_on = 1;
            drain_water: drain_valve = 1;
            END, ERROR: buzzer = 1;
        endcase
    end
endmodule
