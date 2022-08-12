`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/05 16:00:59
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
    reg clk;
    reg rst;
    parameter   cycle =10;
    always #(cycle/2) clk=~clk;
    reg [31:0]  DI;
    reg RE;
    reg WE;
    wire    [31:0]  res;
    wire [33:0]  inst;


//-------- 写2拍 后 同时读写一拍 冲突1次 再写满后 读空 ---------//
    // initial begin
    //     rst = 1'b1;
    //     clk = 1'b1;
    //     WE  = 1'b0;
    //     RE  = 1'b0;
    //     DI  = 32'hffffffff;
        
    // #20 rst = 1'b0;
    //     WE  = 1'b1;
    //     RE  = 1'b0;
    //     DI  = 32'd1;    
    // #10 DI  = 32'd2;    
    // #10 DI  = 32'd3;    
    //     RE  = 1'b1;
    // #10 DI  = 32'd4;
    //     RE  = 1'b0;    
    // #10 DI  = 32'd5;    
    // #10 DI  = 32'd6;    
    // #10 DI  = 32'd7;
    // #10 DI  = 32'd8;
    // #10 RE  = 1'b1;
    //     WE  = 1'b0;
    // end
// -----------end------------------//

// ----------写一拍 后 同时读写 无读写冲突-----//
    // initial begin
    //     rst = 1'b1;
    //     clk = 1'b1;
    //     WE  = 1'b0;
    //     RE  = 1'b0;
    //     DI  = 32'hffffffff;
        
    // #20 rst = 1'b0;
    //     WE  = 1'b1;
    //     RE  = 1'b0;
    //     DI  = 32'd1;    
    // #10 DI  = 32'd2;    
    //     RE  = 1'b1;
    // #10 DI  = 32'd3;    
    //     RE  = 1'b1;
    // #10 DI  = 32'd4;
    // #10 DI  = 32'd5;    
    // #10 DI  = 32'd6;    
    // #10 DI  = 32'd7;
    // #10 DI  = 32'd8;
    // #10 RE  = 1'b1;
    //     WE  = 1'b0;
    // end
// ---------------end--------------------//


// --------写两拍后 同时读写 发生读写冲突----------//
    // initial begin
    //     rst = 1'b1;
    //     clk = 1'b1;
    //     WE  = 1'b0;
    //     RE  = 1'b0;
    //     DI  = 32'hffffffff;
        
    // #20 rst = 1'b0;
    //     WE  = 1'b1;
    //     RE  = 1'b0;
    //     DI  = 32'd1;    
    // #10 DI  = 32'd2;
    // #10 DI  = 32'd3;    
    //     RE  = 1'b1;
    // #10 DI  = 32'd4;    
    // #10 DI  = 32'd5;    
    // #10 DI  = 32'd6;    
    // #10 DI  = 32'd7;
    // #10 DI  = 32'd8;
    // #10 RE  = 1'b1;
    //     WE  = 1'b0;
    // end

// ----------一直写 直到写满 -------------//
    initial begin
        rst = 1'b1;
        clk = 1'b1;
        WE  = 1'b0;
        RE  = 1'b0;
        DI  = 32'hffffffff;
        
    #20 rst = 1'b0;
        WE  = 1'b1;
        RE  = 1'b0;
        DI  = 32'd1;    
    #10 DI  = 32'd2;    
    #10 DI  = 32'd3;    
    #10 DI  = 32'd4;    
    #10 DI  = 32'd5;    
    #10 DI  = 32'd6;    
    #10 DI  = 32'd7;
    #10 DI  = 32'd8;    
    #10 DI  = 32'd9;    
    #10 DI  = 32'd10;

    #10 DI  = 32'd11;
    #10 DI  = 32'd12;
    end
// ------------end------------------//

// -------------先写后读 直到读空---------///
    // initial begin
    //     rst = 1'b1;
    //     clk = 1'b1;
    //     WE  = 1'b0;
    //     RE  = 1'b0;
    //     DI  = 32'hffffffff;
    // #20 rst = 1'b0;
    //     WE  = 1'b1;
    //     RE  = 1'b0;
    //     DI  = 32'd1;    
    // #10 DI  = 32'd2;  
    // #10 DI  = 32'd3;  
    // #10 DI  = 32'd4;    
    // #10 DI  = 32'd5;    
    // #10 DI  = 32'd6;    
    // #10 DI  = 32'd7;
    // #10 DI  = 32'd8;    
    // #10 DI  = 32'd9;    
    // #10 DI  = 32'd10;    
    // #10 DI  = 32'd11;
    // #10 DI  = 32'd12;
    // #10 RE  = 1'b1;
    //     WE  = 1'b0;
    // end

// -----------------end------------------//

// ------写5个  读5个 再写5个------------ //
    // initial begin
    //     rst = 1'b1;
    //     clk = 1'b1;
    //     WE  = 1'b0;
    //     RE  = 1'b0;
    //     DI  = 32'hffffffff;
    // #20 rst = 1'b0;
    //     WE  = 1'b1;
    //     DI  = 32'd1;    
    // #10 DI  = 32'd2;    
    //     // RE  = 1'b1;
    // #10 DI  = 32'd3;    
    //     // RE  = 1'b1;
    // #10 DI  = 32'd4;
    //     // RE  = 1'b0;    
    // #10 DI  = 32'd5;
    // #10 WE  = 1'b0;
    //     RE  = 1'b1;     
    // #50 DI  = 32'd6;
    //     RE  = 1'b0;    
    //     WE  = 1'b1;
    // #10 DI  = 32'd7;
    // #10 DI  = 32'd8;    
    // #10 DI  = 32'd9;    
    // #10 DI  = 32'd10;    
    // #10 DI  = 32'd11;
    // #10 DI  = 32'd12;
    // #10 RE  = 1'b1;
    //     WE  = 1'b0;
    // end
// -----------------end-------------------//

// ------写5个  读写同时 ------------ //
    // initial begin
    //     rst = 1'b1;
    //     clk = 1'b1;
    //     WE  = 1'b0;
    //     RE  = 1'b0;
    //     DI  = 32'hffffffff;
    // #20 rst = 1'b0;
    //     WE  = 1'b1;
    //     DI  = 32'd1;    
    // #10 DI  = 32'd2;    
    //     // RE  = 1'b1;
    // #10 DI  = 32'd3;    
    //     // RE  = 1'b1;
    // #10 DI  = 32'd4;
    //     // RE  = 1'b0;    
    // #10 DI  = 32'd5;
    //     RE  = 1'b1;     
    // #10 DI  = 32'd6;
    // #10 DI  = 32'd7;
    // #10 DI  = 32'd8;    
    // #10 DI  = 32'd9;    
    // #10 DI  = 32'd10;    
    // #10 DI  = 32'd11;
    // #10 DI  = 32'd12;
    // #10 WE  = 1'b0;
    // end
// -----------------end-------------------//



// -------------先写满 写满后 同时读写-------//
    // initial begin
    //     rst = 1'b1;
    //     clk = 1'b1;
    //     WE  = 1'b0;
    //     RE  = 1'b0;
    //     DI  = 32'hffffffff;
        
    // #20 rst = 1'b0;
    //     WE  = 1'b1;
    //     DI  = 32'd1;    
    // #10 DI  = 32'd2;    
    // #10 DI  = 32'd3;    
    // #10 DI  = 32'd4;    
    // #10 DI  = 32'd5;    
    // #10 DI  = 32'd6;    
    // #10 DI  = 32'd7;
    // #10 DI  = 32'd8; 
    // #10 DI  = 32'd9;
    //     RE  = 1'b1;
    // #10 DI  = 32'd10;
    // #10 DI  = 32'd11;
    // #10 DI  = 32'd12;       
    // #10 DI  = 32'd13;
    // #10 DI  = 32'd14;
    // #10 DI  = 32'd15;
    // #10 DI  = 32'd16;
    // #10 DI  = 32'd17;
    // #10 DI  = 32'd18;
    // #10 DI  = 32'd19;
    // #10 DI  = 32'd20;
    // #10 WE  = 1'b0;
    // end
// ------------end------------------//

    assign  inst = {WE, RE, DI};    

    wire read_valid;
    instruction ins1(
        .inst(inst),
        .clk (clk),
        .rst (rst),
        .res (res),
        .read_valid (read_valid)
    );

endmodule