/*
Copyright 2021 S SIVA PRASAD ssprasad12a@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module Queue_uart( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  output        io_enq_ready, // @[:@6.4]
  input         io_enq_valid, // @[:@6.4]
  input  [11:0] io_enq_bits, // @[:@6.4]
  input         io_deq_ready, // @[:@6.4]
  output        io_deq_valid, // @[:@6.4]
  output [11:0] io_deq_bits // @[:@6.4]
);
  reg [11:0] ram [0:15]; // @[Decoupled.scala 214:24:@8.4]
  reg [31:0] _RAND_0;
  wire [11:0] ram__T_63_data; // @[Decoupled.scala 214:24:@8.4]
  wire [3:0] ram__T_63_addr; // @[Decoupled.scala 214:24:@8.4]
  wire [11:0] ram__T_49_data; // @[Decoupled.scala 214:24:@8.4]
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
    ram[initvar] = _RAND_0[11:0];
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
module QueueModule_uart( // @[:@53.2]
  input         clock, // @[:@54.4]
  input         reset, // @[:@55.4]
  output        io_i_ready, // @[:@56.4]
  input         io_i_valid, // @[:@56.4]
  input  [11:0] io_i_bits, // @[:@56.4]
  input         io_o_ready, // @[:@56.4]
  output        io_o_valid, // @[:@56.4]
  output [11:0] io_o_bits // @[:@56.4]
);
  wire  qa_clock; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_reset; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_enq_ready; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_enq_valid; // @[Decoupled.scala 293:21:@58.4]
  wire [11:0] qa_io_enq_bits; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_deq_ready; // @[Decoupled.scala 293:21:@58.4]
  wire  qa_io_deq_valid; // @[Decoupled.scala 293:21:@58.4]
  wire [11:0] qa_io_deq_bits; // @[Decoupled.scala 293:21:@58.4]
  Queue_uart qa ( // @[Decoupled.scala 293:21:@58.4]
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
module apbuart_ssp( // @[:@133.2]
  input         clock, // @[:@134.4]
  input         reset, // @[:@135.4]
  input         io_PCLK, // @[:@136.4]
  input         io_PRESETn, // @[:@136.4]
  input  [31:0] io_PADDR, // @[:@136.4]
  input         io_PPROT, // @[:@136.4]
  input         io_PSEL, // @[:@136.4]
  input         io_PENABLE, // @[:@136.4]
  input         io_PWRITE, // @[:@136.4]
  input  [31:0] io_PWDATA, // @[:@136.4]
  input  [3:0]  io_PSTRB, // @[:@136.4]
  output        io_PREADY, // @[:@136.4]
  output [31:0] io_PRDATA, // @[:@136.4]
  output        io_PSLVERR, // @[:@136.4]
  output        io_interrupt, // @[:@136.4]
  output        io_txd, // @[:@136.4]
  input         io_rxd, // @[:@136.4]
  output        io_out1, // @[:@136.4]
  output        io_out2, // @[:@136.4]
  output        io_rtsn, // @[:@136.4]
  output        io_dtrn, // @[:@136.4]
  input         io_ctsn, // @[:@136.4]
  input         io_dcdn, // @[:@136.4]
  input         io_dsrn, // @[:@136.4]
  input         io_rin, // @[:@136.4]
  output [31:0] io_divisor, // @[:@136.4]
  output [15:0] io_baudreg_tx, // @[:@136.4]
  output [15:0] io_baudcount_tx, // @[:@136.4]
  output [3:0]  io_baudcycle_tx // @[:@136.4]
);
  wire  QueueModule_clock; // @[apbuart.scala 123:20:@149.4]
  wire  QueueModule_reset; // @[apbuart.scala 123:20:@149.4]
  wire  QueueModule_io_i_ready; // @[apbuart.scala 123:20:@149.4]
  wire  QueueModule_io_i_valid; // @[apbuart.scala 123:20:@149.4]
  wire [11:0] QueueModule_io_i_bits; // @[apbuart.scala 123:20:@149.4]
  wire  QueueModule_io_o_ready; // @[apbuart.scala 123:20:@149.4]
  wire  QueueModule_io_o_valid; // @[apbuart.scala 123:20:@149.4]
  wire [11:0] QueueModule_io_o_bits; // @[apbuart.scala 123:20:@149.4]
  wire  QueueModule_1_clock; // @[apbuart.scala 124:20:@152.4]
  wire  QueueModule_1_reset; // @[apbuart.scala 124:20:@152.4]
  wire  QueueModule_1_io_i_ready; // @[apbuart.scala 124:20:@152.4]
  wire  QueueModule_1_io_i_valid; // @[apbuart.scala 124:20:@152.4]
  wire [11:0] QueueModule_1_io_i_bits; // @[apbuart.scala 124:20:@152.4]
  wire  QueueModule_1_io_o_ready; // @[apbuart.scala 124:20:@152.4]
  wire  QueueModule_1_io_o_valid; // @[apbuart.scala 124:20:@152.4]
  wire [11:0] QueueModule_1_io_o_bits; // @[apbuart.scala 124:20:@152.4]
  wire  _T_63; // @[apbuart.scala 72:28:@141.4]
  reg [1:0] _T_71; // @[apbuart.scala 77:22:@142.4]
  reg [31:0] _RAND_0;
  reg  _T_73; // @[apbuart.scala 78:22:@143.4]
  reg [31:0] _RAND_1;
  reg  _T_76; // @[apbuart.scala 80:19:@144.4]
  reg [31:0] _RAND_2;
  reg  _T_79; // @[apbuart.scala 81:19:@145.4]
  reg [31:0] _RAND_3;
  reg  _T_82; // @[apbuart.scala 82:19:@146.4]
  reg [31:0] _RAND_4;
  reg  _T_85; // @[apbuart.scala 83:20:@147.4]
  reg [31:0] _RAND_5;
  reg  _T_88; // @[apbuart.scala 84:20:@148.4]
  reg [31:0] _RAND_6;
  reg [11:0] _T_91; // @[apbuart.scala 127:27:@155.4]
  reg [31:0] _RAND_7;
  reg  _T_94; // @[apbuart.scala 128:27:@156.4]
  reg [31:0] _RAND_8;
  reg  _T_97; // @[apbuart.scala 129:27:@157.4]
  reg [31:0] _RAND_9;
  reg [11:0] _T_100; // @[apbuart.scala 131:27:@158.4]
  reg [31:0] _RAND_10;
  reg [11:0] _T_103; // @[apbuart.scala 133:27:@159.4]
  reg [31:0] _RAND_11;
  reg  _T_106; // @[apbuart.scala 134:27:@160.4]
  reg [31:0] _RAND_12;
  reg  _T_109; // @[apbuart.scala 135:27:@161.4]
  reg [31:0] _RAND_13;
  reg [31:0] _T_112; // @[apbuart.scala 155:20:@168.4]
  reg [31:0] _RAND_14;
  reg [15:0] _T_115; // @[apbuart.scala 158:27:@170.4]
  reg [31:0] _RAND_15;
  reg [15:0] _T_118; // @[apbuart.scala 159:27:@171.4]
  reg [31:0] _RAND_16;
  reg [15:0] _T_121; // @[apbuart.scala 160:27:@172.4]
  reg [31:0] _RAND_17;
  reg [3:0] _T_124; // @[apbuart.scala 161:27:@173.4]
  reg [31:0] _RAND_18;
  reg [15:0] _T_127; // @[apbuart.scala 163:27:@174.4]
  reg [31:0] _RAND_19;
  reg [15:0] _T_130; // @[apbuart.scala 164:27:@175.4]
  reg [31:0] _RAND_20;
  reg [3:0] _T_133; // @[apbuart.scala 165:27:@176.4]
  reg [31:0] _RAND_21;
  reg  _T_136; // @[apbuart.scala 172:28:@181.4]
  reg [31:0] _RAND_22;
  reg  _T_139; // @[apbuart.scala 173:28:@182.4]
  reg [31:0] _RAND_23;
  reg  _T_142; // @[apbuart.scala 174:28:@183.4]
  reg [31:0] _RAND_24;
  reg  _T_145; // @[apbuart.scala 175:28:@184.4]
  reg [31:0] _RAND_25;
  reg  _T_148; // @[apbuart.scala 176:28:@185.4]
  reg [31:0] _RAND_26;
  reg  _T_151; // @[apbuart.scala 177:28:@186.4]
  reg [31:0] _RAND_27;
  reg [1:0] _T_154; // @[apbuart.scala 178:28:@187.4]
  reg [31:0] _RAND_28;
  reg  _T_157; // @[apbuart.scala 180:19:@188.4]
  reg [31:0] _RAND_29;
  reg  _T_160; // @[apbuart.scala 181:19:@189.4]
  reg [31:0] _RAND_30;
  reg [3:0] _T_163; // @[apbuart.scala 182:26:@190.4]
  reg [31:0] _RAND_31;
  reg  _T_169; // @[apbuart.scala 184:18:@192.4]
  reg [31:0] _RAND_32;
  reg  _T_172; // @[apbuart.scala 186:18:@193.4]
  reg [31:0] _RAND_33;
  reg [3:0] _T_177; // @[apbuart.scala 188:28:@196.4]
  reg [31:0] _RAND_34;
  reg [3:0] _T_180; // @[apbuart.scala 189:26:@197.4]
  reg [31:0] _RAND_35;
  reg [11:0] _T_186; // @[apbuart.scala 191:25:@199.4]
  reg [31:0] _RAND_36;
  wire  _T_187; // @[apbuart.scala 195:15:@200.4]
  wire  _T_189; // @[apbuart.scala 195:31:@201.4]
  wire  _T_190; // @[apbuart.scala 195:28:@202.4]
  wire [7:0] _T_191; // @[apbuart.scala 195:55:@203.4]
  wire  _T_204; // @[apbuart.scala 195:61:@204.4]
  wire  _T_205; // @[apbuart.scala 195:43:@205.4]
  wire  _T_206; // @[apbuart.scala 196:29:@207.6]
  wire  _T_207; // @[apbuart.scala 197:29:@209.6]
  wire  _T_208; // @[apbuart.scala 198:29:@211.6]
  wire  _T_209; // @[apbuart.scala 199:29:@213.6]
  wire  _T_210; // @[apbuart.scala 200:29:@215.6]
  wire  _T_211; // @[apbuart.scala 201:29:@217.6]
  wire [1:0] _T_212; // @[apbuart.scala 202:29:@219.6]
  wire  _GEN_0; // @[apbuart.scala 195:86:@206.4]
  wire  _GEN_1; // @[apbuart.scala 195:86:@206.4]
  wire  _GEN_2; // @[apbuart.scala 195:86:@206.4]
  wire  _GEN_3; // @[apbuart.scala 195:86:@206.4]
  wire  _GEN_4; // @[apbuart.scala 195:86:@206.4]
  wire  _GEN_5; // @[apbuart.scala 195:86:@206.4]
  wire [1:0] _GEN_6; // @[apbuart.scala 195:86:@206.4]
  wire  _T_214; // @[apbuart.scala 207:19:@222.4]
  wire  _T_215; // @[apbuart.scala 207:15:@223.4]
  wire  _T_218; // @[apbuart.scala 207:30:@225.4]
  wire  _T_221; // @[apbuart.scala 207:45:@228.4]
  wire [2:0] _T_223; // @[Cat.scala 30:58:@230.6]
  wire [1:0] _T_224; // @[Cat.scala 30:58:@231.6]
  wire [4:0] _T_225; // @[Cat.scala 30:58:@232.6]
  wire [1:0] _T_226; // @[Cat.scala 30:58:@233.6]
  wire [24:0] _T_227; // @[Cat.scala 30:58:@234.6]
  wire [26:0] _T_228; // @[Cat.scala 30:58:@235.6]
  wire [31:0] _T_229; // @[Cat.scala 30:58:@236.6]
  wire [31:0] _GEN_7; // @[apbuart.scala 207:88:@229.4]
  wire  _T_235; // @[apbuart.scala 212:61:@243.4]
  wire  _T_236; // @[apbuart.scala 212:43:@244.4]
  wire  _T_240; // @[apbuart.scala 216:30:@252.6]
  wire  _T_241; // @[apbuart.scala 217:30:@254.6]
  wire  _GEN_8; // @[apbuart.scala 212:86:@245.4]
  wire  _GEN_9; // @[apbuart.scala 212:86:@245.4]
  wire  _GEN_10; // @[apbuart.scala 212:86:@245.4]
  wire  _GEN_11; // @[apbuart.scala 212:86:@245.4]
  wire  _GEN_12; // @[apbuart.scala 212:86:@245.4]
  wire  _T_250; // @[apbuart.scala 219:45:@263.4]
  wire [1:0] _T_252; // @[Cat.scala 30:58:@265.6]
  wire [2:0] _T_253; // @[Cat.scala 30:58:@266.6]
  wire [27:0] _T_254; // @[Cat.scala 30:58:@267.6]
  wire [28:0] _T_255; // @[Cat.scala 30:58:@268.6]
  wire [31:0] _T_256; // @[Cat.scala 30:58:@269.6]
  wire [31:0] _GEN_13; // @[apbuart.scala 219:88:@264.4]
  reg [31:0] _T_259; // @[apbuart.scala 229:22:@276.4]
  reg [31:0] _RAND_37;
  wire  _T_265; // @[apbuart.scala 230:61:@281.4]
  wire  _T_266; // @[apbuart.scala 230:43:@282.4]
  wire [31:0] _GEN_14; // @[apbuart.scala 230:86:@283.4]
  wire  _T_275; // @[apbuart.scala 233:45:@292.4]
  wire [31:0] _GEN_15; // @[apbuart.scala 233:88:@293.4]
  reg [7:0] _T_278; // @[apbuart.scala 239:26:@296.4]
  reg [31:0] _RAND_38;
  reg [7:0] _T_281; // @[apbuart.scala 240:26:@297.4]
  reg [31:0] _RAND_39;
  wire  _T_287; // @[apbuart.scala 241:61:@302.4]
  wire  _T_288; // @[apbuart.scala 241:43:@303.4]
  wire  _T_289; // @[apbuart.scala 241:86:@304.4]
  wire [7:0] _T_290; // @[apbuart.scala 242:27:@306.6]
  wire [15:0] _T_292; // @[Cat.scala 30:58:@309.6]
  wire [7:0] _GEN_16; // @[apbuart.scala 241:95:@305.4]
  wire [15:0] _GEN_17; // @[apbuart.scala 241:95:@305.4]
  wire  _T_301; // @[apbuart.scala 245:45:@318.4]
  wire  _T_302; // @[apbuart.scala 245:88:@319.4]
  wire [31:0] _T_304; // @[Cat.scala 30:58:@321.6]
  wire [31:0] _GEN_18; // @[apbuart.scala 245:96:@320.4]
  wire  _T_310; // @[apbuart.scala 248:61:@328.4]
  wire  _T_311; // @[apbuart.scala 248:43:@329.4]
  wire  _T_312; // @[apbuart.scala 248:86:@330.4]
  wire [15:0] _T_315; // @[Cat.scala 30:58:@335.6]
  wire [7:0] _GEN_19; // @[apbuart.scala 248:95:@331.4]
  wire [15:0] _GEN_20; // @[apbuart.scala 248:95:@331.4]
  wire  _T_324; // @[apbuart.scala 252:45:@344.4]
  wire  _T_325; // @[apbuart.scala 252:88:@345.4]
  wire [31:0] _T_327; // @[Cat.scala 30:58:@347.6]
  wire [31:0] _GEN_21; // @[apbuart.scala 252:96:@346.4]
  wire [1:0] _T_333; // @[Cat.scala 30:58:@355.4]
  wire [1:0] _T_334; // @[Cat.scala 30:58:@356.4]
  wire [2:0] _T_335; // @[Cat.scala 30:58:@357.4]
  wire [4:0] _T_336; // @[Cat.scala 30:58:@358.4]
  wire [2:0] _T_344; // @[Cat.scala 30:58:@366.4]
  wire [5:0] _T_347; // @[Cat.scala 30:58:@369.4]
  wire [1:0] _T_355; // @[Cat.scala 30:58:@377.4]
  wire [2:0] _T_356; // @[Cat.scala 30:58:@378.4]
  wire [1:0] _T_357; // @[Cat.scala 30:58:@379.4]
  wire [3:0] _T_359; // @[Cat.scala 30:58:@381.4]
  wire [6:0] _T_360; // @[Cat.scala 30:58:@382.4]
  wire [1:0] _T_369; // @[Cat.scala 30:58:@391.4]
  wire [3:0] _T_371; // @[Cat.scala 30:58:@393.4]
  wire [7:0] _T_375; // @[Cat.scala 30:58:@397.4]
  wire [1:0] _T_376; // @[Cat.scala 30:58:@398.4]
  wire [3:0] _T_377; // @[Cat.scala 30:58:@399.4]
  wire [8:0] _T_380; // @[Cat.scala 30:58:@400.4]
  wire [9:0] _T_381; // @[Cat.scala 30:58:@401.4]
  wire [10:0] _T_382; // @[apbuart.scala 279:113:@402.4]
  wire [5:0] _T_386; // @[Cat.scala 30:58:@403.4]
  wire [6:0] _T_387; // @[Cat.scala 30:58:@404.4]
  wire [7:0] _T_388; // @[apbuart.scala 281:49:@405.4]
  wire [6:0] _T_392; // @[Cat.scala 30:58:@406.4]
  wire [7:0] _T_393; // @[Cat.scala 30:58:@407.4]
  wire [8:0] _T_394; // @[apbuart.scala 282:49:@408.4]
  wire [7:0] _T_398; // @[Cat.scala 30:58:@409.4]
  wire [8:0] _T_399; // @[Cat.scala 30:58:@410.4]
  wire [9:0] _T_400; // @[apbuart.scala 283:49:@411.4]
  wire [7:0] _T_411; // @[Cat.scala 30:58:@416.4]
  wire [8:0] _T_412; // @[apbuart.scala 286:49:@417.4]
  wire [8:0] _T_417; // @[Cat.scala 30:58:@419.4]
  wire [9:0] _T_418; // @[apbuart.scala 287:49:@420.4]
  wire [9:0] _T_423; // @[Cat.scala 30:58:@422.4]
  wire [10:0] _T_424; // @[apbuart.scala 288:49:@423.4]
  wire [10:0] _T_429; // @[Cat.scala 30:58:@425.4]
  wire [11:0] _T_430; // @[apbuart.scala 289:49:@426.4]
  wire  _T_435; // @[apbuart.scala 259:30:@428.4]
  wire  _T_436; // @[apbuart.scala 259:27:@429.4]
  wire  _T_438; // @[apbuart.scala 259:39:@431.4]
  wire [4:0] _T_441; // @[apbuart.scala 261:41:@432.4]
  wire  _T_442; // @[apbuart.scala 261:47:@433.4]
  wire  _T_444; // @[apbuart.scala 261:36:@434.4]
  wire  _T_447; // @[apbuart.scala 261:21:@437.4]
  wire [5:0] _T_449; // @[apbuart.scala 262:41:@438.4]
  wire  _T_450; // @[apbuart.scala 262:47:@439.4]
  wire  _T_452; // @[apbuart.scala 262:36:@440.4]
  wire  _T_455; // @[apbuart.scala 262:21:@443.4]
  wire [6:0] _T_457; // @[apbuart.scala 263:41:@444.4]
  wire  _T_458; // @[apbuart.scala 263:47:@445.4]
  wire  _T_460; // @[apbuart.scala 263:36:@446.4]
  wire  _T_463; // @[apbuart.scala 263:21:@449.4]
  wire  _T_466; // @[apbuart.scala 264:47:@451.4]
  wire  _T_468; // @[apbuart.scala 264:36:@452.4]
  wire  _T_471; // @[apbuart.scala 264:21:@455.4]
  wire  _T_472; // @[Mux.scala 46:19:@456.4]
  wire  _T_473; // @[Mux.scala 46:16:@457.4]
  wire  _T_474; // @[Mux.scala 46:19:@458.4]
  wire  _T_475; // @[Mux.scala 46:16:@459.4]
  wire  _T_476; // @[Mux.scala 46:19:@460.4]
  wire  _T_477; // @[Mux.scala 46:16:@461.4]
  wire  _T_478; // @[Mux.scala 46:19:@462.4]
  wire  _T_479; // @[Mux.scala 46:16:@463.4]
  wire  _T_480; // @[apbuart.scala 266:24:@464.4]
  wire [1:0] _T_482; // @[Cat.scala 30:58:@465.4]
  wire [7:0] _T_484; // @[Cat.scala 30:58:@467.4]
  wire [8:0] _T_485; // @[apbuart.scala 293:96:@468.4]
  wire [8:0] _T_539; // @[Cat.scala 30:58:@509.4]
  wire [9:0] _T_540; // @[apbuart.scala 294:96:@510.4]
  wire [9:0] _T_594; // @[Cat.scala 30:58:@551.4]
  wire [10:0] _T_595; // @[apbuart.scala 295:96:@552.4]
  wire [10:0] _T_649; // @[Cat.scala 30:58:@593.4]
  wire [11:0] _T_650; // @[apbuart.scala 296:96:@594.4]
  wire [2:0] _T_702; // @[Cat.scala 30:58:@633.4]
  wire [8:0] _T_704; // @[Cat.scala 30:58:@635.4]
  wire [9:0] _T_705; // @[apbuart.scala 299:96:@636.4]
  wire [9:0] _T_759; // @[Cat.scala 30:58:@677.4]
  wire [10:0] _T_760; // @[apbuart.scala 300:96:@678.4]
  wire [10:0] _T_814; // @[Cat.scala 30:58:@719.4]
  wire [11:0] _T_815; // @[apbuart.scala 301:96:@720.4]
  wire [11:0] _T_869; // @[Cat.scala 30:58:@761.4]
  wire [12:0] _T_870; // @[apbuart.scala 302:96:@762.4]
  wire  _T_871; // @[Mux.scala 46:19:@763.4]
  wire [12:0] _T_872; // @[Mux.scala 46:16:@764.4]
  wire  _T_873; // @[Mux.scala 46:19:@765.4]
  wire [12:0] _T_874; // @[Mux.scala 46:16:@766.4]
  wire  _T_875; // @[Mux.scala 46:19:@767.4]
  wire [12:0] _T_876; // @[Mux.scala 46:16:@768.4]
  wire  _T_877; // @[Mux.scala 46:19:@769.4]
  wire [12:0] _T_878; // @[Mux.scala 46:16:@770.4]
  wire  _T_879; // @[Mux.scala 46:19:@771.4]
  wire [12:0] _T_880; // @[Mux.scala 46:16:@772.4]
  wire  _T_881; // @[Mux.scala 46:19:@773.4]
  wire [12:0] _T_882; // @[Mux.scala 46:16:@774.4]
  wire  _T_883; // @[Mux.scala 46:19:@775.4]
  wire [12:0] _T_884; // @[Mux.scala 46:16:@776.4]
  wire  _T_885; // @[Mux.scala 46:19:@777.4]
  wire [12:0] _T_886; // @[Mux.scala 46:16:@778.4]
  wire  _T_887; // @[Mux.scala 46:19:@779.4]
  wire [12:0] _T_888; // @[Mux.scala 46:16:@780.4]
  wire  _T_889; // @[Mux.scala 46:19:@781.4]
  wire [12:0] _T_890; // @[Mux.scala 46:16:@782.4]
  wire  _T_891; // @[Mux.scala 46:19:@783.4]
  wire [12:0] _T_892; // @[Mux.scala 46:16:@784.4]
  wire  _T_893; // @[Mux.scala 46:19:@785.4]
  wire [12:0] _T_894; // @[Mux.scala 46:16:@786.4]
  wire  _T_895; // @[Mux.scala 46:19:@787.4]
  wire [12:0] _T_896; // @[Mux.scala 46:16:@788.4]
  wire  _T_897; // @[Mux.scala 46:19:@789.4]
  wire [12:0] _T_898; // @[Mux.scala 46:16:@790.4]
  wire  _T_899; // @[Mux.scala 46:19:@791.4]
  wire [12:0] _T_900; // @[Mux.scala 46:16:@792.4]
  wire  _T_901; // @[Mux.scala 46:19:@793.4]
  wire [12:0] _T_902; // @[Mux.scala 46:16:@794.4]
  wire  _T_911; // @[apbuart.scala 308:89:@801.4]
  wire  _T_912; // @[apbuart.scala 308:86:@802.4]
  wire  _T_914; // @[apbuart.scala 309:28:@804.6]
  wire [12:0] _T_916; // @[apbuart.scala 309:59:@805.6]
  wire [12:0] _T_917; // @[apbuart.scala 309:27:@806.6]
  wire  _T_922; // @[apbuart.scala 310:27:@809.6]
  wire [12:0] _GEN_22; // @[apbuart.scala 308:96:@803.4]
  wire  _GEN_23; // @[apbuart.scala 308:96:@803.4]
  wire [3:0] _T_961; // @[Mux.scala 46:16:@819.4]
  wire [3:0] _T_963; // @[Mux.scala 46:16:@821.4]
  wire [3:0] _T_965; // @[Mux.scala 46:16:@823.4]
  wire [3:0] _T_967; // @[Mux.scala 46:16:@825.4]
  wire [3:0] _T_969; // @[Mux.scala 46:16:@827.4]
  wire [3:0] _T_971; // @[Mux.scala 46:16:@829.4]
  wire [3:0] _T_973; // @[Mux.scala 46:16:@831.4]
  wire [3:0] _T_975; // @[Mux.scala 46:16:@833.4]
  wire [3:0] _T_977; // @[Mux.scala 46:16:@835.4]
  wire [3:0] _T_979; // @[Mux.scala 46:16:@837.4]
  wire [3:0] _T_981; // @[Mux.scala 46:16:@839.4]
  wire [3:0] _T_983; // @[Mux.scala 46:16:@841.4]
  wire [3:0] _T_985; // @[Mux.scala 46:16:@843.4]
  wire [3:0] _T_987; // @[Mux.scala 46:16:@845.4]
  wire [3:0] _T_989; // @[Mux.scala 46:16:@847.4]
  wire [3:0] _T_991; // @[Mux.scala 46:16:@849.4]
  reg  _T_994; // @[apbuart.scala 346:25:@851.4]
  reg [31:0] _RAND_40;
  reg  _T_997; // @[apbuart.scala 349:26:@852.4]
  reg [31:0] _RAND_41;
  reg  _T_1000; // @[apbuart.scala 350:26:@853.4]
  reg [31:0] _RAND_42;
  reg  _T_1003; // @[apbuart.scala 351:26:@854.4]
  reg [31:0] _RAND_43;
  reg  _T_1006; // @[apbuart.scala 352:26:@855.4]
  reg [31:0] _RAND_44;
  reg  _T_1009; // @[apbuart.scala 353:26:@856.4]
  reg [31:0] _RAND_45;
  reg  _T_1012; // @[apbuart.scala 354:26:@857.4]
  reg [31:0] _RAND_46;
  reg  _T_1015; // @[apbuart.scala 355:26:@858.4]
  reg [31:0] _RAND_47;
  wire  _T_1017; // @[apbuart.scala 357:14:@859.4]
  wire  _T_1018; // @[apbuart.scala 359:22:@861.4]
  wire  _T_1019; // @[apbuart.scala 361:27:@863.4]
  wire  _T_1023; // @[apbuart.scala 259:35:@866.4]
  wire  _T_1025; // @[apbuart.scala 259:30:@867.4]
  wire  _T_1026; // @[apbuart.scala 259:27:@868.4]
  wire  _T_1027; // @[apbuart.scala 259:46:@869.4]
  wire  _T_1028; // @[apbuart.scala 259:39:@870.4]
  wire [4:0] _T_1031; // @[apbuart.scala 261:41:@871.4]
  wire  _T_1032; // @[apbuart.scala 261:47:@872.4]
  wire  _T_1034; // @[apbuart.scala 261:36:@873.4]
  wire  _T_1037; // @[apbuart.scala 261:21:@876.4]
  wire [5:0] _T_1039; // @[apbuart.scala 262:41:@877.4]
  wire  _T_1040; // @[apbuart.scala 262:47:@878.4]
  wire  _T_1042; // @[apbuart.scala 262:36:@879.4]
  wire  _T_1045; // @[apbuart.scala 262:21:@882.4]
  wire [6:0] _T_1047; // @[apbuart.scala 263:41:@883.4]
  wire  _T_1048; // @[apbuart.scala 263:47:@884.4]
  wire  _T_1050; // @[apbuart.scala 263:36:@885.4]
  wire  _T_1053; // @[apbuart.scala 263:21:@888.4]
  wire [7:0] _T_1055; // @[apbuart.scala 264:41:@889.4]
  wire  _T_1056; // @[apbuart.scala 264:47:@890.4]
  wire  _T_1058; // @[apbuart.scala 264:36:@891.4]
  wire  _T_1061; // @[apbuart.scala 264:21:@894.4]
  wire  _T_1063; // @[Mux.scala 46:16:@896.4]
  wire  _T_1065; // @[Mux.scala 46:16:@898.4]
  wire  _T_1067; // @[Mux.scala 46:16:@900.4]
  wire  _T_1069; // @[Mux.scala 46:16:@902.4]
  wire  _T_1070; // @[apbuart.scala 266:24:@903.4]
  wire  _T_1071; // @[apbuart.scala 366:49:@904.4]
  wire  _T_1072; // @[apbuart.scala 366:61:@905.4]
  wire  _T_1073; // @[apbuart.scala 366:28:@906.4]
  wire  _T_1076; // @[apbuart.scala 367:41:@908.4]
  wire  _T_1079; // @[apbuart.scala 367:57:@910.4]
  wire  _T_1080; // @[apbuart.scala 367:54:@911.4]
  wire  _T_1084; // @[apbuart.scala 367:28:@914.4]
  wire  _T_1092; // @[apbuart.scala 369:63:@920.4]
  wire  _T_1093; // @[apbuart.scala 369:45:@921.4]
  wire [1:0] _T_1095; // @[Cat.scala 30:58:@923.6]
  wire [1:0] _T_1096; // @[Cat.scala 30:58:@924.6]
  wire [3:0] _T_1097; // @[Cat.scala 30:58:@925.6]
  wire [1:0] _T_1098; // @[Cat.scala 30:58:@926.6]
  wire [24:0] _T_1099; // @[Cat.scala 30:58:@927.6]
  wire [25:0] _T_1100; // @[Cat.scala 30:58:@928.6]
  wire [27:0] _T_1101; // @[Cat.scala 30:58:@929.6]
  wire [31:0] _T_1102; // @[Cat.scala 30:58:@930.6]
  wire  _T_1109; // @[apbuart.scala 377:31:@939.6]
  wire  _T_1111; // @[apbuart.scala 377:45:@940.6]
  wire  _T_1112; // @[apbuart.scala 377:42:@941.6]
  wire  _T_1113; // @[apbuart.scala 377:64:@942.6]
  wire  _T_1115; // @[apbuart.scala 377:30:@943.6]
  wire  _T_1117; // @[apbuart.scala 378:31:@945.6]
  wire  _T_1118; // @[apbuart.scala 378:42:@946.6]
  wire  _T_1120; // @[apbuart.scala 378:67:@947.6]
  wire  _T_1121; // @[apbuart.scala 378:55:@948.6]
  wire  _T_1123; // @[apbuart.scala 378:30:@949.6]
  wire  _T_1125; // @[apbuart.scala 379:31:@951.6]
  wire  _T_1126; // @[apbuart.scala 379:42:@952.6]
  wire  _T_1127; // @[apbuart.scala 379:77:@953.6]
  wire  _T_1128; // @[apbuart.scala 379:55:@954.6]
  wire  _T_1130; // @[apbuart.scala 379:30:@955.6]
  wire  _T_1132; // @[apbuart.scala 380:31:@957.6]
  wire  _T_1133; // @[apbuart.scala 380:42:@958.6]
  wire  _T_1134; // @[apbuart.scala 380:55:@959.6]
  wire  _T_1136; // @[apbuart.scala 380:30:@960.6]
  wire  _T_1138; // @[apbuart.scala 381:31:@962.6]
  wire  _T_1139; // @[apbuart.scala 381:41:@963.6]
  wire  _T_1144; // @[apbuart.scala 381:79:@966.6]
  wire  _T_1147; // @[apbuart.scala 381:102:@969.6]
  wire  _T_1148; // @[apbuart.scala 381:155:@970.6]
  wire  _T_1149; // @[apbuart.scala 381:54:@971.6]
  wire  _T_1151; // @[apbuart.scala 381:30:@972.6]
  wire [31:0] _GEN_24; // @[apbuart.scala 369:90:@922.4]
  wire  _GEN_25; // @[apbuart.scala 369:90:@922.4]
  wire  _GEN_26; // @[apbuart.scala 369:90:@922.4]
  wire  _GEN_27; // @[apbuart.scala 369:90:@922.4]
  wire  _GEN_28; // @[apbuart.scala 369:90:@922.4]
  wire  _GEN_29; // @[apbuart.scala 369:90:@922.4]
  reg  _T_1157; // @[apbuart.scala 387:19:@976.4]
  reg [31:0] _RAND_48;
  reg  _T_1160; // @[apbuart.scala 388:19:@977.4]
  reg [31:0] _RAND_49;
  reg  _T_1163; // @[apbuart.scala 391:19:@980.4]
  reg [31:0] _RAND_50;
  reg  _T_1166; // @[apbuart.scala 393:19:@981.4]
  reg [31:0] _RAND_51;
  reg  _T_1169; // @[apbuart.scala 394:19:@982.4]
  reg [31:0] _RAND_52;
  reg  _T_1172; // @[apbuart.scala 395:19:@983.4]
  reg [31:0] _RAND_53;
  reg  _T_1175; // @[apbuart.scala 397:19:@984.4]
  reg [31:0] _RAND_54;
  reg  _T_1178; // @[apbuart.scala 398:19:@985.4]
  reg [31:0] _RAND_55;
  reg  _T_1181; // @[apbuart.scala 399:19:@986.4]
  reg [31:0] _RAND_56;
  wire  _T_1186; // @[apbuart.scala 406:14:@991.4]
  wire  _T_1187; // @[apbuart.scala 406:11:@992.4]
  wire  _T_1190; // @[apbuart.scala 408:22:@997.6]
  wire  _T_1191; // @[apbuart.scala 408:19:@998.6]
  wire  _GEN_30; // @[apbuart.scala 408:29:@999.6]
  wire  _GEN_31; // @[apbuart.scala 406:21:@993.4]
  wire  _T_1193; // @[apbuart.scala 414:18:@1005.4]
  wire  _T_1195; // @[apbuart.scala 414:12:@1006.4]
  wire  _T_1196; // @[apbuart.scala 415:18:@1008.4]
  wire  _T_1198; // @[apbuart.scala 415:12:@1009.4]
  wire  _T_1199; // @[apbuart.scala 416:18:@1011.4]
  wire  _T_1201; // @[apbuart.scala 416:12:@1012.4]
  wire  _T_1209; // @[apbuart.scala 418:63:@1019.4]
  wire  _T_1210; // @[apbuart.scala 418:45:@1020.4]
  wire  _T_1213; // @[apbuart.scala 419:34:@1022.6]
  wire  _T_1215; // @[apbuart.scala 419:43:@1023.6]
  wire  _T_1217; // @[apbuart.scala 419:51:@1024.6]
  wire  _T_1219; // @[apbuart.scala 419:60:@1025.6]
  wire [1:0] _T_1220; // @[Cat.scala 30:58:@1026.6]
  wire [1:0] _T_1221; // @[Cat.scala 30:58:@1027.6]
  wire [3:0] _T_1222; // @[Cat.scala 30:58:@1028.6]
  wire [1:0] _T_1223; // @[Cat.scala 30:58:@1029.6]
  wire [24:0] _T_1224; // @[Cat.scala 30:58:@1030.6]
  wire [25:0] _T_1225; // @[Cat.scala 30:58:@1031.6]
  wire [27:0] _T_1226; // @[Cat.scala 30:58:@1032.6]
  wire [31:0] _T_1227; // @[Cat.scala 30:58:@1033.6]
  wire [31:0] _GEN_32; // @[apbuart.scala 418:90:@1021.4]
  wire  _T_1228; // @[apbuart.scala 428:11:@1040.4]
  wire  _T_1231; // @[apbuart.scala 429:29:@1042.6]
  wire  _T_1235; // @[Conditional.scala 37:30:@1051.6]
  wire  _T_1240; // @[apbuart.scala 440:37:@1054.8]
  wire [1:0] _T_1243; // @[apbuart.scala 441:37:@1057.8]
  wire  _T_1250; // @[Conditional.scala 37:30:@1068.8]
  wire  _T_1253; // @[Conditional.scala 37:30:@1076.10]
  wire  _T_1257; // @[apbuart.scala 459:62:@1080.12]
  wire  _T_1259; // @[apbuart.scala 460:62:@1081.12]
  wire  _T_1261; // @[apbuart.scala 461:62:@1082.12]
  wire  _T_1263; // @[apbuart.scala 462:62:@1083.12]
  wire  _T_1265; // @[apbuart.scala 463:62:@1084.12]
  wire  _T_1267; // @[apbuart.scala 464:62:@1085.12]
  wire  _T_1268; // @[Mux.scala 46:19:@1086.12]
  wire  _T_1269; // @[Mux.scala 46:16:@1087.12]
  wire  _T_1270; // @[Mux.scala 46:19:@1088.12]
  wire  _T_1271; // @[Mux.scala 46:16:@1089.12]
  wire  _T_1272; // @[Mux.scala 46:19:@1090.12]
  wire  _T_1273; // @[Mux.scala 46:16:@1091.12]
  wire  _T_1274; // @[Mux.scala 46:19:@1092.12]
  wire  _T_1275; // @[Mux.scala 46:16:@1093.12]
  wire  _T_1276; // @[Mux.scala 46:19:@1094.12]
  wire  _T_1277; // @[Mux.scala 46:16:@1095.12]
  wire  _T_1278; // @[Mux.scala 46:19:@1096.12]
  wire  _T_1279; // @[Mux.scala 46:16:@1097.12]
  wire [16:0] _T_1281; // @[apbuart.scala 466:48:@1099.12]
  wire [15:0] _T_1282; // @[apbuart.scala 466:48:@1100.12]
  wire  _T_1284; // @[Conditional.scala 37:30:@1106.12]
  wire [16:0] _T_1286; // @[apbuart.scala 472:67:@1108.14]
  wire [16:0] _T_1287; // @[apbuart.scala 472:67:@1109.14]
  wire [15:0] _T_1288; // @[apbuart.scala 472:67:@1110.14]
  wire  _T_1289; // @[apbuart.scala 472:51:@1111.14]
  wire [15:0] _T_1294; // @[apbuart.scala 472:37:@1114.14]
  wire  _T_1301; // @[apbuart.scala 473:91:@1120.14]
  wire [4:0] _T_1304; // @[apbuart.scala 473:117:@1121.14]
  wire [3:0] _T_1305; // @[apbuart.scala 473:117:@1122.14]
  wire [3:0] _T_1306; // @[apbuart.scala 473:77:@1123.14]
  wire [3:0] _T_1307; // @[apbuart.scala 473:37:@1124.14]
  wire  _T_1315; // @[apbuart.scala 475:47:@1131.14]
  wire [12:0] _GEN_116; // @[apbuart.scala 476:54:@1133.16]
  wire [12:0] _T_1316; // @[apbuart.scala 476:54:@1133.16]
  wire [12:0] _GEN_37; // @[apbuart.scala 475:90:@1132.14]
  wire  _T_1326; // @[apbuart.scala 481:104:@1145.14]
  wire  _T_1327; // @[apbuart.scala 481:88:@1146.14]
  wire [4:0] _T_1338; // @[apbuart.scala 487:122:@1160.16]
  wire [4:0] _T_1339; // @[apbuart.scala 487:122:@1161.16]
  wire [3:0] _T_1340; // @[apbuart.scala 487:122:@1162.16]
  wire [3:0] _T_1341; // @[apbuart.scala 487:43:@1163.16]
  wire [1:0] _GEN_38; // @[apbuart.scala 481:114:@1147.14]
  wire  _GEN_39; // @[apbuart.scala 481:114:@1147.14]
  wire [3:0] _GEN_40; // @[apbuart.scala 481:114:@1147.14]
  wire [15:0] _GEN_41; // @[Conditional.scala 39:67:@1107.12]
  wire [3:0] _GEN_42; // @[Conditional.scala 39:67:@1107.12]
  wire [12:0] _GEN_43; // @[Conditional.scala 39:67:@1107.12]
  wire [1:0] _GEN_44; // @[Conditional.scala 39:67:@1107.12]
  wire  _GEN_45; // @[Conditional.scala 39:67:@1107.12]
  wire [3:0] _GEN_46; // @[Conditional.scala 39:67:@1107.12]
  wire [1:0] _GEN_47; // @[Conditional.scala 39:67:@1077.10]
  wire  _GEN_48; // @[Conditional.scala 39:67:@1077.10]
  wire  _GEN_49; // @[Conditional.scala 39:67:@1077.10]
  wire [15:0] _GEN_50; // @[Conditional.scala 39:67:@1077.10]
  wire [3:0] _GEN_51; // @[Conditional.scala 39:67:@1077.10]
  wire [3:0] _GEN_52; // @[Conditional.scala 39:67:@1077.10]
  wire [12:0] _GEN_53; // @[Conditional.scala 39:67:@1077.10]
  wire  _GEN_54; // @[Conditional.scala 39:67:@1069.8]
  wire [12:0] _GEN_55; // @[Conditional.scala 39:67:@1069.8]
  wire [1:0] _GEN_56; // @[Conditional.scala 39:67:@1069.8]
  wire  _GEN_57; // @[Conditional.scala 39:67:@1069.8]
  wire [15:0] _GEN_58; // @[Conditional.scala 39:67:@1069.8]
  wire [3:0] _GEN_59; // @[Conditional.scala 39:67:@1069.8]
  wire [3:0] _GEN_60; // @[Conditional.scala 39:67:@1069.8]
  wire  _GEN_61; // @[Conditional.scala 40:58:@1052.6]
  wire [1:0] _GEN_62; // @[Conditional.scala 40:58:@1052.6]
  wire  _GEN_63; // @[Conditional.scala 40:58:@1052.6]
  wire [15:0] _GEN_64; // @[Conditional.scala 40:58:@1052.6]
  wire [15:0] _GEN_65; // @[Conditional.scala 40:58:@1052.6]
  wire [3:0] _GEN_66; // @[Conditional.scala 40:58:@1052.6]
  wire [3:0] _GEN_67; // @[Conditional.scala 40:58:@1052.6]
  wire [12:0] _GEN_68; // @[Conditional.scala 40:58:@1052.6]
  wire  _GEN_69; // @[apbuart.scala 428:24:@1041.4]
  wire  _GEN_70; // @[apbuart.scala 428:24:@1041.4]
  wire [1:0] _GEN_71; // @[apbuart.scala 428:24:@1041.4]
  wire [15:0] _GEN_72; // @[apbuart.scala 428:24:@1041.4]
  wire [15:0] _GEN_73; // @[apbuart.scala 428:24:@1041.4]
  wire [3:0] _GEN_74; // @[apbuart.scala 428:24:@1041.4]
  wire [3:0] _GEN_75; // @[apbuart.scala 428:24:@1041.4]
  wire [12:0] _GEN_76; // @[apbuart.scala 428:24:@1041.4]
  wire  _T_1367; // @[apbuart.scala 505:12:@1187.4]
  wire  _T_1369; // @[apbuart.scala 508:25:@1191.4]
  wire  _T_1370; // @[apbuart.scala 508:22:@1192.4]
  wire  _T_1371; // @[Conditional.scala 37:30:@1193.4]
  wire  _T_1373; // @[apbuart.scala 512:43:@1195.6]
  wire  _T_1374; // @[apbuart.scala 512:40:@1196.6]
  wire [16:0] _T_1385; // @[apbuart.scala 523:59:@1211.8]
  wire [16:0] _T_1386; // @[apbuart.scala 523:59:@1212.8]
  wire [15:0] _T_1387; // @[apbuart.scala 523:59:@1213.8]
  wire  _T_1388; // @[apbuart.scala 523:43:@1214.8]
  wire [16:0] _T_1391; // @[apbuart.scala 523:83:@1215.8]
  wire [15:0] _T_1392; // @[apbuart.scala 523:83:@1216.8]
  wire [15:0] _T_1393; // @[apbuart.scala 523:29:@1217.8]
  wire  _T_1400; // @[apbuart.scala 524:83:@1223.8]
  wire [4:0] _T_1403; // @[apbuart.scala 524:109:@1224.8]
  wire [3:0] _T_1404; // @[apbuart.scala 524:109:@1225.8]
  wire [3:0] _T_1405; // @[apbuart.scala 524:69:@1226.8]
  wire [3:0] _T_1406; // @[apbuart.scala 524:29:@1227.8]
  wire  _T_1414; // @[apbuart.scala 525:55:@1234.8]
  wire [4:0] _T_1416; // @[apbuart.scala 525:108:@1235.8]
  wire [4:0] _T_1417; // @[apbuart.scala 525:108:@1236.8]
  wire [3:0] _T_1418; // @[apbuart.scala 525:108:@1237.8]
  wire [3:0] _T_1419; // @[apbuart.scala 525:29:@1238.8]
  wire  _T_1421; // @[apbuart.scala 527:29:@1240.8]
  wire  _T_1427; // @[apbuart.scala 527:38:@1245.8]
  wire  _T_1428; // @[apbuart.scala 527:95:@1246.8]
  wire  _T_1429; // @[apbuart.scala 527:79:@1247.8]
  wire [1:0] _T_1430; // @[apbuart.scala 528:46:@1249.10]
  wire [10:0] _T_1432; // @[apbuart.scala 530:58:@1252.10]
  wire [11:0] _T_1433; // @[Cat.scala 30:58:@1253.10]
  wire  _T_1443; // @[apbuart.scala 533:105:@1263.10]
  wire  _T_1444; // @[apbuart.scala 533:87:@1264.10]
  wire [4:0] _T_1450; // @[apbuart.scala 540:55:@1271.12]
  wire [5:0] _T_1452; // @[apbuart.scala 541:55:@1272.12]
  wire [6:0] _T_1454; // @[apbuart.scala 542:55:@1273.12]
  wire [7:0] _T_1456; // @[apbuart.scala 543:55:@1274.12]
  wire [4:0] _T_1458; // @[apbuart.scala 545:55:@1275.12]
  wire [5:0] _T_1460; // @[apbuart.scala 546:55:@1276.12]
  wire [6:0] _T_1462; // @[apbuart.scala 547:55:@1277.12]
  wire [7:0] _T_1464; // @[apbuart.scala 548:55:@1278.12]
  wire [4:0] _T_1474; // @[apbuart.scala 558:55:@1283.12]
  wire [5:0] _T_1476; // @[apbuart.scala 559:55:@1284.12]
  wire [6:0] _T_1478; // @[apbuart.scala 560:55:@1285.12]
  wire [7:0] _T_1480; // @[apbuart.scala 561:55:@1286.12]
  wire [7:0] _T_1482; // @[Mux.scala 46:16:@1288.12]
  wire [7:0] _T_1484; // @[Mux.scala 46:16:@1290.12]
  wire [7:0] _T_1486; // @[Mux.scala 46:16:@1292.12]
  wire [7:0] _T_1488; // @[Mux.scala 46:16:@1294.12]
  wire [7:0] _T_1490; // @[Mux.scala 46:16:@1296.12]
  wire [7:0] _T_1492; // @[Mux.scala 46:16:@1298.12]
  wire [7:0] _T_1494; // @[Mux.scala 46:16:@1300.12]
  wire [7:0] _T_1496; // @[Mux.scala 46:16:@1302.12]
  wire [7:0] _T_1498; // @[Mux.scala 46:16:@1304.12]
  wire [7:0] _T_1500; // @[Mux.scala 46:16:@1306.12]
  wire [7:0] _T_1502; // @[Mux.scala 46:16:@1308.12]
  wire [7:0] _T_1504; // @[Mux.scala 46:16:@1310.12]
  wire [7:0] _T_1506; // @[Mux.scala 46:16:@1312.12]
  wire [7:0] _T_1508; // @[Mux.scala 46:16:@1314.12]
  wire [7:0] _T_1510; // @[Mux.scala 46:16:@1316.12]
  wire [7:0] _T_1512; // @[Mux.scala 46:16:@1318.12]
  wire  _T_1525; // @[apbuart.scala 568:36:@1336.14]
  wire  _T_1531; // @[apbuart.scala 568:45:@1341.14]
  wire  _T_1533; // @[apbuart.scala 568:104:@1342.14]
  wire  _T_1534; // @[apbuart.scala 568:86:@1343.14]
  wire [12:0] _GEN_117; // @[apbuart.scala 569:54:@1345.16]
  wire [12:0] _T_1535; // @[apbuart.scala 569:54:@1345.16]
  wire [12:0] _GEN_77; // @[apbuart.scala 568:117:@1344.14]
  wire [12:0] _GEN_80; // @[apbuart.scala 564:82:@1328.12]
  wire [1:0] _GEN_83; // @[apbuart.scala 533:118:@1265.10]
  wire [11:0] _GEN_85; // @[apbuart.scala 533:118:@1265.10]
  wire [12:0] _GEN_86; // @[apbuart.scala 533:118:@1265.10]
  wire [1:0] _GEN_87; // @[apbuart.scala 527:114:@1248.8]
  wire  _GEN_88; // @[apbuart.scala 527:114:@1248.8]
  wire [12:0] _GEN_89; // @[apbuart.scala 527:114:@1248.8]
  wire [11:0] _GEN_90; // @[apbuart.scala 527:114:@1248.8]
  wire [15:0] _GEN_91; // @[Conditional.scala 39:67:@1210.6]
  wire [3:0] _GEN_92; // @[Conditional.scala 39:67:@1210.6]
  wire [3:0] _GEN_93; // @[Conditional.scala 39:67:@1210.6]
  wire [1:0] _GEN_94; // @[Conditional.scala 39:67:@1210.6]
  wire  _GEN_95; // @[Conditional.scala 39:67:@1210.6]
  wire [12:0] _GEN_96; // @[Conditional.scala 39:67:@1210.6]
  wire [11:0] _GEN_97; // @[Conditional.scala 39:67:@1210.6]
  wire [1:0] _GEN_98; // @[Conditional.scala 40:58:@1194.4]
  wire [15:0] _GEN_99; // @[Conditional.scala 40:58:@1194.4]
  wire [15:0] _GEN_100; // @[Conditional.scala 40:58:@1194.4]
  wire [3:0] _GEN_101; // @[Conditional.scala 40:58:@1194.4]
  wire [3:0] _GEN_102; // @[Conditional.scala 40:58:@1194.4]
  wire [12:0] _GEN_103; // @[Conditional.scala 40:58:@1194.4]
  wire  _GEN_104; // @[Conditional.scala 40:58:@1194.4]
  wire [11:0] _GEN_105; // @[Conditional.scala 40:58:@1194.4]
  reg  _T_1540; // @[apbuart.scala 583:22:@1355.4]
  reg [31:0] _RAND_57;
  reg [2:0] _T_1543; // @[apbuart.scala 584:22:@1356.4]
  reg [31:0] _RAND_58;
  wire  _T_1544; // @[apbuart.scala 585:33:@1357.4]
  wire  _T_1545; // @[apbuart.scala 585:45:@1358.4]
  wire  _T_1546; // @[apbuart.scala 585:58:@1359.4]
  wire  _T_1547; // @[apbuart.scala 586:29:@1360.4]
  wire  _T_1548; // @[apbuart.scala 586:37:@1361.4]
  wire  _T_1549; // @[apbuart.scala 586:45:@1362.4]
  wire  _T_1552; // @[apbuart.scala 586:53:@1364.4]
  wire  _T_1555; // @[apbuart.scala 586:65:@1366.4]
  wire  _T_1558; // @[apbuart.scala 586:77:@1368.4]
  wire  _T_1561; // @[apbuart.scala 586:90:@1370.4]
  reg [1:0] _T_1564; // @[apbuart.scala 587:30:@1371.4]
  reg [31:0] _RAND_59;
  wire  _T_1566; // @[apbuart.scala 588:38:@1372.4]
  wire  _T_1569; // @[apbuart.scala 597:13:@1377.6]
  wire [2:0] _GEN_106; // @[apbuart.scala 603:31:@1391.12]
  wire [2:0] _GEN_107; // @[apbuart.scala 601:28:@1387.10]
  wire [2:0] _GEN_108; // @[apbuart.scala 599:34:@1383.8]
  wire [2:0] _GEN_109; // @[apbuart.scala 597:33:@1378.6]
  wire [2:0] _GEN_110; // @[apbuart.scala 595:31:@1373.4]
  wire  _T_1584; // @[apbuart.scala 610:63:@1402.4]
  wire  _T_1585; // @[apbuart.scala 610:45:@1403.4]
  wire [3:0] _T_1589; // @[Cat.scala 30:58:@1405.6]
  wire [31:0] _T_1592; // @[Cat.scala 30:58:@1408.6]
  wire  _T_1596; // @[apbuart.scala 614:39:@1414.6]
  wire  _T_1599; // @[apbuart.scala 614:61:@1416.6]
  wire  _T_1600; // @[apbuart.scala 614:83:@1417.6]
  wire [31:0] _GEN_111; // @[apbuart.scala 610:90:@1404.4]
  wire  _GEN_112; // @[apbuart.scala 610:90:@1404.4]
  wire  _T_1601; // @[apbuart.scala 620:35:@1420.4]
  wire  _T_1602; // @[apbuart.scala 620:55:@1421.4]
  wire  _T_1603; // @[apbuart.scala 620:75:@1422.4]
  wire  _T_1604; // @[apbuart.scala 620:95:@1423.4]
  wire  _T_1605; // @[apbuart.scala 620:115:@1424.4]
  wire  _T_1606; // @[apbuart.scala 620:135:@1425.4]
  wire  _T_1607; // @[apbuart.scala 620:155:@1426.4]
  wire  _T_1608; // @[apbuart.scala 620:175:@1427.4]
  wire [1:0] _T_1609; // @[Cat.scala 30:58:@1428.4]
  wire [1:0] _T_1610; // @[Cat.scala 30:58:@1429.4]
  wire [3:0] _T_1611; // @[Cat.scala 30:58:@1430.4]
  wire [1:0] _T_1612; // @[Cat.scala 30:58:@1431.4]
  wire [1:0] _T_1613; // @[Cat.scala 30:58:@1432.4]
  wire [3:0] _T_1614; // @[Cat.scala 30:58:@1433.4]
  wire [7:0] _T_1615; // @[Cat.scala 30:58:@1434.4]
  wire  _T_1627; // @[apbuart.scala 622:87:@1443.4]
  wire [31:0] _T_1632; // @[Cat.scala 30:58:@1446.6]
  wire [31:0] _T_1633; // @[apbuart.scala 623:31:@1447.6]
  wire  _T_1638; // @[apbuart.scala 624:31:@1450.6]
  wire [2:0] _T_1645; // @[apbuart.scala 630:89:@1457.6]
  wire [1:0] _T_1646; // @[apbuart.scala 630:89:@1458.6]
  wire [1:0] _T_1647; // @[apbuart.scala 630:44:@1459.6]
  wire [1:0] _T_1648; // @[apbuart.scala 630:30:@1460.6]
  wire [31:0] _GEN_113; // @[apbuart.scala 622:97:@1444.4]
  wire  _GEN_114; // @[apbuart.scala 622:97:@1444.4]
  wire [1:0] _GEN_115; // @[apbuart.scala 622:97:@1444.4]
  QueueModule_uart QueueModule ( // @[apbuart.scala 123:20:@149.4]
    .clock(QueueModule_clock),
    .reset(QueueModule_reset),
    .io_i_ready(QueueModule_io_i_ready),
    .io_i_valid(QueueModule_io_i_valid),
    .io_i_bits(QueueModule_io_i_bits),
    .io_o_ready(QueueModule_io_o_ready),
    .io_o_valid(QueueModule_io_o_valid),
    .io_o_bits(QueueModule_io_o_bits)
  );
  QueueModule_uart QueueModule_1 ( // @[apbuart.scala 124:20:@152.4]
    .clock(QueueModule_1_clock),
    .reset(QueueModule_1_reset),
    .io_i_ready(QueueModule_1_io_i_ready),
    .io_i_valid(QueueModule_1_io_i_valid),
    .io_i_bits(QueueModule_1_io_i_bits),
    .io_o_ready(QueueModule_1_io_o_ready),
    .io_o_valid(QueueModule_1_io_o_valid),
    .io_o_bits(QueueModule_1_io_o_bits)
  );
  assign _T_63 = io_PRESETn == 1'h0; // @[apbuart.scala 72:28:@141.4]
  assign _T_187 = io_PSEL & io_PWRITE; // @[apbuart.scala 195:15:@200.4]
  assign _T_189 = io_PENABLE == 1'h0; // @[apbuart.scala 195:31:@201.4]
  assign _T_190 = _T_187 & _T_189; // @[apbuart.scala 195:28:@202.4]
  assign _T_191 = io_PADDR[7:0]; // @[apbuart.scala 195:55:@203.4]
  assign _T_204 = _T_191 == 8'hc; // @[apbuart.scala 195:61:@204.4]
  assign _T_205 = _T_190 & _T_204; // @[apbuart.scala 195:43:@205.4]
  assign _T_206 = io_PWDATA[7]; // @[apbuart.scala 196:29:@207.6]
  assign _T_207 = io_PWDATA[6]; // @[apbuart.scala 197:29:@209.6]
  assign _T_208 = io_PWDATA[5]; // @[apbuart.scala 198:29:@211.6]
  assign _T_209 = io_PWDATA[4]; // @[apbuart.scala 199:29:@213.6]
  assign _T_210 = io_PWDATA[3]; // @[apbuart.scala 200:29:@215.6]
  assign _T_211 = io_PWDATA[2]; // @[apbuart.scala 201:29:@217.6]
  assign _T_212 = io_PWDATA[1:0]; // @[apbuart.scala 202:29:@219.6]
  assign _GEN_0 = _T_205 ? _T_206 : _T_136; // @[apbuart.scala 195:86:@206.4]
  assign _GEN_1 = _T_205 ? _T_207 : _T_139; // @[apbuart.scala 195:86:@206.4]
  assign _GEN_2 = _T_205 ? _T_208 : _T_142; // @[apbuart.scala 195:86:@206.4]
  assign _GEN_3 = _T_205 ? _T_209 : _T_145; // @[apbuart.scala 195:86:@206.4]
  assign _GEN_4 = _T_205 ? _T_210 : _T_148; // @[apbuart.scala 195:86:@206.4]
  assign _GEN_5 = _T_205 ? _T_211 : _T_151; // @[apbuart.scala 195:86:@206.4]
  assign _GEN_6 = _T_205 ? _T_212 : _T_154; // @[apbuart.scala 195:86:@206.4]
  assign _T_214 = io_PWRITE == 1'h0; // @[apbuart.scala 207:19:@222.4]
  assign _T_215 = io_PSEL & _T_214; // @[apbuart.scala 207:15:@223.4]
  assign _T_218 = _T_215 & _T_189; // @[apbuart.scala 207:30:@225.4]
  assign _T_221 = _T_218 & _T_204; // @[apbuart.scala 207:45:@228.4]
  assign _T_223 = {_T_151,_T_154}; // @[Cat.scala 30:58:@230.6]
  assign _T_224 = {_T_145,_T_148}; // @[Cat.scala 30:58:@231.6]
  assign _T_225 = {_T_224,_T_223}; // @[Cat.scala 30:58:@232.6]
  assign _T_226 = {_T_139,_T_142}; // @[Cat.scala 30:58:@233.6]
  assign _T_227 = {24'h0,_T_136}; // @[Cat.scala 30:58:@234.6]
  assign _T_228 = {_T_227,_T_226}; // @[Cat.scala 30:58:@235.6]
  assign _T_229 = {_T_228,_T_225}; // @[Cat.scala 30:58:@236.6]
  assign _GEN_7 = _T_221 ? _T_229 : _T_112; // @[apbuart.scala 207:88:@229.4]
  assign _T_235 = _T_191 == 8'h10; // @[apbuart.scala 212:61:@243.4]
  assign _T_236 = _T_190 & _T_235; // @[apbuart.scala 212:43:@244.4]
  assign _T_240 = io_PWDATA[1]; // @[apbuart.scala 216:30:@252.6]
  assign _T_241 = io_PWDATA[0]; // @[apbuart.scala 217:30:@254.6]
  assign _GEN_8 = _T_236 ? _T_209 : _T_76; // @[apbuart.scala 212:86:@245.4]
  assign _GEN_9 = _T_236 ? _T_210 : _T_82; // @[apbuart.scala 212:86:@245.4]
  assign _GEN_10 = _T_236 ? _T_211 : _T_79; // @[apbuart.scala 212:86:@245.4]
  assign _GEN_11 = _T_236 ? _T_240 : _T_85; // @[apbuart.scala 212:86:@245.4]
  assign _GEN_12 = _T_236 ? _T_241 : _T_88; // @[apbuart.scala 212:86:@245.4]
  assign _T_250 = _T_218 & _T_235; // @[apbuart.scala 219:45:@263.4]
  assign _T_252 = {_T_79,_T_85}; // @[Cat.scala 30:58:@265.6]
  assign _T_253 = {_T_252,_T_88}; // @[Cat.scala 30:58:@266.6]
  assign _T_254 = {27'h0,_T_76}; // @[Cat.scala 30:58:@267.6]
  assign _T_255 = {_T_254,_T_82}; // @[Cat.scala 30:58:@268.6]
  assign _T_256 = {_T_255,_T_253}; // @[Cat.scala 30:58:@269.6]
  assign _GEN_13 = _T_250 ? _T_256 : _GEN_7; // @[apbuart.scala 219:88:@264.4]
  assign _T_265 = _T_191 == 8'h1c; // @[apbuart.scala 230:61:@281.4]
  assign _T_266 = _T_190 & _T_265; // @[apbuart.scala 230:43:@282.4]
  assign _GEN_14 = _T_266 ? io_PWDATA : _T_259; // @[apbuart.scala 230:86:@283.4]
  assign _T_275 = _T_218 & _T_265; // @[apbuart.scala 233:45:@292.4]
  assign _GEN_15 = _T_275 ? _T_259 : _GEN_13; // @[apbuart.scala 233:88:@293.4]
  assign _T_287 = _T_191 == 8'h0; // @[apbuart.scala 241:61:@302.4]
  assign _T_288 = _T_190 & _T_287; // @[apbuart.scala 241:43:@303.4]
  assign _T_289 = _T_288 & _T_136; // @[apbuart.scala 241:86:@304.4]
  assign _T_290 = io_PWDATA[7:0]; // @[apbuart.scala 242:27:@306.6]
  assign _T_292 = {_T_281,_T_290}; // @[Cat.scala 30:58:@309.6]
  assign _GEN_16 = _T_289 ? _T_290 : _T_278; // @[apbuart.scala 241:95:@305.4]
  assign _GEN_17 = _T_289 ? _T_292 : _T_115; // @[apbuart.scala 241:95:@305.4]
  assign _T_301 = _T_218 & _T_287; // @[apbuart.scala 245:45:@318.4]
  assign _T_302 = _T_301 & _T_136; // @[apbuart.scala 245:88:@319.4]
  assign _T_304 = {24'h0,_T_278}; // @[Cat.scala 30:58:@321.6]
  assign _GEN_18 = _T_302 ? _T_304 : _GEN_15; // @[apbuart.scala 245:96:@320.4]
  assign _T_310 = _T_191 == 8'h4; // @[apbuart.scala 248:61:@328.4]
  assign _T_311 = _T_190 & _T_310; // @[apbuart.scala 248:43:@329.4]
  assign _T_312 = _T_311 & _T_136; // @[apbuart.scala 248:86:@330.4]
  assign _T_315 = {_T_290,_T_278}; // @[Cat.scala 30:58:@335.6]
  assign _GEN_19 = _T_312 ? _T_290 : _T_281; // @[apbuart.scala 248:95:@331.4]
  assign _GEN_20 = _T_312 ? _T_315 : _GEN_17; // @[apbuart.scala 248:95:@331.4]
  assign _T_324 = _T_218 & _T_310; // @[apbuart.scala 252:45:@344.4]
  assign _T_325 = _T_324 & _T_136; // @[apbuart.scala 252:88:@345.4]
  assign _T_327 = {24'h0,_T_281}; // @[Cat.scala 30:58:@347.6]
  assign _GEN_21 = _T_325 ? _T_327 : _GEN_18; // @[apbuart.scala 252:96:@346.4]
  assign _T_333 = {_T_210,_T_209}; // @[Cat.scala 30:58:@355.4]
  assign _T_334 = {_T_241,_T_240}; // @[Cat.scala 30:58:@356.4]
  assign _T_335 = {_T_334,_T_211}; // @[Cat.scala 30:58:@357.4]
  assign _T_336 = {_T_335,_T_333}; // @[Cat.scala 30:58:@358.4]
  assign _T_344 = {_T_333,_T_208}; // @[Cat.scala 30:58:@366.4]
  assign _T_347 = {_T_335,_T_344}; // @[Cat.scala 30:58:@369.4]
  assign _T_355 = {_T_209,_T_208}; // @[Cat.scala 30:58:@377.4]
  assign _T_356 = {_T_355,_T_207}; // @[Cat.scala 30:58:@378.4]
  assign _T_357 = {_T_211,_T_210}; // @[Cat.scala 30:58:@379.4]
  assign _T_359 = {_T_334,_T_357}; // @[Cat.scala 30:58:@381.4]
  assign _T_360 = {_T_359,_T_356}; // @[Cat.scala 30:58:@382.4]
  assign _T_369 = {_T_207,_T_206}; // @[Cat.scala 30:58:@391.4]
  assign _T_371 = {_T_355,_T_369}; // @[Cat.scala 30:58:@393.4]
  assign _T_375 = {_T_359,_T_371}; // @[Cat.scala 30:58:@397.4]
  assign _T_376 = {_T_148,_T_151}; // @[Cat.scala 30:58:@398.4]
  assign _T_377 = {_T_376,_T_154}; // @[Cat.scala 30:58:@399.4]
  assign _T_380 = {1'h0,_T_375}; // @[Cat.scala 30:58:@400.4]
  assign _T_381 = {_T_380,1'h1}; // @[Cat.scala 30:58:@401.4]
  assign _T_382 = {1'b0,$signed(_T_381)}; // @[apbuart.scala 279:113:@402.4]
  assign _T_386 = {1'h0,_T_336}; // @[Cat.scala 30:58:@403.4]
  assign _T_387 = {_T_386,1'h1}; // @[Cat.scala 30:58:@404.4]
  assign _T_388 = {1'b0,$signed(_T_387)}; // @[apbuart.scala 281:49:@405.4]
  assign _T_392 = {1'h0,_T_347}; // @[Cat.scala 30:58:@406.4]
  assign _T_393 = {_T_392,1'h1}; // @[Cat.scala 30:58:@407.4]
  assign _T_394 = {1'b0,$signed(_T_393)}; // @[apbuart.scala 282:49:@408.4]
  assign _T_398 = {1'h0,_T_360}; // @[Cat.scala 30:58:@409.4]
  assign _T_399 = {_T_398,1'h1}; // @[Cat.scala 30:58:@410.4]
  assign _T_400 = {1'b0,$signed(_T_399)}; // @[apbuart.scala 283:49:@411.4]
  assign _T_411 = {_T_386,2'h3}; // @[Cat.scala 30:58:@416.4]
  assign _T_412 = {1'b0,$signed(_T_411)}; // @[apbuart.scala 286:49:@417.4]
  assign _T_417 = {_T_392,2'h3}; // @[Cat.scala 30:58:@419.4]
  assign _T_418 = {1'b0,$signed(_T_417)}; // @[apbuart.scala 287:49:@420.4]
  assign _T_423 = {_T_398,2'h3}; // @[Cat.scala 30:58:@422.4]
  assign _T_424 = {1'b0,$signed(_T_423)}; // @[apbuart.scala 288:49:@423.4]
  assign _T_429 = {_T_380,2'h3}; // @[Cat.scala 30:58:@425.4]
  assign _T_430 = {1'b0,$signed(_T_429)}; // @[apbuart.scala 289:49:@426.4]
  assign _T_435 = _T_209 == 1'h0; // @[apbuart.scala 259:30:@428.4]
  assign _T_436 = _T_142 & _T_435; // @[apbuart.scala 259:27:@429.4]
  assign _T_438 = _T_436 & _T_210; // @[apbuart.scala 259:39:@431.4]
  assign _T_441 = io_PWDATA[4:0]; // @[apbuart.scala 261:41:@432.4]
  assign _T_442 = ^_T_441; // @[apbuart.scala 261:47:@433.4]
  assign _T_444 = _T_442 == 1'h0; // @[apbuart.scala 261:36:@434.4]
  assign _T_447 = _T_145 ? _T_444 : _T_442; // @[apbuart.scala 261:21:@437.4]
  assign _T_449 = io_PWDATA[5:0]; // @[apbuart.scala 262:41:@438.4]
  assign _T_450 = ^_T_449; // @[apbuart.scala 262:47:@439.4]
  assign _T_452 = _T_450 == 1'h0; // @[apbuart.scala 262:36:@440.4]
  assign _T_455 = _T_145 ? _T_452 : _T_450; // @[apbuart.scala 262:21:@443.4]
  assign _T_457 = io_PWDATA[6:0]; // @[apbuart.scala 263:41:@444.4]
  assign _T_458 = ^_T_457; // @[apbuart.scala 263:47:@445.4]
  assign _T_460 = _T_458 == 1'h0; // @[apbuart.scala 263:36:@446.4]
  assign _T_463 = _T_145 ? _T_460 : _T_458; // @[apbuart.scala 263:21:@449.4]
  assign _T_466 = ^_T_290; // @[apbuart.scala 264:47:@451.4]
  assign _T_468 = _T_466 == 1'h0; // @[apbuart.scala 264:36:@452.4]
  assign _T_471 = _T_145 ? _T_468 : _T_466; // @[apbuart.scala 264:21:@455.4]
  assign _T_472 = 2'h3 == _T_154; // @[Mux.scala 46:19:@456.4]
  assign _T_473 = _T_472 ? _T_471 : 1'h0; // @[Mux.scala 46:16:@457.4]
  assign _T_474 = 2'h2 == _T_154; // @[Mux.scala 46:19:@458.4]
  assign _T_475 = _T_474 ? _T_463 : _T_473; // @[Mux.scala 46:16:@459.4]
  assign _T_476 = 2'h1 == _T_154; // @[Mux.scala 46:19:@460.4]
  assign _T_477 = _T_476 ? _T_455 : _T_475; // @[Mux.scala 46:16:@461.4]
  assign _T_478 = 2'h0 == _T_154; // @[Mux.scala 46:19:@462.4]
  assign _T_479 = _T_478 ? _T_447 : _T_477; // @[Mux.scala 46:16:@463.4]
  assign _T_480 = _T_438 | _T_479; // @[apbuart.scala 266:24:@464.4]
  assign _T_482 = {_T_480,1'h1}; // @[Cat.scala 30:58:@465.4]
  assign _T_484 = {_T_386,_T_482}; // @[Cat.scala 30:58:@467.4]
  assign _T_485 = {1'b0,$signed(_T_484)}; // @[apbuart.scala 293:96:@468.4]
  assign _T_539 = {_T_392,_T_482}; // @[Cat.scala 30:58:@509.4]
  assign _T_540 = {1'b0,$signed(_T_539)}; // @[apbuart.scala 294:96:@510.4]
  assign _T_594 = {_T_398,_T_482}; // @[Cat.scala 30:58:@551.4]
  assign _T_595 = {1'b0,$signed(_T_594)}; // @[apbuart.scala 295:96:@552.4]
  assign _T_649 = {_T_380,_T_482}; // @[Cat.scala 30:58:@593.4]
  assign _T_650 = {1'b0,$signed(_T_649)}; // @[apbuart.scala 296:96:@594.4]
  assign _T_702 = {_T_480,2'h3}; // @[Cat.scala 30:58:@633.4]
  assign _T_704 = {_T_386,_T_702}; // @[Cat.scala 30:58:@635.4]
  assign _T_705 = {1'b0,$signed(_T_704)}; // @[apbuart.scala 299:96:@636.4]
  assign _T_759 = {_T_392,_T_702}; // @[Cat.scala 30:58:@677.4]
  assign _T_760 = {1'b0,$signed(_T_759)}; // @[apbuart.scala 300:96:@678.4]
  assign _T_814 = {_T_398,_T_702}; // @[Cat.scala 30:58:@719.4]
  assign _T_815 = {1'b0,$signed(_T_814)}; // @[apbuart.scala 301:96:@720.4]
  assign _T_869 = {_T_380,_T_702}; // @[Cat.scala 30:58:@761.4]
  assign _T_870 = {1'b0,$signed(_T_869)}; // @[apbuart.scala 302:96:@762.4]
  assign _T_871 = 4'hf == _T_377; // @[Mux.scala 46:19:@763.4]
  assign _T_872 = _T_871 ? $signed(_T_870) : $signed({{2{_T_382[10]}},_T_382}); // @[Mux.scala 46:16:@764.4]
  assign _T_873 = 4'he == _T_377; // @[Mux.scala 46:19:@765.4]
  assign _T_874 = _T_873 ? $signed({{1{_T_815[11]}},_T_815}) : $signed(_T_872); // @[Mux.scala 46:16:@766.4]
  assign _T_875 = 4'hd == _T_377; // @[Mux.scala 46:19:@767.4]
  assign _T_876 = _T_875 ? $signed({{2{_T_760[10]}},_T_760}) : $signed(_T_874); // @[Mux.scala 46:16:@768.4]
  assign _T_877 = 4'hc == _T_377; // @[Mux.scala 46:19:@769.4]
  assign _T_878 = _T_877 ? $signed({{3{_T_705[9]}},_T_705}) : $signed(_T_876); // @[Mux.scala 46:16:@770.4]
  assign _T_879 = 4'hb == _T_377; // @[Mux.scala 46:19:@771.4]
  assign _T_880 = _T_879 ? $signed({{1{_T_650[11]}},_T_650}) : $signed(_T_878); // @[Mux.scala 46:16:@772.4]
  assign _T_881 = 4'ha == _T_377; // @[Mux.scala 46:19:@773.4]
  assign _T_882 = _T_881 ? $signed({{2{_T_595[10]}},_T_595}) : $signed(_T_880); // @[Mux.scala 46:16:@774.4]
  assign _T_883 = 4'h9 == _T_377; // @[Mux.scala 46:19:@775.4]
  assign _T_884 = _T_883 ? $signed({{3{_T_540[9]}},_T_540}) : $signed(_T_882); // @[Mux.scala 46:16:@776.4]
  assign _T_885 = 4'h8 == _T_377; // @[Mux.scala 46:19:@777.4]
  assign _T_886 = _T_885 ? $signed({{4{_T_485[8]}},_T_485}) : $signed(_T_884); // @[Mux.scala 46:16:@778.4]
  assign _T_887 = 4'h7 == _T_377; // @[Mux.scala 46:19:@779.4]
  assign _T_888 = _T_887 ? $signed({{1{_T_430[11]}},_T_430}) : $signed(_T_886); // @[Mux.scala 46:16:@780.4]
  assign _T_889 = 4'h6 == _T_377; // @[Mux.scala 46:19:@781.4]
  assign _T_890 = _T_889 ? $signed({{2{_T_424[10]}},_T_424}) : $signed(_T_888); // @[Mux.scala 46:16:@782.4]
  assign _T_891 = 4'h5 == _T_377; // @[Mux.scala 46:19:@783.4]
  assign _T_892 = _T_891 ? $signed({{3{_T_418[9]}},_T_418}) : $signed(_T_890); // @[Mux.scala 46:16:@784.4]
  assign _T_893 = 4'h4 == _T_377; // @[Mux.scala 46:19:@785.4]
  assign _T_894 = _T_893 ? $signed({{4{_T_412[8]}},_T_412}) : $signed(_T_892); // @[Mux.scala 46:16:@786.4]
  assign _T_895 = 4'h3 == _T_377; // @[Mux.scala 46:19:@787.4]
  assign _T_896 = _T_895 ? $signed({{2{_T_382[10]}},_T_382}) : $signed(_T_894); // @[Mux.scala 46:16:@788.4]
  assign _T_897 = 4'h2 == _T_377; // @[Mux.scala 46:19:@789.4]
  assign _T_898 = _T_897 ? $signed({{3{_T_400[9]}},_T_400}) : $signed(_T_896); // @[Mux.scala 46:16:@790.4]
  assign _T_899 = 4'h1 == _T_377; // @[Mux.scala 46:19:@791.4]
  assign _T_900 = _T_899 ? $signed({{4{_T_394[8]}},_T_394}) : $signed(_T_898); // @[Mux.scala 46:16:@792.4]
  assign _T_901 = 4'h0 == _T_377; // @[Mux.scala 46:19:@793.4]
  assign _T_902 = _T_901 ? $signed({{5{_T_388[7]}},_T_388}) : $signed(_T_900); // @[Mux.scala 46:16:@794.4]
  assign _T_911 = _T_136 == 1'h0; // @[apbuart.scala 308:89:@801.4]
  assign _T_912 = _T_288 & _T_911; // @[apbuart.scala 308:86:@802.4]
  assign _T_914 = QueueModule_io_i_ready == 1'h0; // @[apbuart.scala 309:28:@804.6]
  assign _T_916 = $unsigned(_T_902); // @[apbuart.scala 309:59:@805.6]
  assign _T_917 = _T_914 ? 13'h0 : _T_916; // @[apbuart.scala 309:27:@806.6]
  assign _T_922 = _T_914 ? 1'h0 : 1'h1; // @[apbuart.scala 310:27:@809.6]
  assign _GEN_22 = _T_912 ? _T_917 : 13'h0; // @[apbuart.scala 308:96:@803.4]
  assign _GEN_23 = _T_912 ? _T_922 : 1'h0; // @[apbuart.scala 308:96:@803.4]
  assign _T_961 = _T_871 ? 4'hc : 4'ha; // @[Mux.scala 46:16:@819.4]
  assign _T_963 = _T_873 ? 4'hb : _T_961; // @[Mux.scala 46:16:@821.4]
  assign _T_965 = _T_875 ? 4'ha : _T_963; // @[Mux.scala 46:16:@823.4]
  assign _T_967 = _T_877 ? 4'h9 : _T_965; // @[Mux.scala 46:16:@825.4]
  assign _T_969 = _T_879 ? 4'hb : _T_967; // @[Mux.scala 46:16:@827.4]
  assign _T_971 = _T_881 ? 4'ha : _T_969; // @[Mux.scala 46:16:@829.4]
  assign _T_973 = _T_883 ? 4'h9 : _T_971; // @[Mux.scala 46:16:@831.4]
  assign _T_975 = _T_885 ? 4'h8 : _T_973; // @[Mux.scala 46:16:@833.4]
  assign _T_977 = _T_887 ? 4'hb : _T_975; // @[Mux.scala 46:16:@835.4]
  assign _T_979 = _T_889 ? 4'ha : _T_977; // @[Mux.scala 46:16:@837.4]
  assign _T_981 = _T_891 ? 4'h9 : _T_979; // @[Mux.scala 46:16:@839.4]
  assign _T_983 = _T_893 ? 4'h8 : _T_981; // @[Mux.scala 46:16:@841.4]
  assign _T_985 = _T_895 ? 4'ha : _T_983; // @[Mux.scala 46:16:@843.4]
  assign _T_987 = _T_897 ? 4'h9 : _T_985; // @[Mux.scala 46:16:@845.4]
  assign _T_989 = _T_899 ? 4'h8 : _T_987; // @[Mux.scala 46:16:@847.4]
  assign _T_991 = _T_901 ? 4'h7 : _T_989; // @[Mux.scala 46:16:@849.4]
  assign _T_1017 = QueueModule_io_o_valid == 1'h0; // @[apbuart.scala 357:14:@859.4]
  assign _T_1018 = _T_73 == 1'h0; // @[apbuart.scala 359:22:@861.4]
  assign _T_1019 = _T_71 == 2'h0; // @[apbuart.scala 361:27:@863.4]
  assign _T_1023 = _T_103[4]; // @[apbuart.scala 259:35:@866.4]
  assign _T_1025 = _T_1023 == 1'h0; // @[apbuart.scala 259:30:@867.4]
  assign _T_1026 = _T_142 & _T_1025; // @[apbuart.scala 259:27:@868.4]
  assign _T_1027 = _T_103[3]; // @[apbuart.scala 259:46:@869.4]
  assign _T_1028 = _T_1026 & _T_1027; // @[apbuart.scala 259:39:@870.4]
  assign _T_1031 = _T_103[4:0]; // @[apbuart.scala 261:41:@871.4]
  assign _T_1032 = ^_T_1031; // @[apbuart.scala 261:47:@872.4]
  assign _T_1034 = _T_1032 == 1'h0; // @[apbuart.scala 261:36:@873.4]
  assign _T_1037 = _T_145 ? _T_1034 : _T_1032; // @[apbuart.scala 261:21:@876.4]
  assign _T_1039 = _T_103[5:0]; // @[apbuart.scala 262:41:@877.4]
  assign _T_1040 = ^_T_1039; // @[apbuart.scala 262:47:@878.4]
  assign _T_1042 = _T_1040 == 1'h0; // @[apbuart.scala 262:36:@879.4]
  assign _T_1045 = _T_145 ? _T_1042 : _T_1040; // @[apbuart.scala 262:21:@882.4]
  assign _T_1047 = _T_103[6:0]; // @[apbuart.scala 263:41:@883.4]
  assign _T_1048 = ^_T_1047; // @[apbuart.scala 263:47:@884.4]
  assign _T_1050 = _T_1048 == 1'h0; // @[apbuart.scala 263:36:@885.4]
  assign _T_1053 = _T_145 ? _T_1050 : _T_1048; // @[apbuart.scala 263:21:@888.4]
  assign _T_1055 = _T_103[7:0]; // @[apbuart.scala 264:41:@889.4]
  assign _T_1056 = ^_T_1055; // @[apbuart.scala 264:47:@890.4]
  assign _T_1058 = _T_1056 == 1'h0; // @[apbuart.scala 264:36:@891.4]
  assign _T_1061 = _T_145 ? _T_1058 : _T_1056; // @[apbuart.scala 264:21:@894.4]
  assign _T_1063 = _T_472 ? _T_1061 : 1'h0; // @[Mux.scala 46:16:@896.4]
  assign _T_1065 = _T_474 ? _T_1053 : _T_1063; // @[Mux.scala 46:16:@898.4]
  assign _T_1067 = _T_476 ? _T_1045 : _T_1065; // @[Mux.scala 46:16:@900.4]
  assign _T_1069 = _T_478 ? _T_1037 : _T_1067; // @[Mux.scala 46:16:@902.4]
  assign _T_1070 = _T_1028 | _T_1069; // @[apbuart.scala 266:24:@903.4]
  assign _T_1071 = _T_186[2]; // @[apbuart.scala 366:49:@904.4]
  assign _T_1072 = _T_186[1]; // @[apbuart.scala 366:61:@905.4]
  assign _T_1073 = _T_151 ? _T_1071 : _T_1072; // @[apbuart.scala 366:28:@906.4]
  assign _T_1076 = _T_1071 == 1'h0; // @[apbuart.scala 367:41:@908.4]
  assign _T_1079 = _T_1072 == 1'h0; // @[apbuart.scala 367:57:@910.4]
  assign _T_1080 = _T_1076 | _T_1079; // @[apbuart.scala 367:54:@911.4]
  assign _T_1084 = _T_151 ? _T_1080 : _T_1079; // @[apbuart.scala 367:28:@914.4]
  assign _T_1092 = _T_191 == 8'h14; // @[apbuart.scala 369:63:@920.4]
  assign _T_1093 = _T_218 & _T_1092; // @[apbuart.scala 369:45:@921.4]
  assign _T_1095 = {_T_1012,_T_1015}; // @[Cat.scala 30:58:@923.6]
  assign _T_1096 = {_T_1003,_T_1009}; // @[Cat.scala 30:58:@924.6]
  assign _T_1097 = {_T_1096,_T_1095}; // @[Cat.scala 30:58:@925.6]
  assign _T_1098 = {QueueModule_1_io_o_valid,_T_1000}; // @[Cat.scala 30:58:@926.6]
  assign _T_1099 = {24'h0,_T_994}; // @[Cat.scala 30:58:@927.6]
  assign _T_1100 = {_T_1099,_T_997}; // @[Cat.scala 30:58:@928.6]
  assign _T_1101 = {_T_1100,_T_1098}; // @[Cat.scala 30:58:@929.6]
  assign _T_1102 = {_T_1101,_T_1097}; // @[Cat.scala 30:58:@930.6]
  assign _T_1109 = _T_1012 == 1'h0; // @[apbuart.scala 377:31:@939.6]
  assign _T_1111 = QueueModule_1_io_i_ready == 1'h0; // @[apbuart.scala 377:45:@940.6]
  assign _T_1112 = _T_1109 & _T_1111; // @[apbuart.scala 377:42:@941.6]
  assign _T_1113 = _T_1112 & _T_106; // @[apbuart.scala 377:64:@942.6]
  assign _T_1115 = _T_1113 ? 1'h1 : _T_1012; // @[apbuart.scala 377:30:@943.6]
  assign _T_1117 = _T_1003 == 1'h0; // @[apbuart.scala 378:31:@945.6]
  assign _T_1118 = _T_1117 & _T_106; // @[apbuart.scala 378:42:@946.6]
  assign _T_1120 = _T_186 == 12'h0; // @[apbuart.scala 378:67:@947.6]
  assign _T_1121 = _T_1118 & _T_1120; // @[apbuart.scala 378:55:@948.6]
  assign _T_1123 = _T_1121 ? 1'h1 : _T_1003; // @[apbuart.scala 378:30:@949.6]
  assign _T_1125 = _T_1009 == 1'h0; // @[apbuart.scala 379:31:@951.6]
  assign _T_1126 = _T_1125 & _T_106; // @[apbuart.scala 379:42:@952.6]
  assign _T_1127 = _T_1070 != _T_1073; // @[apbuart.scala 379:77:@953.6]
  assign _T_1128 = _T_1126 & _T_1127; // @[apbuart.scala 379:55:@954.6]
  assign _T_1130 = _T_1128 ? 1'h1 : _T_1009; // @[apbuart.scala 379:30:@955.6]
  assign _T_1132 = _T_1006 == 1'h0; // @[apbuart.scala 380:31:@957.6]
  assign _T_1133 = _T_1132 & _T_106; // @[apbuart.scala 380:42:@958.6]
  assign _T_1134 = _T_1133 & _T_1084; // @[apbuart.scala 380:55:@959.6]
  assign _T_1136 = _T_1134 ? 1'h1 : _T_1006; // @[apbuart.scala 380:30:@960.6]
  assign _T_1138 = _T_997 == 1'h0; // @[apbuart.scala 381:31:@962.6]
  assign _T_1139 = _T_1138 & _T_106; // @[apbuart.scala 381:41:@963.6]
  assign _T_1144 = _T_1111 | _T_1120; // @[apbuart.scala 381:79:@966.6]
  assign _T_1147 = _T_1144 | _T_1127; // @[apbuart.scala 381:102:@969.6]
  assign _T_1148 = _T_1147 | _T_1084; // @[apbuart.scala 381:155:@970.6]
  assign _T_1149 = _T_1139 & _T_1148; // @[apbuart.scala 381:54:@971.6]
  assign _T_1151 = _T_1149 ? 1'h1 : _T_997; // @[apbuart.scala 381:30:@972.6]
  assign _GEN_24 = _T_1093 ? _T_1102 : _GEN_21; // @[apbuart.scala 369:90:@922.4]
  assign _GEN_25 = _T_1093 ? 1'h0 : _T_1115; // @[apbuart.scala 369:90:@922.4]
  assign _GEN_26 = _T_1093 ? 1'h0 : _T_1123; // @[apbuart.scala 369:90:@922.4]
  assign _GEN_27 = _T_1093 ? 1'h0 : _T_1130; // @[apbuart.scala 369:90:@922.4]
  assign _GEN_28 = _T_1093 ? 1'h0 : _T_1136; // @[apbuart.scala 369:90:@922.4]
  assign _GEN_29 = _T_1093 ? 1'h0 : _T_1151; // @[apbuart.scala 369:90:@922.4]
  assign _T_1186 = _T_1160 == 1'h0; // @[apbuart.scala 406:14:@991.4]
  assign _T_1187 = _T_1157 & _T_1186; // @[apbuart.scala 406:11:@992.4]
  assign _T_1190 = _T_1157 == 1'h0; // @[apbuart.scala 408:22:@997.6]
  assign _T_1191 = _T_1160 & _T_1190; // @[apbuart.scala 408:19:@998.6]
  assign _GEN_30 = _T_1191 ? 1'h0 : _T_1163; // @[apbuart.scala 408:29:@999.6]
  assign _GEN_31 = _T_1187 ? 1'h1 : _GEN_30; // @[apbuart.scala 406:21:@993.4]
  assign _T_1193 = _T_1175 != io_dcdn; // @[apbuart.scala 414:18:@1005.4]
  assign _T_1195 = _T_1193 ? 1'h1 : _T_1166; // @[apbuart.scala 414:12:@1006.4]
  assign _T_1196 = _T_1178 != io_dsrn; // @[apbuart.scala 415:18:@1008.4]
  assign _T_1198 = _T_1196 ? 1'h1 : _T_1169; // @[apbuart.scala 415:12:@1009.4]
  assign _T_1199 = _T_1181 != io_ctsn; // @[apbuart.scala 416:18:@1011.4]
  assign _T_1201 = _T_1199 ? 1'h1 : _T_1172; // @[apbuart.scala 416:12:@1012.4]
  assign _T_1209 = _T_191 == 8'h18; // @[apbuart.scala 418:63:@1019.4]
  assign _T_1210 = _T_218 & _T_1209; // @[apbuart.scala 418:45:@1020.4]
  assign _T_1213 = io_dcdn == 1'h0; // @[apbuart.scala 419:34:@1022.6]
  assign _T_1215 = io_rin == 1'h0; // @[apbuart.scala 419:43:@1023.6]
  assign _T_1217 = io_dsrn == 1'h0; // @[apbuart.scala 419:51:@1024.6]
  assign _T_1219 = io_ctsn == 1'h0; // @[apbuart.scala 419:60:@1025.6]
  assign _T_1220 = {_T_1169,_T_1172}; // @[Cat.scala 30:58:@1026.6]
  assign _T_1221 = {_T_1166,_T_1163}; // @[Cat.scala 30:58:@1027.6]
  assign _T_1222 = {_T_1221,_T_1220}; // @[Cat.scala 30:58:@1028.6]
  assign _T_1223 = {_T_1217,_T_1219}; // @[Cat.scala 30:58:@1029.6]
  assign _T_1224 = {24'h0,_T_1213}; // @[Cat.scala 30:58:@1030.6]
  assign _T_1225 = {_T_1224,_T_1215}; // @[Cat.scala 30:58:@1031.6]
  assign _T_1226 = {_T_1225,_T_1223}; // @[Cat.scala 30:58:@1032.6]
  assign _T_1227 = {_T_1226,_T_1222}; // @[Cat.scala 30:58:@1033.6]
  assign _GEN_32 = _T_1210 ? _T_1227 : _GEN_24; // @[apbuart.scala 418:90:@1021.4]
  assign _T_1228 = _T_136 | _T_139; // @[apbuart.scala 428:11:@1040.4]
  assign _T_1231 = _T_139 ? 1'h0 : 1'h1; // @[apbuart.scala 429:29:@1042.6]
  assign _T_1235 = 2'h0 == _T_71; // @[Conditional.scala 37:30:@1051.6]
  assign _T_1240 = _T_1017 ? 1'h0 : 1'h1; // @[apbuart.scala 440:37:@1054.8]
  assign _T_1243 = _T_1017 ? 2'h0 : 2'h2; // @[apbuart.scala 441:37:@1057.8]
  assign _T_1250 = 2'h2 == _T_71; // @[Conditional.scala 37:30:@1068.8]
  assign _T_1253 = 2'h1 == _T_71; // @[Conditional.scala 37:30:@1076.10]
  assign _T_1257 = _T_100[6]; // @[apbuart.scala 459:62:@1080.12]
  assign _T_1259 = _T_100[7]; // @[apbuart.scala 460:62:@1081.12]
  assign _T_1261 = _T_100[8]; // @[apbuart.scala 461:62:@1082.12]
  assign _T_1263 = _T_100[9]; // @[apbuart.scala 462:62:@1083.12]
  assign _T_1265 = _T_100[10]; // @[apbuart.scala 463:62:@1084.12]
  assign _T_1267 = _T_100[11]; // @[apbuart.scala 464:62:@1085.12]
  assign _T_1268 = 4'hc == _T_177; // @[Mux.scala 46:19:@1086.12]
  assign _T_1269 = _T_1268 ? _T_1267 : 1'h0; // @[Mux.scala 46:16:@1087.12]
  assign _T_1270 = 4'hb == _T_177; // @[Mux.scala 46:19:@1088.12]
  assign _T_1271 = _T_1270 ? _T_1265 : _T_1269; // @[Mux.scala 46:16:@1089.12]
  assign _T_1272 = 4'ha == _T_177; // @[Mux.scala 46:19:@1090.12]
  assign _T_1273 = _T_1272 ? _T_1263 : _T_1271; // @[Mux.scala 46:16:@1091.12]
  assign _T_1274 = 4'h9 == _T_177; // @[Mux.scala 46:19:@1092.12]
  assign _T_1275 = _T_1274 ? _T_1261 : _T_1273; // @[Mux.scala 46:16:@1093.12]
  assign _T_1276 = 4'h8 == _T_177; // @[Mux.scala 46:19:@1094.12]
  assign _T_1277 = _T_1276 ? _T_1259 : _T_1275; // @[Mux.scala 46:16:@1095.12]
  assign _T_1278 = 4'h7 == _T_177; // @[Mux.scala 46:19:@1096.12]
  assign _T_1279 = _T_1278 ? _T_1257 : _T_1277; // @[Mux.scala 46:16:@1097.12]
  assign _T_1281 = _T_121 + 16'h1; // @[apbuart.scala 466:48:@1099.12]
  assign _T_1282 = _T_1281[15:0]; // @[apbuart.scala 466:48:@1100.12]
  assign _T_1284 = 2'h3 == _T_71; // @[Conditional.scala 37:30:@1106.12]
  assign _T_1286 = _T_118 - 16'h1; // @[apbuart.scala 472:67:@1108.14]
  assign _T_1287 = $unsigned(_T_1286); // @[apbuart.scala 472:67:@1109.14]
  assign _T_1288 = _T_1287[15:0]; // @[apbuart.scala 472:67:@1110.14]
  assign _T_1289 = _T_121 == _T_1288; // @[apbuart.scala 472:51:@1111.14]
  assign _T_1294 = _T_1289 ? 16'h0 : _T_1282; // @[apbuart.scala 472:37:@1114.14]
  assign _T_1301 = _T_124 == 4'hf; // @[apbuart.scala 473:91:@1120.14]
  assign _T_1304 = _T_124 + 4'h1; // @[apbuart.scala 473:117:@1121.14]
  assign _T_1305 = _T_1304[3:0]; // @[apbuart.scala 473:117:@1122.14]
  assign _T_1306 = _T_1301 ? 4'h0 : _T_1305; // @[apbuart.scala 473:77:@1123.14]
  assign _T_1307 = _T_1289 ? _T_1306 : _T_124; // @[apbuart.scala 473:37:@1124.14]
  assign _T_1315 = _T_1301 & _T_1289; // @[apbuart.scala 475:47:@1131.14]
  assign _GEN_116 = {{1'd0}, _T_100}; // @[apbuart.scala 476:54:@1133.16]
  assign _T_1316 = _GEN_116 << 1; // @[apbuart.scala 476:54:@1133.16]
  assign _GEN_37 = _T_1315 ? _T_1316 : {{1'd0}, _T_100}; // @[apbuart.scala 475:90:@1132.14]
  assign _T_1326 = _T_180 == 4'h1; // @[apbuart.scala 481:104:@1145.14]
  assign _T_1327 = _T_1315 & _T_1326; // @[apbuart.scala 481:88:@1146.14]
  assign _T_1338 = _T_180 - 4'h1; // @[apbuart.scala 487:122:@1160.16]
  assign _T_1339 = $unsigned(_T_1338); // @[apbuart.scala 487:122:@1161.16]
  assign _T_1340 = _T_1339[3:0]; // @[apbuart.scala 487:122:@1162.16]
  assign _T_1341 = _T_1315 ? _T_1340 : _T_180; // @[apbuart.scala 487:43:@1163.16]
  assign _GEN_38 = _T_1327 ? 2'h0 : 2'h3; // @[apbuart.scala 481:114:@1147.14]
  assign _GEN_39 = _T_1327 ? 1'h1 : _T_1279; // @[apbuart.scala 481:114:@1147.14]
  assign _GEN_40 = _T_1327 ? _T_177 : _T_1341; // @[apbuart.scala 481:114:@1147.14]
  assign _GEN_41 = _T_1284 ? _T_1294 : _T_121; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_42 = _T_1284 ? _T_1307 : _T_124; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_43 = _T_1284 ? _GEN_37 : {{1'd0}, _T_100}; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_44 = _T_1284 ? _GEN_38 : _T_71; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_45 = _T_1284 ? _GEN_39 : _T_172; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_46 = _T_1284 ? _GEN_40 : _T_180; // @[Conditional.scala 39:67:@1107.12]
  assign _GEN_47 = _T_1253 ? 2'h3 : _GEN_44; // @[Conditional.scala 39:67:@1077.10]
  assign _GEN_48 = _T_1253 ? 1'h0 : _T_97; // @[Conditional.scala 39:67:@1077.10]
  assign _GEN_49 = _T_1253 ? _T_1279 : _GEN_45; // @[Conditional.scala 39:67:@1077.10]
  assign _GEN_50 = _T_1253 ? _T_1282 : _GEN_41; // @[Conditional.scala 39:67:@1077.10]
  assign _GEN_51 = _T_1253 ? 4'h0 : _GEN_42; // @[Conditional.scala 39:67:@1077.10]
  assign _GEN_52 = _T_1253 ? _T_177 : _GEN_46; // @[Conditional.scala 39:67:@1077.10]
  assign _GEN_53 = _T_1253 ? {{1'd0}, _T_100} : _GEN_43; // @[Conditional.scala 39:67:@1077.10]
  assign _GEN_54 = _T_1250 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67:@1069.8]
  assign _GEN_55 = _T_1250 ? {{1'd0}, QueueModule_io_o_bits} : _GEN_53; // @[Conditional.scala 39:67:@1069.8]
  assign _GEN_56 = _T_1250 ? 2'h1 : _GEN_47; // @[Conditional.scala 39:67:@1069.8]
  assign _GEN_57 = _T_1250 ? 1'h1 : _GEN_49; // @[Conditional.scala 39:67:@1069.8]
  assign _GEN_58 = _T_1250 ? _T_121 : _GEN_50; // @[Conditional.scala 39:67:@1069.8]
  assign _GEN_59 = _T_1250 ? _T_124 : _GEN_51; // @[Conditional.scala 39:67:@1069.8]
  assign _GEN_60 = _T_1250 ? _T_180 : _GEN_52; // @[Conditional.scala 39:67:@1069.8]
  assign _GEN_61 = _T_1235 ? _T_1240 : _GEN_54; // @[Conditional.scala 40:58:@1052.6]
  assign _GEN_62 = _T_1235 ? _T_1243 : _GEN_56; // @[Conditional.scala 40:58:@1052.6]
  assign _GEN_63 = _T_1235 ? _T_1231 : _GEN_57; // @[Conditional.scala 40:58:@1052.6]
  assign _GEN_64 = _T_1235 ? _T_115 : _T_118; // @[Conditional.scala 40:58:@1052.6]
  assign _GEN_65 = _T_1235 ? 16'h0 : _GEN_58; // @[Conditional.scala 40:58:@1052.6]
  assign _GEN_66 = _T_1235 ? 4'h0 : _GEN_59; // @[Conditional.scala 40:58:@1052.6]
  assign _GEN_67 = _T_1235 ? _T_177 : _GEN_60; // @[Conditional.scala 40:58:@1052.6]
  assign _GEN_68 = _T_1235 ? 13'h0 : _GEN_55; // @[Conditional.scala 40:58:@1052.6]
  assign _GEN_69 = _T_1228 ? _T_1231 : _GEN_63; // @[apbuart.scala 428:24:@1041.4]
  assign _GEN_70 = _T_1228 ? 1'h0 : _GEN_61; // @[apbuart.scala 428:24:@1041.4]
  assign _GEN_71 = _T_1228 ? 2'h0 : _GEN_62; // @[apbuart.scala 428:24:@1041.4]
  assign _GEN_72 = _T_1228 ? _T_115 : _GEN_64; // @[apbuart.scala 428:24:@1041.4]
  assign _GEN_73 = _T_1228 ? 16'h0 : _GEN_65; // @[apbuart.scala 428:24:@1041.4]
  assign _GEN_74 = _T_1228 ? 4'h0 : _GEN_66; // @[apbuart.scala 428:24:@1041.4]
  assign _GEN_75 = _T_1228 ? _T_180 : _GEN_67; // @[apbuart.scala 428:24:@1041.4]
  assign _GEN_76 = _T_1228 ? {{1'd0}, _T_100} : _GEN_68; // @[apbuart.scala 428:24:@1041.4]
  assign _T_1367 = _T_76 ? _T_172 : io_rxd; // @[apbuart.scala 505:12:@1187.4]
  assign _T_1369 = _T_157 == 1'h0; // @[apbuart.scala 508:25:@1191.4]
  assign _T_1370 = _T_160 & _T_1369; // @[apbuart.scala 508:22:@1192.4]
  assign _T_1371 = 1'h0 == _T_73; // @[Conditional.scala 37:30:@1193.4]
  assign _T_1373 = _T_169 == 1'h0; // @[apbuart.scala 512:43:@1195.6]
  assign _T_1374 = _T_1370 | _T_1373; // @[apbuart.scala 512:40:@1196.6]
  assign _T_1385 = _T_127 - 16'h1; // @[apbuart.scala 523:59:@1211.8]
  assign _T_1386 = $unsigned(_T_1385); // @[apbuart.scala 523:59:@1212.8]
  assign _T_1387 = _T_1386[15:0]; // @[apbuart.scala 523:59:@1213.8]
  assign _T_1388 = _T_130 == _T_1387; // @[apbuart.scala 523:43:@1214.8]
  assign _T_1391 = _T_130 + 16'h1; // @[apbuart.scala 523:83:@1215.8]
  assign _T_1392 = _T_1391[15:0]; // @[apbuart.scala 523:83:@1216.8]
  assign _T_1393 = _T_1388 ? 16'h0 : _T_1392; // @[apbuart.scala 523:29:@1217.8]
  assign _T_1400 = _T_133 == 4'hf; // @[apbuart.scala 524:83:@1223.8]
  assign _T_1403 = _T_133 + 4'h1; // @[apbuart.scala 524:109:@1224.8]
  assign _T_1404 = _T_1403[3:0]; // @[apbuart.scala 524:109:@1225.8]
  assign _T_1405 = _T_1400 ? 4'h0 : _T_1404; // @[apbuart.scala 524:69:@1226.8]
  assign _T_1406 = _T_1388 ? _T_1405 : _T_133; // @[apbuart.scala 524:29:@1227.8]
  assign _T_1414 = _T_1400 & _T_1388; // @[apbuart.scala 525:55:@1234.8]
  assign _T_1416 = _T_163 - 4'h1; // @[apbuart.scala 525:108:@1235.8]
  assign _T_1417 = $unsigned(_T_1416); // @[apbuart.scala 525:108:@1236.8]
  assign _T_1418 = _T_1417[3:0]; // @[apbuart.scala 525:108:@1237.8]
  assign _T_1419 = _T_1414 ? _T_1418 : _T_163; // @[apbuart.scala 525:29:@1238.8]
  assign _T_1421 = _T_133 == 4'h7; // @[apbuart.scala 527:29:@1240.8]
  assign _T_1427 = _T_1421 & _T_1388; // @[apbuart.scala 527:38:@1245.8]
  assign _T_1428 = _T_163 == _T_177; // @[apbuart.scala 527:95:@1246.8]
  assign _T_1429 = _T_1427 & _T_1428; // @[apbuart.scala 527:79:@1247.8]
  assign _T_1430 = _T_169 ? 2'h0 : 2'h1; // @[apbuart.scala 528:46:@1249.10]
  assign _T_1432 = _T_103[11:1]; // @[apbuart.scala 530:58:@1252.10]
  assign _T_1433 = {_T_1432,_T_169}; // @[Cat.scala 30:58:@1253.10]
  assign _T_1443 = _T_163 == 4'h1; // @[apbuart.scala 533:105:@1263.10]
  assign _T_1444 = _T_1414 & _T_1443; // @[apbuart.scala 533:87:@1264.10]
  assign _T_1450 = _T_103[5:1]; // @[apbuart.scala 540:55:@1271.12]
  assign _T_1452 = _T_103[6:1]; // @[apbuart.scala 541:55:@1272.12]
  assign _T_1454 = _T_103[7:1]; // @[apbuart.scala 542:55:@1273.12]
  assign _T_1456 = _T_103[8:1]; // @[apbuart.scala 543:55:@1274.12]
  assign _T_1458 = _T_103[6:2]; // @[apbuart.scala 545:55:@1275.12]
  assign _T_1460 = _T_103[7:2]; // @[apbuart.scala 546:55:@1276.12]
  assign _T_1462 = _T_103[8:2]; // @[apbuart.scala 547:55:@1277.12]
  assign _T_1464 = _T_103[9:2]; // @[apbuart.scala 548:55:@1278.12]
  assign _T_1474 = _T_103[7:3]; // @[apbuart.scala 558:55:@1283.12]
  assign _T_1476 = _T_103[8:3]; // @[apbuart.scala 559:55:@1284.12]
  assign _T_1478 = _T_103[9:3]; // @[apbuart.scala 560:55:@1285.12]
  assign _T_1480 = _T_103[10:3]; // @[apbuart.scala 561:55:@1286.12]
  assign _T_1482 = _T_871 ? _T_1480 : 8'h0; // @[Mux.scala 46:16:@1288.12]
  assign _T_1484 = _T_873 ? {{1'd0}, _T_1478} : _T_1482; // @[Mux.scala 46:16:@1290.12]
  assign _T_1486 = _T_875 ? {{2'd0}, _T_1476} : _T_1484; // @[Mux.scala 46:16:@1292.12]
  assign _T_1488 = _T_877 ? {{3'd0}, _T_1474} : _T_1486; // @[Mux.scala 46:16:@1294.12]
  assign _T_1490 = _T_879 ? _T_1464 : _T_1488; // @[Mux.scala 46:16:@1296.12]
  assign _T_1492 = _T_881 ? {{1'd0}, _T_1462} : _T_1490; // @[Mux.scala 46:16:@1298.12]
  assign _T_1494 = _T_883 ? {{2'd0}, _T_1460} : _T_1492; // @[Mux.scala 46:16:@1300.12]
  assign _T_1496 = _T_885 ? {{3'd0}, _T_1458} : _T_1494; // @[Mux.scala 46:16:@1302.12]
  assign _T_1498 = _T_887 ? _T_1464 : _T_1496; // @[Mux.scala 46:16:@1304.12]
  assign _T_1500 = _T_889 ? {{1'd0}, _T_1462} : _T_1498; // @[Mux.scala 46:16:@1306.12]
  assign _T_1502 = _T_891 ? {{2'd0}, _T_1460} : _T_1500; // @[Mux.scala 46:16:@1308.12]
  assign _T_1504 = _T_893 ? {{3'd0}, _T_1458} : _T_1502; // @[Mux.scala 46:16:@1310.12]
  assign _T_1506 = _T_895 ? _T_1456 : _T_1504; // @[Mux.scala 46:16:@1312.12]
  assign _T_1508 = _T_897 ? {{1'd0}, _T_1454} : _T_1506; // @[Mux.scala 46:16:@1314.12]
  assign _T_1510 = _T_899 ? {{2'd0}, _T_1452} : _T_1508; // @[Mux.scala 46:16:@1316.12]
  assign _T_1512 = _T_901 ? {{3'd0}, _T_1450} : _T_1510; // @[Mux.scala 46:16:@1318.12]
  assign _T_1525 = _T_133 == 4'h8; // @[apbuart.scala 568:36:@1336.14]
  assign _T_1531 = _T_1525 & _T_1388; // @[apbuart.scala 568:45:@1341.14]
  assign _T_1533 = _T_163 != 4'h1; // @[apbuart.scala 568:104:@1342.14]
  assign _T_1534 = _T_1531 & _T_1533; // @[apbuart.scala 568:86:@1343.14]
  assign _GEN_117 = {{1'd0}, _T_103}; // @[apbuart.scala 569:54:@1345.16]
  assign _T_1535 = _GEN_117 << 1; // @[apbuart.scala 569:54:@1345.16]
  assign _GEN_77 = _T_1534 ? _T_1535 : {{1'd0}, _T_103}; // @[apbuart.scala 568:117:@1344.14]
  assign _GEN_80 = _T_1427 ? {{1'd0}, _T_1433} : _GEN_77; // @[apbuart.scala 564:82:@1328.12]
  assign _GEN_83 = _T_1444 ? 2'h0 : 2'h1; // @[apbuart.scala 533:118:@1265.10]
  assign _GEN_85 = _T_1444 ? _T_103 : _T_186; // @[apbuart.scala 533:118:@1265.10]
  assign _GEN_86 = _T_1444 ? {{5'd0}, _T_1512} : _GEN_80; // @[apbuart.scala 533:118:@1265.10]
  assign _GEN_87 = _T_1429 ? _T_1430 : _GEN_83; // @[apbuart.scala 527:114:@1248.8]
  assign _GEN_88 = _T_1429 ? 1'h0 : _T_1444; // @[apbuart.scala 527:114:@1248.8]
  assign _GEN_89 = _T_1429 ? {{1'd0}, _T_1433} : _GEN_86; // @[apbuart.scala 527:114:@1248.8]
  assign _GEN_90 = _T_1429 ? _T_186 : _GEN_85; // @[apbuart.scala 527:114:@1248.8]
  assign _GEN_91 = _T_73 ? _T_1393 : _T_130; // @[Conditional.scala 39:67:@1210.6]
  assign _GEN_92 = _T_73 ? _T_1406 : _T_133; // @[Conditional.scala 39:67:@1210.6]
  assign _GEN_93 = _T_73 ? _T_1419 : _T_163; // @[Conditional.scala 39:67:@1210.6]
  assign _GEN_94 = _T_73 ? _GEN_87 : {{1'd0}, _T_73}; // @[Conditional.scala 39:67:@1210.6]
  assign _GEN_95 = _T_73 ? _GEN_88 : _T_106; // @[Conditional.scala 39:67:@1210.6]
  assign _GEN_96 = _T_73 ? _GEN_89 : {{1'd0}, _T_103}; // @[Conditional.scala 39:67:@1210.6]
  assign _GEN_97 = _T_73 ? _GEN_90 : _T_186; // @[Conditional.scala 39:67:@1210.6]
  assign _GEN_98 = _T_1371 ? {{1'd0}, _T_1374} : _GEN_94; // @[Conditional.scala 40:58:@1194.4]
  assign _GEN_99 = _T_1371 ? _T_115 : _T_127; // @[Conditional.scala 40:58:@1194.4]
  assign _GEN_100 = _T_1371 ? {{15'd0}, _T_1370} : _GEN_91; // @[Conditional.scala 40:58:@1194.4]
  assign _GEN_101 = _T_1371 ? 4'h0 : _GEN_92; // @[Conditional.scala 40:58:@1194.4]
  assign _GEN_102 = _T_1371 ? _T_177 : _GEN_93; // @[Conditional.scala 40:58:@1194.4]
  assign _GEN_103 = _T_1371 ? 13'h0 : _GEN_96; // @[Conditional.scala 40:58:@1194.4]
  assign _GEN_104 = _T_1371 ? 1'h0 : _GEN_95; // @[Conditional.scala 40:58:@1194.4]
  assign _GEN_105 = _T_1371 ? 12'h0 : _GEN_97; // @[Conditional.scala 40:58:@1194.4]
  assign _T_1544 = _T_1003 | _T_1006; // @[apbuart.scala 585:33:@1357.4]
  assign _T_1545 = _T_1544 | _T_1009; // @[apbuart.scala 585:45:@1358.4]
  assign _T_1546 = _T_1545 | _T_1012; // @[apbuart.scala 585:58:@1359.4]
  assign _T_1547 = _T_1163 | _T_1175; // @[apbuart.scala 586:29:@1360.4]
  assign _T_1548 = _T_1547 | _T_1169; // @[apbuart.scala 586:37:@1361.4]
  assign _T_1549 = _T_1548 | _T_1172; // @[apbuart.scala 586:45:@1362.4]
  assign _T_1552 = _T_1549 | _T_1213; // @[apbuart.scala 586:53:@1364.4]
  assign _T_1555 = _T_1552 | _T_1217; // @[apbuart.scala 586:65:@1366.4]
  assign _T_1558 = _T_1555 | _T_1219; // @[apbuart.scala 586:77:@1368.4]
  assign _T_1561 = _T_1558 | _T_1215; // @[apbuart.scala 586:90:@1370.4]
  assign _T_1566 = _T_1564 == 2'h3; // @[apbuart.scala 588:38:@1372.4]
  assign _T_1569 = QueueModule_1_io_o_valid == 1'h0; // @[apbuart.scala 597:13:@1377.6]
  assign _GEN_106 = _T_1561 ? 3'h0 : 3'h5; // @[apbuart.scala 603:31:@1391.12]
  assign _GEN_107 = _T_1566 ? 3'h6 : _GEN_106; // @[apbuart.scala 601:28:@1387.10]
  assign _GEN_108 = _T_1017 ? 3'h1 : _GEN_107; // @[apbuart.scala 599:34:@1383.8]
  assign _GEN_109 = _T_1569 ? 3'h2 : _GEN_108; // @[apbuart.scala 597:33:@1378.6]
  assign _GEN_110 = _T_1546 ? 3'h3 : _GEN_109; // @[apbuart.scala 595:31:@1373.4]
  assign _T_1584 = _T_191 == 8'h8; // @[apbuart.scala 610:63:@1402.4]
  assign _T_1585 = _T_218 & _T_1584; // @[apbuart.scala 610:45:@1403.4]
  assign _T_1589 = {_T_1543,_T_1540}; // @[Cat.scala 30:58:@1405.6]
  assign _T_1592 = {28'hc,_T_1589}; // @[Cat.scala 30:58:@1408.6]
  assign _T_1596 = _T_1546 | _T_1569; // @[apbuart.scala 614:39:@1414.6]
  assign _T_1599 = _T_1596 | _T_1017; // @[apbuart.scala 614:61:@1416.6]
  assign _T_1600 = _T_1599 | _T_1561; // @[apbuart.scala 614:83:@1417.6]
  assign _GEN_111 = _T_1585 ? _T_1592 : _GEN_32; // @[apbuart.scala 610:90:@1404.4]
  assign _GEN_112 = _T_1585 ? 1'h0 : _T_1600; // @[apbuart.scala 610:90:@1404.4]
  assign _T_1601 = QueueModule_1_io_o_bits[0]; // @[apbuart.scala 620:35:@1420.4]
  assign _T_1602 = QueueModule_1_io_o_bits[1]; // @[apbuart.scala 620:55:@1421.4]
  assign _T_1603 = QueueModule_1_io_o_bits[2]; // @[apbuart.scala 620:75:@1422.4]
  assign _T_1604 = QueueModule_1_io_o_bits[3]; // @[apbuart.scala 620:95:@1423.4]
  assign _T_1605 = QueueModule_1_io_o_bits[4]; // @[apbuart.scala 620:115:@1424.4]
  assign _T_1606 = QueueModule_1_io_o_bits[5]; // @[apbuart.scala 620:135:@1425.4]
  assign _T_1607 = QueueModule_1_io_o_bits[6]; // @[apbuart.scala 620:155:@1426.4]
  assign _T_1608 = QueueModule_1_io_o_bits[7]; // @[apbuart.scala 620:175:@1427.4]
  assign _T_1609 = {_T_1607,_T_1608}; // @[Cat.scala 30:58:@1428.4]
  assign _T_1610 = {_T_1605,_T_1606}; // @[Cat.scala 30:58:@1429.4]
  assign _T_1611 = {_T_1610,_T_1609}; // @[Cat.scala 30:58:@1430.4]
  assign _T_1612 = {_T_1603,_T_1604}; // @[Cat.scala 30:58:@1431.4]
  assign _T_1613 = {_T_1601,_T_1602}; // @[Cat.scala 30:58:@1432.4]
  assign _T_1614 = {_T_1613,_T_1612}; // @[Cat.scala 30:58:@1433.4]
  assign _T_1615 = {_T_1614,_T_1611}; // @[Cat.scala 30:58:@1434.4]
  assign _T_1627 = _T_301 & _T_911; // @[apbuart.scala 622:87:@1443.4]
  assign _T_1632 = {24'h0,_T_1615}; // @[Cat.scala 30:58:@1446.6]
  assign _T_1633 = _T_1569 ? 32'h0 : _T_1632; // @[apbuart.scala 623:31:@1447.6]
  assign _T_1638 = _T_1569 ? 1'h0 : 1'h1; // @[apbuart.scala 624:31:@1450.6]
  assign _T_1645 = _T_1564 + 2'h1; // @[apbuart.scala 630:89:@1457.6]
  assign _T_1646 = _T_1645[1:0]; // @[apbuart.scala 630:89:@1458.6]
  assign _T_1647 = _T_1566 ? 2'h3 : _T_1646; // @[apbuart.scala 630:44:@1459.6]
  assign _T_1648 = _T_106 ? _T_1647 : _T_1564; // @[apbuart.scala 630:30:@1460.6]
  assign _GEN_113 = _T_1627 ? _T_1633 : _GEN_111; // @[apbuart.scala 622:97:@1444.4]
  assign _GEN_114 = _T_1627 ? _T_1638 : 1'h0; // @[apbuart.scala 622:97:@1444.4]
  assign _GEN_115 = _T_1627 ? 2'h0 : _T_1648; // @[apbuart.scala 622:97:@1444.4]
  assign io_PREADY = 1'h1; // @[apbuart.scala 62:14:@138.4]
  assign io_PRDATA = _T_112; // @[apbuart.scala 156:12:@169.4]
  assign io_PSLVERR = 1'h0; // @[apbuart.scala 63:14:@139.4]
  assign io_interrupt = 1'h0; // @[apbuart.scala 65:14:@140.4]
  assign io_txd = _T_76 ? 1'h1 : _T_172; // @[apbuart.scala 187:14:@195.4]
  assign io_out1 = _T_79; // @[apbuart.scala 223:10:@272.4]
  assign io_out2 = _T_82; // @[apbuart.scala 224:10:@273.4]
  assign io_rtsn = _T_85; // @[apbuart.scala 225:11:@274.4]
  assign io_dtrn = _T_88; // @[apbuart.scala 226:11:@275.4]
  assign io_divisor = {{16'd0}, _T_115}; // @[apbuart.scala 167:15:@177.4]
  assign io_baudreg_tx = _T_118; // @[apbuart.scala 168:18:@178.4]
  assign io_baudcount_tx = _T_121; // @[apbuart.scala 169:18:@179.4]
  assign io_baudcycle_tx = _T_124; // @[apbuart.scala 170:18:@180.4]
  assign QueueModule_clock = io_PCLK; // @[:@150.4]
  assign QueueModule_reset = io_PRESETn == 1'h0; // @[:@151.4]
  assign QueueModule_io_i_valid = _T_94; // @[apbuart.scala 141:19:@162.4]
  assign QueueModule_io_i_bits = _T_91; // @[apbuart.scala 142:19:@163.4]
  assign QueueModule_io_o_ready = _T_97; // @[apbuart.scala 143:19:@164.4]
  assign QueueModule_1_clock = io_PCLK; // @[:@153.4]
  assign QueueModule_1_reset = io_PRESETn == 1'h0; // @[:@154.4]
  assign QueueModule_1_io_i_valid = _T_106; // @[apbuart.scala 148:19:@165.4]
  assign QueueModule_1_io_i_bits = _T_103; // @[apbuart.scala 149:19:@166.4]
  assign QueueModule_1_io_o_ready = _T_109; // @[apbuart.scala 150:19:@167.4]
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
  _T_71 = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_73 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_76 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_79 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_82 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_85 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_88 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_91 = _RAND_7[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_94 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_97 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_100 = _RAND_10[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_103 = _RAND_11[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_106 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_109 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_112 = _RAND_14[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_115 = _RAND_15[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_118 = _RAND_16[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_121 = _RAND_17[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_124 = _RAND_18[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_127 = _RAND_19[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_130 = _RAND_20[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_133 = _RAND_21[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_136 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_139 = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_142 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_145 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_148 = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_151 = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_154 = _RAND_28[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_157 = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_160 = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  _T_163 = _RAND_31[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  _T_169 = _RAND_32[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  _T_172 = _RAND_33[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  _T_177 = _RAND_34[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  _T_180 = _RAND_35[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  _T_186 = _RAND_36[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  _T_259 = _RAND_37[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  _T_278 = _RAND_38[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  _T_281 = _RAND_39[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  _T_994 = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  _T_997 = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  _T_1000 = _RAND_42[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  _T_1003 = _RAND_43[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  _T_1006 = _RAND_44[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  _T_1009 = _RAND_45[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  _T_1012 = _RAND_46[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  _T_1015 = _RAND_47[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  _T_1157 = _RAND_48[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  _T_1160 = _RAND_49[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  _T_1163 = _RAND_50[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  _T_1166 = _RAND_51[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{`RANDOM}};
  _T_1169 = _RAND_52[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  _T_1172 = _RAND_53[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{`RANDOM}};
  _T_1175 = _RAND_54[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  _T_1178 = _RAND_55[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  _T_1181 = _RAND_56[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  _T_1540 = _RAND_57[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{`RANDOM}};
  _T_1543 = _RAND_58[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{`RANDOM}};
  _T_1564 = _RAND_59[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge io_PCLK) begin
    if (_T_63) begin
      _T_71 <= 2'h0;
    end else begin
      if (_T_1228) begin
        _T_71 <= 2'h0;
      end else begin
        if (_T_1235) begin
          if (_T_1017) begin
            _T_71 <= 2'h0;
          end else begin
            _T_71 <= 2'h2;
          end
        end else begin
          if (_T_1250) begin
            _T_71 <= 2'h1;
          end else begin
            if (_T_1253) begin
              _T_71 <= 2'h3;
            end else begin
              if (_T_1284) begin
                if (_T_1327) begin
                  _T_71 <= 2'h0;
                end else begin
                  _T_71 <= 2'h3;
                end
              end
            end
          end
        end
      end
    end
    if (_T_63) begin
      _T_73 <= 1'h0;
    end else begin
      _T_73 <= _GEN_98[0];
    end
    if (_T_63) begin
      _T_76 <= 1'h0;
    end else begin
      if (_T_236) begin
        _T_76 <= _T_209;
      end
    end
    if (_T_63) begin
      _T_79 <= 1'h0;
    end else begin
      if (_T_236) begin
        _T_79 <= _T_211;
      end
    end
    if (_T_63) begin
      _T_82 <= 1'h0;
    end else begin
      if (_T_236) begin
        _T_82 <= _T_210;
      end
    end
    if (_T_63) begin
      _T_85 <= 1'h0;
    end else begin
      if (_T_236) begin
        _T_85 <= _T_240;
      end
    end
    if (_T_63) begin
      _T_88 <= 1'h0;
    end else begin
      if (_T_236) begin
        _T_88 <= _T_241;
      end
    end
    if (_T_63) begin
      _T_91 <= 12'h0;
    end else begin
      _T_91 <= _GEN_22[11:0];
    end
    if (_T_63) begin
      _T_94 <= 1'h0;
    end else begin
      if (_T_912) begin
        if (_T_914) begin
          _T_94 <= 1'h0;
        end else begin
          _T_94 <= 1'h1;
        end
      end else begin
        _T_94 <= 1'h0;
      end
    end
    if (_T_63) begin
      _T_97 <= 1'h0;
    end else begin
      if (_T_1228) begin
        _T_97 <= 1'h0;
      end else begin
        if (_T_1235) begin
          if (_T_1017) begin
            _T_97 <= 1'h0;
          end else begin
            _T_97 <= 1'h1;
          end
        end else begin
          if (_T_1250) begin
            _T_97 <= 1'h0;
          end else begin
            if (_T_1253) begin
              _T_97 <= 1'h0;
            end
          end
        end
      end
    end
    if (_T_63) begin
      _T_100 <= 12'h0;
    end else begin
      _T_100 <= _GEN_76[11:0];
    end
    if (_T_63) begin
      _T_103 <= 12'h0;
    end else begin
      _T_103 <= _GEN_103[11:0];
    end
    if (_T_63) begin
      _T_106 <= 1'h0;
    end else begin
      if (_T_1371) begin
        _T_106 <= 1'h0;
      end else begin
        if (_T_73) begin
          if (_T_1429) begin
            _T_106 <= 1'h0;
          end else begin
            _T_106 <= _T_1444;
          end
        end
      end
    end
    if (_T_63) begin
      _T_109 <= 1'h0;
    end else begin
      if (_T_1627) begin
        if (_T_1569) begin
          _T_109 <= 1'h0;
        end else begin
          _T_109 <= 1'h1;
        end
      end else begin
        _T_109 <= 1'h0;
      end
    end
    if (_T_63) begin
      _T_112 <= 32'h0;
    end else begin
      if (_T_1627) begin
        if (_T_1569) begin
          _T_112 <= 32'h0;
        end else begin
          _T_112 <= _T_1632;
        end
      end else begin
        if (_T_1585) begin
          _T_112 <= _T_1592;
        end else begin
          if (_T_1210) begin
            _T_112 <= _T_1227;
          end else begin
            if (_T_1093) begin
              _T_112 <= _T_1102;
            end else begin
              if (_T_325) begin
                _T_112 <= _T_327;
              end else begin
                if (_T_302) begin
                  _T_112 <= _T_304;
                end else begin
                  if (_T_275) begin
                    _T_112 <= _T_259;
                  end else begin
                    if (_T_250) begin
                      _T_112 <= _T_256;
                    end else begin
                      if (_T_221) begin
                        _T_112 <= _T_229;
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
    if (_T_63) begin
      _T_115 <= 16'h9c;
    end else begin
      if (_T_312) begin
        _T_115 <= _T_315;
      end else begin
        if (_T_289) begin
          _T_115 <= _T_292;
        end
      end
    end
    if (_T_63) begin
      _T_118 <= 16'h0;
    end else begin
      if (_T_1228) begin
        _T_118 <= _T_115;
      end else begin
        if (_T_1235) begin
          _T_118 <= _T_115;
        end
      end
    end
    if (_T_63) begin
      _T_121 <= 16'h0;
    end else begin
      if (_T_1228) begin
        _T_121 <= 16'h0;
      end else begin
        if (_T_1235) begin
          _T_121 <= 16'h0;
        end else begin
          if (!(_T_1250)) begin
            if (_T_1253) begin
              _T_121 <= _T_1282;
            end else begin
              if (_T_1284) begin
                if (_T_1289) begin
                  _T_121 <= 16'h0;
                end else begin
                  _T_121 <= _T_1282;
                end
              end
            end
          end
        end
      end
    end
    if (_T_63) begin
      _T_124 <= 4'h0;
    end else begin
      if (_T_1228) begin
        _T_124 <= 4'h0;
      end else begin
        if (_T_1235) begin
          _T_124 <= 4'h0;
        end else begin
          if (!(_T_1250)) begin
            if (_T_1253) begin
              _T_124 <= 4'h0;
            end else begin
              if (_T_1284) begin
                if (_T_1289) begin
                  if (_T_1301) begin
                    _T_124 <= 4'h0;
                  end else begin
                    _T_124 <= _T_1305;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_63) begin
      _T_127 <= 16'h0;
    end else begin
      if (_T_1371) begin
        _T_127 <= _T_115;
      end
    end
    if (_T_63) begin
      _T_130 <= 16'h0;
    end else begin
      if (_T_1371) begin
        _T_130 <= {{15'd0}, _T_1370};
      end else begin
        if (_T_73) begin
          if (_T_1388) begin
            _T_130 <= 16'h0;
          end else begin
            _T_130 <= _T_1392;
          end
        end
      end
    end
    if (_T_63) begin
      _T_133 <= 4'h0;
    end else begin
      if (_T_1371) begin
        _T_133 <= 4'h0;
      end else begin
        if (_T_73) begin
          if (_T_1388) begin
            if (_T_1400) begin
              _T_133 <= 4'h0;
            end else begin
              _T_133 <= _T_1404;
            end
          end
        end
      end
    end
    if (_T_63) begin
      _T_136 <= 1'h0;
    end else begin
      if (_T_205) begin
        _T_136 <= _T_206;
      end
    end
    if (_T_63) begin
      _T_139 <= 1'h0;
    end else begin
      if (_T_205) begin
        _T_139 <= _T_207;
      end
    end
    if (_T_63) begin
      _T_142 <= 1'h0;
    end else begin
      if (_T_205) begin
        _T_142 <= _T_208;
      end
    end
    if (_T_63) begin
      _T_145 <= 1'h0;
    end else begin
      if (_T_205) begin
        _T_145 <= _T_209;
      end
    end
    if (_T_63) begin
      _T_148 <= 1'h0;
    end else begin
      if (_T_205) begin
        _T_148 <= _T_210;
      end
    end
    if (_T_63) begin
      _T_151 <= 1'h0;
    end else begin
      if (_T_205) begin
        _T_151 <= _T_211;
      end
    end
    if (_T_63) begin
      _T_154 <= 2'h3;
    end else begin
      if (_T_205) begin
        _T_154 <= _T_212;
      end
    end
    if (_T_63) begin
      _T_157 <= 1'h0;
    end else begin
      _T_157 <= _T_169;
    end
    if (_T_63) begin
      _T_160 <= 1'h0;
    end else begin
      _T_160 <= _T_157;
    end
    if (_T_63) begin
      _T_163 <= 4'ha;
    end else begin
      if (_T_1371) begin
        _T_163 <= _T_177;
      end else begin
        if (_T_73) begin
          if (_T_1414) begin
            _T_163 <= _T_1418;
          end
        end
      end
    end
    if (_T_63) begin
      _T_169 <= 1'h1;
    end else begin
      if (_T_76) begin
        _T_169 <= _T_172;
      end else begin
        _T_169 <= io_rxd;
      end
    end
    if (_T_63) begin
      _T_172 <= 1'h1;
    end else begin
      if (_T_1228) begin
        if (_T_139) begin
          _T_172 <= 1'h0;
        end else begin
          _T_172 <= 1'h1;
        end
      end else begin
        if (_T_1235) begin
          if (_T_139) begin
            _T_172 <= 1'h0;
          end else begin
            _T_172 <= 1'h1;
          end
        end else begin
          if (_T_1250) begin
            _T_172 <= 1'h1;
          end else begin
            if (_T_1253) begin
              if (_T_1278) begin
                _T_172 <= _T_1257;
              end else begin
                if (_T_1276) begin
                  _T_172 <= _T_1259;
                end else begin
                  if (_T_1274) begin
                    _T_172 <= _T_1261;
                  end else begin
                    if (_T_1272) begin
                      _T_172 <= _T_1263;
                    end else begin
                      if (_T_1270) begin
                        _T_172 <= _T_1265;
                      end else begin
                        if (_T_1268) begin
                          _T_172 <= _T_1267;
                        end else begin
                          _T_172 <= 1'h0;
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (_T_1284) begin
                if (_T_1327) begin
                  _T_172 <= 1'h1;
                end else begin
                  if (_T_1278) begin
                    _T_172 <= _T_1257;
                  end else begin
                    if (_T_1276) begin
                      _T_172 <= _T_1259;
                    end else begin
                      if (_T_1274) begin
                        _T_172 <= _T_1261;
                      end else begin
                        if (_T_1272) begin
                          _T_172 <= _T_1263;
                        end else begin
                          if (_T_1270) begin
                            _T_172 <= _T_1265;
                          end else begin
                            if (_T_1268) begin
                              _T_172 <= _T_1267;
                            end else begin
                              _T_172 <= 1'h0;
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
    if (_T_63) begin
      _T_177 <= 4'ha;
    end else begin
      if (_T_901) begin
        _T_177 <= 4'h7;
      end else begin
        if (_T_899) begin
          _T_177 <= 4'h8;
        end else begin
          if (_T_897) begin
            _T_177 <= 4'h9;
          end else begin
            if (_T_895) begin
              _T_177 <= 4'ha;
            end else begin
              if (_T_893) begin
                _T_177 <= 4'h8;
              end else begin
                if (_T_891) begin
                  _T_177 <= 4'h9;
                end else begin
                  if (_T_889) begin
                    _T_177 <= 4'ha;
                  end else begin
                    if (_T_887) begin
                      _T_177 <= 4'hb;
                    end else begin
                      if (_T_885) begin
                        _T_177 <= 4'h8;
                      end else begin
                        if (_T_883) begin
                          _T_177 <= 4'h9;
                        end else begin
                          if (_T_881) begin
                            _T_177 <= 4'ha;
                          end else begin
                            if (_T_879) begin
                              _T_177 <= 4'hb;
                            end else begin
                              if (_T_877) begin
                                _T_177 <= 4'h9;
                              end else begin
                                if (_T_875) begin
                                  _T_177 <= 4'ha;
                                end else begin
                                  if (_T_873) begin
                                    _T_177 <= 4'hb;
                                  end else begin
                                    if (_T_871) begin
                                      _T_177 <= 4'hc;
                                    end else begin
                                      _T_177 <= 4'ha;
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
    if (_T_63) begin
      _T_180 <= 4'ha;
    end else begin
      if (!(_T_1228)) begin
        if (_T_1235) begin
          _T_180 <= _T_177;
        end else begin
          if (!(_T_1250)) begin
            if (_T_1253) begin
              _T_180 <= _T_177;
            end else begin
              if (_T_1284) begin
                if (_T_1327) begin
                  _T_180 <= _T_177;
                end else begin
                  if (_T_1315) begin
                    _T_180 <= _T_1340;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_63) begin
      _T_186 <= 12'h0;
    end else begin
      if (_T_1371) begin
        _T_186 <= 12'h0;
      end else begin
        if (_T_73) begin
          if (!(_T_1429)) begin
            if (_T_1444) begin
              _T_186 <= _T_103;
            end
          end
        end
      end
    end
    if (_T_63) begin
      _T_259 <= 32'h0;
    end else begin
      if (_T_266) begin
        _T_259 <= io_PWDATA;
      end
    end
    if (_T_63) begin
      _T_278 <= 8'h24;
    end else begin
      if (_T_289) begin
        _T_278 <= _T_290;
      end
    end
    if (_T_63) begin
      _T_281 <= 8'h0;
    end else begin
      if (_T_312) begin
        _T_281 <= _T_290;
      end
    end
    if (_T_63) begin
      _T_994 <= 1'h1;
    end else begin
      _T_994 <= _T_1019;
    end
    if (_T_63) begin
      _T_997 <= 1'h0;
    end else begin
      if (_T_1093) begin
        _T_997 <= 1'h0;
      end else begin
        if (_T_1149) begin
          _T_997 <= 1'h1;
        end
      end
    end
    if (_T_63) begin
      _T_1000 <= 1'h0;
    end else begin
      _T_1000 <= _T_1017;
    end
    if (_T_63) begin
      _T_1003 <= 1'h0;
    end else begin
      if (_T_1093) begin
        _T_1003 <= 1'h0;
      end else begin
        if (_T_1121) begin
          _T_1003 <= 1'h1;
        end
      end
    end
    if (_T_63) begin
      _T_1006 <= 1'h0;
    end else begin
      if (_T_1093) begin
        _T_1006 <= 1'h0;
      end else begin
        if (_T_1134) begin
          _T_1006 <= 1'h1;
        end
      end
    end
    if (_T_63) begin
      _T_1009 <= 1'h0;
    end else begin
      if (_T_1093) begin
        _T_1009 <= 1'h0;
      end else begin
        if (_T_1128) begin
          _T_1009 <= 1'h1;
        end
      end
    end
    if (_T_63) begin
      _T_1012 <= 1'h0;
    end else begin
      if (_T_1093) begin
        _T_1012 <= 1'h0;
      end else begin
        if (_T_1113) begin
          _T_1012 <= 1'h1;
        end
      end
    end
    if (_T_63) begin
      _T_1015 <= 1'h0;
    end else begin
      _T_1015 <= _T_1018;
    end
    if (_T_63) begin
      _T_1157 <= 1'h0;
    end else begin
      _T_1157 <= io_rin;
    end
    if (_T_63) begin
      _T_1160 <= 1'h0;
    end else begin
      _T_1160 <= _T_1157;
    end
    if (_T_63) begin
      _T_1163 <= 1'h0;
    end else begin
      if (_T_1187) begin
        _T_1163 <= 1'h1;
      end else begin
        if (_T_1191) begin
          _T_1163 <= 1'h0;
        end
      end
    end
    if (_T_63) begin
      _T_1166 <= 1'h0;
    end else begin
      if (_T_1193) begin
        _T_1166 <= 1'h1;
      end
    end
    if (_T_63) begin
      _T_1169 <= 1'h0;
    end else begin
      if (_T_1196) begin
        _T_1169 <= 1'h1;
      end
    end
    if (_T_63) begin
      _T_1172 <= 1'h0;
    end else begin
      if (_T_1199) begin
        _T_1172 <= 1'h1;
      end
    end
    if (_T_63) begin
      _T_1175 <= 1'h0;
    end else begin
      _T_1175 <= io_dcdn;
    end
    if (_T_63) begin
      _T_1178 <= 1'h0;
    end else begin
      _T_1178 <= io_dsrn;
    end
    if (_T_63) begin
      _T_1181 <= 1'h0;
    end else begin
      _T_1181 <= io_ctsn;
    end
    if (_T_63) begin
      _T_1540 <= 1'h0;
    end else begin
      if (_T_1585) begin
        _T_1540 <= 1'h0;
      end else begin
        _T_1540 <= _T_1600;
      end
    end
    if (_T_63) begin
      _T_1543 <= 3'h0;
    end else begin
      if (_T_1546) begin
        _T_1543 <= 3'h3;
      end else begin
        if (_T_1569) begin
          _T_1543 <= 3'h2;
        end else begin
          if (_T_1017) begin
            _T_1543 <= 3'h1;
          end else begin
            if (_T_1566) begin
              _T_1543 <= 3'h6;
            end else begin
              if (_T_1561) begin
                _T_1543 <= 3'h0;
              end else begin
                _T_1543 <= 3'h5;
              end
            end
          end
        end
      end
    end
    if (_T_63) begin
      _T_1564 <= 2'h0;
    end else begin
      if (_T_1627) begin
        _T_1564 <= 2'h0;
      end else begin
        if (_T_106) begin
          if (_T_1566) begin
            _T_1564 <= 2'h3;
          end else begin
            _T_1564 <= _T_1646;
          end
        end
      end
    end
  end
endmodule
