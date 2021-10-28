module FIFO_qspi( // @[:@3.2]
  input  [4:0] io_dataIn, // @[:@4.4]
  input        io_writeEn, // @[:@4.4]
  input        io_writeClk, // @[:@4.4]
  output [4:0] io_dataOut, // @[:@4.4]
  input        io_readEn, // @[:@4.4]
  input        io_readClk, // @[:@4.4]
  input        io_systemRst // @[:@4.4]
);
  reg [4:0] ram [0:7]; // @[fifo.scala 27:24:@6.4]
  reg [31:0] _RAND_0;
  wire [4:0] ram__T_98_data; // @[fifo.scala 27:24:@6.4]
  wire [2:0] ram__T_98_addr; // @[fifo.scala 27:24:@6.4]
  wire [4:0] ram__T_62_data; // @[fifo.scala 27:24:@6.4]
  wire [2:0] ram__T_62_addr; // @[fifo.scala 27:24:@6.4]
  wire  ram__T_62_mask; // @[fifo.scala 27:24:@6.4]
  wire  ram__T_62_en; // @[fifo.scala 27:24:@6.4]
  reg [3:0] _T_29; // @[fifo.scala 33:33:@9.4]
  reg [31:0] _RAND_1;
  reg [3:0] writeToReadPtr; // @[fifo.scala 35:31:@11.4]
  reg [31:0] _RAND_2;
  reg  _T_39; // @[fifo.scala 37:25:@13.4]
  reg [31:0] _RAND_3;
  reg [3:0] _T_43; // @[fifo.scala 39:36:@15.4]
  reg [31:0] _RAND_4;
  reg [3:0] _T_45; // @[fifo.scala 40:36:@17.4]
  reg [31:0] _RAND_5;
  wire  _T_47; // @[fifo.scala 43:59:@20.4]
  wire  _T_48; // @[fifo.scala 43:56:@21.4]
  wire [3:0] _GEN_15; // @[fifo.scala 43:42:@22.4]
  wire [4:0] _T_49; // @[fifo.scala 43:42:@22.4]
  wire [3:0] _T_50; // @[fifo.scala 43:42:@23.4]
  wire [2:0] _T_51; // @[fifo.scala 45:45:@26.4]
  wire [3:0] _GEN_16; // @[fifo.scala 45:51:@27.4]
  wire [3:0] _T_52; // @[fifo.scala 45:51:@27.4]
  wire [1:0] _T_53; // @[fifo.scala 48:62:@31.4]
  wire [1:0] _T_54; // @[fifo.scala 48:44:@32.4]
  wire [1:0] _T_55; // @[fifo.scala 48:99:@33.4]
  wire [3:0] _T_56; // @[Cat.scala 30:58:@34.4]
  wire  _T_57; // @[fifo.scala 48:36:@35.4]
  reg [3:0] _T_65; // @[fifo.scala 59:32:@46.4]
  reg [31:0] _RAND_6;
  reg [3:0] readToWritePtr; // @[fifo.scala 61:30:@48.4]
  reg [31:0] _RAND_7;
  reg  _T_75; // @[fifo.scala 63:26:@50.4]
  reg [31:0] _RAND_8;
  reg [3:0] _T_79; // @[fifo.scala 65:37:@52.4]
  reg [31:0] _RAND_9;
  reg [3:0] _T_81; // @[fifo.scala 66:37:@54.4]
  reg [31:0] _RAND_10;
  wire  _T_83; // @[fifo.scala 68:56:@57.4]
  wire  _T_84; // @[fifo.scala 68:53:@58.4]
  wire [3:0] _GEN_17; // @[fifo.scala 68:40:@59.4]
  wire [4:0] _T_85; // @[fifo.scala 68:40:@59.4]
  wire [3:0] _T_86; // @[fifo.scala 68:40:@60.4]
  wire [2:0] _T_87; // @[fifo.scala 70:43:@63.4]
  wire [3:0] _GEN_18; // @[fifo.scala 70:49:@64.4]
  wire [3:0] _T_88; // @[fifo.scala 70:49:@64.4]
  wire  _T_89; // @[fifo.scala 73:36:@68.4]
  wire [2:0] _T_90; // @[fifo.scala 76:41:@71.4]
  wire  _GEN_6; // @[fifo.scala 76:27:@75.4]
  reg [2:0] ram__T_98_addr_pipe_0;
  reg [31:0] _RAND_11;
  assign ram__T_98_addr = ram__T_98_addr_pipe_0;
  assign ram__T_98_data = ram[ram__T_98_addr]; // @[fifo.scala 27:24:@6.4]
  assign ram__T_62_data = io_dataIn;
  assign ram__T_62_addr = _T_29[2:0];
  assign ram__T_62_mask = 1'h1;
  assign ram__T_62_en = io_writeEn & _T_47;
  assign _T_47 = _T_39 == 1'h0; // @[fifo.scala 43:59:@20.4]
  assign _T_48 = io_writeEn & _T_47; // @[fifo.scala 43:56:@21.4]
  assign _GEN_15 = {{3'd0}, _T_48}; // @[fifo.scala 43:42:@22.4]
  assign _T_49 = _T_29 + _GEN_15; // @[fifo.scala 43:42:@22.4]
  assign _T_50 = _T_49[3:0]; // @[fifo.scala 43:42:@23.4]
  assign _T_51 = _T_50[3:1]; // @[fifo.scala 45:45:@26.4]
  assign _GEN_16 = {{1'd0}, _T_51}; // @[fifo.scala 45:51:@27.4]
  assign _T_52 = _GEN_16 ^ _T_50; // @[fifo.scala 45:51:@27.4]
  assign _T_53 = _T_45[3:2]; // @[fifo.scala 48:62:@31.4]
  assign _T_54 = ~ _T_53; // @[fifo.scala 48:44:@32.4]
  assign _T_55 = _T_45[1:0]; // @[fifo.scala 48:99:@33.4]
  assign _T_56 = {_T_54,_T_55}; // @[Cat.scala 30:58:@34.4]
  assign _T_57 = _T_52 == _T_56; // @[fifo.scala 48:36:@35.4]
  assign _T_83 = _T_75 == 1'h0; // @[fifo.scala 68:56:@57.4]
  assign _T_84 = io_readEn & _T_83; // @[fifo.scala 68:53:@58.4]
  assign _GEN_17 = {{3'd0}, _T_84}; // @[fifo.scala 68:40:@59.4]
  assign _T_85 = _T_65 + _GEN_17; // @[fifo.scala 68:40:@59.4]
  assign _T_86 = _T_85[3:0]; // @[fifo.scala 68:40:@60.4]
  assign _T_87 = _T_86[3:1]; // @[fifo.scala 70:43:@63.4]
  assign _GEN_18 = {{1'd0}, _T_87}; // @[fifo.scala 70:49:@64.4]
  assign _T_88 = _GEN_18 ^ _T_86; // @[fifo.scala 70:49:@64.4]
  assign _T_89 = _T_88 == _T_81; // @[fifo.scala 73:36:@68.4]
  assign _T_90 = _T_65[2:0]; // @[fifo.scala 76:41:@71.4]
  assign _GEN_6 = _T_83; // @[fifo.scala 76:27:@75.4]
  assign io_dataOut = ram__T_98_data; // @[fifo.scala 76:16:@81.4]
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
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram[initvar] = _RAND_0[4:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_29 = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  writeToReadPtr = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_39 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_43 = _RAND_4[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_45 = _RAND_5[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_65 = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  readToWritePtr = _RAND_7[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_75 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_79 = _RAND_9[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_81 = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  ram__T_98_addr_pipe_0 = _RAND_11[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge io_writeClk) begin
    if(ram__T_62_en & ram__T_62_mask) begin
      ram[ram__T_62_addr] <= ram__T_62_data; // @[fifo.scala 27:24:@6.4]
    end
    if (io_systemRst) begin
      _T_29 <= 4'h0;
    end else begin
      _T_29 <= _T_50;
    end
    if (io_systemRst) begin
      writeToReadPtr <= 4'h0;
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
      _T_65 <= 4'h0;
    end else begin
      _T_65 <= _T_86;
    end
    if (io_systemRst) begin
      readToWritePtr <= 4'h0;
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
module FIFO_qspi_3( // @[:@246.2]
  input  [16:0] io_dataIn, // @[:@247.4]
  input         io_writeEn, // @[:@247.4]
  input         io_writeClk, // @[:@247.4]
  output        io_full, // @[:@247.4]
  output [3:0]  io_writePtr, // @[:@247.4]
  output [16:0] io_dataOut, // @[:@247.4]
  input         io_readEn, // @[:@247.4]
  input         io_readClk, // @[:@247.4]
  output        io_empty, // @[:@247.4]
  input         io_systemRst // @[:@247.4]
);
  reg [16:0] ram [0:7]; // @[fifo.scala 27:24:@249.4]
  reg [31:0] _RAND_0;
  wire [16:0] ram__T_98_data; // @[fifo.scala 27:24:@249.4]
  wire [2:0] ram__T_98_addr; // @[fifo.scala 27:24:@249.4]
  wire [16:0] ram__T_62_data; // @[fifo.scala 27:24:@249.4]
  wire [2:0] ram__T_62_addr; // @[fifo.scala 27:24:@249.4]
  wire  ram__T_62_mask; // @[fifo.scala 27:24:@249.4]
  wire  ram__T_62_en; // @[fifo.scala 27:24:@249.4]
  reg [3:0] _T_29; // @[fifo.scala 33:33:@252.4]
  reg [31:0] _RAND_1;
  reg [3:0] writeToReadPtr; // @[fifo.scala 35:31:@254.4]
  reg [31:0] _RAND_2;
  reg  _T_39; // @[fifo.scala 37:25:@256.4]
  reg [31:0] _RAND_3;
  reg [3:0] _T_43; // @[fifo.scala 39:36:@258.4]
  reg [31:0] _RAND_4;
  reg [3:0] _T_45; // @[fifo.scala 40:36:@260.4]
  reg [31:0] _RAND_5;
  wire  _T_47; // @[fifo.scala 43:59:@263.4]
  wire  _T_48; // @[fifo.scala 43:56:@264.4]
  wire [3:0] _GEN_15; // @[fifo.scala 43:42:@265.4]
  wire [4:0] _T_49; // @[fifo.scala 43:42:@265.4]
  wire [3:0] _T_50; // @[fifo.scala 43:42:@266.4]
  wire [2:0] _T_51; // @[fifo.scala 45:45:@269.4]
  wire [3:0] _GEN_16; // @[fifo.scala 45:51:@270.4]
  wire [3:0] _T_52; // @[fifo.scala 45:51:@270.4]
  wire [1:0] _T_53; // @[fifo.scala 48:62:@274.4]
  wire [1:0] _T_54; // @[fifo.scala 48:44:@275.4]
  wire [1:0] _T_55; // @[fifo.scala 48:99:@276.4]
  wire [3:0] _T_56; // @[Cat.scala 30:58:@277.4]
  wire  _T_57; // @[fifo.scala 48:36:@278.4]
  reg [3:0] _T_65; // @[fifo.scala 59:32:@289.4]
  reg [31:0] _RAND_6;
  reg [3:0] readToWritePtr; // @[fifo.scala 61:30:@291.4]
  reg [31:0] _RAND_7;
  reg  _T_75; // @[fifo.scala 63:26:@293.4]
  reg [31:0] _RAND_8;
  reg [3:0] _T_79; // @[fifo.scala 65:37:@295.4]
  reg [31:0] _RAND_9;
  reg [3:0] _T_81; // @[fifo.scala 66:37:@297.4]
  reg [31:0] _RAND_10;
  wire  _T_83; // @[fifo.scala 68:56:@300.4]
  wire  _T_84; // @[fifo.scala 68:53:@301.4]
  wire [3:0] _GEN_17; // @[fifo.scala 68:40:@302.4]
  wire [4:0] _T_85; // @[fifo.scala 68:40:@302.4]
  wire [3:0] _T_86; // @[fifo.scala 68:40:@303.4]
  wire [2:0] _T_87; // @[fifo.scala 70:43:@306.4]
  wire [3:0] _GEN_18; // @[fifo.scala 70:49:@307.4]
  wire [3:0] _T_88; // @[fifo.scala 70:49:@307.4]
  wire  _T_89; // @[fifo.scala 73:36:@311.4]
  wire [2:0] _T_90; // @[fifo.scala 76:41:@314.4]
  wire  _GEN_6; // @[fifo.scala 76:27:@318.4]
  reg [2:0] ram__T_98_addr_pipe_0;
  reg [31:0] _RAND_11;
  assign ram__T_98_addr = ram__T_98_addr_pipe_0;
  assign ram__T_98_data = ram[ram__T_98_addr]; // @[fifo.scala 27:24:@249.4]
  assign ram__T_62_data = io_dataIn;
  assign ram__T_62_addr = _T_29[2:0];
  assign ram__T_62_mask = 1'h1;
  assign ram__T_62_en = io_writeEn & _T_47;
  assign _T_47 = _T_39 == 1'h0; // @[fifo.scala 43:59:@263.4]
  assign _T_48 = io_writeEn & _T_47; // @[fifo.scala 43:56:@264.4]
  assign _GEN_15 = {{3'd0}, _T_48}; // @[fifo.scala 43:42:@265.4]
  assign _T_49 = _T_29 + _GEN_15; // @[fifo.scala 43:42:@265.4]
  assign _T_50 = _T_49[3:0]; // @[fifo.scala 43:42:@266.4]
  assign _T_51 = _T_50[3:1]; // @[fifo.scala 45:45:@269.4]
  assign _GEN_16 = {{1'd0}, _T_51}; // @[fifo.scala 45:51:@270.4]
  assign _T_52 = _GEN_16 ^ _T_50; // @[fifo.scala 45:51:@270.4]
  assign _T_53 = _T_45[3:2]; // @[fifo.scala 48:62:@274.4]
  assign _T_54 = ~ _T_53; // @[fifo.scala 48:44:@275.4]
  assign _T_55 = _T_45[1:0]; // @[fifo.scala 48:99:@276.4]
  assign _T_56 = {_T_54,_T_55}; // @[Cat.scala 30:58:@277.4]
  assign _T_57 = _T_52 == _T_56; // @[fifo.scala 48:36:@278.4]
  assign _T_83 = _T_75 == 1'h0; // @[fifo.scala 68:56:@300.4]
  assign _T_84 = io_readEn & _T_83; // @[fifo.scala 68:53:@301.4]
  assign _GEN_17 = {{3'd0}, _T_84}; // @[fifo.scala 68:40:@302.4]
  assign _T_85 = _T_65 + _GEN_17; // @[fifo.scala 68:40:@302.4]
  assign _T_86 = _T_85[3:0]; // @[fifo.scala 68:40:@303.4]
  assign _T_87 = _T_86[3:1]; // @[fifo.scala 70:43:@306.4]
  assign _GEN_18 = {{1'd0}, _T_87}; // @[fifo.scala 70:49:@307.4]
  assign _T_88 = _GEN_18 ^ _T_86; // @[fifo.scala 70:49:@307.4]
  assign _T_89 = _T_88 == _T_81; // @[fifo.scala 73:36:@311.4]
  assign _T_90 = _T_65[2:0]; // @[fifo.scala 76:41:@314.4]
  assign _GEN_6 = _T_83; // @[fifo.scala 76:27:@318.4]
  assign io_full = _T_39; // @[fifo.scala 55:13:@288.4]
  assign io_writePtr = _T_29; // @[fifo.scala 42:17:@262.4]
  assign io_dataOut = ram__T_98_data; // @[fifo.scala 76:16:@324.4]
  assign io_empty = _T_75; // @[fifo.scala 77:14:@325.4]
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
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram[initvar] = _RAND_0[16:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_29 = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  writeToReadPtr = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_39 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_43 = _RAND_4[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_45 = _RAND_5[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_65 = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  readToWritePtr = _RAND_7[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_75 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_79 = _RAND_9[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_81 = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  ram__T_98_addr_pipe_0 = _RAND_11[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge io_writeClk) begin
    if(ram__T_62_en & ram__T_62_mask) begin
      ram[ram__T_62_addr] <= ram__T_62_data; // @[fifo.scala 27:24:@249.4]
    end
    if (io_systemRst) begin
      _T_29 <= 4'h0;
    end else begin
      _T_29 <= _T_50;
    end
    if (io_systemRst) begin
      writeToReadPtr <= 4'h0;
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
      _T_65 <= 4'h0;
    end else begin
      _T_65 <= _T_86;
    end
    if (io_systemRst) begin
      readToWritePtr <= 4'h0;
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
module RXFIFO( // @[:@327.2]
  input  [7:0] io_dataIn, // @[:@328.4]
  input        io_writeEn, // @[:@328.4]
  input        io_writeClk, // @[:@328.4]
  output       io_full, // @[:@328.4]
  output [3:0] io_writePtr, // @[:@328.4]
  output [7:0] io_dataOut, // @[:@328.4]
  input        io_readEn, // @[:@328.4]
  input        io_readClk, // @[:@328.4]
  output       io_empty, // @[:@328.4]
  input        io_systemRst // @[:@328.4]
);
  reg [7:0] ram [0:7]; // @[rxfifo.scala 27:24:@330.4]
  reg [31:0] _RAND_0;
  wire [7:0] ram__T_98_data; // @[rxfifo.scala 27:24:@330.4]
  wire [2:0] ram__T_98_addr; // @[rxfifo.scala 27:24:@330.4]
  wire [7:0] ram__T_62_data; // @[rxfifo.scala 27:24:@330.4]
  wire [2:0] ram__T_62_addr; // @[rxfifo.scala 27:24:@330.4]
  wire  ram__T_62_mask; // @[rxfifo.scala 27:24:@330.4]
  wire  ram__T_62_en; // @[rxfifo.scala 27:24:@330.4]
  reg [3:0] _T_29; // @[rxfifo.scala 33:33:@333.4]
  reg [31:0] _RAND_1;
  reg [3:0] writeToReadPtr; // @[rxfifo.scala 35:31:@335.4]
  reg [31:0] _RAND_2;
  reg  _T_39; // @[rxfifo.scala 37:25:@337.4]
  reg [31:0] _RAND_3;
  reg [3:0] _T_43; // @[rxfifo.scala 39:36:@339.4]
  reg [31:0] _RAND_4;
  reg [3:0] _T_45; // @[rxfifo.scala 40:36:@341.4]
  reg [31:0] _RAND_5;
  wire  _T_47; // @[rxfifo.scala 43:59:@344.4]
  wire  _T_48; // @[rxfifo.scala 43:56:@345.4]
  wire [3:0] _GEN_15; // @[rxfifo.scala 43:42:@346.4]
  wire [4:0] _T_49; // @[rxfifo.scala 43:42:@346.4]
  wire [3:0] _T_50; // @[rxfifo.scala 43:42:@347.4]
  wire [2:0] _T_51; // @[rxfifo.scala 45:45:@350.4]
  wire [3:0] _GEN_16; // @[rxfifo.scala 45:51:@351.4]
  wire [3:0] _T_52; // @[rxfifo.scala 45:51:@351.4]
  wire [1:0] _T_53; // @[rxfifo.scala 48:62:@355.4]
  wire [1:0] _T_54; // @[rxfifo.scala 48:44:@356.4]
  wire [1:0] _T_55; // @[rxfifo.scala 48:91:@357.4]
  wire [3:0] _T_56; // @[Cat.scala 30:58:@358.4]
  wire  _T_57; // @[rxfifo.scala 48:36:@359.4]
  reg [3:0] _T_65; // @[rxfifo.scala 59:32:@370.4]
  reg [31:0] _RAND_6;
  reg [3:0] readToWritePtr; // @[rxfifo.scala 61:30:@372.4]
  reg [31:0] _RAND_7;
  reg  _T_75; // @[rxfifo.scala 63:26:@374.4]
  reg [31:0] _RAND_8;
  reg [3:0] _T_79; // @[rxfifo.scala 65:37:@376.4]
  reg [31:0] _RAND_9;
  reg [3:0] _T_81; // @[rxfifo.scala 66:37:@378.4]
  reg [31:0] _RAND_10;
  wire  _T_83; // @[rxfifo.scala 68:56:@381.4]
  wire  _T_84; // @[rxfifo.scala 68:53:@382.4]
  wire [3:0] _GEN_17; // @[rxfifo.scala 68:40:@383.4]
  wire [4:0] _T_85; // @[rxfifo.scala 68:40:@383.4]
  wire [3:0] _T_86; // @[rxfifo.scala 68:40:@384.4]
  wire [2:0] _T_87; // @[rxfifo.scala 70:43:@387.4]
  wire [3:0] _GEN_18; // @[rxfifo.scala 70:49:@388.4]
  wire [3:0] _T_88; // @[rxfifo.scala 70:49:@388.4]
  wire  _T_89; // @[rxfifo.scala 73:36:@392.4]
  wire [2:0] _T_90; // @[rxfifo.scala 76:41:@395.4]
  wire  _GEN_6; // @[rxfifo.scala 76:27:@399.4]
  reg [2:0] ram__T_98_addr_pipe_0;
  reg [31:0] _RAND_11;
  assign ram__T_98_addr = ram__T_98_addr_pipe_0;
  assign ram__T_98_data = ram[ram__T_98_addr]; // @[rxfifo.scala 27:24:@330.4]
  assign ram__T_62_data = io_dataIn;
  assign ram__T_62_addr = _T_29[2:0];
  assign ram__T_62_mask = 1'h1;
  assign ram__T_62_en = io_writeEn & _T_47;
  assign _T_47 = _T_39 == 1'h0; // @[rxfifo.scala 43:59:@344.4]
  assign _T_48 = io_writeEn & _T_47; // @[rxfifo.scala 43:56:@345.4]
  assign _GEN_15 = {{3'd0}, _T_48}; // @[rxfifo.scala 43:42:@346.4]
  assign _T_49 = _T_29 + _GEN_15; // @[rxfifo.scala 43:42:@346.4]
  assign _T_50 = _T_49[3:0]; // @[rxfifo.scala 43:42:@347.4]
  assign _T_51 = _T_50[3:1]; // @[rxfifo.scala 45:45:@350.4]
  assign _GEN_16 = {{1'd0}, _T_51}; // @[rxfifo.scala 45:51:@351.4]
  assign _T_52 = _GEN_16 ^ _T_50; // @[rxfifo.scala 45:51:@351.4]
  assign _T_53 = _T_45[3:2]; // @[rxfifo.scala 48:62:@355.4]
  assign _T_54 = ~ _T_53; // @[rxfifo.scala 48:44:@356.4]
  assign _T_55 = _T_45[1:0]; // @[rxfifo.scala 48:91:@357.4]
  assign _T_56 = {_T_54,_T_55}; // @[Cat.scala 30:58:@358.4]
  assign _T_57 = _T_52 == _T_56; // @[rxfifo.scala 48:36:@359.4]
  assign _T_83 = _T_75 == 1'h0; // @[rxfifo.scala 68:56:@381.4]
  assign _T_84 = io_readEn & _T_83; // @[rxfifo.scala 68:53:@382.4]
  assign _GEN_17 = {{3'd0}, _T_84}; // @[rxfifo.scala 68:40:@383.4]
  assign _T_85 = _T_65 + _GEN_17; // @[rxfifo.scala 68:40:@383.4]
  assign _T_86 = _T_85[3:0]; // @[rxfifo.scala 68:40:@384.4]
  assign _T_87 = _T_86[3:1]; // @[rxfifo.scala 70:43:@387.4]
  assign _GEN_18 = {{1'd0}, _T_87}; // @[rxfifo.scala 70:49:@388.4]
  assign _T_88 = _GEN_18 ^ _T_86; // @[rxfifo.scala 70:49:@388.4]
  assign _T_89 = _T_88 == _T_81; // @[rxfifo.scala 73:36:@392.4]
  assign _T_90 = _T_65[2:0]; // @[rxfifo.scala 76:41:@395.4]
  assign _GEN_6 = _T_83; // @[rxfifo.scala 76:27:@399.4]
  assign io_full = _T_39; // @[rxfifo.scala 55:13:@369.4]
  assign io_writePtr = _T_29; // @[rxfifo.scala 42:17:@343.4]
  assign io_dataOut = ram__T_98_data; // @[rxfifo.scala 76:16:@405.4]
  assign io_empty = _T_75; // @[rxfifo.scala 77:14:@406.4]
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
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_29 = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  writeToReadPtr = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_39 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_43 = _RAND_4[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_45 = _RAND_5[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_65 = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  readToWritePtr = _RAND_7[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_75 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_79 = _RAND_9[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_81 = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  ram__T_98_addr_pipe_0 = _RAND_11[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge io_writeClk) begin
    if(ram__T_62_en & ram__T_62_mask) begin
      ram[ram__T_62_addr] <= ram__T_62_data; // @[rxfifo.scala 27:24:@330.4]
    end
    if (io_systemRst) begin
      _T_29 <= 4'h0;
    end else begin
      _T_29 <= _T_50;
    end
    if (io_systemRst) begin
      writeToReadPtr <= 4'h0;
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
      _T_65 <= 4'h0;
    end else begin
      _T_65 <= _T_86;
    end
    if (io_systemRst) begin
      readToWritePtr <= 4'h0;
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
module apbqspi_ssp( // @[:@408.2]
  input         clock, // @[:@409.4]
  input         reset, // @[:@410.4]
  input         io_PCLK, // @[:@411.4]
  input         io_PRESETn, // @[:@411.4]
  input  [31:0] io_PADDR, // @[:@411.4]
  input         io_PPROT, // @[:@411.4]
  input         io_PSEL, // @[:@411.4]
  input         io_PENABLE, // @[:@411.4]
  input         io_PWRITE, // @[:@411.4]
  input  [31:0] io_PWDATA, // @[:@411.4]
  input  [3:0]  io_PSTRB, // @[:@411.4]
  output        io_PREADY, // @[:@411.4]
  output [31:0] io_PRDATA, // @[:@411.4]
  output        io_PSLVERR, // @[:@411.4]
  output        io_interrupt, // @[:@411.4]
  input         io_io0_i, // @[:@411.4]
  output        io_io0_o, // @[:@411.4]
  output        io_io0_t, // @[:@411.4]
  input         io_io1_i, // @[:@411.4]
  output        io_io1_o, // @[:@411.4]
  output        io_io1_t, // @[:@411.4]
  input         io_io2_i, // @[:@411.4]
  output        io_io2_o, // @[:@411.4]
  output        io_io2_t, // @[:@411.4]
  input         io_io3_i, // @[:@411.4]
  output        io_io3_o, // @[:@411.4]
  output        io_io3_t, // @[:@411.4]
  input         io_spi_clk_i, // @[:@411.4]
  output        io_spi_clk_o, // @[:@411.4]
  output        io_spi_clk_t, // @[:@411.4]
  input         io_spi_ssel_i, // @[:@411.4]
  output [7:0]  io_spi_ssel_o, // @[:@411.4]
  output        io_spi_ssel_t // @[:@411.4]
);
  wire [4:0] FIFO_qspi_io_dataIn; // @[apbqspi.scala 131:24:@452.4]
  wire  FIFO_qspi_io_writeEn; // @[apbqspi.scala 131:24:@452.4]
  wire  FIFO_qspi_io_writeClk; // @[apbqspi.scala 131:24:@452.4]
  wire [4:0] FIFO_qspi_io_dataOut; // @[apbqspi.scala 131:24:@452.4]
  wire  FIFO_qspi_io_readEn; // @[apbqspi.scala 131:24:@452.4]
  wire  FIFO_qspi_io_readClk; // @[apbqspi.scala 131:24:@452.4]
  wire  FIFO_qspi_io_systemRst; // @[apbqspi.scala 131:24:@452.4]
  wire [4:0] FIFO_qspi_1_io_dataIn; // @[apbqspi.scala 132:24:@453.4]
  wire  FIFO_qspi_1_io_writeEn; // @[apbqspi.scala 132:24:@453.4]
  wire  FIFO_qspi_1_io_writeClk; // @[apbqspi.scala 132:24:@453.4]
  wire [4:0] FIFO_qspi_1_io_dataOut; // @[apbqspi.scala 132:24:@453.4]
  wire  FIFO_qspi_1_io_readEn; // @[apbqspi.scala 132:24:@453.4]
  wire  FIFO_qspi_1_io_readClk; // @[apbqspi.scala 132:24:@453.4]
  wire  FIFO_qspi_1_io_systemRst; // @[apbqspi.scala 132:24:@453.4]
  wire [4:0] FIFO_qspi_2_io_dataIn; // @[apbqspi.scala 133:24:@454.4]
  wire  FIFO_qspi_2_io_writeEn; // @[apbqspi.scala 133:24:@454.4]
  wire  FIFO_qspi_2_io_writeClk; // @[apbqspi.scala 133:24:@454.4]
  wire [4:0] FIFO_qspi_2_io_dataOut; // @[apbqspi.scala 133:24:@454.4]
  wire  FIFO_qspi_2_io_readEn; // @[apbqspi.scala 133:24:@454.4]
  wire  FIFO_qspi_2_io_readClk; // @[apbqspi.scala 133:24:@454.4]
  wire  FIFO_qspi_2_io_systemRst; // @[apbqspi.scala 133:24:@454.4]
  wire [16:0] FIFO_qspi_3_io_dataIn; // @[apbqspi.scala 134:24:@455.4]
  wire  FIFO_qspi_3_io_writeEn; // @[apbqspi.scala 134:24:@455.4]
  wire  FIFO_qspi_3_io_writeClk; // @[apbqspi.scala 134:24:@455.4]
  wire  FIFO_qspi_3_io_full; // @[apbqspi.scala 134:24:@455.4]
  wire [3:0] FIFO_qspi_3_io_writePtr; // @[apbqspi.scala 134:24:@455.4]
  wire [16:0] FIFO_qspi_3_io_dataOut; // @[apbqspi.scala 134:24:@455.4]
  wire  FIFO_qspi_3_io_readEn; // @[apbqspi.scala 134:24:@455.4]
  wire  FIFO_qspi_3_io_readClk; // @[apbqspi.scala 134:24:@455.4]
  wire  FIFO_qspi_3_io_empty; // @[apbqspi.scala 134:24:@455.4]
  wire  FIFO_qspi_3_io_systemRst; // @[apbqspi.scala 134:24:@455.4]
  wire [7:0] RXFIFO_io_dataIn; // @[apbqspi.scala 137:20:@456.4]
  wire  RXFIFO_io_writeEn; // @[apbqspi.scala 137:20:@456.4]
  wire  RXFIFO_io_writeClk; // @[apbqspi.scala 137:20:@456.4]
  wire  RXFIFO_io_full; // @[apbqspi.scala 137:20:@456.4]
  wire [3:0] RXFIFO_io_writePtr; // @[apbqspi.scala 137:20:@456.4]
  wire [7:0] RXFIFO_io_dataOut; // @[apbqspi.scala 137:20:@456.4]
  wire  RXFIFO_io_readEn; // @[apbqspi.scala 137:20:@456.4]
  wire  RXFIFO_io_readClk; // @[apbqspi.scala 137:20:@456.4]
  wire  RXFIFO_io_empty; // @[apbqspi.scala 137:20:@456.4]
  wire  RXFIFO_io_systemRst; // @[apbqspi.scala 137:20:@456.4]
  reg  interrupt_r; // @[apbqspi.scala 76:26:@417.4]
  reg [31:0] _RAND_0;
  wire  _T_74; // @[apbqspi.scala 84:28:@419.4]
  reg  _T_77; // @[apbqspi.scala 87:26:@420.4]
  reg [31:0] _RAND_1;
  reg  _T_83; // @[apbqspi.scala 90:21:@422.4]
  reg [31:0] _RAND_2;
  reg  _T_86; // @[apbqspi.scala 91:21:@423.4]
  reg [31:0] _RAND_3;
  reg  _T_89; // @[apbqspi.scala 92:21:@424.4]
  reg [31:0] _RAND_4;
  reg  _T_92; // @[apbqspi.scala 93:21:@425.4]
  reg [31:0] _RAND_5;
  reg  _T_95; // @[apbqspi.scala 95:21:@426.4]
  reg [31:0] _RAND_6;
  reg  _T_98; // @[apbqspi.scala 96:21:@427.4]
  reg [31:0] _RAND_7;
  reg  _T_101; // @[apbqspi.scala 97:21:@428.4]
  reg [31:0] _RAND_8;
  reg  _T_104; // @[apbqspi.scala 98:21:@429.4]
  reg [31:0] _RAND_9;
  reg  _T_115; // @[apbqspi.scala 111:24:@442.4]
  reg [31:0] _RAND_10;
  reg [7:0] _T_121; // @[apbqspi.scala 114:25:@444.4]
  reg [31:0] _RAND_11;
  reg [31:0] _T_127; // @[apbqspi.scala 121:20:@448.4]
  reg [31:0] _RAND_12;
  reg [1:0] _T_135; // @[apbqspi.scala 127:22:@450.4]
  reg [31:0] _RAND_13;
  reg [4:0] _T_142; // @[apbqspi.scala 149:28:@461.4]
  reg [31:0] _RAND_14;
  reg [4:0] _T_145; // @[apbqspi.scala 150:28:@462.4]
  reg [31:0] _RAND_15;
  reg [4:0] _T_148; // @[apbqspi.scala 151:28:@463.4]
  reg [31:0] _RAND_16;
  reg [16:0] _T_151; // @[apbqspi.scala 152:28:@464.4]
  reg [31:0] _RAND_17;
  reg [4:0] _T_162; // @[apbqspi.scala 174:28:@481.4]
  reg [31:0] _RAND_18;
  reg [4:0] _T_165; // @[apbqspi.scala 175:28:@482.4]
  reg [31:0] _RAND_19;
  reg [4:0] _T_168; // @[apbqspi.scala 176:28:@483.4]
  reg [31:0] _RAND_20;
  reg [16:0] _T_171; // @[apbqspi.scala 177:28:@484.4]
  reg [31:0] _RAND_21;
  reg  _T_174; // @[apbqspi.scala 180:28:@485.4]
  reg [31:0] _RAND_22;
  reg  _T_183; // @[apbqspi.scala 193:27:@497.4]
  reg [31:0] _RAND_23;
  reg  _T_192; // @[apbqspi.scala 203:27:@505.4]
  reg [31:0] _RAND_24;
  reg  _T_195; // @[apbqspi.scala 204:27:@506.4]
  reg [31:0] _RAND_25;
  reg  _T_198; // @[apbqspi.scala 212:23:@509.4]
  reg [31:0] _RAND_26;
  wire  _T_199; // @[apbqspi.scala 213:15:@510.4]
  wire  _T_201; // @[apbqspi.scala 213:31:@511.4]
  wire  _T_202; // @[apbqspi.scala 213:28:@512.4]
  wire [7:0] _T_203; // @[apbqspi.scala 213:55:@513.4]
  wire  _T_217; // @[apbqspi.scala 213:61:@514.4]
  wire  _T_218; // @[apbqspi.scala 213:43:@515.4]
  wire  _T_220; // @[apbqspi.scala 214:25:@517.6]
  wire  _GEN_0; // @[apbqspi.scala 213:86:@516.4]
  wire  _T_223; // @[apbqspi.scala 218:18:@523.4]
  wire  _T_224; // @[apbqspi.scala 218:15:@524.4]
  wire  _T_227; // @[apbqspi.scala 218:29:@526.4]
  wire  _T_230; // @[apbqspi.scala 218:44:@529.4]
  wire [31:0] _GEN_1; // @[apbqspi.scala 218:87:@530.4]
  wire  _T_237; // @[apbqspi.scala 223:61:@537.4]
  wire  _T_238; // @[apbqspi.scala 223:43:@538.4]
  wire  _T_239; // @[apbqspi.scala 224:22:@540.6]
  wire  _T_240; // @[apbqspi.scala 225:22:@542.6]
  wire  _T_241; // @[apbqspi.scala 226:22:@544.6]
  wire  _T_242; // @[apbqspi.scala 227:22:@546.6]
  wire  _GEN_2; // @[apbqspi.scala 223:88:@539.4]
  wire  _GEN_3; // @[apbqspi.scala 223:88:@539.4]
  wire  _GEN_4; // @[apbqspi.scala 223:88:@539.4]
  wire  _GEN_5; // @[apbqspi.scala 223:88:@539.4]
  reg  _T_245; // @[apbqspi.scala 232:26:@549.4]
  reg [31:0] _RAND_27;
  reg  _T_248; // @[apbqspi.scala 233:26:@550.4]
  reg [31:0] _RAND_28;
  reg  _T_251; // @[apbqspi.scala 234:26:@551.4]
  reg [31:0] _RAND_29;
  reg  _T_254; // @[apbqspi.scala 235:26:@552.4]
  reg [31:0] _RAND_30;
  reg  _T_257; // @[apbqspi.scala 236:26:@553.4]
  reg [31:0] _RAND_31;
  reg  _T_260; // @[apbqspi.scala 237:26:@554.4]
  reg [31:0] _RAND_32;
  reg  _T_263; // @[apbqspi.scala 238:26:@555.4]
  reg [31:0] _RAND_33;
  reg  _T_266; // @[apbqspi.scala 239:26:@556.4]
  reg [31:0] _RAND_34;
  reg  _T_269; // @[apbqspi.scala 240:26:@557.4]
  reg [31:0] _RAND_35;
  reg  _T_272; // @[apbqspi.scala 241:26:@558.4]
  reg [31:0] _RAND_36;
  reg [16:0] _T_275; // @[apbqspi.scala 243:26:@559.4]
  reg [31:0] _RAND_37;
  wire  _T_281; // @[apbqspi.scala 245:61:@564.4]
  wire  _T_282; // @[apbqspi.scala 245:43:@565.4]
  wire  _T_283; // @[apbqspi.scala 246:29:@567.6]
  wire  _T_284; // @[apbqspi.scala 247:29:@569.6]
  wire  _T_285; // @[apbqspi.scala 248:29:@571.6]
  wire  _T_286; // @[apbqspi.scala 249:29:@573.6]
  wire  _T_287; // @[apbqspi.scala 250:29:@575.6]
  wire  _T_288; // @[apbqspi.scala 251:29:@577.6]
  wire  _T_289; // @[apbqspi.scala 252:29:@579.6]
  wire  _GEN_6; // @[apbqspi.scala 245:88:@566.4]
  wire  _GEN_7; // @[apbqspi.scala 245:88:@566.4]
  wire  _GEN_8; // @[apbqspi.scala 245:88:@566.4]
  wire  _GEN_9; // @[apbqspi.scala 245:88:@566.4]
  wire  _GEN_10; // @[apbqspi.scala 245:88:@566.4]
  wire  _GEN_11; // @[apbqspi.scala 245:88:@566.4]
  wire  _GEN_12; // @[apbqspi.scala 245:88:@566.4]
  wire  _GEN_13; // @[apbqspi.scala 245:88:@566.4]
  wire  _GEN_14; // @[apbqspi.scala 245:88:@566.4]
  wire  _GEN_15; // @[apbqspi.scala 245:88:@566.4]
  wire  _GEN_16; // @[apbqspi.scala 245:88:@566.4]
  wire  _T_302; // @[apbqspi.scala 258:44:@596.4]
  wire [1:0] _T_304; // @[Cat.scala 30:58:@598.6]
  wire [2:0] _T_305; // @[Cat.scala 30:58:@599.6]
  wire [1:0] _T_306; // @[Cat.scala 30:58:@600.6]
  wire [2:0] _T_307; // @[Cat.scala 30:58:@601.6]
  wire [5:0] _T_308; // @[Cat.scala 30:58:@602.6]
  wire [1:0] _T_309; // @[Cat.scala 30:58:@603.6]
  wire [2:0] _T_310; // @[Cat.scala 30:58:@604.6]
  wire [20:0] _T_311; // @[Cat.scala 30:58:@605.6]
  wire [21:0] _T_312; // @[Cat.scala 30:58:@606.6]
  wire [24:0] _T_313; // @[Cat.scala 30:58:@607.6]
  wire [30:0] _T_314; // @[Cat.scala 30:58:@608.6]
  wire [31:0] _GEN_17; // @[apbqspi.scala 258:89:@597.4]
  wire  _T_328; // @[apbqspi.scala 272:62:@618.4]
  wire  _T_329; // @[apbqspi.scala 272:44:@619.4]
  wire [1:0] _T_331; // @[Cat.scala 30:58:@621.6]
  wire [2:0] _T_332; // @[Cat.scala 30:58:@622.6]
  wire [1:0] _T_333; // @[Cat.scala 30:58:@623.6]
  wire [27:0] _T_335; // @[Cat.scala 30:58:@625.6]
  wire [30:0] _T_336; // @[Cat.scala 30:58:@626.6]
  wire [31:0] _GEN_18; // @[apbqspi.scala 272:89:@620.4]
  wire [1:0] _T_351; // @[Cat.scala 30:58:@637.4]
  wire [1:0] _T_352; // @[Cat.scala 30:58:@638.4]
  wire [2:0] _T_353; // @[Cat.scala 30:58:@639.4]
  wire [4:0] _T_354; // @[Cat.scala 30:58:@640.4]
  wire [1:0] _T_360; // @[Cat.scala 30:58:@645.4]
  wire [1:0] _T_361; // @[Cat.scala 30:58:@646.4]
  wire [2:0] _T_362; // @[Cat.scala 30:58:@647.4]
  wire [4:0] _T_363; // @[Cat.scala 30:58:@648.4]
  wire [1:0] _T_369; // @[Cat.scala 30:58:@653.4]
  wire [1:0] _T_370; // @[Cat.scala 30:58:@654.4]
  wire [2:0] _T_371; // @[Cat.scala 30:58:@655.4]
  wire [4:0] _T_372; // @[Cat.scala 30:58:@656.4]
  wire [1:0] _T_378; // @[Cat.scala 30:58:@661.4]
  wire [1:0] _T_379; // @[Cat.scala 30:58:@662.4]
  wire [2:0] _T_380; // @[Cat.scala 30:58:@663.4]
  wire [4:0] _T_381; // @[Cat.scala 30:58:@664.4]
  wire [1:0] _T_387; // @[Cat.scala 30:58:@669.4]
  wire [1:0] _T_388; // @[Cat.scala 30:58:@670.4]
  wire [2:0] _T_389; // @[Cat.scala 30:58:@671.4]
  wire [4:0] _T_390; // @[Cat.scala 30:58:@672.4]
  wire [1:0] _T_396; // @[Cat.scala 30:58:@677.4]
  wire [1:0] _T_397; // @[Cat.scala 30:58:@678.4]
  wire [2:0] _T_398; // @[Cat.scala 30:58:@679.4]
  wire [4:0] _T_399; // @[Cat.scala 30:58:@680.4]
  wire [1:0] _T_405; // @[Cat.scala 30:58:@685.4]
  wire [1:0] _T_406; // @[Cat.scala 30:58:@686.4]
  wire [2:0] _T_407; // @[Cat.scala 30:58:@687.4]
  wire [4:0] _T_408; // @[Cat.scala 30:58:@688.4]
  wire [1:0] _T_414; // @[Cat.scala 30:58:@693.4]
  wire [1:0] _T_415; // @[Cat.scala 30:58:@694.4]
  wire [2:0] _T_416; // @[Cat.scala 30:58:@695.4]
  wire [4:0] _T_417; // @[Cat.scala 30:58:@696.4]
  wire [1:0] _T_513; // @[Cat.scala 30:58:@773.4]
  wire [2:0] _T_515; // @[Cat.scala 30:58:@775.4]
  wire [4:0] _T_516; // @[Cat.scala 30:58:@776.4]
  wire [1:0] _T_522; // @[Cat.scala 30:58:@781.4]
  wire [2:0] _T_524; // @[Cat.scala 30:58:@783.4]
  wire [4:0] _T_525; // @[Cat.scala 30:58:@784.4]
  wire [1:0] _T_531; // @[Cat.scala 30:58:@789.4]
  wire [2:0] _T_533; // @[Cat.scala 30:58:@791.4]
  wire [4:0] _T_534; // @[Cat.scala 30:58:@792.4]
  wire [1:0] _T_540; // @[Cat.scala 30:58:@797.4]
  wire [2:0] _T_542; // @[Cat.scala 30:58:@799.4]
  wire [4:0] _T_543; // @[Cat.scala 30:58:@800.4]
  wire [1:0] _T_549; // @[Cat.scala 30:58:@805.4]
  wire [2:0] _T_551; // @[Cat.scala 30:58:@807.4]
  wire [4:0] _T_552; // @[Cat.scala 30:58:@808.4]
  wire [1:0] _T_558; // @[Cat.scala 30:58:@813.4]
  wire [2:0] _T_560; // @[Cat.scala 30:58:@815.4]
  wire [4:0] _T_561; // @[Cat.scala 30:58:@816.4]
  wire [1:0] _T_567; // @[Cat.scala 30:58:@821.4]
  wire [2:0] _T_569; // @[Cat.scala 30:58:@823.4]
  wire [4:0] _T_570; // @[Cat.scala 30:58:@824.4]
  wire [1:0] _T_576; // @[Cat.scala 30:58:@829.4]
  wire [2:0] _T_578; // @[Cat.scala 30:58:@831.4]
  wire [4:0] _T_579; // @[Cat.scala 30:58:@832.4]
  wire [3:0] _T_713; // @[Cat.scala 30:58:@935.4]
  wire [3:0] _T_716; // @[Cat.scala 30:58:@938.4]
  wire [7:0] _T_717; // @[Cat.scala 30:58:@939.4]
  wire [3:0] _T_720; // @[Cat.scala 30:58:@942.4]
  wire [4:0] _T_724; // @[Cat.scala 30:58:@946.4]
  wire [8:0] _T_725; // @[Cat.scala 30:58:@947.4]
  wire [16:0] _T_726; // @[Cat.scala 30:58:@948.4]
  wire [3:0] _T_746; // @[Cat.scala 30:58:@967.4]
  wire [3:0] _T_749; // @[Cat.scala 30:58:@970.4]
  wire [7:0] _T_750; // @[Cat.scala 30:58:@971.4]
  wire [3:0] _T_753; // @[Cat.scala 30:58:@974.4]
  wire [4:0] _T_757; // @[Cat.scala 30:58:@978.4]
  wire [8:0] _T_758; // @[Cat.scala 30:58:@979.4]
  wire [16:0] _T_759; // @[Cat.scala 30:58:@980.4]
  wire [1:0] _T_910; // @[Cat.scala 30:58:@1094.4]
  wire [3:0] _T_911; // @[Cat.scala 30:58:@1095.4]
  wire [1:0] _T_912; // @[Cat.scala 30:58:@1096.4]
  wire [1:0] _T_913; // @[Cat.scala 30:58:@1097.4]
  wire [3:0] _T_914; // @[Cat.scala 30:58:@1098.4]
  wire [7:0] _T_915; // @[Cat.scala 30:58:@1099.4]
  wire [1:0] _T_916; // @[Cat.scala 30:58:@1100.4]
  wire [1:0] _T_917; // @[Cat.scala 30:58:@1101.4]
  wire [3:0] _T_918; // @[Cat.scala 30:58:@1102.4]
  wire [1:0] _T_919; // @[Cat.scala 30:58:@1103.4]
  wire [2:0] _T_921; // @[Cat.scala 30:58:@1105.4]
  wire [4:0] _T_922; // @[Cat.scala 30:58:@1106.4]
  wire [8:0] _T_923; // @[Cat.scala 30:58:@1107.4]
  wire [16:0] _T_924; // @[Cat.scala 30:58:@1108.4]
  wire [1:0] _T_943; // @[Cat.scala 30:58:@1126.4]
  wire [3:0] _T_944; // @[Cat.scala 30:58:@1127.4]
  wire [1:0] _T_945; // @[Cat.scala 30:58:@1128.4]
  wire [1:0] _T_946; // @[Cat.scala 30:58:@1129.4]
  wire [3:0] _T_947; // @[Cat.scala 30:58:@1130.4]
  wire [7:0] _T_948; // @[Cat.scala 30:58:@1131.4]
  wire [1:0] _T_949; // @[Cat.scala 30:58:@1132.4]
  wire [1:0] _T_950; // @[Cat.scala 30:58:@1133.4]
  wire [3:0] _T_951; // @[Cat.scala 30:58:@1134.4]
  wire [1:0] _T_952; // @[Cat.scala 30:58:@1135.4]
  wire [2:0] _T_954; // @[Cat.scala 30:58:@1137.4]
  wire [4:0] _T_955; // @[Cat.scala 30:58:@1138.4]
  wire [8:0] _T_956; // @[Cat.scala 30:58:@1139.4]
  wire [16:0] _T_957; // @[Cat.scala 30:58:@1140.4]
  wire [1:0] _T_1057; // @[Cat.scala 30:58:@1221.4]
  wire  _T_1063; // @[Mux.scala 46:19:@1222.4]
  wire [4:0] _T_1064; // @[Mux.scala 46:16:@1223.4]
  wire  _T_1065; // @[Mux.scala 46:19:@1224.4]
  wire [4:0] _T_1066; // @[Mux.scala 46:16:@1225.4]
  wire  _T_1067; // @[Mux.scala 46:19:@1226.4]
  wire [4:0] _T_1068; // @[Mux.scala 46:16:@1227.4]
  wire  _T_1069; // @[Mux.scala 46:19:@1228.4]
  wire [4:0] _T_1070; // @[Mux.scala 46:16:@1229.4]
  wire [16:0] _T_1078; // @[Mux.scala 46:16:@1232.4]
  wire [16:0] _T_1080; // @[Mux.scala 46:16:@1234.4]
  wire [16:0] _T_1082; // @[Mux.scala 46:16:@1236.4]
  wire [16:0] _T_1084; // @[Mux.scala 46:16:@1238.4]
  wire [16:0] _T_1086; // @[Cat.scala 30:58:@1239.4]
  wire [16:0] _T_1087; // @[apbqspi.scala 375:19:@1240.4]
  wire  _T_1093; // @[apbqspi.scala 380:61:@1245.4]
  wire  _T_1094; // @[apbqspi.scala 380:43:@1246.4]
  wire [4:0] _T_1098; // @[apbqspi.scala 384:11:@1249.6]
  wire [4:0] _T_1102; // @[apbqspi.scala 386:11:@1251.6]
  wire [4:0] _T_1106; // @[Mux.scala 46:16:@1254.6]
  wire [4:0] _T_1108; // @[Mux.scala 46:16:@1256.6]
  wire [4:0] _T_1110; // @[Mux.scala 46:16:@1258.6]
  wire [4:0] _T_1112; // @[Mux.scala 46:16:@1260.6]
  wire [4:0] _T_1116; // @[apbqspi.scala 391:11:@1263.6]
  wire [4:0] _T_1120; // @[apbqspi.scala 393:11:@1265.6]
  wire [4:0] _T_1124; // @[Mux.scala 46:16:@1268.6]
  wire [4:0] _T_1126; // @[Mux.scala 46:16:@1270.6]
  wire [4:0] _T_1128; // @[Mux.scala 46:16:@1272.6]
  wire [4:0] _T_1130; // @[Mux.scala 46:16:@1274.6]
  wire [4:0] _T_1134; // @[apbqspi.scala 398:11:@1277.6]
  wire [4:0] _T_1138; // @[apbqspi.scala 400:11:@1279.6]
  wire [4:0] _T_1142; // @[Mux.scala 46:16:@1282.6]
  wire [4:0] _T_1144; // @[Mux.scala 46:16:@1284.6]
  wire [4:0] _T_1146; // @[Mux.scala 46:16:@1286.6]
  wire [4:0] _T_1148; // @[Mux.scala 46:16:@1288.6]
  wire [4:0] _T_1152; // @[apbqspi.scala 408:11:@1291.6]
  wire [4:0] _T_1156; // @[apbqspi.scala 410:11:@1293.6]
  wire [4:0] _T_1160; // @[Mux.scala 46:16:@1296.6]
  wire [4:0] _T_1162; // @[Mux.scala 46:16:@1298.6]
  wire [4:0] _T_1164; // @[Mux.scala 46:16:@1300.6]
  wire [4:0] _T_1166; // @[Mux.scala 46:16:@1302.6]
  wire [16:0] _T_1168; // @[Cat.scala 30:58:@1303.6]
  wire [16:0] _T_1172; // @[apbqspi.scala 413:11:@1305.6]
  wire [16:0] _T_1176; // @[apbqspi.scala 415:11:@1307.6]
  wire [16:0] _T_1180; // @[Mux.scala 46:16:@1310.6]
  wire [16:0] _T_1182; // @[Mux.scala 46:16:@1312.6]
  wire [16:0] _T_1184; // @[Mux.scala 46:16:@1314.6]
  wire [16:0] _T_1186; // @[Mux.scala 46:16:@1316.6]
  wire [16:0] _T_1187; // @[apbqspi.scala 406:20:@1317.6]
  wire [4:0] _GEN_19; // @[apbqspi.scala 380:89:@1247.4]
  wire [4:0] _GEN_20; // @[apbqspi.scala 380:89:@1247.4]
  wire [4:0] _GEN_21; // @[apbqspi.scala 380:89:@1247.4]
  wire [16:0] _GEN_22; // @[apbqspi.scala 380:89:@1247.4]
  wire  _T_1202; // @[apbqspi.scala 431:44:@1334.4]
  wire [31:0] _GEN_24; // @[apbqspi.scala 431:90:@1335.4]
  wire  _T_1211; // @[apbqspi.scala 439:62:@1343.4]
  wire  _T_1212; // @[apbqspi.scala 439:44:@1344.4]
  wire [31:0] _GEN_26; // @[apbqspi.scala 439:90:@1345.4]
  wire  _T_1222; // @[apbqspi.scala 449:62:@1357.4]
  wire  _T_1223; // @[apbqspi.scala 449:44:@1358.4]
  wire [31:0] _GEN_27; // @[apbqspi.scala 449:94:@1359.4]
  wire  _T_1231; // @[apbqspi.scala 453:62:@1367.4]
  wire  _T_1232; // @[apbqspi.scala 453:44:@1368.4]
  wire [31:0] _GEN_28; // @[apbqspi.scala 453:94:@1369.4]
  reg  _T_1235; // @[apbqspi.scala 459:18:@1372.4]
  reg [31:0] _RAND_38;
  wire  _T_1240; // @[apbqspi.scala 460:43:@1376.4]
  wire  _T_1242; // @[apbqspi.scala 460:75:@1378.4]
  wire  _T_1243; // @[apbqspi.scala 460:57:@1379.4]
  wire  _T_1244; // @[apbqspi.scala 461:17:@1381.6]
  wire  _GEN_29; // @[apbqspi.scala 460:102:@1380.4]
  wire  _T_1253; // @[apbqspi.scala 463:45:@1390.4]
  wire [31:0] _T_1255; // @[Cat.scala 30:58:@1392.6]
  wire [31:0] _GEN_30; // @[apbqspi.scala 463:90:@1391.4]
  reg  _T_1258; // @[apbqspi.scala 468:34:@1395.4]
  reg [31:0] _RAND_39;
  reg  _T_1261; // @[apbqspi.scala 469:34:@1396.4]
  reg [31:0] _RAND_40;
  reg  _T_1264; // @[apbqspi.scala 470:34:@1397.4]
  reg [31:0] _RAND_41;
  reg  _T_1267; // @[apbqspi.scala 471:34:@1398.4]
  reg [31:0] _RAND_42;
  reg  _T_1270; // @[apbqspi.scala 472:34:@1399.4]
  reg [31:0] _RAND_43;
  reg  _T_1273; // @[apbqspi.scala 473:34:@1400.4]
  reg [31:0] _RAND_44;
  reg  _T_1276; // @[apbqspi.scala 474:34:@1401.4]
  reg [31:0] _RAND_45;
  reg  _T_1279; // @[apbqspi.scala 475:34:@1402.4]
  reg [31:0] _RAND_46;
  reg  _T_1282; // @[apbqspi.scala 476:34:@1403.4]
  reg [31:0] _RAND_47;
  wire  _T_1288; // @[apbqspi.scala 478:61:@1408.4]
  wire  _T_1289; // @[apbqspi.scala 478:43:@1409.4]
  wire  _T_1291; // @[apbqspi.scala 479:25:@1411.6]
  wire  _T_1293; // @[apbqspi.scala 479:42:@1413.6]
  wire  _T_1295; // @[apbqspi.scala 479:61:@1414.6]
  wire  _T_1296; // @[apbqspi.scala 479:58:@1415.6]
  wire  _T_1298; // @[apbqspi.scala 480:25:@1417.6]
  wire  _T_1300; // @[apbqspi.scala 480:42:@1419.6]
  wire  _T_1303; // @[apbqspi.scala 480:58:@1421.6]
  wire  _T_1305; // @[apbqspi.scala 481:25:@1423.6]
  wire  _T_1307; // @[apbqspi.scala 481:42:@1425.6]
  wire  _T_1309; // @[apbqspi.scala 482:25:@1427.6]
  wire  _T_1311; // @[apbqspi.scala 482:42:@1429.6]
  wire  _T_1313; // @[apbqspi.scala 483:25:@1431.6]
  wire  _T_1315; // @[apbqspi.scala 483:42:@1433.6]
  wire  _T_1317; // @[apbqspi.scala 484:25:@1435.6]
  wire  _T_1319; // @[apbqspi.scala 484:42:@1437.6]
  wire  _T_1322; // @[apbqspi.scala 484:58:@1439.6]
  wire  _T_1323; // @[apbqspi.scala 484:71:@1440.6]
  wire  _T_1325; // @[apbqspi.scala 485:25:@1442.6]
  wire  _T_1327; // @[apbqspi.scala 485:42:@1444.6]
  wire  _T_1331; // @[apbqspi.scala 486:42:@1448.6]
  wire  _T_1333; // @[apbqspi.scala 487:25:@1450.6]
  wire  _T_1335; // @[apbqspi.scala 487:42:@1452.6]
  wire  _T_1339; // @[apbqspi.scala 490:42:@1457.6]
  wire  _T_1340; // @[apbqspi.scala 490:39:@1458.6]
  wire  _T_1342; // @[apbqspi.scala 490:28:@1459.6]
  wire  _T_1346; // @[apbqspi.scala 491:42:@1462.6]
  wire  _T_1347; // @[apbqspi.scala 491:39:@1463.6]
  wire  _T_1349; // @[apbqspi.scala 491:28:@1464.6]
  wire  _T_1351; // @[apbqspi.scala 492:52:@1466.6]
  wire  _T_1353; // @[apbqspi.scala 492:28:@1467.6]
  wire  _T_1354; // @[apbqspi.scala 493:39:@1469.6]
  wire  _T_1356; // @[apbqspi.scala 493:28:@1470.6]
  wire  _T_1358; // @[apbqspi.scala 494:28:@1472.6]
  wire  _T_1361; // @[apbqspi.scala 495:40:@1475.6]
  wire  _T_1362; // @[apbqspi.scala 495:53:@1476.6]
  wire  _T_1363; // @[apbqspi.scala 495:63:@1477.6]
  wire  _T_1365; // @[apbqspi.scala 495:28:@1478.6]
  wire  _T_1367; // @[apbqspi.scala 496:28:@1480.6]
  wire  _T_1371; // @[apbqspi.scala 497:42:@1483.6]
  wire  _T_1372; // @[apbqspi.scala 497:39:@1484.6]
  wire  _T_1375; // @[apbqspi.scala 497:50:@1486.6]
  wire  _T_1377; // @[apbqspi.scala 497:28:@1487.6]
  wire  _T_1380; // @[apbqspi.scala 498:38:@1490.6]
  wire  _T_1382; // @[apbqspi.scala 498:28:@1491.6]
  wire  _GEN_31; // @[apbqspi.scala 478:88:@1410.4]
  wire  _GEN_32; // @[apbqspi.scala 478:88:@1410.4]
  wire  _GEN_33; // @[apbqspi.scala 478:88:@1410.4]
  wire  _GEN_34; // @[apbqspi.scala 478:88:@1410.4]
  wire  _GEN_35; // @[apbqspi.scala 478:88:@1410.4]
  wire  _GEN_36; // @[apbqspi.scala 478:88:@1410.4]
  wire  _GEN_37; // @[apbqspi.scala 478:88:@1410.4]
  wire  _GEN_38; // @[apbqspi.scala 478:88:@1410.4]
  wire  _GEN_39; // @[apbqspi.scala 478:88:@1410.4]
  wire [1:0] _T_1391; // @[Cat.scala 30:58:@1501.6]
  wire [1:0] _T_1392; // @[Cat.scala 30:58:@1502.6]
  wire [2:0] _T_1393; // @[Cat.scala 30:58:@1503.6]
  wire [4:0] _T_1394; // @[Cat.scala 30:58:@1504.6]
  wire [1:0] _T_1395; // @[Cat.scala 30:58:@1505.6]
  wire [23:0] _T_1396; // @[Cat.scala 30:58:@1506.6]
  wire [24:0] _T_1397; // @[Cat.scala 30:58:@1507.6]
  wire [26:0] _T_1398; // @[Cat.scala 30:58:@1508.6]
  wire [31:0] _T_1399; // @[Cat.scala 30:58:@1509.6]
  wire [31:0] _GEN_40; // @[apbqspi.scala 502:88:@1500.4]
  reg  _T_1402; // @[apbqspi.scala 508:37:@1512.4]
  reg [31:0] _RAND_48;
  reg  _T_1405; // @[apbqspi.scala 509:37:@1513.4]
  reg [31:0] _RAND_49;
  reg  _T_1408; // @[apbqspi.scala 510:37:@1514.4]
  reg [31:0] _RAND_50;
  reg  _T_1411; // @[apbqspi.scala 511:37:@1515.4]
  reg [31:0] _RAND_51;
  reg  _T_1414; // @[apbqspi.scala 512:37:@1516.4]
  reg [31:0] _RAND_52;
  reg  _T_1417; // @[apbqspi.scala 513:37:@1517.4]
  reg [31:0] _RAND_53;
  reg  _T_1420; // @[apbqspi.scala 514:37:@1518.4]
  reg [31:0] _RAND_54;
  reg  _T_1423; // @[apbqspi.scala 515:37:@1519.4]
  reg [31:0] _RAND_55;
  reg  _T_1426; // @[apbqspi.scala 516:37:@1520.4]
  reg [31:0] _RAND_56;
  wire  _T_1432; // @[apbqspi.scala 518:61:@1525.4]
  wire  _T_1433; // @[apbqspi.scala 518:43:@1526.4]
  wire  _GEN_41; // @[apbqspi.scala 518:88:@1527.4]
  wire  _GEN_42; // @[apbqspi.scala 518:88:@1527.4]
  wire  _GEN_43; // @[apbqspi.scala 518:88:@1527.4]
  wire  _GEN_44; // @[apbqspi.scala 518:88:@1527.4]
  wire  _GEN_45; // @[apbqspi.scala 518:88:@1527.4]
  wire  _GEN_46; // @[apbqspi.scala 518:88:@1527.4]
  wire  _GEN_47; // @[apbqspi.scala 518:88:@1527.4]
  wire  _GEN_48; // @[apbqspi.scala 518:88:@1527.4]
  wire  _GEN_49; // @[apbqspi.scala 518:88:@1527.4]
  wire  _T_1443; // @[apbqspi.scala 531:32:@1547.4]
  wire  _T_1444; // @[apbqspi.scala 532:32:@1548.4]
  wire  _T_1445; // @[apbqspi.scala 533:32:@1549.4]
  wire  _T_1446; // @[apbqspi.scala 534:32:@1550.4]
  wire  _T_1447; // @[apbqspi.scala 535:32:@1551.4]
  wire  _T_1448; // @[apbqspi.scala 536:32:@1552.4]
  wire  _T_1449; // @[apbqspi.scala 537:32:@1553.4]
  wire  _T_1450; // @[apbqspi.scala 538:32:@1554.4]
  wire  _T_1451; // @[apbqspi.scala 539:32:@1555.4]
  wire  _T_1452; // @[apbqspi.scala 541:23:@1556.4]
  wire  _T_1453; // @[apbqspi.scala 541:32:@1557.4]
  wire  _T_1454; // @[apbqspi.scala 541:41:@1558.4]
  wire  _T_1455; // @[apbqspi.scala 541:50:@1559.4]
  wire  _T_1456; // @[apbqspi.scala 541:59:@1560.4]
  wire  _T_1457; // @[apbqspi.scala 541:68:@1561.4]
  wire  _T_1458; // @[apbqspi.scala 541:77:@1562.4]
  wire  _T_1459; // @[apbqspi.scala 541:86:@1563.4]
  wire  _T_1460; // @[apbqspi.scala 541:96:@1564.4]
  wire  _T_1466; // @[apbqspi.scala 546:61:@1570.4]
  wire  _T_1467; // @[apbqspi.scala 546:43:@1571.4]
  wire [7:0] _T_1468; // @[apbqspi.scala 547:24:@1573.6]
  wire [7:0] _GEN_50; // @[apbqspi.scala 546:89:@1572.4]
  reg [7:0] _T_1477; // @[apbqspi.scala 552:26:@1581.4]
  reg [31:0] _RAND_57;
  reg [7:0] _T_1480; // @[apbqspi.scala 553:26:@1582.4]
  reg [31:0] _RAND_58;
  reg [4:0] _T_1483; // @[apbqspi.scala 554:26:@1583.4]
  reg [31:0] _RAND_59;
  reg [4:0] _T_1486; // @[apbqspi.scala 555:27:@1584.4]
  reg [31:0] _RAND_60;
  wire [8:0] _T_1488; // @[apbqspi.scala 559:37:@1585.4]
  wire [8:0] _T_1489; // @[apbqspi.scala 559:37:@1586.4]
  wire [7:0] _T_1490; // @[apbqspi.scala 559:37:@1587.4]
  wire  _T_1491; // @[apbqspi.scala 559:24:@1588.4]
  wire  _T_1493; // @[apbqspi.scala 561:36:@1589.4]
  wire  _T_1494; // @[apbqspi.scala 561:20:@1590.4]
  wire  _T_1496; // @[apbqspi.scala 561:53:@1591.4]
  wire  _T_1498; // @[apbqspi.scala 561:77:@1592.4]
  wire  _T_1499; // @[apbqspi.scala 561:59:@1593.4]
  wire  _T_1500; // @[apbqspi.scala 561:49:@1594.4]
  wire  _T_1502; // @[apbqspi.scala 562:36:@1595.4]
  wire  _T_1503; // @[apbqspi.scala 562:20:@1596.4]
  wire  _T_1507; // @[apbqspi.scala 562:77:@1598.4]
  wire  _T_1508; // @[apbqspi.scala 562:59:@1599.4]
  wire  _T_1509; // @[apbqspi.scala 562:49:@1600.4]
  wire  _T_1511; // @[apbqspi.scala 563:36:@1601.4]
  wire  _T_1512; // @[apbqspi.scala 563:20:@1602.4]
  wire  _T_1516; // @[apbqspi.scala 563:77:@1604.4]
  wire  _T_1517; // @[apbqspi.scala 563:59:@1605.4]
  wire  _T_1518; // @[apbqspi.scala 563:49:@1606.4]
  wire  _T_1520; // @[apbqspi.scala 564:36:@1607.4]
  wire  _T_1521; // @[apbqspi.scala 564:20:@1608.4]
  wire  _T_1525; // @[apbqspi.scala 564:77:@1610.4]
  wire  _T_1526; // @[apbqspi.scala 564:59:@1611.4]
  wire  _T_1527; // @[apbqspi.scala 564:49:@1612.4]
  wire  _T_1529; // @[apbqspi.scala 565:36:@1613.4]
  wire  _T_1530; // @[apbqspi.scala 565:20:@1614.4]
  wire  _T_1534; // @[apbqspi.scala 565:77:@1616.4]
  wire  _T_1535; // @[apbqspi.scala 565:59:@1617.4]
  wire  _T_1536; // @[apbqspi.scala 565:49:@1618.4]
  wire  _T_1538; // @[apbqspi.scala 566:36:@1619.4]
  wire  _T_1539; // @[apbqspi.scala 566:20:@1620.4]
  wire  _T_1543; // @[apbqspi.scala 566:77:@1622.4]
  wire  _T_1544; // @[apbqspi.scala 566:59:@1623.4]
  wire  _T_1545; // @[apbqspi.scala 566:49:@1624.4]
  wire  _T_1547; // @[apbqspi.scala 567:36:@1625.4]
  wire  _T_1548; // @[apbqspi.scala 567:20:@1626.4]
  wire  _T_1552; // @[apbqspi.scala 567:77:@1628.4]
  wire  _T_1553; // @[apbqspi.scala 567:59:@1629.4]
  wire  _T_1554; // @[apbqspi.scala 567:49:@1630.4]
  wire  _T_1556; // @[apbqspi.scala 568:36:@1631.4]
  wire  _T_1557; // @[apbqspi.scala 568:20:@1632.4]
  wire  _T_1561; // @[apbqspi.scala 568:77:@1634.4]
  wire  _T_1562; // @[apbqspi.scala 568:59:@1635.4]
  wire  _T_1563; // @[apbqspi.scala 568:49:@1636.4]
  wire  _T_1565; // @[apbqspi.scala 579:31:@1637.4]
  wire  _T_1566; // @[apbqspi.scala 579:15:@1638.4]
  wire  _T_1568; // @[apbqspi.scala 580:31:@1639.4]
  wire  _T_1569; // @[apbqspi.scala 580:15:@1640.4]
  wire  _T_1571; // @[apbqspi.scala 581:31:@1641.4]
  wire  _T_1572; // @[apbqspi.scala 581:15:@1642.4]
  wire  _T_1574; // @[apbqspi.scala 582:31:@1643.4]
  wire  _T_1575; // @[apbqspi.scala 582:15:@1644.4]
  wire  _T_1576; // @[apbqspi.scala 584:15:@1645.4]
  reg  _T_1579; // @[apbqspi.scala 590:21:@1646.4]
  reg [31:0] _RAND_61;
  reg  _T_1582; // @[apbqspi.scala 591:21:@1647.4]
  reg [31:0] _RAND_62;
  reg  _T_1585; // @[apbqspi.scala 592:21:@1648.4]
  reg [31:0] _RAND_63;
  reg  _T_1588; // @[apbqspi.scala 593:21:@1649.4]
  reg [31:0] _RAND_64;
  reg  _T_1591; // @[apbqspi.scala 594:21:@1650.4]
  reg [31:0] _RAND_65;
  reg  _T_1594; // @[apbqspi.scala 595:21:@1651.4]
  reg [31:0] _RAND_66;
  reg  _T_1597; // @[apbqspi.scala 596:21:@1652.4]
  reg [31:0] _RAND_67;
  reg  _T_1600; // @[apbqspi.scala 597:21:@1653.4]
  reg [31:0] _RAND_68;
  wire [1:0] _T_1601; // @[Cat.scala 30:58:@1654.4]
  wire [1:0] _T_1602; // @[Cat.scala 30:58:@1655.4]
  wire [3:0] _T_1603; // @[Cat.scala 30:58:@1656.4]
  wire [1:0] _T_1604; // @[Cat.scala 30:58:@1657.4]
  wire [1:0] _T_1605; // @[Cat.scala 30:58:@1658.4]
  wire [3:0] _T_1606; // @[Cat.scala 30:58:@1659.4]
  wire [7:0] _T_1607; // @[Cat.scala 30:58:@1660.4]
  wire [1:0] _T_1608; // @[Cat.scala 30:58:@1661.4]
  wire [1:0] _T_1609; // @[Cat.scala 30:58:@1662.4]
  wire [3:0] _T_1610; // @[Cat.scala 30:58:@1663.4]
  wire [1:0] _T_1611; // @[Cat.scala 30:58:@1664.4]
  wire [1:0] _T_1612; // @[Cat.scala 30:58:@1665.4]
  wire [3:0] _T_1613; // @[Cat.scala 30:58:@1666.4]
  wire [7:0] _T_1614; // @[Cat.scala 30:58:@1667.4]
  wire  _T_1621; // @[apbqspi.scala 600:61:@1674.4]
  wire  _T_1622; // @[apbqspi.scala 600:43:@1675.4]
  wire [7:0] _GEN_52; // @[apbqspi.scala 600:90:@1676.4]
  wire  _T_1624; // @[apbqspi.scala 606:18:@1680.4]
  wire  _T_1627; // @[apbqspi.scala 606:30:@1682.4]
  wire  _T_1630; // @[apbqspi.scala 610:30:@1685.6]
  wire [4:0] _T_1644; // @[apbqspi.scala 622:31:@1698.6]
  wire  _T_1645; // @[Conditional.scala 37:30:@1702.6]
  wire  _T_1658; // @[apbqspi.scala 636:46:@1712.8]
  wire [1:0] _T_1659; // @[apbqspi.scala 637:46:@1714.8]
  wire  _T_1666; // @[Conditional.scala 37:30:@1724.8]
  wire [4:0] _T_1669; // @[apbqspi.scala 648:42:@1727.10]
  wire [4:0] _T_1671; // @[apbqspi.scala 649:42:@1729.10]
  wire [4:0] _T_1673; // @[apbqspi.scala 650:42:@1731.10]
  wire  _T_1687; // @[Conditional.scala 37:30:@1749.10]
  wire  _T_1689; // @[apbqspi.scala 673:56:@1753.12]
  wire  _T_1690; // @[apbqspi.scala 673:70:@1754.12]
  wire  _T_1691; // @[apbqspi.scala 673:38:@1755.12]
  wire [17:0] _GEN_169; // @[apbqspi.scala 674:46:@1757.12]
  wire [17:0] _T_1692; // @[apbqspi.scala 674:46:@1757.12]
  wire  _T_1693; // @[apbqspi.scala 676:48:@1759.12]
  wire [17:0] _GEN_170; // @[apbqspi.scala 677:49:@1761.12]
  wire [17:0] _T_1694; // @[apbqspi.scala 677:49:@1761.12]
  wire  _T_1695; // @[apbqspi.scala 679:59:@1763.12]
  wire  _T_1697; // @[apbqspi.scala 679:38:@1764.12]
  wire [5:0] _GEN_171; // @[apbqspi.scala 680:49:@1766.12]
  wire [5:0] _T_1698; // @[apbqspi.scala 680:49:@1766.12]
  wire  _T_1699; // @[apbqspi.scala 682:59:@1768.12]
  wire  _T_1701; // @[apbqspi.scala 682:38:@1769.12]
  wire [5:0] _GEN_172; // @[apbqspi.scala 683:49:@1771.12]
  wire [5:0] _T_1702; // @[apbqspi.scala 683:49:@1771.12]
  wire  _T_1703; // @[apbqspi.scala 686:59:@1773.12]
  wire  _T_1705; // @[apbqspi.scala 686:38:@1774.12]
  wire [5:0] _GEN_173; // @[apbqspi.scala 687:49:@1776.12]
  wire [5:0] _T_1706; // @[apbqspi.scala 687:49:@1776.12]
  wire  _T_1710; // @[Conditional.scala 37:30:@1783.12]
  wire  _T_1712; // @[apbqspi.scala 697:44:@1785.14]
  wire  _T_1714; // @[apbqspi.scala 697:34:@1787.14]
  wire [17:0] _T_1718; // @[apbqspi.scala 698:34:@1791.14]
  wire  _T_1722; // @[apbqspi.scala 701:35:@1795.14]
  wire [17:0] _T_1726; // @[apbqspi.scala 702:35:@1799.14]
  wire  _T_1732; // @[apbqspi.scala 704:35:@1804.14]
  wire [5:0] _T_1736; // @[apbqspi.scala 705:35:@1808.14]
  wire  _T_1742; // @[apbqspi.scala 707:35:@1813.14]
  wire [5:0] _T_1746; // @[apbqspi.scala 708:35:@1817.14]
  wire  _T_1752; // @[apbqspi.scala 710:35:@1822.14]
  wire [5:0] _T_1756; // @[apbqspi.scala 711:35:@1826.14]
  wire  _T_1762; // @[apbqspi.scala 715:80:@1832.14]
  wire [5:0] _T_1765; // @[apbqspi.scala 715:113:@1833.14]
  wire [4:0] _T_1766; // @[apbqspi.scala 715:113:@1834.14]
  wire [4:0] _T_1767; // @[apbqspi.scala 715:67:@1835.14]
  wire [4:0] _T_1768; // @[apbqspi.scala 715:34:@1836.14]
  wire  _T_1775; // @[apbqspi.scala 716:68:@1843.14]
  wire [1:0] _T_1776; // @[apbqspi.scala 716:34:@1844.14]
  wire [8:0] _T_1784; // @[apbqspi.scala 717:77:@1850.14]
  wire [7:0] _T_1785; // @[apbqspi.scala 717:77:@1851.14]
  wire [7:0] _T_1786; // @[apbqspi.scala 717:34:@1852.14]
  wire  _T_1787; // @[apbqspi.scala 719:53:@1854.14]
  wire  _T_1788; // @[apbqspi.scala 719:45:@1855.14]
  wire  _T_1790; // @[apbqspi.scala 720:34:@1857.14]
  wire  _T_1791; // @[apbqspi.scala 719:34:@1858.14]
  wire  _T_1793; // @[apbqspi.scala 722:45:@1861.14]
  wire  _T_1794; // @[apbqspi.scala 723:42:@1862.14]
  wire  _T_1795; // @[apbqspi.scala 723:34:@1863.14]
  wire  _T_1796; // @[apbqspi.scala 722:34:@1864.14]
  wire  _T_1798; // @[apbqspi.scala 725:45:@1867.14]
  wire  _T_1799; // @[apbqspi.scala 726:42:@1868.14]
  wire  _T_1800; // @[apbqspi.scala 726:34:@1869.14]
  wire  _T_1801; // @[apbqspi.scala 725:34:@1870.14]
  wire  _T_1803; // @[apbqspi.scala 728:45:@1873.14]
  wire  _T_1804; // @[apbqspi.scala 729:42:@1874.14]
  wire  _T_1805; // @[apbqspi.scala 729:34:@1875.14]
  wire  _T_1806; // @[apbqspi.scala 728:34:@1876.14]
  wire  _T_1808; // @[apbqspi.scala 731:45:@1879.14]
  wire  _T_1809; // @[apbqspi.scala 732:42:@1880.14]
  wire  _T_1810; // @[apbqspi.scala 732:34:@1881.14]
  wire  _T_1811; // @[apbqspi.scala 731:34:@1882.14]
  wire  _T_1813; // @[apbqspi.scala 734:45:@1885.14]
  wire  _T_1814; // @[apbqspi.scala 735:42:@1886.14]
  wire  _T_1815; // @[apbqspi.scala 735:34:@1887.14]
  wire  _T_1816; // @[apbqspi.scala 734:34:@1888.14]
  wire  _T_1818; // @[apbqspi.scala 737:45:@1891.14]
  wire  _T_1819; // @[apbqspi.scala 738:42:@1892.14]
  wire  _T_1820; // @[apbqspi.scala 738:34:@1893.14]
  wire  _T_1821; // @[apbqspi.scala 737:34:@1894.14]
  wire  _T_1823; // @[apbqspi.scala 740:45:@1897.14]
  wire  _T_1824; // @[apbqspi.scala 741:42:@1898.14]
  wire  _T_1825; // @[apbqspi.scala 741:34:@1899.14]
  wire  _T_1826; // @[apbqspi.scala 740:34:@1900.14]
  wire  _GEN_53; // @[Conditional.scala 39:67:@1784.12]
  wire [17:0] _GEN_54; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_55; // @[Conditional.scala 39:67:@1784.12]
  wire [17:0] _GEN_56; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_57; // @[Conditional.scala 39:67:@1784.12]
  wire [5:0] _GEN_58; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_59; // @[Conditional.scala 39:67:@1784.12]
  wire [5:0] _GEN_60; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_61; // @[Conditional.scala 39:67:@1784.12]
  wire [5:0] _GEN_62; // @[Conditional.scala 39:67:@1784.12]
  wire [4:0] _GEN_63; // @[Conditional.scala 39:67:@1784.12]
  wire [1:0] _GEN_64; // @[Conditional.scala 39:67:@1784.12]
  wire [7:0] _GEN_65; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_66; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_67; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_68; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_69; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_70; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_71; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_72; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_73; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_74; // @[Conditional.scala 39:67:@1784.12]
  wire  _GEN_75; // @[Conditional.scala 39:67:@1750.10]
  wire [1:0] _GEN_76; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_77; // @[Conditional.scala 39:67:@1750.10]
  wire [17:0] _GEN_78; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_79; // @[Conditional.scala 39:67:@1750.10]
  wire [17:0] _GEN_80; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_81; // @[Conditional.scala 39:67:@1750.10]
  wire [5:0] _GEN_82; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_83; // @[Conditional.scala 39:67:@1750.10]
  wire [5:0] _GEN_84; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_85; // @[Conditional.scala 39:67:@1750.10]
  wire [5:0] _GEN_86; // @[Conditional.scala 39:67:@1750.10]
  wire [4:0] _GEN_87; // @[Conditional.scala 39:67:@1750.10]
  wire [7:0] _GEN_88; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_89; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_90; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_91; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_92; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_93; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_94; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_95; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_96; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_97; // @[Conditional.scala 39:67:@1750.10]
  wire  _GEN_98; // @[Conditional.scala 39:67:@1725.8]
  wire [5:0] _GEN_99; // @[Conditional.scala 39:67:@1725.8]
  wire [5:0] _GEN_100; // @[Conditional.scala 39:67:@1725.8]
  wire [5:0] _GEN_101; // @[Conditional.scala 39:67:@1725.8]
  wire [17:0] _GEN_102; // @[Conditional.scala 39:67:@1725.8]
  wire [1:0] _GEN_103; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_104; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_105; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_106; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_107; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_108; // @[Conditional.scala 39:67:@1725.8]
  wire [7:0] _GEN_109; // @[Conditional.scala 39:67:@1725.8]
  wire [17:0] _GEN_110; // @[Conditional.scala 39:67:@1725.8]
  wire [4:0] _GEN_111; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_112; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_113; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_114; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_115; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_116; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_117; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_118; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_119; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_120; // @[Conditional.scala 39:67:@1725.8]
  wire  _GEN_121; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_122; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_123; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_124; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_125; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_126; // @[Conditional.scala 40:58:@1703.6]
  wire [1:0] _GEN_127; // @[Conditional.scala 40:58:@1703.6]
  wire [7:0] _GEN_128; // @[Conditional.scala 40:58:@1703.6]
  wire [17:0] _GEN_129; // @[Conditional.scala 40:58:@1703.6]
  wire [4:0] _GEN_130; // @[Conditional.scala 40:58:@1703.6]
  wire [4:0] _GEN_131; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_132; // @[Conditional.scala 40:58:@1703.6]
  wire [5:0] _GEN_133; // @[Conditional.scala 40:58:@1703.6]
  wire [5:0] _GEN_134; // @[Conditional.scala 40:58:@1703.6]
  wire [5:0] _GEN_135; // @[Conditional.scala 40:58:@1703.6]
  wire [17:0] _GEN_136; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_137; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_138; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_139; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_140; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_141; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_142; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_143; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_144; // @[Conditional.scala 40:58:@1703.6]
  wire  _GEN_145; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_146; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_147; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_148; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_149; // @[apbqspi.scala 606:42:@1683.4]
  wire [7:0] _GEN_150; // @[apbqspi.scala 606:42:@1683.4]
  wire [17:0] _GEN_151; // @[apbqspi.scala 606:42:@1683.4]
  wire [4:0] _GEN_152; // @[apbqspi.scala 606:42:@1683.4]
  wire [1:0] _GEN_153; // @[apbqspi.scala 606:42:@1683.4]
  wire [17:0] _GEN_154; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_155; // @[apbqspi.scala 606:42:@1683.4]
  wire [4:0] _GEN_156; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_157; // @[apbqspi.scala 606:42:@1683.4]
  wire [5:0] _GEN_158; // @[apbqspi.scala 606:42:@1683.4]
  wire [5:0] _GEN_159; // @[apbqspi.scala 606:42:@1683.4]
  wire [5:0] _GEN_160; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_161; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_162; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_163; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_164; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_165; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_166; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_167; // @[apbqspi.scala 606:42:@1683.4]
  wire  _GEN_168; // @[apbqspi.scala 606:42:@1683.4]
  FIFO_qspi FIFO_qspi ( // @[apbqspi.scala 131:24:@452.4]
    .io_dataIn(FIFO_qspi_io_dataIn),
    .io_writeEn(FIFO_qspi_io_writeEn),
    .io_writeClk(FIFO_qspi_io_writeClk),
    .io_dataOut(FIFO_qspi_io_dataOut),
    .io_readEn(FIFO_qspi_io_readEn),
    .io_readClk(FIFO_qspi_io_readClk),
    .io_systemRst(FIFO_qspi_io_systemRst)
  );
  FIFO_qspi FIFO_qspi_1 ( // @[apbqspi.scala 132:24:@453.4]
    .io_dataIn(FIFO_qspi_1_io_dataIn),
    .io_writeEn(FIFO_qspi_1_io_writeEn),
    .io_writeClk(FIFO_qspi_1_io_writeClk),
    .io_dataOut(FIFO_qspi_1_io_dataOut),
    .io_readEn(FIFO_qspi_1_io_readEn),
    .io_readClk(FIFO_qspi_1_io_readClk),
    .io_systemRst(FIFO_qspi_1_io_systemRst)
  );
  FIFO_qspi FIFO_qspi_2 ( // @[apbqspi.scala 133:24:@454.4]
    .io_dataIn(FIFO_qspi_2_io_dataIn),
    .io_writeEn(FIFO_qspi_2_io_writeEn),
    .io_writeClk(FIFO_qspi_2_io_writeClk),
    .io_dataOut(FIFO_qspi_2_io_dataOut),
    .io_readEn(FIFO_qspi_2_io_readEn),
    .io_readClk(FIFO_qspi_2_io_readClk),
    .io_systemRst(FIFO_qspi_2_io_systemRst)
  );
  FIFO_qspi_3 FIFO_qspi_3 ( // @[apbqspi.scala 134:24:@455.4]
    .io_dataIn(FIFO_qspi_3_io_dataIn),
    .io_writeEn(FIFO_qspi_3_io_writeEn),
    .io_writeClk(FIFO_qspi_3_io_writeClk),
    .io_full(FIFO_qspi_3_io_full),
    .io_writePtr(FIFO_qspi_3_io_writePtr),
    .io_dataOut(FIFO_qspi_3_io_dataOut),
    .io_readEn(FIFO_qspi_3_io_readEn),
    .io_readClk(FIFO_qspi_3_io_readClk),
    .io_empty(FIFO_qspi_3_io_empty),
    .io_systemRst(FIFO_qspi_3_io_systemRst)
  );
  RXFIFO RXFIFO ( // @[apbqspi.scala 137:20:@456.4]
    .io_dataIn(RXFIFO_io_dataIn),
    .io_writeEn(RXFIFO_io_writeEn),
    .io_writeClk(RXFIFO_io_writeClk),
    .io_full(RXFIFO_io_full),
    .io_writePtr(RXFIFO_io_writePtr),
    .io_dataOut(RXFIFO_io_dataOut),
    .io_readEn(RXFIFO_io_readEn),
    .io_readClk(RXFIFO_io_readClk),
    .io_empty(RXFIFO_io_empty),
    .io_systemRst(RXFIFO_io_systemRst)
  );
  assign _T_74 = io_PRESETn == 1'h0; // @[apbqspi.scala 84:28:@419.4]
  assign _T_199 = io_PSEL & io_PWRITE; // @[apbqspi.scala 213:15:@510.4]
  assign _T_201 = io_PENABLE == 1'h0; // @[apbqspi.scala 213:31:@511.4]
  assign _T_202 = _T_199 & _T_201; // @[apbqspi.scala 213:28:@512.4]
  assign _T_203 = io_PADDR[7:0]; // @[apbqspi.scala 213:55:@513.4]
  assign _T_217 = _T_203 == 8'h40; // @[apbqspi.scala 213:61:@514.4]
  assign _T_218 = _T_202 & _T_217; // @[apbqspi.scala 213:43:@515.4]
  assign _T_220 = io_PWDATA == 32'ha; // @[apbqspi.scala 214:25:@517.6]
  assign _GEN_0 = _T_218 ? _T_220 : 1'h0; // @[apbqspi.scala 213:86:@516.4]
  assign _T_223 = io_PWRITE == 1'h0; // @[apbqspi.scala 218:18:@523.4]
  assign _T_224 = io_PSEL & _T_223; // @[apbqspi.scala 218:15:@524.4]
  assign _T_227 = _T_224 & _T_201; // @[apbqspi.scala 218:29:@526.4]
  assign _T_230 = _T_227 & _T_217; // @[apbqspi.scala 218:44:@529.4]
  assign _GEN_1 = _T_230 ? 32'h0 : _T_127; // @[apbqspi.scala 218:87:@530.4]
  assign _T_237 = _T_203 == 8'h30; // @[apbqspi.scala 223:61:@537.4]
  assign _T_238 = _T_202 & _T_237; // @[apbqspi.scala 223:43:@538.4]
  assign _T_239 = io_PWDATA[3]; // @[apbqspi.scala 224:22:@540.6]
  assign _T_240 = io_PWDATA[2]; // @[apbqspi.scala 225:22:@542.6]
  assign _T_241 = io_PWDATA[1]; // @[apbqspi.scala 226:22:@544.6]
  assign _T_242 = io_PWDATA[0]; // @[apbqspi.scala 227:22:@546.6]
  assign _GEN_2 = _T_238 ? _T_239 : _T_104; // @[apbqspi.scala 223:88:@539.4]
  assign _GEN_3 = _T_238 ? _T_240 : _T_101; // @[apbqspi.scala 223:88:@539.4]
  assign _GEN_4 = _T_238 ? _T_241 : _T_98; // @[apbqspi.scala 223:88:@539.4]
  assign _GEN_5 = _T_238 ? _T_242 : _T_95; // @[apbqspi.scala 223:88:@539.4]
  assign _T_281 = _T_203 == 8'h60; // @[apbqspi.scala 245:61:@564.4]
  assign _T_282 = _T_202 & _T_281; // @[apbqspi.scala 245:43:@565.4]
  assign _T_283 = io_PWDATA[10]; // @[apbqspi.scala 246:29:@567.6]
  assign _T_284 = io_PWDATA[9]; // @[apbqspi.scala 247:29:@569.6]
  assign _T_285 = io_PWDATA[8]; // @[apbqspi.scala 248:29:@571.6]
  assign _T_286 = io_PWDATA[7]; // @[apbqspi.scala 249:29:@573.6]
  assign _T_287 = io_PWDATA[6]; // @[apbqspi.scala 250:29:@575.6]
  assign _T_288 = io_PWDATA[5]; // @[apbqspi.scala 251:29:@577.6]
  assign _T_289 = io_PWDATA[4]; // @[apbqspi.scala 252:29:@579.6]
  assign _GEN_6 = _T_282 ? _T_283 : _T_77; // @[apbqspi.scala 245:88:@566.4]
  assign _GEN_7 = _T_282 ? _T_284 : _T_245; // @[apbqspi.scala 245:88:@566.4]
  assign _GEN_8 = _T_282 ? _T_285 : _T_248; // @[apbqspi.scala 245:88:@566.4]
  assign _GEN_9 = _T_282 ? _T_286 : _T_251; // @[apbqspi.scala 245:88:@566.4]
  assign _GEN_10 = _T_282 ? _T_287 : _T_254; // @[apbqspi.scala 245:88:@566.4]
  assign _GEN_11 = _T_282 ? _T_288 : _T_257; // @[apbqspi.scala 245:88:@566.4]
  assign _GEN_12 = _T_282 ? _T_289 : _T_260; // @[apbqspi.scala 245:88:@566.4]
  assign _GEN_13 = _T_282 ? _T_239 : _T_263; // @[apbqspi.scala 245:88:@566.4]
  assign _GEN_14 = _T_282 ? _T_240 : _T_266; // @[apbqspi.scala 245:88:@566.4]
  assign _GEN_15 = _T_282 ? _T_241 : _T_269; // @[apbqspi.scala 245:88:@566.4]
  assign _GEN_16 = _T_282 ? _T_242 : _T_272; // @[apbqspi.scala 245:88:@566.4]
  assign _T_302 = _T_227 & _T_281; // @[apbqspi.scala 258:44:@596.4]
  assign _T_304 = {_T_266,_T_269}; // @[Cat.scala 30:58:@598.6]
  assign _T_305 = {_T_304,_T_272}; // @[Cat.scala 30:58:@599.6]
  assign _T_306 = {_T_257,_T_260}; // @[Cat.scala 30:58:@600.6]
  assign _T_307 = {_T_306,_T_263}; // @[Cat.scala 30:58:@601.6]
  assign _T_308 = {_T_307,_T_305}; // @[Cat.scala 30:58:@602.6]
  assign _T_309 = {_T_248,_T_251}; // @[Cat.scala 30:58:@603.6]
  assign _T_310 = {_T_309,_T_254}; // @[Cat.scala 30:58:@604.6]
  assign _T_311 = {20'h0,_T_77}; // @[Cat.scala 30:58:@605.6]
  assign _T_312 = {_T_311,_T_245}; // @[Cat.scala 30:58:@606.6]
  assign _T_313 = {_T_312,_T_310}; // @[Cat.scala 30:58:@607.6]
  assign _T_314 = {_T_313,_T_308}; // @[Cat.scala 30:58:@608.6]
  assign _GEN_17 = _T_302 ? {{1'd0}, _T_314} : _GEN_1; // @[apbqspi.scala 258:89:@597.4]
  assign _T_328 = _T_203 == 8'h64; // @[apbqspi.scala 272:62:@618.4]
  assign _T_329 = _T_227 & _T_328; // @[apbqspi.scala 272:44:@619.4]
  assign _T_331 = {FIFO_qspi_3_io_empty,RXFIFO_io_full}; // @[Cat.scala 30:58:@621.6]
  assign _T_332 = {_T_331,RXFIFO_io_empty}; // @[Cat.scala 30:58:@622.6]
  assign _T_333 = {1'h0,FIFO_qspi_3_io_full}; // @[Cat.scala 30:58:@623.6]
  assign _T_335 = {26'h1,_T_333}; // @[Cat.scala 30:58:@625.6]
  assign _T_336 = {_T_335,_T_332}; // @[Cat.scala 30:58:@626.6]
  assign _GEN_18 = _T_329 ? {{1'd0}, _T_336} : _GEN_17; // @[apbqspi.scala 272:89:@620.4]
  assign _T_351 = {_T_239,_T_239}; // @[Cat.scala 30:58:@637.4]
  assign _T_352 = {1'h0,_T_286}; // @[Cat.scala 30:58:@638.4]
  assign _T_353 = {_T_352,_T_286}; // @[Cat.scala 30:58:@639.4]
  assign _T_354 = {_T_353,_T_351}; // @[Cat.scala 30:58:@640.4]
  assign _T_360 = {_T_240,_T_240}; // @[Cat.scala 30:58:@645.4]
  assign _T_361 = {1'h0,_T_287}; // @[Cat.scala 30:58:@646.4]
  assign _T_362 = {_T_361,_T_287}; // @[Cat.scala 30:58:@647.4]
  assign _T_363 = {_T_362,_T_360}; // @[Cat.scala 30:58:@648.4]
  assign _T_369 = {_T_241,_T_241}; // @[Cat.scala 30:58:@653.4]
  assign _T_370 = {1'h0,_T_288}; // @[Cat.scala 30:58:@654.4]
  assign _T_371 = {_T_370,_T_288}; // @[Cat.scala 30:58:@655.4]
  assign _T_372 = {_T_371,_T_369}; // @[Cat.scala 30:58:@656.4]
  assign _T_378 = {_T_242,_T_242}; // @[Cat.scala 30:58:@661.4]
  assign _T_379 = {1'h0,_T_289}; // @[Cat.scala 30:58:@662.4]
  assign _T_380 = {_T_379,_T_289}; // @[Cat.scala 30:58:@663.4]
  assign _T_381 = {_T_380,_T_378}; // @[Cat.scala 30:58:@664.4]
  assign _T_387 = {_T_286,_T_286}; // @[Cat.scala 30:58:@669.4]
  assign _T_388 = {1'h0,_T_239}; // @[Cat.scala 30:58:@670.4]
  assign _T_389 = {_T_388,_T_239}; // @[Cat.scala 30:58:@671.4]
  assign _T_390 = {_T_389,_T_387}; // @[Cat.scala 30:58:@672.4]
  assign _T_396 = {_T_287,_T_287}; // @[Cat.scala 30:58:@677.4]
  assign _T_397 = {1'h0,_T_240}; // @[Cat.scala 30:58:@678.4]
  assign _T_398 = {_T_397,_T_240}; // @[Cat.scala 30:58:@679.4]
  assign _T_399 = {_T_398,_T_396}; // @[Cat.scala 30:58:@680.4]
  assign _T_405 = {_T_288,_T_288}; // @[Cat.scala 30:58:@685.4]
  assign _T_406 = {1'h0,_T_241}; // @[Cat.scala 30:58:@686.4]
  assign _T_407 = {_T_406,_T_241}; // @[Cat.scala 30:58:@687.4]
  assign _T_408 = {_T_407,_T_405}; // @[Cat.scala 30:58:@688.4]
  assign _T_414 = {_T_289,_T_289}; // @[Cat.scala 30:58:@693.4]
  assign _T_415 = {1'h0,_T_242}; // @[Cat.scala 30:58:@694.4]
  assign _T_416 = {_T_415,_T_242}; // @[Cat.scala 30:58:@695.4]
  assign _T_417 = {_T_416,_T_414}; // @[Cat.scala 30:58:@696.4]
  assign _T_513 = {_T_239,1'h0}; // @[Cat.scala 30:58:@773.4]
  assign _T_515 = {_T_387,_T_239}; // @[Cat.scala 30:58:@775.4]
  assign _T_516 = {_T_515,_T_513}; // @[Cat.scala 30:58:@776.4]
  assign _T_522 = {_T_240,1'h0}; // @[Cat.scala 30:58:@781.4]
  assign _T_524 = {_T_396,_T_240}; // @[Cat.scala 30:58:@783.4]
  assign _T_525 = {_T_524,_T_522}; // @[Cat.scala 30:58:@784.4]
  assign _T_531 = {_T_241,1'h0}; // @[Cat.scala 30:58:@789.4]
  assign _T_533 = {_T_405,_T_241}; // @[Cat.scala 30:58:@791.4]
  assign _T_534 = {_T_533,_T_531}; // @[Cat.scala 30:58:@792.4]
  assign _T_540 = {_T_242,1'h0}; // @[Cat.scala 30:58:@797.4]
  assign _T_542 = {_T_414,_T_242}; // @[Cat.scala 30:58:@799.4]
  assign _T_543 = {_T_542,_T_540}; // @[Cat.scala 30:58:@800.4]
  assign _T_549 = {_T_286,1'h0}; // @[Cat.scala 30:58:@805.4]
  assign _T_551 = {_T_351,_T_286}; // @[Cat.scala 30:58:@807.4]
  assign _T_552 = {_T_551,_T_549}; // @[Cat.scala 30:58:@808.4]
  assign _T_558 = {_T_287,1'h0}; // @[Cat.scala 30:58:@813.4]
  assign _T_560 = {_T_360,_T_287}; // @[Cat.scala 30:58:@815.4]
  assign _T_561 = {_T_560,_T_558}; // @[Cat.scala 30:58:@816.4]
  assign _T_567 = {_T_288,1'h0}; // @[Cat.scala 30:58:@821.4]
  assign _T_569 = {_T_369,_T_288}; // @[Cat.scala 30:58:@823.4]
  assign _T_570 = {_T_569,_T_567}; // @[Cat.scala 30:58:@824.4]
  assign _T_576 = {_T_289,1'h0}; // @[Cat.scala 30:58:@829.4]
  assign _T_578 = {_T_378,_T_289}; // @[Cat.scala 30:58:@831.4]
  assign _T_579 = {_T_578,_T_576}; // @[Cat.scala 30:58:@832.4]
  assign _T_713 = {_T_369,_T_378}; // @[Cat.scala 30:58:@935.4]
  assign _T_716 = {_T_351,_T_360}; // @[Cat.scala 30:58:@938.4]
  assign _T_717 = {_T_716,_T_713}; // @[Cat.scala 30:58:@939.4]
  assign _T_720 = {_T_405,_T_414}; // @[Cat.scala 30:58:@942.4]
  assign _T_724 = {_T_353,_T_396}; // @[Cat.scala 30:58:@946.4]
  assign _T_725 = {_T_724,_T_720}; // @[Cat.scala 30:58:@947.4]
  assign _T_726 = {_T_725,_T_717}; // @[Cat.scala 30:58:@948.4]
  assign _T_746 = {_T_396,_T_387}; // @[Cat.scala 30:58:@967.4]
  assign _T_749 = {_T_414,_T_405}; // @[Cat.scala 30:58:@970.4]
  assign _T_750 = {_T_749,_T_746}; // @[Cat.scala 30:58:@971.4]
  assign _T_753 = {_T_360,_T_351}; // @[Cat.scala 30:58:@974.4]
  assign _T_757 = {_T_416,_T_369}; // @[Cat.scala 30:58:@978.4]
  assign _T_758 = {_T_757,_T_753}; // @[Cat.scala 30:58:@979.4]
  assign _T_759 = {_T_758,_T_750}; // @[Cat.scala 30:58:@980.4]
  assign _T_910 = {_T_241,_T_242}; // @[Cat.scala 30:58:@1094.4]
  assign _T_911 = {_T_910,_T_540}; // @[Cat.scala 30:58:@1095.4]
  assign _T_912 = {_T_240,_T_241}; // @[Cat.scala 30:58:@1096.4]
  assign _T_913 = {_T_239,_T_240}; // @[Cat.scala 30:58:@1097.4]
  assign _T_914 = {_T_913,_T_912}; // @[Cat.scala 30:58:@1098.4]
  assign _T_915 = {_T_914,_T_911}; // @[Cat.scala 30:58:@1099.4]
  assign _T_916 = {_T_289,_T_239}; // @[Cat.scala 30:58:@1100.4]
  assign _T_917 = {_T_288,_T_289}; // @[Cat.scala 30:58:@1101.4]
  assign _T_918 = {_T_917,_T_916}; // @[Cat.scala 30:58:@1102.4]
  assign _T_919 = {_T_287,_T_288}; // @[Cat.scala 30:58:@1103.4]
  assign _T_921 = {_T_387,_T_287}; // @[Cat.scala 30:58:@1105.4]
  assign _T_922 = {_T_921,_T_919}; // @[Cat.scala 30:58:@1106.4]
  assign _T_923 = {_T_922,_T_918}; // @[Cat.scala 30:58:@1107.4]
  assign _T_924 = {_T_923,_T_915}; // @[Cat.scala 30:58:@1108.4]
  assign _T_943 = {_T_287,_T_286}; // @[Cat.scala 30:58:@1126.4]
  assign _T_944 = {_T_943,_T_549}; // @[Cat.scala 30:58:@1127.4]
  assign _T_945 = {_T_288,_T_287}; // @[Cat.scala 30:58:@1128.4]
  assign _T_946 = {_T_289,_T_288}; // @[Cat.scala 30:58:@1129.4]
  assign _T_947 = {_T_946,_T_945}; // @[Cat.scala 30:58:@1130.4]
  assign _T_948 = {_T_947,_T_944}; // @[Cat.scala 30:58:@1131.4]
  assign _T_949 = {_T_239,_T_289}; // @[Cat.scala 30:58:@1132.4]
  assign _T_950 = {_T_240,_T_239}; // @[Cat.scala 30:58:@1133.4]
  assign _T_951 = {_T_950,_T_949}; // @[Cat.scala 30:58:@1134.4]
  assign _T_952 = {_T_241,_T_240}; // @[Cat.scala 30:58:@1135.4]
  assign _T_954 = {_T_378,_T_241}; // @[Cat.scala 30:58:@1137.4]
  assign _T_955 = {_T_954,_T_952}; // @[Cat.scala 30:58:@1138.4]
  assign _T_956 = {_T_955,_T_951}; // @[Cat.scala 30:58:@1139.4]
  assign _T_957 = {_T_956,_T_948}; // @[Cat.scala 30:58:@1140.4]
  assign _T_1057 = {_T_260,_T_263}; // @[Cat.scala 30:58:@1221.4]
  assign _T_1063 = 2'h0 == _T_1057; // @[Mux.scala 46:19:@1222.4]
  assign _T_1064 = _T_1063 ? 5'ha : 5'h0; // @[Mux.scala 46:16:@1223.4]
  assign _T_1065 = 2'h1 == _T_1057; // @[Mux.scala 46:19:@1224.4]
  assign _T_1066 = _T_1065 ? 5'h15 : _T_1064; // @[Mux.scala 46:16:@1225.4]
  assign _T_1067 = 2'h2 == _T_1057; // @[Mux.scala 46:19:@1226.4]
  assign _T_1068 = _T_1067 ? 5'ha : _T_1066; // @[Mux.scala 46:16:@1227.4]
  assign _T_1069 = 2'h3 == _T_1057; // @[Mux.scala 46:19:@1228.4]
  assign _T_1070 = _T_1069 ? 5'h15 : _T_1068; // @[Mux.scala 46:16:@1229.4]
  assign _T_1078 = _T_1063 ? 17'haaaa : 17'h0; // @[Mux.scala 46:16:@1232.4]
  assign _T_1080 = _T_1065 ? 17'h15555 : _T_1078; // @[Mux.scala 46:16:@1234.4]
  assign _T_1082 = _T_1067 ? 17'haaaa : _T_1080; // @[Mux.scala 46:16:@1236.4]
  assign _T_1084 = _T_1069 ? 17'h15555 : _T_1082; // @[Mux.scala 46:16:@1238.4]
  assign _T_1086 = {_T_1070,12'h0}; // @[Cat.scala 30:58:@1239.4]
  assign _T_1087 = _T_77 ? _T_1086 : _T_1084; // @[apbqspi.scala 375:19:@1240.4]
  assign _T_1093 = _T_203 == 8'h68; // @[apbqspi.scala 380:61:@1245.4]
  assign _T_1094 = _T_202 & _T_1093; // @[apbqspi.scala 380:43:@1246.4]
  assign _T_1098 = _T_245 ? _T_390 : _T_354; // @[apbqspi.scala 384:11:@1249.6]
  assign _T_1102 = _T_245 ? _T_552 : _T_516; // @[apbqspi.scala 386:11:@1251.6]
  assign _T_1106 = _T_1063 ? _T_1102 : 5'h0; // @[Mux.scala 46:16:@1254.6]
  assign _T_1108 = _T_1065 ? _T_1102 : _T_1106; // @[Mux.scala 46:16:@1256.6]
  assign _T_1110 = _T_1067 ? _T_1098 : _T_1108; // @[Mux.scala 46:16:@1258.6]
  assign _T_1112 = _T_1069 ? _T_1098 : _T_1110; // @[Mux.scala 46:16:@1260.6]
  assign _T_1116 = _T_245 ? _T_399 : _T_363; // @[apbqspi.scala 391:11:@1263.6]
  assign _T_1120 = _T_245 ? _T_561 : _T_525; // @[apbqspi.scala 393:11:@1265.6]
  assign _T_1124 = _T_1063 ? _T_1120 : 5'h0; // @[Mux.scala 46:16:@1268.6]
  assign _T_1126 = _T_1065 ? _T_1120 : _T_1124; // @[Mux.scala 46:16:@1270.6]
  assign _T_1128 = _T_1067 ? _T_1116 : _T_1126; // @[Mux.scala 46:16:@1272.6]
  assign _T_1130 = _T_1069 ? _T_1116 : _T_1128; // @[Mux.scala 46:16:@1274.6]
  assign _T_1134 = _T_245 ? _T_408 : _T_372; // @[apbqspi.scala 398:11:@1277.6]
  assign _T_1138 = _T_245 ? _T_570 : _T_534; // @[apbqspi.scala 400:11:@1279.6]
  assign _T_1142 = _T_1063 ? _T_1138 : 5'h0; // @[Mux.scala 46:16:@1282.6]
  assign _T_1144 = _T_1065 ? _T_1138 : _T_1142; // @[Mux.scala 46:16:@1284.6]
  assign _T_1146 = _T_1067 ? _T_1134 : _T_1144; // @[Mux.scala 46:16:@1286.6]
  assign _T_1148 = _T_1069 ? _T_1134 : _T_1146; // @[Mux.scala 46:16:@1288.6]
  assign _T_1152 = _T_245 ? _T_417 : _T_381; // @[apbqspi.scala 408:11:@1291.6]
  assign _T_1156 = _T_245 ? _T_579 : _T_543; // @[apbqspi.scala 410:11:@1293.6]
  assign _T_1160 = _T_1063 ? _T_1156 : 5'h0; // @[Mux.scala 46:16:@1296.6]
  assign _T_1162 = _T_1065 ? _T_1156 : _T_1160; // @[Mux.scala 46:16:@1298.6]
  assign _T_1164 = _T_1067 ? _T_1152 : _T_1162; // @[Mux.scala 46:16:@1300.6]
  assign _T_1166 = _T_1069 ? _T_1152 : _T_1164; // @[Mux.scala 46:16:@1302.6]
  assign _T_1168 = {_T_1166,12'h0}; // @[Cat.scala 30:58:@1303.6]
  assign _T_1172 = _T_245 ? _T_759 : _T_726; // @[apbqspi.scala 413:11:@1305.6]
  assign _T_1176 = _T_245 ? _T_957 : _T_924; // @[apbqspi.scala 415:11:@1307.6]
  assign _T_1180 = _T_1063 ? _T_1176 : 17'h0; // @[Mux.scala 46:16:@1310.6]
  assign _T_1182 = _T_1065 ? _T_1176 : _T_1180; // @[Mux.scala 46:16:@1312.6]
  assign _T_1184 = _T_1067 ? _T_1172 : _T_1182; // @[Mux.scala 46:16:@1314.6]
  assign _T_1186 = _T_1069 ? _T_1172 : _T_1184; // @[Mux.scala 46:16:@1316.6]
  assign _T_1187 = _T_77 ? _T_1168 : _T_1186; // @[apbqspi.scala 406:20:@1317.6]
  assign _GEN_19 = _T_1094 ? _T_1112 : 5'h0; // @[apbqspi.scala 380:89:@1247.4]
  assign _GEN_20 = _T_1094 ? _T_1130 : 5'h0; // @[apbqspi.scala 380:89:@1247.4]
  assign _GEN_21 = _T_1094 ? _T_1148 : 5'h0; // @[apbqspi.scala 380:89:@1247.4]
  assign _GEN_22 = _T_1094 ? _T_1187 : 17'h0; // @[apbqspi.scala 380:89:@1247.4]
  assign _T_1202 = _T_227 & _T_1093; // @[apbqspi.scala 431:44:@1334.4]
  assign _GEN_24 = _T_1202 ? 32'h0 : _GEN_18; // @[apbqspi.scala 431:90:@1335.4]
  assign _T_1211 = _T_203 == 8'h6c; // @[apbqspi.scala 439:62:@1343.4]
  assign _T_1212 = _T_227 & _T_1211; // @[apbqspi.scala 439:44:@1344.4]
  assign _GEN_26 = _T_1212 ? {{24'd0}, RXFIFO_io_dataOut} : _GEN_24; // @[apbqspi.scala 439:90:@1345.4]
  assign _T_1222 = _T_203 == 8'h74; // @[apbqspi.scala 449:62:@1357.4]
  assign _T_1223 = _T_227 & _T_1222; // @[apbqspi.scala 449:44:@1358.4]
  assign _GEN_27 = _T_1223 ? {{28'd0}, FIFO_qspi_3_io_writePtr} : _GEN_26; // @[apbqspi.scala 449:94:@1359.4]
  assign _T_1231 = _T_203 == 8'h78; // @[apbqspi.scala 453:62:@1367.4]
  assign _T_1232 = _T_227 & _T_1231; // @[apbqspi.scala 453:44:@1368.4]
  assign _GEN_28 = _T_1232 ? {{28'd0}, RXFIFO_io_writePtr} : _GEN_27; // @[apbqspi.scala 453:94:@1369.4]
  assign _T_1240 = _T_202 & io_PENABLE; // @[apbqspi.scala 460:43:@1376.4]
  assign _T_1242 = _T_203 == 8'h1c; // @[apbqspi.scala 460:75:@1378.4]
  assign _T_1243 = _T_1240 & _T_1242; // @[apbqspi.scala 460:57:@1379.4]
  assign _T_1244 = io_PWDATA[31]; // @[apbqspi.scala 461:17:@1381.6]
  assign _GEN_29 = _T_1243 ? _T_1244 : _T_1235; // @[apbqspi.scala 460:102:@1380.4]
  assign _T_1253 = _T_227 & _T_1242; // @[apbqspi.scala 463:45:@1390.4]
  assign _T_1255 = {_T_1235,31'h0}; // @[Cat.scala 30:58:@1392.6]
  assign _GEN_30 = _T_1253 ? _T_1255 : _GEN_28; // @[apbqspi.scala 463:90:@1391.4]
  assign _T_1288 = _T_203 == 8'h20; // @[apbqspi.scala 478:61:@1408.4]
  assign _T_1289 = _T_202 & _T_1288; // @[apbqspi.scala 478:43:@1409.4]
  assign _T_1291 = _T_1258 == 1'h0; // @[apbqspi.scala 479:25:@1411.6]
  assign _T_1293 = _T_1291 & _T_285; // @[apbqspi.scala 479:42:@1413.6]
  assign _T_1295 = _T_266 == 1'h0; // @[apbqspi.scala 479:61:@1414.6]
  assign _T_1296 = _T_1293 & _T_1295; // @[apbqspi.scala 479:58:@1415.6]
  assign _T_1298 = _T_1261 == 1'h0; // @[apbqspi.scala 480:25:@1417.6]
  assign _T_1300 = _T_1298 & _T_286; // @[apbqspi.scala 480:42:@1419.6]
  assign _T_1303 = _T_1300 & _T_1295; // @[apbqspi.scala 480:58:@1421.6]
  assign _T_1305 = _T_1264 == 1'h0; // @[apbqspi.scala 481:25:@1423.6]
  assign _T_1307 = _T_1305 & _T_287; // @[apbqspi.scala 481:42:@1425.6]
  assign _T_1309 = _T_1267 == 1'h0; // @[apbqspi.scala 482:25:@1427.6]
  assign _T_1311 = _T_1309 & _T_288; // @[apbqspi.scala 482:42:@1429.6]
  assign _T_1313 = _T_1270 == 1'h0; // @[apbqspi.scala 483:25:@1431.6]
  assign _T_1315 = _T_1313 & _T_289; // @[apbqspi.scala 483:42:@1433.6]
  assign _T_1317 = _T_1273 == 1'h0; // @[apbqspi.scala 484:25:@1435.6]
  assign _T_1319 = _T_1317 & _T_239; // @[apbqspi.scala 484:42:@1437.6]
  assign _T_1322 = _T_1319 & _T_1295; // @[apbqspi.scala 484:58:@1439.6]
  assign _T_1323 = _T_1322 & _T_269; // @[apbqspi.scala 484:71:@1440.6]
  assign _T_1325 = _T_1276 == 1'h0; // @[apbqspi.scala 485:25:@1442.6]
  assign _T_1327 = _T_1325 & _T_240; // @[apbqspi.scala 485:42:@1444.6]
  assign _T_1331 = _T_1325 & _T_241; // @[apbqspi.scala 486:42:@1448.6]
  assign _T_1333 = _T_1282 == 1'h0; // @[apbqspi.scala 487:25:@1450.6]
  assign _T_1335 = _T_1333 & _T_242; // @[apbqspi.scala 487:42:@1452.6]
  assign _T_1339 = FIFO_qspi_3_io_empty == 1'h0; // @[apbqspi.scala 490:42:@1457.6]
  assign _T_1340 = _T_1295 & _T_1339; // @[apbqspi.scala 490:39:@1458.6]
  assign _T_1342 = _T_1340 ? 1'h1 : _T_1258; // @[apbqspi.scala 490:28:@1459.6]
  assign _T_1346 = io_spi_ssel_i == 1'h0; // @[apbqspi.scala 491:42:@1462.6]
  assign _T_1347 = _T_1295 & _T_1346; // @[apbqspi.scala 491:39:@1463.6]
  assign _T_1349 = _T_1347 ? 1'h1 : _T_1261; // @[apbqspi.scala 491:28:@1464.6]
  assign _T_1351 = FIFO_qspi_3_io_writePtr == 4'h4; // @[apbqspi.scala 492:52:@1466.6]
  assign _T_1353 = _T_1351 ? 1'h1 : _T_1264; // @[apbqspi.scala 492:28:@1467.6]
  assign _T_1354 = _T_192 & RXFIFO_io_full; // @[apbqspi.scala 493:39:@1469.6]
  assign _T_1356 = _T_1354 ? 1'h1 : _T_1267; // @[apbqspi.scala 493:28:@1470.6]
  assign _T_1358 = RXFIFO_io_full ? 1'h1 : _T_1267; // @[apbqspi.scala 494:28:@1472.6]
  assign _T_1361 = _T_183 & _T_1295; // @[apbqspi.scala 495:40:@1475.6]
  assign _T_1362 = _T_1361 & _T_269; // @[apbqspi.scala 495:53:@1476.6]
  assign _T_1363 = _T_1362 & FIFO_qspi_3_io_empty; // @[apbqspi.scala 495:63:@1477.6]
  assign _T_1365 = _T_1363 ? 1'h1 : _T_1273; // @[apbqspi.scala 495:28:@1478.6]
  assign _T_1367 = FIFO_qspi_3_io_empty ? 1'h1 : _T_1276; // @[apbqspi.scala 496:28:@1480.6]
  assign _T_1371 = _T_269 == 1'h0; // @[apbqspi.scala 497:42:@1483.6]
  assign _T_1372 = _T_1295 & _T_1371; // @[apbqspi.scala 497:39:@1484.6]
  assign _T_1375 = _T_1372 & _T_1346; // @[apbqspi.scala 497:50:@1486.6]
  assign _T_1377 = _T_1375 ? 1'h1 : _T_1279; // @[apbqspi.scala 497:28:@1487.6]
  assign _T_1380 = _T_266 & _T_1346; // @[apbqspi.scala 498:38:@1490.6]
  assign _T_1382 = _T_1380 ? 1'h1 : _T_1282; // @[apbqspi.scala 498:28:@1491.6]
  assign _GEN_31 = _T_1289 ? _T_1296 : _T_1342; // @[apbqspi.scala 478:88:@1410.4]
  assign _GEN_32 = _T_1289 ? _T_1303 : _T_1349; // @[apbqspi.scala 478:88:@1410.4]
  assign _GEN_33 = _T_1289 ? _T_1307 : _T_1353; // @[apbqspi.scala 478:88:@1410.4]
  assign _GEN_34 = _T_1289 ? _T_1311 : _T_1356; // @[apbqspi.scala 478:88:@1410.4]
  assign _GEN_35 = _T_1289 ? _T_1315 : _T_1358; // @[apbqspi.scala 478:88:@1410.4]
  assign _GEN_36 = _T_1289 ? _T_1323 : _T_1365; // @[apbqspi.scala 478:88:@1410.4]
  assign _GEN_37 = _T_1289 ? _T_1327 : _T_1367; // @[apbqspi.scala 478:88:@1410.4]
  assign _GEN_38 = _T_1289 ? _T_1331 : _T_1377; // @[apbqspi.scala 478:88:@1410.4]
  assign _GEN_39 = _T_1289 ? _T_1335 : _T_1382; // @[apbqspi.scala 478:88:@1410.4]
  assign _T_1391 = {_T_1279,_T_1282}; // @[Cat.scala 30:58:@1501.6]
  assign _T_1392 = {_T_1270,_T_1273}; // @[Cat.scala 30:58:@1502.6]
  assign _T_1393 = {_T_1392,_T_1276}; // @[Cat.scala 30:58:@1503.6]
  assign _T_1394 = {_T_1393,_T_1391}; // @[Cat.scala 30:58:@1504.6]
  assign _T_1395 = {_T_1264,_T_1267}; // @[Cat.scala 30:58:@1505.6]
  assign _T_1396 = {23'h0,_T_1258}; // @[Cat.scala 30:58:@1506.6]
  assign _T_1397 = {_T_1396,_T_1261}; // @[Cat.scala 30:58:@1507.6]
  assign _T_1398 = {_T_1397,_T_1395}; // @[Cat.scala 30:58:@1508.6]
  assign _T_1399 = {_T_1398,_T_1394}; // @[Cat.scala 30:58:@1509.6]
  assign _GEN_40 = _T_1289 ? _T_1399 : _GEN_30; // @[apbqspi.scala 502:88:@1500.4]
  assign _T_1432 = _T_203 == 8'h28; // @[apbqspi.scala 518:61:@1525.4]
  assign _T_1433 = _T_202 & _T_1432; // @[apbqspi.scala 518:43:@1526.4]
  assign _GEN_41 = _T_1433 ? _T_285 : _T_1402; // @[apbqspi.scala 518:88:@1527.4]
  assign _GEN_42 = _T_1433 ? _T_286 : _T_1405; // @[apbqspi.scala 518:88:@1527.4]
  assign _GEN_43 = _T_1433 ? _T_287 : _T_1408; // @[apbqspi.scala 518:88:@1527.4]
  assign _GEN_44 = _T_1433 ? _T_288 : _T_1411; // @[apbqspi.scala 518:88:@1527.4]
  assign _GEN_45 = _T_1433 ? _T_289 : _T_1414; // @[apbqspi.scala 518:88:@1527.4]
  assign _GEN_46 = _T_1433 ? _T_239 : _T_1417; // @[apbqspi.scala 518:88:@1527.4]
  assign _GEN_47 = _T_1433 ? _T_240 : _T_1420; // @[apbqspi.scala 518:88:@1527.4]
  assign _GEN_48 = _T_1433 ? _T_241 : _T_1423; // @[apbqspi.scala 518:88:@1527.4]
  assign _GEN_49 = _T_1433 ? _T_242 : _T_1426; // @[apbqspi.scala 518:88:@1527.4]
  assign _T_1443 = _T_1426 & _T_1282; // @[apbqspi.scala 531:32:@1547.4]
  assign _T_1444 = _T_1423 & _T_1279; // @[apbqspi.scala 532:32:@1548.4]
  assign _T_1445 = _T_1420 & _T_1276; // @[apbqspi.scala 533:32:@1549.4]
  assign _T_1446 = _T_1417 & _T_1273; // @[apbqspi.scala 534:32:@1550.4]
  assign _T_1447 = _T_1414 & _T_1270; // @[apbqspi.scala 535:32:@1551.4]
  assign _T_1448 = _T_1411 & _T_1267; // @[apbqspi.scala 536:32:@1552.4]
  assign _T_1449 = _T_1408 & _T_1264; // @[apbqspi.scala 537:32:@1553.4]
  assign _T_1450 = _T_1405 & _T_1261; // @[apbqspi.scala 538:32:@1554.4]
  assign _T_1451 = _T_1402 & _T_1258; // @[apbqspi.scala 539:32:@1555.4]
  assign _T_1452 = _T_1443 | _T_1444; // @[apbqspi.scala 541:23:@1556.4]
  assign _T_1453 = _T_1452 | _T_1445; // @[apbqspi.scala 541:32:@1557.4]
  assign _T_1454 = _T_1453 | _T_1446; // @[apbqspi.scala 541:41:@1558.4]
  assign _T_1455 = _T_1454 | _T_1447; // @[apbqspi.scala 541:50:@1559.4]
  assign _T_1456 = _T_1455 | _T_1448; // @[apbqspi.scala 541:59:@1560.4]
  assign _T_1457 = _T_1456 | _T_1449; // @[apbqspi.scala 541:68:@1561.4]
  assign _T_1458 = _T_1457 | _T_1450; // @[apbqspi.scala 541:77:@1562.4]
  assign _T_1459 = _T_1458 | _T_1451; // @[apbqspi.scala 541:86:@1563.4]
  assign _T_1460 = _T_1459 & _T_1235; // @[apbqspi.scala 541:96:@1564.4]
  assign _T_1466 = _T_203 == 8'h70; // @[apbqspi.scala 546:61:@1570.4]
  assign _T_1467 = _T_202 & _T_1466; // @[apbqspi.scala 546:43:@1571.4]
  assign _T_1468 = io_PWDATA[7:0]; // @[apbqspi.scala 547:24:@1573.6]
  assign _GEN_50 = _T_1467 ? _T_1468 : _T_121; // @[apbqspi.scala 546:89:@1572.4]
  assign _T_1488 = _T_1477 - 8'h1; // @[apbqspi.scala 559:37:@1585.4]
  assign _T_1489 = $unsigned(_T_1488); // @[apbqspi.scala 559:37:@1586.4]
  assign _T_1490 = _T_1489[7:0]; // @[apbqspi.scala 559:37:@1587.4]
  assign _T_1491 = _T_1480 == _T_1490; // @[apbqspi.scala 559:24:@1588.4]
  assign _T_1493 = _T_1483 == 5'h2; // @[apbqspi.scala 561:36:@1589.4]
  assign _T_1494 = _T_260 & _T_1493; // @[apbqspi.scala 561:20:@1590.4]
  assign _T_1496 = _T_260 == 1'h0; // @[apbqspi.scala 561:53:@1591.4]
  assign _T_1498 = _T_1483 == 5'h1; // @[apbqspi.scala 561:77:@1592.4]
  assign _T_1499 = _T_1496 & _T_1498; // @[apbqspi.scala 561:59:@1593.4]
  assign _T_1500 = _T_1494 | _T_1499; // @[apbqspi.scala 561:49:@1594.4]
  assign _T_1502 = _T_1483 == 5'h4; // @[apbqspi.scala 562:36:@1595.4]
  assign _T_1503 = _T_260 & _T_1502; // @[apbqspi.scala 562:20:@1596.4]
  assign _T_1507 = _T_1483 == 5'h3; // @[apbqspi.scala 562:77:@1598.4]
  assign _T_1508 = _T_1496 & _T_1507; // @[apbqspi.scala 562:59:@1599.4]
  assign _T_1509 = _T_1503 | _T_1508; // @[apbqspi.scala 562:49:@1600.4]
  assign _T_1511 = _T_1483 == 5'h6; // @[apbqspi.scala 563:36:@1601.4]
  assign _T_1512 = _T_260 & _T_1511; // @[apbqspi.scala 563:20:@1602.4]
  assign _T_1516 = _T_1483 == 5'h5; // @[apbqspi.scala 563:77:@1604.4]
  assign _T_1517 = _T_1496 & _T_1516; // @[apbqspi.scala 563:59:@1605.4]
  assign _T_1518 = _T_1512 | _T_1517; // @[apbqspi.scala 563:49:@1606.4]
  assign _T_1520 = _T_1483 == 5'h8; // @[apbqspi.scala 564:36:@1607.4]
  assign _T_1521 = _T_260 & _T_1520; // @[apbqspi.scala 564:20:@1608.4]
  assign _T_1525 = _T_1483 == 5'h7; // @[apbqspi.scala 564:77:@1610.4]
  assign _T_1526 = _T_1496 & _T_1525; // @[apbqspi.scala 564:59:@1611.4]
  assign _T_1527 = _T_1521 | _T_1526; // @[apbqspi.scala 564:49:@1612.4]
  assign _T_1529 = _T_1483 == 5'ha; // @[apbqspi.scala 565:36:@1613.4]
  assign _T_1530 = _T_260 & _T_1529; // @[apbqspi.scala 565:20:@1614.4]
  assign _T_1534 = _T_1483 == 5'h9; // @[apbqspi.scala 565:77:@1616.4]
  assign _T_1535 = _T_1496 & _T_1534; // @[apbqspi.scala 565:59:@1617.4]
  assign _T_1536 = _T_1530 | _T_1535; // @[apbqspi.scala 565:49:@1618.4]
  assign _T_1538 = _T_1483 == 5'hc; // @[apbqspi.scala 566:36:@1619.4]
  assign _T_1539 = _T_260 & _T_1538; // @[apbqspi.scala 566:20:@1620.4]
  assign _T_1543 = _T_1483 == 5'hb; // @[apbqspi.scala 566:77:@1622.4]
  assign _T_1544 = _T_1496 & _T_1543; // @[apbqspi.scala 566:59:@1623.4]
  assign _T_1545 = _T_1539 | _T_1544; // @[apbqspi.scala 566:49:@1624.4]
  assign _T_1547 = _T_1483 == 5'he; // @[apbqspi.scala 567:36:@1625.4]
  assign _T_1548 = _T_260 & _T_1547; // @[apbqspi.scala 567:20:@1626.4]
  assign _T_1552 = _T_1483 == 5'hd; // @[apbqspi.scala 567:77:@1628.4]
  assign _T_1553 = _T_1496 & _T_1552; // @[apbqspi.scala 567:59:@1629.4]
  assign _T_1554 = _T_1548 | _T_1553; // @[apbqspi.scala 567:49:@1630.4]
  assign _T_1556 = _T_1483 == 5'h10; // @[apbqspi.scala 568:36:@1631.4]
  assign _T_1557 = _T_260 & _T_1556; // @[apbqspi.scala 568:20:@1632.4]
  assign _T_1561 = _T_1483 == 5'hf; // @[apbqspi.scala 568:77:@1634.4]
  assign _T_1562 = _T_1496 & _T_1561; // @[apbqspi.scala 568:59:@1635.4]
  assign _T_1563 = _T_1557 | _T_1562; // @[apbqspi.scala 568:49:@1636.4]
  assign _T_1565 = _T_104 ? io_io3_i : 1'h1; // @[apbqspi.scala 579:31:@1637.4]
  assign _T_1566 = _T_272 ? _T_92 : _T_1565; // @[apbqspi.scala 579:15:@1638.4]
  assign _T_1568 = _T_101 ? io_io2_i : 1'h1; // @[apbqspi.scala 580:31:@1639.4]
  assign _T_1569 = _T_272 ? _T_89 : _T_1568; // @[apbqspi.scala 580:15:@1640.4]
  assign _T_1571 = _T_98 ? io_io1_i : 1'h1; // @[apbqspi.scala 581:31:@1641.4]
  assign _T_1572 = _T_272 ? _T_86 : _T_1571; // @[apbqspi.scala 581:15:@1642.4]
  assign _T_1574 = _T_95 ? io_io0_i : 1'h1; // @[apbqspi.scala 582:31:@1643.4]
  assign _T_1575 = _T_272 ? _T_83 : _T_1574; // @[apbqspi.scala 582:15:@1644.4]
  assign _T_1576 = _T_272 ? _T_83 : io_io1_i; // @[apbqspi.scala 584:15:@1645.4]
  assign _T_1601 = {_T_1597,_T_1600}; // @[Cat.scala 30:58:@1654.4]
  assign _T_1602 = {_T_1591,_T_1594}; // @[Cat.scala 30:58:@1655.4]
  assign _T_1603 = {_T_1602,_T_1601}; // @[Cat.scala 30:58:@1656.4]
  assign _T_1604 = {_T_1585,_T_1588}; // @[Cat.scala 30:58:@1657.4]
  assign _T_1605 = {_T_1579,_T_1582}; // @[Cat.scala 30:58:@1658.4]
  assign _T_1606 = {_T_1605,_T_1604}; // @[Cat.scala 30:58:@1659.4]
  assign _T_1607 = {_T_1606,_T_1603}; // @[Cat.scala 30:58:@1660.4]
  assign _T_1608 = {_T_1582,_T_1579}; // @[Cat.scala 30:58:@1661.4]
  assign _T_1609 = {_T_1588,_T_1585}; // @[Cat.scala 30:58:@1662.4]
  assign _T_1610 = {_T_1609,_T_1608}; // @[Cat.scala 30:58:@1663.4]
  assign _T_1611 = {_T_1594,_T_1591}; // @[Cat.scala 30:58:@1664.4]
  assign _T_1612 = {_T_1600,_T_1597}; // @[Cat.scala 30:58:@1665.4]
  assign _T_1613 = {_T_1612,_T_1611}; // @[Cat.scala 30:58:@1666.4]
  assign _T_1614 = {_T_1613,_T_1610}; // @[Cat.scala 30:58:@1667.4]
  assign _T_1621 = _T_203 == 8'h2c; // @[apbqspi.scala 600:61:@1674.4]
  assign _T_1622 = _T_202 & _T_1621; // @[apbqspi.scala 600:43:@1675.4]
  assign _GEN_52 = _T_1622 ? _T_1468 : _T_1477; // @[apbqspi.scala 600:90:@1676.4]
  assign _T_1624 = _T_248 | _T_198; // @[apbqspi.scala 606:18:@1680.4]
  assign _T_1627 = _T_1624 | _T_1371; // @[apbqspi.scala 606:30:@1682.4]
  assign _T_1630 = _T_77 ? 1'h0 : 1'h1; // @[apbqspi.scala 610:30:@1685.6]
  assign _T_1644 = _T_77 ? 5'h4 : 5'h10; // @[apbqspi.scala 622:31:@1698.6]
  assign _T_1645 = 2'h0 == _T_135; // @[Conditional.scala 37:30:@1702.6]
  assign _T_1658 = FIFO_qspi_3_io_empty ? 1'h0 : 1'h1; // @[apbqspi.scala 636:46:@1712.8]
  assign _T_1659 = FIFO_qspi_3_io_empty ? 2'h0 : 2'h2; // @[apbqspi.scala 637:46:@1714.8]
  assign _T_1666 = 2'h2 == _T_135; // @[Conditional.scala 37:30:@1724.8]
  assign _T_1669 = _T_77 ? FIFO_qspi_io_dataOut : 5'h0; // @[apbqspi.scala 648:42:@1727.10]
  assign _T_1671 = _T_77 ? FIFO_qspi_1_io_dataOut : 5'h0; // @[apbqspi.scala 649:42:@1729.10]
  assign _T_1673 = _T_77 ? FIFO_qspi_2_io_dataOut : 5'h0; // @[apbqspi.scala 650:42:@1731.10]
  assign _T_1687 = 2'h1 == _T_135; // @[Conditional.scala 37:30:@1749.10]
  assign _T_1689 = _T_275[4]; // @[apbqspi.scala 673:56:@1753.12]
  assign _T_1690 = _T_275[16]; // @[apbqspi.scala 673:70:@1754.12]
  assign _T_1691 = _T_77 ? _T_1689 : _T_1690; // @[apbqspi.scala 673:38:@1755.12]
  assign _GEN_169 = {{1'd0}, _T_275}; // @[apbqspi.scala 674:46:@1757.12]
  assign _T_1692 = _GEN_169 << 1; // @[apbqspi.scala 674:46:@1757.12]
  assign _T_1693 = _T_151[16]; // @[apbqspi.scala 676:48:@1759.12]
  assign _GEN_170 = {{1'd0}, _T_151}; // @[apbqspi.scala 677:49:@1761.12]
  assign _T_1694 = _GEN_170 << 1; // @[apbqspi.scala 677:49:@1761.12]
  assign _T_1695 = _T_148[4]; // @[apbqspi.scala 679:59:@1763.12]
  assign _T_1697 = _T_77 ? _T_1695 : 1'h0; // @[apbqspi.scala 679:38:@1764.12]
  assign _GEN_171 = {{1'd0}, _T_148}; // @[apbqspi.scala 680:49:@1766.12]
  assign _T_1698 = _GEN_171 << 1; // @[apbqspi.scala 680:49:@1766.12]
  assign _T_1699 = _T_145[4]; // @[apbqspi.scala 682:59:@1768.12]
  assign _T_1701 = _T_77 ? _T_1699 : 1'h0; // @[apbqspi.scala 682:38:@1769.12]
  assign _GEN_172 = {{1'd0}, _T_145}; // @[apbqspi.scala 683:49:@1771.12]
  assign _T_1702 = _GEN_172 << 1; // @[apbqspi.scala 683:49:@1771.12]
  assign _T_1703 = _T_142[4]; // @[apbqspi.scala 686:59:@1773.12]
  assign _T_1705 = _T_77 ? _T_1703 : 1'h0; // @[apbqspi.scala 686:38:@1774.12]
  assign _GEN_173 = {{1'd0}, _T_142}; // @[apbqspi.scala 687:49:@1776.12]
  assign _T_1706 = _GEN_173 << 1; // @[apbqspi.scala 687:49:@1776.12]
  assign _T_1710 = 2'h3 == _T_135; // @[Conditional.scala 37:30:@1783.12]
  assign _T_1712 = _T_1480 == 8'h0; // @[apbqspi.scala 697:44:@1785.14]
  assign _T_1714 = _T_1712 ? _T_1690 : _T_115; // @[apbqspi.scala 697:34:@1787.14]
  assign _T_1718 = _T_1712 ? _T_1692 : {{1'd0}, _T_275}; // @[apbqspi.scala 698:34:@1791.14]
  assign _T_1722 = _T_1712 ? _T_1693 : _T_83; // @[apbqspi.scala 701:35:@1795.14]
  assign _T_1726 = _T_1712 ? _T_1694 : {{1'd0}, _T_151}; // @[apbqspi.scala 702:35:@1799.14]
  assign _T_1732 = _T_1712 ? _T_1697 : _T_86; // @[apbqspi.scala 704:35:@1804.14]
  assign _T_1736 = _T_1712 ? _T_1698 : {{1'd0}, _T_148}; // @[apbqspi.scala 705:35:@1808.14]
  assign _T_1742 = _T_1712 ? _T_1701 : _T_89; // @[apbqspi.scala 707:35:@1813.14]
  assign _T_1746 = _T_1712 ? _T_1702 : {{1'd0}, _T_145}; // @[apbqspi.scala 708:35:@1817.14]
  assign _T_1752 = _T_1712 ? _T_1705 : _T_92; // @[apbqspi.scala 710:35:@1822.14]
  assign _T_1756 = _T_1712 ? _T_1706 : {{1'd0}, _T_142}; // @[apbqspi.scala 711:35:@1826.14]
  assign _T_1762 = _T_1483 == _T_1486; // @[apbqspi.scala 715:80:@1832.14]
  assign _T_1765 = _T_1483 + 5'h1; // @[apbqspi.scala 715:113:@1833.14]
  assign _T_1766 = _T_1765[4:0]; // @[apbqspi.scala 715:113:@1834.14]
  assign _T_1767 = _T_1762 ? 5'h0 : _T_1766; // @[apbqspi.scala 715:67:@1835.14]
  assign _T_1768 = _T_1491 ? _T_1767 : _T_1483; // @[apbqspi.scala 715:34:@1836.14]
  assign _T_1775 = _T_1491 & _T_1762; // @[apbqspi.scala 716:68:@1843.14]
  assign _T_1776 = _T_1775 ? 2'h0 : 2'h3; // @[apbqspi.scala 716:34:@1844.14]
  assign _T_1784 = _T_1480 + 8'h1; // @[apbqspi.scala 717:77:@1850.14]
  assign _T_1785 = _T_1784[7:0]; // @[apbqspi.scala 717:77:@1851.14]
  assign _T_1786 = _T_1491 ? 8'h0 : _T_1785; // @[apbqspi.scala 717:34:@1852.14]
  assign _T_1787 = _T_1491 & _T_1500; // @[apbqspi.scala 719:53:@1854.14]
  assign _T_1788 = _T_1787 ? _T_1566 : _T_1600; // @[apbqspi.scala 719:45:@1855.14]
  assign _T_1790 = _T_1787 ? _T_1576 : _T_1600; // @[apbqspi.scala 720:34:@1857.14]
  assign _T_1791 = _T_77 ? _T_1788 : _T_1790; // @[apbqspi.scala 719:34:@1858.14]
  assign _T_1793 = _T_1787 ? _T_1569 : _T_1597; // @[apbqspi.scala 722:45:@1861.14]
  assign _T_1794 = _T_1491 & _T_1509; // @[apbqspi.scala 723:42:@1862.14]
  assign _T_1795 = _T_1794 ? _T_1576 : _T_1597; // @[apbqspi.scala 723:34:@1863.14]
  assign _T_1796 = _T_77 ? _T_1793 : _T_1795; // @[apbqspi.scala 722:34:@1864.14]
  assign _T_1798 = _T_1787 ? _T_1572 : _T_1594; // @[apbqspi.scala 725:45:@1867.14]
  assign _T_1799 = _T_1491 & _T_1518; // @[apbqspi.scala 726:42:@1868.14]
  assign _T_1800 = _T_1799 ? _T_1576 : _T_1594; // @[apbqspi.scala 726:34:@1869.14]
  assign _T_1801 = _T_77 ? _T_1798 : _T_1800; // @[apbqspi.scala 725:34:@1870.14]
  assign _T_1803 = _T_1787 ? _T_1575 : _T_1591; // @[apbqspi.scala 728:45:@1873.14]
  assign _T_1804 = _T_1491 & _T_1527; // @[apbqspi.scala 729:42:@1874.14]
  assign _T_1805 = _T_1804 ? _T_1576 : _T_1591; // @[apbqspi.scala 729:34:@1875.14]
  assign _T_1806 = _T_77 ? _T_1803 : _T_1805; // @[apbqspi.scala 728:34:@1876.14]
  assign _T_1808 = _T_1794 ? _T_1566 : _T_1588; // @[apbqspi.scala 731:45:@1879.14]
  assign _T_1809 = _T_1491 & _T_1536; // @[apbqspi.scala 732:42:@1880.14]
  assign _T_1810 = _T_1809 ? _T_1576 : _T_1588; // @[apbqspi.scala 732:34:@1881.14]
  assign _T_1811 = _T_77 ? _T_1808 : _T_1810; // @[apbqspi.scala 731:34:@1882.14]
  assign _T_1813 = _T_1794 ? _T_1569 : _T_1585; // @[apbqspi.scala 734:45:@1885.14]
  assign _T_1814 = _T_1491 & _T_1545; // @[apbqspi.scala 735:42:@1886.14]
  assign _T_1815 = _T_1814 ? _T_1576 : _T_1585; // @[apbqspi.scala 735:34:@1887.14]
  assign _T_1816 = _T_77 ? _T_1813 : _T_1815; // @[apbqspi.scala 734:34:@1888.14]
  assign _T_1818 = _T_1794 ? _T_1572 : _T_1582; // @[apbqspi.scala 737:45:@1891.14]
  assign _T_1819 = _T_1491 & _T_1554; // @[apbqspi.scala 738:42:@1892.14]
  assign _T_1820 = _T_1819 ? _T_1576 : _T_1582; // @[apbqspi.scala 738:34:@1893.14]
  assign _T_1821 = _T_77 ? _T_1818 : _T_1820; // @[apbqspi.scala 737:34:@1894.14]
  assign _T_1823 = _T_1794 ? _T_1575 : _T_1579; // @[apbqspi.scala 740:45:@1897.14]
  assign _T_1824 = _T_1491 & _T_1563; // @[apbqspi.scala 741:42:@1898.14]
  assign _T_1825 = _T_1824 ? _T_1576 : _T_1579; // @[apbqspi.scala 741:34:@1899.14]
  assign _T_1826 = _T_77 ? _T_1823 : _T_1825; // @[apbqspi.scala 740:34:@1900.14]
  assign _GEN_53 = _T_1710 ? _T_1714 : _T_115; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_54 = _T_1710 ? _T_1718 : {{1'd0}, _T_275}; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_55 = _T_1710 ? _T_1722 : _T_83; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_56 = _T_1710 ? _T_1726 : {{1'd0}, _T_151}; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_57 = _T_1710 ? _T_1732 : _T_86; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_58 = _T_1710 ? _T_1736 : {{1'd0}, _T_148}; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_59 = _T_1710 ? _T_1742 : _T_89; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_60 = _T_1710 ? _T_1746 : {{1'd0}, _T_145}; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_61 = _T_1710 ? _T_1752 : _T_92; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_62 = _T_1710 ? _T_1756 : {{1'd0}, _T_142}; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_63 = _T_1710 ? _T_1768 : _T_1483; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_64 = _T_1710 ? _T_1776 : _T_135; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_65 = _T_1710 ? _T_1786 : _T_1480; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_66 = _T_1710 ? _T_1791 : _T_1600; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_67 = _T_1710 ? _T_1796 : _T_1597; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_68 = _T_1710 ? _T_1801 : _T_1594; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_69 = _T_1710 ? _T_1806 : _T_1591; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_70 = _T_1710 ? _T_1811 : _T_1588; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_71 = _T_1710 ? _T_1816 : _T_1585; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_72 = _T_1710 ? _T_1821 : _T_1582; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_73 = _T_1710 ? _T_1826 : _T_1579; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_74 = _T_1710 ? _T_1775 : _T_192; // @[Conditional.scala 39:67:@1784.12]
  assign _GEN_75 = _T_1687 ? 1'h0 : _T_183; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_76 = _T_1687 ? 2'h3 : _GEN_64; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_77 = _T_1687 ? _T_1691 : _GEN_53; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_78 = _T_1687 ? _T_1692 : _GEN_54; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_79 = _T_1687 ? _T_1693 : _GEN_55; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_80 = _T_1687 ? _T_1694 : _GEN_56; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_81 = _T_1687 ? _T_1697 : _GEN_57; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_82 = _T_1687 ? _T_1698 : _GEN_58; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_83 = _T_1687 ? _T_1701 : _GEN_59; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_84 = _T_1687 ? _T_1702 : _GEN_60; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_85 = _T_1687 ? _T_1705 : _GEN_61; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_86 = _T_1687 ? _T_1706 : _GEN_62; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_87 = _T_1687 ? 5'h0 : _GEN_63; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_88 = _T_1687 ? 8'h1 : _GEN_65; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_89 = _T_1687 ? 1'h0 : _GEN_74; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_90 = _T_1687 ? _T_1600 : _GEN_66; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_91 = _T_1687 ? _T_1597 : _GEN_67; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_92 = _T_1687 ? _T_1594 : _GEN_68; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_93 = _T_1687 ? _T_1591 : _GEN_69; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_94 = _T_1687 ? _T_1588 : _GEN_70; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_95 = _T_1687 ? _T_1585 : _GEN_71; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_96 = _T_1687 ? _T_1582 : _GEN_72; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_97 = _T_1687 ? _T_1579 : _GEN_73; // @[Conditional.scala 39:67:@1750.10]
  assign _GEN_98 = _T_1666 ? 1'h0 : _GEN_75; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_99 = _T_1666 ? {{1'd0}, _T_1669} : _GEN_86; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_100 = _T_1666 ? {{1'd0}, _T_1671} : _GEN_84; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_101 = _T_1666 ? {{1'd0}, _T_1673} : _GEN_82; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_102 = _T_1666 ? {{1'd0}, FIFO_qspi_3_io_dataOut} : _GEN_80; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_103 = _T_1666 ? 2'h1 : _GEN_76; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_104 = _T_1666 ? _T_1630 : _GEN_85; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_105 = _T_1666 ? _T_1630 : _GEN_83; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_106 = _T_1666 ? _T_1630 : _GEN_81; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_107 = _T_1666 ? 1'h0 : _GEN_79; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_108 = _T_1666 ? _T_263 : _GEN_77; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_109 = _T_1666 ? 8'h0 : _GEN_88; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_110 = _T_1666 ? {{1'd0}, _T_1087} : _GEN_78; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_111 = _T_1666 ? 5'h0 : _GEN_87; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_112 = _T_1666 ? 1'h0 : _GEN_89; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_113 = _T_1666 ? _T_1600 : _GEN_90; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_114 = _T_1666 ? _T_1597 : _GEN_91; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_115 = _T_1666 ? _T_1594 : _GEN_92; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_116 = _T_1666 ? _T_1591 : _GEN_93; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_117 = _T_1666 ? _T_1588 : _GEN_94; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_118 = _T_1666 ? _T_1585 : _GEN_95; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_119 = _T_1666 ? _T_1582 : _GEN_96; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_120 = _T_1666 ? _T_1579 : _GEN_97; // @[Conditional.scala 39:67:@1725.8]
  assign _GEN_121 = _T_1645 ? _T_1630 : _GEN_104; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_122 = _T_1645 ? _T_1630 : _GEN_105; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_123 = _T_1645 ? _T_1630 : _GEN_106; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_124 = _T_1645 ? 1'h0 : _GEN_107; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_125 = _T_1645 ? _T_263 : _GEN_108; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_126 = _T_1645 ? _T_1658 : _GEN_98; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_127 = _T_1645 ? _T_1659 : _GEN_103; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_128 = _T_1645 ? 8'h0 : _GEN_109; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_129 = _T_1645 ? {{1'd0}, _T_1087} : _GEN_110; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_130 = _T_1645 ? 5'h0 : _GEN_111; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_131 = _T_1645 ? _T_1644 : _T_1486; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_132 = _T_1645 ? 1'h0 : _GEN_112; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_133 = _T_1645 ? {{1'd0}, _T_142} : _GEN_99; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_134 = _T_1645 ? {{1'd0}, _T_145} : _GEN_100; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_135 = _T_1645 ? {{1'd0}, _T_148} : _GEN_101; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_136 = _T_1645 ? {{1'd0}, _T_151} : _GEN_102; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_137 = _T_1645 ? _T_1600 : _GEN_113; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_138 = _T_1645 ? _T_1597 : _GEN_114; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_139 = _T_1645 ? _T_1594 : _GEN_115; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_140 = _T_1645 ? _T_1591 : _GEN_116; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_141 = _T_1645 ? _T_1588 : _GEN_117; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_142 = _T_1645 ? _T_1585 : _GEN_118; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_143 = _T_1645 ? _T_1582 : _GEN_119; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_144 = _T_1645 ? _T_1579 : _GEN_120; // @[Conditional.scala 40:58:@1703.6]
  assign _GEN_145 = _T_1627 ? _T_263 : _GEN_125; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_146 = _T_1627 ? _T_1630 : _GEN_121; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_147 = _T_1627 ? _T_1630 : _GEN_122; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_148 = _T_1627 ? _T_1630 : _GEN_123; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_149 = _T_1627 ? 1'h0 : _GEN_124; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_150 = _T_1627 ? 8'h0 : _GEN_128; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_151 = _T_1627 ? {{1'd0}, _T_1087} : _GEN_129; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_152 = _T_1627 ? 5'h0 : _GEN_130; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_153 = _T_1627 ? 2'h0 : _GEN_127; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_154 = _T_1627 ? 18'h0 : _GEN_136; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_155 = _T_1627 ? 1'h0 : _GEN_132; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_156 = _T_1627 ? _T_1644 : _GEN_131; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_157 = _T_1627 ? _T_183 : _GEN_126; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_158 = _T_1627 ? {{1'd0}, _T_142} : _GEN_133; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_159 = _T_1627 ? {{1'd0}, _T_145} : _GEN_134; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_160 = _T_1627 ? {{1'd0}, _T_148} : _GEN_135; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_161 = _T_1627 ? _T_1600 : _GEN_137; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_162 = _T_1627 ? _T_1597 : _GEN_138; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_163 = _T_1627 ? _T_1594 : _GEN_139; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_164 = _T_1627 ? _T_1591 : _GEN_140; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_165 = _T_1627 ? _T_1588 : _GEN_141; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_166 = _T_1627 ? _T_1585 : _GEN_142; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_167 = _T_1627 ? _T_1582 : _GEN_143; // @[apbqspi.scala 606:42:@1683.4]
  assign _GEN_168 = _T_1627 ? _T_1579 : _GEN_144; // @[apbqspi.scala 606:42:@1683.4]
  assign io_PREADY = 1'h1; // @[apbqspi.scala 73:14:@415.4]
  assign io_PRDATA = _T_127; // @[apbqspi.scala 122:11:@449.4]
  assign io_PSLVERR = 1'h0; // @[apbqspi.scala 74:14:@416.4]
  assign io_interrupt = interrupt_r; // @[apbqspi.scala 77:14:@418.4]
  assign io_io0_o = _T_95 ? 1'h1 : _T_83; // @[apbqspi.scala 103:10:@437.4]
  assign io_io0_t = _T_95; // @[apbqspi.scala 108:10:@441.4]
  assign io_io1_o = _T_98 ? 1'h1 : _T_86; // @[apbqspi.scala 102:10:@435.4]
  assign io_io1_t = _T_98; // @[apbqspi.scala 107:10:@440.4]
  assign io_io2_o = _T_101 ? 1'h1 : _T_89; // @[apbqspi.scala 101:10:@433.4]
  assign io_io2_t = _T_101; // @[apbqspi.scala 106:10:@439.4]
  assign io_io3_o = _T_104 ? 1'h1 : _T_92; // @[apbqspi.scala 100:10:@431.4]
  assign io_io3_t = _T_104; // @[apbqspi.scala 105:10:@438.4]
  assign io_spi_clk_o = _T_115; // @[apbqspi.scala 117:14:@446.4]
  assign io_spi_clk_t = 1'h0; // @[apbqspi.scala 69:14:@414.4]
  assign io_spi_ssel_o = _T_121; // @[apbqspi.scala 118:15:@447.4]
  assign io_spi_ssel_t = 1'h0; // @[apbqspi.scala 68:15:@413.4]
  assign FIFO_qspi_io_dataIn = _T_162; // @[apbqspi.scala 187:23:@493.4]
  assign FIFO_qspi_io_writeEn = _T_77 ? _T_174 : 1'h0; // @[apbqspi.scala 182:23:@487.4]
  assign FIFO_qspi_io_writeClk = io_PCLK; // @[apbqspi.scala 159:25:@467.4]
  assign FIFO_qspi_io_readEn = _T_77 ? _T_183 : 1'h0; // @[apbqspi.scala 194:23:@499.4]
  assign FIFO_qspi_io_readClk = io_PCLK; // @[apbqspi.scala 160:25:@468.4]
  assign FIFO_qspi_io_systemRst = io_PRESETn == 1'h0; // @[apbqspi.scala 158:25:@466.4]
  assign FIFO_qspi_1_io_dataIn = _T_165; // @[apbqspi.scala 188:23:@494.4]
  assign FIFO_qspi_1_io_writeEn = _T_77 ? _T_174 : 1'h0; // @[apbqspi.scala 183:23:@489.4]
  assign FIFO_qspi_1_io_writeClk = io_PCLK; // @[apbqspi.scala 163:25:@471.4]
  assign FIFO_qspi_1_io_readEn = _T_77 ? _T_183 : 1'h0; // @[apbqspi.scala 195:23:@501.4]
  assign FIFO_qspi_1_io_readClk = io_PCLK; // @[apbqspi.scala 164:25:@472.4]
  assign FIFO_qspi_1_io_systemRst = io_PRESETn == 1'h0; // @[apbqspi.scala 162:25:@470.4]
  assign FIFO_qspi_2_io_dataIn = _T_168; // @[apbqspi.scala 189:23:@495.4]
  assign FIFO_qspi_2_io_writeEn = _T_77 ? _T_174 : 1'h0; // @[apbqspi.scala 184:23:@491.4]
  assign FIFO_qspi_2_io_writeClk = io_PCLK; // @[apbqspi.scala 167:25:@475.4]
  assign FIFO_qspi_2_io_readEn = _T_77 ? _T_183 : 1'h0; // @[apbqspi.scala 196:23:@503.4]
  assign FIFO_qspi_2_io_readClk = io_PCLK; // @[apbqspi.scala 168:25:@476.4]
  assign FIFO_qspi_2_io_systemRst = io_PRESETn == 1'h0; // @[apbqspi.scala 166:25:@474.4]
  assign FIFO_qspi_3_io_dataIn = _T_171; // @[apbqspi.scala 190:23:@496.4]
  assign FIFO_qspi_3_io_writeEn = _T_174; // @[apbqspi.scala 185:23:@492.4]
  assign FIFO_qspi_3_io_writeClk = io_PCLK; // @[apbqspi.scala 171:25:@479.4]
  assign FIFO_qspi_3_io_readEn = _T_183; // @[apbqspi.scala 197:23:@504.4]
  assign FIFO_qspi_3_io_readClk = io_PCLK; // @[apbqspi.scala 172:25:@480.4]
  assign FIFO_qspi_3_io_systemRst = io_PRESETn == 1'h0; // @[apbqspi.scala 170:25:@478.4]
  assign RXFIFO_io_dataIn = _T_245 ? _T_1607 : _T_1614; // @[apbqspi.scala 599:19:@1669.4]
  assign RXFIFO_io_writeEn = _T_192; // @[apbqspi.scala 206:19:@507.4]
  assign RXFIFO_io_writeClk = io_PCLK; // @[apbqspi.scala 139:21:@459.4]
  assign RXFIFO_io_readEn = _T_195; // @[apbqspi.scala 208:19:@508.4]
  assign RXFIFO_io_readClk = io_PCLK; // @[apbqspi.scala 140:21:@460.4]
  assign RXFIFO_io_systemRst = io_PRESETn == 1'h0; // @[apbqspi.scala 138:21:@458.4]
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
  _T_77 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_83 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_86 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_89 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_92 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_95 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_98 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_101 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_104 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_115 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_121 = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_127 = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_135 = _RAND_13[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_142 = _RAND_14[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_145 = _RAND_15[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_148 = _RAND_16[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_151 = _RAND_17[16:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_162 = _RAND_18[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_165 = _RAND_19[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_168 = _RAND_20[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_171 = _RAND_21[16:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_174 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_183 = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_192 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_195 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_198 = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_245 = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_248 = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_251 = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_254 = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  _T_257 = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  _T_260 = _RAND_32[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  _T_263 = _RAND_33[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  _T_266 = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  _T_269 = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  _T_272 = _RAND_36[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  _T_275 = _RAND_37[16:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  _T_1235 = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  _T_1258 = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  _T_1261 = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  _T_1264 = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  _T_1267 = _RAND_42[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  _T_1270 = _RAND_43[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  _T_1273 = _RAND_44[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  _T_1276 = _RAND_45[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  _T_1279 = _RAND_46[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  _T_1282 = _RAND_47[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  _T_1402 = _RAND_48[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  _T_1405 = _RAND_49[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  _T_1408 = _RAND_50[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  _T_1411 = _RAND_51[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{`RANDOM}};
  _T_1414 = _RAND_52[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  _T_1417 = _RAND_53[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{`RANDOM}};
  _T_1420 = _RAND_54[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  _T_1423 = _RAND_55[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  _T_1426 = _RAND_56[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  _T_1477 = _RAND_57[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{`RANDOM}};
  _T_1480 = _RAND_58[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{`RANDOM}};
  _T_1483 = _RAND_59[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{`RANDOM}};
  _T_1486 = _RAND_60[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{`RANDOM}};
  _T_1579 = _RAND_61[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{`RANDOM}};
  _T_1582 = _RAND_62[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{`RANDOM}};
  _T_1585 = _RAND_63[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_64 = {1{`RANDOM}};
  _T_1588 = _RAND_64[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_65 = {1{`RANDOM}};
  _T_1591 = _RAND_65[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_66 = {1{`RANDOM}};
  _T_1594 = _RAND_66[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_67 = {1{`RANDOM}};
  _T_1597 = _RAND_67[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_68 = {1{`RANDOM}};
  _T_1600 = _RAND_68[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      interrupt_r <= 1'h0;
    end else begin
      interrupt_r <= _T_1460;
    end
  end
  always @(posedge io_PCLK) begin
    if (_T_74) begin
      _T_77 <= 1'h0;
    end else begin
      if (_T_282) begin
        _T_77 <= _T_283;
      end
    end
    if (_T_74) begin
      _T_83 <= 1'h1;
    end else begin
      if (_T_1627) begin
        _T_83 <= 1'h0;
      end else begin
        if (_T_1645) begin
          _T_83 <= 1'h0;
        end else begin
          if (_T_1666) begin
            _T_83 <= 1'h0;
          end else begin
            if (_T_1687) begin
              _T_83 <= _T_1693;
            end else begin
              if (_T_1710) begin
                if (_T_1712) begin
                  _T_83 <= _T_1693;
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_86 <= 1'h1;
    end else begin
      if (_T_1627) begin
        if (_T_77) begin
          _T_86 <= 1'h0;
        end else begin
          _T_86 <= 1'h1;
        end
      end else begin
        if (_T_1645) begin
          if (_T_77) begin
            _T_86 <= 1'h0;
          end else begin
            _T_86 <= 1'h1;
          end
        end else begin
          if (_T_1666) begin
            if (_T_77) begin
              _T_86 <= 1'h0;
            end else begin
              _T_86 <= 1'h1;
            end
          end else begin
            if (_T_1687) begin
              if (_T_77) begin
                _T_86 <= _T_1695;
              end else begin
                _T_86 <= 1'h0;
              end
            end else begin
              if (_T_1710) begin
                if (_T_1712) begin
                  if (_T_77) begin
                    _T_86 <= _T_1695;
                  end else begin
                    _T_86 <= 1'h0;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_89 <= 1'h1;
    end else begin
      if (_T_1627) begin
        if (_T_77) begin
          _T_89 <= 1'h0;
        end else begin
          _T_89 <= 1'h1;
        end
      end else begin
        if (_T_1645) begin
          if (_T_77) begin
            _T_89 <= 1'h0;
          end else begin
            _T_89 <= 1'h1;
          end
        end else begin
          if (_T_1666) begin
            if (_T_77) begin
              _T_89 <= 1'h0;
            end else begin
              _T_89 <= 1'h1;
            end
          end else begin
            if (_T_1687) begin
              if (_T_77) begin
                _T_89 <= _T_1699;
              end else begin
                _T_89 <= 1'h0;
              end
            end else begin
              if (_T_1710) begin
                if (_T_1712) begin
                  if (_T_77) begin
                    _T_89 <= _T_1699;
                  end else begin
                    _T_89 <= 1'h0;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_92 <= 1'h1;
    end else begin
      if (_T_1627) begin
        if (_T_77) begin
          _T_92 <= 1'h0;
        end else begin
          _T_92 <= 1'h1;
        end
      end else begin
        if (_T_1645) begin
          if (_T_77) begin
            _T_92 <= 1'h0;
          end else begin
            _T_92 <= 1'h1;
          end
        end else begin
          if (_T_1666) begin
            if (_T_77) begin
              _T_92 <= 1'h0;
            end else begin
              _T_92 <= 1'h1;
            end
          end else begin
            if (_T_1687) begin
              if (_T_77) begin
                _T_92 <= _T_1703;
              end else begin
                _T_92 <= 1'h0;
              end
            end else begin
              if (_T_1710) begin
                if (_T_1712) begin
                  if (_T_77) begin
                    _T_92 <= _T_1703;
                  end else begin
                    _T_92 <= 1'h0;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_95 <= 1'h0;
    end else begin
      if (_T_238) begin
        _T_95 <= _T_242;
      end
    end
    if (_T_74) begin
      _T_98 <= 1'h1;
    end else begin
      if (_T_238) begin
        _T_98 <= _T_241;
      end
    end
    if (_T_74) begin
      _T_101 <= 1'h1;
    end else begin
      if (_T_238) begin
        _T_101 <= _T_240;
      end
    end
    if (_T_74) begin
      _T_104 <= 1'h1;
    end else begin
      if (_T_238) begin
        _T_104 <= _T_239;
      end
    end
    if (_T_74) begin
      _T_115 <= 1'h0;
    end else begin
      if (_T_1627) begin
        _T_115 <= _T_263;
      end else begin
        if (_T_1645) begin
          _T_115 <= _T_263;
        end else begin
          if (_T_1666) begin
            _T_115 <= _T_263;
          end else begin
            if (_T_1687) begin
              if (_T_77) begin
                _T_115 <= _T_1689;
              end else begin
                _T_115 <= _T_1690;
              end
            end else begin
              if (_T_1710) begin
                if (_T_1712) begin
                  _T_115 <= _T_1690;
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_121 <= 8'hff;
    end else begin
      if (_T_1467) begin
        _T_121 <= _T_1468;
      end
    end
    if (_T_74) begin
      _T_127 <= 32'h0;
    end else begin
      if (_T_1289) begin
        _T_127 <= _T_1399;
      end else begin
        if (_T_1253) begin
          _T_127 <= _T_1255;
        end else begin
          if (_T_1232) begin
            _T_127 <= {{28'd0}, RXFIFO_io_writePtr};
          end else begin
            if (_T_1223) begin
              _T_127 <= {{28'd0}, FIFO_qspi_3_io_writePtr};
            end else begin
              if (_T_1212) begin
                _T_127 <= {{24'd0}, RXFIFO_io_dataOut};
              end else begin
                if (_T_1202) begin
                  _T_127 <= 32'h0;
                end else begin
                  if (_T_329) begin
                    _T_127 <= {{1'd0}, _T_336};
                  end else begin
                    if (_T_302) begin
                      _T_127 <= {{1'd0}, _T_314};
                    end else begin
                      if (_T_230) begin
                        _T_127 <= 32'h0;
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
    if (_T_74) begin
      _T_135 <= 2'h0;
    end else begin
      if (_T_1627) begin
        _T_135 <= 2'h0;
      end else begin
        if (_T_1645) begin
          if (FIFO_qspi_3_io_empty) begin
            _T_135 <= 2'h0;
          end else begin
            _T_135 <= 2'h2;
          end
        end else begin
          if (_T_1666) begin
            _T_135 <= 2'h1;
          end else begin
            if (_T_1687) begin
              _T_135 <= 2'h3;
            end else begin
              if (_T_1710) begin
                if (_T_1775) begin
                  _T_135 <= 2'h0;
                end else begin
                  _T_135 <= 2'h3;
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_142 <= 5'h0;
    end else begin
      _T_142 <= _GEN_158[4:0];
    end
    if (_T_74) begin
      _T_145 <= 5'h0;
    end else begin
      _T_145 <= _GEN_159[4:0];
    end
    if (_T_74) begin
      _T_148 <= 5'h0;
    end else begin
      _T_148 <= _GEN_160[4:0];
    end
    if (_T_74) begin
      _T_151 <= 17'h0;
    end else begin
      _T_151 <= _GEN_154[16:0];
    end
    if (_T_74) begin
      _T_162 <= 5'h0;
    end else begin
      if (_T_1094) begin
        if (_T_1069) begin
          if (_T_245) begin
            _T_162 <= _T_390;
          end else begin
            _T_162 <= _T_354;
          end
        end else begin
          if (_T_1067) begin
            if (_T_245) begin
              _T_162 <= _T_390;
            end else begin
              _T_162 <= _T_354;
            end
          end else begin
            if (_T_1065) begin
              if (_T_245) begin
                _T_162 <= _T_552;
              end else begin
                _T_162 <= _T_516;
              end
            end else begin
              if (_T_1063) begin
                if (_T_245) begin
                  _T_162 <= _T_552;
                end else begin
                  _T_162 <= _T_516;
                end
              end else begin
                _T_162 <= 5'h0;
              end
            end
          end
        end
      end else begin
        _T_162 <= 5'h0;
      end
    end
    if (_T_74) begin
      _T_165 <= 5'h0;
    end else begin
      if (_T_1094) begin
        if (_T_1069) begin
          if (_T_245) begin
            _T_165 <= _T_399;
          end else begin
            _T_165 <= _T_363;
          end
        end else begin
          if (_T_1067) begin
            if (_T_245) begin
              _T_165 <= _T_399;
            end else begin
              _T_165 <= _T_363;
            end
          end else begin
            if (_T_1065) begin
              if (_T_245) begin
                _T_165 <= _T_561;
              end else begin
                _T_165 <= _T_525;
              end
            end else begin
              if (_T_1063) begin
                if (_T_245) begin
                  _T_165 <= _T_561;
                end else begin
                  _T_165 <= _T_525;
                end
              end else begin
                _T_165 <= 5'h0;
              end
            end
          end
        end
      end else begin
        _T_165 <= 5'h0;
      end
    end
    if (_T_74) begin
      _T_168 <= 5'h0;
    end else begin
      if (_T_1094) begin
        if (_T_1069) begin
          if (_T_245) begin
            _T_168 <= _T_408;
          end else begin
            _T_168 <= _T_372;
          end
        end else begin
          if (_T_1067) begin
            if (_T_245) begin
              _T_168 <= _T_408;
            end else begin
              _T_168 <= _T_372;
            end
          end else begin
            if (_T_1065) begin
              if (_T_245) begin
                _T_168 <= _T_570;
              end else begin
                _T_168 <= _T_534;
              end
            end else begin
              if (_T_1063) begin
                if (_T_245) begin
                  _T_168 <= _T_570;
                end else begin
                  _T_168 <= _T_534;
                end
              end else begin
                _T_168 <= 5'h0;
              end
            end
          end
        end
      end else begin
        _T_168 <= 5'h0;
      end
    end
    if (_T_74) begin
      _T_171 <= 17'h0;
    end else begin
      if (_T_1094) begin
        if (_T_77) begin
          _T_171 <= _T_1168;
        end else begin
          if (_T_1069) begin
            if (_T_245) begin
              _T_171 <= _T_759;
            end else begin
              _T_171 <= _T_726;
            end
          end else begin
            if (_T_1067) begin
              if (_T_245) begin
                _T_171 <= _T_759;
              end else begin
                _T_171 <= _T_726;
              end
            end else begin
              if (_T_1065) begin
                if (_T_245) begin
                  _T_171 <= _T_957;
                end else begin
                  _T_171 <= _T_924;
                end
              end else begin
                if (_T_1063) begin
                  if (_T_245) begin
                    _T_171 <= _T_957;
                  end else begin
                    _T_171 <= _T_924;
                  end
                end else begin
                  _T_171 <= 17'h0;
                end
              end
            end
          end
        end
      end else begin
        _T_171 <= 17'h0;
      end
    end
    if (_T_74) begin
      _T_174 <= 1'h0;
    end else begin
      _T_174 <= _T_1094;
    end
    if (_T_74) begin
      _T_183 <= 1'h0;
    end else begin
      if (!(_T_1627)) begin
        if (_T_1645) begin
          if (FIFO_qspi_3_io_empty) begin
            _T_183 <= 1'h0;
          end else begin
            _T_183 <= 1'h1;
          end
        end else begin
          if (_T_1666) begin
            _T_183 <= 1'h0;
          end else begin
            if (_T_1687) begin
              _T_183 <= 1'h0;
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_192 <= 1'h0;
    end else begin
      if (_T_1627) begin
        _T_192 <= 1'h0;
      end else begin
        if (_T_1645) begin
          _T_192 <= 1'h0;
        end else begin
          if (_T_1666) begin
            _T_192 <= 1'h0;
          end else begin
            if (_T_1687) begin
              _T_192 <= 1'h0;
            end else begin
              if (_T_1710) begin
                _T_192 <= _T_1775;
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_195 <= 1'h0;
    end else begin
      _T_195 <= _T_1212;
    end
    if (_T_74) begin
      _T_198 <= 1'h0;
    end else begin
      if (_T_218) begin
        _T_198 <= _T_220;
      end else begin
        _T_198 <= 1'h0;
      end
    end
    if (_T_74) begin
      _T_245 <= 1'h0;
    end else begin
      if (_T_282) begin
        _T_245 <= _T_284;
      end
    end
    if (_T_74) begin
      _T_248 <= 1'h1;
    end else begin
      if (_T_282) begin
        _T_248 <= _T_285;
      end
    end
    if (_T_74) begin
      _T_251 <= 1'h1;
    end else begin
      if (_T_282) begin
        _T_251 <= _T_286;
      end
    end
    if (_T_74) begin
      _T_254 <= 1'h0;
    end else begin
      if (_T_282) begin
        _T_254 <= _T_287;
      end
    end
    if (_T_74) begin
      _T_257 <= 1'h0;
    end else begin
      if (_T_282) begin
        _T_257 <= _T_288;
      end
    end
    if (_T_74) begin
      _T_260 <= 1'h0;
    end else begin
      if (_T_282) begin
        _T_260 <= _T_289;
      end
    end
    if (_T_74) begin
      _T_263 <= 1'h0;
    end else begin
      if (_T_282) begin
        _T_263 <= _T_239;
      end
    end
    if (_T_74) begin
      _T_266 <= 1'h0;
    end else begin
      if (_T_282) begin
        _T_266 <= _T_240;
      end
    end
    if (_T_74) begin
      _T_269 <= 1'h1;
    end else begin
      if (_T_282) begin
        _T_269 <= _T_241;
      end
    end
    if (_T_74) begin
      _T_272 <= 1'h0;
    end else begin
      if (_T_282) begin
        _T_272 <= _T_242;
      end
    end
    if (_T_74) begin
      _T_275 <= 17'h0;
    end else begin
      _T_275 <= _GEN_151[16:0];
    end
    if (_T_74) begin
      _T_1235 <= 1'h0;
    end else begin
      if (_T_1243) begin
        _T_1235 <= _T_1244;
      end
    end
    if (_T_74) begin
      _T_1258 <= 1'h0;
    end else begin
      if (_T_1289) begin
        _T_1258 <= _T_1296;
      end else begin
        if (_T_1340) begin
          _T_1258 <= 1'h1;
        end
      end
    end
    if (_T_74) begin
      _T_1261 <= 1'h0;
    end else begin
      if (_T_1289) begin
        _T_1261 <= _T_1303;
      end else begin
        if (_T_1347) begin
          _T_1261 <= 1'h1;
        end
      end
    end
    if (_T_74) begin
      _T_1264 <= 1'h0;
    end else begin
      if (_T_1289) begin
        _T_1264 <= _T_1307;
      end else begin
        if (_T_1351) begin
          _T_1264 <= 1'h1;
        end
      end
    end
    if (_T_74) begin
      _T_1267 <= 1'h0;
    end else begin
      if (_T_1289) begin
        _T_1267 <= _T_1311;
      end else begin
        if (_T_1354) begin
          _T_1267 <= 1'h1;
        end
      end
    end
    if (_T_74) begin
      _T_1270 <= 1'h0;
    end else begin
      if (_T_1289) begin
        _T_1270 <= _T_1315;
      end else begin
        if (RXFIFO_io_full) begin
          _T_1270 <= 1'h1;
        end else begin
          _T_1270 <= _T_1267;
        end
      end
    end
    if (_T_74) begin
      _T_1273 <= 1'h0;
    end else begin
      if (_T_1289) begin
        _T_1273 <= _T_1323;
      end else begin
        if (_T_1363) begin
          _T_1273 <= 1'h1;
        end
      end
    end
    if (_T_74) begin
      _T_1276 <= 1'h0;
    end else begin
      if (_T_1289) begin
        _T_1276 <= _T_1327;
      end else begin
        if (FIFO_qspi_3_io_empty) begin
          _T_1276 <= 1'h1;
        end
      end
    end
    if (_T_74) begin
      _T_1279 <= 1'h0;
    end else begin
      if (_T_1289) begin
        _T_1279 <= _T_1331;
      end else begin
        if (_T_1375) begin
          _T_1279 <= 1'h1;
        end
      end
    end
    if (_T_74) begin
      _T_1282 <= 1'h0;
    end else begin
      if (_T_1289) begin
        _T_1282 <= _T_1335;
      end else begin
        if (_T_1380) begin
          _T_1282 <= 1'h1;
        end
      end
    end
    if (_T_74) begin
      _T_1402 <= 1'h0;
    end else begin
      if (_T_1433) begin
        _T_1402 <= _T_285;
      end
    end
    if (_T_74) begin
      _T_1405 <= 1'h0;
    end else begin
      if (_T_1433) begin
        _T_1405 <= _T_286;
      end
    end
    if (_T_74) begin
      _T_1408 <= 1'h0;
    end else begin
      if (_T_1433) begin
        _T_1408 <= _T_287;
      end
    end
    if (_T_74) begin
      _T_1411 <= 1'h0;
    end else begin
      if (_T_1433) begin
        _T_1411 <= _T_288;
      end
    end
    if (_T_74) begin
      _T_1414 <= 1'h0;
    end else begin
      if (_T_1433) begin
        _T_1414 <= _T_289;
      end
    end
    if (_T_74) begin
      _T_1417 <= 1'h0;
    end else begin
      if (_T_1433) begin
        _T_1417 <= _T_239;
      end
    end
    if (_T_74) begin
      _T_1420 <= 1'h0;
    end else begin
      if (_T_1433) begin
        _T_1420 <= _T_240;
      end
    end
    if (_T_74) begin
      _T_1423 <= 1'h0;
    end else begin
      if (_T_1433) begin
        _T_1423 <= _T_241;
      end
    end
    if (_T_74) begin
      _T_1426 <= 1'h0;
    end else begin
      if (_T_1433) begin
        _T_1426 <= _T_242;
      end
    end
    if (_T_74) begin
      _T_1477 <= 8'h2;
    end else begin
      if (_T_1622) begin
        _T_1477 <= _T_1468;
      end
    end
    if (_T_74) begin
      _T_1480 <= 8'h2;
    end else begin
      if (_T_1627) begin
        _T_1480 <= 8'h0;
      end else begin
        if (_T_1645) begin
          _T_1480 <= 8'h0;
        end else begin
          if (_T_1666) begin
            _T_1480 <= 8'h0;
          end else begin
            if (_T_1687) begin
              _T_1480 <= 8'h1;
            end else begin
              if (_T_1710) begin
                if (_T_1491) begin
                  _T_1480 <= 8'h0;
                end else begin
                  _T_1480 <= _T_1785;
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_1483 <= 5'h0;
    end else begin
      if (_T_1627) begin
        _T_1483 <= 5'h0;
      end else begin
        if (_T_1645) begin
          _T_1483 <= 5'h0;
        end else begin
          if (_T_1666) begin
            _T_1483 <= 5'h0;
          end else begin
            if (_T_1687) begin
              _T_1483 <= 5'h0;
            end else begin
              if (_T_1710) begin
                if (_T_1491) begin
                  if (_T_1762) begin
                    _T_1483 <= 5'h0;
                  end else begin
                    _T_1483 <= _T_1766;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_1486 <= 5'h10;
    end else begin
      if (_T_1627) begin
        if (_T_77) begin
          _T_1486 <= 5'h4;
        end else begin
          _T_1486 <= 5'h10;
        end
      end else begin
        if (_T_1645) begin
          if (_T_77) begin
            _T_1486 <= 5'h4;
          end else begin
            _T_1486 <= 5'h10;
          end
        end
      end
    end
    if (_T_74) begin
      _T_1579 <= 1'h0;
    end else begin
      if (!(_T_1627)) begin
        if (!(_T_1645)) begin
          if (!(_T_1666)) begin
            if (!(_T_1687)) begin
              if (_T_1710) begin
                if (_T_77) begin
                  if (_T_1794) begin
                    if (_T_272) begin
                      _T_1579 <= _T_83;
                    end else begin
                      if (_T_95) begin
                        _T_1579 <= io_io0_i;
                      end else begin
                        _T_1579 <= 1'h1;
                      end
                    end
                  end
                end else begin
                  if (_T_1824) begin
                    if (_T_272) begin
                      _T_1579 <= _T_83;
                    end else begin
                      _T_1579 <= io_io1_i;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_1582 <= 1'h0;
    end else begin
      if (!(_T_1627)) begin
        if (!(_T_1645)) begin
          if (!(_T_1666)) begin
            if (!(_T_1687)) begin
              if (_T_1710) begin
                if (_T_77) begin
                  if (_T_1794) begin
                    if (_T_272) begin
                      _T_1582 <= _T_86;
                    end else begin
                      if (_T_98) begin
                        _T_1582 <= io_io1_i;
                      end else begin
                        _T_1582 <= 1'h1;
                      end
                    end
                  end
                end else begin
                  if (_T_1819) begin
                    if (_T_272) begin
                      _T_1582 <= _T_83;
                    end else begin
                      _T_1582 <= io_io1_i;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_1585 <= 1'h0;
    end else begin
      if (!(_T_1627)) begin
        if (!(_T_1645)) begin
          if (!(_T_1666)) begin
            if (!(_T_1687)) begin
              if (_T_1710) begin
                if (_T_77) begin
                  if (_T_1794) begin
                    if (_T_272) begin
                      _T_1585 <= _T_89;
                    end else begin
                      if (_T_101) begin
                        _T_1585 <= io_io2_i;
                      end else begin
                        _T_1585 <= 1'h1;
                      end
                    end
                  end
                end else begin
                  if (_T_1814) begin
                    if (_T_272) begin
                      _T_1585 <= _T_83;
                    end else begin
                      _T_1585 <= io_io1_i;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_1588 <= 1'h0;
    end else begin
      if (!(_T_1627)) begin
        if (!(_T_1645)) begin
          if (!(_T_1666)) begin
            if (!(_T_1687)) begin
              if (_T_1710) begin
                if (_T_77) begin
                  if (_T_1794) begin
                    if (_T_272) begin
                      _T_1588 <= _T_92;
                    end else begin
                      if (_T_104) begin
                        _T_1588 <= io_io3_i;
                      end else begin
                        _T_1588 <= 1'h1;
                      end
                    end
                  end
                end else begin
                  if (_T_1809) begin
                    if (_T_272) begin
                      _T_1588 <= _T_83;
                    end else begin
                      _T_1588 <= io_io1_i;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_1591 <= 1'h0;
    end else begin
      if (!(_T_1627)) begin
        if (!(_T_1645)) begin
          if (!(_T_1666)) begin
            if (!(_T_1687)) begin
              if (_T_1710) begin
                if (_T_77) begin
                  if (_T_1787) begin
                    if (_T_272) begin
                      _T_1591 <= _T_83;
                    end else begin
                      if (_T_95) begin
                        _T_1591 <= io_io0_i;
                      end else begin
                        _T_1591 <= 1'h1;
                      end
                    end
                  end
                end else begin
                  if (_T_1804) begin
                    if (_T_272) begin
                      _T_1591 <= _T_83;
                    end else begin
                      _T_1591 <= io_io1_i;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_1594 <= 1'h0;
    end else begin
      if (!(_T_1627)) begin
        if (!(_T_1645)) begin
          if (!(_T_1666)) begin
            if (!(_T_1687)) begin
              if (_T_1710) begin
                if (_T_77) begin
                  if (_T_1787) begin
                    if (_T_272) begin
                      _T_1594 <= _T_86;
                    end else begin
                      if (_T_98) begin
                        _T_1594 <= io_io1_i;
                      end else begin
                        _T_1594 <= 1'h1;
                      end
                    end
                  end
                end else begin
                  if (_T_1799) begin
                    if (_T_272) begin
                      _T_1594 <= _T_83;
                    end else begin
                      _T_1594 <= io_io1_i;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_1597 <= 1'h0;
    end else begin
      if (!(_T_1627)) begin
        if (!(_T_1645)) begin
          if (!(_T_1666)) begin
            if (!(_T_1687)) begin
              if (_T_1710) begin
                if (_T_77) begin
                  if (_T_1787) begin
                    if (_T_272) begin
                      _T_1597 <= _T_89;
                    end else begin
                      if (_T_101) begin
                        _T_1597 <= io_io2_i;
                      end else begin
                        _T_1597 <= 1'h1;
                      end
                    end
                  end
                end else begin
                  if (_T_1794) begin
                    if (_T_272) begin
                      _T_1597 <= _T_83;
                    end else begin
                      _T_1597 <= io_io1_i;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_74) begin
      _T_1600 <= 1'h0;
    end else begin
      if (!(_T_1627)) begin
        if (!(_T_1645)) begin
          if (!(_T_1666)) begin
            if (!(_T_1687)) begin
              if (_T_1710) begin
                if (_T_77) begin
                  if (_T_1787) begin
                    if (_T_272) begin
                      _T_1600 <= _T_92;
                    end else begin
                      if (_T_104) begin
                        _T_1600 <= io_io3_i;
                      end else begin
                        _T_1600 <= 1'h1;
                      end
                    end
                  end
                end else begin
                  if (_T_1787) begin
                    if (_T_272) begin
                      _T_1600 <= _T_83;
                    end else begin
                      _T_1600 <= io_io1_i;
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
endmodule
