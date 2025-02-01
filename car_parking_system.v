`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 02:56:10 PM
// Design Name: 
// Module Name: car_parking_system
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



module car_parking #(parameter capacity = 10)(
    input rst, clk, entry_sensor, exit_sensor,
    output reg [7:0] count,  
    output parking_full
);

assign parking_full = (count >= capacity);

always @(posedge clk or negedge rst) begin
    if (!rst)  
        count <= 0;
    else begin
        if (entry_sensor && !parking_full)
            count <= count + 1;
        if (exit_sensor && count > 0)
            count <= count - 1;
    end
end

endmodule
