/*
//Copyright 2021 S SIVA PRASAD ssprasad12a@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

`timescale 1ns / 1ps


module wishbone2apb(
    input            wb_clk_i,
    input            wb_rst_i,
    input            wbs_stb_i,
    input            wbs_cyc_i,
    input            wbs_we_i,
    input [3:0]      wbs_sel_i,
    input [31:0]     wbs_dat_i,
    input [31:0]     wbs_adr_i,
    
    output           wbs_ack_o,
    output [31:0]    wbs_dat_o,
    
    output   [31:0]  s_apb_addr  ,
    output           s_apb_sel   ,
    output           s_apb_write ,
    output           s_apb_ena   ,
    output   [31:0]  s_apb_wdata ,
    output   [3:0]   s_apb_pstb  ,
    
    input    [31:0]  s_apb_rdata ,
    input            s_apb_rready
    
    );
    
    assign s_apb_addr  = wbs_adr_i;
    assign s_apb_write = wbs_we_i;
    assign s_apb_pstb  = wbs_sel_i;
    assign s_apb_wdata = wbs_dat_i;
    assign wbs_dat_o   = s_apb_rdata;
    
    wire   valid;
    assign valid = wbs_stb_i && wbs_cyc_i;
    assign s_apb_sel = valid;
    
    reg penable;
    assign wbs_ack_o = penable;
    assign s_apb_ena = penable;
    
    always @(posedge wb_clk_i ) begin
        if(wb_rst_i) begin
            penable <= 1'b0;
        end else begin
            penable <= valid ? !penable ? 1'b1 : 1'b0 : 1'b0;
        end
    
    
    
    end
    
    
    
    
    
    
    
endmodule
