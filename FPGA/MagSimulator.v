module MagSimulator(
	input  wire nReset,

	input  wire BCLK,
	input  wire [9:0] Address,
	input  wire nCS,
	input  wire nRD,
	input  wire [3:0] nWR,
	inout  wire [31:0] Data,
	
	output wire [2:0] LED
);

integer i;

wire innerClk;
PLL pll(
	.inclk0(BCLK),
	.c0(innerClk));


reg [31:0] DataReg [0:7];
reg [31:0] ResultsReg [0:1];

wire [2:0] actualAddr;
assign actualAddr = (Address >> 2);
assign Data = (~nCS) & (~nRD) ? ResultsReg[actualAddr] : 32'bz;

always @(posedge BCLK or negedge nReset)
 begin
 
	if(~nReset)
	 begin
	 
		for(i = 0; i <= 7; i = i + 1)
		 DataReg[i] <= 32'h00000000;
	 
	 end
	else
	 begin
	 
		if(~nWR[0])
		 DataReg[actualAddr][7:0] <= Data[7:0];
		
		if(~nWR[1])
		 DataReg[actualAddr][15:8] <= Data[15:8];
		 
		if(~nWR[2])
		 DataReg[actualAddr][23:16] <= Data[23:16];
		 
		if(~nWR[3])
		 DataReg[actualAddr][31:24] <= Data[31:24];
	 
	 end
 
 end



wire [63:0] mult_result;

MULT mult_inst (
		.clk    (innerClk),
		.areset (res_n),
		.a      (64'h4019_21FB_5444_2D18),
		.b      ({DataReg[1], DataReg[0]}),
		.q      (mult_result)
	);

DIV div_inst (
		.clk    (innerClk),
		.areset (res_n),
		.a      ({DataReg[3], DataReg[2]}),
		.b      (mult_result),
		.q      ()
	);


endmodule
