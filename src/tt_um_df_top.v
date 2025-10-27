// Copyright 2025 Gregor Flachs
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE−2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

`include "df_digital_filter.v"

module tt_um_df_top
	(
	    input  wire [7:0] ui_in,    // Dedicated inputs
    	output wire [7:0] uo_out,   // Dedicated outputs
    	input  wire [7:0] uio_in,   // IOs: Input path
    	output wire [7:0] uio_out,  // IOs: Output path
    	output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    	input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    	input  wire       clk,      // clock
    	input  wire       rst_n     // reset_n - low to reset
	);
	
	wire [7:0] dataout;
	
	df_digital_filter digital_filter_inst(
		.CLK(clk),
		.nRST(rst_n),
		.enconfig(uio_in[3]),
		.configin(uio_in[2:0]),
		.datain(ui_in),
		.dataout(dataout)
	);
	
	assign uo_out = dataout;
	assign uio_out[7:0] = 8'b0;
	assign uio_oe = 8'b0000_0000;
	
	wire _unused = &{uio_in[7:4], ena, 1'b0};
endmodule
