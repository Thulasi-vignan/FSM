`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2025 10:59:56 AM
// Design Name: 
// Module Name: elevator_design
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


module elevator_design(
    input clk,rst,emergency_stop,
    input [3:0]floor_request,
    output reg [1:0]state,
    output reg [1:0]current_floor,
    output reg door_open
    );
    
    localparam idle = 2'b00,
                moving_up = 2'b01,
                moving_down = 2'b10,
                open = 2'b11;
                
        reg [3:0]target_floor;
        
        always@(posedge clk or negedge rst)begin 
        if(rst) begin
        
            state <= idle;
            current_floor <= 'b1;
            door_open <= 'b0;
            target_floor <= 4'b0;
            
        end 
        else if (emergency_stop)begin 
        state <= idle ;
        door_open <= 'b1;     
        end 
        else begin 
        case (state)
            idle : begin 
                        if(floor_request != current_floor)begin 
                            target_floor <= floor_request;
                            if(floor_request > current_floor)
                                state <= moving_up;
                             else 
                                state <= moving_down;
                                
                           end 
                        end    
                           
             moving_up : begin 
                          if (current_floor == target_floor)begin 
                              state<=open;
                              door_open <= 'b1;
                           end 
                           else 
                                current_floor <= current_floor + 1;
                            end                   
             moving_down : begin 
                            if(current_floor == target_floor) begin 
                                state<= open;
                                door_open <= 1;
                             end else begin 
                                current_floor <= current_floor - 1;
                             end 
                           end 
             open : begin 
                            door_open <=0;
                            state<= idle;
                        end 
                        
                  default : state<= idle;      
                     endcase 
               end 
                     
       end 
                                                                       
endmodule
