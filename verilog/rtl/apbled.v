/*
//Copyright 2021 S SIVA PRASAD ssprasad12a@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

module Queue_led( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  output        io_enq_ready, // @[:@6.4]
  input         io_enq_valid, // @[:@6.4]
  input  [23:0] io_enq_bits, // @[:@6.4]
  input         io_deq_ready, // @[:@6.4]
  output        io_deq_valid, // @[:@6.4]
  output [23:0] io_deq_bits // @[:@6.4]
);
  reg [23:0] ram [0:3]; // @[Decoupled.scala 214:24:@8.4]
  reg [31:0] _RAND_0;
  wire [23:0] ram__T_63_data; // @[Decoupled.scala 214:24:@8.4]
  wire [1:0] ram__T_63_addr; // @[Decoupled.scala 214:24:@8.4]
  wire [23:0] ram__T_49_data; // @[Decoupled.scala 214:24:@8.4]
  wire [1:0] ram__T_49_addr; // @[Decoupled.scala 214:24:@8.4]
  wire  ram__T_49_mask; // @[Decoupled.scala 214:24:@8.4]
  wire  ram__T_49_en; // @[Decoupled.scala 214:24:@8.4]
  reg [1:0] value; // @[Counter.scala 26:33:@9.4]
  reg [31:0] _RAND_1;
  reg [1:0] value_1; // @[Counter.scala 26:33:@10.4]
  reg [31:0] _RAND_2;
  reg  maybe_full; // @[Decoupled.scala 217:35:@11.4]
  reg [31:0] _RAND_3;
  wire  _T_41; // @[Decoupled.scala 219:41:@12.4]
  wire  _T_43; // @[Decoupled.scala 220:36:@13.4]
  wire  empty; // @[Decoupled.scala 220:33:@14.4]
  wire  _T_44; // @[Decoupled.scala 221:32:@15.4]
  wire  do_enq; // @[Decoupled.scala 37:37:@16.4]
  wire  do_deq; // @[Decoupled.scala 37:37:@19.4]
  wire [2:0] _T_52; // @[Counter.scala 35:22:@26.6]
  wire [1:0] _T_53; // @[Counter.scala 35:22:@27.6]
  wire [1:0] _GEN_5; // @[Decoupled.scala 225:17:@22.4]
  wire [2:0] _T_56; // @[Counter.scala 35:22:@32.6]
  wire [1:0] _T_57; // @[Counter.scala 35:22:@33.6]
  wire [1:0] _GEN_6; // @[Decoupled.scala 229:17:@30.4]
  wire  _T_58; // @[Decoupled.scala 232:16:@36.4]
  wire  _GEN_7; // @[Decoupled.scala 232:28:@37.4]
  assign ram__T_63_addr = value_1;
  assign ram__T_63_data = ram[ram__T_63_addr]; // @[Decoupled.scala 214:24:@8.4]
  assign ram__T_49_data = io_enq_bits;
  assign ram__T_49_addr = value;
  assign ram__T_49_mask = 1'h1;
  assign ram__T_49_en = io_enq_ready & io_enq_valid;
  assign _T_41 = value == value_1; // @[Decoupled.scala 219:41:@12.4]
  assign _T_43 = maybe_full == 1'h0; // @[Decoupled.scala 220:36:@13.4]
  assign empty = _T_41 & _T_43; // @[Decoupled.scala 220:33:@14.4]
  assign _T_44 = _T_41 & maybe_full; // @[Decoupled.scala 221:32:@15.4]
  assign do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:@16.4]
  assign do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:@19.4]
  assign _T_52 = value + 2'h1; // @[Counter.scala 35:22:@26.6]
  assign _T_53 = _T_52[1:0]; // @[Counter.scala 35:22:@27.6]
  assign _GEN_5 = do_enq ? _T_53 : value; // @[Decoupled.scala 225:17:@22.4]
  assign _T_56 = value_1 + 2'h1; // @[Counter.scala 35:22:@32.6]
  assign _T_57 = _T_56[1:0]; // @[Counter.scala 35:22:@33.6]
  assign _GEN_6 = do_deq ? _T_57 : value_1; // @[Decoupled.scala 229:17:@30.4]
  assign _T_58 = do_enq != do_deq; // @[Decoupled.scala 232:16:@36.4]
  assign _GEN_7 = _T_58 ? do_enq : maybe_full; // @[Decoupled.scala 232:28:@37.4]
  assign io_enq_ready = _T_44 == 1'h0; // @[Decoupled.scala 237:16:@43.4]
  assign io_deq_valid = empty == 1'h0; // @[Decoupled.scala 236:16:@41.4]
  assign io_deq_bits = ram__T_63_data; // @[Decoupled.scala 238:15:@45.4]
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
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram[initvar] = _RAND_0[23:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(ram__T_49_en & ram__T_49_mask) begin
      ram[ram__T_49_addr] <= ram__T_49_data; // @[Decoupled.scala 214:24:@8.4]
    end
    if (reset) begin
      value <= 2'h0;
    end else begin
      if (do_enq) begin
        value <= _T_53;
      end
    end
    if (reset) begin
      value_1 <= 2'h0;
    end else begin
      if (do_deq) begin
        value_1 <= _T_57;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_58) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module QueueModuleled( // @[:@53.2]
  input         clock, // @[:@54.4]
  input         reset, // @[:@55.4]
  output        io_i_ready, // @[:@56.4]
  input         io_i_valid, // @[:@56.4]
  input  [23:0] io_i_bits, // @[:@56.4]
  input         io_o_ready, // @[:@56.4]
  output        io_o_valid, // @[:@56.4]
  output [23:0] io_o_bits // @[:@56.4]
);
  wire  qa_clock; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_reset; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_enq_ready; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_enq_valid; // @[Decoupled.scala 293:21:@58.4]
  wire [23:0] qa_io_enq_bits; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_deq_ready; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_deq_valid; // @[Decoupled.scala 293:21:@58.4]
  wire [23:0] qa_io_deq_bits; // @[Decoupled.scala 293:21:@58.4]
  Queue_led qa ( // @[Decoupled.scala 293:21:@58.4]
    .clock(qa_clock),
    .reset(qa_reset),
    .io_enq_ready(qa_io_enq_ready),
    .io_enq_valid(qa_io_enq_valid),
    .io_enq_bits(qa_io_enq_bits),
    .io_deq_ready(qa_io_deq_ready),
    .io_deq_valid(qa_io_deq_valid),
    .io_deq_bits(qa_io_deq_bits)
  );
  assign io_i_ready = qa_io_enq_ready; // @[Decoupled.scala 296:17:@63.4]
  assign io_o_valid = qa_io_deq_valid; // @[queue.scala 17:15:@64.4]
  assign io_o_bits = qa_io_deq_bits; // @[queue.scala 18:15:@65.4]
  assign qa_clock = clock; // @[:@59.4]
  assign qa_reset = reset; // @[:@60.4]
  assign qa_io_enq_valid = io_i_valid; // @[Decoupled.scala 294:22:@61.4]
  assign qa_io_enq_bits = io_i_bits; // @[Decoupled.scala 295:21:@62.4]
  assign qa_io_deq_ready = io_o_ready; // @[queue.scala 19:15:@66.4]
endmodule
module apbled( // @[:@68.2]
  input         clock, // @[:@69.4]
  input         reset, // @[:@70.4]
  input         io_PCLK, // @[:@71.4]
  input         io_PRESETn, // @[:@71.4]
  input  [7:0]  io_PADDR, // @[:@71.4]
  input         io_PPROT, // @[:@71.4]
  input         io_PSEL, // @[:@71.4]
  input         io_PENABLE, // @[:@71.4]
  input         io_PWRITE, // @[:@71.4]
  input  [31:0] io_PWDATA, // @[:@71.4]
  input  [3:0]  io_PSTRB, // @[:@71.4]
  output        io_PREADY, // @[:@71.4]
  output [31:0] io_PRDATA, // @[:@71.4]
  output        io_PSLVERR, // @[:@71.4]
  output        io_LEDOUT // @[:@71.4]
);
  wire  QueueModuleled_clock; // @[led.scala 43:21:@83.4]
  wire  QueueModuleled_reset; // @[led.scala 43:21:@83.4]
  wire  QueueModuleled_io_i_ready; // @[led.scala 43:21:@83.4]
  wire  QueueModuleled_io_i_valid; // @[led.scala 43:21:@83.4]
  wire [23:0] QueueModuleled_io_i_bits; // @[led.scala 43:21:@83.4]
  wire  QueueModuleled_io_o_ready; // @[led.scala 43:21:@83.4]
  wire  QueueModuleled_io_o_valid; // @[led.scala 43:21:@83.4]
  wire [23:0] QueueModuleled_io_o_bits; // @[led.scala 43:21:@83.4]
  wire  _T_33; // @[led.scala 30:28:@75.4]
  reg  _T_36; // @[led.scala 31:23:@76.4]
  reg [31:0] _RAND_0;
  reg  _T_39; // @[led.scala 32:23:@77.4]
  reg [31:0] _RAND_1;
  reg [31:0] _T_42; // @[led.scala 33:23:@78.4]
  reg [31:0] _RAND_2;
  reg [1:0] _T_50; // @[led.scala 39:21:@82.4]
  reg [31:0] _RAND_3;
  reg [23:0] _T_53; // @[led.scala 45:27:@86.4]
  reg [31:0] _RAND_4;
  reg  _T_56; // @[led.scala 46:27:@87.4]
  reg [31:0] _RAND_5;
  reg  _T_59; // @[led.scala 47:27:@88.4]
  reg [31:0] _RAND_6;
  reg [23:0] _T_62; // @[led.scala 53:21:@92.4]
  reg [31:0] _RAND_7;
  reg [4:0] _T_65; // @[led.scala 55:25:@93.4]
  reg [31:0] _RAND_8;
  reg [7:0] _T_68; // @[led.scala 57:18:@94.4]
  reg [31:0] _RAND_9;
  reg [7:0] _T_71; // @[led.scala 58:18:@95.4]
  reg [31:0] _RAND_10;
  reg [7:0] _T_74; // @[led.scala 59:18:@96.4]
  reg [31:0] _RAND_11;
  reg [7:0] _T_77; // @[led.scala 60:18:@97.4]
  reg [31:0] _RAND_12;
  reg [7:0] _T_80; // @[led.scala 62:23:@98.4]
  reg [31:0] _RAND_13;
  reg [7:0] _T_83; // @[led.scala 63:20:@99.4]
  reg [31:0] _RAND_14;
  wire [8:0] _T_84; // @[led.scala 64:18:@100.4]
  wire [7:0] _T_85; // @[led.scala 64:18:@101.4]
  wire [8:0] _T_86; // @[led.scala 65:18:@102.4]
  wire [7:0] _T_87; // @[led.scala 65:18:@103.4]
  wire  _T_88; // @[led.scala 69:15:@104.4]
  wire  _T_89; // @[led.scala 69:28:@105.4]
  wire  _T_98; // @[led.scala 69:60:@107.4]
  wire  _T_99; // @[led.scala 69:42:@108.4]
  wire [23:0] _T_100; // @[led.scala 70:28:@110.6]
  wire [23:0] _GEN_0; // @[led.scala 69:86:@109.4]
  wire  _T_107; // @[led.scala 77:60:@121.4]
  wire  _T_108; // @[led.scala 77:42:@122.4]
  wire [7:0] _T_109; // @[led.scala 78:25:@124.6]
  wire [7:0] _GEN_2; // @[led.scala 77:87:@123.4]
  wire  _T_113; // @[led.scala 81:60:@130.4]
  wire  _T_114; // @[led.scala 81:42:@131.4]
  wire [7:0] _GEN_3; // @[led.scala 81:87:@132.4]
  wire  _T_119; // @[led.scala 85:60:@139.4]
  wire  _T_120; // @[led.scala 85:42:@140.4]
  wire [7:0] _GEN_4; // @[led.scala 85:87:@141.4]
  wire  _T_125; // @[led.scala 89:60:@148.4]
  wire  _T_126; // @[led.scala 89:42:@149.4]
  wire [7:0] _GEN_5; // @[led.scala 89:87:@150.4]
  wire  _T_129; // @[led.scala 94:19:@154.4]
  wire  _T_130; // @[led.scala 94:16:@155.4]
  wire  _T_132; // @[led.scala 94:33:@156.4]
  wire  _T_133; // @[led.scala 94:30:@157.4]
  wire  _T_135; // @[led.scala 94:63:@159.4]
  wire  _T_136; // @[led.scala 94:45:@160.4]
  wire  _T_139; // @[led.scala 95:32:@162.6]
  wire  _T_141; // @[led.scala 95:52:@163.6]
  wire [30:0] _T_142; // @[Cat.scala 30:58:@164.6]
  wire [31:0] _T_143; // @[Cat.scala 30:58:@165.6]
  wire [31:0] _GEN_6; // @[led.scala 94:89:@161.4]
  wire  _T_147; // @[led.scala 98:28:@170.4]
  wire  _T_149; // @[led.scala 98:61:@172.4]
  wire  _T_150; // @[led.scala 98:43:@173.4]
  wire  _T_151; // @[led.scala 99:26:@175.6]
  wire  _GEN_7; // @[led.scala 98:91:@174.4]
  wire  _T_152; // @[Conditional.scala 37:30:@178.4]
  wire [1:0] _T_153; // @[led.scala 106:24:@180.6]
  wire  _T_156; // @[Conditional.scala 37:30:@186.6]
  wire  _T_159; // @[led.scala 114:24:@188.8]
  wire  _T_161; // @[Conditional.scala 37:30:@195.8]
  wire  _T_164; // @[led.scala 127:34:@200.10]
  wire [7:0] _T_165; // @[led.scala 127:27:@201.10]
  wire  _T_166; // @[Conditional.scala 37:30:@205.10]
  wire  _T_169; // @[led.scala 137:33:@210.12]
  wire [24:0] _GEN_35; // @[led.scala 137:53:@211.12]
  wire [24:0] _T_170; // @[led.scala 137:53:@211.12]
  wire [24:0] _T_171; // @[led.scala 137:26:@212.12]
  wire [8:0] _T_175; // @[led.scala 138:62:@215.12]
  wire [7:0] _T_176; // @[led.scala 138:62:@216.12]
  wire [7:0] _T_177; // @[led.scala 138:26:@217.12]
  wire  _T_180; // @[led.scala 139:61:@220.12]
  wire [5:0] _T_183; // @[led.scala 139:85:@221.12]
  wire [4:0] _T_184; // @[led.scala 139:85:@222.12]
  wire [4:0] _T_185; // @[led.scala 139:49:@223.12]
  wire [4:0] _T_186; // @[led.scala 139:26:@224.12]
  wire [1:0] _T_190; // @[led.scala 140:49:@228.12]
  wire [1:0] _T_191; // @[led.scala 140:26:@229.12]
  wire  _T_193; // @[led.scala 144:33:@232.12]
  wire  _T_197; // @[led.scala 146:33:@234.12]
  wire  _T_201; // @[led.scala 143:26:@236.12]
  wire [7:0] _GEN_8; // @[Conditional.scala 39:67:@206.10]
  wire [24:0] _GEN_9; // @[Conditional.scala 39:67:@206.10]
  wire [7:0] _GEN_10; // @[Conditional.scala 39:67:@206.10]
  wire [4:0] _GEN_11; // @[Conditional.scala 39:67:@206.10]
  wire [1:0] _GEN_12; // @[Conditional.scala 39:67:@206.10]
  wire  _GEN_13; // @[Conditional.scala 39:67:@206.10]
  wire  _GEN_14; // @[Conditional.scala 39:67:@196.8]
  wire  _GEN_15; // @[Conditional.scala 39:67:@196.8]
  wire [1:0] _GEN_16; // @[Conditional.scala 39:67:@196.8]
  wire [7:0] _GEN_17; // @[Conditional.scala 39:67:@196.8]
  wire [24:0] _GEN_18; // @[Conditional.scala 39:67:@196.8]
  wire [7:0] _GEN_19; // @[Conditional.scala 39:67:@196.8]
  wire [4:0] _GEN_20; // @[Conditional.scala 39:67:@196.8]
  wire  _GEN_21; // @[Conditional.scala 39:67:@187.6]
  wire  _GEN_22; // @[Conditional.scala 39:67:@187.6]
  wire [24:0] _GEN_23; // @[Conditional.scala 39:67:@187.6]
  wire [1:0] _GEN_24; // @[Conditional.scala 39:67:@187.6]
  wire [7:0] _GEN_25; // @[Conditional.scala 39:67:@187.6]
  wire [7:0] _GEN_26; // @[Conditional.scala 39:67:@187.6]
  wire [4:0] _GEN_27; // @[Conditional.scala 39:67:@187.6]
  wire [1:0] _GEN_28; // @[Conditional.scala 40:58:@179.4]
  wire  _GEN_29; // @[Conditional.scala 40:58:@179.4]
  wire  _GEN_30; // @[Conditional.scala 40:58:@179.4]
  wire [24:0] _GEN_31; // @[Conditional.scala 40:58:@179.4]
  wire [7:0] _GEN_32; // @[Conditional.scala 40:58:@179.4]
  wire [7:0] _GEN_33; // @[Conditional.scala 40:58:@179.4]
  wire [4:0] _GEN_34; // @[Conditional.scala 40:58:@179.4]
  QueueModuleled QueueModuleled ( // @[led.scala 43:21:@83.4]
    .clock(QueueModuleled_clock),
    .reset(QueueModuleled_reset),
    .io_i_ready(QueueModuleled_io_i_ready),
    .io_i_valid(QueueModuleled_io_i_valid),
    .io_i_bits(QueueModuleled_io_i_bits),
    .io_o_ready(QueueModuleled_io_o_ready),
    .io_o_valid(QueueModuleled_io_o_valid),
    .io_o_bits(QueueModuleled_io_o_bits)
  );
  assign _T_33 = ~ io_PRESETn; // @[led.scala 30:28:@75.4]
  assign _T_84 = _T_68 + _T_71; // @[led.scala 64:18:@100.4]
  assign _T_85 = _T_84[7:0]; // @[led.scala 64:18:@101.4]
  assign _T_86 = _T_74 + _T_77; // @[led.scala 65:18:@102.4]
  assign _T_87 = _T_86[7:0]; // @[led.scala 65:18:@103.4]
  assign _T_88 = io_PSEL & io_PWRITE; // @[led.scala 69:15:@104.4]
  assign _T_89 = _T_88 & io_PENABLE; // @[led.scala 69:28:@105.4]
  assign _T_98 = io_PADDR == 8'h0; // @[led.scala 69:60:@107.4]
  assign _T_99 = _T_89 & _T_98; // @[led.scala 69:42:@108.4]
  assign _T_100 = io_PWDATA[23:0]; // @[led.scala 70:28:@110.6]
  assign _GEN_0 = _T_99 ? _T_100 : 24'h0; // @[led.scala 69:86:@109.4]
  assign _T_107 = io_PADDR == 8'h8; // @[led.scala 77:60:@121.4]
  assign _T_108 = _T_89 & _T_107; // @[led.scala 77:42:@122.4]
  assign _T_109 = io_PWDATA[7:0]; // @[led.scala 78:25:@124.6]
  assign _GEN_2 = _T_108 ? _T_109 : _T_68; // @[led.scala 77:87:@123.4]
  assign _T_113 = io_PADDR == 8'hc; // @[led.scala 81:60:@130.4]
  assign _T_114 = _T_89 & _T_113; // @[led.scala 81:42:@131.4]
  assign _GEN_3 = _T_114 ? _T_109 : _T_71; // @[led.scala 81:87:@132.4]
  assign _T_119 = io_PADDR == 8'h10; // @[led.scala 85:60:@139.4]
  assign _T_120 = _T_89 & _T_119; // @[led.scala 85:42:@140.4]
  assign _GEN_4 = _T_120 ? _T_109 : _T_74; // @[led.scala 85:87:@141.4]
  assign _T_125 = io_PADDR == 8'h14; // @[led.scala 89:60:@148.4]
  assign _T_126 = _T_89 & _T_125; // @[led.scala 89:42:@149.4]
  assign _GEN_5 = _T_126 ? _T_109 : _T_77; // @[led.scala 89:87:@150.4]
  assign _T_129 = io_PWRITE == 1'h0; // @[led.scala 94:19:@154.4]
  assign _T_130 = io_PSEL & _T_129; // @[led.scala 94:16:@155.4]
  assign _T_132 = io_PENABLE == 1'h0; // @[led.scala 94:33:@156.4]
  assign _T_133 = _T_130 & _T_132; // @[led.scala 94:30:@157.4]
  assign _T_135 = io_PADDR == 8'h4; // @[led.scala 94:63:@159.4]
  assign _T_136 = _T_133 & _T_135; // @[led.scala 94:45:@160.4]
  assign _T_139 = QueueModuleled_io_o_valid == 1'h0; // @[led.scala 95:32:@162.6]
  assign _T_141 = QueueModuleled_io_i_ready == 1'h0; // @[led.scala 95:52:@163.6]
  assign _T_142 = {30'h0,_T_139}; // @[Cat.scala 30:58:@164.6]
  assign _T_143 = {_T_142,_T_141}; // @[Cat.scala 30:58:@165.6]
  assign _GEN_6 = _T_136 ? _T_143 : _T_42; // @[led.scala 94:89:@161.4]
  assign _T_147 = _T_88 & _T_132; // @[led.scala 98:28:@170.4]
  assign _T_149 = io_PADDR == 8'h20; // @[led.scala 98:61:@172.4]
  assign _T_150 = _T_147 & _T_149; // @[led.scala 98:43:@173.4]
  assign _T_151 = io_PWDATA[0]; // @[led.scala 99:26:@175.6]
  assign _GEN_7 = _T_150 ? _T_151 : _T_39; // @[led.scala 98:91:@174.4]
  assign _T_152 = 2'h0 == _T_50; // @[Conditional.scala 37:30:@178.4]
  assign _T_153 = QueueModuleled_io_o_valid ? 2'h1 : 2'h0; // @[led.scala 106:24:@180.6]
  assign _T_156 = 2'h1 == _T_50; // @[Conditional.scala 37:30:@186.6]
  assign _T_159 = QueueModuleled_io_o_valid; // @[led.scala 114:24:@188.8]
  assign _T_161 = 2'h2 == _T_50; // @[Conditional.scala 37:30:@195.8]
  assign _T_164 = _T_62[23]; // @[led.scala 127:34:@200.10]
  assign _T_165 = _T_164 ? _T_87 : _T_85; // @[led.scala 127:27:@201.10]
  assign _T_166 = 2'h3 == _T_50; // @[Conditional.scala 37:30:@205.10]
  assign _T_169 = _T_83 == _T_80; // @[led.scala 137:33:@210.12]
  assign _GEN_35 = {{1'd0}, _T_62}; // @[led.scala 137:53:@211.12]
  assign _T_170 = _GEN_35 << 1; // @[led.scala 137:53:@211.12]
  assign _T_171 = _T_169 ? _T_170 : {{1'd0}, _T_62}; // @[led.scala 137:26:@212.12]
  assign _T_175 = _T_83 + 8'h1; // @[led.scala 138:62:@215.12]
  assign _T_176 = _T_175[7:0]; // @[led.scala 138:62:@216.12]
  assign _T_177 = _T_169 ? 8'h1 : _T_176; // @[led.scala 138:26:@217.12]
  assign _T_180 = _T_65 == 5'h17; // @[led.scala 139:61:@220.12]
  assign _T_183 = _T_65 + 5'h1; // @[led.scala 139:85:@221.12]
  assign _T_184 = _T_183[4:0]; // @[led.scala 139:85:@222.12]
  assign _T_185 = _T_180 ? 5'h0 : _T_184; // @[led.scala 139:49:@223.12]
  assign _T_186 = _T_169 ? _T_185 : _T_65; // @[led.scala 139:26:@224.12]
  assign _T_190 = _T_180 ? 2'h0 : 2'h3; // @[led.scala 140:49:@228.12]
  assign _T_191 = _T_169 ? _T_190 : _T_50; // @[led.scala 140:26:@229.12]
  assign _T_193 = _T_83 <= _T_74; // @[led.scala 144:33:@232.12]
  assign _T_197 = _T_83 <= _T_68; // @[led.scala 146:33:@234.12]
  assign _T_201 = _T_164 ? _T_193 : _T_197; // @[led.scala 143:26:@236.12]
  assign _GEN_8 = _T_166 ? _T_165 : _T_80; // @[Conditional.scala 39:67:@206.10]
  assign _GEN_9 = _T_166 ? _T_171 : {{1'd0}, _T_62}; // @[Conditional.scala 39:67:@206.10]
  assign _GEN_10 = _T_166 ? _T_177 : _T_83; // @[Conditional.scala 39:67:@206.10]
  assign _GEN_11 = _T_166 ? _T_186 : _T_65; // @[Conditional.scala 39:67:@206.10]
  assign _GEN_12 = _T_166 ? _T_191 : _T_50; // @[Conditional.scala 39:67:@206.10]
  assign _GEN_13 = _T_166 ? _T_201 : _T_36; // @[Conditional.scala 39:67:@206.10]
  assign _GEN_14 = _T_161 ? 1'h0 : _T_59; // @[Conditional.scala 39:67:@196.8]
  assign _GEN_15 = _T_161 ? 1'h0 : _GEN_13; // @[Conditional.scala 39:67:@196.8]
  assign _GEN_16 = _T_161 ? 2'h3 : _GEN_12; // @[Conditional.scala 39:67:@196.8]
  assign _GEN_17 = _T_161 ? _T_165 : _GEN_8; // @[Conditional.scala 39:67:@196.8]
  assign _GEN_18 = _T_161 ? {{1'd0}, _T_62} : _GEN_9; // @[Conditional.scala 39:67:@196.8]
  assign _GEN_19 = _T_161 ? _T_83 : _GEN_10; // @[Conditional.scala 39:67:@196.8]
  assign _GEN_20 = _T_161 ? _T_65 : _GEN_11; // @[Conditional.scala 39:67:@196.8]
  assign _GEN_21 = _T_156 ? _T_159 : _GEN_14; // @[Conditional.scala 39:67:@187.6]
  assign _GEN_22 = _T_156 ? 1'h0 : _GEN_15; // @[Conditional.scala 39:67:@187.6]
  assign _GEN_23 = _T_156 ? {{1'd0}, QueueModuleled_io_o_bits} : _GEN_18; // @[Conditional.scala 39:67:@187.6]
  assign _GEN_24 = _T_156 ? 2'h2 : _GEN_16; // @[Conditional.scala 39:67:@187.6]
  assign _GEN_25 = _T_156 ? _T_80 : _GEN_17; // @[Conditional.scala 39:67:@187.6]
  assign _GEN_26 = _T_156 ? _T_83 : _GEN_19; // @[Conditional.scala 39:67:@187.6]
  assign _GEN_27 = _T_156 ? _T_65 : _GEN_20; // @[Conditional.scala 39:67:@187.6]
  assign _GEN_28 = _T_152 ? _T_153 : _GEN_24; // @[Conditional.scala 40:58:@179.4]
  assign _GEN_29 = _T_152 ? 1'h0 : _GEN_22; // @[Conditional.scala 40:58:@179.4]
  assign _GEN_30 = _T_152 ? 1'h0 : _GEN_21; // @[Conditional.scala 40:58:@179.4]
  assign _GEN_31 = _T_152 ? {{1'd0}, _T_62} : _GEN_23; // @[Conditional.scala 40:58:@179.4]
  assign _GEN_32 = _T_152 ? _T_80 : _GEN_25; // @[Conditional.scala 40:58:@179.4]
  assign _GEN_33 = _T_152 ? _T_83 : _GEN_26; // @[Conditional.scala 40:58:@179.4]
  assign _GEN_34 = _T_152 ? _T_65 : _GEN_27; // @[Conditional.scala 40:58:@179.4]
  assign io_PREADY = 1'h1; // @[led.scala 27:12:@73.4]
  assign io_PRDATA = _T_42; // @[led.scala 34:14:@79.4]
  assign io_PSLVERR = 1'h0; // @[led.scala 28:12:@74.4]
  assign io_LEDOUT = _T_39 ? 1'h0 : _T_36; // @[led.scala 35:14:@81.4]
  assign QueueModuleled_clock = io_PCLK; // @[:@84.4]
  assign QueueModuleled_reset = ~ io_PRESETn; // @[:@85.4]
  assign QueueModuleled_io_i_valid = _T_56; // @[led.scala 49:20:@89.4]
  assign QueueModuleled_io_i_bits = _T_53; // @[led.scala 50:20:@90.4]
  assign QueueModuleled_io_o_ready = _T_59; // @[led.scala 51:20:@91.4]
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
  _T_36 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_39 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_42 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_50 = _RAND_3[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_53 = _RAND_4[23:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_56 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_59 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_62 = _RAND_7[23:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_65 = _RAND_8[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_68 = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_71 = _RAND_10[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_74 = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_77 = _RAND_12[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_80 = _RAND_13[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_83 = _RAND_14[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge io_PCLK) begin
    if (_T_33) begin
      _T_36 <= 1'h1;
    end else begin
      if (_T_152) begin
        _T_36 <= 1'h0;
      end else begin
        if (_T_156) begin
          _T_36 <= 1'h0;
        end else begin
          if (_T_161) begin
            _T_36 <= 1'h0;
          end else begin
            if (_T_166) begin
              if (_T_164) begin
                _T_36 <= _T_193;
              end else begin
                _T_36 <= _T_197;
              end
            end
          end
        end
      end
    end
    if (_T_33) begin
      _T_39 <= 1'h0;
    end else begin
      if (_T_150) begin
        _T_39 <= _T_151;
      end
    end
    if (_T_33) begin
      _T_42 <= 32'h0;
    end else begin
      if (_T_136) begin
        _T_42 <= _T_143;
      end
    end
    if (_T_33) begin
      _T_50 <= 2'h0;
    end else begin
      if (_T_152) begin
        if (QueueModuleled_io_o_valid) begin
          _T_50 <= 2'h1;
        end else begin
          _T_50 <= 2'h0;
        end
      end else begin
        if (_T_156) begin
          _T_50 <= 2'h2;
        end else begin
          if (_T_161) begin
            _T_50 <= 2'h3;
          end else begin
            if (_T_166) begin
              if (_T_169) begin
                if (_T_180) begin
                  _T_50 <= 2'h0;
                end else begin
                  _T_50 <= 2'h3;
                end
              end
            end
          end
        end
      end
    end
    if (_T_33) begin
      _T_53 <= 24'h0;
    end else begin
      if (_T_99) begin
        _T_53 <= _T_100;
      end else begin
        _T_53 <= 24'h0;
      end
    end
    if (_T_33) begin
      _T_56 <= 1'h0;
    end else begin
      _T_56 <= _T_99;
    end
    if (_T_33) begin
      _T_59 <= 1'h0;
    end else begin
      if (_T_152) begin
        _T_59 <= 1'h0;
      end else begin
        if (_T_156) begin
          _T_59 <= _T_159;
        end else begin
          if (_T_161) begin
            _T_59 <= 1'h0;
          end
        end
      end
    end
    if (_T_33) begin
      _T_62 <= 24'h0;
    end else begin
      _T_62 <= _GEN_31[23:0];
    end
    if (_T_33) begin
      _T_65 <= 5'h0;
    end else begin
      if (!(_T_152)) begin
        if (!(_T_156)) begin
          if (!(_T_161)) begin
            if (_T_166) begin
              if (_T_169) begin
                if (_T_180) begin
                  _T_65 <= 5'h0;
                end else begin
                  _T_65 <= _T_184;
                end
              end
            end
          end
        end
      end
    end
    if (_T_33) begin
      _T_68 <= 8'h4;
    end else begin
      if (_T_108) begin
        _T_68 <= _T_109;
      end
    end
    if (_T_33) begin
      _T_71 <= 8'h4;
    end else begin
      if (_T_114) begin
        _T_71 <= _T_109;
      end
    end
    if (_T_33) begin
      _T_74 <= 8'h4;
    end else begin
      if (_T_120) begin
        _T_74 <= _T_109;
      end
    end
    if (_T_33) begin
      _T_77 <= 8'h4;
    end else begin
      if (_T_126) begin
        _T_77 <= _T_109;
      end
    end
    if (_T_33) begin
      _T_80 <= 8'h0;
    end else begin
      if (!(_T_152)) begin
        if (!(_T_156)) begin
          if (_T_161) begin
            if (_T_164) begin
              _T_80 <= _T_87;
            end else begin
              _T_80 <= _T_85;
            end
          end else begin
            if (_T_166) begin
              if (_T_164) begin
                _T_80 <= _T_87;
              end else begin
                _T_80 <= _T_85;
              end
            end
          end
        end
      end
    end
    if (_T_33) begin
      _T_83 <= 8'h1;
    end else begin
      if (!(_T_152)) begin
        if (!(_T_156)) begin
          if (!(_T_161)) begin
            if (_T_166) begin
              if (_T_169) begin
                _T_83 <= 8'h1;
              end else begin
                _T_83 <= _T_176;
              end
            end
          end
        end
      end
    end
  end
endmodule
