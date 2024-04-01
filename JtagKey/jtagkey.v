`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:       Weijie Gao <hackpascal@gmail.com>
//
// Create Date:    21:36:54 03/23/2020
// Design Name:
// Module Name:    jtagkey
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
module jtagkey(
	input wire FT_JTAG_OE,
	input wire FT_TDI,
	output wire FT_TDO,
	input wire FT_TCK,
	input wire FT_TMS,
	output wire FT_RTCK,
	input wire FT_DBGRQ,
	output wire FT_DBGACK,
	input wire FT_nTRST_OE,
	input wire FT_nTRST_OUT,
	output wire FT_nSRST_IN,
	input wire FT_nSRST_OE,
	input wire FT_nSRST_OUT,
	output wire FT_TARGET_PRESENT,
	output wire TDI,
	input wire TDO,
	output wire TMS,
	output wire TCK,
	input wire RTCK,
	input wire DBGACK,
	output wire DBGRQ,
	output wire nTRST,
	inout wire nSRST,
	input wire TARGET_PRESENT
);

	assign TDI = (FT_JTAG_OE == 1'b0) ? FT_TDI : 1'bZ;
	assign TMS = (FT_JTAG_OE == 1'b0) ? FT_TMS : 1'bZ;
	assign TCK = (FT_JTAG_OE == 1'b0) ? FT_TCK : 1'bZ;
	assign DBGRQ = (FT_JTAG_OE == 1'b0) ? FT_DBGRQ : 1'bZ;

	assign FT_nSRST_IN = nSRST;
	assign nSRST = (FT_nSRST_OE == 1'b0) ? FT_nSRST_OUT : 1'bZ;

	assign nTRST = (FT_nTRST_OE == 1'b0) ? FT_nTRST_OUT : 1'bZ;

	assign FT_RTCK = RTCK;
	assign FT_TDO = TDO;
	assign FT_DBGACK = DBGACK;
	assign FT_TARGET_PRESENT = TARGET_PRESENT;

endmodule
