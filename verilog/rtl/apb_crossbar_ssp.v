
/*
//Copyright 2021 S SIVA PRASAD ssprasad12a@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/


`timescale 1ns / 1ps

module apb_crossbar(

input   [31:0]  s_apb_addr  ,
input           s_apb_sel   ,
input           s_apb_write ,
input           s_apb_ena   ,
input   [31:0]  s_apb_wdata ,
output  [31:0]  s_apb_rdata ,
input   [3:0]   s_apb_pstb  ,
output          s_apb_rready,

output   [31:0] m0_apb_addr  ,  // UART
output          m0_apb_sel   ,
output          m0_apb_write ,
output          m0_apb_ena   ,
output   [31:0] m0_apb_wdata ,
input    [31:0] m0_apb_rdata ,
output   [3:0]  m0_apb_pstb  ,
input           m0_apb_rready,

output   [31:0] m1_apb_addr  , // SPI
output          m1_apb_sel   ,
output          m1_apb_write ,
output          m1_apb_ena   ,
output   [31:0] m1_apb_wdata ,
input    [31:0] m1_apb_rdata ,
output   [3:0]  m1_apb_pstb  ,
input           m1_apb_rready,

output   [31:0] m2_apb_addr  , // I2C
output          m2_apb_sel   ,
output          m2_apb_write ,
output          m2_apb_ena   ,
output   [31:0] m2_apb_wdata ,
input    [31:0] m2_apb_rdata ,
output   [3:0]  m2_apb_pstb  ,
input           m2_apb_rready,


output   [31:0] m3_apb_addr  , // PWM
output          m3_apb_sel   ,
output          m3_apb_write ,
output          m3_apb_ena   ,
output   [31:0] m3_apb_wdata ,
input    [31:0] m3_apb_rdata ,
output   [3:0]  m3_apb_pstb  ,
input           m3_apb_rready,


output   [31:0] m4_apb_addr  , //LEDCNTRL
output          m4_apb_sel   ,
output          m4_apb_write ,
output          m4_apb_ena   ,
output   [31:0] m4_apb_wdata ,
input    [31:0] m4_apb_rdata ,
output   [3:0]  m4_apb_pstb  ,
input           m4_apb_rready,



output   [31:0] m5_apb_addr  , //GPIO
output          m5_apb_sel   ,
output          m5_apb_write ,
output          m5_apb_ena   ,
output   [31:0] m5_apb_wdata ,
input    [31:0] m5_apb_rdata ,
output   [3:0]  m5_apb_pstb  ,
input           m5_apb_rready,


output   [31:0] m6_apb_addr  , //TIMER
output          m6_apb_sel   ,
output          m6_apb_write ,
output          m6_apb_ena   ,
output   [31:0] m6_apb_wdata ,
input    [31:0] m6_apb_rdata ,
output   [3:0]  m6_apb_pstb  ,
input           m6_apb_rready,

output   [31:0] m7_apb_addr  , //I2S
output          m7_apb_sel   ,
output          m7_apb_write ,
output          m7_apb_ena   ,
output   [31:0] m7_apb_wdata ,
input    [31:0] m7_apb_rdata ,
output   [3:0]  m7_apb_pstb  ,
input           m7_apb_rready,

output   [31:0] m8_apb_addr  , // DIRCNTRL
output          m8_apb_sel   ,
output          m8_apb_write ,
output          m8_apb_ena   ,
output   [31:0] m8_apb_wdata ,
input    [31:0] m8_apb_rdata ,
output   [3:0]  m8_apb_pstb  ,
input           m8_apb_rready,

output   [31:0] m9_apb_addr  , // DIRCNTRL
output          m9_apb_sel   ,
output          m9_apb_write ,
output          m9_apb_ena   ,
output   [31:0] m9_apb_wdata ,
input    [31:0] m9_apb_rdata ,
output   [3:0]  m9_apb_pstb  ,
input           m9_apb_rready,

output   [31:0] m10_apb_addr  , // AES
output          m10_apb_sel   ,
output          m10_apb_write ,
output          m10_apb_ena   ,
output   [31:0] m10_apb_wdata ,
input    [31:0] m10_apb_rdata ,
output   [3:0]  m10_apb_pstb  ,
input           m10_apb_rready

);
    


wire [10:0]  w_apb_sel    ; 


assign w_apb_sel[0]  = (s_apb_addr >=  32'h3000_0000) && (s_apb_addr <= 32'h3000_FFFF) && s_apb_sel;   // UART 
assign w_apb_sel[1]  = (s_apb_addr >=  32'h3001_0000) && (s_apb_addr <= 32'h3001_FFFF) && s_apb_sel;   // SPI
assign w_apb_sel[2]  = (s_apb_addr >=  32'h3002_0000) && (s_apb_addr <= 32'h3002_FFFF) && s_apb_sel;   // I2C
assign w_apb_sel[3]  = (s_apb_addr >=  32'h3003_0000) && (s_apb_addr <= 32'h3003_FFFF) && s_apb_sel;   // PWM
assign w_apb_sel[4]  = (s_apb_addr >=  32'h3004_0000) && (s_apb_addr <= 32'h3004_FFFF) && s_apb_sel;   // LEDCNTL
assign w_apb_sel[5]  = (s_apb_addr >=  32'h3005_0000) && (s_apb_addr <= 32'h3005_FFFF) && s_apb_sel;   // GPIO
assign w_apb_sel[6]  = (s_apb_addr >=  32'h3006_0000) && (s_apb_addr <= 32'h3006_FFFF) && s_apb_sel;   // TIMER
assign w_apb_sel[7]  = (s_apb_addr >=  32'h3007_0000) && (s_apb_addr <= 32'h3007_FFFF) && s_apb_sel;   // I2S
assign w_apb_sel[8]  = (s_apb_addr >=  32'h3008_0000) && (s_apb_addr <= 32'h3008_FFFF) && s_apb_sel;   // DIRCTRL
assign w_apb_sel[9]  = (s_apb_addr >=  32'h3009_0000) && (s_apb_addr <= 32'h3009_FFFF) && s_apb_sel;   // JTAG
assign w_apb_sel[10]  = (s_apb_addr >=  32'h300A_0000) && (s_apb_addr <= 32'h300A_FFFF) && s_apb_sel;  // QSPI



assign s_apb_rdata  = (s_apb_addr >=  32'h3000_0000) && (s_apb_addr <= 32'h3000_FFFF) ? m0_apb_rdata :
                      (s_apb_addr >=  32'h3001_0000) && (s_apb_addr <= 32'h3001_FFFF) ? m1_apb_rdata :
                      (s_apb_addr >=  32'h3002_0000) && (s_apb_addr <= 32'h3002_FFFF) ? m2_apb_rdata :
                      (s_apb_addr >=  32'h3003_0000) && (s_apb_addr <= 32'h3003_FFFF) ? m3_apb_rdata :
                      (s_apb_addr >=  32'h3004_0000) && (s_apb_addr <= 32'h3004_FFFF) ? m4_apb_rdata :
                      (s_apb_addr >=  32'h3005_0000) && (s_apb_addr <= 32'h3005_FFFF) ? m5_apb_rdata :
                      (s_apb_addr >=  32'h3006_0000) && (s_apb_addr <= 32'h3006_FFFF) ? m6_apb_rdata : 
                      (s_apb_addr >=  32'h3007_0000) && (s_apb_addr <= 32'h3007_FFFF) ? m7_apb_rdata :
                      (s_apb_addr >=  32'h3008_0000) && (s_apb_addr <= 32'h3008_FFFF) ? m8_apb_rdata : 
                      (s_apb_addr >=  32'h3009_0000) && (s_apb_addr <= 32'h3009_FFFF) ? m9_apb_rdata :
                      (s_apb_addr >=  32'h300A_0000) && (s_apb_addr <= 32'h300A_FFFF) ? m10_apb_rdata : 32'h0000_0000;

                      
  
assign  m0_apb_pstb  = s_apb_pstb;
assign  m1_apb_pstb  = s_apb_pstb;
assign  m2_apb_pstb  = s_apb_pstb;
assign  m3_apb_pstb  = s_apb_pstb;
assign  m4_apb_pstb  = s_apb_pstb;
assign  m5_apb_pstb  = s_apb_pstb;
assign  m6_apb_pstb  = s_apb_pstb;
assign  m7_apb_pstb  = s_apb_pstb;
assign  m8_apb_pstb  = s_apb_pstb;
assign  m9_apb_pstb  = s_apb_pstb;
assign  m10_apb_pstb  = s_apb_pstb;

assign  m0_apb_addr  = s_apb_addr;
assign  m1_apb_addr  = s_apb_addr;
assign  m2_apb_addr  = s_apb_addr;
assign  m3_apb_addr  = s_apb_addr;
assign  m4_apb_addr  = s_apb_addr;
assign  m5_apb_addr  = s_apb_addr;
assign  m6_apb_addr  = s_apb_addr;
assign  m7_apb_addr  = s_apb_addr;
assign  m8_apb_addr  = s_apb_addr;
assign  m9_apb_addr  = s_apb_addr;
assign  m10_apb_addr  = s_apb_addr;

assign  m0_apb_wdata  = s_apb_wdata;
assign  m1_apb_wdata  = s_apb_wdata;
assign  m2_apb_wdata  = s_apb_wdata;
assign  m3_apb_wdata  = s_apb_wdata;
assign  m4_apb_wdata  = s_apb_wdata;
assign  m5_apb_wdata  = s_apb_wdata;
assign  m6_apb_wdata  = s_apb_wdata;
assign  m7_apb_wdata  = s_apb_wdata;
assign  m8_apb_wdata  = s_apb_wdata;
assign  m9_apb_wdata  = s_apb_wdata;
assign  m10_apb_wdata  = s_apb_wdata;

assign  m0_apb_write  = s_apb_write;
assign  m1_apb_write  = s_apb_write;
assign  m2_apb_write  = s_apb_write;
assign  m3_apb_write  = s_apb_write;
assign  m4_apb_write  = s_apb_write;
assign  m5_apb_write  = s_apb_write;
assign  m6_apb_write  = s_apb_write;
assign  m7_apb_write  = s_apb_write;
assign  m8_apb_write  = s_apb_write;
assign  m9_apb_write  = s_apb_write;
assign  m10_apb_write  = s_apb_write;

assign  m0_apb_ena  = s_apb_ena;
assign  m1_apb_ena  = s_apb_ena;
assign  m2_apb_ena  = s_apb_ena;
assign  m3_apb_ena  = s_apb_ena;
assign  m4_apb_ena  = s_apb_ena;
assign  m5_apb_ena  = s_apb_ena;
assign  m6_apb_ena  = s_apb_ena;
assign  m7_apb_ena  = s_apb_ena;
assign  m8_apb_ena  = s_apb_ena;
assign  m9_apb_ena  = s_apb_ena;
assign  m10_apb_ena  = s_apb_ena;

assign  m0_apb_sel  = w_apb_sel[0];
assign  m1_apb_sel  = w_apb_sel[1];
assign  m2_apb_sel  = w_apb_sel[2];
assign  m3_apb_sel  = w_apb_sel[3];
assign  m4_apb_sel  = w_apb_sel[4];
assign  m5_apb_sel  = w_apb_sel[5];
assign  m6_apb_sel  = w_apb_sel[6];
assign  m7_apb_sel  = w_apb_sel[7];
assign  m8_apb_sel  = w_apb_sel[8];
assign  m9_apb_sel  = w_apb_sel[9];
assign  m10_apb_sel  = w_apb_sel[10];

assign s_apb_rready = 1'b1;




    
    
    
    
    
    
endmodule
