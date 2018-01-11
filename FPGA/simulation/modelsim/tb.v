`timescale 1ns/1ns

`define CLK_CYCLE 16.67	// ns
`define FINISH_COUNT 1000	// cycle

module tb();

reg clk;
reg nRst;

initial clk = 1'b0;
always #(`CLK_CYCLE / 2) clk = ~clk;

reg [15:0] timeCounter;
initial timeCounter = 16'h0;

always @(posedge clk)
 begin
	timeCounter <= timeCounter + 16'h1;
 end

always @*
 begin
	if(timeCounter < 10)
	 begin
		nRst <= 1'b0;
	 end
	else
	 begin
		nRst <= 1'b1;
	 end

	if(timeCounter == `FINISH_COUNT)
	 begin
		$stop;
	 end
 end




reg [9:0] addr;
reg [31:0] dataBus;
reg [3:0] wr;

wire [31:0] dataBusWire;
assign dataBusWire = dataBus;

initial
 begin

	wr = 4'b0000;

 end

always @(posedge clk)
 begin

	if(timeCounter < 20)
	 begin
		addr <= 10'd0;
		dataBus <= 32'h0000_0000; // 1
	 end
	else if(timeCounter < 22)
	 begin
		addr <= 10'd4;
		dataBus <= 32'h3FF0_0000; // 1
	 end
	else if(timeCounter < 24)
	 begin
		addr <= 10'd8;
		dataBus <= 32'h0000_0000; // 1
	 end
	else if(timeCounter < 26)
	 begin
		addr <= 10'd12;
		dataBus <= 32'h3FF0_0000; // 1
	 end

 end

MagSimulator target
(
	.nReset(nRst),

	.BCLK(clk),
	.Address(addr),
	.nCS(1'b0),
	.nRD(1'b1),
	.nWR(wr),
	.Data(dataBusWire),
	
	.LED()
);

endmodule