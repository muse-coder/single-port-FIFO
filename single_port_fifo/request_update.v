`include "param_define.v"
module request_update (
	input	[31:0] di,
	input	re,	
	input	we,
	input	clk,
	input   rst,
	output	we_n,
	output	re_n,
	output	[`WIDTH-1:0]	r_adr,
	output	[`WIDTH-1:0]	w_adr,
	output  r_err,
	output  w_err,
	output  [31:0] data_out
);  
// fifo 8 data  3bit address
	// reg  [`WIDTH:0] rd_addr;
	// reg  [`WIDTH:0] wr_addr;
	wire full,empty;
	

	// assign  
//---------update we_n and re_n--------//
	assign  we_n  = (we & (~full) & (~rst)) | (we & re & full);
	assign  re_n  = re & (~empty)& (~rst);

	assign  w_err  = we & (full);
	assign  r_err  = re & (empty);

//--------------------------------//

//-----------update r_adr and w_adr---------------//
	address_update  lut1(
	.clk	(clk),
	.rst	(rst),
	.re		(re),	
	.we		(we),
	.empty	(empty),
	.full	(full),
	.r_adr	(r_adr),
	.w_adr	(w_adr)
	);

	assign data_out  = di;
// ------------------------------//
	
endmodule


module address_update (
	input   clk,
	input   rst,
	input	re,	
	input	we,
	output  empty,
	output	full,
	output	[`WIDTH-1:0] r_adr,
	output	[`WIDTH-1:0] w_adr
);

// fifo 8 data  3bit address
	reg  [`WIDTH:0] rd_addr;
	reg  [`WIDTH:0] wr_addr;
	reg  [3:0] count;
	assign  full  = (rd_addr[`WIDTH] ^ wr_addr[`WIDTH]) & (rd_addr[`WIDTH-1:0]==wr_addr[`WIDTH-1:0]);
	assign	empty = (rd_addr == wr_addr);
	// assign	full  = (count == 4'd8) ? 1'b1 :1'b0;
	// assign	empty = (count == 4'd0) ? 1'b1 :1'b0;
	always @(posedge clk ) begin
		if(rst) begin
			rd_addr <= 4'b0;
			// count <= 4'd0;
		end
		else if(re & ~empty ) begin
			rd_addr <= rd_addr +1'b1;
			// count <= count -1'b1;			
		end

	end


	always @(posedge clk ) begin
		if(rst) begin
			wr_addr <= 4'b0;
			// count	<= 4'b0;
		end
	
		else if((we & ~full)|(we & re & full)) begin
			wr_addr <= wr_addr +1'b1;
			// count <= count +1'b1;
		end
	
	end

	assign r_adr = rd_addr[`WIDTH-1:0];
	assign w_adr = wr_addr[`WIDTH-1:0];

endmodule