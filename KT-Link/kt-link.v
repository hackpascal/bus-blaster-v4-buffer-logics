`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:       Weijie Gao <hackpascal@gmail.com>
// 
// Create Date:    21:36:54 03/23/2020
// Design Name:
// Module Name:    kt-link
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module ktlink(
	input wire FT_TCK_OE, // ACBUS6, PU
	input wire FT_TDI_OE, // ACBUS5, PU
	input wire FT_nTRST_OE, // ACBUS2, PU
	input wire FT_nSRST_OE, // ACBUS3, PU
	input wire FT_TMS_OE, // ACBUS4, PU
	input wire FT_SWD_EN, // ADBUS5, PU
	input wire FT_TDI,
	output wire FT_TDO,
	input wire FT_TCK,
	input wire FT_TMS,
	output wire FT_RTCK,
	input wire FT_nTRST_OUT,
	output wire FT_nSRST_IN,
	input wire FT_nSRST_OUT,
	input wire FT_LED_OUT,
	output wire FT_RX,

	output wire TDI,
	input wire TDO,
	inout wire TMS,
	output wire TCK,
	input wire RTCK,
	output wire nTRST,
	inout wire nSRST,

	output wire LED
);

	assign	TCK = (FT_TCK_OE == 1'b0) ? FT_TCK : 1'bz;
	assign	TDI = (FT_TDI_OE == 1'b0) ? FT_TDI : 1'bZ;
	assign	nTRST = (FT_nTRST_OE == 1'b0) ? FT_nTRST_OUT : 1'bZ;
	assign	FT_RTCK = RTCK;

	assign	FT_nSRST_IN = nSRST;
	assign	nSRST = (FT_nSRST_OE == 1'b0) ? FT_nSRST_OUT : 1'bZ;

	assign LED = ~FT_LED_OUT;

	reg TMS_OUT_SEL;
	reg TDO_IN_SEL;
	reg FT_RX_VAL;

	always @(*) begin
		if (FT_SWD_EN) begin
			TMS_OUT_SEL = FT_TMS;
			TDO_IN_SEL = TDO;
			FT_RX_VAL = 1'b1;
		end
		else begin
			TMS_OUT_SEL = FT_TDI;
			TDO_IN_SEL = TMS;
			FT_RX_VAL = TDO;
		end
	end

	assign TMS = (FT_TMS_OE == 1'b0) ? TMS_OUT_SEL : 1'bZ;
	assign FT_TDO = TDO_IN_SEL;
	assign FT_RX = FT_RX_VAL;

endmodule
