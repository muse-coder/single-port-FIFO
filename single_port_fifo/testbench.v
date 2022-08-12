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
    reg [17:0] lsu1_inst;
    reg clk;
    reg rst;
    parameter   cycle =10;
    always #(cycle/2) clk=~clk;
    wire [42:0] lsu1_bus;
    reg [42:0] lsu2_bus;
    reg [42:0] lsu3_bus;
    reg [42:0] lsu4_bus;
    reg [43:0] off_chip_bus;
    wire	access_en_1;	//41:41
	wire	wr_sel1;		//40:40  1 ->write_en  0 -> read_en
	wire	[7:0] access_addr1;//39:32
	wire	[31:0] write_data1;//31:0

    wire [32:0] bank_to_lsu1_bus;
    wire [32:0] bank_to_lsu2_bus;
    wire [32:0] bank_to_lsu3_bus;
    wire [32:0] bank_to_lsu4_bus;
    wire [31:0] lsu1_to_pe;
    reg  [31:0] pe1_data;
    reg  [31:0] pe2_data;
    reg  [31:0] pe3_data;
    reg  [31:0] pe4_data;
    reg    [41:0] bank1_bus;
    assign	{
		access_en_1,	//41:41
		wr_sel1,		//40:40  1 ->write_en  0 -> read_en
		access_addr1,//39:32
		write_data1	//31:0
	} = bank1_bus;

    reg [7:0] addr_1;    
    initial begin
        pe1_data = 32'b0;
        pe2_data = 32'b0;
        pe3_data = 32'b0;
        pe4_data = 32'b0;
        lsu2_bus=43'b0;
        lsu3_bus=43'b0;
        lsu4_bus=43'b0;
        off_chip_bus =44'b0 ;

        // access_en_1 = 1'b0;
        clk = 1'b1;
        rst = 1'b1;
        lsu1_inst = 18'b000001101000000000;
                        // 000001101000000000
        // lsu1_bus = 43'd0;
        // lsu2_bus = 43'd0;
        // lsu3_bus = 43'd0;
        // lsu4_bus = 43'd0;
        off_chip_bus = 44'd0;
        pe1_data =32'd3;

        // bank1_bus = 42'h30000000001;
        // access_en_1 =1'b1;
        //     lsu1_bus = 43'h30000000001;
        // #10 lsu1_bus = 43'h30800000002;
        // #10 lsu1_bus = 43'h31000000003;
        // #10 lsu1_bus = 43'h31800000004;
        // #10 lsu1_bus = 43'h32000000005;
        // #10 lsu1_bus = 43'h30000000001;
        // #10 lsu1_bus = 43'h30000000001;
        // #10 lsu1_bus = 43'h30000000001;
        //     pe1_data =32'd1;
        //     lsu1_inst = 18'b000100001100000000;

        // #10 pe1_data =32'd2;
        //     lsu1_inst = 18'b000100101100000000;
        // #10 pe1_data =32'd3;
        //     lsu1_inst = 18'b000100001100000000;
        // #10 pe1_data =32'd4;
        // #10 pe1_data =32'd5;
        // #10 pe1_data =32'd6;
        // #10 pe1_data =32'd7;
        // #10 pe1_data =32'd8;
        // #10 pe1_data =32'd9;
        // #10 pe1_data =32'd10;
        // #10 pe1_data =32'd11;
        // #10 lsu1_inst =18'b000100001000000000;
// --------------write 10 data
        #178 rst = 1'b0;
        #2  lsu1_inst = 18'b000100001100000000;
            pe1_data =32'd1;
            addr_1   =8'd1;
        
        // #10 lsu1_inst = 18'b000100101100000000;
        //     pe1_data =32'd2;
        //     addr_1   =8'd2;
        // #10 lsu1_inst = 18'b000101001100000000;
        //     pe1_data =32'd3;
        //     addr_1   =8'd3;
        // #10 lsu1_inst = 18'b000101101100000000;
        //     pe1_data =32'd4;
        //     addr_1   =8'd4;
        // #10 lsu1_inst = 18'b000110001100000000;
        //     pe1_data =32'd5;
        //     addr_1   =8'd5;
        #10 lsu1_inst = 18'b000100001100000000;
            pe1_data =32'd6;
        //     addr_1   =8'd6;
        #10 lsu1_inst = 18'b000100001100000000;
            pe1_data =32'd7;
        //     addr_1   =8'd1;
        #10 lsu1_inst = 18'b000100001100000000;
            pe1_data =32'd8;
        //     addr_1   =8'd1;
        #10 lsu1_inst = 18'b000100001100000000;
            pe1_data =32'd9;
        //     addr_1   =8'd1;
        #10 lsu1_inst = 18'b000100001100000000;
            pe1_data =32'd10;
        

//-------------------read 10 data -----------------
        #10 lsu1_inst= 18'b000100001000000000;
         pe1_data =32'd11;
        #10 lsu1_inst= 18'b000100001000000000;
        // #10 lsu1_inst= 18'b000100101000000000;
        // #10 lsu1_inst= 18'b000101001000000000;
        // #10 lsu1_inst= 18'b000100001000000000;
        // #10 lsu1_inst= 18'b000100001000000000;
        // #10 lsu1_inst= 18'b000101101000000000;
        #10 lsu1_inst= 18'b000100001000000000;
        // #10 lsu1_inst= 18'b000110001000000000;
        #10 lsu1_inst= 18'b000100001000000000;


    end
    // wire read_valid1;
    // wire [31:0] read_data_1;
    // // wire
    // bank_fifo bank1(
	//    .clk(clk),
    //    .rst(rst),
	//    .access_en(access_en_1),
	//    .wr_sel(1'b1),//1 ->write_en  0 -> read_en
	//    .access_addr(addr_1),
	//    .write_data(pe1_data),
	//    .read_data  (read_data_1),
	//    .read_valid (read_valid1)
    // );


    lsu lsu1(
        .clk    (clk),
        .rst    (rst),
        .pe1    (pe1_data),
        .pe2    (pe2_data),
        .pe3    (pe3_data),
        .pe4    (pe4_data),
        .inst_in  (lsu1_inst),
        .bank_readin_bus    (bank_to_lsu1_bus),         
        .lsu_to_pe          (lsu1_to_pe),
        .lsu_bus            (lsu1_bus)
    );

    scratchpad s(
        .clk(clk),
        .rst(rst),
        .lsu1_bus       (lsu1_bus),
        .lsu2_bus       (lsu2_bus),
        .lsu3_bus       (lsu3_bus),
        .lsu4_bus       (lsu4_bus),
        .off_chip_bus   (off_chip_bus),
	    .read_out1_bus  (bank_to_lsu1_bus),
	    .read_out2_bus  (bank_to_lsu2_bus),
	    .read_out3_bus  (bank_to_lsu3_bus),
	    .read_out4_bus  (bank_to_lsu4_bus)
    
    );

	// bank_fifo bank1(
	// 	.clk		(clk),
    //     .rst		(rst),
	// 	.access_en	(access_en_1),
	// 	.wr_sel		(wr_sel1),
    // 	.access_addr(access_addr1),
	// 	.write_data	(pe1_data),
	//     .read_data  (lsu1_read_data),
	// 	.read_valid	(read_valid1)
	// );

endmodule