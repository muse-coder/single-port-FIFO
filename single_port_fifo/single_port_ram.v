`include "param_define.v"

module single_port_ram (
	input clk,
	input rst,
	input ena,
	input wea,
	input	[31:0]	din,
	input	[`WIDTH-2:0] addr,
	output reg [31:0]	dout,
	output reg read_valid
);
	parameter  num = 32'b1<<`WIDTH;
	reg [31:0] ram[num-1:0];
	integer i;
	always @(posedge clk ) begin
		if(rst) begin
			for (i = 0;i<num ;i=i+1 ) begin
				ram[i] <= 32'b0;
			end
			dout <= 32'b0;			
			read_valid <=1'b0;
		end

		else if (ena && wea) begin
			ram[addr] <= din;
			read_valid <= 1'b0;
		end 

		else if (ena && ~wea) begin
			dout <= ram[addr];
			read_valid <=1'b1;
		end

		else
			read_valid <=1'b0;
	end
	

endmodule