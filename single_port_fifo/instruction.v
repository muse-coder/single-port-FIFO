`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/10 16:36:40
// Design Name: 
// Module Name: instruction
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

// inst
//   WE     RE      DI
//  33:33   32:32   31:0
 
module instruction(
    input [33:0]    inst,
    input   clk,
    input   rst,
    output  [31:0] res,
    output  read_valid
    );
    wire    [31:0]  DI;
    wire    RE;
    wire    WE;
    assign  DI  = inst[31:0];
    assign  RE  = inst[32];
    assign  WE  = inst[33];
    fifo  f1(
	    .DI     (DI),
	    .RE     (RE),
	    .WE     (WE),
	    .clk    (clk),
	    .rst    (rst),
	    .res    (res),
        .read_valid (read_valid)
    );


endmodule
