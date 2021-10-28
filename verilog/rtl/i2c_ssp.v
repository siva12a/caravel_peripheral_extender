/*
//Copyright 2021 S SIVA PRASAD ssprasad12a@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module Queue_i2c( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  output       io_enq_ready, // @[:@6.4]
  input        io_enq_valid, // @[:@6.4]
  input  [7:0] io_enq_bits, // @[:@6.4]
  input        io_deq_ready, // @[:@6.4]
  output       io_deq_valid, // @[:@6.4]
  output [7:0] io_deq_bits // @[:@6.4]
);
  reg [7:0] ram [0:15]; // @[Decoupled.scala 214:24:@8.4]
  reg [31:0] _RAND_0;
  wire [7:0] ram__T_63_data; // @[Decoupled.scala 214:24:@8.4]
  wire [3:0] ram__T_63_addr; // @[Decoupled.scala 214:24:@8.4]
  wire [7:0] ram__T_49_data; // @[Decoupled.scala 214:24:@8.4]
  wire [3:0] ram__T_49_addr; // @[Decoupled.scala 214:24:@8.4]
  wire  ram__T_49_mask; // @[Decoupled.scala 214:24:@8.4]
  wire  ram__T_49_en; // @[Decoupled.scala 214:24:@8.4]
  reg [3:0] value; // @[Counter.scala 26:33:@9.4]
  reg [31:0] _RAND_1;
  reg [3:0] value_1; // @[Counter.scala 26:33:@10.4]
  reg [31:0] _RAND_2;
  reg  maybe_full; // @[Decoupled.scala 217:35:@11.4]
  reg [31:0] _RAND_3;
  wire  _T_41; // @[Decoupled.scala 219:41:@12.4]
  wire  _T_43; // @[Decoupled.scala 220:36:@13.4]
  wire  empty; // @[Decoupled.scala 220:33:@14.4]
  wire  _T_44; // @[Decoupled.scala 221:32:@15.4]
  wire  do_enq; // @[Decoupled.scala 37:37:@16.4]
  wire  do_deq; // @[Decoupled.scala 37:37:@19.4]
  wire [4:0] _T_52; // @[Counter.scala 35:22:@26.6]
  wire [3:0] _T_53; // @[Counter.scala 35:22:@27.6]
  wire [3:0] _GEN_5; // @[Decoupled.scala 225:17:@22.4]
  wire [4:0] _T_56; // @[Counter.scala 35:22:@32.6]
  wire [3:0] _T_57; // @[Counter.scala 35:22:@33.6]
  wire [3:0] _GEN_6; // @[Decoupled.scala 229:17:@30.4]
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
  assign _T_52 = value + 4'h1; // @[Counter.scala 35:22:@26.6]
  assign _T_53 = _T_52[3:0]; // @[Counter.scala 35:22:@27.6]
  assign _GEN_5 = do_enq ? _T_53 : value; // @[Decoupled.scala 225:17:@22.4]
  assign _T_56 = value_1 + 4'h1; // @[Counter.scala 35:22:@32.6]
  assign _T_57 = _T_56[3:0]; // @[Counter.scala 35:22:@33.6]
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
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[3:0];
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
      value <= 4'h0;
    end else begin
      if (do_enq) begin
        value <= _T_53;
      end
    end
    if (reset) begin
      value_1 <= 4'h0;
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
module QueueModule_i2c( // @[:@53.2]
  input        clock, // @[:@54.4]
  input        reset, // @[:@55.4]
  output       io_i_ready, // @[:@56.4]
  input        io_i_valid, // @[:@56.4]
  input  [7:0] io_i_bits, // @[:@56.4]
  input        io_o_ready, // @[:@56.4]
  output       io_o_valid, // @[:@56.4]
  output [7:0] io_o_bits // @[:@56.4]
);
  wire  qa_clock; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_reset; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_enq_ready; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_enq_valid; // @[Decoupled.scala 293:21:@58.4]
  wire [7:0] qa_io_enq_bits; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_deq_ready; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_deq_valid; // @[Decoupled.scala 293:21:@58.4]
  wire [7:0] qa_io_deq_bits; // @[Decoupled.scala 293:21:@58.4]
  Queue_i2c qa ( // @[Decoupled.scala 293:21:@58.4]
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
module i2c_ssp( // @[:@133.2]
  input         clock, // @[:@134.4]
  input         reset, // @[:@135.4]
  input         io_PCLK, // @[:@136.4]
  input         io_PRESETn, // @[:@136.4]
  input  [7:0]  io_PADDR, // @[:@136.4]
  input         io_PPROT, // @[:@136.4]
  input         io_PSEL, // @[:@136.4]
  input         io_PENABLE, // @[:@136.4]
  input         io_PWRITE, // @[:@136.4]
  input  [7:0]  io_PWDATA, // @[:@136.4]
  input         io_PSTRB, // @[:@136.4]
  output        io_PREADY, // @[:@136.4]
  output [7:0]  io_PRDATA, // @[:@136.4]
  output        io_PSLVERR, // @[:@136.4]
  output        io_irq, // @[:@136.4]
  output        io_sda_t, // @[:@136.4]
  output        io_sda_o, // @[:@136.4]
  input         io_sda_i, // @[:@136.4]
  output        io_scl_t, // @[:@136.4]
  output        io_scl_o, // @[:@136.4]
  input         io_scl_i, // @[:@136.4]
  output [3:0]  io_doOpcodeio, // @[:@136.4]
  output [15:0] io_iiccount, // @[:@136.4]
  output [5:0]  io_txbitc, // @[:@136.4]
  output [4:0]  io_readl, // @[:@136.4]
  output        io_txcio, // @[:@136.4]
  output        io_rxcio, // @[:@136.4]
  output        io_startsentio, // @[:@136.4]
  output        io_stopsentio, // @[:@136.4]
  output        io_rstartsentio, // @[:@136.4]
  output        io_nackio // @[:@136.4]
);
  wire  QueueModule_i2c_clock; // @[i2c.scala 84:20:@174.4]
  wire  QueueModule_i2c_reset; // @[i2c.scala 84:20:@174.4]
  wire  QueueModule_i2c_io_i_ready; // @[i2c.scala 84:20:@174.4]
  wire  QueueModule_i2c_io_i_valid; // @[i2c.scala 84:20:@174.4]
  wire [7:0] QueueModule_i2c_io_i_bits; // @[i2c.scala 84:20:@174.4]
  wire  QueueModule_i2c_io_o_ready; // @[i2c.scala 84:20:@174.4]
  wire  QueueModule_i2c_io_o_valid; // @[i2c.scala 84:20:@174.4]
  wire [7:0] QueueModule_i2c_io_o_bits; // @[i2c.scala 84:20:@174.4]
  wire  QueueModule_i2c_1_clock; // @[i2c.scala 85:20:@177.4]
  wire  QueueModule_i2c_1_reset; // @[i2c.scala 85:20:@177.4]
  wire  QueueModule_i2c_1_io_i_ready; // @[i2c.scala 85:20:@177.4]
  wire  QueueModule_i2c_1_io_i_valid; // @[i2c.scala 85:20:@177.4]
  wire [7:0] QueueModule_i2c_1_io_i_bits; // @[i2c.scala 85:20:@177.4]
  wire  QueueModule_i2c_1_io_o_ready; // @[i2c.scala 85:20:@177.4]
  wire  QueueModule_i2c_1_io_o_valid; // @[i2c.scala 85:20:@177.4]
  wire [7:0] QueueModule_i2c_1_io_o_bits; // @[i2c.scala 85:20:@177.4]
  wire  _T_65; // @[i2c.scala 45:28:@140.4]
  reg  _T_68; // @[i2c.scala 46:21:@141.4]
  reg [31:0] _RAND_0;
  reg  _T_71; // @[i2c.scala 47:21:@142.4]
  reg [31:0] _RAND_1;
  reg  _T_74; // @[i2c.scala 48:21:@143.4]
  reg [31:0] _RAND_2;
  reg  _T_77; // @[i2c.scala 49:21:@144.4]
  reg [31:0] _RAND_3;
  reg [2:0] _T_85; // @[i2c.scala 53:21:@145.4]
  reg [31:0] _RAND_4;
  reg [7:0] _T_90; // @[i2c.scala 55:32:@147.4]
  reg [31:0] _RAND_5;
  reg [7:0] _T_93; // @[i2c.scala 56:32:@148.4]
  reg [31:0] _RAND_6;
  reg [7:0] _T_96; // @[i2c.scala 57:32:@149.4]
  reg [31:0] _RAND_7;
  reg [7:0] _T_99; // @[i2c.scala 58:32:@150.4]
  reg [31:0] _RAND_8;
  reg  _T_102; // @[i2c.scala 59:31:@151.4]
  reg [31:0] _RAND_9;
  reg  _T_105; // @[i2c.scala 60:31:@152.4]
  reg [31:0] _RAND_10;
  reg  _T_108; // @[i2c.scala 61:31:@153.4]
  reg [31:0] _RAND_11;
  reg [4:0] _T_111; // @[i2c.scala 62:31:@154.4]
  reg [31:0] _RAND_12;
  reg [4:0] _T_114; // @[i2c.scala 63:31:@155.4]
  reg [31:0] _RAND_13;
  reg  _T_117; // @[i2c.scala 64:31:@156.4]
  reg [31:0] _RAND_14;
  reg  _T_120; // @[i2c.scala 65:31:@157.4]
  reg [31:0] _RAND_15;
  reg  _T_123; // @[i2c.scala 66:31:@158.4]
  reg [31:0] _RAND_16;
  reg  _T_126; // @[i2c.scala 67:31:@159.4]
  reg [31:0] _RAND_17;
  reg  _T_129; // @[i2c.scala 68:31:@160.4]
  reg [31:0] _RAND_18;
  reg  _T_132; // @[i2c.scala 69:31:@161.4]
  reg [31:0] _RAND_19;
  reg  _T_135; // @[i2c.scala 70:31:@162.4]
  reg [31:0] _RAND_20;
  reg  _T_138; // @[i2c.scala 71:31:@163.4]
  reg [31:0] _RAND_21;
  reg  _T_141; // @[i2c.scala 72:31:@164.4]
  reg [31:0] _RAND_22;
  reg  _T_144; // @[i2c.scala 73:31:@165.4]
  reg [31:0] _RAND_23;
  reg  _T_147; // @[i2c.scala 74:31:@166.4]
  reg [31:0] _RAND_24;
  reg  _T_150; // @[i2c.scala 77:27:@167.4]
  reg [31:0] _RAND_25;
  reg [7:0] _T_156; // @[i2c.scala 79:27:@169.4]
  reg [31:0] _RAND_26;
  reg  _T_159; // @[i2c.scala 80:27:@170.4]
  reg [31:0] _RAND_27;
  reg  _T_162; // @[i2c.scala 81:27:@171.4]
  reg [31:0] _RAND_28;
  reg  _T_165; // @[i2c.scala 82:22:@172.4]
  reg [31:0] _RAND_29;
  reg [7:0] _T_168; // @[i2c.scala 83:23:@173.4]
  reg [31:0] _RAND_30;
  wire  _T_169; // @[i2c.scala 88:29:@180.4]
  wire  _T_170; // @[i2c.scala 88:42:@181.4]
  wire  _T_183; // @[i2c.scala 88:74:@183.4]
  wire  _T_192; // @[i2c.scala 110:60:@202.4]
  wire  _T_193; // @[i2c.scala 110:42:@203.4]
  wire  _T_194; // @[i2c.scala 111:26:@205.6]
  wire  _T_198; // @[i2c.scala 112:20:@208.6]
  wire  _T_200; // @[i2c.scala 113:46:@211.6]
  wire  _T_201; // @[i2c.scala 113:34:@212.6]
  wire [4:0] _T_202; // @[i2c.scala 113:59:@213.6]
  wire [4:0] _T_204; // @[i2c.scala 113:20:@214.6]
  wire  _T_206; // @[i2c.scala 116:40:@220.6]
  wire  _T_207; // @[i2c.scala 116:31:@221.6]
  wire  _T_209; // @[i2c.scala 116:20:@222.6]
  wire  _T_211; // @[i2c.scala 117:31:@225.6]
  wire  _T_213; // @[i2c.scala 117:20:@226.6]
  wire  _T_215; // @[i2c.scala 118:32:@229.6]
  wire  _T_217; // @[i2c.scala 118:20:@230.6]
  wire  _GEN_0; // @[i2c.scala 110:86:@204.4]
  wire  _GEN_1; // @[i2c.scala 110:86:@204.4]
  wire [4:0] _GEN_2; // @[i2c.scala 110:86:@204.4]
  wire  _GEN_3; // @[i2c.scala 110:86:@204.4]
  wire  _T_219; // @[i2c.scala 120:18:@233.4]
  wire  _T_220; // @[i2c.scala 120:15:@234.4]
  wire  _T_222; // @[i2c.scala 120:32:@235.4]
  wire  _T_223; // @[i2c.scala 120:29:@236.4]
  wire  _T_225; // @[i2c.scala 120:62:@238.4]
  wire  _T_226; // @[i2c.scala 120:44:@239.4]
  wire  _T_228; // @[i2c.scala 121:26:@241.6]
  wire  _T_230; // @[i2c.scala 121:45:@242.6]
  wire  _T_232; // @[i2c.scala 121:68:@243.6]
  wire  _T_234; // @[i2c.scala 121:87:@244.6]
  wire [1:0] _T_235; // @[Cat.scala 30:58:@245.6]
  wire [1:0] _T_236; // @[Cat.scala 30:58:@246.6]
  wire [3:0] _T_237; // @[Cat.scala 30:58:@247.6]
  wire [1:0] _T_238; // @[Cat.scala 30:58:@248.6]
  wire [1:0] _T_239; // @[Cat.scala 30:58:@249.6]
  wire [3:0] _T_240; // @[Cat.scala 30:58:@250.6]
  wire [7:0] _T_241; // @[Cat.scala 30:58:@251.6]
  wire [7:0] _GEN_4; // @[i2c.scala 120:88:@240.4]
  wire  _T_249; // @[i2c.scala 123:62:@259.4]
  wire  _T_250; // @[i2c.scala 123:44:@260.4]
  wire [1:0] _T_252; // @[Cat.scala 30:58:@262.6]
  wire [5:0] _T_253; // @[Cat.scala 30:58:@263.6]
  wire [7:0] _T_254; // @[Cat.scala 30:58:@264.6]
  wire [7:0] _GEN_5; // @[i2c.scala 123:89:@261.4]
  wire  _T_258; // @[i2c.scala 126:60:@270.4]
  wire  _T_259; // @[i2c.scala 126:42:@271.4]
  wire  _T_261; // @[i2c.scala 128:25:@275.6]
  wire  _T_262; // @[i2c.scala 129:25:@277.6]
  wire  _GEN_6; // @[i2c.scala 126:87:@272.4]
  wire  _GEN_7; // @[i2c.scala 126:87:@272.4]
  wire  _GEN_8; // @[i2c.scala 126:87:@272.4]
  wire  _T_271; // @[i2c.scala 131:44:@286.4]
  wire [1:0] _T_273; // @[Cat.scala 30:58:@288.6]
  wire [5:0] _T_274; // @[Cat.scala 30:58:@289.6]
  wire [7:0] _T_275; // @[Cat.scala 30:58:@290.6]
  wire [7:0] _GEN_9; // @[i2c.scala 131:89:@287.4]
  wire  _T_284; // @[i2c.scala 146:44:@299.4]
  wire [7:0] _GEN_10; // @[i2c.scala 146:88:@300.4]
  wire  _T_293; // @[i2c.scala 149:62:@308.4]
  wire  _T_294; // @[i2c.scala 149:44:@309.4]
  wire [7:0] _GEN_11; // @[i2c.scala 149:88:@310.4]
  wire  _T_300; // @[i2c.scala 155:60:@320.4]
  wire  _T_301; // @[i2c.scala 155:42:@321.4]
  wire [7:0] _GEN_13; // @[i2c.scala 155:88:@322.4]
  wire  _T_305; // @[i2c.scala 158:60:@328.4]
  wire  _T_306; // @[i2c.scala 158:42:@329.4]
  wire [7:0] _GEN_14; // @[i2c.scala 158:88:@330.4]
  wire  _T_310; // @[i2c.scala 161:60:@336.4]
  wire  _T_311; // @[i2c.scala 161:42:@337.4]
  wire [7:0] _GEN_15; // @[i2c.scala 161:89:@338.4]
  wire  _T_315; // @[i2c.scala 164:60:@344.4]
  wire  _T_316; // @[i2c.scala 164:42:@345.4]
  wire [7:0] _GEN_16; // @[i2c.scala 164:89:@346.4]
  wire  _T_325; // @[i2c.scala 167:44:@355.4]
  wire [7:0] _GEN_17; // @[i2c.scala 167:90:@356.4]
  wire  _T_334; // @[i2c.scala 170:44:@365.4]
  wire [7:0] _GEN_18; // @[i2c.scala 170:90:@366.4]
  wire  _T_343; // @[i2c.scala 173:44:@375.4]
  wire [7:0] _GEN_19; // @[i2c.scala 173:91:@376.4]
  wire  _T_352; // @[i2c.scala 176:44:@385.4]
  wire [7:0] _GEN_20; // @[i2c.scala 176:91:@386.4]
  wire  _T_356; // @[i2c.scala 179:60:@392.4]
  wire  _T_357; // @[i2c.scala 179:42:@393.4]
  wire  _T_359; // @[i2c.scala 183:33:@398.6]
  wire  _GEN_21; // @[i2c.scala 179:91:@394.4]
  wire  _T_364; // @[i2c.scala 189:28:@402.4]
  wire  _T_365; // @[i2c.scala 189:24:@403.4]
  wire  _T_367; // @[i2c.scala 190:28:@404.4]
  wire  _T_368; // @[i2c.scala 190:24:@405.4]
  wire  _T_370; // @[i2c.scala 191:28:@406.4]
  wire  _T_371; // @[i2c.scala 191:24:@407.4]
  wire  _T_372; // @[i2c.scala 193:32:@408.4]
  wire  _T_374; // @[i2c.scala 193:59:@409.4]
  wire  _T_375; // @[i2c.scala 193:47:@410.4]
  wire  _T_380; // @[i2c.scala 195:45:@413.4]
  wire  _T_384; // @[i2c.scala 196:45:@416.4]
  wire  _T_386; // @[i2c.scala 196:70:@417.4]
  wire  _T_387; // @[i2c.scala 196:67:@418.4]
  wire  _T_389; // @[i2c.scala 196:77:@419.4]
  wire  _T_390; // @[i2c.scala 196:74:@420.4]
  wire [15:0] _T_391; // @[Cat.scala 30:58:@421.4]
  wire [15:0] chhp; // @[Cat.scala 30:58:@422.4]
  wire [31:0] _T_393; // @[Cat.scala 30:58:@423.4]
  wire [32:0] _T_396; // @[i2c.scala 204:31:@425.4]
  wire [31:0] _T_397; // @[i2c.scala 204:31:@426.4]
  wire [39:0] _T_399; // @[Cat.scala 30:58:@427.4]
  wire [39:0] _GEN_161; // @[i2c.scala 205:22:@428.4]
  wire [40:0] _T_400; // @[i2c.scala 205:22:@428.4]
  wire [39:0] _T_401; // @[i2c.scala 205:22:@429.4]
  wire [32:0] _T_404; // @[i2c.scala 206:21:@431.4]
  wire [31:0] _T_405; // @[i2c.scala 206:21:@432.4]
  wire [39:0] _T_407; // @[Cat.scala 30:58:@433.4]
  wire [40:0] _T_410; // @[i2c.scala 207:36:@435.4]
  wire [39:0] _T_411; // @[i2c.scala 207:36:@436.4]
  reg [31:0] _T_414; // @[i2c.scala 218:23:@437.4]
  reg [31:0] _RAND_31;
  reg [5:0] _T_417; // @[i2c.scala 219:22:@438.4]
  reg [31:0] _RAND_32;
  reg [37:0] _T_420; // @[i2c.scala 223:26:@441.4]
  reg [63:0] _RAND_33;
  wire  _T_440; // @[i2c.scala 230:28:@449.4]
  wire [1:0] _T_444; // @[Cat.scala 30:58:@453.4]
  wire [3:0] _T_446; // @[Cat.scala 30:58:@455.4]
  wire  _T_447; // @[i2c.scala 231:28:@456.4]
  wire [1:0] _T_451; // @[Cat.scala 30:58:@460.4]
  wire [3:0] _T_453; // @[Cat.scala 30:58:@462.4]
  wire  _T_454; // @[i2c.scala 232:28:@463.4]
  wire [1:0] _T_458; // @[Cat.scala 30:58:@467.4]
  wire [3:0] _T_460; // @[Cat.scala 30:58:@469.4]
  wire  _T_461; // @[i2c.scala 233:28:@470.4]
  wire [1:0] _T_465; // @[Cat.scala 30:58:@474.4]
  wire [3:0] _T_467; // @[Cat.scala 30:58:@476.4]
  wire  _T_468; // @[i2c.scala 234:28:@477.4]
  wire [1:0] _T_472; // @[Cat.scala 30:58:@481.4]
  wire [3:0] _T_474; // @[Cat.scala 30:58:@483.4]
  wire  _T_475; // @[i2c.scala 235:28:@484.4]
  wire [1:0] _T_479; // @[Cat.scala 30:58:@488.4]
  wire [3:0] _T_481; // @[Cat.scala 30:58:@490.4]
  wire  _T_482; // @[i2c.scala 236:28:@491.4]
  wire [1:0] _T_486; // @[Cat.scala 30:58:@495.4]
  wire [3:0] _T_488; // @[Cat.scala 30:58:@497.4]
  wire  _T_489; // @[i2c.scala 237:28:@498.4]
  wire [1:0] _T_493; // @[Cat.scala 30:58:@502.4]
  wire [3:0] _T_495; // @[Cat.scala 30:58:@504.4]
  reg  _T_498; // @[i2c.scala 239:54:@505.4]
  reg [31:0] _RAND_34;
  reg  _T_501; // @[i2c.scala 239:54:@506.4]
  reg [31:0] _RAND_35;
  reg  _T_504; // @[i2c.scala 239:54:@507.4]
  reg [31:0] _RAND_36;
  reg  _T_507; // @[i2c.scala 239:54:@508.4]
  reg [31:0] _RAND_37;
  reg  _T_510; // @[i2c.scala 239:54:@509.4]
  reg [31:0] _RAND_38;
  reg  _T_513; // @[i2c.scala 239:54:@510.4]
  reg [31:0] _RAND_39;
  reg  _T_516; // @[i2c.scala 239:54:@511.4]
  reg [31:0] _RAND_40;
  reg  _T_519; // @[i2c.scala 239:54:@512.4]
  reg [31:0] _RAND_41;
  wire [1:0] _T_520; // @[Cat.scala 30:58:@513.4]
  wire [1:0] _T_521; // @[Cat.scala 30:58:@514.4]
  wire [3:0] _T_522; // @[Cat.scala 30:58:@515.4]
  wire [1:0] _T_523; // @[Cat.scala 30:58:@516.4]
  wire [1:0] _T_524; // @[Cat.scala 30:58:@517.4]
  wire [3:0] _T_525; // @[Cat.scala 30:58:@518.4]
  wire [7:0] _T_526; // @[Cat.scala 30:58:@519.4]
  wire [4:0] _T_533; // @[Cat.scala 30:58:@524.4]
  wire [7:0] _T_534; // @[Cat.scala 30:58:@525.4]
  wire [11:0] _T_535; // @[Cat.scala 30:58:@526.4]
  wire [16:0] _T_536; // @[Cat.scala 30:58:@527.4]
  wire [7:0] _T_537; // @[Cat.scala 30:58:@528.4]
  wire [11:0] _T_538; // @[Cat.scala 30:58:@529.4]
  wire [8:0] _T_540; // @[Cat.scala 30:58:@531.4]
  wire [20:0] _T_541; // @[Cat.scala 30:58:@532.4]
  wire [37:0] _T_542; // @[Cat.scala 30:58:@533.4]
  wire [37:0] _T_543; // @[i2c.scala 246:21:@534.4]
  wire [1:0] _T_564; // @[Cat.scala 30:58:@554.4]
  wire [1:0] _T_565; // @[Cat.scala 30:58:@555.4]
  wire [3:0] _T_566; // @[Cat.scala 30:58:@556.4]
  reg [3:0] _T_569; // @[i2c.scala 253:24:@557.4]
  reg [31:0] _RAND_42;
  wire  _T_570; // @[i2c.scala 265:29:@566.4]
  wire  _T_571; // @[i2c.scala 265:36:@567.4]
  wire  _T_572; // @[i2c.scala 266:29:@569.4]
  wire  _T_573; // @[i2c.scala 266:36:@570.4]
  wire  _T_575; // @[Conditional.scala 37:30:@574.4]
  wire  _T_592; // @[Mux.scala 46:19:@580.8]
  wire [2:0] _T_593; // @[Mux.scala 46:16:@581.8]
  wire  _T_594; // @[Mux.scala 46:19:@582.8]
  wire [2:0] _T_595; // @[Mux.scala 46:16:@583.8]
  wire  _T_596; // @[Mux.scala 46:19:@584.8]
  wire [2:0] _T_597; // @[Mux.scala 46:16:@585.8]
  wire  _T_598; // @[Mux.scala 46:19:@586.8]
  wire [2:0] _T_599; // @[Mux.scala 46:16:@587.8]
  wire  _T_600; // @[Mux.scala 46:19:@588.8]
  wire [2:0] _T_601; // @[Mux.scala 46:16:@589.8]
  wire  _T_602; // @[Mux.scala 46:19:@590.8]
  wire [2:0] _T_603; // @[Mux.scala 46:16:@591.8]
  wire  _T_604; // @[Mux.scala 46:19:@592.8]
  wire [2:0] _T_605; // @[Mux.scala 46:16:@593.8]
  wire  _T_606; // @[Mux.scala 46:19:@594.8]
  wire [2:0] _T_607; // @[Mux.scala 46:16:@595.8]
  wire  _T_608; // @[Mux.scala 46:19:@596.8]
  wire [2:0] _T_609; // @[Mux.scala 46:16:@597.8]
  wire  _T_610; // @[Mux.scala 46:19:@598.8]
  wire [2:0] _T_611; // @[Mux.scala 46:16:@599.8]
  wire  _T_612; // @[Mux.scala 46:19:@600.8]
  wire [2:0] _T_613; // @[Mux.scala 46:16:@601.8]
  wire  _T_614; // @[Mux.scala 46:19:@602.8]
  wire [2:0] _T_615; // @[Mux.scala 46:16:@603.8]
  wire  _T_616; // @[Mux.scala 46:19:@604.8]
  wire [2:0] _T_617; // @[Mux.scala 46:16:@605.8]
  wire  _T_618; // @[Mux.scala 46:19:@606.8]
  wire [2:0] _T_619; // @[Mux.scala 46:16:@607.8]
  wire  _T_620; // @[Mux.scala 46:19:@608.8]
  wire [2:0] _T_621; // @[Mux.scala 46:16:@609.8]
  wire  _T_622; // @[Mux.scala 46:19:@610.8]
  wire [2:0] _T_623; // @[Mux.scala 46:16:@611.8]
  wire [2:0] _GEN_22; // @[i2c.scala 272:31:@576.6]
  wire  _T_624; // @[i2c.scala 294:48:@614.6]
  wire  _T_626; // @[i2c.scala 294:72:@615.6]
  wire  _T_627; // @[i2c.scala 294:69:@616.6]
  wire  _T_634; // @[Conditional.scala 37:30:@625.6]
  wire  _T_635; // @[i2c.scala 302:49:@628.8]
  wire [32:0] _T_638; // @[i2c.scala 302:71:@629.8]
  wire [31:0] _T_639; // @[i2c.scala 302:71:@630.8]
  wire [31:0] _T_640; // @[i2c.scala 302:39:@631.8]
  wire [2:0] _T_642; // @[i2c.scala 303:31:@634.8]
  wire [31:0] _GEN_162; // @[i2c.scala 304:49:@636.8]
  wire  _T_643; // @[i2c.scala 304:49:@636.8]
  wire  _T_645; // @[i2c.scala 304:39:@637.8]
  wire  _T_649; // @[i2c.scala 306:39:@641.8]
  wire [32:0] _T_652; // @[i2c.scala 308:58:@644.8]
  wire [32:0] _T_653; // @[i2c.scala 308:58:@645.8]
  wire [31:0] _T_654; // @[i2c.scala 308:58:@646.8]
  wire  _T_655; // @[i2c.scala 308:49:@647.8]
  wire  _T_657; // @[i2c.scala 308:39:@648.8]
  wire  _T_664; // @[Conditional.scala 37:30:@658.8]
  wire  _T_665; // @[i2c.scala 318:49:@661.10]
  wire [31:0] _T_670; // @[i2c.scala 318:39:@664.10]
  wire [2:0] _T_672; // @[i2c.scala 319:39:@667.10]
  wire [16:0] _T_674; // @[i2c.scala 320:58:@669.10]
  wire [16:0] _T_675; // @[i2c.scala 320:58:@670.10]
  wire [15:0] _T_676; // @[i2c.scala 320:58:@671.10]
  wire [31:0] _GEN_163; // @[i2c.scala 320:51:@672.10]
  wire  _T_677; // @[i2c.scala 320:51:@672.10]
  wire [32:0] _T_679; // @[i2c.scala 320:87:@673.10]
  wire [32:0] _T_680; // @[i2c.scala 320:87:@674.10]
  wire [31:0] _T_681; // @[i2c.scala 320:87:@675.10]
  wire  _T_682; // @[i2c.scala 320:79:@676.10]
  wire  _T_683; // @[i2c.scala 320:66:@677.10]
  wire [40:0] _T_689; // @[i2c.scala 322:63:@681.10]
  wire [40:0] _T_690; // @[i2c.scala 322:63:@682.10]
  wire [39:0] _T_691; // @[i2c.scala 322:63:@683.10]
  wire [39:0] _GEN_164; // @[i2c.scala 322:50:@684.10]
  wire  _T_692; // @[i2c.scala 322:50:@684.10]
  wire  _T_693; // @[i2c.scala 322:84:@685.10]
  wire  _T_694; // @[i2c.scala 322:71:@686.10]
  wire  _T_709; // @[Conditional.scala 37:30:@701.10]
  wire  _T_719; // @[i2c.scala 335:64:@711.12]
  wire [2:0] _T_720; // @[i2c.scala 335:39:@712.12]
  wire  _T_721; // @[i2c.scala 336:50:@714.12]
  wire  _T_729; // @[i2c.scala 338:49:@720.12]
  wire [32:0] _T_739; // @[i2c.scala 341:64:@727.12]
  wire [32:0] _T_740; // @[i2c.scala 341:64:@728.12]
  wire [31:0] _T_741; // @[i2c.scala 341:64:@729.12]
  wire  _T_742; // @[i2c.scala 341:51:@730.12]
  wire  _T_744; // @[i2c.scala 341:40:@731.12]
  wire  _T_751; // @[i2c.scala 347:39:@737.12]
  wire  _T_752; // @[Conditional.scala 37:30:@741.12]
  wire [31:0] _GEN_167; // @[i2c.scala 352:50:@744.14]
  wire  _T_753; // @[i2c.scala 352:50:@744.14]
  wire [31:0] _T_758; // @[i2c.scala 352:39:@747.14]
  wire  _T_761; // @[i2c.scala 353:70:@750.14]
  wire [6:0] _T_764; // @[i2c.scala 353:90:@751.14]
  wire [5:0] _T_765; // @[i2c.scala 353:90:@752.14]
  wire [5:0] _T_766; // @[i2c.scala 353:62:@753.14]
  wire [5:0] _T_767; // @[i2c.scala 353:39:@754.14]
  wire  _T_770; // @[i2c.scala 354:72:@757.14]
  wire  _T_771; // @[i2c.scala 354:61:@758.14]
  wire [2:0] _T_774; // @[i2c.scala 354:100:@760.14]
  wire [2:0] _T_775; // @[i2c.scala 354:85:@761.14]
  wire [2:0] _T_776; // @[i2c.scala 354:39:@762.14]
  wire [37:0] _T_777; // @[i2c.scala 355:44:@764.14]
  wire  _T_778; // @[i2c.scala 355:44:@765.14]
  wire [37:0] _T_779; // @[i2c.scala 356:44:@767.14]
  wire  _T_780; // @[i2c.scala 356:44:@768.14]
  wire [37:0] _T_781; // @[i2c.scala 357:41:@770.14]
  wire  _T_782; // @[i2c.scala 357:41:@771.14]
  wire  _T_788; // @[i2c.scala 359:81:@777.14]
  wire  _T_794; // @[i2c.scala 360:71:@781.14]
  wire  _T_795; // @[i2c.scala 360:60:@782.14]
  wire  _T_796; // @[i2c.scala 360:81:@783.14]
  wire  _T_798; // @[i2c.scala 360:39:@784.14]
  wire  _T_801; // @[Conditional.scala 37:30:@790.14]
  wire [5:0] _T_815; // @[i2c.scala 368:62:@802.16]
  wire [5:0] _T_816; // @[i2c.scala 368:39:@803.16]
  wire  _T_820; // @[i2c.scala 369:59:@807.16]
  wire  _T_822; // @[i2c.scala 369:93:@808.16]
  wire  _T_823; // @[i2c.scala 369:80:@809.16]
  wire [2:0] _T_824; // @[i2c.scala 369:38:@810.16]
  wire [5:0] _T_832; // @[i2c.scala 370:122:@816.16]
  wire [5:0] _T_833; // @[i2c.scala 370:122:@817.16]
  wire [4:0] _T_834; // @[i2c.scala 370:122:@818.16]
  wire [4:0] _T_835; // @[i2c.scala 370:84:@819.16]
  wire [4:0] _T_836; // @[i2c.scala 370:39:@820.16]
  wire  _T_840; // @[i2c.scala 373:50:@824.16]
  wire [37:0] _T_841; // @[i2c.scala 373:68:@825.16]
  wire  _T_842; // @[i2c.scala 373:68:@826.16]
  wire [37:0] _T_843; // @[i2c.scala 373:86:@827.16]
  wire  _T_844; // @[i2c.scala 373:86:@828.16]
  wire  _T_845; // @[i2c.scala 373:39:@829.16]
  wire  _T_869; // @[i2c.scala 379:46:@850.16]
  wire  _T_870; // @[i2c.scala 379:38:@851.16]
  wire  _T_872; // @[i2c.scala 380:46:@853.16]
  wire  _T_873; // @[i2c.scala 380:38:@854.16]
  wire  _T_875; // @[i2c.scala 381:46:@856.16]
  wire  _T_876; // @[i2c.scala 381:38:@857.16]
  wire  _T_878; // @[i2c.scala 382:46:@859.16]
  wire  _T_879; // @[i2c.scala 382:38:@860.16]
  wire  _T_881; // @[i2c.scala 383:46:@862.16]
  wire  _T_882; // @[i2c.scala 383:38:@863.16]
  wire  _T_884; // @[i2c.scala 384:46:@865.16]
  wire  _T_885; // @[i2c.scala 384:38:@866.16]
  wire  _T_887; // @[i2c.scala 385:46:@868.16]
  wire  _T_888; // @[i2c.scala 385:38:@869.16]
  wire  _T_890; // @[i2c.scala 386:46:@871.16]
  wire  _T_891; // @[i2c.scala 386:38:@872.16]
  wire [31:0] _GEN_24; // @[Conditional.scala 39:67:@791.14]
  wire [5:0] _GEN_25; // @[Conditional.scala 39:67:@791.14]
  wire [2:0] _GEN_26; // @[Conditional.scala 39:67:@791.14]
  wire [4:0] _GEN_27; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_28; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_29; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_30; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_31; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_32; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_33; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_34; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_35; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_36; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_37; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_38; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_39; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_40; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_41; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_42; // @[Conditional.scala 39:67:@791.14]
  wire  _GEN_43; // @[Conditional.scala 39:67:@791.14]
  wire [31:0] _GEN_45; // @[Conditional.scala 39:67:@742.12]
  wire [5:0] _GEN_46; // @[Conditional.scala 39:67:@742.12]
  wire [2:0] _GEN_47; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_48; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_49; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_50; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_51; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_52; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_53; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_54; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_55; // @[Conditional.scala 39:67:@742.12]
  wire [4:0] _GEN_56; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_57; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_58; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_59; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_60; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_61; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_62; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_63; // @[Conditional.scala 39:67:@742.12]
  wire  _GEN_64; // @[Conditional.scala 39:67:@742.12]
  wire [31:0] _GEN_66; // @[Conditional.scala 39:67:@702.10]
  wire [2:0] _GEN_67; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_68; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_69; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_70; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_71; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_72; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_73; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_74; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_75; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_76; // @[Conditional.scala 39:67:@702.10]
  wire [5:0] _GEN_77; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_78; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_79; // @[Conditional.scala 39:67:@702.10]
  wire [4:0] _GEN_80; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_81; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_82; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_83; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_84; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_85; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_86; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_87; // @[Conditional.scala 39:67:@702.10]
  wire  _GEN_88; // @[Conditional.scala 39:67:@702.10]
  wire [31:0] _GEN_90; // @[Conditional.scala 39:67:@659.8]
  wire [2:0] _GEN_91; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_92; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_93; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_94; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_95; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_96; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_97; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_98; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_99; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_100; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_101; // @[Conditional.scala 39:67:@659.8]
  wire [5:0] _GEN_102; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_103; // @[Conditional.scala 39:67:@659.8]
  wire [4:0] _GEN_104; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_105; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_106; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_107; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_108; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_109; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_110; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_111; // @[Conditional.scala 39:67:@659.8]
  wire  _GEN_112; // @[Conditional.scala 39:67:@659.8]
  wire [31:0] _GEN_114; // @[Conditional.scala 39:67:@626.6]
  wire [2:0] _GEN_115; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_116; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_117; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_118; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_119; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_120; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_121; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_122; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_123; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_124; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_125; // @[Conditional.scala 39:67:@626.6]
  wire [5:0] _GEN_126; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_127; // @[Conditional.scala 39:67:@626.6]
  wire [4:0] _GEN_128; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_129; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_130; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_131; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_132; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_133; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_134; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_135; // @[Conditional.scala 39:67:@626.6]
  wire  _GEN_136; // @[Conditional.scala 39:67:@626.6]
  wire [2:0] _GEN_137; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_138; // @[Conditional.scala 40:58:@575.4]
  wire [31:0] _GEN_139; // @[Conditional.scala 40:58:@575.4]
  wire [4:0] _GEN_140; // @[Conditional.scala 40:58:@575.4]
  wire [5:0] _GEN_141; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_142; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_144; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_145; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_146; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_147; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_148; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_149; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_150; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_151; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_152; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_153; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_154; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_155; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_156; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_157; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_158; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_159; // @[Conditional.scala 40:58:@575.4]
  wire  _GEN_160; // @[Conditional.scala 40:58:@575.4]
  QueueModule_i2c QueueModule_i2c ( // @[i2c.scala 84:20:@174.4]
    .clock(QueueModule_i2c_clock),
    .reset(QueueModule_i2c_reset),
    .io_i_ready(QueueModule_i2c_io_i_ready),
    .io_i_valid(QueueModule_i2c_io_i_valid),
    .io_i_bits(QueueModule_i2c_io_i_bits),
    .io_o_ready(QueueModule_i2c_io_o_ready),
    .io_o_valid(QueueModule_i2c_io_o_valid),
    .io_o_bits(QueueModule_i2c_io_o_bits)
  );
  QueueModule_i2c QueueModule_i2c_1 ( // @[i2c.scala 85:20:@177.4]
    .clock(QueueModule_i2c_1_clock),
    .reset(QueueModule_i2c_1_reset),
    .io_i_ready(QueueModule_i2c_1_io_i_ready),
    .io_i_valid(QueueModule_i2c_1_io_i_valid),
    .io_i_bits(QueueModule_i2c_1_io_i_bits),
    .io_o_ready(QueueModule_i2c_1_io_o_ready),
    .io_o_valid(QueueModule_i2c_1_io_o_valid),
    .io_o_bits(QueueModule_i2c_1_io_o_bits)
  );
  assign _T_65 = ~ io_PRESETn; // @[i2c.scala 45:28:@140.4]
  assign _T_169 = io_PSEL & io_PWRITE; // @[i2c.scala 88:29:@180.4]
  assign _T_170 = _T_169 & io_PENABLE; // @[i2c.scala 88:42:@181.4]
  assign _T_183 = io_PADDR == 8'h10; // @[i2c.scala 88:74:@183.4]
  assign _T_192 = io_PADDR == 8'h0; // @[i2c.scala 110:60:@202.4]
  assign _T_193 = _T_170 & _T_192; // @[i2c.scala 110:42:@203.4]
  assign _T_194 = io_PWDATA[0]; // @[i2c.scala 111:26:@205.6]
  assign _T_198 = _T_194 ? 1'h0 : 1'h1; // @[i2c.scala 112:20:@208.6]
  assign _T_200 = io_PWDATA[7]; // @[i2c.scala 113:46:@211.6]
  assign _T_201 = _T_194 | _T_200; // @[i2c.scala 113:34:@212.6]
  assign _T_202 = io_PWDATA[6:2]; // @[i2c.scala 113:59:@213.6]
  assign _T_204 = _T_201 ? _T_202 : 5'h0; // @[i2c.scala 113:20:@214.6]
  assign _T_206 = _T_85 == 3'h0; // @[i2c.scala 116:40:@220.6]
  assign _T_207 = _T_120 & _T_206; // @[i2c.scala 116:31:@221.6]
  assign _T_209 = _T_207 ? 1'h0 : _T_105; // @[i2c.scala 116:20:@222.6]
  assign _T_211 = _T_117 & _T_206; // @[i2c.scala 117:31:@225.6]
  assign _T_213 = _T_211 ? 1'h0 : _T_102; // @[i2c.scala 117:20:@226.6]
  assign _T_215 = _T_123 & _T_206; // @[i2c.scala 118:32:@229.6]
  assign _T_217 = _T_215 ? 1'h0 : _T_108; // @[i2c.scala 118:20:@230.6]
  assign _GEN_0 = _T_193 ? _T_194 : _T_209; // @[i2c.scala 110:86:@204.4]
  assign _GEN_1 = _T_193 ? _T_198 : _T_213; // @[i2c.scala 110:86:@204.4]
  assign _GEN_2 = _T_193 ? _T_204 : _T_111; // @[i2c.scala 110:86:@204.4]
  assign _GEN_3 = _T_193 ? _T_200 : _T_217; // @[i2c.scala 110:86:@204.4]
  assign _T_219 = io_PWRITE == 1'h0; // @[i2c.scala 120:18:@233.4]
  assign _T_220 = io_PSEL & _T_219; // @[i2c.scala 120:15:@234.4]
  assign _T_222 = io_PENABLE == 1'h0; // @[i2c.scala 120:32:@235.4]
  assign _T_223 = _T_220 & _T_222; // @[i2c.scala 120:29:@236.4]
  assign _T_225 = io_PADDR == 8'h4; // @[i2c.scala 120:62:@238.4]
  assign _T_226 = _T_223 & _T_225; // @[i2c.scala 120:44:@239.4]
  assign _T_228 = QueueModule_i2c_1_io_o_valid == 1'h0; // @[i2c.scala 121:26:@241.6]
  assign _T_230 = QueueModule_i2c_1_io_i_ready == 1'h0; // @[i2c.scala 121:45:@242.6]
  assign _T_232 = QueueModule_i2c_io_o_valid == 1'h0; // @[i2c.scala 121:68:@243.6]
  assign _T_234 = QueueModule_i2c_io_i_ready == 1'h0; // @[i2c.scala 121:87:@244.6]
  assign _T_235 = {_T_117,_T_120}; // @[Cat.scala 30:58:@245.6]
  assign _T_236 = {_T_232,_T_234}; // @[Cat.scala 30:58:@246.6]
  assign _T_237 = {_T_236,_T_235}; // @[Cat.scala 30:58:@247.6]
  assign _T_238 = {_T_230,_T_126}; // @[Cat.scala 30:58:@248.6]
  assign _T_239 = {_T_129,_T_228}; // @[Cat.scala 30:58:@249.6]
  assign _T_240 = {_T_239,_T_238}; // @[Cat.scala 30:58:@250.6]
  assign _T_241 = {_T_240,_T_237}; // @[Cat.scala 30:58:@251.6]
  assign _GEN_4 = _T_226 ? _T_241 : _T_168; // @[i2c.scala 120:88:@240.4]
  assign _T_249 = io_PADDR == 8'h8; // @[i2c.scala 123:62:@259.4]
  assign _T_250 = _T_223 & _T_249; // @[i2c.scala 123:44:@260.4]
  assign _T_252 = {_T_135,_T_138}; // @[Cat.scala 30:58:@262.6]
  assign _T_253 = {5'h0,_T_132}; // @[Cat.scala 30:58:@263.6]
  assign _T_254 = {_T_253,_T_252}; // @[Cat.scala 30:58:@264.6]
  assign _GEN_5 = _T_250 ? _T_254 : _GEN_4; // @[i2c.scala 123:89:@261.4]
  assign _T_258 = io_PADDR == 8'hc; // @[i2c.scala 126:60:@270.4]
  assign _T_259 = _T_170 & _T_258; // @[i2c.scala 126:42:@271.4]
  assign _T_261 = io_PWDATA[1]; // @[i2c.scala 128:25:@275.6]
  assign _T_262 = io_PWDATA[2]; // @[i2c.scala 129:25:@277.6]
  assign _GEN_6 = _T_259 ? _T_194 : _T_141; // @[i2c.scala 126:87:@272.4]
  assign _GEN_7 = _T_259 ? _T_261 : _T_144; // @[i2c.scala 126:87:@272.4]
  assign _GEN_8 = _T_259 ? _T_262 : _T_147; // @[i2c.scala 126:87:@272.4]
  assign _T_271 = _T_223 & _T_258; // @[i2c.scala 131:44:@286.4]
  assign _T_273 = {_T_144,_T_141}; // @[Cat.scala 30:58:@288.6]
  assign _T_274 = {5'h0,_T_147}; // @[Cat.scala 30:58:@289.6]
  assign _T_275 = {_T_274,_T_273}; // @[Cat.scala 30:58:@290.6]
  assign _GEN_9 = _T_271 ? _T_275 : _GEN_5; // @[i2c.scala 131:89:@287.4]
  assign _T_284 = _T_223 & _T_183; // @[i2c.scala 146:44:@299.4]
  assign _GEN_10 = _T_284 ? 8'h0 : _GEN_9; // @[i2c.scala 146:88:@300.4]
  assign _T_293 = io_PADDR == 8'h14; // @[i2c.scala 149:62:@308.4]
  assign _T_294 = _T_223 & _T_293; // @[i2c.scala 149:44:@309.4]
  assign _GEN_11 = _T_294 ? QueueModule_i2c_1_io_o_bits : _GEN_10; // @[i2c.scala 149:88:@310.4]
  assign _T_300 = io_PADDR == 8'h1c; // @[i2c.scala 155:60:@320.4]
  assign _T_301 = _T_170 & _T_300; // @[i2c.scala 155:42:@321.4]
  assign _GEN_13 = _T_301 ? io_PWDATA : _T_90; // @[i2c.scala 155:88:@322.4]
  assign _T_305 = io_PADDR == 8'h20; // @[i2c.scala 158:60:@328.4]
  assign _T_306 = _T_170 & _T_305; // @[i2c.scala 158:42:@329.4]
  assign _GEN_14 = _T_306 ? io_PWDATA : _T_93; // @[i2c.scala 158:88:@330.4]
  assign _T_310 = io_PADDR == 8'h2c; // @[i2c.scala 161:60:@336.4]
  assign _T_311 = _T_170 & _T_310; // @[i2c.scala 161:42:@337.4]
  assign _GEN_15 = _T_311 ? io_PWDATA : _T_96; // @[i2c.scala 161:89:@338.4]
  assign _T_315 = io_PADDR == 8'h30; // @[i2c.scala 164:60:@344.4]
  assign _T_316 = _T_170 & _T_315; // @[i2c.scala 164:42:@345.4]
  assign _GEN_16 = _T_316 ? io_PWDATA : _T_99; // @[i2c.scala 164:89:@346.4]
  assign _T_325 = _T_223 & _T_300; // @[i2c.scala 167:44:@355.4]
  assign _GEN_17 = _T_325 ? _T_90 : _GEN_11; // @[i2c.scala 167:90:@356.4]
  assign _T_334 = _T_223 & _T_305; // @[i2c.scala 170:44:@365.4]
  assign _GEN_18 = _T_334 ? _T_93 : _GEN_17; // @[i2c.scala 170:90:@366.4]
  assign _T_343 = _T_223 & _T_310; // @[i2c.scala 173:44:@375.4]
  assign _GEN_19 = _T_343 ? _T_96 : _GEN_18; // @[i2c.scala 173:91:@376.4]
  assign _T_352 = _T_223 & _T_315; // @[i2c.scala 176:44:@385.4]
  assign _GEN_20 = _T_352 ? _T_99 : _GEN_19; // @[i2c.scala 176:91:@386.4]
  assign _T_356 = io_PADDR == 8'h3c; // @[i2c.scala 179:60:@392.4]
  assign _T_357 = _T_170 & _T_356; // @[i2c.scala 179:42:@393.4]
  assign _T_359 = _T_165 & QueueModule_i2c_io_o_valid; // @[i2c.scala 183:33:@398.6]
  assign _GEN_21 = _T_357 ? 1'h1 : _T_359; // @[i2c.scala 179:91:@394.4]
  assign _T_364 = _T_120 == 1'h0; // @[i2c.scala 189:28:@402.4]
  assign _T_365 = _T_105 & _T_364; // @[i2c.scala 189:24:@403.4]
  assign _T_367 = _T_117 == 1'h0; // @[i2c.scala 190:28:@404.4]
  assign _T_368 = _T_102 & _T_367; // @[i2c.scala 190:24:@405.4]
  assign _T_370 = _T_123 == 1'h0; // @[i2c.scala 191:28:@406.4]
  assign _T_371 = _T_108 & _T_370; // @[i2c.scala 191:24:@407.4]
  assign _T_372 = _T_120 | _T_123; // @[i2c.scala 193:32:@408.4]
  assign _T_374 = _T_111 == 5'h0; // @[i2c.scala 193:59:@409.4]
  assign _T_375 = _T_372 & _T_374; // @[i2c.scala 193:47:@410.4]
  assign _T_380 = _T_372 & QueueModule_i2c_io_o_valid; // @[i2c.scala 195:45:@413.4]
  assign _T_384 = _T_372 & _T_232; // @[i2c.scala 196:45:@416.4]
  assign _T_386 = _T_375 == 1'h0; // @[i2c.scala 196:70:@417.4]
  assign _T_387 = _T_384 & _T_386; // @[i2c.scala 196:67:@418.4]
  assign _T_389 = _T_129 == 1'h0; // @[i2c.scala 196:77:@419.4]
  assign _T_390 = _T_387 & _T_389; // @[i2c.scala 196:74:@420.4]
  assign _T_391 = {_T_93,_T_90}; // @[Cat.scala 30:58:@421.4]
  assign chhp = {_T_99,_T_96}; // @[Cat.scala 30:58:@422.4]
  assign _T_393 = {16'h0,_T_391}; // @[Cat.scala 30:58:@423.4]
  assign _T_396 = _T_393 + _T_393; // @[i2c.scala 204:31:@425.4]
  assign _T_397 = _T_396[31:0]; // @[i2c.scala 204:31:@426.4]
  assign _T_399 = {24'h0,chhp}; // @[Cat.scala 30:58:@427.4]
  assign _GEN_161 = {{8'd0}, _T_397}; // @[i2c.scala 205:22:@428.4]
  assign _T_400 = _GEN_161 + _T_399; // @[i2c.scala 205:22:@428.4]
  assign _T_401 = _T_400[39:0]; // @[i2c.scala 205:22:@429.4]
  assign _T_404 = _T_397 + _T_393; // @[i2c.scala 206:21:@431.4]
  assign _T_405 = _T_404[31:0]; // @[i2c.scala 206:21:@432.4]
  assign _T_407 = {24'h0,_T_391}; // @[Cat.scala 30:58:@433.4]
  assign _T_410 = _T_407 + _T_399; // @[i2c.scala 207:36:@435.4]
  assign _T_411 = _T_410[39:0]; // @[i2c.scala 207:36:@436.4]
  assign _T_440 = QueueModule_i2c_io_o_bits[7]; // @[i2c.scala 230:28:@449.4]
  assign _T_444 = {_T_440,_T_440}; // @[Cat.scala 30:58:@453.4]
  assign _T_446 = {_T_444,_T_444}; // @[Cat.scala 30:58:@455.4]
  assign _T_447 = QueueModule_i2c_io_o_bits[6]; // @[i2c.scala 231:28:@456.4]
  assign _T_451 = {_T_447,_T_447}; // @[Cat.scala 30:58:@460.4]
  assign _T_453 = {_T_451,_T_451}; // @[Cat.scala 30:58:@462.4]
  assign _T_454 = QueueModule_i2c_io_o_bits[5]; // @[i2c.scala 232:28:@463.4]
  assign _T_458 = {_T_454,_T_454}; // @[Cat.scala 30:58:@467.4]
  assign _T_460 = {_T_458,_T_458}; // @[Cat.scala 30:58:@469.4]
  assign _T_461 = QueueModule_i2c_io_o_bits[4]; // @[i2c.scala 233:28:@470.4]
  assign _T_465 = {_T_461,_T_461}; // @[Cat.scala 30:58:@474.4]
  assign _T_467 = {_T_465,_T_465}; // @[Cat.scala 30:58:@476.4]
  assign _T_468 = QueueModule_i2c_io_o_bits[3]; // @[i2c.scala 234:28:@477.4]
  assign _T_472 = {_T_468,_T_468}; // @[Cat.scala 30:58:@481.4]
  assign _T_474 = {_T_472,_T_472}; // @[Cat.scala 30:58:@483.4]
  assign _T_475 = QueueModule_i2c_io_o_bits[2]; // @[i2c.scala 235:28:@484.4]
  assign _T_479 = {_T_475,_T_475}; // @[Cat.scala 30:58:@488.4]
  assign _T_481 = {_T_479,_T_479}; // @[Cat.scala 30:58:@490.4]
  assign _T_482 = QueueModule_i2c_io_o_bits[1]; // @[i2c.scala 236:28:@491.4]
  assign _T_486 = {_T_482,_T_482}; // @[Cat.scala 30:58:@495.4]
  assign _T_488 = {_T_486,_T_486}; // @[Cat.scala 30:58:@497.4]
  assign _T_489 = QueueModule_i2c_io_o_bits[0]; // @[i2c.scala 237:28:@498.4]
  assign _T_493 = {_T_489,_T_489}; // @[Cat.scala 30:58:@502.4]
  assign _T_495 = {_T_493,_T_493}; // @[Cat.scala 30:58:@504.4]
  assign _T_520 = {_T_516,_T_519}; // @[Cat.scala 30:58:@513.4]
  assign _T_521 = {_T_510,_T_513}; // @[Cat.scala 30:58:@514.4]
  assign _T_522 = {_T_521,_T_520}; // @[Cat.scala 30:58:@515.4]
  assign _T_523 = {_T_504,_T_507}; // @[Cat.scala 30:58:@516.4]
  assign _T_524 = {_T_498,_T_501}; // @[Cat.scala 30:58:@517.4]
  assign _T_525 = {_T_524,_T_523}; // @[Cat.scala 30:58:@518.4]
  assign _T_526 = {_T_525,_T_522}; // @[Cat.scala 30:58:@519.4]
  assign _T_533 = {_T_446,1'h0}; // @[Cat.scala 30:58:@524.4]
  assign _T_534 = {_T_467,_T_460}; // @[Cat.scala 30:58:@525.4]
  assign _T_535 = {_T_534,_T_453}; // @[Cat.scala 30:58:@526.4]
  assign _T_536 = {_T_535,_T_533}; // @[Cat.scala 30:58:@527.4]
  assign _T_537 = {_T_488,_T_481}; // @[Cat.scala 30:58:@528.4]
  assign _T_538 = {_T_537,_T_474}; // @[Cat.scala 30:58:@529.4]
  assign _T_540 = {5'hf,_T_495}; // @[Cat.scala 30:58:@531.4]
  assign _T_541 = {_T_540,_T_538}; // @[Cat.scala 30:58:@532.4]
  assign _T_542 = {_T_541,_T_536}; // @[Cat.scala 30:58:@533.4]
  assign _T_543 = _T_150 ? _T_542 : _T_420; // @[i2c.scala 246:21:@534.4]
  assign _T_564 = {_T_390,_T_368}; // @[Cat.scala 30:58:@554.4]
  assign _T_565 = {_T_365,_T_380}; // @[Cat.scala 30:58:@555.4]
  assign _T_566 = {_T_565,_T_564}; // @[Cat.scala 30:58:@556.4]
  assign _T_570 = QueueModule_i2c_io_i_ready & _T_141; // @[i2c.scala 265:29:@566.4]
  assign _T_571 = _T_570 & _T_144; // @[i2c.scala 265:36:@567.4]
  assign _T_572 = QueueModule_i2c_1_io_i_ready & _T_141; // @[i2c.scala 266:29:@569.4]
  assign _T_573 = _T_572 & _T_147; // @[i2c.scala 266:36:@570.4]
  assign _T_575 = 3'h0 == _T_85; // @[Conditional.scala 37:30:@574.4]
  assign _T_592 = 4'hf == _T_566; // @[Mux.scala 46:19:@580.8]
  assign _T_593 = _T_592 ? 3'h1 : 3'h0; // @[Mux.scala 46:16:@581.8]
  assign _T_594 = 4'he == _T_566; // @[Mux.scala 46:19:@582.8]
  assign _T_595 = _T_594 ? 3'h1 : _T_593; // @[Mux.scala 46:16:@583.8]
  assign _T_596 = 4'hd == _T_566; // @[Mux.scala 46:19:@584.8]
  assign _T_597 = _T_596 ? 3'h1 : _T_595; // @[Mux.scala 46:16:@585.8]
  assign _T_598 = 4'hc == _T_566; // @[Mux.scala 46:19:@586.8]
  assign _T_599 = _T_598 ? 3'h1 : _T_597; // @[Mux.scala 46:16:@587.8]
  assign _T_600 = 4'hb == _T_566; // @[Mux.scala 46:19:@588.8]
  assign _T_601 = _T_600 ? 3'h1 : _T_599; // @[Mux.scala 46:16:@589.8]
  assign _T_602 = 4'ha == _T_566; // @[Mux.scala 46:19:@590.8]
  assign _T_603 = _T_602 ? 3'h1 : _T_601; // @[Mux.scala 46:16:@591.8]
  assign _T_604 = 4'h9 == _T_566; // @[Mux.scala 46:19:@592.8]
  assign _T_605 = _T_604 ? 3'h1 : _T_603; // @[Mux.scala 46:16:@593.8]
  assign _T_606 = 4'h8 == _T_566; // @[Mux.scala 46:19:@594.8]
  assign _T_607 = _T_606 ? 3'h1 : _T_605; // @[Mux.scala 46:16:@595.8]
  assign _T_608 = 4'h7 == _T_566; // @[Mux.scala 46:19:@596.8]
  assign _T_609 = _T_608 ? 3'h3 : _T_607; // @[Mux.scala 46:16:@597.8]
  assign _T_610 = 4'h6 == _T_566; // @[Mux.scala 46:19:@598.8]
  assign _T_611 = _T_610 ? 3'h3 : _T_609; // @[Mux.scala 46:16:@599.8]
  assign _T_612 = 4'h5 == _T_566; // @[Mux.scala 46:19:@600.8]
  assign _T_613 = _T_612 ? 3'h3 : _T_611; // @[Mux.scala 46:16:@601.8]
  assign _T_614 = 4'h4 == _T_566; // @[Mux.scala 46:19:@602.8]
  assign _T_615 = _T_614 ? 3'h3 : _T_613; // @[Mux.scala 46:16:@603.8]
  assign _T_616 = 4'h3 == _T_566; // @[Mux.scala 46:19:@604.8]
  assign _T_617 = _T_616 ? 3'h4 : _T_615; // @[Mux.scala 46:16:@605.8]
  assign _T_618 = 4'h2 == _T_566; // @[Mux.scala 46:19:@606.8]
  assign _T_619 = _T_618 ? 3'h4 : _T_617; // @[Mux.scala 46:16:@607.8]
  assign _T_620 = 4'h1 == _T_566; // @[Mux.scala 46:19:@608.8]
  assign _T_621 = _T_620 ? 3'h5 : _T_619; // @[Mux.scala 46:16:@609.8]
  assign _T_622 = 4'h0 == _T_566; // @[Mux.scala 46:19:@610.8]
  assign _T_623 = _T_622 ? 3'h0 : _T_621; // @[Mux.scala 46:16:@611.8]
  assign _GEN_22 = _T_371 ? 3'h2 : _T_623; // @[i2c.scala 272:31:@576.6]
  assign _T_624 = _T_380 & QueueModule_i2c_io_o_valid; // @[i2c.scala 294:48:@614.6]
  assign _T_626 = _T_365 == 1'h0; // @[i2c.scala 294:72:@615.6]
  assign _T_627 = _T_624 & _T_626; // @[i2c.scala 294:69:@616.6]
  assign _T_634 = 3'h1 == _T_85; // @[Conditional.scala 37:30:@625.6]
  assign _T_635 = _T_414 == _T_397; // @[i2c.scala 302:49:@628.8]
  assign _T_638 = _T_414 + 32'h1; // @[i2c.scala 302:71:@629.8]
  assign _T_639 = _T_638[31:0]; // @[i2c.scala 302:71:@630.8]
  assign _T_640 = _T_635 ? 32'h1 : _T_639; // @[i2c.scala 302:39:@631.8]
  assign _T_642 = _T_635 ? 3'h0 : 3'h1; // @[i2c.scala 303:31:@634.8]
  assign _GEN_162 = {{16'd0}, _T_391}; // @[i2c.scala 304:49:@636.8]
  assign _T_643 = _T_414 == _GEN_162; // @[i2c.scala 304:49:@636.8]
  assign _T_645 = _T_643 ? 1'h0 : _T_68; // @[i2c.scala 304:39:@637.8]
  assign _T_649 = _T_635 ? 1'h0 : _T_74; // @[i2c.scala 306:39:@641.8]
  assign _T_652 = _T_397 - 32'h2; // @[i2c.scala 308:58:@644.8]
  assign _T_653 = $unsigned(_T_652); // @[i2c.scala 308:58:@645.8]
  assign _T_654 = _T_653[31:0]; // @[i2c.scala 308:58:@646.8]
  assign _T_655 = _T_414 == _T_654; // @[i2c.scala 308:49:@647.8]
  assign _T_657 = _T_655 ? 1'h1 : _T_120; // @[i2c.scala 308:39:@648.8]
  assign _T_664 = 3'h2 == _T_85; // @[Conditional.scala 37:30:@658.8]
  assign _T_665 = _T_414 == _T_405; // @[i2c.scala 318:49:@661.10]
  assign _T_670 = _T_665 ? 32'h1 : _T_639; // @[i2c.scala 318:39:@664.10]
  assign _T_672 = _T_665 ? 3'h0 : 3'h2; // @[i2c.scala 319:39:@667.10]
  assign _T_674 = _T_391 - 16'h1; // @[i2c.scala 320:58:@669.10]
  assign _T_675 = $unsigned(_T_674); // @[i2c.scala 320:58:@670.10]
  assign _T_676 = _T_675[15:0]; // @[i2c.scala 320:58:@671.10]
  assign _GEN_163 = {{16'd0}, _T_676}; // @[i2c.scala 320:51:@672.10]
  assign _T_677 = _T_414 > _GEN_163; // @[i2c.scala 320:51:@672.10]
  assign _T_679 = _T_397 - 32'h1; // @[i2c.scala 320:87:@673.10]
  assign _T_680 = $unsigned(_T_679); // @[i2c.scala 320:87:@674.10]
  assign _T_681 = _T_680[31:0]; // @[i2c.scala 320:87:@675.10]
  assign _T_682 = _T_414 < _T_681; // @[i2c.scala 320:79:@676.10]
  assign _T_683 = _T_677 & _T_682; // @[i2c.scala 320:66:@677.10]
  assign _T_689 = _T_411 - 40'h1; // @[i2c.scala 322:63:@681.10]
  assign _T_690 = $unsigned(_T_689); // @[i2c.scala 322:63:@682.10]
  assign _T_691 = _T_690[39:0]; // @[i2c.scala 322:63:@683.10]
  assign _GEN_164 = {{8'd0}, _T_414}; // @[i2c.scala 322:50:@684.10]
  assign _T_692 = _GEN_164 > _T_691; // @[i2c.scala 322:50:@684.10]
  assign _T_693 = _GEN_164 < _T_401; // @[i2c.scala 322:84:@685.10]
  assign _T_694 = _T_692 & _T_693; // @[i2c.scala 322:71:@686.10]
  assign _T_709 = 3'h5 == _T_85; // @[Conditional.scala 37:30:@701.10]
  assign _T_719 = _T_665 & _T_232; // @[i2c.scala 335:64:@711.12]
  assign _T_720 = _T_719 ? 3'h0 : 3'h5; // @[i2c.scala 335:39:@712.12]
  assign _T_721 = _T_414 > _GEN_162; // @[i2c.scala 336:50:@714.12]
  assign _T_729 = _T_414 > _T_397; // @[i2c.scala 338:49:@720.12]
  assign _T_739 = _T_405 - 32'h2; // @[i2c.scala 341:64:@727.12]
  assign _T_740 = $unsigned(_T_739); // @[i2c.scala 341:64:@728.12]
  assign _T_741 = _T_740[31:0]; // @[i2c.scala 341:64:@729.12]
  assign _T_742 = _T_414 == _T_741; // @[i2c.scala 341:51:@730.12]
  assign _T_744 = _T_742 ? 1'h1 : _T_117; // @[i2c.scala 341:40:@731.12]
  assign _T_751 = QueueModule_i2c_io_o_valid; // @[i2c.scala 347:39:@737.12]
  assign _T_752 = 3'h3 == _T_85; // @[Conditional.scala 37:30:@741.12]
  assign _GEN_167 = {{16'd0}, chhp}; // @[i2c.scala 352:50:@744.14]
  assign _T_753 = _T_414 == _GEN_167; // @[i2c.scala 352:50:@744.14]
  assign _T_758 = _T_753 ? 32'h1 : _T_639; // @[i2c.scala 352:39:@747.14]
  assign _T_761 = _T_417 == 6'h25; // @[i2c.scala 353:70:@750.14]
  assign _T_764 = _T_417 + 6'h1; // @[i2c.scala 353:90:@751.14]
  assign _T_765 = _T_764[5:0]; // @[i2c.scala 353:90:@752.14]
  assign _T_766 = _T_761 ? 6'h2 : _T_765; // @[i2c.scala 353:62:@753.14]
  assign _T_767 = _T_753 ? _T_766 : _T_417; // @[i2c.scala 353:39:@754.14]
  assign _T_770 = _T_417 == 6'h24; // @[i2c.scala 354:72:@757.14]
  assign _T_771 = _T_753 & _T_770; // @[i2c.scala 354:61:@758.14]
  assign _T_774 = _T_232 ? 3'h0 : 3'h3; // @[i2c.scala 354:100:@760.14]
  assign _T_775 = _T_138 ? 3'h5 : _T_774; // @[i2c.scala 354:85:@761.14]
  assign _T_776 = _T_771 ? _T_775 : 3'h3; // @[i2c.scala 354:39:@762.14]
  assign _T_777 = _T_420 >> _T_417; // @[i2c.scala 355:44:@764.14]
  assign _T_778 = _T_777[0]; // @[i2c.scala 355:44:@765.14]
  assign _T_779 = 38'h1e00000000 >> _T_417; // @[i2c.scala 356:44:@767.14]
  assign _T_780 = _T_779[0]; // @[i2c.scala 356:44:@768.14]
  assign _T_781 = 38'hccccccccc >> _T_417; // @[i2c.scala 357:41:@770.14]
  assign _T_782 = _T_781[0]; // @[i2c.scala 357:41:@771.14]
  assign _T_788 = _T_771 & QueueModule_i2c_io_o_valid; // @[i2c.scala 359:81:@777.14]
  assign _T_794 = _T_417 == 6'h23; // @[i2c.scala 360:71:@781.14]
  assign _T_795 = _T_753 & _T_794; // @[i2c.scala 360:60:@782.14]
  assign _T_796 = _T_795 & io_sda_i; // @[i2c.scala 360:81:@783.14]
  assign _T_798 = _T_796 ? 1'h1 : _T_138; // @[i2c.scala 360:39:@784.14]
  assign _T_801 = 3'h4 == _T_85; // @[Conditional.scala 37:30:@790.14]
  assign _T_815 = _T_761 ? 6'h1 : _T_765; // @[i2c.scala 368:62:@802.16]
  assign _T_816 = _T_753 ? _T_815 : _T_417; // @[i2c.scala 368:39:@803.16]
  assign _T_820 = _T_753 & _T_761; // @[i2c.scala 369:59:@807.16]
  assign _T_822 = _T_114 == 5'h0; // @[i2c.scala 369:93:@808.16]
  assign _T_823 = _T_820 & _T_822; // @[i2c.scala 369:80:@809.16]
  assign _T_824 = _T_823 ? 3'h5 : 3'h4; // @[i2c.scala 369:38:@810.16]
  assign _T_832 = _T_114 - 5'h1; // @[i2c.scala 370:122:@816.16]
  assign _T_833 = $unsigned(_T_832); // @[i2c.scala 370:122:@817.16]
  assign _T_834 = _T_833[4:0]; // @[i2c.scala 370:122:@818.16]
  assign _T_835 = _T_822 ? _T_114 : _T_834; // @[i2c.scala 370:84:@819.16]
  assign _T_836 = _T_771 ? _T_835 : _T_114; // @[i2c.scala 370:39:@820.16]
  assign _T_840 = _T_114 == 5'h1; // @[i2c.scala 373:50:@824.16]
  assign _T_841 = 38'h3ffffffffe >> _T_417; // @[i2c.scala 373:68:@825.16]
  assign _T_842 = _T_841[0]; // @[i2c.scala 373:68:@826.16]
  assign _T_843 = 38'h1fffffffe >> _T_417; // @[i2c.scala 373:86:@827.16]
  assign _T_844 = _T_843[0]; // @[i2c.scala 373:86:@828.16]
  assign _T_845 = _T_840 ? _T_842 : _T_844; // @[i2c.scala 373:39:@829.16]
  assign _T_869 = _T_417 == 6'h1f; // @[i2c.scala 379:46:@850.16]
  assign _T_870 = _T_869 ? io_sda_i : _T_519; // @[i2c.scala 379:38:@851.16]
  assign _T_872 = _T_417 == 6'h1b; // @[i2c.scala 380:46:@853.16]
  assign _T_873 = _T_872 ? io_sda_i : _T_516; // @[i2c.scala 380:38:@854.16]
  assign _T_875 = _T_417 == 6'h17; // @[i2c.scala 381:46:@856.16]
  assign _T_876 = _T_875 ? io_sda_i : _T_513; // @[i2c.scala 381:38:@857.16]
  assign _T_878 = _T_417 == 6'h13; // @[i2c.scala 382:46:@859.16]
  assign _T_879 = _T_878 ? io_sda_i : _T_510; // @[i2c.scala 382:38:@860.16]
  assign _T_881 = _T_417 == 6'hf; // @[i2c.scala 383:46:@862.16]
  assign _T_882 = _T_881 ? io_sda_i : _T_507; // @[i2c.scala 383:38:@863.16]
  assign _T_884 = _T_417 == 6'hb; // @[i2c.scala 384:46:@865.16]
  assign _T_885 = _T_884 ? io_sda_i : _T_504; // @[i2c.scala 384:38:@866.16]
  assign _T_887 = _T_417 == 6'h7; // @[i2c.scala 385:46:@868.16]
  assign _T_888 = _T_887 ? io_sda_i : _T_501; // @[i2c.scala 385:38:@869.16]
  assign _T_890 = _T_417 == 6'h3; // @[i2c.scala 386:46:@871.16]
  assign _T_891 = _T_890 ? io_sda_i : _T_498; // @[i2c.scala 386:38:@872.16]
  assign _GEN_24 = _T_801 ? _T_758 : _T_414; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_25 = _T_801 ? _T_816 : _T_417; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_26 = _T_801 ? _T_824 : _T_85; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_27 = _T_801 ? _T_836 : _T_114; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_28 = _T_801 ? 1'h0 : _T_138; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_29 = _T_801 ? 1'h0 : _T_150; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_30 = _T_801 ? _T_845 : _T_68; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_31 = _T_801 ? _T_844 : _T_71; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_32 = _T_801 ? _T_782 : _T_74; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_33 = _T_801 ? 1'h0 : _T_77; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_34 = _T_801 ? _T_823 : _T_129; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_35 = _T_801 ? _T_820 : _T_159; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_36 = _T_801 ? _T_870 : _T_519; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_37 = _T_801 ? _T_873 : _T_516; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_38 = _T_801 ? _T_876 : _T_513; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_39 = _T_801 ? _T_879 : _T_510; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_40 = _T_801 ? _T_882 : _T_507; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_41 = _T_801 ? _T_885 : _T_504; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_42 = _T_801 ? _T_888 : _T_501; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_43 = _T_801 ? _T_891 : _T_498; // @[Conditional.scala 39:67:@791.14]
  assign _GEN_45 = _T_752 ? _T_758 : _GEN_24; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_46 = _T_752 ? _T_767 : _GEN_25; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_47 = _T_752 ? _T_776 : _GEN_26; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_48 = _T_752 ? _T_778 : _GEN_30; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_49 = _T_752 ? _T_780 : _GEN_31; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_50 = _T_752 ? _T_782 : _GEN_32; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_51 = _T_752 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_52 = _T_752 ? _T_788 : _GEN_29; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_53 = _T_752 ? _T_798 : _GEN_28; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_54 = _T_752 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_55 = _T_752 ? 1'h0 : _GEN_35; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_56 = _T_752 ? _T_114 : _GEN_27; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_57 = _T_752 ? _T_519 : _GEN_36; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_58 = _T_752 ? _T_516 : _GEN_37; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_59 = _T_752 ? _T_513 : _GEN_38; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_60 = _T_752 ? _T_510 : _GEN_39; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_61 = _T_752 ? _T_507 : _GEN_40; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_62 = _T_752 ? _T_504 : _GEN_41; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_63 = _T_752 ? _T_501 : _GEN_42; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_64 = _T_752 ? _T_498 : _GEN_43; // @[Conditional.scala 39:67:@742.12]
  assign _GEN_66 = _T_709 ? _T_670 : _GEN_45; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_67 = _T_709 ? _T_720 : _GEN_47; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_68 = _T_709 ? _T_721 : _GEN_50; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_69 = _T_709 ? _T_665 : _GEN_51; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_70 = _T_709 ? _T_729 : _GEN_48; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_71 = _T_709 ? _T_665 : _GEN_49; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_72 = _T_709 ? 1'h0 : _T_120; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_73 = _T_709 ? _T_744 : _T_117; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_74 = _T_709 ? 1'h0 : _T_123; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_75 = _T_709 ? _T_751 : _GEN_52; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_76 = _T_709 ? 1'h0 : _GEN_55; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_77 = _T_709 ? 6'h0 : _GEN_46; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_78 = _T_709 ? _T_138 : _GEN_53; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_79 = _T_709 ? _T_129 : _GEN_54; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_80 = _T_709 ? _T_114 : _GEN_56; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_81 = _T_709 ? _T_519 : _GEN_57; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_82 = _T_709 ? _T_516 : _GEN_58; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_83 = _T_709 ? _T_513 : _GEN_59; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_84 = _T_709 ? _T_510 : _GEN_60; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_85 = _T_709 ? _T_507 : _GEN_61; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_86 = _T_709 ? _T_504 : _GEN_62; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_87 = _T_709 ? _T_501 : _GEN_63; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_88 = _T_709 ? _T_498 : _GEN_64; // @[Conditional.scala 39:67:@702.10]
  assign _GEN_90 = _T_664 ? _T_670 : _GEN_66; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_91 = _T_664 ? _T_672 : _GEN_67; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_92 = _T_664 ? _T_683 : _GEN_70; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_93 = _T_664 ? 1'h0 : _GEN_71; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_94 = _T_664 ? _T_694 : _GEN_68; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_95 = _T_664 ? 1'h0 : _GEN_69; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_96 = _T_664 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_97 = _T_664 ? 1'h0 : _GEN_73; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_98 = _T_664 ? _T_665 : _GEN_74; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_99 = _T_664 ? 1'h0 : _GEN_78; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_100 = _T_664 ? 1'h0 : _GEN_75; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_101 = _T_664 ? 1'h0 : _GEN_76; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_102 = _T_664 ? 6'h0 : _GEN_77; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_103 = _T_664 ? _T_129 : _GEN_79; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_104 = _T_664 ? _T_114 : _GEN_80; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_105 = _T_664 ? _T_519 : _GEN_81; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_106 = _T_664 ? _T_516 : _GEN_82; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_107 = _T_664 ? _T_513 : _GEN_83; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_108 = _T_664 ? _T_510 : _GEN_84; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_109 = _T_664 ? _T_507 : _GEN_85; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_110 = _T_664 ? _T_504 : _GEN_86; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_111 = _T_664 ? _T_501 : _GEN_87; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_112 = _T_664 ? _T_498 : _GEN_88; // @[Conditional.scala 39:67:@659.8]
  assign _GEN_114 = _T_634 ? _T_640 : _GEN_90; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_115 = _T_634 ? _T_642 : _GEN_91; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_116 = _T_634 ? _T_645 : _GEN_92; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_117 = _T_634 ? 1'h0 : _GEN_93; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_118 = _T_634 ? _T_649 : _GEN_94; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_119 = _T_634 ? 1'h0 : _GEN_95; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_120 = _T_634 ? _T_657 : _GEN_96; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_121 = _T_634 ? 1'h0 : _GEN_97; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_122 = _T_634 ? 1'h0 : _GEN_98; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_123 = _T_634 ? 1'h0 : _GEN_99; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_124 = _T_634 ? 1'h0 : _GEN_100; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_125 = _T_634 ? 1'h0 : _GEN_101; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_126 = _T_634 ? 6'h0 : _GEN_102; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_127 = _T_634 ? _T_129 : _GEN_103; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_128 = _T_634 ? _T_114 : _GEN_104; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_129 = _T_634 ? _T_519 : _GEN_105; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_130 = _T_634 ? _T_516 : _GEN_106; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_131 = _T_634 ? _T_513 : _GEN_107; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_132 = _T_634 ? _T_510 : _GEN_108; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_133 = _T_634 ? _T_507 : _GEN_109; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_134 = _T_634 ? _T_504 : _GEN_110; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_135 = _T_634 ? _T_501 : _GEN_111; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_136 = _T_634 ? _T_498 : _GEN_112; // @[Conditional.scala 39:67:@626.6]
  assign _GEN_137 = _T_575 ? _GEN_22 : _GEN_115; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_138 = _T_575 ? _T_627 : _GEN_124; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_139 = _T_575 ? 32'h1 : _GEN_114; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_140 = _T_575 ? _T_111 : _GEN_128; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_141 = _T_575 ? 6'h0 : _GEN_126; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_142 = _T_575 ? 1'h0 : _GEN_125; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_144 = _T_575 ? _T_68 : _GEN_116; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_145 = _T_575 ? _T_71 : _GEN_117; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_146 = _T_575 ? _T_74 : _GEN_118; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_147 = _T_575 ? _T_77 : _GEN_119; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_148 = _T_575 ? _T_120 : _GEN_120; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_149 = _T_575 ? _T_117 : _GEN_121; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_150 = _T_575 ? _T_123 : _GEN_122; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_151 = _T_575 ? _T_138 : _GEN_123; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_152 = _T_575 ? _T_129 : _GEN_127; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_153 = _T_575 ? _T_519 : _GEN_129; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_154 = _T_575 ? _T_516 : _GEN_130; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_155 = _T_575 ? _T_513 : _GEN_131; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_156 = _T_575 ? _T_510 : _GEN_132; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_157 = _T_575 ? _T_507 : _GEN_133; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_158 = _T_575 ? _T_504 : _GEN_134; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_159 = _T_575 ? _T_501 : _GEN_135; // @[Conditional.scala 40:58:@575.4]
  assign _GEN_160 = _T_575 ? _T_498 : _GEN_136; // @[Conditional.scala 40:58:@575.4]
  assign io_PREADY = 1'h0; // @[i2c.scala 42:12:@138.4]
  assign io_PRDATA = _T_168; // @[i2c.scala 100:11:@193.4]
  assign io_PSLVERR = 1'h0; // @[i2c.scala 43:12:@139.4]
  assign io_irq = _T_135 | _T_132; // @[i2c.scala 268:11:@573.4]
  assign io_sda_t = _T_71; // @[i2c.scala 103:10:@195.4]
  assign io_sda_o = _T_68; // @[i2c.scala 104:10:@196.4]
  assign io_scl_t = _T_77; // @[i2c.scala 106:10:@198.4]
  assign io_scl_o = _T_74; // @[i2c.scala 105:10:@197.4]
  assign io_doOpcodeio = _T_569; // @[i2c.scala 255:15:@559.4]
  assign io_iiccount = _T_414[15:0]; // @[i2c.scala 221:13:@440.4]
  assign io_txbitc = _T_417; // @[i2c.scala 220:11:@439.4]
  assign io_readl = _T_114; // @[i2c.scala 101:10:@194.4]
  assign io_txcio = _T_126; // @[i2c.scala 257:20:@560.4]
  assign io_rxcio = _T_129; // @[i2c.scala 258:20:@561.4]
  assign io_startsentio = _T_120; // @[i2c.scala 259:20:@562.4]
  assign io_stopsentio = _T_117; // @[i2c.scala 260:20:@563.4]
  assign io_rstartsentio = _T_123; // @[i2c.scala 261:20:@564.4]
  assign io_nackio = _T_138; // @[i2c.scala 262:20:@565.4]
  assign QueueModule_i2c_clock = io_PCLK; // @[:@175.4]
  assign QueueModule_i2c_reset = ~ io_PRESETn; // @[:@176.4]
  assign QueueModule_i2c_io_i_valid = _T_170 & _T_183; // @[i2c.scala 92:19:@186.4]
  assign QueueModule_i2c_io_i_bits = io_PWDATA; // @[i2c.scala 93:19:@187.4]
  assign QueueModule_i2c_io_o_ready = _T_150 | _T_165; // @[i2c.scala 94:19:@189.4]
  assign QueueModule_i2c_1_clock = io_PCLK; // @[:@178.4]
  assign QueueModule_i2c_1_reset = ~ io_PRESETn; // @[:@179.4]
  assign QueueModule_i2c_1_io_i_valid = _T_159; // @[i2c.scala 96:19:@190.4]
  assign QueueModule_i2c_1_io_i_bits = _T_156; // @[i2c.scala 97:19:@191.4]
  assign QueueModule_i2c_1_io_o_ready = _T_162; // @[i2c.scala 98:19:@192.4]
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
  _T_68 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_71 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_74 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_77 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_85 = _RAND_4[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_90 = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_93 = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_96 = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_99 = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_102 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_105 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_108 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_111 = _RAND_12[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_114 = _RAND_13[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_117 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_120 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_123 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_126 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_129 = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_132 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_135 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_138 = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_141 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_144 = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_147 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_150 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_156 = _RAND_26[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_159 = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_162 = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_165 = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_168 = _RAND_30[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  _T_414 = _RAND_31[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  _T_417 = _RAND_32[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {2{`RANDOM}};
  _T_420 = _RAND_33[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  _T_498 = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  _T_501 = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  _T_504 = _RAND_36[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  _T_507 = _RAND_37[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  _T_510 = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  _T_513 = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  _T_516 = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  _T_519 = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  _T_569 = _RAND_42[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge io_PCLK) begin
    if (_T_65) begin
      _T_68 <= 1'h1;
    end else begin
      if (!(_T_575)) begin
        if (_T_634) begin
          if (_T_643) begin
            _T_68 <= 1'h0;
          end
        end else begin
          if (_T_664) begin
            _T_68 <= _T_683;
          end else begin
            if (_T_709) begin
              _T_68 <= _T_729;
            end else begin
              if (_T_752) begin
                _T_68 <= _T_778;
              end else begin
                if (_T_801) begin
                  if (_T_840) begin
                    _T_68 <= _T_842;
                  end else begin
                    _T_68 <= _T_844;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_71 <= 1'h1;
    end else begin
      if (!(_T_575)) begin
        if (_T_634) begin
          _T_71 <= 1'h0;
        end else begin
          if (_T_664) begin
            _T_71 <= 1'h0;
          end else begin
            if (_T_709) begin
              _T_71 <= _T_665;
            end else begin
              if (_T_752) begin
                _T_71 <= _T_780;
              end else begin
                if (_T_801) begin
                  _T_71 <= _T_844;
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_74 <= 1'h1;
    end else begin
      if (!(_T_575)) begin
        if (_T_634) begin
          if (_T_635) begin
            _T_74 <= 1'h0;
          end
        end else begin
          if (_T_664) begin
            _T_74 <= _T_694;
          end else begin
            if (_T_709) begin
              _T_74 <= _T_721;
            end else begin
              if (_T_752) begin
                _T_74 <= _T_782;
              end else begin
                if (_T_801) begin
                  _T_74 <= _T_782;
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_77 <= 1'h1;
    end else begin
      if (!(_T_575)) begin
        if (_T_634) begin
          _T_77 <= 1'h0;
        end else begin
          if (_T_664) begin
            _T_77 <= 1'h0;
          end else begin
            if (_T_709) begin
              _T_77 <= _T_665;
            end else begin
              if (_T_752) begin
                _T_77 <= 1'h0;
              end else begin
                if (_T_801) begin
                  _T_77 <= 1'h0;
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_85 <= 3'h0;
    end else begin
      if (_T_575) begin
        if (_T_371) begin
          _T_85 <= 3'h2;
        end else begin
          if (_T_622) begin
            _T_85 <= 3'h0;
          end else begin
            if (_T_620) begin
              _T_85 <= 3'h5;
            end else begin
              if (_T_618) begin
                _T_85 <= 3'h4;
              end else begin
                if (_T_616) begin
                  _T_85 <= 3'h4;
                end else begin
                  if (_T_614) begin
                    _T_85 <= 3'h3;
                  end else begin
                    if (_T_612) begin
                      _T_85 <= 3'h3;
                    end else begin
                      if (_T_610) begin
                        _T_85 <= 3'h3;
                      end else begin
                        if (_T_608) begin
                          _T_85 <= 3'h3;
                        end else begin
                          if (_T_606) begin
                            _T_85 <= 3'h1;
                          end else begin
                            if (_T_604) begin
                              _T_85 <= 3'h1;
                            end else begin
                              if (_T_602) begin
                                _T_85 <= 3'h1;
                              end else begin
                                if (_T_600) begin
                                  _T_85 <= 3'h1;
                                end else begin
                                  if (_T_598) begin
                                    _T_85 <= 3'h1;
                                  end else begin
                                    if (_T_596) begin
                                      _T_85 <= 3'h1;
                                    end else begin
                                      if (_T_594) begin
                                        _T_85 <= 3'h1;
                                      end else begin
                                        if (_T_592) begin
                                          _T_85 <= 3'h1;
                                        end else begin
                                          _T_85 <= 3'h0;
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
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (_T_634) begin
          if (_T_635) begin
            _T_85 <= 3'h0;
          end else begin
            _T_85 <= 3'h1;
          end
        end else begin
          if (_T_664) begin
            if (_T_665) begin
              _T_85 <= 3'h0;
            end else begin
              _T_85 <= 3'h2;
            end
          end else begin
            if (_T_709) begin
              if (_T_719) begin
                _T_85 <= 3'h0;
              end else begin
                _T_85 <= 3'h5;
              end
            end else begin
              if (_T_752) begin
                if (_T_771) begin
                  if (_T_138) begin
                    _T_85 <= 3'h5;
                  end else begin
                    if (_T_232) begin
                      _T_85 <= 3'h0;
                    end else begin
                      _T_85 <= 3'h3;
                    end
                  end
                end else begin
                  _T_85 <= 3'h3;
                end
              end else begin
                if (_T_801) begin
                  if (_T_823) begin
                    _T_85 <= 3'h5;
                  end else begin
                    _T_85 <= 3'h4;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_90 <= 8'hf0;
    end else begin
      if (_T_301) begin
        _T_90 <= io_PWDATA;
      end
    end
    if (_T_65) begin
      _T_93 <= 8'h0;
    end else begin
      if (_T_306) begin
        _T_93 <= io_PWDATA;
      end
    end
    if (_T_65) begin
      _T_96 <= 8'h78;
    end else begin
      if (_T_311) begin
        _T_96 <= io_PWDATA;
      end
    end
    if (_T_65) begin
      _T_99 <= 8'h0;
    end else begin
      if (_T_316) begin
        _T_99 <= io_PWDATA;
      end
    end
    if (_T_65) begin
      _T_102 <= 1'h0;
    end else begin
      if (_T_193) begin
        if (_T_194) begin
          _T_102 <= 1'h0;
        end else begin
          _T_102 <= 1'h1;
        end
      end else begin
        if (_T_211) begin
          _T_102 <= 1'h0;
        end
      end
    end
    if (_T_65) begin
      _T_105 <= 1'h0;
    end else begin
      if (_T_193) begin
        _T_105 <= _T_194;
      end else begin
        if (_T_207) begin
          _T_105 <= 1'h0;
        end
      end
    end
    if (_T_65) begin
      _T_108 <= 1'h0;
    end else begin
      if (_T_193) begin
        _T_108 <= _T_200;
      end else begin
        if (_T_215) begin
          _T_108 <= 1'h0;
        end
      end
    end
    if (_T_65) begin
      _T_111 <= 5'h0;
    end else begin
      if (_T_193) begin
        if (_T_201) begin
          _T_111 <= _T_202;
        end else begin
          _T_111 <= 5'h0;
        end
      end
    end
    if (_T_65) begin
      _T_114 <= 5'h0;
    end else begin
      if (_T_575) begin
        _T_114 <= _T_111;
      end else begin
        if (!(_T_634)) begin
          if (!(_T_664)) begin
            if (!(_T_709)) begin
              if (!(_T_752)) begin
                if (_T_801) begin
                  if (_T_771) begin
                    if (!(_T_822)) begin
                      _T_114 <= _T_834;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_117 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (_T_634) begin
          _T_117 <= 1'h0;
        end else begin
          if (_T_664) begin
            _T_117 <= 1'h0;
          end else begin
            if (_T_709) begin
              if (_T_742) begin
                _T_117 <= 1'h1;
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_120 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (_T_634) begin
          if (_T_655) begin
            _T_120 <= 1'h1;
          end
        end else begin
          if (_T_664) begin
            _T_120 <= 1'h0;
          end else begin
            if (_T_709) begin
              _T_120 <= 1'h0;
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_123 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (_T_634) begin
          _T_123 <= 1'h0;
        end else begin
          if (_T_664) begin
            _T_123 <= _T_665;
          end else begin
            if (_T_709) begin
              _T_123 <= 1'h0;
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_126 <= 1'h1;
    end else begin
      _T_126 <= _T_206;
    end
    if (_T_65) begin
      _T_129 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (!(_T_634)) begin
          if (!(_T_664)) begin
            if (!(_T_709)) begin
              if (_T_752) begin
                _T_129 <= 1'h0;
              end else begin
                if (_T_801) begin
                  _T_129 <= _T_823;
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_132 <= 1'h0;
    end else begin
      _T_132 <= _T_573;
    end
    if (_T_65) begin
      _T_135 <= 1'h0;
    end else begin
      _T_135 <= _T_571;
    end
    if (_T_65) begin
      _T_138 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (_T_634) begin
          _T_138 <= 1'h0;
        end else begin
          if (_T_664) begin
            _T_138 <= 1'h0;
          end else begin
            if (!(_T_709)) begin
              if (_T_752) begin
                if (_T_796) begin
                  _T_138 <= 1'h1;
                end
              end else begin
                if (_T_801) begin
                  _T_138 <= 1'h0;
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_141 <= 1'h0;
    end else begin
      if (_T_259) begin
        _T_141 <= _T_194;
      end
    end
    if (_T_65) begin
      _T_144 <= 1'h0;
    end else begin
      if (_T_259) begin
        _T_144 <= _T_261;
      end
    end
    if (_T_65) begin
      _T_147 <= 1'h0;
    end else begin
      if (_T_259) begin
        _T_147 <= _T_262;
      end
    end
    if (_T_65) begin
      _T_150 <= 1'h0;
    end else begin
      if (_T_575) begin
        _T_150 <= _T_627;
      end else begin
        if (_T_634) begin
          _T_150 <= 1'h0;
        end else begin
          if (_T_664) begin
            _T_150 <= 1'h0;
          end else begin
            if (_T_709) begin
              _T_150 <= _T_751;
            end else begin
              if (_T_752) begin
                _T_150 <= _T_788;
              end else begin
                if (_T_801) begin
                  _T_150 <= 1'h0;
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_156 <= 8'h0;
    end else begin
      _T_156 <= _T_526;
    end
    if (_T_65) begin
      _T_159 <= 1'h0;
    end else begin
      if (_T_575) begin
        _T_159 <= 1'h0;
      end else begin
        if (_T_634) begin
          _T_159 <= 1'h0;
        end else begin
          if (_T_664) begin
            _T_159 <= 1'h0;
          end else begin
            if (_T_709) begin
              _T_159 <= 1'h0;
            end else begin
              if (_T_752) begin
                _T_159 <= 1'h0;
              end else begin
                if (_T_801) begin
                  _T_159 <= _T_820;
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_162 <= 1'h0;
    end else begin
      _T_162 <= _T_294;
    end
    if (_T_65) begin
      _T_165 <= 1'h0;
    end else begin
      if (_T_357) begin
        _T_165 <= 1'h1;
      end else begin
        _T_165 <= _T_359;
      end
    end
    if (_T_65) begin
      _T_168 <= 8'h0;
    end else begin
      if (_T_352) begin
        _T_168 <= _T_99;
      end else begin
        if (_T_343) begin
          _T_168 <= _T_96;
        end else begin
          if (_T_334) begin
            _T_168 <= _T_93;
          end else begin
            if (_T_325) begin
              _T_168 <= _T_90;
            end else begin
              if (_T_294) begin
                _T_168 <= QueueModule_i2c_1_io_o_bits;
              end else begin
                if (_T_284) begin
                  _T_168 <= 8'h0;
                end else begin
                  if (_T_271) begin
                    _T_168 <= _T_275;
                  end else begin
                    if (_T_250) begin
                      _T_168 <= _T_254;
                    end else begin
                      if (_T_226) begin
                        _T_168 <= _T_241;
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
    if (_T_65) begin
      _T_414 <= 32'h1;
    end else begin
      if (_T_575) begin
        _T_414 <= 32'h1;
      end else begin
        if (_T_634) begin
          if (_T_635) begin
            _T_414 <= 32'h1;
          end else begin
            _T_414 <= _T_639;
          end
        end else begin
          if (_T_664) begin
            if (_T_665) begin
              _T_414 <= 32'h1;
            end else begin
              _T_414 <= _T_639;
            end
          end else begin
            if (_T_709) begin
              if (_T_665) begin
                _T_414 <= 32'h1;
              end else begin
                _T_414 <= _T_639;
              end
            end else begin
              if (_T_752) begin
                if (_T_753) begin
                  _T_414 <= 32'h1;
                end else begin
                  _T_414 <= _T_639;
                end
              end else begin
                if (_T_801) begin
                  if (_T_753) begin
                    _T_414 <= 32'h1;
                  end else begin
                    _T_414 <= _T_639;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_417 <= 6'h0;
    end else begin
      if (_T_575) begin
        _T_417 <= 6'h0;
      end else begin
        if (_T_634) begin
          _T_417 <= 6'h0;
        end else begin
          if (_T_664) begin
            _T_417 <= 6'h0;
          end else begin
            if (_T_709) begin
              _T_417 <= 6'h0;
            end else begin
              if (_T_752) begin
                if (_T_753) begin
                  if (_T_761) begin
                    _T_417 <= 6'h2;
                  end else begin
                    _T_417 <= _T_765;
                  end
                end
              end else begin
                if (_T_801) begin
                  if (_T_753) begin
                    if (_T_761) begin
                      _T_417 <= 6'h1;
                    end else begin
                      _T_417 <= _T_765;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_420 <= 38'h0;
    end else begin
      if (_T_150) begin
        _T_420 <= _T_542;
      end
    end
    if (_T_65) begin
      _T_498 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (!(_T_634)) begin
          if (!(_T_664)) begin
            if (!(_T_709)) begin
              if (!(_T_752)) begin
                if (_T_801) begin
                  if (_T_890) begin
                    _T_498 <= io_sda_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_501 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (!(_T_634)) begin
          if (!(_T_664)) begin
            if (!(_T_709)) begin
              if (!(_T_752)) begin
                if (_T_801) begin
                  if (_T_887) begin
                    _T_501 <= io_sda_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_504 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (!(_T_634)) begin
          if (!(_T_664)) begin
            if (!(_T_709)) begin
              if (!(_T_752)) begin
                if (_T_801) begin
                  if (_T_884) begin
                    _T_504 <= io_sda_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_507 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (!(_T_634)) begin
          if (!(_T_664)) begin
            if (!(_T_709)) begin
              if (!(_T_752)) begin
                if (_T_801) begin
                  if (_T_881) begin
                    _T_507 <= io_sda_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_510 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (!(_T_634)) begin
          if (!(_T_664)) begin
            if (!(_T_709)) begin
              if (!(_T_752)) begin
                if (_T_801) begin
                  if (_T_878) begin
                    _T_510 <= io_sda_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_513 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (!(_T_634)) begin
          if (!(_T_664)) begin
            if (!(_T_709)) begin
              if (!(_T_752)) begin
                if (_T_801) begin
                  if (_T_875) begin
                    _T_513 <= io_sda_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_516 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (!(_T_634)) begin
          if (!(_T_664)) begin
            if (!(_T_709)) begin
              if (!(_T_752)) begin
                if (_T_801) begin
                  if (_T_872) begin
                    _T_516 <= io_sda_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_519 <= 1'h0;
    end else begin
      if (!(_T_575)) begin
        if (!(_T_634)) begin
          if (!(_T_664)) begin
            if (!(_T_709)) begin
              if (!(_T_752)) begin
                if (_T_801) begin
                  if (_T_869) begin
                    _T_519 <= io_sda_i;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_65) begin
      _T_569 <= 4'h0;
    end else begin
      _T_569 <= _T_566;
    end
  end
endmodule
