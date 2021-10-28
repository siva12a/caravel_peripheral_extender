/*
//Copyright 2021 S SIVA PRASAD ssprasad12a@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

module FIFO_spi( // @[:@3.2]
  input  [16:0] io_dataIn, // @[:@4.4]
  input         io_writeEn, // @[:@4.4]
  input         io_writeClk, // @[:@4.4]
  output        io_full, // @[:@4.4]
  output [4:0]  io_writePtr, // @[:@4.4]
  output [16:0] io_dataOut, // @[:@4.4]
  input         io_readEn, // @[:@4.4]
  input         io_readClk, // @[:@4.4]
  output        io_empty, // @[:@4.4]
  input         io_systemRst // @[:@4.4]
);
  reg [16:0] ram [0:15]; // @[fifo.scala 27:24:@6.4]
  reg [31:0] _RAND_0;
  wire [16:0] ram__T_98_data; // @[fifo.scala 27:24:@6.4]
  wire [3:0] ram__T_98_addr; // @[fifo.scala 27:24:@6.4]
  wire [16:0] ram__T_62_data; // @[fifo.scala 27:24:@6.4]
  wire [3:0] ram__T_62_addr; // @[fifo.scala 27:24:@6.4]
  wire  ram__T_62_mask; // @[fifo.scala 27:24:@6.4]
  wire  ram__T_62_en; // @[fifo.scala 27:24:@6.4]
  reg [4:0] _T_29; // @[fifo.scala 33:33:@9.4]
  reg [31:0] _RAND_1;
  reg [4:0] writeToReadPtr; // @[fifo.scala 35:31:@11.4]
  reg [31:0] _RAND_2;
  reg  _T_39; // @[fifo.scala 37:25:@13.4]
  reg [31:0] _RAND_3;
  reg [4:0] _T_43; // @[fifo.scala 39:36:@15.4]
  reg [31:0] _RAND_4;
  reg [4:0] _T_45; // @[fifo.scala 40:36:@17.4]
  reg [31:0] _RAND_5;
  wire  _T_47; // @[fifo.scala 43:59:@20.4]
  wire  _T_48; // @[fifo.scala 43:56:@21.4]
  wire [4:0] _GEN_15; // @[fifo.scala 43:42:@22.4]
  wire [5:0] _T_49; // @[fifo.scala 43:42:@22.4]
  wire [4:0] _T_50; // @[fifo.scala 43:42:@23.4]
  wire [3:0] _T_51; // @[fifo.scala 45:45:@26.4]
  wire [4:0] _GEN_16; // @[fifo.scala 45:51:@27.4]
  wire [4:0] _T_52; // @[fifo.scala 45:51:@27.4]
  wire [1:0] _T_53; // @[fifo.scala 48:62:@31.4]
  wire [1:0] _T_54; // @[fifo.scala 48:44:@32.4]
  wire [2:0] _T_55; // @[fifo.scala 48:99:@33.4]
  wire [4:0] _T_56; // @[Cat.scala 30:58:@34.4]
  wire  _T_57; // @[fifo.scala 48:36:@35.4]
  reg [4:0] _T_65; // @[fifo.scala 59:32:@46.4]
  reg [31:0] _RAND_6;
  reg [4:0] readToWritePtr; // @[fifo.scala 61:30:@48.4]
  reg [31:0] _RAND_7;
  reg  _T_75; // @[fifo.scala 63:26:@50.4]
  reg [31:0] _RAND_8;
  reg [4:0] _T_79; // @[fifo.scala 65:37:@52.4]
  reg [31:0] _RAND_9;
  reg [4:0] _T_81; // @[fifo.scala 66:37:@54.4]
  reg [31:0] _RAND_10;
  wire  _T_83; // @[fifo.scala 68:56:@57.4]
  wire  _T_84; // @[fifo.scala 68:53:@58.4]
  wire [4:0] _GEN_17; // @[fifo.scala 68:40:@59.4]
  wire [5:0] _T_85; // @[fifo.scala 68:40:@59.4]
  wire [4:0] _T_86; // @[fifo.scala 68:40:@60.4]
  wire [3:0] _T_87; // @[fifo.scala 70:43:@63.4]
  wire [4:0] _GEN_18; // @[fifo.scala 70:49:@64.4]
  wire [4:0] _T_88; // @[fifo.scala 70:49:@64.4]
  wire  _T_89; // @[fifo.scala 73:36:@68.4]
  wire [3:0] _T_90; // @[fifo.scala 76:41:@71.4]
  wire  _GEN_6; // @[fifo.scala 76:27:@75.4]
  reg [3:0] ram__T_98_addr_pipe_0;
  reg [31:0] _RAND_11;
  assign ram__T_98_addr = ram__T_98_addr_pipe_0;
  assign ram__T_98_data = ram[ram__T_98_addr]; // @[fifo.scala 27:24:@6.4]
  assign ram__T_62_data = io_dataIn;
  assign ram__T_62_addr = _T_29[3:0];
  assign ram__T_62_mask = 1'h1;
  assign ram__T_62_en = io_writeEn & _T_47;
  assign _T_47 = _T_39 == 1'h0; // @[fifo.scala 43:59:@20.4]
  assign _T_48 = io_writeEn & _T_47; // @[fifo.scala 43:56:@21.4]
  assign _GEN_15 = {{4'd0}, _T_48}; // @[fifo.scala 43:42:@22.4]
  assign _T_49 = _T_29 + _GEN_15; // @[fifo.scala 43:42:@22.4]
  assign _T_50 = _T_49[4:0]; // @[fifo.scala 43:42:@23.4]
  assign _T_51 = _T_50[4:1]; // @[fifo.scala 45:45:@26.4]
  assign _GEN_16 = {{1'd0}, _T_51}; // @[fifo.scala 45:51:@27.4]
  assign _T_52 = _GEN_16 ^ _T_50; // @[fifo.scala 45:51:@27.4]
  assign _T_53 = _T_45[4:3]; // @[fifo.scala 48:62:@31.4]
  assign _T_54 = ~ _T_53; // @[fifo.scala 48:44:@32.4]
  assign _T_55 = _T_45[2:0]; // @[fifo.scala 48:99:@33.4]
  assign _T_56 = {_T_54,_T_55}; // @[Cat.scala 30:58:@34.4]
  assign _T_57 = _T_52 == _T_56; // @[fifo.scala 48:36:@35.4]
  assign _T_83 = _T_75 == 1'h0; // @[fifo.scala 68:56:@57.4]
  assign _T_84 = io_readEn & _T_83; // @[fifo.scala 68:53:@58.4]
  assign _GEN_17 = {{4'd0}, _T_84}; // @[fifo.scala 68:40:@59.4]
  assign _T_85 = _T_65 + _GEN_17; // @[fifo.scala 68:40:@59.4]
  assign _T_86 = _T_85[4:0]; // @[fifo.scala 68:40:@60.4]
  assign _T_87 = _T_86[4:1]; // @[fifo.scala 70:43:@63.4]
  assign _GEN_18 = {{1'd0}, _T_87}; // @[fifo.scala 70:49:@64.4]
  assign _T_88 = _GEN_18 ^ _T_86; // @[fifo.scala 70:49:@64.4]
  assign _T_89 = _T_88 == _T_81; // @[fifo.scala 73:36:@68.4]
  assign _T_90 = _T_65[3:0]; // @[fifo.scala 76:41:@71.4]
  assign _GEN_6 = _T_83; // @[fifo.scala 76:27:@75.4]
  assign io_full = _T_39; // @[fifo.scala 55:13:@45.4]
  assign io_writePtr = _T_29; // @[fifo.scala 42:17:@19.4]
  assign io_dataOut = ram__T_98_data; // @[fifo.scala 76:16:@81.4]
  assign io_empty = _T_75; // @[fifo.scala 77:14:@82.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[16:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_29 = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  writeToReadPtr = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_39 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_43 = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_45 = _RAND_5[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_65 = _RAND_6[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  readToWritePtr = _RAND_7[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_75 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_79 = _RAND_9[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_81 = _RAND_10[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  ram__T_98_addr_pipe_0 = _RAND_11[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge io_writeClk) begin
    if(ram__T_62_en & ram__T_62_mask) begin
      ram[ram__T_62_addr] <= ram__T_62_data; // @[fifo.scala 27:24:@6.4]
    end
    if (io_systemRst) begin
      _T_29 <= 5'h0;
    end else begin
      _T_29 <= _T_50;
    end
    if (io_systemRst) begin
      writeToReadPtr <= 5'h0;
    end else begin
      writeToReadPtr <= _T_52;
    end
    if (io_systemRst) begin
      _T_39 <= 1'h0;
    end else begin
      _T_39 <= _T_57;
    end
    _T_43 <= readToWritePtr;
    _T_45 <= _T_43;
  end
  always @(posedge io_readClk) begin
    if (io_systemRst) begin
      _T_65 <= 5'h0;
    end else begin
      _T_65 <= _T_86;
    end
    if (io_systemRst) begin
      readToWritePtr <= 5'h0;
    end else begin
      readToWritePtr <= _T_88;
    end
    if (io_systemRst) begin
      _T_75 <= 1'h1;
    end else begin
      _T_75 <= _T_89;
    end
    _T_79 <= writeToReadPtr;
    _T_81 <= _T_79;
    if (_GEN_6) begin
      ram__T_98_addr_pipe_0 <= _T_90;
    end
  end
endmodule
module FIFO_1_spi( // @[:@84.2]
  input  [7:0] io_dataIn, // @[:@85.4]
  input        io_writeEn, // @[:@85.4]
  input        io_writeClk, // @[:@85.4]
  output       io_full, // @[:@85.4]
  output [4:0] io_writePtr, // @[:@85.4]
  output [7:0] io_dataOut, // @[:@85.4]
  input        io_readEn, // @[:@85.4]
  input        io_readClk, // @[:@85.4]
  output       io_empty, // @[:@85.4]
  input        io_systemRst // @[:@85.4]
);
  reg [7:0] ram [0:15]; // @[fifo.scala 27:24:@87.4]
  reg [31:0] _RAND_0;
  wire [7:0] ram__T_98_data; // @[fifo.scala 27:24:@87.4]
  wire [3:0] ram__T_98_addr; // @[fifo.scala 27:24:@87.4]
  wire [7:0] ram__T_62_data; // @[fifo.scala 27:24:@87.4]
  wire [3:0] ram__T_62_addr; // @[fifo.scala 27:24:@87.4]
  wire  ram__T_62_mask; // @[fifo.scala 27:24:@87.4]
  wire  ram__T_62_en; // @[fifo.scala 27:24:@87.4]
  reg [4:0] _T_29; // @[fifo.scala 33:33:@90.4]
  reg [31:0] _RAND_1;
  reg [4:0] writeToReadPtr; // @[fifo.scala 35:31:@92.4]
  reg [31:0] _RAND_2;
  reg  _T_39; // @[fifo.scala 37:25:@94.4]
  reg [31:0] _RAND_3;
  reg [4:0] _T_43; // @[fifo.scala 39:36:@96.4]
  reg [31:0] _RAND_4;
  reg [4:0] _T_45; // @[fifo.scala 40:36:@98.4]
  reg [31:0] _RAND_5;
  wire  _T_47; // @[fifo.scala 43:59:@101.4]
  wire  _T_48; // @[fifo.scala 43:56:@102.4]
  wire [4:0] _GEN_15; // @[fifo.scala 43:42:@103.4]
  wire [5:0] _T_49; // @[fifo.scala 43:42:@103.4]
  wire [4:0] _T_50; // @[fifo.scala 43:42:@104.4]
  wire [3:0] _T_51; // @[fifo.scala 45:45:@107.4]
  wire [4:0] _GEN_16; // @[fifo.scala 45:51:@108.4]
  wire [4:0] _T_52; // @[fifo.scala 45:51:@108.4]
  wire [1:0] _T_53; // @[fifo.scala 48:62:@112.4]
  wire [1:0] _T_54; // @[fifo.scala 48:44:@113.4]
  wire [2:0] _T_55; // @[fifo.scala 48:99:@114.4]
  wire [4:0] _T_56; // @[Cat.scala 30:58:@115.4]
  wire  _T_57; // @[fifo.scala 48:36:@116.4]
  reg [4:0] _T_65; // @[fifo.scala 59:32:@127.4]
  reg [31:0] _RAND_6;
  reg [4:0] readToWritePtr; // @[fifo.scala 61:30:@129.4]
  reg [31:0] _RAND_7;
  reg  _T_75; // @[fifo.scala 63:26:@131.4]
  reg [31:0] _RAND_8;
  reg [4:0] _T_79; // @[fifo.scala 65:37:@133.4]
  reg [31:0] _RAND_9;
  reg [4:0] _T_81; // @[fifo.scala 66:37:@135.4]
  reg [31:0] _RAND_10;
  wire  _T_83; // @[fifo.scala 68:56:@138.4]
  wire  _T_84; // @[fifo.scala 68:53:@139.4]
  wire [4:0] _GEN_17; // @[fifo.scala 68:40:@140.4]
  wire [5:0] _T_85; // @[fifo.scala 68:40:@140.4]
  wire [4:0] _T_86; // @[fifo.scala 68:40:@141.4]
  wire [3:0] _T_87; // @[fifo.scala 70:43:@144.4]
  wire [4:0] _GEN_18; // @[fifo.scala 70:49:@145.4]
  wire [4:0] _T_88; // @[fifo.scala 70:49:@145.4]
  wire  _T_89; // @[fifo.scala 73:36:@149.4]
  wire [3:0] _T_90; // @[fifo.scala 76:41:@152.4]
  wire  _GEN_6; // @[fifo.scala 76:27:@156.4]
  reg [3:0] ram__T_98_addr_pipe_0;
  reg [31:0] _RAND_11;
  assign ram__T_98_addr = ram__T_98_addr_pipe_0;
  assign ram__T_98_data = ram[ram__T_98_addr]; // @[fifo.scala 27:24:@87.4]
  assign ram__T_62_data = io_dataIn;
  assign ram__T_62_addr = _T_29[3:0];
  assign ram__T_62_mask = 1'h1;
  assign ram__T_62_en = io_writeEn & _T_47;
  assign _T_47 = _T_39 == 1'h0; // @[fifo.scala 43:59:@101.4]
  assign _T_48 = io_writeEn & _T_47; // @[fifo.scala 43:56:@102.4]
  assign _GEN_15 = {{4'd0}, _T_48}; // @[fifo.scala 43:42:@103.4]
  assign _T_49 = _T_29 + _GEN_15; // @[fifo.scala 43:42:@103.4]
  assign _T_50 = _T_49[4:0]; // @[fifo.scala 43:42:@104.4]
  assign _T_51 = _T_50[4:1]; // @[fifo.scala 45:45:@107.4]
  assign _GEN_16 = {{1'd0}, _T_51}; // @[fifo.scala 45:51:@108.4]
  assign _T_52 = _GEN_16 ^ _T_50; // @[fifo.scala 45:51:@108.4]
  assign _T_53 = _T_45[4:3]; // @[fifo.scala 48:62:@112.4]
  assign _T_54 = ~ _T_53; // @[fifo.scala 48:44:@113.4]
  assign _T_55 = _T_45[2:0]; // @[fifo.scala 48:99:@114.4]
  assign _T_56 = {_T_54,_T_55}; // @[Cat.scala 30:58:@115.4]
  assign _T_57 = _T_52 == _T_56; // @[fifo.scala 48:36:@116.4]
  assign _T_83 = _T_75 == 1'h0; // @[fifo.scala 68:56:@138.4]
  assign _T_84 = io_readEn & _T_83; // @[fifo.scala 68:53:@139.4]
  assign _GEN_17 = {{4'd0}, _T_84}; // @[fifo.scala 68:40:@140.4]
  assign _T_85 = _T_65 + _GEN_17; // @[fifo.scala 68:40:@140.4]
  assign _T_86 = _T_85[4:0]; // @[fifo.scala 68:40:@141.4]
  assign _T_87 = _T_86[4:1]; // @[fifo.scala 70:43:@144.4]
  assign _GEN_18 = {{1'd0}, _T_87}; // @[fifo.scala 70:49:@145.4]
  assign _T_88 = _GEN_18 ^ _T_86; // @[fifo.scala 70:49:@145.4]
  assign _T_89 = _T_88 == _T_81; // @[fifo.scala 73:36:@149.4]
  assign _T_90 = _T_65[3:0]; // @[fifo.scala 76:41:@152.4]
  assign _GEN_6 = _T_83; // @[fifo.scala 76:27:@156.4]
  assign io_full = _T_39; // @[fifo.scala 55:13:@126.4]
  assign io_writePtr = _T_29; // @[fifo.scala 42:17:@100.4]
  assign io_dataOut = ram__T_98_data; // @[fifo.scala 76:16:@162.4]
  assign io_empty = _T_75; // @[fifo.scala 77:14:@163.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_29 = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  writeToReadPtr = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_39 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_43 = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_45 = _RAND_5[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_65 = _RAND_6[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  readToWritePtr = _RAND_7[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_75 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_79 = _RAND_9[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_81 = _RAND_10[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  ram__T_98_addr_pipe_0 = _RAND_11[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge io_writeClk) begin
    if(ram__T_62_en & ram__T_62_mask) begin
      ram[ram__T_62_addr] <= ram__T_62_data; // @[fifo.scala 27:24:@87.4]
    end
    if (io_systemRst) begin
      _T_29 <= 5'h0;
    end else begin
      _T_29 <= _T_50;
    end
    if (io_systemRst) begin
      writeToReadPtr <= 5'h0;
    end else begin
      writeToReadPtr <= _T_52;
    end
    if (io_systemRst) begin
      _T_39 <= 1'h0;
    end else begin
      _T_39 <= _T_57;
    end
    _T_43 <= readToWritePtr;
    _T_45 <= _T_43;
  end
  always @(posedge io_readClk) begin
    if (io_systemRst) begin
      _T_65 <= 5'h0;
    end else begin
      _T_65 <= _T_86;
    end
    if (io_systemRst) begin
      readToWritePtr <= 5'h0;
    end else begin
      readToWritePtr <= _T_88;
    end
    if (io_systemRst) begin
      _T_75 <= 1'h1;
    end else begin
      _T_75 <= _T_89;
    end
    _T_79 <= writeToReadPtr;
    _T_81 <= _T_79;
    if (_GEN_6) begin
      ram__T_98_addr_pipe_0 <= _T_90;
    end
  end
endmodule
module apbspi_ssp( // @[:@165.2]
  input         clock, // @[:@166.4]
  input         reset, // @[:@167.4]
  input         io_PCLK, // @[:@168.4]
  input         io_PRESETn, // @[:@168.4]
  input  [31:0] io_PADDR, // @[:@168.4]
  input         io_PPROT, // @[:@168.4]
  input         io_PSEL, // @[:@168.4]
  input         io_PENABLE, // @[:@168.4]
  input         io_PWRITE, // @[:@168.4]
  input  [31:0] io_PWDATA, // @[:@168.4]
  input  [3:0]  io_PSTRB, // @[:@168.4]
  output        io_PREADY, // @[:@168.4]
  output [31:0] io_PRDATA, // @[:@168.4]
  output        io_PSLVERR, // @[:@168.4]
  output        io_interrupt, // @[:@168.4]
  input         io_mosi_i, // @[:@168.4]
  output        io_mosi_o, // @[:@168.4]
  output        io_mosi_t, // @[:@168.4]
  input         io_miso_i, // @[:@168.4]
  output        io_miso_o, // @[:@168.4]
  output        io_miso_t, // @[:@168.4]
  output        io_spi_clk_o, // @[:@168.4]
  input         io_spi_clk_i, // @[:@168.4]
  output        io_spi_clk_t, // @[:@168.4]
  output [7:0]  io_spi_ssel_o, // @[:@168.4]
  input         io_spi_ssel_i, // @[:@168.4]
  output        io_spi_ssel_t // @[:@168.4]
);
  wire [16:0] FIFO_io_dataIn; // @[apbspi.scala 114:20:@195.4]
  wire  FIFO_io_writeEn; // @[apbspi.scala 114:20:@195.4]
  wire  FIFO_io_writeClk; // @[apbspi.scala 114:20:@195.4]
  wire  FIFO_io_full; // @[apbspi.scala 114:20:@195.4]
  wire [4:0] FIFO_io_writePtr; // @[apbspi.scala 114:20:@195.4]
  wire [16:0] FIFO_io_dataOut; // @[apbspi.scala 114:20:@195.4]
  wire  FIFO_io_readEn; // @[apbspi.scala 114:20:@195.4]
  wire  FIFO_io_readClk; // @[apbspi.scala 114:20:@195.4]
  wire  FIFO_io_empty; // @[apbspi.scala 114:20:@195.4]
  wire  FIFO_io_systemRst; // @[apbspi.scala 114:20:@195.4]
  wire [7:0] FIFO_1_io_dataIn; // @[apbspi.scala 115:20:@196.4]
  wire  FIFO_1_io_writeEn; // @[apbspi.scala 115:20:@196.4]
  wire  FIFO_1_io_writeClk; // @[apbspi.scala 115:20:@196.4]
  wire  FIFO_1_io_full; // @[apbspi.scala 115:20:@196.4]
  wire [4:0] FIFO_1_io_writePtr; // @[apbspi.scala 115:20:@196.4]
  wire [7:0] FIFO_1_io_dataOut; // @[apbspi.scala 115:20:@196.4]
  wire  FIFO_1_io_readEn; // @[apbspi.scala 115:20:@196.4]
  wire  FIFO_1_io_readClk; // @[apbspi.scala 115:20:@196.4]
  wire  FIFO_1_io_empty; // @[apbspi.scala 115:20:@196.4]
  wire  FIFO_1_io_systemRst; // @[apbspi.scala 115:20:@196.4]
  reg  interrupt_r; // @[apbspi.scala 71:26:@176.4]
  reg [31:0] _RAND_0;
  wire  _T_64; // @[apbspi.scala 79:28:@178.4]
  reg  _T_67; // @[apbspi.scala 83:21:@179.4]
  reg [31:0] _RAND_1;
  reg  _T_80; // @[apbspi.scala 94:24:@185.4]
  reg [31:0] _RAND_2;
  reg [7:0] _T_86; // @[apbspi.scala 97:25:@187.4]
  reg [31:0] _RAND_3;
  reg [31:0] _T_92; // @[apbspi.scala 104:20:@191.4]
  reg [31:0] _RAND_4;
  reg [1:0] _T_100; // @[apbspi.scala 110:22:@193.4]
  reg [31:0] _RAND_5;
  reg [16:0] _T_105; // @[apbspi.scala 118:27:@197.4]
  reg [31:0] _RAND_6;
  reg [16:0] _T_115; // @[apbspi.scala 129:27:@207.4]
  reg [31:0] _RAND_7;
  reg  _T_118; // @[apbspi.scala 130:27:@208.4]
  reg [31:0] _RAND_8;
  reg  _T_121; // @[apbspi.scala 131:27:@209.4]
  reg [31:0] _RAND_9;
  reg  _T_124; // @[apbspi.scala 139:27:@213.4]
  reg [31:0] _RAND_10;
  reg  _T_127; // @[apbspi.scala 140:27:@214.4]
  reg [31:0] _RAND_11;
  reg  _T_130; // @[apbspi.scala 148:23:@217.4]
  reg [31:0] _RAND_12;
  wire  _T_131; // @[apbspi.scala 149:15:@218.4]
  wire  _T_133; // @[apbspi.scala 149:31:@219.4]
  wire  _T_134; // @[apbspi.scala 149:28:@220.4]
  wire [7:0] _T_135; // @[apbspi.scala 149:55:@221.4]
  wire  _T_148; // @[apbspi.scala 149:61:@222.4]
  wire  _T_149; // @[apbspi.scala 149:43:@223.4]
  wire  _T_151; // @[apbspi.scala 150:25:@225.6]
  wire  _GEN_0; // @[apbspi.scala 149:85:@224.4]
  wire  _T_154; // @[apbspi.scala 154:18:@231.4]
  wire  _T_155; // @[apbspi.scala 154:15:@232.4]
  wire  _T_158; // @[apbspi.scala 154:29:@234.4]
  wire  _T_161; // @[apbspi.scala 154:44:@237.4]
  wire [31:0] _GEN_1; // @[apbspi.scala 154:86:@238.4]
  reg  _T_165; // @[apbspi.scala 160:26:@241.4]
  reg [31:0] _RAND_13;
  reg  _T_168; // @[apbspi.scala 161:26:@242.4]
  reg [31:0] _RAND_14;
  reg  _T_171; // @[apbspi.scala 162:26:@243.4]
  reg [31:0] _RAND_15;
  reg  _T_174; // @[apbspi.scala 163:26:@244.4]
  reg [31:0] _RAND_16;
  reg  _T_177; // @[apbspi.scala 164:26:@245.4]
  reg [31:0] _RAND_17;
  reg  _T_180; // @[apbspi.scala 165:26:@246.4]
  reg [31:0] _RAND_18;
  reg  _T_183; // @[apbspi.scala 166:26:@247.4]
  reg [31:0] _RAND_19;
  reg  _T_186; // @[apbspi.scala 167:26:@248.4]
  reg [31:0] _RAND_20;
  reg  _T_189; // @[apbspi.scala 168:26:@249.4]
  reg [31:0] _RAND_21;
  reg  _T_192; // @[apbspi.scala 169:26:@250.4]
  reg [31:0] _RAND_22;
  reg [16:0] _T_195; // @[apbspi.scala 170:26:@251.4]
  reg [31:0] _RAND_23;
  wire  _T_201; // @[apbspi.scala 172:61:@256.4]
  wire  _T_202; // @[apbspi.scala 172:43:@257.4]
  wire  _T_203; // @[apbspi.scala 173:29:@259.6]
  wire  _T_204; // @[apbspi.scala 174:29:@261.6]
  wire  _T_205; // @[apbspi.scala 175:29:@263.6]
  wire  _T_206; // @[apbspi.scala 176:29:@265.6]
  wire  _T_207; // @[apbspi.scala 177:29:@267.6]
  wire  _T_208; // @[apbspi.scala 178:29:@269.6]
  wire  _T_209; // @[apbspi.scala 179:29:@271.6]
  wire  _T_210; // @[apbspi.scala 180:29:@273.6]
  wire  _T_211; // @[apbspi.scala 181:29:@275.6]
  wire  _T_212; // @[apbspi.scala 182:29:@277.6]
  wire  _GEN_2; // @[apbspi.scala 172:87:@258.4]
  wire  _GEN_3; // @[apbspi.scala 172:87:@258.4]
  wire  _GEN_4; // @[apbspi.scala 172:87:@258.4]
  wire  _GEN_5; // @[apbspi.scala 172:87:@258.4]
  wire  _GEN_6; // @[apbspi.scala 172:87:@258.4]
  wire  _GEN_7; // @[apbspi.scala 172:87:@258.4]
  wire  _GEN_8; // @[apbspi.scala 172:87:@258.4]
  wire  _GEN_9; // @[apbspi.scala 172:87:@258.4]
  wire  _GEN_10; // @[apbspi.scala 172:87:@258.4]
  wire  _GEN_11; // @[apbspi.scala 172:87:@258.4]
  wire  _T_221; // @[apbspi.scala 184:44:@286.4]
  wire [1:0] _T_223; // @[Cat.scala 30:58:@288.6]
  wire [1:0] _T_224; // @[Cat.scala 30:58:@289.6]
  wire [2:0] _T_225; // @[Cat.scala 30:58:@290.6]
  wire [4:0] _T_226; // @[Cat.scala 30:58:@291.6]
  wire [1:0] _T_227; // @[Cat.scala 30:58:@292.6]
  wire [2:0] _T_228; // @[Cat.scala 30:58:@293.6]
  wire [21:0] _T_229; // @[Cat.scala 30:58:@294.6]
  wire [22:0] _T_230; // @[Cat.scala 30:58:@295.6]
  wire [25:0] _T_231; // @[Cat.scala 30:58:@296.6]
  wire [30:0] _T_232; // @[Cat.scala 30:58:@297.6]
  wire [31:0] _GEN_12; // @[apbspi.scala 184:88:@287.4]
  wire  _T_246; // @[apbspi.scala 198:62:@307.4]
  wire  _T_247; // @[apbspi.scala 198:44:@308.4]
  wire [1:0] _T_249; // @[Cat.scala 30:58:@310.6]
  wire [2:0] _T_250; // @[Cat.scala 30:58:@311.6]
  wire [1:0] _T_251; // @[Cat.scala 30:58:@312.6]
  wire [27:0] _T_253; // @[Cat.scala 30:58:@314.6]
  wire [30:0] _T_254; // @[Cat.scala 30:58:@315.6]
  wire [31:0] _GEN_13; // @[apbspi.scala 198:88:@309.4]
  wire [1:0] _T_305; // @[Cat.scala 30:58:@350.4]
  wire [1:0] _T_306; // @[Cat.scala 30:58:@351.4]
  wire [3:0] _T_307; // @[Cat.scala 30:58:@352.4]
  wire [1:0] _T_308; // @[Cat.scala 30:58:@353.4]
  wire [1:0] _T_309; // @[Cat.scala 30:58:@354.4]
  wire [3:0] _T_310; // @[Cat.scala 30:58:@355.4]
  wire [7:0] _T_311; // @[Cat.scala 30:58:@356.4]
  wire [1:0] _T_312; // @[Cat.scala 30:58:@357.4]
  wire [1:0] _T_313; // @[Cat.scala 30:58:@358.4]
  wire [3:0] _T_314; // @[Cat.scala 30:58:@359.4]
  wire [1:0] _T_315; // @[Cat.scala 30:58:@360.4]
  wire [1:0] _T_316; // @[Cat.scala 30:58:@361.4]
  wire [2:0] _T_317; // @[Cat.scala 30:58:@362.4]
  wire [4:0] _T_318; // @[Cat.scala 30:58:@363.4]
  wire [8:0] _T_319; // @[Cat.scala 30:58:@364.4]
  wire [16:0] _T_320; // @[Cat.scala 30:58:@365.4]
  wire [1:0] _T_338; // @[Cat.scala 30:58:@382.4]
  wire [3:0] _T_340; // @[Cat.scala 30:58:@384.4]
  wire [3:0] _T_343; // @[Cat.scala 30:58:@387.4]
  wire [7:0] _T_344; // @[Cat.scala 30:58:@388.4]
  wire [3:0] _T_347; // @[Cat.scala 30:58:@391.4]
  wire [1:0] _T_349; // @[Cat.scala 30:58:@393.4]
  wire [2:0] _T_350; // @[Cat.scala 30:58:@394.4]
  wire [4:0] _T_351; // @[Cat.scala 30:58:@395.4]
  wire [8:0] _T_352; // @[Cat.scala 30:58:@396.4]
  wire [16:0] _T_353; // @[Cat.scala 30:58:@397.4]
  wire [1:0] _T_503; // @[Cat.scala 30:58:@510.4]
  wire [1:0] _T_504; // @[Cat.scala 30:58:@511.4]
  wire [3:0] _T_505; // @[Cat.scala 30:58:@512.4]
  wire [1:0] _T_506; // @[Cat.scala 30:58:@513.4]
  wire [1:0] _T_507; // @[Cat.scala 30:58:@514.4]
  wire [3:0] _T_508; // @[Cat.scala 30:58:@515.4]
  wire [7:0] _T_509; // @[Cat.scala 30:58:@516.4]
  wire [1:0] _T_510; // @[Cat.scala 30:58:@517.4]
  wire [1:0] _T_511; // @[Cat.scala 30:58:@518.4]
  wire [3:0] _T_512; // @[Cat.scala 30:58:@519.4]
  wire [1:0] _T_513; // @[Cat.scala 30:58:@520.4]
  wire [2:0] _T_515; // @[Cat.scala 30:58:@522.4]
  wire [4:0] _T_516; // @[Cat.scala 30:58:@523.4]
  wire [8:0] _T_517; // @[Cat.scala 30:58:@524.4]
  wire [16:0] _T_518; // @[Cat.scala 30:58:@525.4]
  wire [1:0] _T_536; // @[Cat.scala 30:58:@542.4]
  wire [1:0] _T_537; // @[Cat.scala 30:58:@543.4]
  wire [3:0] _T_538; // @[Cat.scala 30:58:@544.4]
  wire [1:0] _T_539; // @[Cat.scala 30:58:@545.4]
  wire [1:0] _T_540; // @[Cat.scala 30:58:@546.4]
  wire [3:0] _T_541; // @[Cat.scala 30:58:@547.4]
  wire [7:0] _T_542; // @[Cat.scala 30:58:@548.4]
  wire [1:0] _T_543; // @[Cat.scala 30:58:@549.4]
  wire [1:0] _T_544; // @[Cat.scala 30:58:@550.4]
  wire [3:0] _T_545; // @[Cat.scala 30:58:@551.4]
  wire [1:0] _T_546; // @[Cat.scala 30:58:@552.4]
  wire [2:0] _T_548; // @[Cat.scala 30:58:@554.4]
  wire [4:0] _T_549; // @[Cat.scala 30:58:@555.4]
  wire [8:0] _T_550; // @[Cat.scala 30:58:@556.4]
  wire [16:0] _T_551; // @[Cat.scala 30:58:@557.4]
  wire  _T_657; // @[Mux.scala 46:19:@639.4]
  wire [16:0] _T_658; // @[Mux.scala 46:16:@640.4]
  wire  _T_659; // @[Mux.scala 46:19:@641.4]
  wire [16:0] _T_660; // @[Mux.scala 46:16:@642.4]
  wire  _T_661; // @[Mux.scala 46:19:@643.4]
  wire [16:0] _T_662; // @[Mux.scala 46:16:@644.4]
  wire  _T_663; // @[Mux.scala 46:19:@645.4]
  wire [16:0] _T_664; // @[Mux.scala 46:16:@646.4]
  wire  _T_670; // @[apbspi.scala 233:61:@651.4]
  wire  _T_671; // @[apbspi.scala 233:43:@652.4]
  wire [16:0] _T_675; // @[apbspi.scala 236:11:@655.6]
  wire [16:0] _T_679; // @[apbspi.scala 238:11:@657.6]
  wire [16:0] _T_683; // @[Mux.scala 46:16:@660.6]
  wire [16:0] _T_685; // @[Mux.scala 46:16:@662.6]
  wire [16:0] _T_687; // @[Mux.scala 46:16:@664.6]
  wire [16:0] _T_689; // @[Mux.scala 46:16:@666.6]
  wire [16:0] _GEN_14; // @[apbspi.scala 233:88:@653.4]
  wire  _T_701; // @[apbspi.scala 248:44:@680.4]
  wire [31:0] _GEN_16; // @[apbspi.scala 248:89:@681.4]
  wire  _T_710; // @[apbspi.scala 256:62:@689.4]
  wire  _T_711; // @[apbspi.scala 256:44:@690.4]
  wire [31:0] _GEN_18; // @[apbspi.scala 256:89:@691.4]
  wire  _T_721; // @[apbspi.scala 266:62:@703.4]
  wire  _T_722; // @[apbspi.scala 266:44:@704.4]
  wire [31:0] _GEN_19; // @[apbspi.scala 266:93:@705.4]
  wire  _T_730; // @[apbspi.scala 270:62:@713.4]
  wire  _T_731; // @[apbspi.scala 270:44:@714.4]
  wire [31:0] _GEN_20; // @[apbspi.scala 270:93:@715.4]
  reg  _T_734; // @[apbspi.scala 276:18:@718.4]
  reg [31:0] _RAND_24;
  wire  _T_739; // @[apbspi.scala 277:43:@722.4]
  wire  _T_741; // @[apbspi.scala 277:75:@724.4]
  wire  _T_742; // @[apbspi.scala 277:57:@725.4]
  wire  _T_743; // @[apbspi.scala 278:17:@727.6]
  wire  _GEN_21; // @[apbspi.scala 277:101:@726.4]
  wire  _T_752; // @[apbspi.scala 280:45:@736.4]
  wire [31:0] _T_754; // @[Cat.scala 30:58:@738.6]
  wire [31:0] _GEN_22; // @[apbspi.scala 280:89:@737.4]
  reg  _T_757; // @[apbspi.scala 285:34:@741.4]
  reg [31:0] _RAND_25;
  reg  _T_760; // @[apbspi.scala 286:34:@742.4]
  reg [31:0] _RAND_26;
  reg  _T_763; // @[apbspi.scala 287:34:@743.4]
  reg [31:0] _RAND_27;
  reg  _T_766; // @[apbspi.scala 288:34:@744.4]
  reg [31:0] _RAND_28;
  reg  _T_769; // @[apbspi.scala 289:34:@745.4]
  reg [31:0] _RAND_29;
  reg  _T_772; // @[apbspi.scala 290:34:@746.4]
  reg [31:0] _RAND_30;
  reg  _T_775; // @[apbspi.scala 291:34:@747.4]
  reg [31:0] _RAND_31;
  reg  _T_778; // @[apbspi.scala 292:34:@748.4]
  reg [31:0] _RAND_32;
  reg  _T_781; // @[apbspi.scala 293:34:@749.4]
  reg [31:0] _RAND_33;
  wire  _T_787; // @[apbspi.scala 295:61:@754.4]
  wire  _T_788; // @[apbspi.scala 295:43:@755.4]
  wire  _T_790; // @[apbspi.scala 296:25:@757.6]
  wire  _T_792; // @[apbspi.scala 296:42:@759.6]
  wire  _T_794; // @[apbspi.scala 296:61:@760.6]
  wire  _T_795; // @[apbspi.scala 296:58:@761.6]
  wire  _T_797; // @[apbspi.scala 297:25:@763.6]
  wire  _T_799; // @[apbspi.scala 297:42:@765.6]
  wire  _T_802; // @[apbspi.scala 297:58:@767.6]
  wire  _T_804; // @[apbspi.scala 298:25:@769.6]
  wire  _T_806; // @[apbspi.scala 298:42:@771.6]
  wire  _T_808; // @[apbspi.scala 299:25:@773.6]
  wire  _T_810; // @[apbspi.scala 299:42:@775.6]
  wire  _T_812; // @[apbspi.scala 300:25:@777.6]
  wire  _T_814; // @[apbspi.scala 300:42:@779.6]
  wire  _T_816; // @[apbspi.scala 301:25:@781.6]
  wire  _T_818; // @[apbspi.scala 301:42:@783.6]
  wire  _T_821; // @[apbspi.scala 301:58:@785.6]
  wire  _T_822; // @[apbspi.scala 301:71:@786.6]
  wire  _T_824; // @[apbspi.scala 302:25:@788.6]
  wire  _T_826; // @[apbspi.scala 302:42:@790.6]
  wire  _T_830; // @[apbspi.scala 303:42:@794.6]
  wire  _T_832; // @[apbspi.scala 304:25:@796.6]
  wire  _T_834; // @[apbspi.scala 304:42:@798.6]
  wire  _T_838; // @[apbspi.scala 307:42:@803.6]
  wire  _T_839; // @[apbspi.scala 307:39:@804.6]
  wire  _T_841; // @[apbspi.scala 307:28:@805.6]
  wire  _T_845; // @[apbspi.scala 308:42:@808.6]
  wire  _T_846; // @[apbspi.scala 308:39:@809.6]
  wire  _T_848; // @[apbspi.scala 308:28:@810.6]
  wire  _T_850; // @[apbspi.scala 309:48:@812.6]
  wire  _T_852; // @[apbspi.scala 309:28:@813.6]
  wire  _T_853; // @[apbspi.scala 310:39:@815.6]
  wire  _T_855; // @[apbspi.scala 310:28:@816.6]
  wire  _T_857; // @[apbspi.scala 311:28:@818.6]
  wire  _T_860; // @[apbspi.scala 312:40:@821.6]
  wire  _T_861; // @[apbspi.scala 312:53:@822.6]
  wire  _T_862; // @[apbspi.scala 312:63:@823.6]
  wire  _T_864; // @[apbspi.scala 312:28:@824.6]
  wire  _T_866; // @[apbspi.scala 313:28:@826.6]
  wire  _T_870; // @[apbspi.scala 314:42:@829.6]
  wire  _T_871; // @[apbspi.scala 314:39:@830.6]
  wire  _T_874; // @[apbspi.scala 314:50:@832.6]
  wire  _T_876; // @[apbspi.scala 314:28:@833.6]
  wire  _T_879; // @[apbspi.scala 315:38:@836.6]
  wire  _T_881; // @[apbspi.scala 315:28:@837.6]
  wire  _GEN_23; // @[apbspi.scala 295:87:@756.4]
  wire  _GEN_24; // @[apbspi.scala 295:87:@756.4]
  wire  _GEN_25; // @[apbspi.scala 295:87:@756.4]
  wire  _GEN_26; // @[apbspi.scala 295:87:@756.4]
  wire  _GEN_27; // @[apbspi.scala 295:87:@756.4]
  wire  _GEN_28; // @[apbspi.scala 295:87:@756.4]
  wire  _GEN_29; // @[apbspi.scala 295:87:@756.4]
  wire  _GEN_30; // @[apbspi.scala 295:87:@756.4]
  wire  _GEN_31; // @[apbspi.scala 295:87:@756.4]
  wire [1:0] _T_890; // @[Cat.scala 30:58:@847.6]
  wire [1:0] _T_891; // @[Cat.scala 30:58:@848.6]
  wire [2:0] _T_892; // @[Cat.scala 30:58:@849.6]
  wire [4:0] _T_893; // @[Cat.scala 30:58:@850.6]
  wire [1:0] _T_894; // @[Cat.scala 30:58:@851.6]
  wire [23:0] _T_895; // @[Cat.scala 30:58:@852.6]
  wire [24:0] _T_896; // @[Cat.scala 30:58:@853.6]
  wire [26:0] _T_897; // @[Cat.scala 30:58:@854.6]
  wire [31:0] _T_898; // @[Cat.scala 30:58:@855.6]
  wire [31:0] _GEN_32; // @[apbspi.scala 319:87:@846.4]
  reg  _T_901; // @[apbspi.scala 325:37:@858.4]
  reg [31:0] _RAND_34;
  reg  _T_904; // @[apbspi.scala 326:37:@859.4]
  reg [31:0] _RAND_35;
  reg  _T_907; // @[apbspi.scala 327:37:@860.4]
  reg [31:0] _RAND_36;
  reg  _T_910; // @[apbspi.scala 328:37:@861.4]
  reg [31:0] _RAND_37;
  reg  _T_913; // @[apbspi.scala 329:37:@862.4]
  reg [31:0] _RAND_38;
  reg  _T_916; // @[apbspi.scala 330:37:@863.4]
  reg [31:0] _RAND_39;
  reg  _T_919; // @[apbspi.scala 331:37:@864.4]
  reg [31:0] _RAND_40;
  reg  _T_922; // @[apbspi.scala 332:37:@865.4]
  reg [31:0] _RAND_41;
  reg  _T_925; // @[apbspi.scala 333:37:@866.4]
  reg [31:0] _RAND_42;
  wire  _T_931; // @[apbspi.scala 335:61:@871.4]
  wire  _T_932; // @[apbspi.scala 335:43:@872.4]
  wire  _GEN_33; // @[apbspi.scala 335:87:@873.4]
  wire  _GEN_34; // @[apbspi.scala 335:87:@873.4]
  wire  _GEN_35; // @[apbspi.scala 335:87:@873.4]
  wire  _GEN_36; // @[apbspi.scala 335:87:@873.4]
  wire  _GEN_37; // @[apbspi.scala 335:87:@873.4]
  wire  _GEN_38; // @[apbspi.scala 335:87:@873.4]
  wire  _GEN_39; // @[apbspi.scala 335:87:@873.4]
  wire  _GEN_40; // @[apbspi.scala 335:87:@873.4]
  wire  _GEN_41; // @[apbspi.scala 335:87:@873.4]
  wire  _T_942; // @[apbspi.scala 348:32:@893.4]
  wire  _T_943; // @[apbspi.scala 349:32:@894.4]
  wire  _T_944; // @[apbspi.scala 350:32:@895.4]
  wire  _T_945; // @[apbspi.scala 351:32:@896.4]
  wire  _T_946; // @[apbspi.scala 352:32:@897.4]
  wire  _T_947; // @[apbspi.scala 353:32:@898.4]
  wire  _T_948; // @[apbspi.scala 354:32:@899.4]
  wire  _T_949; // @[apbspi.scala 355:32:@900.4]
  wire  _T_950; // @[apbspi.scala 356:32:@901.4]
  wire  _T_951; // @[apbspi.scala 358:23:@902.4]
  wire  _T_952; // @[apbspi.scala 358:32:@903.4]
  wire  _T_953; // @[apbspi.scala 358:41:@904.4]
  wire  _T_954; // @[apbspi.scala 358:50:@905.4]
  wire  _T_955; // @[apbspi.scala 358:59:@906.4]
  wire  _T_956; // @[apbspi.scala 358:68:@907.4]
  wire  _T_957; // @[apbspi.scala 358:77:@908.4]
  wire  _T_958; // @[apbspi.scala 358:86:@909.4]
  wire  _T_959; // @[apbspi.scala 358:96:@910.4]
  wire  _T_965; // @[apbspi.scala 363:61:@916.4]
  wire  _T_966; // @[apbspi.scala 363:43:@917.4]
  wire [7:0] _T_967; // @[apbspi.scala 364:24:@919.6]
  wire [7:0] _GEN_42; // @[apbspi.scala 363:88:@918.4]
  reg [7:0] _T_976; // @[apbspi.scala 369:26:@927.4]
  reg [31:0] _RAND_43;
  reg [7:0] _T_979; // @[apbspi.scala 370:26:@928.4]
  reg [31:0] _RAND_44;
  reg [4:0] _T_982; // @[apbspi.scala 371:26:@929.4]
  reg [31:0] _RAND_45;
  wire [8:0] _T_984; // @[apbspi.scala 375:37:@930.4]
  wire [8:0] _T_985; // @[apbspi.scala 375:37:@931.4]
  wire [7:0] _T_986; // @[apbspi.scala 375:37:@932.4]
  wire  _T_987; // @[apbspi.scala 375:24:@933.4]
  wire  _T_989; // @[apbspi.scala 377:36:@934.4]
  wire  _T_990; // @[apbspi.scala 377:20:@935.4]
  wire  _T_992; // @[apbspi.scala 377:53:@936.4]
  wire  _T_994; // @[apbspi.scala 377:77:@937.4]
  wire  _T_995; // @[apbspi.scala 377:59:@938.4]
  wire  _T_996; // @[apbspi.scala 377:49:@939.4]
  wire  _T_998; // @[apbspi.scala 378:36:@940.4]
  wire  _T_999; // @[apbspi.scala 378:20:@941.4]
  wire  _T_1003; // @[apbspi.scala 378:77:@943.4]
  wire  _T_1004; // @[apbspi.scala 378:59:@944.4]
  wire  _T_1005; // @[apbspi.scala 378:49:@945.4]
  wire  _T_1007; // @[apbspi.scala 379:36:@946.4]
  wire  _T_1008; // @[apbspi.scala 379:20:@947.4]
  wire  _T_1012; // @[apbspi.scala 379:77:@949.4]
  wire  _T_1013; // @[apbspi.scala 379:59:@950.4]
  wire  _T_1014; // @[apbspi.scala 379:49:@951.4]
  wire  _T_1016; // @[apbspi.scala 380:36:@952.4]
  wire  _T_1017; // @[apbspi.scala 380:20:@953.4]
  wire  _T_1021; // @[apbspi.scala 380:77:@955.4]
  wire  _T_1022; // @[apbspi.scala 380:59:@956.4]
  wire  _T_1023; // @[apbspi.scala 380:49:@957.4]
  wire  _T_1025; // @[apbspi.scala 381:36:@958.4]
  wire  _T_1026; // @[apbspi.scala 381:20:@959.4]
  wire  _T_1030; // @[apbspi.scala 381:77:@961.4]
  wire  _T_1031; // @[apbspi.scala 381:59:@962.4]
  wire  _T_1032; // @[apbspi.scala 381:49:@963.4]
  wire  _T_1034; // @[apbspi.scala 382:36:@964.4]
  wire  _T_1035; // @[apbspi.scala 382:20:@965.4]
  wire  _T_1039; // @[apbspi.scala 382:77:@967.4]
  wire  _T_1040; // @[apbspi.scala 382:59:@968.4]
  wire  _T_1041; // @[apbspi.scala 382:49:@969.4]
  wire  _T_1043; // @[apbspi.scala 383:36:@970.4]
  wire  _T_1044; // @[apbspi.scala 383:20:@971.4]
  wire  _T_1048; // @[apbspi.scala 383:77:@973.4]
  wire  _T_1049; // @[apbspi.scala 383:59:@974.4]
  wire  _T_1050; // @[apbspi.scala 383:49:@975.4]
  wire  _T_1052; // @[apbspi.scala 384:36:@976.4]
  wire  _T_1053; // @[apbspi.scala 384:20:@977.4]
  wire  _T_1057; // @[apbspi.scala 384:77:@979.4]
  wire  _T_1058; // @[apbspi.scala 384:59:@980.4]
  wire  _T_1059; // @[apbspi.scala 384:49:@981.4]
  wire  _T_1060; // @[apbspi.scala 386:19:@982.4]
  wire  _T_1062; // @[apbspi.scala 386:47:@983.4]
  wire  _T_1063; // @[apbspi.scala 386:44:@984.4]
  wire  _T_1064; // @[apbspi.scala 386:33:@985.4]
  wire  _T_1065; // @[apbspi.scala 387:19:@986.4]
  wire  _T_1068; // @[apbspi.scala 387:43:@988.4]
  wire  _T_1069; // @[apbspi.scala 387:33:@989.4]
  wire  _T_1070; // @[apbspi.scala 388:19:@990.4]
  wire  _T_1073; // @[apbspi.scala 388:43:@992.4]
  wire  _T_1074; // @[apbspi.scala 388:33:@993.4]
  wire  _T_1075; // @[apbspi.scala 389:19:@994.4]
  wire  _T_1078; // @[apbspi.scala 389:43:@996.4]
  wire  _T_1079; // @[apbspi.scala 389:33:@997.4]
  wire  _T_1080; // @[apbspi.scala 390:19:@998.4]
  wire  _T_1083; // @[apbspi.scala 390:43:@1000.4]
  wire  _T_1084; // @[apbspi.scala 390:33:@1001.4]
  wire  _T_1085; // @[apbspi.scala 391:19:@1002.4]
  wire  _T_1088; // @[apbspi.scala 391:43:@1004.4]
  wire  _T_1089; // @[apbspi.scala 391:33:@1005.4]
  wire  _T_1090; // @[apbspi.scala 392:19:@1006.4]
  wire  _T_1093; // @[apbspi.scala 392:43:@1008.4]
  wire  _T_1094; // @[apbspi.scala 392:33:@1009.4]
  wire  _T_1095; // @[apbspi.scala 393:19:@1010.4]
  wire  _T_1098; // @[apbspi.scala 393:43:@1012.4]
  wire  _T_1099; // @[apbspi.scala 393:33:@1013.4]
  wire  _T_1108; // @[apbspi.scala 401:17:@1022.4]
  reg  _T_1111; // @[apbspi.scala 403:21:@1023.4]
  reg [31:0] _RAND_46;
  reg  _T_1114; // @[apbspi.scala 404:21:@1024.4]
  reg [31:0] _RAND_47;
  reg  _T_1117; // @[apbspi.scala 405:21:@1025.4]
  reg [31:0] _RAND_48;
  reg  _T_1120; // @[apbspi.scala 406:21:@1026.4]
  reg [31:0] _RAND_49;
  reg  _T_1123; // @[apbspi.scala 407:21:@1027.4]
  reg [31:0] _RAND_50;
  reg  _T_1126; // @[apbspi.scala 408:21:@1028.4]
  reg [31:0] _RAND_51;
  reg  _T_1129; // @[apbspi.scala 409:21:@1029.4]
  reg [31:0] _RAND_52;
  reg  _T_1132; // @[apbspi.scala 410:21:@1030.4]
  reg [31:0] _RAND_53;
  wire [1:0] _T_1133; // @[Cat.scala 30:58:@1031.4]
  wire [1:0] _T_1134; // @[Cat.scala 30:58:@1032.4]
  wire [3:0] _T_1135; // @[Cat.scala 30:58:@1033.4]
  wire [1:0] _T_1136; // @[Cat.scala 30:58:@1034.4]
  wire [1:0] _T_1137; // @[Cat.scala 30:58:@1035.4]
  wire [3:0] _T_1138; // @[Cat.scala 30:58:@1036.4]
  wire  _T_1145; // @[apbspi.scala 413:61:@1043.4]
  wire  _T_1146; // @[apbspi.scala 413:43:@1044.4]
  wire [7:0] _GEN_44; // @[apbspi.scala 413:89:@1045.4]
  wire  _T_1148; // @[apbspi.scala 416:18:@1049.4]
  wire  _T_1151; // @[apbspi.scala 416:30:@1051.4]
  wire  _T_1156; // @[Conditional.scala 37:30:@1062.6]
  wire  _T_1160; // @[apbspi.scala 438:34:@1066.8]
  wire [1:0] _T_1161; // @[apbspi.scala 439:34:@1068.8]
  wire  _T_1165; // @[Conditional.scala 37:30:@1076.8]
  wire  _T_1171; // @[Conditional.scala 37:30:@1089.10]
  wire  _T_1173; // @[apbspi.scala 466:45:@1093.12]
  wire [17:0] _GEN_129; // @[apbspi.scala 467:46:@1095.12]
  wire [17:0] _T_1174; // @[apbspi.scala 467:46:@1095.12]
  wire  _T_1175; // @[apbspi.scala 469:47:@1097.12]
  wire [17:0] _GEN_130; // @[apbspi.scala 470:56:@1099.12]
  wire [17:0] _T_1176; // @[apbspi.scala 470:56:@1099.12]
  wire  _T_1180; // @[Conditional.scala 37:30:@1106.12]
  wire  _T_1182; // @[apbspi.scala 478:44:@1108.14]
  wire  _T_1184; // @[apbspi.scala 478:34:@1110.14]
  wire [17:0] _T_1188; // @[apbspi.scala 479:34:@1114.14]
  wire  _T_1192; // @[apbspi.scala 481:34:@1118.14]
  wire [17:0] _T_1196; // @[apbspi.scala 482:34:@1122.14]
  wire [5:0] _T_1206; // @[apbspi.scala 483:105:@1129.14]
  wire [4:0] _T_1207; // @[apbspi.scala 483:105:@1130.14]
  wire [4:0] _T_1208; // @[apbspi.scala 483:67:@1131.14]
  wire [4:0] _T_1209; // @[apbspi.scala 483:34:@1132.14]
  wire  _T_1217; // @[apbspi.scala 484:68:@1139.14]
  wire [1:0] _T_1218; // @[apbspi.scala 484:34:@1140.14]
  wire [8:0] _T_1226; // @[apbspi.scala 485:77:@1146.14]
  wire [7:0] _T_1227; // @[apbspi.scala 485:77:@1147.14]
  wire [7:0] _T_1228; // @[apbspi.scala 485:34:@1148.14]
  wire  _T_1229; // @[apbspi.scala 487:42:@1150.14]
  wire  _T_1230; // @[apbspi.scala 487:34:@1151.14]
  wire  _T_1231; // @[apbspi.scala 488:42:@1153.14]
  wire  _T_1232; // @[apbspi.scala 488:34:@1154.14]
  wire  _T_1233; // @[apbspi.scala 489:42:@1156.14]
  wire  _T_1234; // @[apbspi.scala 489:34:@1157.14]
  wire  _T_1235; // @[apbspi.scala 490:42:@1159.14]
  wire  _T_1236; // @[apbspi.scala 490:34:@1160.14]
  wire  _T_1237; // @[apbspi.scala 491:42:@1162.14]
  wire  _T_1238; // @[apbspi.scala 491:34:@1163.14]
  wire  _T_1239; // @[apbspi.scala 492:42:@1165.14]
  wire  _T_1240; // @[apbspi.scala 492:34:@1166.14]
  wire  _T_1241; // @[apbspi.scala 493:42:@1168.14]
  wire  _T_1242; // @[apbspi.scala 493:34:@1169.14]
  wire  _T_1243; // @[apbspi.scala 494:42:@1171.14]
  wire  _T_1244; // @[apbspi.scala 494:34:@1172.14]
  wire  _GEN_45; // @[Conditional.scala 39:67:@1107.12]
  wire [17:0] _GEN_46; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_47; // @[Conditional.scala 39:67:@1107.12]
  wire [17:0] _GEN_48; // @[Conditional.scala 39:67:@1107.12]
  wire [4:0] _GEN_49; // @[Conditional.scala 39:67:@1107.12]
  wire [1:0] _GEN_50; // @[Conditional.scala 39:67:@1107.12]
  wire [7:0] _GEN_51; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_52; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_53; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_54; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_55; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_56; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_57; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_58; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_59; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_60; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_61; // @[Conditional.scala 39:67:@1090.10]
  wire [1:0] _GEN_62; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_63; // @[Conditional.scala 39:67:@1090.10]
  wire [17:0] _GEN_64; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_65; // @[Conditional.scala 39:67:@1090.10]
  wire [17:0] _GEN_66; // @[Conditional.scala 39:67:@1090.10]
  wire [4:0] _GEN_67; // @[Conditional.scala 39:67:@1090.10]
  wire [7:0] _GEN_68; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_69; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_70; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_71; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_72; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_73; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_74; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_75; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_76; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_77; // @[Conditional.scala 39:67:@1090.10]
  wire  _GEN_78; // @[Conditional.scala 39:67:@1077.8]
  wire [17:0] _GEN_79; // @[Conditional.scala 39:67:@1077.8]
  wire [1:0] _GEN_80; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_81; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_82; // @[Conditional.scala 39:67:@1077.8]
  wire [7:0] _GEN_83; // @[Conditional.scala 39:67:@1077.8]
  wire [17:0] _GEN_84; // @[Conditional.scala 39:67:@1077.8]
  wire [4:0] _GEN_85; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_86; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_87; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_88; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_89; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_90; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_91; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_92; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_93; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_94; // @[Conditional.scala 39:67:@1077.8]
  wire  _GEN_95; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_96; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_97; // @[Conditional.scala 40:58:@1063.6]
  wire [1:0] _GEN_98; // @[Conditional.scala 40:58:@1063.6]
  wire [7:0] _GEN_99; // @[Conditional.scala 40:58:@1063.6]
  wire [17:0] _GEN_100; // @[Conditional.scala 40:58:@1063.6]
  wire [4:0] _GEN_101; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_102; // @[Conditional.scala 40:58:@1063.6]
  wire [17:0] _GEN_103; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_104; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_105; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_106; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_107; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_108; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_109; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_110; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_111; // @[Conditional.scala 40:58:@1063.6]
  wire  _GEN_112; // @[apbspi.scala 416:42:@1052.4]
  wire  _GEN_113; // @[apbspi.scala 416:42:@1052.4]
  wire [7:0] _GEN_114; // @[apbspi.scala 416:42:@1052.4]
  wire [17:0] _GEN_115; // @[apbspi.scala 416:42:@1052.4]
  wire [4:0] _GEN_116; // @[apbspi.scala 416:42:@1052.4]
  wire [1:0] _GEN_117; // @[apbspi.scala 416:42:@1052.4]
  wire  _GEN_118; // @[apbspi.scala 416:42:@1052.4]
  wire  _GEN_119; // @[apbspi.scala 416:42:@1052.4]
  wire [17:0] _GEN_120; // @[apbspi.scala 416:42:@1052.4]
  wire  _GEN_121; // @[apbspi.scala 416:42:@1052.4]
  wire  _GEN_122; // @[apbspi.scala 416:42:@1052.4]
  wire  _GEN_123; // @[apbspi.scala 416:42:@1052.4]
  wire  _GEN_124; // @[apbspi.scala 416:42:@1052.4]
  wire  _GEN_125; // @[apbspi.scala 416:42:@1052.4]
  wire  _GEN_126; // @[apbspi.scala 416:42:@1052.4]
  wire  _GEN_127; // @[apbspi.scala 416:42:@1052.4]
  wire  _GEN_128; // @[apbspi.scala 416:42:@1052.4]
  FIFO_spi FIFO ( // @[apbspi.scala 114:20:@195.4]
    .io_dataIn(FIFO_io_dataIn),
    .io_writeEn(FIFO_io_writeEn),
    .io_writeClk(FIFO_io_writeClk),
    .io_full(FIFO_io_full),
    .io_writePtr(FIFO_io_writePtr),
    .io_dataOut(FIFO_io_dataOut),
    .io_readEn(FIFO_io_readEn),
    .io_readClk(FIFO_io_readClk),
    .io_empty(FIFO_io_empty),
    .io_systemRst(FIFO_io_systemRst)
  );
  FIFO_1_spi FIFO_1 ( // @[apbspi.scala 115:20:@196.4]
    .io_dataIn(FIFO_1_io_dataIn),
    .io_writeEn(FIFO_1_io_writeEn),
    .io_writeClk(FIFO_1_io_writeClk),
    .io_full(FIFO_1_io_full),
    .io_writePtr(FIFO_1_io_writePtr),
    .io_dataOut(FIFO_1_io_dataOut),
    .io_readEn(FIFO_1_io_readEn),
    .io_readClk(FIFO_1_io_readClk),
    .io_empty(FIFO_1_io_empty),
    .io_systemRst(FIFO_1_io_systemRst)
  );
  assign _T_64 = io_PRESETn == 1'h0; // @[apbspi.scala 79:28:@178.4]
  assign _T_131 = io_PSEL & io_PWRITE; // @[apbspi.scala 149:15:@218.4]
  assign _T_133 = io_PENABLE == 1'h0; // @[apbspi.scala 149:31:@219.4]
  assign _T_134 = _T_131 & _T_133; // @[apbspi.scala 149:28:@220.4]
  assign _T_135 = io_PADDR[7:0]; // @[apbspi.scala 149:55:@221.4]
  assign _T_148 = _T_135 == 8'h40; // @[apbspi.scala 149:61:@222.4]
  assign _T_149 = _T_134 & _T_148; // @[apbspi.scala 149:43:@223.4]
  assign _T_151 = io_PWDATA == 32'ha; // @[apbspi.scala 150:25:@225.6]
  assign _GEN_0 = _T_149 ? _T_151 : 1'h0; // @[apbspi.scala 149:85:@224.4]
  assign _T_154 = io_PWRITE == 1'h0; // @[apbspi.scala 154:18:@231.4]
  assign _T_155 = io_PSEL & _T_154; // @[apbspi.scala 154:15:@232.4]
  assign _T_158 = _T_155 & _T_133; // @[apbspi.scala 154:29:@234.4]
  assign _T_161 = _T_158 & _T_148; // @[apbspi.scala 154:44:@237.4]
  assign _GEN_1 = _T_161 ? 32'h0 : _T_92; // @[apbspi.scala 154:86:@238.4]
  assign _T_201 = _T_135 == 8'h60; // @[apbspi.scala 172:61:@256.4]
  assign _T_202 = _T_134 & _T_201; // @[apbspi.scala 172:43:@257.4]
  assign _T_203 = io_PWDATA[9]; // @[apbspi.scala 173:29:@259.6]
  assign _T_204 = io_PWDATA[8]; // @[apbspi.scala 174:29:@261.6]
  assign _T_205 = io_PWDATA[7]; // @[apbspi.scala 175:29:@263.6]
  assign _T_206 = io_PWDATA[6]; // @[apbspi.scala 176:29:@265.6]
  assign _T_207 = io_PWDATA[5]; // @[apbspi.scala 177:29:@267.6]
  assign _T_208 = io_PWDATA[4]; // @[apbspi.scala 178:29:@269.6]
  assign _T_209 = io_PWDATA[3]; // @[apbspi.scala 179:29:@271.6]
  assign _T_210 = io_PWDATA[2]; // @[apbspi.scala 180:29:@273.6]
  assign _T_211 = io_PWDATA[1]; // @[apbspi.scala 181:29:@275.6]
  assign _T_212 = io_PWDATA[0]; // @[apbspi.scala 182:29:@277.6]
  assign _GEN_2 = _T_202 ? _T_203 : _T_165; // @[apbspi.scala 172:87:@258.4]
  assign _GEN_3 = _T_202 ? _T_204 : _T_168; // @[apbspi.scala 172:87:@258.4]
  assign _GEN_4 = _T_202 ? _T_205 : _T_171; // @[apbspi.scala 172:87:@258.4]
  assign _GEN_5 = _T_202 ? _T_206 : _T_174; // @[apbspi.scala 172:87:@258.4]
  assign _GEN_6 = _T_202 ? _T_207 : _T_177; // @[apbspi.scala 172:87:@258.4]
  assign _GEN_7 = _T_202 ? _T_208 : _T_180; // @[apbspi.scala 172:87:@258.4]
  assign _GEN_8 = _T_202 ? _T_209 : _T_183; // @[apbspi.scala 172:87:@258.4]
  assign _GEN_9 = _T_202 ? _T_210 : _T_186; // @[apbspi.scala 172:87:@258.4]
  assign _GEN_10 = _T_202 ? _T_211 : _T_189; // @[apbspi.scala 172:87:@258.4]
  assign _GEN_11 = _T_202 ? _T_212 : _T_192; // @[apbspi.scala 172:87:@258.4]
  assign _T_221 = _T_158 & _T_201; // @[apbspi.scala 184:44:@286.4]
  assign _T_223 = {_T_189,_T_192}; // @[Cat.scala 30:58:@288.6]
  assign _T_224 = {_T_180,_T_183}; // @[Cat.scala 30:58:@289.6]
  assign _T_225 = {_T_224,_T_186}; // @[Cat.scala 30:58:@290.6]
  assign _T_226 = {_T_225,_T_223}; // @[Cat.scala 30:58:@291.6]
  assign _T_227 = {_T_171,_T_174}; // @[Cat.scala 30:58:@292.6]
  assign _T_228 = {_T_227,_T_177}; // @[Cat.scala 30:58:@293.6]
  assign _T_229 = {21'h0,_T_165}; // @[Cat.scala 30:58:@294.6]
  assign _T_230 = {_T_229,_T_168}; // @[Cat.scala 30:58:@295.6]
  assign _T_231 = {_T_230,_T_228}; // @[Cat.scala 30:58:@296.6]
  assign _T_232 = {_T_231,_T_226}; // @[Cat.scala 30:58:@297.6]
  assign _GEN_12 = _T_221 ? {{1'd0}, _T_232} : _GEN_1; // @[apbspi.scala 184:88:@287.4]
  assign _T_246 = _T_135 == 8'h64; // @[apbspi.scala 198:62:@307.4]
  assign _T_247 = _T_158 & _T_246; // @[apbspi.scala 198:44:@308.4]
  assign _T_249 = {FIFO_io_empty,FIFO_1_io_full}; // @[Cat.scala 30:58:@310.6]
  assign _T_250 = {_T_249,FIFO_1_io_empty}; // @[Cat.scala 30:58:@311.6]
  assign _T_251 = {1'h0,FIFO_io_full}; // @[Cat.scala 30:58:@312.6]
  assign _T_253 = {26'h1,_T_251}; // @[Cat.scala 30:58:@314.6]
  assign _T_254 = {_T_253,_T_250}; // @[Cat.scala 30:58:@315.6]
  assign _GEN_13 = _T_247 ? {{1'd0}, _T_254} : _GEN_12; // @[apbspi.scala 198:88:@309.4]
  assign _T_305 = {_T_212,_T_212}; // @[Cat.scala 30:58:@350.4]
  assign _T_306 = {_T_211,_T_211}; // @[Cat.scala 30:58:@351.4]
  assign _T_307 = {_T_306,_T_305}; // @[Cat.scala 30:58:@352.4]
  assign _T_308 = {_T_210,_T_210}; // @[Cat.scala 30:58:@353.4]
  assign _T_309 = {_T_209,_T_209}; // @[Cat.scala 30:58:@354.4]
  assign _T_310 = {_T_309,_T_308}; // @[Cat.scala 30:58:@355.4]
  assign _T_311 = {_T_310,_T_307}; // @[Cat.scala 30:58:@356.4]
  assign _T_312 = {_T_208,_T_208}; // @[Cat.scala 30:58:@357.4]
  assign _T_313 = {_T_207,_T_207}; // @[Cat.scala 30:58:@358.4]
  assign _T_314 = {_T_313,_T_312}; // @[Cat.scala 30:58:@359.4]
  assign _T_315 = {_T_206,_T_206}; // @[Cat.scala 30:58:@360.4]
  assign _T_316 = {1'h0,_T_205}; // @[Cat.scala 30:58:@361.4]
  assign _T_317 = {_T_316,_T_205}; // @[Cat.scala 30:58:@362.4]
  assign _T_318 = {_T_317,_T_315}; // @[Cat.scala 30:58:@363.4]
  assign _T_319 = {_T_318,_T_314}; // @[Cat.scala 30:58:@364.4]
  assign _T_320 = {_T_319,_T_311}; // @[Cat.scala 30:58:@365.4]
  assign _T_338 = {_T_205,_T_205}; // @[Cat.scala 30:58:@382.4]
  assign _T_340 = {_T_315,_T_338}; // @[Cat.scala 30:58:@384.4]
  assign _T_343 = {_T_312,_T_313}; // @[Cat.scala 30:58:@387.4]
  assign _T_344 = {_T_343,_T_340}; // @[Cat.scala 30:58:@388.4]
  assign _T_347 = {_T_308,_T_309}; // @[Cat.scala 30:58:@391.4]
  assign _T_349 = {1'h0,_T_212}; // @[Cat.scala 30:58:@393.4]
  assign _T_350 = {_T_349,_T_212}; // @[Cat.scala 30:58:@394.4]
  assign _T_351 = {_T_350,_T_306}; // @[Cat.scala 30:58:@395.4]
  assign _T_352 = {_T_351,_T_347}; // @[Cat.scala 30:58:@396.4]
  assign _T_353 = {_T_352,_T_344}; // @[Cat.scala 30:58:@397.4]
  assign _T_503 = {_T_212,1'h0}; // @[Cat.scala 30:58:@510.4]
  assign _T_504 = {_T_211,_T_212}; // @[Cat.scala 30:58:@511.4]
  assign _T_505 = {_T_504,_T_503}; // @[Cat.scala 30:58:@512.4]
  assign _T_506 = {_T_210,_T_211}; // @[Cat.scala 30:58:@513.4]
  assign _T_507 = {_T_209,_T_210}; // @[Cat.scala 30:58:@514.4]
  assign _T_508 = {_T_507,_T_506}; // @[Cat.scala 30:58:@515.4]
  assign _T_509 = {_T_508,_T_505}; // @[Cat.scala 30:58:@516.4]
  assign _T_510 = {_T_208,_T_209}; // @[Cat.scala 30:58:@517.4]
  assign _T_511 = {_T_207,_T_208}; // @[Cat.scala 30:58:@518.4]
  assign _T_512 = {_T_511,_T_510}; // @[Cat.scala 30:58:@519.4]
  assign _T_513 = {_T_206,_T_207}; // @[Cat.scala 30:58:@520.4]
  assign _T_515 = {_T_338,_T_206}; // @[Cat.scala 30:58:@522.4]
  assign _T_516 = {_T_515,_T_513}; // @[Cat.scala 30:58:@523.4]
  assign _T_517 = {_T_516,_T_512}; // @[Cat.scala 30:58:@524.4]
  assign _T_518 = {_T_517,_T_509}; // @[Cat.scala 30:58:@525.4]
  assign _T_536 = {_T_205,1'h0}; // @[Cat.scala 30:58:@542.4]
  assign _T_537 = {_T_206,_T_205}; // @[Cat.scala 30:58:@543.4]
  assign _T_538 = {_T_537,_T_536}; // @[Cat.scala 30:58:@544.4]
  assign _T_539 = {_T_207,_T_206}; // @[Cat.scala 30:58:@545.4]
  assign _T_540 = {_T_208,_T_207}; // @[Cat.scala 30:58:@546.4]
  assign _T_541 = {_T_540,_T_539}; // @[Cat.scala 30:58:@547.4]
  assign _T_542 = {_T_541,_T_538}; // @[Cat.scala 30:58:@548.4]
  assign _T_543 = {_T_209,_T_208}; // @[Cat.scala 30:58:@549.4]
  assign _T_544 = {_T_210,_T_209}; // @[Cat.scala 30:58:@550.4]
  assign _T_545 = {_T_544,_T_543}; // @[Cat.scala 30:58:@551.4]
  assign _T_546 = {_T_211,_T_210}; // @[Cat.scala 30:58:@552.4]
  assign _T_548 = {_T_305,_T_211}; // @[Cat.scala 30:58:@554.4]
  assign _T_549 = {_T_548,_T_546}; // @[Cat.scala 30:58:@555.4]
  assign _T_550 = {_T_549,_T_545}; // @[Cat.scala 30:58:@556.4]
  assign _T_551 = {_T_550,_T_542}; // @[Cat.scala 30:58:@557.4]
  assign _T_657 = 2'h0 == _T_224; // @[Mux.scala 46:19:@639.4]
  assign _T_658 = _T_657 ? 17'haaaa : 17'h0; // @[Mux.scala 46:16:@640.4]
  assign _T_659 = 2'h1 == _T_224; // @[Mux.scala 46:19:@641.4]
  assign _T_660 = _T_659 ? 17'h15555 : _T_658; // @[Mux.scala 46:16:@642.4]
  assign _T_661 = 2'h2 == _T_224; // @[Mux.scala 46:19:@643.4]
  assign _T_662 = _T_661 ? 17'haaaa : _T_660; // @[Mux.scala 46:16:@644.4]
  assign _T_663 = 2'h3 == _T_224; // @[Mux.scala 46:19:@645.4]
  assign _T_664 = _T_663 ? 17'h15555 : _T_662; // @[Mux.scala 46:16:@646.4]
  assign _T_670 = _T_135 == 8'h68; // @[apbspi.scala 233:61:@651.4]
  assign _T_671 = _T_134 & _T_670; // @[apbspi.scala 233:43:@652.4]
  assign _T_675 = _T_165 ? _T_353 : _T_320; // @[apbspi.scala 236:11:@655.6]
  assign _T_679 = _T_165 ? _T_551 : _T_518; // @[apbspi.scala 238:11:@657.6]
  assign _T_683 = _T_657 ? _T_679 : 17'h0; // @[Mux.scala 46:16:@660.6]
  assign _T_685 = _T_659 ? _T_679 : _T_683; // @[Mux.scala 46:16:@662.6]
  assign _T_687 = _T_661 ? _T_675 : _T_685; // @[Mux.scala 46:16:@664.6]
  assign _T_689 = _T_663 ? _T_675 : _T_687; // @[Mux.scala 46:16:@666.6]
  assign _GEN_14 = _T_671 ? _T_689 : 17'h0; // @[apbspi.scala 233:88:@653.4]
  assign _T_701 = _T_158 & _T_670; // @[apbspi.scala 248:44:@680.4]
  assign _GEN_16 = _T_701 ? 32'h0 : _GEN_13; // @[apbspi.scala 248:89:@681.4]
  assign _T_710 = _T_135 == 8'h6c; // @[apbspi.scala 256:62:@689.4]
  assign _T_711 = _T_158 & _T_710; // @[apbspi.scala 256:44:@690.4]
  assign _GEN_18 = _T_711 ? {{24'd0}, FIFO_1_io_dataOut} : _GEN_16; // @[apbspi.scala 256:89:@691.4]
  assign _T_721 = _T_135 == 8'h74; // @[apbspi.scala 266:62:@703.4]
  assign _T_722 = _T_158 & _T_721; // @[apbspi.scala 266:44:@704.4]
  assign _GEN_19 = _T_722 ? {{27'd0}, FIFO_io_writePtr} : _GEN_18; // @[apbspi.scala 266:93:@705.4]
  assign _T_730 = _T_135 == 8'h78; // @[apbspi.scala 270:62:@713.4]
  assign _T_731 = _T_158 & _T_730; // @[apbspi.scala 270:44:@714.4]
  assign _GEN_20 = _T_731 ? {{27'd0}, FIFO_1_io_writePtr} : _GEN_19; // @[apbspi.scala 270:93:@715.4]
  assign _T_739 = _T_134 & io_PENABLE; // @[apbspi.scala 277:43:@722.4]
  assign _T_741 = _T_135 == 8'h1c; // @[apbspi.scala 277:75:@724.4]
  assign _T_742 = _T_739 & _T_741; // @[apbspi.scala 277:57:@725.4]
  assign _T_743 = io_PWDATA[31]; // @[apbspi.scala 278:17:@727.6]
  assign _GEN_21 = _T_742 ? _T_743 : _T_734; // @[apbspi.scala 277:101:@726.4]
  assign _T_752 = _T_158 & _T_741; // @[apbspi.scala 280:45:@736.4]
  assign _T_754 = {_T_734,31'h0}; // @[Cat.scala 30:58:@738.6]
  assign _GEN_22 = _T_752 ? _T_754 : _GEN_20; // @[apbspi.scala 280:89:@737.4]
  assign _T_787 = _T_135 == 8'h20; // @[apbspi.scala 295:61:@754.4]
  assign _T_788 = _T_134 & _T_787; // @[apbspi.scala 295:43:@755.4]
  assign _T_790 = _T_757 == 1'h0; // @[apbspi.scala 296:25:@757.6]
  assign _T_792 = _T_790 & _T_204; // @[apbspi.scala 296:42:@759.6]
  assign _T_794 = _T_186 == 1'h0; // @[apbspi.scala 296:61:@760.6]
  assign _T_795 = _T_792 & _T_794; // @[apbspi.scala 296:58:@761.6]
  assign _T_797 = _T_760 == 1'h0; // @[apbspi.scala 297:25:@763.6]
  assign _T_799 = _T_797 & _T_205; // @[apbspi.scala 297:42:@765.6]
  assign _T_802 = _T_799 & _T_794; // @[apbspi.scala 297:58:@767.6]
  assign _T_804 = _T_763 == 1'h0; // @[apbspi.scala 298:25:@769.6]
  assign _T_806 = _T_804 & _T_206; // @[apbspi.scala 298:42:@771.6]
  assign _T_808 = _T_766 == 1'h0; // @[apbspi.scala 299:25:@773.6]
  assign _T_810 = _T_808 & _T_207; // @[apbspi.scala 299:42:@775.6]
  assign _T_812 = _T_769 == 1'h0; // @[apbspi.scala 300:25:@777.6]
  assign _T_814 = _T_812 & _T_208; // @[apbspi.scala 300:42:@779.6]
  assign _T_816 = _T_772 == 1'h0; // @[apbspi.scala 301:25:@781.6]
  assign _T_818 = _T_816 & _T_209; // @[apbspi.scala 301:42:@783.6]
  assign _T_821 = _T_818 & _T_794; // @[apbspi.scala 301:58:@785.6]
  assign _T_822 = _T_821 & _T_189; // @[apbspi.scala 301:71:@786.6]
  assign _T_824 = _T_775 == 1'h0; // @[apbspi.scala 302:25:@788.6]
  assign _T_826 = _T_824 & _T_210; // @[apbspi.scala 302:42:@790.6]
  assign _T_830 = _T_824 & _T_211; // @[apbspi.scala 303:42:@794.6]
  assign _T_832 = _T_781 == 1'h0; // @[apbspi.scala 304:25:@796.6]
  assign _T_834 = _T_832 & _T_212; // @[apbspi.scala 304:42:@798.6]
  assign _T_838 = FIFO_io_empty == 1'h0; // @[apbspi.scala 307:42:@803.6]
  assign _T_839 = _T_794 & _T_838; // @[apbspi.scala 307:39:@804.6]
  assign _T_841 = _T_839 ? 1'h1 : _T_757; // @[apbspi.scala 307:28:@805.6]
  assign _T_845 = io_spi_ssel_i == 1'h0; // @[apbspi.scala 308:42:@808.6]
  assign _T_846 = _T_794 & _T_845; // @[apbspi.scala 308:39:@809.6]
  assign _T_848 = _T_846 ? 1'h1 : _T_760; // @[apbspi.scala 308:28:@810.6]
  assign _T_850 = FIFO_io_writePtr == 5'h7; // @[apbspi.scala 309:48:@812.6]
  assign _T_852 = _T_850 ? 1'h1 : _T_763; // @[apbspi.scala 309:28:@813.6]
  assign _T_853 = _T_124 & FIFO_1_io_full; // @[apbspi.scala 310:39:@815.6]
  assign _T_855 = _T_853 ? 1'h1 : _T_766; // @[apbspi.scala 310:28:@816.6]
  assign _T_857 = FIFO_1_io_full ? 1'h1 : _T_766; // @[apbspi.scala 311:28:@818.6]
  assign _T_860 = _T_121 & _T_794; // @[apbspi.scala 312:40:@821.6]
  assign _T_861 = _T_860 & _T_189; // @[apbspi.scala 312:53:@822.6]
  assign _T_862 = _T_861 & FIFO_io_empty; // @[apbspi.scala 312:63:@823.6]
  assign _T_864 = _T_862 ? 1'h1 : _T_772; // @[apbspi.scala 312:28:@824.6]
  assign _T_866 = FIFO_io_empty ? 1'h1 : _T_775; // @[apbspi.scala 313:28:@826.6]
  assign _T_870 = _T_189 == 1'h0; // @[apbspi.scala 314:42:@829.6]
  assign _T_871 = _T_794 & _T_870; // @[apbspi.scala 314:39:@830.6]
  assign _T_874 = _T_871 & _T_845; // @[apbspi.scala 314:50:@832.6]
  assign _T_876 = _T_874 ? 1'h1 : _T_778; // @[apbspi.scala 314:28:@833.6]
  assign _T_879 = _T_186 & _T_845; // @[apbspi.scala 315:38:@836.6]
  assign _T_881 = _T_879 ? 1'h1 : _T_781; // @[apbspi.scala 315:28:@837.6]
  assign _GEN_23 = _T_788 ? _T_795 : _T_841; // @[apbspi.scala 295:87:@756.4]
  assign _GEN_24 = _T_788 ? _T_802 : _T_848; // @[apbspi.scala 295:87:@756.4]
  assign _GEN_25 = _T_788 ? _T_806 : _T_852; // @[apbspi.scala 295:87:@756.4]
  assign _GEN_26 = _T_788 ? _T_810 : _T_855; // @[apbspi.scala 295:87:@756.4]
  assign _GEN_27 = _T_788 ? _T_814 : _T_857; // @[apbspi.scala 295:87:@756.4]
  assign _GEN_28 = _T_788 ? _T_822 : _T_864; // @[apbspi.scala 295:87:@756.4]
  assign _GEN_29 = _T_788 ? _T_826 : _T_866; // @[apbspi.scala 295:87:@756.4]
  assign _GEN_30 = _T_788 ? _T_830 : _T_876; // @[apbspi.scala 295:87:@756.4]
  assign _GEN_31 = _T_788 ? _T_834 : _T_881; // @[apbspi.scala 295:87:@756.4]
  assign _T_890 = {_T_778,_T_781}; // @[Cat.scala 30:58:@847.6]
  assign _T_891 = {_T_769,_T_772}; // @[Cat.scala 30:58:@848.6]
  assign _T_892 = {_T_891,_T_775}; // @[Cat.scala 30:58:@849.6]
  assign _T_893 = {_T_892,_T_890}; // @[Cat.scala 30:58:@850.6]
  assign _T_894 = {_T_763,_T_766}; // @[Cat.scala 30:58:@851.6]
  assign _T_895 = {23'h0,_T_757}; // @[Cat.scala 30:58:@852.6]
  assign _T_896 = {_T_895,_T_760}; // @[Cat.scala 30:58:@853.6]
  assign _T_897 = {_T_896,_T_894}; // @[Cat.scala 30:58:@854.6]
  assign _T_898 = {_T_897,_T_893}; // @[Cat.scala 30:58:@855.6]
  assign _GEN_32 = _T_788 ? _T_898 : _GEN_22; // @[apbspi.scala 319:87:@846.4]
  assign _T_931 = _T_135 == 8'h28; // @[apbspi.scala 335:61:@871.4]
  assign _T_932 = _T_134 & _T_931; // @[apbspi.scala 335:43:@872.4]
  assign _GEN_33 = _T_932 ? _T_204 : _T_901; // @[apbspi.scala 335:87:@873.4]
  assign _GEN_34 = _T_932 ? _T_205 : _T_904; // @[apbspi.scala 335:87:@873.4]
  assign _GEN_35 = _T_932 ? _T_206 : _T_907; // @[apbspi.scala 335:87:@873.4]
  assign _GEN_36 = _T_932 ? _T_207 : _T_910; // @[apbspi.scala 335:87:@873.4]
  assign _GEN_37 = _T_932 ? _T_208 : _T_913; // @[apbspi.scala 335:87:@873.4]
  assign _GEN_38 = _T_932 ? _T_209 : _T_916; // @[apbspi.scala 335:87:@873.4]
  assign _GEN_39 = _T_932 ? _T_210 : _T_919; // @[apbspi.scala 335:87:@873.4]
  assign _GEN_40 = _T_932 ? _T_211 : _T_922; // @[apbspi.scala 335:87:@873.4]
  assign _GEN_41 = _T_932 ? _T_212 : _T_925; // @[apbspi.scala 335:87:@873.4]
  assign _T_942 = _T_925 & _T_781; // @[apbspi.scala 348:32:@893.4]
  assign _T_943 = _T_922 & _T_778; // @[apbspi.scala 349:32:@894.4]
  assign _T_944 = _T_919 & _T_775; // @[apbspi.scala 350:32:@895.4]
  assign _T_945 = _T_916 & _T_772; // @[apbspi.scala 351:32:@896.4]
  assign _T_946 = _T_913 & _T_769; // @[apbspi.scala 352:32:@897.4]
  assign _T_947 = _T_910 & _T_766; // @[apbspi.scala 353:32:@898.4]
  assign _T_948 = _T_907 & _T_763; // @[apbspi.scala 354:32:@899.4]
  assign _T_949 = _T_904 & _T_760; // @[apbspi.scala 355:32:@900.4]
  assign _T_950 = _T_901 & _T_757; // @[apbspi.scala 356:32:@901.4]
  assign _T_951 = _T_942 | _T_943; // @[apbspi.scala 358:23:@902.4]
  assign _T_952 = _T_951 | _T_944; // @[apbspi.scala 358:32:@903.4]
  assign _T_953 = _T_952 | _T_945; // @[apbspi.scala 358:41:@904.4]
  assign _T_954 = _T_953 | _T_946; // @[apbspi.scala 358:50:@905.4]
  assign _T_955 = _T_954 | _T_947; // @[apbspi.scala 358:59:@906.4]
  assign _T_956 = _T_955 | _T_948; // @[apbspi.scala 358:68:@907.4]
  assign _T_957 = _T_956 | _T_949; // @[apbspi.scala 358:77:@908.4]
  assign _T_958 = _T_957 | _T_950; // @[apbspi.scala 358:86:@909.4]
  assign _T_959 = _T_958 & _T_734; // @[apbspi.scala 358:96:@910.4]
  assign _T_965 = _T_135 == 8'h70; // @[apbspi.scala 363:61:@916.4]
  assign _T_966 = _T_134 & _T_965; // @[apbspi.scala 363:43:@917.4]
  assign _T_967 = io_PWDATA[7:0]; // @[apbspi.scala 364:24:@919.6]
  assign _GEN_42 = _T_966 ? _T_967 : _T_86; // @[apbspi.scala 363:88:@918.4]
  assign _T_984 = _T_976 - 8'h1; // @[apbspi.scala 375:37:@930.4]
  assign _T_985 = $unsigned(_T_984); // @[apbspi.scala 375:37:@931.4]
  assign _T_986 = _T_985[7:0]; // @[apbspi.scala 375:37:@932.4]
  assign _T_987 = _T_979 == _T_986; // @[apbspi.scala 375:24:@933.4]
  assign _T_989 = _T_982 == 5'h2; // @[apbspi.scala 377:36:@934.4]
  assign _T_990 = _T_180 & _T_989; // @[apbspi.scala 377:20:@935.4]
  assign _T_992 = _T_180 == 1'h0; // @[apbspi.scala 377:53:@936.4]
  assign _T_994 = _T_982 == 5'h1; // @[apbspi.scala 377:77:@937.4]
  assign _T_995 = _T_992 & _T_994; // @[apbspi.scala 377:59:@938.4]
  assign _T_996 = _T_990 | _T_995; // @[apbspi.scala 377:49:@939.4]
  assign _T_998 = _T_982 == 5'h4; // @[apbspi.scala 378:36:@940.4]
  assign _T_999 = _T_180 & _T_998; // @[apbspi.scala 378:20:@941.4]
  assign _T_1003 = _T_982 == 5'h3; // @[apbspi.scala 378:77:@943.4]
  assign _T_1004 = _T_992 & _T_1003; // @[apbspi.scala 378:59:@944.4]
  assign _T_1005 = _T_999 | _T_1004; // @[apbspi.scala 378:49:@945.4]
  assign _T_1007 = _T_982 == 5'h6; // @[apbspi.scala 379:36:@946.4]
  assign _T_1008 = _T_180 & _T_1007; // @[apbspi.scala 379:20:@947.4]
  assign _T_1012 = _T_982 == 5'h5; // @[apbspi.scala 379:77:@949.4]
  assign _T_1013 = _T_992 & _T_1012; // @[apbspi.scala 379:59:@950.4]
  assign _T_1014 = _T_1008 | _T_1013; // @[apbspi.scala 379:49:@951.4]
  assign _T_1016 = _T_982 == 5'h8; // @[apbspi.scala 380:36:@952.4]
  assign _T_1017 = _T_180 & _T_1016; // @[apbspi.scala 380:20:@953.4]
  assign _T_1021 = _T_982 == 5'h7; // @[apbspi.scala 380:77:@955.4]
  assign _T_1022 = _T_992 & _T_1021; // @[apbspi.scala 380:59:@956.4]
  assign _T_1023 = _T_1017 | _T_1022; // @[apbspi.scala 380:49:@957.4]
  assign _T_1025 = _T_982 == 5'ha; // @[apbspi.scala 381:36:@958.4]
  assign _T_1026 = _T_180 & _T_1025; // @[apbspi.scala 381:20:@959.4]
  assign _T_1030 = _T_982 == 5'h9; // @[apbspi.scala 381:77:@961.4]
  assign _T_1031 = _T_992 & _T_1030; // @[apbspi.scala 381:59:@962.4]
  assign _T_1032 = _T_1026 | _T_1031; // @[apbspi.scala 381:49:@963.4]
  assign _T_1034 = _T_982 == 5'hc; // @[apbspi.scala 382:36:@964.4]
  assign _T_1035 = _T_180 & _T_1034; // @[apbspi.scala 382:20:@965.4]
  assign _T_1039 = _T_982 == 5'hb; // @[apbspi.scala 382:77:@967.4]
  assign _T_1040 = _T_992 & _T_1039; // @[apbspi.scala 382:59:@968.4]
  assign _T_1041 = _T_1035 | _T_1040; // @[apbspi.scala 382:49:@969.4]
  assign _T_1043 = _T_982 == 5'he; // @[apbspi.scala 383:36:@970.4]
  assign _T_1044 = _T_180 & _T_1043; // @[apbspi.scala 383:20:@971.4]
  assign _T_1048 = _T_982 == 5'hd; // @[apbspi.scala 383:77:@973.4]
  assign _T_1049 = _T_992 & _T_1048; // @[apbspi.scala 383:59:@974.4]
  assign _T_1050 = _T_1044 | _T_1049; // @[apbspi.scala 383:49:@975.4]
  assign _T_1052 = _T_982 == 5'h10; // @[apbspi.scala 384:36:@976.4]
  assign _T_1053 = _T_180 & _T_1052; // @[apbspi.scala 384:20:@977.4]
  assign _T_1057 = _T_982 == 5'hf; // @[apbspi.scala 384:77:@979.4]
  assign _T_1058 = _T_992 & _T_1057; // @[apbspi.scala 384:59:@980.4]
  assign _T_1059 = _T_1053 | _T_1058; // @[apbspi.scala 384:49:@981.4]
  assign _T_1060 = _T_996 & _T_165; // @[apbspi.scala 386:19:@982.4]
  assign _T_1062 = _T_165 == 1'h0; // @[apbspi.scala 386:47:@983.4]
  assign _T_1063 = _T_1059 & _T_1062; // @[apbspi.scala 386:44:@984.4]
  assign _T_1064 = _T_1060 | _T_1063; // @[apbspi.scala 386:33:@985.4]
  assign _T_1065 = _T_1005 & _T_165; // @[apbspi.scala 387:19:@986.4]
  assign _T_1068 = _T_1050 & _T_1062; // @[apbspi.scala 387:43:@988.4]
  assign _T_1069 = _T_1065 | _T_1068; // @[apbspi.scala 387:33:@989.4]
  assign _T_1070 = _T_1014 & _T_165; // @[apbspi.scala 388:19:@990.4]
  assign _T_1073 = _T_1041 & _T_1062; // @[apbspi.scala 388:43:@992.4]
  assign _T_1074 = _T_1070 | _T_1073; // @[apbspi.scala 388:33:@993.4]
  assign _T_1075 = _T_1023 & _T_165; // @[apbspi.scala 389:19:@994.4]
  assign _T_1078 = _T_1032 & _T_1062; // @[apbspi.scala 389:43:@996.4]
  assign _T_1079 = _T_1075 | _T_1078; // @[apbspi.scala 389:33:@997.4]
  assign _T_1080 = _T_1032 & _T_165; // @[apbspi.scala 390:19:@998.4]
  assign _T_1083 = _T_1023 & _T_1062; // @[apbspi.scala 390:43:@1000.4]
  assign _T_1084 = _T_1080 | _T_1083; // @[apbspi.scala 390:33:@1001.4]
  assign _T_1085 = _T_1041 & _T_165; // @[apbspi.scala 391:19:@1002.4]
  assign _T_1088 = _T_1014 & _T_1062; // @[apbspi.scala 391:43:@1004.4]
  assign _T_1089 = _T_1085 | _T_1088; // @[apbspi.scala 391:33:@1005.4]
  assign _T_1090 = _T_1050 & _T_165; // @[apbspi.scala 392:19:@1006.4]
  assign _T_1093 = _T_1005 & _T_1062; // @[apbspi.scala 392:43:@1008.4]
  assign _T_1094 = _T_1090 | _T_1093; // @[apbspi.scala 392:33:@1009.4]
  assign _T_1095 = _T_1059 & _T_165; // @[apbspi.scala 393:19:@1010.4]
  assign _T_1098 = _T_996 & _T_1062; // @[apbspi.scala 393:43:@1012.4]
  assign _T_1099 = _T_1095 | _T_1098; // @[apbspi.scala 393:33:@1013.4]
  assign _T_1108 = _T_192 ? _T_67 : io_miso_i; // @[apbspi.scala 401:17:@1022.4]
  assign _T_1133 = {_T_1114,_T_1111}; // @[Cat.scala 30:58:@1031.4]
  assign _T_1134 = {_T_1120,_T_1117}; // @[Cat.scala 30:58:@1032.4]
  assign _T_1135 = {_T_1134,_T_1133}; // @[Cat.scala 30:58:@1033.4]
  assign _T_1136 = {_T_1126,_T_1123}; // @[Cat.scala 30:58:@1034.4]
  assign _T_1137 = {_T_1132,_T_1129}; // @[Cat.scala 30:58:@1035.4]
  assign _T_1138 = {_T_1137,_T_1136}; // @[Cat.scala 30:58:@1036.4]
  assign _T_1145 = _T_135 == 8'h2c; // @[apbspi.scala 413:61:@1043.4]
  assign _T_1146 = _T_134 & _T_1145; // @[apbspi.scala 413:43:@1044.4]
  assign _GEN_44 = _T_1146 ? _T_967 : _T_976; // @[apbspi.scala 413:89:@1045.4]
  assign _T_1148 = _T_168 | _T_130; // @[apbspi.scala 416:18:@1049.4]
  assign _T_1151 = _T_1148 | _T_870; // @[apbspi.scala 416:30:@1051.4]
  assign _T_1156 = 2'h0 == _T_100; // @[Conditional.scala 37:30:@1062.6]
  assign _T_1160 = FIFO_io_empty ? 1'h0 : 1'h1; // @[apbspi.scala 438:34:@1066.8]
  assign _T_1161 = FIFO_io_empty ? 2'h0 : 2'h2; // @[apbspi.scala 439:34:@1068.8]
  assign _T_1165 = 2'h2 == _T_100; // @[Conditional.scala 37:30:@1076.8]
  assign _T_1171 = 2'h1 == _T_100; // @[Conditional.scala 37:30:@1089.10]
  assign _T_1173 = _T_195[16]; // @[apbspi.scala 466:45:@1093.12]
  assign _GEN_129 = {{1'd0}, _T_195}; // @[apbspi.scala 467:46:@1095.12]
  assign _T_1174 = _GEN_129 << 1; // @[apbspi.scala 467:46:@1095.12]
  assign _T_1175 = _T_105[16]; // @[apbspi.scala 469:47:@1097.12]
  assign _GEN_130 = {{1'd0}, _T_105}; // @[apbspi.scala 470:56:@1099.12]
  assign _T_1176 = _GEN_130 << 1; // @[apbspi.scala 470:56:@1099.12]
  assign _T_1180 = 2'h3 == _T_100; // @[Conditional.scala 37:30:@1106.12]
  assign _T_1182 = _T_979 == 8'h0; // @[apbspi.scala 478:44:@1108.14]
  assign _T_1184 = _T_1182 ? _T_1173 : _T_80; // @[apbspi.scala 478:34:@1110.14]
  assign _T_1188 = _T_1182 ? _T_1174 : {{1'd0}, _T_195}; // @[apbspi.scala 479:34:@1114.14]
  assign _T_1192 = _T_1182 ? _T_1175 : _T_67; // @[apbspi.scala 481:34:@1118.14]
  assign _T_1196 = _T_1182 ? _T_1176 : {{1'd0}, _T_105}; // @[apbspi.scala 482:34:@1122.14]
  assign _T_1206 = _T_982 + 5'h1; // @[apbspi.scala 483:105:@1129.14]
  assign _T_1207 = _T_1206[4:0]; // @[apbspi.scala 483:105:@1130.14]
  assign _T_1208 = _T_1052 ? 5'h0 : _T_1207; // @[apbspi.scala 483:67:@1131.14]
  assign _T_1209 = _T_987 ? _T_1208 : _T_982; // @[apbspi.scala 483:34:@1132.14]
  assign _T_1217 = _T_987 & _T_1052; // @[apbspi.scala 484:68:@1139.14]
  assign _T_1218 = _T_1217 ? 2'h0 : 2'h3; // @[apbspi.scala 484:34:@1140.14]
  assign _T_1226 = _T_979 + 8'h1; // @[apbspi.scala 485:77:@1146.14]
  assign _T_1227 = _T_1226[7:0]; // @[apbspi.scala 485:77:@1147.14]
  assign _T_1228 = _T_987 ? 8'h0 : _T_1227; // @[apbspi.scala 485:34:@1148.14]
  assign _T_1229 = _T_987 & _T_1099; // @[apbspi.scala 487:42:@1150.14]
  assign _T_1230 = _T_1229 ? _T_1108 : _T_1132; // @[apbspi.scala 487:34:@1151.14]
  assign _T_1231 = _T_987 & _T_1094; // @[apbspi.scala 488:42:@1153.14]
  assign _T_1232 = _T_1231 ? _T_1108 : _T_1129; // @[apbspi.scala 488:34:@1154.14]
  assign _T_1233 = _T_987 & _T_1089; // @[apbspi.scala 489:42:@1156.14]
  assign _T_1234 = _T_1233 ? _T_1108 : _T_1126; // @[apbspi.scala 489:34:@1157.14]
  assign _T_1235 = _T_987 & _T_1084; // @[apbspi.scala 490:42:@1159.14]
  assign _T_1236 = _T_1235 ? _T_1108 : _T_1123; // @[apbspi.scala 490:34:@1160.14]
  assign _T_1237 = _T_987 & _T_1079; // @[apbspi.scala 491:42:@1162.14]
  assign _T_1238 = _T_1237 ? _T_1108 : _T_1120; // @[apbspi.scala 491:34:@1163.14]
  assign _T_1239 = _T_987 & _T_1074; // @[apbspi.scala 492:42:@1165.14]
  assign _T_1240 = _T_1239 ? _T_1108 : _T_1117; // @[apbspi.scala 492:34:@1166.14]
  assign _T_1241 = _T_987 & _T_1069; // @[apbspi.scala 493:42:@1168.14]
  assign _T_1242 = _T_1241 ? _T_1108 : _T_1114; // @[apbspi.scala 493:34:@1169.14]
  assign _T_1243 = _T_987 & _T_1064; // @[apbspi.scala 494:42:@1171.14]
  assign _T_1244 = _T_1243 ? _T_1108 : _T_1111; // @[apbspi.scala 494:34:@1172.14]
  assign _GEN_45 = _T_1180 ? _T_1184 : _T_80; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_46 = _T_1180 ? _T_1188 : {{1'd0}, _T_195}; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_47 = _T_1180 ? _T_1192 : _T_67; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_48 = _T_1180 ? _T_1196 : {{1'd0}, _T_105}; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_49 = _T_1180 ? _T_1209 : _T_982; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_50 = _T_1180 ? _T_1218 : _T_100; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_51 = _T_1180 ? _T_1228 : _T_979; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_52 = _T_1180 ? _T_1230 : _T_1132; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_53 = _T_1180 ? _T_1232 : _T_1129; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_54 = _T_1180 ? _T_1234 : _T_1126; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_55 = _T_1180 ? _T_1236 : _T_1123; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_56 = _T_1180 ? _T_1238 : _T_1120; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_57 = _T_1180 ? _T_1240 : _T_1117; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_58 = _T_1180 ? _T_1242 : _T_1114; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_59 = _T_1180 ? _T_1244 : _T_1111; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_60 = _T_1180 ? _T_1217 : _T_124; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_61 = _T_1171 ? 1'h0 : _T_121; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_62 = _T_1171 ? 2'h3 : _GEN_50; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_63 = _T_1171 ? _T_1173 : _GEN_45; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_64 = _T_1171 ? _T_1174 : _GEN_46; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_65 = _T_1171 ? _T_1175 : _GEN_47; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_66 = _T_1171 ? _T_1176 : _GEN_48; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_67 = _T_1171 ? 5'h0 : _GEN_49; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_68 = _T_1171 ? 8'h1 : _GEN_51; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_69 = _T_1171 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_70 = _T_1171 ? _T_1132 : _GEN_52; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_71 = _T_1171 ? _T_1129 : _GEN_53; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_72 = _T_1171 ? _T_1126 : _GEN_54; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_73 = _T_1171 ? _T_1123 : _GEN_55; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_74 = _T_1171 ? _T_1120 : _GEN_56; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_75 = _T_1171 ? _T_1117 : _GEN_57; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_76 = _T_1171 ? _T_1114 : _GEN_58; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_77 = _T_1171 ? _T_1111 : _GEN_59; // @[Conditional.scala 39:67:@1090.10]
  assign _GEN_78 = _T_1165 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_79 = _T_1165 ? {{1'd0}, FIFO_io_dataOut} : _GEN_66; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_80 = _T_1165 ? 2'h1 : _GEN_62; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_81 = _T_1165 ? 1'h0 : _GEN_65; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_82 = _T_1165 ? _T_183 : _GEN_63; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_83 = _T_1165 ? 8'h0 : _GEN_68; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_84 = _T_1165 ? {{1'd0}, _T_664} : _GEN_64; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_85 = _T_1165 ? 5'h0 : _GEN_67; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_86 = _T_1165 ? 1'h0 : _GEN_69; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_87 = _T_1165 ? _T_1132 : _GEN_70; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_88 = _T_1165 ? _T_1129 : _GEN_71; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_89 = _T_1165 ? _T_1126 : _GEN_72; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_90 = _T_1165 ? _T_1123 : _GEN_73; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_91 = _T_1165 ? _T_1120 : _GEN_74; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_92 = _T_1165 ? _T_1117 : _GEN_75; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_93 = _T_1165 ? _T_1114 : _GEN_76; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_94 = _T_1165 ? _T_1111 : _GEN_77; // @[Conditional.scala 39:67:@1077.8]
  assign _GEN_95 = _T_1156 ? 1'h0 : _GEN_81; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_96 = _T_1156 ? _T_183 : _GEN_82; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_97 = _T_1156 ? _T_1160 : _GEN_78; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_98 = _T_1156 ? _T_1161 : _GEN_80; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_99 = _T_1156 ? 8'h0 : _GEN_83; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_100 = _T_1156 ? {{1'd0}, _T_664} : _GEN_84; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_101 = _T_1156 ? 5'h0 : _GEN_85; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_102 = _T_1156 ? 1'h0 : _GEN_86; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_103 = _T_1156 ? {{1'd0}, _T_105} : _GEN_79; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_104 = _T_1156 ? _T_1132 : _GEN_87; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_105 = _T_1156 ? _T_1129 : _GEN_88; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_106 = _T_1156 ? _T_1126 : _GEN_89; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_107 = _T_1156 ? _T_1123 : _GEN_90; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_108 = _T_1156 ? _T_1120 : _GEN_91; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_109 = _T_1156 ? _T_1117 : _GEN_92; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_110 = _T_1156 ? _T_1114 : _GEN_93; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_111 = _T_1156 ? _T_1111 : _GEN_94; // @[Conditional.scala 40:58:@1063.6]
  assign _GEN_112 = _T_1151 ? _T_183 : _GEN_96; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_113 = _T_1151 ? 1'h0 : _GEN_95; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_114 = _T_1151 ? 8'h0 : _GEN_99; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_115 = _T_1151 ? {{1'd0}, _T_664} : _GEN_100; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_116 = _T_1151 ? 5'h0 : _GEN_101; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_117 = _T_1151 ? 2'h0 : _GEN_98; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_118 = _T_1151 ? 1'h0 : _GEN_102; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_119 = _T_1151 ? _T_121 : _GEN_97; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_120 = _T_1151 ? {{1'd0}, _T_105} : _GEN_103; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_121 = _T_1151 ? _T_1132 : _GEN_104; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_122 = _T_1151 ? _T_1129 : _GEN_105; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_123 = _T_1151 ? _T_1126 : _GEN_106; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_124 = _T_1151 ? _T_1123 : _GEN_107; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_125 = _T_1151 ? _T_1120 : _GEN_108; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_126 = _T_1151 ? _T_1117 : _GEN_109; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_127 = _T_1151 ? _T_1114 : _GEN_110; // @[apbspi.scala 416:42:@1052.4]
  assign _GEN_128 = _T_1151 ? _T_1111 : _GEN_111; // @[apbspi.scala 416:42:@1052.4]
  assign io_PREADY = 1'h1; // @[apbspi.scala 68:14:@174.4]
  assign io_PRDATA = _T_92; // @[apbspi.scala 105:11:@192.4]
  assign io_PSLVERR = 1'h0; // @[apbspi.scala 69:14:@175.4]
  assign io_interrupt = interrupt_r; // @[apbspi.scala 72:14:@177.4]
  assign io_mosi_o = _T_67; // @[apbspi.scala 89:11:@183.4]
  assign io_mosi_t = 1'h0; // @[apbspi.scala 65:11:@173.4]
  assign io_miso_o = 1'h1; // @[apbspi.scala 90:11:@184.4]
  assign io_miso_t = 1'h1; // @[apbspi.scala 64:11:@172.4]
  assign io_spi_clk_o = _T_80; // @[apbspi.scala 100:14:@189.4]
  assign io_spi_clk_t = 1'h0; // @[apbspi.scala 63:14:@171.4]
  assign io_spi_ssel_o = _T_86; // @[apbspi.scala 101:15:@190.4]
  assign io_spi_ssel_t = 1'h0; // @[apbspi.scala 62:15:@170.4]
  assign FIFO_io_dataIn = _T_115; // @[apbspi.scala 134:19:@211.4]
  assign FIFO_io_writeEn = _T_118; // @[apbspi.scala 133:19:@210.4]
  assign FIFO_io_writeClk = io_PCLK; // @[apbspi.scala 122:21:@201.4]
  assign FIFO_io_readEn = _T_121; // @[apbspi.scala 135:19:@212.4]
  assign FIFO_io_readClk = io_PCLK; // @[apbspi.scala 123:21:@202.4]
  assign FIFO_io_systemRst = io_PRESETn == 1'h0; // @[apbspi.scala 121:21:@200.4]
  assign FIFO_1_io_dataIn = {_T_1138,_T_1135}; // @[apbspi.scala 412:19:@1038.4]
  assign FIFO_1_io_writeEn = _T_124; // @[apbspi.scala 142:19:@215.4]
  assign FIFO_1_io_writeClk = io_PCLK; // @[apbspi.scala 126:21:@205.4]
  assign FIFO_1_io_readEn = _T_127; // @[apbspi.scala 144:19:@216.4]
  assign FIFO_1_io_readClk = io_PCLK; // @[apbspi.scala 127:21:@206.4]
  assign FIFO_1_io_systemRst = io_PRESETn == 1'h0; // @[apbspi.scala 125:21:@204.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  interrupt_r = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_67 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_80 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_86 = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_92 = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_100 = _RAND_5[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_105 = _RAND_6[16:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_115 = _RAND_7[16:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_118 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_121 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_124 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_127 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_130 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_165 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_168 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_171 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_174 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_177 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_180 = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_183 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_186 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_189 = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_192 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_195 = _RAND_23[16:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_734 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_757 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_760 = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_763 = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_766 = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_769 = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_772 = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  _T_775 = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  _T_778 = _RAND_32[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  _T_781 = _RAND_33[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  _T_901 = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  _T_904 = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  _T_907 = _RAND_36[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  _T_910 = _RAND_37[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  _T_913 = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  _T_916 = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  _T_919 = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  _T_922 = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  _T_925 = _RAND_42[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  _T_976 = _RAND_43[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  _T_979 = _RAND_44[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  _T_982 = _RAND_45[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  _T_1111 = _RAND_46[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  _T_1114 = _RAND_47[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  _T_1117 = _RAND_48[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  _T_1120 = _RAND_49[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  _T_1123 = _RAND_50[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  _T_1126 = _RAND_51[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{`RANDOM}};
  _T_1129 = _RAND_52[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  _T_1132 = _RAND_53[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      interrupt_r <= 1'h0;
    end else begin
      interrupt_r <= _T_959;
    end
  end
  always @(posedge io_PCLK) begin
    if (_T_64) begin
      _T_67 <= 1'h0;
    end else begin
      if (_T_1151) begin
        _T_67 <= 1'h0;
      end else begin
        if (_T_1156) begin
          _T_67 <= 1'h0;
        end else begin
          if (_T_1165) begin
            _T_67 <= 1'h0;
          end else begin
            if (_T_1171) begin
              _T_67 <= _T_1175;
            end else begin
              if (_T_1180) begin
                if (_T_1182) begin
                  _T_67 <= _T_1175;
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_80 <= 1'h0;
    end else begin
      if (_T_1151) begin
        _T_80 <= _T_183;
      end else begin
        if (_T_1156) begin
          _T_80 <= _T_183;
        end else begin
          if (_T_1165) begin
            _T_80 <= _T_183;
          end else begin
            if (_T_1171) begin
              _T_80 <= _T_1173;
            end else begin
              if (_T_1180) begin
                if (_T_1182) begin
                  _T_80 <= _T_1173;
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_86 <= 8'hff;
    end else begin
      if (_T_966) begin
        _T_86 <= _T_967;
      end
    end
    if (_T_64) begin
      _T_92 <= 32'h0;
    end else begin
      if (_T_788) begin
        _T_92 <= _T_898;
      end else begin
        if (_T_752) begin
          _T_92 <= _T_754;
        end else begin
          if (_T_731) begin
            _T_92 <= {{27'd0}, FIFO_1_io_writePtr};
          end else begin
            if (_T_722) begin
              _T_92 <= {{27'd0}, FIFO_io_writePtr};
            end else begin
              if (_T_711) begin
                _T_92 <= {{24'd0}, FIFO_1_io_dataOut};
              end else begin
                if (_T_701) begin
                  _T_92 <= 32'h0;
                end else begin
                  if (_T_247) begin
                    _T_92 <= {{1'd0}, _T_254};
                  end else begin
                    if (_T_221) begin
                      _T_92 <= {{1'd0}, _T_232};
                    end else begin
                      if (_T_161) begin
                        _T_92 <= 32'h0;
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_100 <= 2'h0;
    end else begin
      if (_T_1151) begin
        _T_100 <= 2'h0;
      end else begin
        if (_T_1156) begin
          if (FIFO_io_empty) begin
            _T_100 <= 2'h0;
          end else begin
            _T_100 <= 2'h2;
          end
        end else begin
          if (_T_1165) begin
            _T_100 <= 2'h1;
          end else begin
            if (_T_1171) begin
              _T_100 <= 2'h3;
            end else begin
              if (_T_1180) begin
                if (_T_1217) begin
                  _T_100 <= 2'h0;
                end else begin
                  _T_100 <= 2'h3;
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_105 <= 17'h0;
    end else begin
      _T_105 <= _GEN_120[16:0];
    end
    if (_T_64) begin
      _T_115 <= 17'h0;
    end else begin
      if (_T_671) begin
        if (_T_663) begin
          if (_T_165) begin
            _T_115 <= _T_353;
          end else begin
            _T_115 <= _T_320;
          end
        end else begin
          if (_T_661) begin
            if (_T_165) begin
              _T_115 <= _T_353;
            end else begin
              _T_115 <= _T_320;
            end
          end else begin
            if (_T_659) begin
              if (_T_165) begin
                _T_115 <= _T_551;
              end else begin
                _T_115 <= _T_518;
              end
            end else begin
              if (_T_657) begin
                if (_T_165) begin
                  _T_115 <= _T_551;
                end else begin
                  _T_115 <= _T_518;
                end
              end else begin
                _T_115 <= 17'h0;
              end
            end
          end
        end
      end else begin
        _T_115 <= 17'h0;
      end
    end
    if (_T_64) begin
      _T_118 <= 1'h0;
    end else begin
      _T_118 <= _T_671;
    end
    if (_T_64) begin
      _T_121 <= 1'h0;
    end else begin
      if (!(_T_1151)) begin
        if (_T_1156) begin
          if (FIFO_io_empty) begin
            _T_121 <= 1'h0;
          end else begin
            _T_121 <= 1'h1;
          end
        end else begin
          if (_T_1165) begin
            _T_121 <= 1'h0;
          end else begin
            if (_T_1171) begin
              _T_121 <= 1'h0;
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_124 <= 1'h0;
    end else begin
      if (_T_1151) begin
        _T_124 <= 1'h0;
      end else begin
        if (_T_1156) begin
          _T_124 <= 1'h0;
        end else begin
          if (_T_1165) begin
            _T_124 <= 1'h0;
          end else begin
            if (_T_1171) begin
              _T_124 <= 1'h0;
            end else begin
              if (_T_1180) begin
                _T_124 <= _T_1217;
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_127 <= 1'h0;
    end else begin
      _T_127 <= _T_711;
    end
    if (_T_64) begin
      _T_130 <= 1'h0;
    end else begin
      if (_T_149) begin
        _T_130 <= _T_151;
      end else begin
        _T_130 <= 1'h0;
      end
    end
    if (_T_64) begin
      _T_165 <= 1'h0;
    end else begin
      if (_T_202) begin
        _T_165 <= _T_203;
      end
    end
    if (_T_64) begin
      _T_168 <= 1'h1;
    end else begin
      if (_T_202) begin
        _T_168 <= _T_204;
      end
    end
    if (_T_64) begin
      _T_171 <= 1'h1;
    end else begin
      if (_T_202) begin
        _T_171 <= _T_205;
      end
    end
    if (_T_64) begin
      _T_174 <= 1'h0;
    end else begin
      if (_T_202) begin
        _T_174 <= _T_206;
      end
    end
    if (_T_64) begin
      _T_177 <= 1'h0;
    end else begin
      if (_T_202) begin
        _T_177 <= _T_207;
      end
    end
    if (_T_64) begin
      _T_180 <= 1'h0;
    end else begin
      if (_T_202) begin
        _T_180 <= _T_208;
      end
    end
    if (_T_64) begin
      _T_183 <= 1'h0;
    end else begin
      if (_T_202) begin
        _T_183 <= _T_209;
      end
    end
    if (_T_64) begin
      _T_186 <= 1'h0;
    end else begin
      if (_T_202) begin
        _T_186 <= _T_210;
      end
    end
    if (_T_64) begin
      _T_189 <= 1'h1;
    end else begin
      if (_T_202) begin
        _T_189 <= _T_211;
      end
    end
    if (_T_64) begin
      _T_192 <= 1'h0;
    end else begin
      if (_T_202) begin
        _T_192 <= _T_212;
      end
    end
    if (_T_64) begin
      _T_195 <= 17'h0;
    end else begin
      _T_195 <= _GEN_115[16:0];
    end
    if (_T_64) begin
      _T_734 <= 1'h0;
    end else begin
      if (_T_742) begin
        _T_734 <= _T_743;
      end
    end
    if (_T_64) begin
      _T_757 <= 1'h0;
    end else begin
      if (_T_788) begin
        _T_757 <= _T_795;
      end else begin
        if (_T_839) begin
          _T_757 <= 1'h1;
        end
      end
    end
    if (_T_64) begin
      _T_760 <= 1'h0;
    end else begin
      if (_T_788) begin
        _T_760 <= _T_802;
      end else begin
        if (_T_846) begin
          _T_760 <= 1'h1;
        end
      end
    end
    if (_T_64) begin
      _T_763 <= 1'h0;
    end else begin
      if (_T_788) begin
        _T_763 <= _T_806;
      end else begin
        if (_T_850) begin
          _T_763 <= 1'h1;
        end
      end
    end
    if (_T_64) begin
      _T_766 <= 1'h0;
    end else begin
      if (_T_788) begin
        _T_766 <= _T_810;
      end else begin
        if (_T_853) begin
          _T_766 <= 1'h1;
        end
      end
    end
    if (_T_64) begin
      _T_769 <= 1'h0;
    end else begin
      if (_T_788) begin
        _T_769 <= _T_814;
      end else begin
        if (FIFO_1_io_full) begin
          _T_769 <= 1'h1;
        end else begin
          _T_769 <= _T_766;
        end
      end
    end
    if (_T_64) begin
      _T_772 <= 1'h0;
    end else begin
      if (_T_788) begin
        _T_772 <= _T_822;
      end else begin
        if (_T_862) begin
          _T_772 <= 1'h1;
        end
      end
    end
    if (_T_64) begin
      _T_775 <= 1'h0;
    end else begin
      if (_T_788) begin
        _T_775 <= _T_826;
      end else begin
        if (FIFO_io_empty) begin
          _T_775 <= 1'h1;
        end
      end
    end
    if (_T_64) begin
      _T_778 <= 1'h0;
    end else begin
      if (_T_788) begin
        _T_778 <= _T_830;
      end else begin
        if (_T_874) begin
          _T_778 <= 1'h1;
        end
      end
    end
    if (_T_64) begin
      _T_781 <= 1'h0;
    end else begin
      if (_T_788) begin
        _T_781 <= _T_834;
      end else begin
        if (_T_879) begin
          _T_781 <= 1'h1;
        end
      end
    end
    if (_T_64) begin
      _T_901 <= 1'h0;
    end else begin
      if (_T_932) begin
        _T_901 <= _T_204;
      end
    end
    if (_T_64) begin
      _T_904 <= 1'h0;
    end else begin
      if (_T_932) begin
        _T_904 <= _T_205;
      end
    end
    if (_T_64) begin
      _T_907 <= 1'h0;
    end else begin
      if (_T_932) begin
        _T_907 <= _T_206;
      end
    end
    if (_T_64) begin
      _T_910 <= 1'h0;
    end else begin
      if (_T_932) begin
        _T_910 <= _T_207;
      end
    end
    if (_T_64) begin
      _T_913 <= 1'h0;
    end else begin
      if (_T_932) begin
        _T_913 <= _T_208;
      end
    end
    if (_T_64) begin
      _T_916 <= 1'h0;
    end else begin
      if (_T_932) begin
        _T_916 <= _T_209;
      end
    end
    if (_T_64) begin
      _T_919 <= 1'h0;
    end else begin
      if (_T_932) begin
        _T_919 <= _T_210;
      end
    end
    if (_T_64) begin
      _T_922 <= 1'h0;
    end else begin
      if (_T_932) begin
        _T_922 <= _T_211;
      end
    end
    if (_T_64) begin
      _T_925 <= 1'h0;
    end else begin
      if (_T_932) begin
        _T_925 <= _T_212;
      end
    end
    if (_T_64) begin
      _T_976 <= 8'h2;
    end else begin
      if (_T_1146) begin
        _T_976 <= _T_967;
      end
    end
    if (_T_64) begin
      _T_979 <= 8'h2;
    end else begin
      if (_T_1151) begin
        _T_979 <= 8'h0;
      end else begin
        if (_T_1156) begin
          _T_979 <= 8'h0;
        end else begin
          if (_T_1165) begin
            _T_979 <= 8'h0;
          end else begin
            if (_T_1171) begin
              _T_979 <= 8'h1;
            end else begin
              if (_T_1180) begin
                if (_T_987) begin
                  _T_979 <= 8'h0;
                end else begin
                  _T_979 <= _T_1227;
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_982 <= 5'h0;
    end else begin
      if (_T_1151) begin
        _T_982 <= 5'h0;
      end else begin
        if (_T_1156) begin
          _T_982 <= 5'h0;
        end else begin
          if (_T_1165) begin
            _T_982 <= 5'h0;
          end else begin
            if (_T_1171) begin
              _T_982 <= 5'h0;
            end else begin
              if (_T_1180) begin
                if (_T_987) begin
                  if (_T_1052) begin
                    _T_982 <= 5'h0;
                  end else begin
                    _T_982 <= _T_1207;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_1111 <= 1'h0;
    end else begin
      if (!(_T_1151)) begin
        if (!(_T_1156)) begin
          if (!(_T_1165)) begin
            if (!(_T_1171)) begin
              if (_T_1180) begin
                if (_T_1243) begin
                  if (_T_192) begin
                    _T_1111 <= _T_67;
                  end else begin
                    _T_1111 <= io_miso_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_1114 <= 1'h0;
    end else begin
      if (!(_T_1151)) begin
        if (!(_T_1156)) begin
          if (!(_T_1165)) begin
            if (!(_T_1171)) begin
              if (_T_1180) begin
                if (_T_1241) begin
                  if (_T_192) begin
                    _T_1114 <= _T_67;
                  end else begin
                    _T_1114 <= io_miso_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_1117 <= 1'h0;
    end else begin
      if (!(_T_1151)) begin
        if (!(_T_1156)) begin
          if (!(_T_1165)) begin
            if (!(_T_1171)) begin
              if (_T_1180) begin
                if (_T_1239) begin
                  if (_T_192) begin
                    _T_1117 <= _T_67;
                  end else begin
                    _T_1117 <= io_miso_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_1120 <= 1'h0;
    end else begin
      if (!(_T_1151)) begin
        if (!(_T_1156)) begin
          if (!(_T_1165)) begin
            if (!(_T_1171)) begin
              if (_T_1180) begin
                if (_T_1237) begin
                  if (_T_192) begin
                    _T_1120 <= _T_67;
                  end else begin
                    _T_1120 <= io_miso_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_1123 <= 1'h0;
    end else begin
      if (!(_T_1151)) begin
        if (!(_T_1156)) begin
          if (!(_T_1165)) begin
            if (!(_T_1171)) begin
              if (_T_1180) begin
                if (_T_1235) begin
                  if (_T_192) begin
                    _T_1123 <= _T_67;
                  end else begin
                    _T_1123 <= io_miso_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_1126 <= 1'h0;
    end else begin
      if (!(_T_1151)) begin
        if (!(_T_1156)) begin
          if (!(_T_1165)) begin
            if (!(_T_1171)) begin
              if (_T_1180) begin
                if (_T_1233) begin
                  if (_T_192) begin
                    _T_1126 <= _T_67;
                  end else begin
                    _T_1126 <= io_miso_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_1129 <= 1'h0;
    end else begin
      if (!(_T_1151)) begin
        if (!(_T_1156)) begin
          if (!(_T_1165)) begin
            if (!(_T_1171)) begin
              if (_T_1180) begin
                if (_T_1231) begin
                  if (_T_192) begin
                    _T_1129 <= _T_67;
                  end else begin
                    _T_1129 <= io_miso_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_64) begin
      _T_1132 <= 1'h0;
    end else begin
      if (!(_T_1151)) begin
        if (!(_T_1156)) begin
          if (!(_T_1165)) begin
            if (!(_T_1171)) begin
              if (_T_1180) begin
                if (_T_1229) begin
                  if (_T_192) begin
                    _T_1132 <= _T_67;
                  end else begin
                    _T_1132 <= io_miso_i;
                  end
                end
              end
            end
          end
        end
      end
    end
  end
endmodule
