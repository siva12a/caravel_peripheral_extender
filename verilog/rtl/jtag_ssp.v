module Queue( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  output        io_enq_ready, // @[:@6.4]
  input         io_enq_valid, // @[:@6.4]
  input  [63:0] io_enq_bits, // @[:@6.4]
  input         io_deq_ready, // @[:@6.4]
  output        io_deq_valid, // @[:@6.4]
  output [63:0] io_deq_bits // @[:@6.4]
);
  reg [63:0] ram [0:0]; // @[Decoupled.scala 214:24:@8.4]
  reg [63:0] _RAND_0;
  wire [63:0] ram__T_55_data; // @[Decoupled.scala 214:24:@8.4]
  wire  ram__T_55_addr; // @[Decoupled.scala 214:24:@8.4]
  wire [63:0] ram__T_46_data; // @[Decoupled.scala 214:24:@8.4]
  wire  ram__T_46_addr; // @[Decoupled.scala 214:24:@8.4]
  wire  ram__T_46_mask; // @[Decoupled.scala 214:24:@8.4]
  wire  ram__T_46_en; // @[Decoupled.scala 214:24:@8.4]
  reg  maybe_full; // @[Decoupled.scala 217:35:@9.4]
  reg [31:0] _RAND_1;
  wire  empty; // @[Decoupled.scala 220:36:@11.4]
  wire  do_enq; // @[Decoupled.scala 37:37:@14.4]
  wire  do_deq; // @[Decoupled.scala 37:37:@17.4]
  wire  _T_49; // @[Decoupled.scala 232:16:@26.4]
  wire  _GEN_5; // @[Decoupled.scala 232:28:@27.4]
  assign ram__T_55_addr = 1'h0;
  assign ram__T_55_data = ram[ram__T_55_addr]; // @[Decoupled.scala 214:24:@8.4]
  assign ram__T_46_data = io_enq_bits;
  assign ram__T_46_addr = 1'h0;
  assign ram__T_46_mask = 1'h1;
  assign ram__T_46_en = io_enq_ready & io_enq_valid;
  assign empty = maybe_full == 1'h0; // @[Decoupled.scala 220:36:@11.4]
  assign do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:@14.4]
  assign do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:@17.4]
  assign _T_49 = do_enq != do_deq; // @[Decoupled.scala 232:16:@26.4]
  assign _GEN_5 = _T_49 ? do_enq : maybe_full; // @[Decoupled.scala 232:28:@27.4]
  assign io_enq_ready = maybe_full == 1'h0; // @[Decoupled.scala 237:16:@33.4]
  assign io_deq_valid = empty == 1'h0; // @[Decoupled.scala 236:16:@31.4]
  assign io_deq_bits = ram__T_55_data; // @[Decoupled.scala 238:15:@35.4]
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
  _RAND_0 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  maybe_full = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(ram__T_46_en & ram__T_46_mask) begin
      ram[ram__T_46_addr] <= ram__T_46_data; // @[Decoupled.scala 214:24:@8.4]
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_49) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module QueueModule_jtag( // @[:@43.2]
  input         clock, // @[:@44.4]
  input         reset, // @[:@45.4]
  output        io_i_ready, // @[:@46.4]
  input         io_i_valid, // @[:@46.4]
  input  [63:0] io_i_bits, // @[:@46.4]
  input         io_o_ready, // @[:@46.4]
  output        io_o_valid, // @[:@46.4]
  output [63:0] io_o_bits // @[:@46.4]
);
  wire  qa_clock; // @[Decoupled.scala 293:21:@48.4]
  wire  qa_reset; // @[Decoupled.scala 293:21:@48.4]
  wire  qa_io_enq_ready; // @[Decoupled.scala 293:21:@48.4]
  wire  qa_io_enq_valid; // @[Decoupled.scala 293:21:@48.4]
  wire [63:0] qa_io_enq_bits; // @[Decoupled.scala 293:21:@48.4]
  wire  qa_io_deq_ready; // @[Decoupled.scala 293:21:@48.4]
  wire  qa_io_deq_valid; // @[Decoupled.scala 293:21:@48.4]
  wire [63:0] qa_io_deq_bits; // @[Decoupled.scala 293:21:@48.4]
  Queue qa ( // @[Decoupled.scala 293:21:@48.4]
    .clock(qa_clock),
    .reset(qa_reset),
    .io_enq_ready(qa_io_enq_ready),
    .io_enq_valid(qa_io_enq_valid),
    .io_enq_bits(qa_io_enq_bits),
    .io_deq_ready(qa_io_deq_ready),
    .io_deq_valid(qa_io_deq_valid),
    .io_deq_bits(qa_io_deq_bits)
  );
  assign io_i_ready = qa_io_enq_ready; // @[Decoupled.scala 296:17:@53.4]
  assign io_o_valid = qa_io_deq_valid; // @[queue.scala 17:15:@54.4]
  assign io_o_bits = qa_io_deq_bits; // @[queue.scala 18:15:@55.4]
  assign qa_clock = clock; // @[:@49.4]
  assign qa_reset = reset; // @[:@50.4]
  assign qa_io_enq_valid = io_i_valid; // @[Decoupled.scala 294:22:@51.4]
  assign qa_io_enq_bits = io_i_bits; // @[Decoupled.scala 295:21:@52.4]
  assign qa_io_deq_ready = io_o_ready; // @[queue.scala 19:15:@56.4]
endmodule
module Queue_2( // @[:@113.2]
  input         clock, // @[:@114.4]
  input         reset, // @[:@115.4]
  output        io_enq_ready, // @[:@116.4]
  input         io_enq_valid, // @[:@116.4]
  input  [31:0] io_enq_bits, // @[:@116.4]
  input         io_deq_ready, // @[:@116.4]
  output        io_deq_valid, // @[:@116.4]
  output [31:0] io_deq_bits // @[:@116.4]
);
  reg [31:0] ram [0:0]; // @[Decoupled.scala 214:24:@118.4]
  reg [31:0] _RAND_0;
  wire [31:0] ram__T_55_data; // @[Decoupled.scala 214:24:@118.4]
  wire  ram__T_55_addr; // @[Decoupled.scala 214:24:@118.4]
  wire [31:0] ram__T_46_data; // @[Decoupled.scala 214:24:@118.4]
  wire  ram__T_46_addr; // @[Decoupled.scala 214:24:@118.4]
  wire  ram__T_46_mask; // @[Decoupled.scala 214:24:@118.4]
  wire  ram__T_46_en; // @[Decoupled.scala 214:24:@118.4]
  reg  maybe_full; // @[Decoupled.scala 217:35:@119.4]
  reg [31:0] _RAND_1;
  wire  empty; // @[Decoupled.scala 220:36:@121.4]
  wire  do_enq; // @[Decoupled.scala 37:37:@124.4]
  wire  do_deq; // @[Decoupled.scala 37:37:@127.4]
  wire  _T_49; // @[Decoupled.scala 232:16:@136.4]
  wire  _GEN_5; // @[Decoupled.scala 232:28:@137.4]
  assign ram__T_55_addr = 1'h0;
  assign ram__T_55_data = ram[ram__T_55_addr]; // @[Decoupled.scala 214:24:@118.4]
  assign ram__T_46_data = io_enq_bits;
  assign ram__T_46_addr = 1'h0;
  assign ram__T_46_mask = 1'h1;
  assign ram__T_46_en = io_enq_ready & io_enq_valid;
  assign empty = maybe_full == 1'h0; // @[Decoupled.scala 220:36:@121.4]
  assign do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:@124.4]
  assign do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:@127.4]
  assign _T_49 = do_enq != do_deq; // @[Decoupled.scala 232:16:@136.4]
  assign _GEN_5 = _T_49 ? do_enq : maybe_full; // @[Decoupled.scala 232:28:@137.4]
  assign io_enq_ready = maybe_full == 1'h0; // @[Decoupled.scala 237:16:@143.4]
  assign io_deq_valid = empty == 1'h0; // @[Decoupled.scala 236:16:@141.4]
  assign io_deq_bits = ram__T_55_data; // @[Decoupled.scala 238:15:@145.4]
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
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  maybe_full = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(ram__T_46_en & ram__T_46_mask) begin
      ram[ram__T_46_addr] <= ram__T_46_data; // @[Decoupled.scala 214:24:@118.4]
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_49) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module QueueModule_jtag_2( // @[:@153.2]
  input         clock, // @[:@154.4]
  input         reset, // @[:@155.4]
  output        io_i_ready, // @[:@156.4]
  input         io_i_valid, // @[:@156.4]
  input  [31:0] io_i_bits, // @[:@156.4]
  input         io_o_ready, // @[:@156.4]
  output        io_o_valid, // @[:@156.4]
  output [31:0] io_o_bits // @[:@156.4]
);
  wire  qa_clock; // @[Decoupled.scala 293:21:@158.4]
  wire  qa_reset; // @[Decoupled.scala 293:21:@158.4]
  wire  qa_io_enq_ready; // @[Decoupled.scala 293:21:@158.4]
  wire  qa_io_enq_valid; // @[Decoupled.scala 293:21:@158.4]
  wire [31:0] qa_io_enq_bits; // @[Decoupled.scala 293:21:@158.4]
  wire  qa_io_deq_ready; // @[Decoupled.scala 293:21:@158.4]
  wire  qa_io_deq_valid; // @[Decoupled.scala 293:21:@158.4]
  wire [31:0] qa_io_deq_bits; // @[Decoupled.scala 293:21:@158.4]
  Queue_2 qa ( // @[Decoupled.scala 293:21:@158.4]
    .clock(qa_clock),
    .reset(qa_reset),
    .io_enq_ready(qa_io_enq_ready),
    .io_enq_valid(qa_io_enq_valid),
    .io_enq_bits(qa_io_enq_bits),
    .io_deq_ready(qa_io_deq_ready),
    .io_deq_valid(qa_io_deq_valid),
    .io_deq_bits(qa_io_deq_bits)
  );
  assign io_i_ready = qa_io_enq_ready; // @[Decoupled.scala 296:17:@163.4]
  assign io_o_valid = qa_io_deq_valid; // @[queue.scala 17:15:@164.4]
  assign io_o_bits = qa_io_deq_bits; // @[queue.scala 18:15:@165.4]
  assign qa_clock = clock; // @[:@159.4]
  assign qa_reset = reset; // @[:@160.4]
  assign qa_io_enq_valid = io_i_valid; // @[Decoupled.scala 294:22:@161.4]
  assign qa_io_enq_bits = io_i_bits; // @[Decoupled.scala 295:21:@162.4]
  assign qa_io_deq_ready = io_o_ready; // @[queue.scala 19:15:@166.4]
endmodule
module jtag_ssp( // @[:@168.2]
  input         clock, // @[:@169.4]
  input         reset, // @[:@170.4]
  input         io_PCLK, // @[:@171.4]
  input         io_PRESETn, // @[:@171.4]
  input  [7:0]  io_PADDR, // @[:@171.4]
  input         io_PPROT, // @[:@171.4]
  input         io_PSEL, // @[:@171.4]
  input         io_PENABLE, // @[:@171.4]
  input         io_PWRITE, // @[:@171.4]
  input  [31:0] io_PWDATA, // @[:@171.4]
  input         io_PSTRB, // @[:@171.4]
  output        io_PREADY, // @[:@171.4]
  output [31:0] io_PRDATA, // @[:@171.4]
  output        io_PSLVERR, // @[:@171.4]
  output        io_TMS, // @[:@171.4]
  output        io_TCK, // @[:@171.4]
  output        io_TDO, // @[:@171.4]
  input         io_TDI, // @[:@171.4]
  output [7:0]  io_JTAC, // @[:@171.4]
  output [7:0]  io_DIVI // @[:@171.4]
);
  wire  QueueModule_jtag_clock; // @[jtag_ssp.scala 75:21:@194.4]
  wire  QueueModule_jtag_reset; // @[jtag_ssp.scala 75:21:@194.4]
  wire  QueueModule_jtag_io_i_ready; // @[jtag_ssp.scala 75:21:@194.4]
  wire  QueueModule_jtag_io_i_valid; // @[jtag_ssp.scala 75:21:@194.4]
  wire [63:0] QueueModule_jtag_io_i_bits; // @[jtag_ssp.scala 75:21:@194.4]
  wire  QueueModule_jtag_io_o_ready; // @[jtag_ssp.scala 75:21:@194.4]
  wire  QueueModule_jtag_io_o_valid; // @[jtag_ssp.scala 75:21:@194.4]
  wire [63:0] QueueModule_jtag_io_o_bits; // @[jtag_ssp.scala 75:21:@194.4]
  wire  QueueModule_jtag_1_clock; // @[jtag_ssp.scala 76:21:@197.4]
  wire  QueueModule_jtag_1_reset; // @[jtag_ssp.scala 76:21:@197.4]
  wire  QueueModule_jtag_1_io_i_ready; // @[jtag_ssp.scala 76:21:@197.4]
  wire  QueueModule_jtag_1_io_i_valid; // @[jtag_ssp.scala 76:21:@197.4]
  wire [63:0] QueueModule_jtag_1_io_i_bits; // @[jtag_ssp.scala 76:21:@197.4]
  wire  QueueModule_jtag_1_io_o_ready; // @[jtag_ssp.scala 76:21:@197.4]
  wire  QueueModule_jtag_1_io_o_valid; // @[jtag_ssp.scala 76:21:@197.4]
  wire [63:0] QueueModule_jtag_1_io_o_bits; // @[jtag_ssp.scala 76:21:@197.4]
  wire  QueueModule_jtag_2_clock; // @[jtag_ssp.scala 77:21:@200.4]
  wire  QueueModule_jtag_2_reset; // @[jtag_ssp.scala 77:21:@200.4]
  wire  QueueModule_jtag_2_io_i_ready; // @[jtag_ssp.scala 77:21:@200.4]
  wire  QueueModule_jtag_2_io_i_valid; // @[jtag_ssp.scala 77:21:@200.4]
  wire [31:0] QueueModule_jtag_2_io_i_bits; // @[jtag_ssp.scala 77:21:@200.4]
  wire  QueueModule_jtag_2_io_o_ready; // @[jtag_ssp.scala 77:21:@200.4]
  wire  QueueModule_jtag_2_io_o_valid; // @[jtag_ssp.scala 77:21:@200.4]
  wire [31:0] QueueModule_jtag_2_io_o_bits; // @[jtag_ssp.scala 77:21:@200.4]
  wire  _T_43; // @[jtag_ssp.scala 43:28:@175.4]
  reg  _T_46; // @[jtag_ssp.scala 44:21:@176.4]
  reg [31:0] _RAND_0;
  reg  _T_49; // @[jtag_ssp.scala 45:21:@177.4]
  reg [31:0] _RAND_1;
  reg  _T_52; // @[jtag_ssp.scala 46:21:@178.4]
  reg [31:0] _RAND_2;
  reg  _T_55; // @[jtag_ssp.scala 52:28:@182.4]
  reg [31:0] _RAND_3;
  reg  _T_58; // @[jtag_ssp.scala 53:28:@183.4]
  reg [31:0] _RAND_4;
  reg [63:0] _T_61; // @[jtag_ssp.scala 55:28:@184.4]
  reg [63:0] _RAND_5;
  reg [63:0] _T_64; // @[jtag_ssp.scala 56:28:@185.4]
  reg [63:0] _RAND_6;
  reg [63:0] _T_67; // @[jtag_ssp.scala 58:26:@186.4]
  reg [63:0] _RAND_7;
  reg  _T_70; // @[jtag_ssp.scala 60:28:@187.4]
  reg [31:0] _RAND_8;
  reg [7:0] _T_73; // @[jtag_ssp.scala 63:27:@188.4]
  reg [31:0] _RAND_9;
  reg [7:0] _T_76; // @[jtag_ssp.scala 64:27:@189.4]
  reg [31:0] _RAND_10;
  reg [7:0] _T_79; // @[jtag_ssp.scala 65:27:@190.4]
  reg [31:0] _RAND_11;
  reg [31:0] _T_82; // @[jtag_ssp.scala 73:23:@193.4]
  reg [31:0] _RAND_12;
  wire  _T_83; // @[jtag_ssp.scala 85:26:@204.4]
  wire  _T_85; // @[jtag_ssp.scala 86:26:@206.4]
  wire  _T_87; // @[jtag_ssp.scala 87:26:@208.4]
  wire  _T_89; // @[jtag_ssp.scala 88:26:@210.4]
  wire  _T_91; // @[jtag_ssp.scala 89:26:@212.4]
  wire  _T_93; // @[jtag_ssp.scala 90:26:@214.4]
  wire  _T_95; // @[jtag_ssp.scala 91:26:@216.4]
  wire  _T_97; // @[jtag_ssp.scala 92:26:@218.4]
  wire  _T_99; // @[jtag_ssp.scala 93:26:@220.4]
  wire  _T_101; // @[jtag_ssp.scala 94:26:@222.4]
  wire  _T_103; // @[jtag_ssp.scala 95:26:@224.4]
  wire  _T_105; // @[jtag_ssp.scala 96:26:@226.4]
  wire  _T_107; // @[jtag_ssp.scala 97:26:@228.4]
  wire  _T_109; // @[jtag_ssp.scala 98:26:@230.4]
  wire  _T_111; // @[jtag_ssp.scala 99:26:@232.4]
  wire  _T_113; // @[jtag_ssp.scala 100:26:@234.4]
  wire  _T_115; // @[jtag_ssp.scala 101:26:@236.4]
  wire  _T_117; // @[jtag_ssp.scala 102:26:@238.4]
  wire  _T_119; // @[jtag_ssp.scala 103:26:@240.4]
  wire  _T_121; // @[jtag_ssp.scala 104:26:@242.4]
  wire  _T_123; // @[jtag_ssp.scala 105:26:@244.4]
  wire  _T_125; // @[jtag_ssp.scala 106:26:@246.4]
  wire  _T_127; // @[jtag_ssp.scala 107:26:@248.4]
  wire  _T_129; // @[jtag_ssp.scala 108:26:@250.4]
  wire  _T_131; // @[jtag_ssp.scala 109:26:@252.4]
  wire  _T_133; // @[jtag_ssp.scala 110:26:@254.4]
  wire  _T_135; // @[jtag_ssp.scala 111:26:@256.4]
  wire  _T_137; // @[jtag_ssp.scala 112:26:@258.4]
  wire  _T_139; // @[jtag_ssp.scala 113:26:@260.4]
  wire  _T_141; // @[jtag_ssp.scala 114:26:@262.4]
  wire  _T_143; // @[jtag_ssp.scala 115:26:@264.4]
  wire  _T_145; // @[jtag_ssp.scala 116:26:@266.4]
  wire [1:0] _T_147; // @[Cat.scala 30:58:@268.4]
  wire [1:0] _T_148; // @[Cat.scala 30:58:@269.4]
  wire [3:0] _T_149; // @[Cat.scala 30:58:@270.4]
  wire [1:0] _T_150; // @[Cat.scala 30:58:@271.4]
  wire [1:0] _T_151; // @[Cat.scala 30:58:@272.4]
  wire [3:0] _T_152; // @[Cat.scala 30:58:@273.4]
  wire [7:0] _T_153; // @[Cat.scala 30:58:@274.4]
  wire [1:0] _T_154; // @[Cat.scala 30:58:@275.4]
  wire [1:0] _T_155; // @[Cat.scala 30:58:@276.4]
  wire [3:0] _T_156; // @[Cat.scala 30:58:@277.4]
  wire [1:0] _T_157; // @[Cat.scala 30:58:@278.4]
  wire [1:0] _T_158; // @[Cat.scala 30:58:@279.4]
  wire [3:0] _T_159; // @[Cat.scala 30:58:@280.4]
  wire [7:0] _T_160; // @[Cat.scala 30:58:@281.4]
  wire [15:0] _T_161; // @[Cat.scala 30:58:@282.4]
  wire [1:0] _T_162; // @[Cat.scala 30:58:@283.4]
  wire [1:0] _T_163; // @[Cat.scala 30:58:@284.4]
  wire [3:0] _T_164; // @[Cat.scala 30:58:@285.4]
  wire [1:0] _T_165; // @[Cat.scala 30:58:@286.4]
  wire [1:0] _T_166; // @[Cat.scala 30:58:@287.4]
  wire [3:0] _T_167; // @[Cat.scala 30:58:@288.4]
  wire [7:0] _T_168; // @[Cat.scala 30:58:@289.4]
  wire [1:0] _T_169; // @[Cat.scala 30:58:@290.4]
  wire [1:0] _T_170; // @[Cat.scala 30:58:@291.4]
  wire [3:0] _T_171; // @[Cat.scala 30:58:@292.4]
  wire [1:0] _T_172; // @[Cat.scala 30:58:@293.4]
  wire [1:0] _T_173; // @[Cat.scala 30:58:@294.4]
  wire [3:0] _T_174; // @[Cat.scala 30:58:@295.4]
  wire [7:0] _T_175; // @[Cat.scala 30:58:@296.4]
  wire [15:0] _T_176; // @[Cat.scala 30:58:@297.4]
  wire [31:0] _T_177; // @[Cat.scala 30:58:@298.4]
  wire [1:0] _T_178; // @[Cat.scala 30:58:@299.4]
  wire [1:0] _T_179; // @[Cat.scala 30:58:@300.4]
  wire [3:0] _T_180; // @[Cat.scala 30:58:@301.4]
  wire [1:0] _T_181; // @[Cat.scala 30:58:@302.4]
  wire [1:0] _T_182; // @[Cat.scala 30:58:@303.4]
  wire [3:0] _T_183; // @[Cat.scala 30:58:@304.4]
  wire [7:0] _T_184; // @[Cat.scala 30:58:@305.4]
  wire [1:0] _T_185; // @[Cat.scala 30:58:@306.4]
  wire [1:0] _T_186; // @[Cat.scala 30:58:@307.4]
  wire [3:0] _T_187; // @[Cat.scala 30:58:@308.4]
  wire [1:0] _T_188; // @[Cat.scala 30:58:@309.4]
  wire [1:0] _T_189; // @[Cat.scala 30:58:@310.4]
  wire [3:0] _T_190; // @[Cat.scala 30:58:@311.4]
  wire [7:0] _T_191; // @[Cat.scala 30:58:@312.4]
  wire [15:0] _T_192; // @[Cat.scala 30:58:@313.4]
  wire [1:0] _T_193; // @[Cat.scala 30:58:@314.4]
  wire [1:0] _T_194; // @[Cat.scala 30:58:@315.4]
  wire [3:0] _T_195; // @[Cat.scala 30:58:@316.4]
  wire [1:0] _T_196; // @[Cat.scala 30:58:@317.4]
  wire [1:0] _T_197; // @[Cat.scala 30:58:@318.4]
  wire [3:0] _T_198; // @[Cat.scala 30:58:@319.4]
  wire [7:0] _T_199; // @[Cat.scala 30:58:@320.4]
  wire [1:0] _T_200; // @[Cat.scala 30:58:@321.4]
  wire [1:0] _T_201; // @[Cat.scala 30:58:@322.4]
  wire [3:0] _T_202; // @[Cat.scala 30:58:@323.4]
  wire [1:0] _T_203; // @[Cat.scala 30:58:@324.4]
  wire [1:0] _T_204; // @[Cat.scala 30:58:@325.4]
  wire [3:0] _T_205; // @[Cat.scala 30:58:@326.4]
  wire [7:0] _T_206; // @[Cat.scala 30:58:@327.4]
  wire [15:0] _T_207; // @[Cat.scala 30:58:@328.4]
  wire [31:0] _T_208; // @[Cat.scala 30:58:@329.4]
  wire [63:0] _T_209; // @[Cat.scala 30:58:@330.4]
  reg  _T_212; // @[jtag_ssp.scala 121:20:@331.4]
  reg [31:0] _RAND_13;
  reg  _T_215; // @[jtag_ssp.scala 122:20:@332.4]
  reg [31:0] _RAND_14;
  reg  _T_218; // @[jtag_ssp.scala 123:26:@333.4]
  reg [31:0] _RAND_15;
  reg  _T_221; // @[jtag_ssp.scala 124:26:@334.4]
  reg [31:0] _RAND_16;
  reg  _T_224; // @[jtag_ssp.scala 125:26:@335.4]
  reg [31:0] _RAND_17;
  reg  _T_227; // @[jtag_ssp.scala 126:26:@336.4]
  reg [31:0] _RAND_18;
  wire  _T_230; // @[jtag_ssp.scala 145:15:@348.4]
  wire  _T_231; // @[jtag_ssp.scala 145:28:@349.4]
  wire  _T_240; // @[jtag_ssp.scala 145:60:@351.4]
  wire  _T_241; // @[jtag_ssp.scala 145:42:@352.4]
  wire  _GEN_0; // @[jtag_ssp.scala 145:87:@353.4]
  wire  _GEN_1; // @[jtag_ssp.scala 145:87:@353.4]
  wire  _T_247; // @[jtag_ssp.scala 149:60:@362.4]
  wire  _T_248; // @[jtag_ssp.scala 149:42:@363.4]
  wire [7:0] _T_249; // @[jtag_ssp.scala 150:28:@365.6]
  wire [7:0] _GEN_2; // @[jtag_ssp.scala 149:88:@364.4]
  reg [7:0] _T_252; // @[jtag_ssp.scala 153:30:@368.4]
  reg [31:0] _RAND_19;
  reg [7:0] _T_255; // @[jtag_ssp.scala 154:30:@369.4]
  reg [31:0] _RAND_20;
  wire  _T_259; // @[jtag_ssp.scala 155:61:@373.4]
  wire  _T_260; // @[jtag_ssp.scala 155:43:@374.4]
  wire [7:0] _GEN_3; // @[jtag_ssp.scala 155:89:@375.4]
  wire  _T_265; // @[jtag_ssp.scala 160:60:@382.4]
  wire  _T_266; // @[jtag_ssp.scala 160:42:@383.4]
  wire  _T_272; // @[jtag_ssp.scala 167:60:@393.4]
  wire  _T_273; // @[jtag_ssp.scala 167:42:@394.4]
  reg  _T_278; // @[jtag_ssp.scala 175:23:@401.4]
  reg [31:0] _RAND_21;
  wire  _T_280; // @[jtag_ssp.scala 177:18:@402.4]
  wire  _T_281; // @[jtag_ssp.scala 177:15:@403.4]
  wire  _T_283; // @[jtag_ssp.scala 177:32:@404.4]
  wire  _T_284; // @[jtag_ssp.scala 177:29:@405.4]
  wire  _T_287; // @[jtag_ssp.scala 177:44:@408.4]
  wire [1:0] _T_289; // @[Cat.scala 30:58:@410.6]
  wire [1:0] _T_290; // @[Cat.scala 30:58:@411.6]
  wire [3:0] _T_291; // @[Cat.scala 30:58:@412.6]
  wire [1:0] _T_292; // @[Cat.scala 30:58:@413.6]
  wire [25:0] _T_293; // @[Cat.scala 30:58:@414.6]
  wire [27:0] _T_294; // @[Cat.scala 30:58:@415.6]
  wire [31:0] _T_295; // @[Cat.scala 30:58:@416.6]
  wire [31:0] _GEN_6; // @[jtag_ssp.scala 177:89:@409.4]
  wire  _T_303; // @[jtag_ssp.scala 181:62:@424.4]
  wire  _T_304; // @[jtag_ssp.scala 181:44:@425.4]
  wire [31:0] _GEN_7; // @[jtag_ssp.scala 181:92:@426.4]
  wire  _GEN_8; // @[jtag_ssp.scala 181:92:@426.4]
  wire  _T_309; // @[jtag_ssp.scala 188:60:@436.4]
  wire  _T_310; // @[jtag_ssp.scala 188:42:@437.4]
  wire  _GEN_9; // @[jtag_ssp.scala 188:86:@438.4]
  reg [63:0] _T_315; // @[jtag_ssp.scala 196:22:@445.4]
  reg [63:0] _RAND_22;
  reg [1:0] _T_334; // @[jtag_ssp.scala 207:21:@457.4]
  reg [31:0] _RAND_23;
  wire [8:0] _T_336; // @[jtag_ssp.scala 210:37:@458.4]
  wire [8:0] _T_337; // @[jtag_ssp.scala 210:37:@459.4]
  wire [7:0] _T_338; // @[jtag_ssp.scala 210:37:@460.4]
  wire  _T_339; // @[jtag_ssp.scala 210:24:@461.4]
  wire  _T_341; // @[jtag_ssp.scala 212:27:@462.4]
  wire  _T_343; // @[jtag_ssp.scala 213:27:@463.4]
  wire  _T_345; // @[jtag_ssp.scala 214:27:@464.4]
  wire  _T_347; // @[jtag_ssp.scala 215:27:@465.4]
  wire  _T_349; // @[jtag_ssp.scala 216:27:@466.4]
  wire  _T_351; // @[jtag_ssp.scala 217:27:@467.4]
  wire  _T_353; // @[jtag_ssp.scala 218:27:@468.4]
  wire  _T_355; // @[jtag_ssp.scala 219:27:@469.4]
  wire  _T_357; // @[jtag_ssp.scala 220:27:@470.4]
  wire  _T_359; // @[jtag_ssp.scala 221:27:@471.4]
  wire  _T_361; // @[jtag_ssp.scala 222:27:@472.4]
  wire  _T_363; // @[jtag_ssp.scala 223:27:@473.4]
  wire  _T_365; // @[jtag_ssp.scala 224:27:@474.4]
  wire  _T_367; // @[jtag_ssp.scala 225:27:@475.4]
  wire  _T_369; // @[jtag_ssp.scala 226:27:@476.4]
  wire  _T_371; // @[jtag_ssp.scala 227:27:@477.4]
  wire  _T_373; // @[jtag_ssp.scala 228:27:@478.4]
  wire  _T_375; // @[jtag_ssp.scala 229:27:@479.4]
  wire  _T_377; // @[jtag_ssp.scala 230:27:@480.4]
  wire  _T_379; // @[jtag_ssp.scala 231:27:@481.4]
  wire  _T_381; // @[jtag_ssp.scala 232:27:@482.4]
  wire  _T_383; // @[jtag_ssp.scala 233:27:@483.4]
  wire  _T_385; // @[jtag_ssp.scala 234:27:@484.4]
  wire  _T_387; // @[jtag_ssp.scala 235:27:@485.4]
  wire  _T_389; // @[jtag_ssp.scala 236:27:@486.4]
  wire  _T_391; // @[jtag_ssp.scala 237:27:@487.4]
  wire  _T_393; // @[jtag_ssp.scala 238:27:@488.4]
  wire  _T_395; // @[jtag_ssp.scala 239:27:@489.4]
  wire  _T_397; // @[jtag_ssp.scala 240:27:@490.4]
  wire  _T_399; // @[jtag_ssp.scala 241:27:@491.4]
  wire  _T_401; // @[jtag_ssp.scala 242:27:@492.4]
  wire  _T_403; // @[jtag_ssp.scala 243:27:@493.4]
  reg  _T_406; // @[jtag_ssp.scala 246:25:@494.4]
  reg [31:0] _RAND_24;
  reg  _T_409; // @[jtag_ssp.scala 247:25:@495.4]
  reg [31:0] _RAND_25;
  reg  _T_412; // @[jtag_ssp.scala 248:25:@496.4]
  reg [31:0] _RAND_26;
  reg  _T_415; // @[jtag_ssp.scala 249:25:@497.4]
  reg [31:0] _RAND_27;
  reg  _T_418; // @[jtag_ssp.scala 250:25:@498.4]
  reg [31:0] _RAND_28;
  reg  _T_421; // @[jtag_ssp.scala 251:25:@499.4]
  reg [31:0] _RAND_29;
  reg  _T_424; // @[jtag_ssp.scala 252:25:@500.4]
  reg [31:0] _RAND_30;
  reg  _T_427; // @[jtag_ssp.scala 253:25:@501.4]
  reg [31:0] _RAND_31;
  reg  _T_430; // @[jtag_ssp.scala 254:25:@502.4]
  reg [31:0] _RAND_32;
  reg  _T_433; // @[jtag_ssp.scala 255:25:@503.4]
  reg [31:0] _RAND_33;
  reg  _T_436; // @[jtag_ssp.scala 256:25:@504.4]
  reg [31:0] _RAND_34;
  reg  _T_439; // @[jtag_ssp.scala 257:25:@505.4]
  reg [31:0] _RAND_35;
  reg  _T_442; // @[jtag_ssp.scala 258:25:@506.4]
  reg [31:0] _RAND_36;
  reg  _T_445; // @[jtag_ssp.scala 259:25:@507.4]
  reg [31:0] _RAND_37;
  reg  _T_448; // @[jtag_ssp.scala 260:25:@508.4]
  reg [31:0] _RAND_38;
  reg  _T_451; // @[jtag_ssp.scala 261:25:@509.4]
  reg [31:0] _RAND_39;
  reg  _T_454; // @[jtag_ssp.scala 262:25:@510.4]
  reg [31:0] _RAND_40;
  reg  _T_457; // @[jtag_ssp.scala 263:25:@511.4]
  reg [31:0] _RAND_41;
  reg  _T_460; // @[jtag_ssp.scala 264:25:@512.4]
  reg [31:0] _RAND_42;
  reg  _T_463; // @[jtag_ssp.scala 265:25:@513.4]
  reg [31:0] _RAND_43;
  reg  _T_466; // @[jtag_ssp.scala 266:25:@514.4]
  reg [31:0] _RAND_44;
  reg  _T_469; // @[jtag_ssp.scala 267:25:@515.4]
  reg [31:0] _RAND_45;
  reg  _T_472; // @[jtag_ssp.scala 268:25:@516.4]
  reg [31:0] _RAND_46;
  reg  _T_475; // @[jtag_ssp.scala 269:25:@517.4]
  reg [31:0] _RAND_47;
  reg  _T_478; // @[jtag_ssp.scala 270:25:@518.4]
  reg [31:0] _RAND_48;
  reg  _T_481; // @[jtag_ssp.scala 271:25:@519.4]
  reg [31:0] _RAND_49;
  reg  _T_484; // @[jtag_ssp.scala 272:25:@520.4]
  reg [31:0] _RAND_50;
  reg  _T_487; // @[jtag_ssp.scala 273:25:@521.4]
  reg [31:0] _RAND_51;
  reg  _T_490; // @[jtag_ssp.scala 274:25:@522.4]
  reg [31:0] _RAND_52;
  reg  _T_493; // @[jtag_ssp.scala 275:25:@523.4]
  reg [31:0] _RAND_53;
  reg  _T_496; // @[jtag_ssp.scala 276:25:@524.4]
  reg [31:0] _RAND_54;
  reg  _T_499; // @[jtag_ssp.scala 277:25:@525.4]
  reg [31:0] _RAND_55;
  wire  _T_500; // @[jtag_ssp.scala 280:16:@526.4]
  wire [1:0] _T_501; // @[Cat.scala 30:58:@527.4]
  wire [1:0] _T_502; // @[Cat.scala 30:58:@528.4]
  wire [3:0] _T_503; // @[Cat.scala 30:58:@529.4]
  wire [1:0] _T_504; // @[Cat.scala 30:58:@530.4]
  wire [1:0] _T_505; // @[Cat.scala 30:58:@531.4]
  wire [3:0] _T_506; // @[Cat.scala 30:58:@532.4]
  wire [7:0] _T_507; // @[Cat.scala 30:58:@533.4]
  wire [1:0] _T_508; // @[Cat.scala 30:58:@534.4]
  wire [1:0] _T_509; // @[Cat.scala 30:58:@535.4]
  wire [3:0] _T_510; // @[Cat.scala 30:58:@536.4]
  wire [1:0] _T_511; // @[Cat.scala 30:58:@537.4]
  wire [1:0] _T_512; // @[Cat.scala 30:58:@538.4]
  wire [3:0] _T_513; // @[Cat.scala 30:58:@539.4]
  wire [7:0] _T_514; // @[Cat.scala 30:58:@540.4]
  wire [15:0] _T_515; // @[Cat.scala 30:58:@541.4]
  wire [1:0] _T_516; // @[Cat.scala 30:58:@542.4]
  wire [1:0] _T_517; // @[Cat.scala 30:58:@543.4]
  wire [3:0] _T_518; // @[Cat.scala 30:58:@544.4]
  wire [1:0] _T_519; // @[Cat.scala 30:58:@545.4]
  wire [1:0] _T_520; // @[Cat.scala 30:58:@546.4]
  wire [3:0] _T_521; // @[Cat.scala 30:58:@547.4]
  wire [7:0] _T_522; // @[Cat.scala 30:58:@548.4]
  wire [1:0] _T_523; // @[Cat.scala 30:58:@549.4]
  wire [1:0] _T_524; // @[Cat.scala 30:58:@550.4]
  wire [3:0] _T_525; // @[Cat.scala 30:58:@551.4]
  wire [1:0] _T_526; // @[Cat.scala 30:58:@552.4]
  wire [1:0] _T_527; // @[Cat.scala 30:58:@553.4]
  wire [3:0] _T_528; // @[Cat.scala 30:58:@554.4]
  wire [7:0] _T_529; // @[Cat.scala 30:58:@555.4]
  wire [15:0] _T_530; // @[Cat.scala 30:58:@556.4]
  wire  _T_532; // @[jtag_ssp.scala 291:26:@559.4]
  wire  _T_533; // @[jtag_ssp.scala 291:18:@560.4]
  wire  _T_534; // @[jtag_ssp.scala 292:26:@562.4]
  wire  _T_535; // @[jtag_ssp.scala 292:18:@563.4]
  wire  _T_536; // @[jtag_ssp.scala 293:26:@565.4]
  wire  _T_537; // @[jtag_ssp.scala 293:18:@566.4]
  wire  _T_538; // @[jtag_ssp.scala 294:26:@568.4]
  wire  _T_539; // @[jtag_ssp.scala 294:18:@569.4]
  wire  _T_540; // @[jtag_ssp.scala 295:26:@571.4]
  wire  _T_541; // @[jtag_ssp.scala 295:18:@572.4]
  wire  _T_542; // @[jtag_ssp.scala 296:26:@574.4]
  wire  _T_543; // @[jtag_ssp.scala 296:18:@575.4]
  wire  _T_544; // @[jtag_ssp.scala 297:26:@577.4]
  wire  _T_545; // @[jtag_ssp.scala 297:18:@578.4]
  wire  _T_546; // @[jtag_ssp.scala 298:26:@580.4]
  wire  _T_547; // @[jtag_ssp.scala 298:18:@581.4]
  wire  _T_548; // @[jtag_ssp.scala 299:26:@583.4]
  wire  _T_549; // @[jtag_ssp.scala 299:18:@584.4]
  wire  _T_550; // @[jtag_ssp.scala 300:26:@586.4]
  wire  _T_551; // @[jtag_ssp.scala 300:18:@587.4]
  wire  _T_552; // @[jtag_ssp.scala 301:26:@589.4]
  wire  _T_553; // @[jtag_ssp.scala 301:18:@590.4]
  wire  _T_554; // @[jtag_ssp.scala 302:26:@592.4]
  wire  _T_555; // @[jtag_ssp.scala 302:18:@593.4]
  wire  _T_556; // @[jtag_ssp.scala 303:26:@595.4]
  wire  _T_557; // @[jtag_ssp.scala 303:18:@596.4]
  wire  _T_558; // @[jtag_ssp.scala 304:26:@598.4]
  wire  _T_559; // @[jtag_ssp.scala 304:18:@599.4]
  wire  _T_560; // @[jtag_ssp.scala 305:26:@601.4]
  wire  _T_561; // @[jtag_ssp.scala 305:18:@602.4]
  wire  _T_562; // @[jtag_ssp.scala 306:26:@604.4]
  wire  _T_563; // @[jtag_ssp.scala 306:18:@605.4]
  wire  _T_564; // @[jtag_ssp.scala 307:26:@607.4]
  wire  _T_565; // @[jtag_ssp.scala 307:18:@608.4]
  wire  _T_566; // @[jtag_ssp.scala 308:26:@610.4]
  wire  _T_567; // @[jtag_ssp.scala 308:18:@611.4]
  wire  _T_568; // @[jtag_ssp.scala 309:26:@613.4]
  wire  _T_569; // @[jtag_ssp.scala 309:18:@614.4]
  wire  _T_570; // @[jtag_ssp.scala 310:26:@616.4]
  wire  _T_571; // @[jtag_ssp.scala 310:18:@617.4]
  wire  _T_572; // @[jtag_ssp.scala 311:26:@619.4]
  wire  _T_573; // @[jtag_ssp.scala 311:18:@620.4]
  wire  _T_574; // @[jtag_ssp.scala 312:26:@622.4]
  wire  _T_575; // @[jtag_ssp.scala 312:18:@623.4]
  wire  _T_576; // @[jtag_ssp.scala 313:26:@625.4]
  wire  _T_577; // @[jtag_ssp.scala 313:18:@626.4]
  wire  _T_578; // @[jtag_ssp.scala 314:26:@628.4]
  wire  _T_579; // @[jtag_ssp.scala 314:18:@629.4]
  wire  _T_580; // @[jtag_ssp.scala 315:26:@631.4]
  wire  _T_581; // @[jtag_ssp.scala 315:18:@632.4]
  wire  _T_582; // @[jtag_ssp.scala 316:26:@634.4]
  wire  _T_583; // @[jtag_ssp.scala 316:18:@635.4]
  wire  _T_584; // @[jtag_ssp.scala 317:26:@637.4]
  wire  _T_585; // @[jtag_ssp.scala 317:18:@638.4]
  wire  _T_586; // @[jtag_ssp.scala 318:26:@640.4]
  wire  _T_587; // @[jtag_ssp.scala 318:18:@641.4]
  wire  _T_588; // @[jtag_ssp.scala 319:26:@643.4]
  wire  _T_589; // @[jtag_ssp.scala 319:18:@644.4]
  wire  _T_590; // @[jtag_ssp.scala 320:26:@646.4]
  wire  _T_591; // @[jtag_ssp.scala 320:18:@647.4]
  wire  _T_592; // @[jtag_ssp.scala 321:26:@649.4]
  wire  _T_593; // @[jtag_ssp.scala 321:18:@650.4]
  wire  _T_594; // @[jtag_ssp.scala 322:26:@652.4]
  wire  _T_595; // @[jtag_ssp.scala 322:18:@653.4]
  wire  _T_596; // @[jtag_ssp.scala 326:19:@655.4]
  wire  _T_597; // @[Conditional.scala 37:30:@657.4]
  wire [1:0] _T_598; // @[jtag_ssp.scala 331:39:@659.6]
  wire [8:0] _GEN_56; // @[jtag_ssp.scala 340:47:@669.6]
  wire [8:0] _T_607; // @[jtag_ssp.scala 340:47:@669.6]
  wire  _T_609; // @[Conditional.scala 37:30:@674.6]
  wire  _T_610; // @[jtag_ssp.scala 345:52:@676.8]
  wire [1:0] _T_611; // @[jtag_ssp.scala 345:39:@677.8]
  wire [63:0] _T_617; // @[jtag_ssp.scala 349:38:@683.8]
  wire [63:0] _T_620; // @[jtag_ssp.scala 350:38:@686.8]
  wire  _T_632; // @[Conditional.scala 37:30:@701.8]
  wire  _T_633; // @[jtag_ssp.scala 362:43:@704.10]
  wire [62:0] _T_634; // @[jtag_ssp.scala 363:44:@706.10]
  wire  _T_635; // @[jtag_ssp.scala 365:43:@708.10]
  wire [62:0] _T_636; // @[jtag_ssp.scala 366:44:@710.10]
  wire  _T_637; // @[jtag_ssp.scala 368:41:@712.10]
  wire [64:0] _GEN_58; // @[jtag_ssp.scala 369:43:@714.10]
  wire [64:0] _T_638; // @[jtag_ssp.scala 369:43:@714.10]
  wire  _T_642; // @[Conditional.scala 37:30:@721.10]
  wire  _T_648; // @[jtag_ssp.scala 379:86:@727.12]
  wire [8:0] _T_651; // @[jtag_ssp.scala 379:119:@728.12]
  wire [7:0] _T_652; // @[jtag_ssp.scala 379:119:@729.12]
  wire [7:0] _T_653; // @[jtag_ssp.scala 379:72:@730.12]
  wire [7:0] _T_654; // @[jtag_ssp.scala 379:39:@731.12]
  wire  _T_661; // @[jtag_ssp.scala 380:73:@738.12]
  wire [1:0] _T_662; // @[jtag_ssp.scala 380:39:@739.12]
  wire [8:0] _T_670; // @[jtag_ssp.scala 381:82:@745.12]
  wire [7:0] _T_671; // @[jtag_ssp.scala 381:82:@746.12]
  wire [7:0] _T_672; // @[jtag_ssp.scala 381:39:@747.12]
  wire  _T_674; // @[jtag_ssp.scala 383:49:@749.12]
  wire  _T_675; // @[jtag_ssp.scala 383:63:@750.12]
  wire  _T_676; // @[jtag_ssp.scala 383:39:@751.12]
  wire [64:0] _T_680; // @[jtag_ssp.scala 384:39:@755.12]
  wire  _T_684; // @[jtag_ssp.scala 387:39:@759.12]
  wire [63:0] _T_688; // @[jtag_ssp.scala 388:39:@763.12]
  wire  _T_692; // @[jtag_ssp.scala 390:39:@767.12]
  wire [63:0] _T_696; // @[jtag_ssp.scala 391:39:@771.12]
  wire [7:0] _GEN_10; // @[Conditional.scala 39:67:@722.10]
  wire [1:0] _GEN_11; // @[Conditional.scala 39:67:@722.10]
  wire [7:0] _GEN_12; // @[Conditional.scala 39:67:@722.10]
  wire  _GEN_13; // @[Conditional.scala 39:67:@722.10]
  wire [64:0] _GEN_14; // @[Conditional.scala 39:67:@722.10]
  wire  _GEN_15; // @[Conditional.scala 39:67:@722.10]
  wire [63:0] _GEN_16; // @[Conditional.scala 39:67:@722.10]
  wire  _GEN_17; // @[Conditional.scala 39:67:@722.10]
  wire [63:0] _GEN_18; // @[Conditional.scala 39:67:@722.10]
  wire  _GEN_19; // @[Conditional.scala 39:67:@722.10]
  wire [1:0] _GEN_20; // @[Conditional.scala 39:67:@702.8]
  wire  _GEN_21; // @[Conditional.scala 39:67:@702.8]
  wire [63:0] _GEN_22; // @[Conditional.scala 39:67:@702.8]
  wire  _GEN_23; // @[Conditional.scala 39:67:@702.8]
  wire [63:0] _GEN_24; // @[Conditional.scala 39:67:@702.8]
  wire  _GEN_25; // @[Conditional.scala 39:67:@702.8]
  wire [64:0] _GEN_26; // @[Conditional.scala 39:67:@702.8]
  wire [7:0] _GEN_27; // @[Conditional.scala 39:67:@702.8]
  wire [7:0] _GEN_28; // @[Conditional.scala 39:67:@702.8]
  wire  _GEN_29; // @[Conditional.scala 39:67:@702.8]
  wire [1:0] _GEN_30; // @[Conditional.scala 39:67:@675.6]
  wire  _GEN_31; // @[Conditional.scala 39:67:@675.6]
  wire  _GEN_32; // @[Conditional.scala 39:67:@675.6]
  wire  _GEN_33; // @[Conditional.scala 39:67:@675.6]
  wire [63:0] _GEN_34; // @[Conditional.scala 39:67:@675.6]
  wire [63:0] _GEN_35; // @[Conditional.scala 39:67:@675.6]
  wire  _GEN_36; // @[Conditional.scala 39:67:@675.6]
  wire  _GEN_37; // @[Conditional.scala 39:67:@675.6]
  wire [64:0] _GEN_38; // @[Conditional.scala 39:67:@675.6]
  wire [7:0] _GEN_39; // @[Conditional.scala 39:67:@675.6]
  wire [8:0] _GEN_40; // @[Conditional.scala 39:67:@675.6]
  wire  _GEN_41; // @[Conditional.scala 39:67:@675.6]
  wire [7:0] _GEN_42; // @[Conditional.scala 39:67:@675.6]
  wire [1:0] _GEN_43; // @[Conditional.scala 40:58:@658.4]
  wire  _GEN_44; // @[Conditional.scala 40:58:@658.4]
  wire  _GEN_45; // @[Conditional.scala 40:58:@658.4]
  wire  _GEN_46; // @[Conditional.scala 40:58:@658.4]
  wire  _GEN_47; // @[Conditional.scala 40:58:@658.4]
  wire  _GEN_48; // @[Conditional.scala 40:58:@658.4]
  wire [7:0] _GEN_49; // @[Conditional.scala 40:58:@658.4]
  wire [7:0] _GEN_50; // @[Conditional.scala 40:58:@658.4]
  wire [64:0] _GEN_51; // @[Conditional.scala 40:58:@658.4]
  wire [8:0] _GEN_52; // @[Conditional.scala 40:58:@658.4]
  wire  _GEN_53; // @[Conditional.scala 40:58:@658.4]
  wire [63:0] _GEN_54; // @[Conditional.scala 40:58:@658.4]
  wire [63:0] _GEN_55; // @[Conditional.scala 40:58:@658.4]
  QueueModule_jtag QueueModule_jtag ( // @[jtag_ssp.scala 75:21:@194.4]
    .clock(QueueModule_jtag_clock),
    .reset(QueueModule_jtag_reset),
    .io_i_ready(QueueModule_jtag_io_i_ready),
    .io_i_valid(QueueModule_jtag_io_i_valid),
    .io_i_bits(QueueModule_jtag_io_i_bits),
    .io_o_ready(QueueModule_jtag_io_o_ready),
    .io_o_valid(QueueModule_jtag_io_o_valid),
    .io_o_bits(QueueModule_jtag_io_o_bits)
  );
  QueueModule_jtag QueueModule_jtag_1 ( // @[jtag_ssp.scala 76:21:@197.4]
    .clock(QueueModule_jtag_1_clock),
    .reset(QueueModule_jtag_1_reset),
    .io_i_ready(QueueModule_jtag_1_io_i_ready),
    .io_i_valid(QueueModule_jtag_1_io_i_valid),
    .io_i_bits(QueueModule_jtag_1_io_i_bits),
    .io_o_ready(QueueModule_jtag_1_io_o_ready),
    .io_o_valid(QueueModule_jtag_1_io_o_valid),
    .io_o_bits(QueueModule_jtag_1_io_o_bits)
  );
  QueueModule_jtag_2 QueueModule_jtag_2 ( // @[jtag_ssp.scala 77:21:@200.4]
    .clock(QueueModule_jtag_2_clock),
    .reset(QueueModule_jtag_2_reset),
    .io_i_ready(QueueModule_jtag_2_io_i_ready),
    .io_i_valid(QueueModule_jtag_2_io_i_valid),
    .io_i_bits(QueueModule_jtag_2_io_i_bits),
    .io_o_ready(QueueModule_jtag_2_io_o_ready),
    .io_o_valid(QueueModule_jtag_2_io_o_valid),
    .io_o_bits(QueueModule_jtag_2_io_o_bits)
  );
  assign _T_43 = ~ io_PRESETn; // @[jtag_ssp.scala 43:28:@175.4]
  assign _T_83 = io_PWDATA[31]; // @[jtag_ssp.scala 85:26:@204.4]
  assign _T_85 = io_PWDATA[30]; // @[jtag_ssp.scala 86:26:@206.4]
  assign _T_87 = io_PWDATA[29]; // @[jtag_ssp.scala 87:26:@208.4]
  assign _T_89 = io_PWDATA[28]; // @[jtag_ssp.scala 88:26:@210.4]
  assign _T_91 = io_PWDATA[27]; // @[jtag_ssp.scala 89:26:@212.4]
  assign _T_93 = io_PWDATA[26]; // @[jtag_ssp.scala 90:26:@214.4]
  assign _T_95 = io_PWDATA[25]; // @[jtag_ssp.scala 91:26:@216.4]
  assign _T_97 = io_PWDATA[24]; // @[jtag_ssp.scala 92:26:@218.4]
  assign _T_99 = io_PWDATA[23]; // @[jtag_ssp.scala 93:26:@220.4]
  assign _T_101 = io_PWDATA[22]; // @[jtag_ssp.scala 94:26:@222.4]
  assign _T_103 = io_PWDATA[21]; // @[jtag_ssp.scala 95:26:@224.4]
  assign _T_105 = io_PWDATA[20]; // @[jtag_ssp.scala 96:26:@226.4]
  assign _T_107 = io_PWDATA[19]; // @[jtag_ssp.scala 97:26:@228.4]
  assign _T_109 = io_PWDATA[18]; // @[jtag_ssp.scala 98:26:@230.4]
  assign _T_111 = io_PWDATA[17]; // @[jtag_ssp.scala 99:26:@232.4]
  assign _T_113 = io_PWDATA[16]; // @[jtag_ssp.scala 100:26:@234.4]
  assign _T_115 = io_PWDATA[15]; // @[jtag_ssp.scala 101:26:@236.4]
  assign _T_117 = io_PWDATA[14]; // @[jtag_ssp.scala 102:26:@238.4]
  assign _T_119 = io_PWDATA[13]; // @[jtag_ssp.scala 103:26:@240.4]
  assign _T_121 = io_PWDATA[12]; // @[jtag_ssp.scala 104:26:@242.4]
  assign _T_123 = io_PWDATA[11]; // @[jtag_ssp.scala 105:26:@244.4]
  assign _T_125 = io_PWDATA[10]; // @[jtag_ssp.scala 106:26:@246.4]
  assign _T_127 = io_PWDATA[9]; // @[jtag_ssp.scala 107:26:@248.4]
  assign _T_129 = io_PWDATA[8]; // @[jtag_ssp.scala 108:26:@250.4]
  assign _T_131 = io_PWDATA[7]; // @[jtag_ssp.scala 109:26:@252.4]
  assign _T_133 = io_PWDATA[6]; // @[jtag_ssp.scala 110:26:@254.4]
  assign _T_135 = io_PWDATA[5]; // @[jtag_ssp.scala 111:26:@256.4]
  assign _T_137 = io_PWDATA[4]; // @[jtag_ssp.scala 112:26:@258.4]
  assign _T_139 = io_PWDATA[3]; // @[jtag_ssp.scala 113:26:@260.4]
  assign _T_141 = io_PWDATA[2]; // @[jtag_ssp.scala 114:26:@262.4]
  assign _T_143 = io_PWDATA[1]; // @[jtag_ssp.scala 115:26:@264.4]
  assign _T_145 = io_PWDATA[0]; // @[jtag_ssp.scala 116:26:@266.4]
  assign _T_147 = {_T_145,_T_145}; // @[Cat.scala 30:58:@268.4]
  assign _T_148 = {_T_143,_T_143}; // @[Cat.scala 30:58:@269.4]
  assign _T_149 = {_T_148,_T_147}; // @[Cat.scala 30:58:@270.4]
  assign _T_150 = {_T_141,_T_141}; // @[Cat.scala 30:58:@271.4]
  assign _T_151 = {_T_139,_T_139}; // @[Cat.scala 30:58:@272.4]
  assign _T_152 = {_T_151,_T_150}; // @[Cat.scala 30:58:@273.4]
  assign _T_153 = {_T_152,_T_149}; // @[Cat.scala 30:58:@274.4]
  assign _T_154 = {_T_137,_T_137}; // @[Cat.scala 30:58:@275.4]
  assign _T_155 = {_T_135,_T_135}; // @[Cat.scala 30:58:@276.4]
  assign _T_156 = {_T_155,_T_154}; // @[Cat.scala 30:58:@277.4]
  assign _T_157 = {_T_133,_T_133}; // @[Cat.scala 30:58:@278.4]
  assign _T_158 = {_T_131,_T_131}; // @[Cat.scala 30:58:@279.4]
  assign _T_159 = {_T_158,_T_157}; // @[Cat.scala 30:58:@280.4]
  assign _T_160 = {_T_159,_T_156}; // @[Cat.scala 30:58:@281.4]
  assign _T_161 = {_T_160,_T_153}; // @[Cat.scala 30:58:@282.4]
  assign _T_162 = {_T_129,_T_129}; // @[Cat.scala 30:58:@283.4]
  assign _T_163 = {_T_127,_T_127}; // @[Cat.scala 30:58:@284.4]
  assign _T_164 = {_T_163,_T_162}; // @[Cat.scala 30:58:@285.4]
  assign _T_165 = {_T_125,_T_125}; // @[Cat.scala 30:58:@286.4]
  assign _T_166 = {_T_123,_T_123}; // @[Cat.scala 30:58:@287.4]
  assign _T_167 = {_T_166,_T_165}; // @[Cat.scala 30:58:@288.4]
  assign _T_168 = {_T_167,_T_164}; // @[Cat.scala 30:58:@289.4]
  assign _T_169 = {_T_121,_T_121}; // @[Cat.scala 30:58:@290.4]
  assign _T_170 = {_T_119,_T_119}; // @[Cat.scala 30:58:@291.4]
  assign _T_171 = {_T_170,_T_169}; // @[Cat.scala 30:58:@292.4]
  assign _T_172 = {_T_117,_T_117}; // @[Cat.scala 30:58:@293.4]
  assign _T_173 = {_T_115,_T_115}; // @[Cat.scala 30:58:@294.4]
  assign _T_174 = {_T_173,_T_172}; // @[Cat.scala 30:58:@295.4]
  assign _T_175 = {_T_174,_T_171}; // @[Cat.scala 30:58:@296.4]
  assign _T_176 = {_T_175,_T_168}; // @[Cat.scala 30:58:@297.4]
  assign _T_177 = {_T_176,_T_161}; // @[Cat.scala 30:58:@298.4]
  assign _T_178 = {_T_113,_T_113}; // @[Cat.scala 30:58:@299.4]
  assign _T_179 = {_T_111,_T_111}; // @[Cat.scala 30:58:@300.4]
  assign _T_180 = {_T_179,_T_178}; // @[Cat.scala 30:58:@301.4]
  assign _T_181 = {_T_109,_T_109}; // @[Cat.scala 30:58:@302.4]
  assign _T_182 = {_T_107,_T_107}; // @[Cat.scala 30:58:@303.4]
  assign _T_183 = {_T_182,_T_181}; // @[Cat.scala 30:58:@304.4]
  assign _T_184 = {_T_183,_T_180}; // @[Cat.scala 30:58:@305.4]
  assign _T_185 = {_T_105,_T_105}; // @[Cat.scala 30:58:@306.4]
  assign _T_186 = {_T_103,_T_103}; // @[Cat.scala 30:58:@307.4]
  assign _T_187 = {_T_186,_T_185}; // @[Cat.scala 30:58:@308.4]
  assign _T_188 = {_T_101,_T_101}; // @[Cat.scala 30:58:@309.4]
  assign _T_189 = {_T_99,_T_99}; // @[Cat.scala 30:58:@310.4]
  assign _T_190 = {_T_189,_T_188}; // @[Cat.scala 30:58:@311.4]
  assign _T_191 = {_T_190,_T_187}; // @[Cat.scala 30:58:@312.4]
  assign _T_192 = {_T_191,_T_184}; // @[Cat.scala 30:58:@313.4]
  assign _T_193 = {_T_97,_T_97}; // @[Cat.scala 30:58:@314.4]
  assign _T_194 = {_T_95,_T_95}; // @[Cat.scala 30:58:@315.4]
  assign _T_195 = {_T_194,_T_193}; // @[Cat.scala 30:58:@316.4]
  assign _T_196 = {_T_93,_T_93}; // @[Cat.scala 30:58:@317.4]
  assign _T_197 = {_T_91,_T_91}; // @[Cat.scala 30:58:@318.4]
  assign _T_198 = {_T_197,_T_196}; // @[Cat.scala 30:58:@319.4]
  assign _T_199 = {_T_198,_T_195}; // @[Cat.scala 30:58:@320.4]
  assign _T_200 = {_T_89,_T_89}; // @[Cat.scala 30:58:@321.4]
  assign _T_201 = {_T_87,_T_87}; // @[Cat.scala 30:58:@322.4]
  assign _T_202 = {_T_201,_T_200}; // @[Cat.scala 30:58:@323.4]
  assign _T_203 = {_T_85,_T_85}; // @[Cat.scala 30:58:@324.4]
  assign _T_204 = {_T_83,_T_83}; // @[Cat.scala 30:58:@325.4]
  assign _T_205 = {_T_204,_T_203}; // @[Cat.scala 30:58:@326.4]
  assign _T_206 = {_T_205,_T_202}; // @[Cat.scala 30:58:@327.4]
  assign _T_207 = {_T_206,_T_199}; // @[Cat.scala 30:58:@328.4]
  assign _T_208 = {_T_207,_T_192}; // @[Cat.scala 30:58:@329.4]
  assign _T_209 = {_T_208,_T_177}; // @[Cat.scala 30:58:@330.4]
  assign _T_230 = io_PSEL & io_PWRITE; // @[jtag_ssp.scala 145:15:@348.4]
  assign _T_231 = _T_230 & io_PENABLE; // @[jtag_ssp.scala 145:28:@349.4]
  assign _T_240 = io_PADDR == 8'h0; // @[jtag_ssp.scala 145:60:@351.4]
  assign _T_241 = _T_231 & _T_240; // @[jtag_ssp.scala 145:42:@352.4]
  assign _GEN_0 = _T_241 ? _T_145 : _T_215; // @[jtag_ssp.scala 145:87:@353.4]
  assign _GEN_1 = _T_241 ? _T_143 : _T_212; // @[jtag_ssp.scala 145:87:@353.4]
  assign _T_247 = io_PADDR == 8'h20; // @[jtag_ssp.scala 149:60:@362.4]
  assign _T_248 = _T_231 & _T_247; // @[jtag_ssp.scala 149:42:@363.4]
  assign _T_249 = io_PWDATA[7:0]; // @[jtag_ssp.scala 150:28:@365.6]
  assign _GEN_2 = _T_248 ? _T_249 : _T_73; // @[jtag_ssp.scala 149:88:@364.4]
  assign _T_259 = io_PADDR == 8'h10; // @[jtag_ssp.scala 155:61:@373.4]
  assign _T_260 = _T_231 & _T_259; // @[jtag_ssp.scala 155:43:@374.4]
  assign _GEN_3 = _T_260 ? _T_249 : _T_252; // @[jtag_ssp.scala 155:89:@375.4]
  assign _T_265 = io_PADDR == 8'h4; // @[jtag_ssp.scala 160:60:@382.4]
  assign _T_266 = _T_231 & _T_265; // @[jtag_ssp.scala 160:42:@383.4]
  assign _T_272 = io_PADDR == 8'h8; // @[jtag_ssp.scala 167:60:@393.4]
  assign _T_273 = _T_231 & _T_272; // @[jtag_ssp.scala 167:42:@394.4]
  assign _T_280 = io_PWRITE == 1'h0; // @[jtag_ssp.scala 177:18:@402.4]
  assign _T_281 = io_PSEL & _T_280; // @[jtag_ssp.scala 177:15:@403.4]
  assign _T_283 = io_PENABLE == 1'h0; // @[jtag_ssp.scala 177:32:@404.4]
  assign _T_284 = _T_281 & _T_283; // @[jtag_ssp.scala 177:29:@405.4]
  assign _T_287 = _T_284 & _T_240; // @[jtag_ssp.scala 177:44:@408.4]
  assign _T_289 = {QueueModule_jtag_io_i_ready,QueueModule_jtag_io_o_valid}; // @[Cat.scala 30:58:@410.6]
  assign _T_290 = {QueueModule_jtag_1_io_i_ready,QueueModule_jtag_1_io_o_valid}; // @[Cat.scala 30:58:@411.6]
  assign _T_291 = {_T_290,_T_289}; // @[Cat.scala 30:58:@412.6]
  assign _T_292 = {QueueModule_jtag_2_io_i_ready,QueueModule_jtag_2_io_o_valid}; // @[Cat.scala 30:58:@413.6]
  assign _T_293 = {25'h0,_T_278}; // @[Cat.scala 30:58:@414.6]
  assign _T_294 = {_T_293,_T_292}; // @[Cat.scala 30:58:@415.6]
  assign _T_295 = {_T_294,_T_291}; // @[Cat.scala 30:58:@416.6]
  assign _GEN_6 = _T_287 ? _T_295 : _T_82; // @[jtag_ssp.scala 177:89:@409.4]
  assign _T_303 = io_PADDR == 8'hc; // @[jtag_ssp.scala 181:62:@424.4]
  assign _T_304 = _T_284 & _T_303; // @[jtag_ssp.scala 181:44:@425.4]
  assign _GEN_7 = _T_304 ? QueueModule_jtag_2_io_o_bits : _GEN_6; // @[jtag_ssp.scala 181:92:@426.4]
  assign _GEN_8 = _T_304 ? 1'h1 : _T_70; // @[jtag_ssp.scala 181:92:@426.4]
  assign _T_309 = io_PADDR == 8'h14; // @[jtag_ssp.scala 188:60:@436.4]
  assign _T_310 = _T_231 & _T_309; // @[jtag_ssp.scala 188:42:@437.4]
  assign _GEN_9 = _T_310 ? _T_145 : 1'h0; // @[jtag_ssp.scala 188:86:@438.4]
  assign _T_336 = _T_73 - 8'h1; // @[jtag_ssp.scala 210:37:@458.4]
  assign _T_337 = $unsigned(_T_336); // @[jtag_ssp.scala 210:37:@459.4]
  assign _T_338 = _T_337[7:0]; // @[jtag_ssp.scala 210:37:@460.4]
  assign _T_339 = _T_76 == _T_338; // @[jtag_ssp.scala 210:24:@461.4]
  assign _T_341 = _T_79 == 8'h1; // @[jtag_ssp.scala 212:27:@462.4]
  assign _T_343 = _T_79 == 8'h3; // @[jtag_ssp.scala 213:27:@463.4]
  assign _T_345 = _T_79 == 8'h5; // @[jtag_ssp.scala 214:27:@464.4]
  assign _T_347 = _T_79 == 8'h7; // @[jtag_ssp.scala 215:27:@465.4]
  assign _T_349 = _T_79 == 8'h9; // @[jtag_ssp.scala 216:27:@466.4]
  assign _T_351 = _T_79 == 8'hb; // @[jtag_ssp.scala 217:27:@467.4]
  assign _T_353 = _T_79 == 8'hd; // @[jtag_ssp.scala 218:27:@468.4]
  assign _T_355 = _T_79 == 8'hf; // @[jtag_ssp.scala 219:27:@469.4]
  assign _T_357 = _T_79 == 8'h11; // @[jtag_ssp.scala 220:27:@470.4]
  assign _T_359 = _T_79 == 8'h13; // @[jtag_ssp.scala 221:27:@471.4]
  assign _T_361 = _T_79 == 8'h15; // @[jtag_ssp.scala 222:27:@472.4]
  assign _T_363 = _T_79 == 8'h17; // @[jtag_ssp.scala 223:27:@473.4]
  assign _T_365 = _T_79 == 8'h19; // @[jtag_ssp.scala 224:27:@474.4]
  assign _T_367 = _T_79 == 8'h1b; // @[jtag_ssp.scala 225:27:@475.4]
  assign _T_369 = _T_79 == 8'h1d; // @[jtag_ssp.scala 226:27:@476.4]
  assign _T_371 = _T_79 == 8'h1f; // @[jtag_ssp.scala 227:27:@477.4]
  assign _T_373 = _T_79 == 8'h21; // @[jtag_ssp.scala 228:27:@478.4]
  assign _T_375 = _T_79 == 8'h23; // @[jtag_ssp.scala 229:27:@479.4]
  assign _T_377 = _T_79 == 8'h25; // @[jtag_ssp.scala 230:27:@480.4]
  assign _T_379 = _T_79 == 8'h27; // @[jtag_ssp.scala 231:27:@481.4]
  assign _T_381 = _T_79 == 8'h29; // @[jtag_ssp.scala 232:27:@482.4]
  assign _T_383 = _T_79 == 8'h2b; // @[jtag_ssp.scala 233:27:@483.4]
  assign _T_385 = _T_79 == 8'h2d; // @[jtag_ssp.scala 234:27:@484.4]
  assign _T_387 = _T_79 == 8'h2f; // @[jtag_ssp.scala 235:27:@485.4]
  assign _T_389 = _T_79 == 8'h31; // @[jtag_ssp.scala 236:27:@486.4]
  assign _T_391 = _T_79 == 8'h33; // @[jtag_ssp.scala 237:27:@487.4]
  assign _T_393 = _T_79 == 8'h35; // @[jtag_ssp.scala 238:27:@488.4]
  assign _T_395 = _T_79 == 8'h37; // @[jtag_ssp.scala 239:27:@489.4]
  assign _T_397 = _T_79 == 8'h39; // @[jtag_ssp.scala 240:27:@490.4]
  assign _T_399 = _T_79 == 8'h3b; // @[jtag_ssp.scala 241:27:@491.4]
  assign _T_401 = _T_79 == 8'h3d; // @[jtag_ssp.scala 242:27:@492.4]
  assign _T_403 = _T_79 == 8'h3f; // @[jtag_ssp.scala 243:27:@493.4]
  assign _T_500 = _T_212 ? _T_46 : io_TDI; // @[jtag_ssp.scala 280:16:@526.4]
  assign _T_501 = {_T_409,_T_406}; // @[Cat.scala 30:58:@527.4]
  assign _T_502 = {_T_415,_T_412}; // @[Cat.scala 30:58:@528.4]
  assign _T_503 = {_T_502,_T_501}; // @[Cat.scala 30:58:@529.4]
  assign _T_504 = {_T_421,_T_418}; // @[Cat.scala 30:58:@530.4]
  assign _T_505 = {_T_427,_T_424}; // @[Cat.scala 30:58:@531.4]
  assign _T_506 = {_T_505,_T_504}; // @[Cat.scala 30:58:@532.4]
  assign _T_507 = {_T_506,_T_503}; // @[Cat.scala 30:58:@533.4]
  assign _T_508 = {_T_433,_T_430}; // @[Cat.scala 30:58:@534.4]
  assign _T_509 = {_T_439,_T_436}; // @[Cat.scala 30:58:@535.4]
  assign _T_510 = {_T_509,_T_508}; // @[Cat.scala 30:58:@536.4]
  assign _T_511 = {_T_445,_T_442}; // @[Cat.scala 30:58:@537.4]
  assign _T_512 = {_T_451,_T_448}; // @[Cat.scala 30:58:@538.4]
  assign _T_513 = {_T_512,_T_511}; // @[Cat.scala 30:58:@539.4]
  assign _T_514 = {_T_513,_T_510}; // @[Cat.scala 30:58:@540.4]
  assign _T_515 = {_T_514,_T_507}; // @[Cat.scala 30:58:@541.4]
  assign _T_516 = {_T_457,_T_454}; // @[Cat.scala 30:58:@542.4]
  assign _T_517 = {_T_463,_T_460}; // @[Cat.scala 30:58:@543.4]
  assign _T_518 = {_T_517,_T_516}; // @[Cat.scala 30:58:@544.4]
  assign _T_519 = {_T_469,_T_466}; // @[Cat.scala 30:58:@545.4]
  assign _T_520 = {_T_475,_T_472}; // @[Cat.scala 30:58:@546.4]
  assign _T_521 = {_T_520,_T_519}; // @[Cat.scala 30:58:@547.4]
  assign _T_522 = {_T_521,_T_518}; // @[Cat.scala 30:58:@548.4]
  assign _T_523 = {_T_481,_T_478}; // @[Cat.scala 30:58:@549.4]
  assign _T_524 = {_T_487,_T_484}; // @[Cat.scala 30:58:@550.4]
  assign _T_525 = {_T_524,_T_523}; // @[Cat.scala 30:58:@551.4]
  assign _T_526 = {_T_493,_T_490}; // @[Cat.scala 30:58:@552.4]
  assign _T_527 = {_T_499,_T_496}; // @[Cat.scala 30:58:@553.4]
  assign _T_528 = {_T_527,_T_526}; // @[Cat.scala 30:58:@554.4]
  assign _T_529 = {_T_528,_T_525}; // @[Cat.scala 30:58:@555.4]
  assign _T_530 = {_T_529,_T_522}; // @[Cat.scala 30:58:@556.4]
  assign _T_532 = _T_339 & _T_341; // @[jtag_ssp.scala 291:26:@559.4]
  assign _T_533 = _T_532 ? _T_500 : _T_406; // @[jtag_ssp.scala 291:18:@560.4]
  assign _T_534 = _T_339 & _T_343; // @[jtag_ssp.scala 292:26:@562.4]
  assign _T_535 = _T_534 ? _T_500 : _T_409; // @[jtag_ssp.scala 292:18:@563.4]
  assign _T_536 = _T_339 & _T_345; // @[jtag_ssp.scala 293:26:@565.4]
  assign _T_537 = _T_536 ? _T_500 : _T_412; // @[jtag_ssp.scala 293:18:@566.4]
  assign _T_538 = _T_339 & _T_347; // @[jtag_ssp.scala 294:26:@568.4]
  assign _T_539 = _T_538 ? _T_500 : _T_415; // @[jtag_ssp.scala 294:18:@569.4]
  assign _T_540 = _T_339 & _T_349; // @[jtag_ssp.scala 295:26:@571.4]
  assign _T_541 = _T_540 ? _T_500 : _T_418; // @[jtag_ssp.scala 295:18:@572.4]
  assign _T_542 = _T_339 & _T_351; // @[jtag_ssp.scala 296:26:@574.4]
  assign _T_543 = _T_542 ? _T_500 : _T_421; // @[jtag_ssp.scala 296:18:@575.4]
  assign _T_544 = _T_339 & _T_353; // @[jtag_ssp.scala 297:26:@577.4]
  assign _T_545 = _T_544 ? _T_500 : _T_424; // @[jtag_ssp.scala 297:18:@578.4]
  assign _T_546 = _T_339 & _T_355; // @[jtag_ssp.scala 298:26:@580.4]
  assign _T_547 = _T_546 ? _T_500 : _T_427; // @[jtag_ssp.scala 298:18:@581.4]
  assign _T_548 = _T_339 & _T_357; // @[jtag_ssp.scala 299:26:@583.4]
  assign _T_549 = _T_548 ? _T_500 : _T_430; // @[jtag_ssp.scala 299:18:@584.4]
  assign _T_550 = _T_339 & _T_359; // @[jtag_ssp.scala 300:26:@586.4]
  assign _T_551 = _T_550 ? _T_500 : _T_433; // @[jtag_ssp.scala 300:18:@587.4]
  assign _T_552 = _T_339 & _T_361; // @[jtag_ssp.scala 301:26:@589.4]
  assign _T_553 = _T_552 ? _T_500 : _T_436; // @[jtag_ssp.scala 301:18:@590.4]
  assign _T_554 = _T_339 & _T_363; // @[jtag_ssp.scala 302:26:@592.4]
  assign _T_555 = _T_554 ? _T_500 : _T_439; // @[jtag_ssp.scala 302:18:@593.4]
  assign _T_556 = _T_339 & _T_365; // @[jtag_ssp.scala 303:26:@595.4]
  assign _T_557 = _T_556 ? _T_500 : _T_442; // @[jtag_ssp.scala 303:18:@596.4]
  assign _T_558 = _T_339 & _T_367; // @[jtag_ssp.scala 304:26:@598.4]
  assign _T_559 = _T_558 ? _T_500 : _T_445; // @[jtag_ssp.scala 304:18:@599.4]
  assign _T_560 = _T_339 & _T_369; // @[jtag_ssp.scala 305:26:@601.4]
  assign _T_561 = _T_560 ? _T_500 : _T_448; // @[jtag_ssp.scala 305:18:@602.4]
  assign _T_562 = _T_339 & _T_371; // @[jtag_ssp.scala 306:26:@604.4]
  assign _T_563 = _T_562 ? _T_500 : _T_451; // @[jtag_ssp.scala 306:18:@605.4]
  assign _T_564 = _T_339 & _T_373; // @[jtag_ssp.scala 307:26:@607.4]
  assign _T_565 = _T_564 ? _T_500 : _T_454; // @[jtag_ssp.scala 307:18:@608.4]
  assign _T_566 = _T_339 & _T_375; // @[jtag_ssp.scala 308:26:@610.4]
  assign _T_567 = _T_566 ? _T_500 : _T_457; // @[jtag_ssp.scala 308:18:@611.4]
  assign _T_568 = _T_339 & _T_377; // @[jtag_ssp.scala 309:26:@613.4]
  assign _T_569 = _T_568 ? _T_500 : _T_460; // @[jtag_ssp.scala 309:18:@614.4]
  assign _T_570 = _T_339 & _T_379; // @[jtag_ssp.scala 310:26:@616.4]
  assign _T_571 = _T_570 ? _T_500 : _T_463; // @[jtag_ssp.scala 310:18:@617.4]
  assign _T_572 = _T_339 & _T_381; // @[jtag_ssp.scala 311:26:@619.4]
  assign _T_573 = _T_572 ? _T_500 : _T_466; // @[jtag_ssp.scala 311:18:@620.4]
  assign _T_574 = _T_339 & _T_383; // @[jtag_ssp.scala 312:26:@622.4]
  assign _T_575 = _T_574 ? _T_500 : _T_469; // @[jtag_ssp.scala 312:18:@623.4]
  assign _T_576 = _T_339 & _T_385; // @[jtag_ssp.scala 313:26:@625.4]
  assign _T_577 = _T_576 ? _T_500 : _T_472; // @[jtag_ssp.scala 313:18:@626.4]
  assign _T_578 = _T_339 & _T_387; // @[jtag_ssp.scala 314:26:@628.4]
  assign _T_579 = _T_578 ? _T_500 : _T_475; // @[jtag_ssp.scala 314:18:@629.4]
  assign _T_580 = _T_339 & _T_389; // @[jtag_ssp.scala 315:26:@631.4]
  assign _T_581 = _T_580 ? _T_500 : _T_478; // @[jtag_ssp.scala 315:18:@632.4]
  assign _T_582 = _T_339 & _T_391; // @[jtag_ssp.scala 316:26:@634.4]
  assign _T_583 = _T_582 ? _T_500 : _T_481; // @[jtag_ssp.scala 316:18:@635.4]
  assign _T_584 = _T_339 & _T_393; // @[jtag_ssp.scala 317:26:@637.4]
  assign _T_585 = _T_584 ? _T_500 : _T_484; // @[jtag_ssp.scala 317:18:@638.4]
  assign _T_586 = _T_339 & _T_395; // @[jtag_ssp.scala 318:26:@640.4]
  assign _T_587 = _T_586 ? _T_500 : _T_487; // @[jtag_ssp.scala 318:18:@641.4]
  assign _T_588 = _T_339 & _T_397; // @[jtag_ssp.scala 319:26:@643.4]
  assign _T_589 = _T_588 ? _T_500 : _T_490; // @[jtag_ssp.scala 319:18:@644.4]
  assign _T_590 = _T_339 & _T_399; // @[jtag_ssp.scala 320:26:@646.4]
  assign _T_591 = _T_590 ? _T_500 : _T_493; // @[jtag_ssp.scala 320:18:@647.4]
  assign _T_592 = _T_339 & _T_401; // @[jtag_ssp.scala 321:26:@649.4]
  assign _T_593 = _T_592 ? _T_500 : _T_496; // @[jtag_ssp.scala 321:18:@650.4]
  assign _T_594 = _T_339 & _T_403; // @[jtag_ssp.scala 322:26:@652.4]
  assign _T_595 = _T_594 ? _T_500 : _T_499; // @[jtag_ssp.scala 322:18:@653.4]
  assign _T_596 = _T_334 == 2'h0; // @[jtag_ssp.scala 326:19:@655.4]
  assign _T_597 = 2'h0 == _T_334; // @[Conditional.scala 37:30:@657.4]
  assign _T_598 = _T_215 ? 2'h1 : 2'h0; // @[jtag_ssp.scala 331:39:@659.6]
  assign _GEN_56 = {{1'd0}, _T_252}; // @[jtag_ssp.scala 340:47:@669.6]
  assign _T_607 = _GEN_56 << 1; // @[jtag_ssp.scala 340:47:@669.6]
  assign _T_609 = 2'h1 == _T_334; // @[Conditional.scala 37:30:@674.6]
  assign _T_610 = QueueModule_jtag_1_io_o_valid & QueueModule_jtag_io_o_valid; // @[jtag_ssp.scala 345:52:@676.8]
  assign _T_611 = _T_610 ? 2'h2 : 2'h1; // @[jtag_ssp.scala 345:39:@677.8]
  assign _T_617 = _T_610 ? QueueModule_jtag_1_io_o_bits : 64'h0; // @[jtag_ssp.scala 349:38:@683.8]
  assign _T_620 = _T_610 ? QueueModule_jtag_io_o_bits : 64'h0; // @[jtag_ssp.scala 350:38:@686.8]
  assign _T_632 = 2'h2 == _T_334; // @[Conditional.scala 37:30:@701.8]
  assign _T_633 = _T_61[0]; // @[jtag_ssp.scala 362:43:@704.10]
  assign _T_634 = _T_61[63:1]; // @[jtag_ssp.scala 363:44:@706.10]
  assign _T_635 = _T_64[0]; // @[jtag_ssp.scala 365:43:@708.10]
  assign _T_636 = _T_64[63:1]; // @[jtag_ssp.scala 366:44:@710.10]
  assign _T_637 = _T_315[31]; // @[jtag_ssp.scala 368:41:@712.10]
  assign _GEN_58 = {{1'd0}, _T_315}; // @[jtag_ssp.scala 369:43:@714.10]
  assign _T_638 = _GEN_58 << 1; // @[jtag_ssp.scala 369:43:@714.10]
  assign _T_642 = 2'h3 == _T_334; // @[Conditional.scala 37:30:@721.10]
  assign _T_648 = _T_79 == _T_255; // @[jtag_ssp.scala 379:86:@727.12]
  assign _T_651 = _T_79 + 8'h1; // @[jtag_ssp.scala 379:119:@728.12]
  assign _T_652 = _T_651[7:0]; // @[jtag_ssp.scala 379:119:@729.12]
  assign _T_653 = _T_648 ? 8'h0 : _T_652; // @[jtag_ssp.scala 379:72:@730.12]
  assign _T_654 = _T_339 ? _T_653 : _T_79; // @[jtag_ssp.scala 379:39:@731.12]
  assign _T_661 = _T_339 & _T_648; // @[jtag_ssp.scala 380:73:@738.12]
  assign _T_662 = _T_661 ? 2'h0 : 2'h3; // @[jtag_ssp.scala 380:39:@739.12]
  assign _T_670 = _T_76 + 8'h1; // @[jtag_ssp.scala 381:82:@745.12]
  assign _T_671 = _T_670[7:0]; // @[jtag_ssp.scala 381:82:@746.12]
  assign _T_672 = _T_339 ? 8'h0 : _T_671; // @[jtag_ssp.scala 381:39:@747.12]
  assign _T_674 = _T_76 == 8'h0; // @[jtag_ssp.scala 383:49:@749.12]
  assign _T_675 = _T_315[63]; // @[jtag_ssp.scala 383:63:@750.12]
  assign _T_676 = _T_674 ? _T_675 : _T_52; // @[jtag_ssp.scala 383:39:@751.12]
  assign _T_680 = _T_674 ? _T_638 : {{1'd0}, _T_315}; // @[jtag_ssp.scala 384:39:@755.12]
  assign _T_684 = _T_674 ? _T_635 : _T_49; // @[jtag_ssp.scala 387:39:@759.12]
  assign _T_688 = _T_674 ? {{1'd0}, _T_636} : _T_64; // @[jtag_ssp.scala 388:39:@763.12]
  assign _T_692 = _T_674 ? _T_633 : _T_46; // @[jtag_ssp.scala 390:39:@767.12]
  assign _T_696 = _T_674 ? {{1'd0}, _T_634} : _T_61; // @[jtag_ssp.scala 391:39:@771.12]
  assign _GEN_10 = _T_642 ? _T_654 : _T_79; // @[Conditional.scala 39:67:@722.10]
  assign _GEN_11 = _T_642 ? _T_662 : _T_334; // @[Conditional.scala 39:67:@722.10]
  assign _GEN_12 = _T_642 ? _T_672 : _T_76; // @[Conditional.scala 39:67:@722.10]
  assign _GEN_13 = _T_642 ? _T_676 : _T_52; // @[Conditional.scala 39:67:@722.10]
  assign _GEN_14 = _T_642 ? _T_680 : {{1'd0}, _T_315}; // @[Conditional.scala 39:67:@722.10]
  assign _GEN_15 = _T_642 ? _T_684 : _T_49; // @[Conditional.scala 39:67:@722.10]
  assign _GEN_16 = _T_642 ? _T_688 : _T_64; // @[Conditional.scala 39:67:@722.10]
  assign _GEN_17 = _T_642 ? _T_692 : _T_46; // @[Conditional.scala 39:67:@722.10]
  assign _GEN_18 = _T_642 ? _T_696 : _T_61; // @[Conditional.scala 39:67:@722.10]
  assign _GEN_19 = _T_642 ? _T_661 : _T_227; // @[Conditional.scala 39:67:@722.10]
  assign _GEN_20 = _T_632 ? 2'h3 : _GEN_11; // @[Conditional.scala 39:67:@702.8]
  assign _GEN_21 = _T_632 ? _T_633 : _GEN_17; // @[Conditional.scala 39:67:@702.8]
  assign _GEN_22 = _T_632 ? {{1'd0}, _T_634} : _GEN_18; // @[Conditional.scala 39:67:@702.8]
  assign _GEN_23 = _T_632 ? _T_635 : _GEN_15; // @[Conditional.scala 39:67:@702.8]
  assign _GEN_24 = _T_632 ? {{1'd0}, _T_636} : _GEN_16; // @[Conditional.scala 39:67:@702.8]
  assign _GEN_25 = _T_632 ? _T_637 : _GEN_13; // @[Conditional.scala 39:67:@702.8]
  assign _GEN_26 = _T_632 ? _T_638 : _GEN_14; // @[Conditional.scala 39:67:@702.8]
  assign _GEN_27 = _T_632 ? 8'h0 : _GEN_10; // @[Conditional.scala 39:67:@702.8]
  assign _GEN_28 = _T_632 ? 8'h1 : _GEN_12; // @[Conditional.scala 39:67:@702.8]
  assign _GEN_29 = _T_632 ? 1'h0 : _GEN_19; // @[Conditional.scala 39:67:@702.8]
  assign _GEN_30 = _T_609 ? _T_611 : _GEN_20; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_31 = _T_609 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_32 = _T_609 ? 1'h0 : _GEN_25; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_33 = _T_609 ? 1'h0 : _GEN_23; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_34 = _T_609 ? _T_617 : _GEN_22; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_35 = _T_609 ? _T_620 : _GEN_24; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_36 = _T_609 ? _T_610 : _T_55; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_37 = _T_609 ? _T_610 : _T_58; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_38 = _T_609 ? 65'h5555555555555555 : _GEN_26; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_39 = _T_609 ? 8'h0 : _GEN_27; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_40 = _T_609 ? _T_607 : {{1'd0}, _T_255}; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_41 = _T_609 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_42 = _T_609 ? _T_76 : _GEN_28; // @[Conditional.scala 39:67:@675.6]
  assign _GEN_43 = _T_597 ? _T_598 : _GEN_30; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_44 = _T_597 ? 1'h0 : _GEN_31; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_45 = _T_597 ? 1'h0 : _GEN_32; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_46 = _T_597 ? 1'h0 : _GEN_33; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_47 = _T_597 ? 1'h0 : _GEN_36; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_48 = _T_597 ? 1'h0 : _GEN_37; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_49 = _T_597 ? 8'h0 : _GEN_42; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_50 = _T_597 ? 8'h0 : _GEN_39; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_51 = _T_597 ? 65'h0 : _GEN_38; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_52 = _T_597 ? _T_607 : _GEN_40; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_53 = _T_597 ? 1'h0 : _GEN_41; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_54 = _T_597 ? _T_61 : _GEN_34; // @[Conditional.scala 40:58:@658.4]
  assign _GEN_55 = _T_597 ? _T_64 : _GEN_35; // @[Conditional.scala 40:58:@658.4]
  assign io_PREADY = 1'h0; // @[jtag_ssp.scala 40:12:@173.4]
  assign io_PRDATA = _T_82; // @[jtag_ssp.scala 82:11:@203.4]
  assign io_PSLVERR = 1'h0; // @[jtag_ssp.scala 41:12:@174.4]
  assign io_TMS = _T_49; // @[jtag_ssp.scala 48:8:@179.4]
  assign io_TCK = _T_52; // @[jtag_ssp.scala 49:8:@180.4]
  assign io_TDO = _T_46; // @[jtag_ssp.scala 50:8:@181.4]
  assign io_JTAC = _T_79; // @[jtag_ssp.scala 67:9:@191.4]
  assign io_DIVI = _T_76; // @[jtag_ssp.scala 68:9:@192.4]
  assign QueueModule_jtag_clock = io_PCLK; // @[:@195.4]
  assign QueueModule_jtag_reset = ~ io_PRESETn; // @[:@196.4]
  assign QueueModule_jtag_io_i_valid = _T_218; // @[jtag_ssp.scala 130:20:@339.4]
  assign QueueModule_jtag_io_i_bits = _T_67; // @[jtag_ssp.scala 129:20:@338.4]
  assign QueueModule_jtag_io_o_ready = _T_55 | _T_70; // @[jtag_ssp.scala 131:20:@341.4]
  assign QueueModule_jtag_1_clock = io_PCLK; // @[:@198.4]
  assign QueueModule_jtag_1_reset = ~ io_PRESETn; // @[:@199.4]
  assign QueueModule_jtag_1_io_i_valid = _T_221; // @[jtag_ssp.scala 135:20:@343.4]
  assign QueueModule_jtag_1_io_i_bits = _T_67; // @[jtag_ssp.scala 134:20:@342.4]
  assign QueueModule_jtag_1_io_o_ready = _T_58 | _T_70; // @[jtag_ssp.scala 136:20:@345.4]
  assign QueueModule_jtag_2_clock = io_PCLK; // @[:@201.4]
  assign QueueModule_jtag_2_reset = ~ io_PRESETn; // @[:@202.4]
  assign QueueModule_jtag_2_io_i_valid = _T_227; // @[jtag_ssp.scala 140:20:@347.4]
  assign QueueModule_jtag_2_io_i_bits = {_T_530,_T_515}; // @[jtag_ssp.scala 289:19:@558.4]
  assign QueueModule_jtag_2_io_o_ready = _T_224; // @[jtag_ssp.scala 139:20:@346.4]
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
  _T_46 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_49 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_52 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_55 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_58 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  _T_61 = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  _T_64 = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  _T_67 = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_70 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_73 = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_76 = _RAND_10[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_79 = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_82 = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_212 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_215 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_218 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_221 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_224 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_227 = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_252 = _RAND_19[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_255 = _RAND_20[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_278 = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {2{`RANDOM}};
  _T_315 = _RAND_22[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_334 = _RAND_23[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_406 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_409 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_412 = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_415 = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_418 = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_421 = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_424 = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  _T_427 = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  _T_430 = _RAND_32[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  _T_433 = _RAND_33[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  _T_436 = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  _T_439 = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  _T_442 = _RAND_36[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  _T_445 = _RAND_37[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  _T_448 = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  _T_451 = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  _T_454 = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  _T_457 = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  _T_460 = _RAND_42[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  _T_463 = _RAND_43[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  _T_466 = _RAND_44[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  _T_469 = _RAND_45[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  _T_472 = _RAND_46[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  _T_475 = _RAND_47[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  _T_478 = _RAND_48[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  _T_481 = _RAND_49[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  _T_484 = _RAND_50[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  _T_487 = _RAND_51[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{`RANDOM}};
  _T_490 = _RAND_52[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  _T_493 = _RAND_53[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{`RANDOM}};
  _T_496 = _RAND_54[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  _T_499 = _RAND_55[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge io_PCLK) begin
    if (_T_43) begin
      _T_46 <= 1'h1;
    end else begin
      if (_T_597) begin
        _T_46 <= 1'h0;
      end else begin
        if (_T_609) begin
          _T_46 <= 1'h0;
        end else begin
          if (_T_632) begin
            _T_46 <= _T_633;
          end else begin
            if (_T_642) begin
              if (_T_674) begin
                _T_46 <= _T_633;
              end
            end
          end
        end
      end
    end
    if (_T_43) begin
      _T_49 <= 1'h1;
    end else begin
      if (_T_597) begin
        _T_49 <= 1'h0;
      end else begin
        if (_T_609) begin
          _T_49 <= 1'h0;
        end else begin
          if (_T_632) begin
            _T_49 <= _T_635;
          end else begin
            if (_T_642) begin
              if (_T_674) begin
                _T_49 <= _T_635;
              end
            end
          end
        end
      end
    end
    if (_T_43) begin
      _T_52 <= 1'h0;
    end else begin
      if (_T_597) begin
        _T_52 <= 1'h0;
      end else begin
        if (_T_609) begin
          _T_52 <= 1'h0;
        end else begin
          if (_T_632) begin
            _T_52 <= _T_637;
          end else begin
            if (_T_642) begin
              if (_T_674) begin
                _T_52 <= _T_675;
              end
            end
          end
        end
      end
    end
    if (_T_43) begin
      _T_55 <= 1'h0;
    end else begin
      if (_T_597) begin
        _T_55 <= 1'h0;
      end else begin
        if (_T_609) begin
          _T_55 <= _T_610;
        end
      end
    end
    if (_T_43) begin
      _T_58 <= 1'h0;
    end else begin
      if (_T_597) begin
        _T_58 <= 1'h0;
      end else begin
        if (_T_609) begin
          _T_58 <= _T_610;
        end
      end
    end
    if (_T_43) begin
      _T_61 <= 64'h0;
    end else begin
      if (!(_T_597)) begin
        if (_T_609) begin
          if (_T_610) begin
            _T_61 <= QueueModule_jtag_1_io_o_bits;
          end else begin
            _T_61 <= 64'h0;
          end
        end else begin
          if (_T_632) begin
            _T_61 <= {{1'd0}, _T_634};
          end else begin
            if (_T_642) begin
              if (_T_674) begin
                _T_61 <= {{1'd0}, _T_634};
              end
            end
          end
        end
      end
    end
    if (_T_43) begin
      _T_64 <= 64'h0;
    end else begin
      if (!(_T_597)) begin
        if (_T_609) begin
          if (_T_610) begin
            _T_64 <= QueueModule_jtag_io_o_bits;
          end else begin
            _T_64 <= 64'h0;
          end
        end else begin
          if (_T_632) begin
            _T_64 <= {{1'd0}, _T_636};
          end else begin
            if (_T_642) begin
              if (_T_674) begin
                _T_64 <= {{1'd0}, _T_636};
              end
            end
          end
        end
      end
    end
    if (_T_43) begin
      _T_67 <= 64'h0;
    end else begin
      _T_67 <= _T_209;
    end
    if (_T_43) begin
      _T_70 <= 1'h0;
    end else begin
      if (_T_310) begin
        _T_70 <= _T_145;
      end else begin
        _T_70 <= 1'h0;
      end
    end
    if (_T_43) begin
      _T_73 <= 8'h2;
    end else begin
      if (_T_248) begin
        _T_73 <= _T_249;
      end
    end
    if (_T_43) begin
      _T_76 <= 8'h2;
    end else begin
      if (_T_597) begin
        _T_76 <= 8'h0;
      end else begin
        if (!(_T_609)) begin
          if (_T_632) begin
            _T_76 <= 8'h1;
          end else begin
            if (_T_642) begin
              if (_T_339) begin
                _T_76 <= 8'h0;
              end else begin
                _T_76 <= _T_671;
              end
            end
          end
        end
      end
    end
    if (_T_43) begin
      _T_79 <= 8'h0;
    end else begin
      if (_T_597) begin
        _T_79 <= 8'h0;
      end else begin
        if (_T_609) begin
          _T_79 <= 8'h0;
        end else begin
          if (_T_632) begin
            _T_79 <= 8'h0;
          end else begin
            if (_T_642) begin
              if (_T_339) begin
                if (_T_648) begin
                  _T_79 <= 8'h0;
                end else begin
                  _T_79 <= _T_652;
                end
              end
            end
          end
        end
      end
    end
    if (_T_43) begin
      _T_82 <= 32'h0;
    end else begin
      if (_T_304) begin
        _T_82 <= QueueModule_jtag_2_io_o_bits;
      end else begin
        if (_T_287) begin
          _T_82 <= _T_295;
        end
      end
    end
    if (_T_43) begin
      _T_212 <= 1'h0;
    end else begin
      if (_T_241) begin
        _T_212 <= _T_143;
      end
    end
    if (_T_43) begin
      _T_215 <= 1'h0;
    end else begin
      if (_T_241) begin
        _T_215 <= _T_145;
      end
    end
    if (_T_43) begin
      _T_218 <= 1'h0;
    end else begin
      _T_218 <= _T_266;
    end
    if (_T_43) begin
      _T_221 <= 1'h0;
    end else begin
      _T_221 <= _T_273;
    end
    if (_T_43) begin
      _T_224 <= 1'h0;
    end else begin
      if (_T_304) begin
        _T_224 <= 1'h1;
      end else begin
        _T_224 <= _T_70;
      end
    end
    if (_T_43) begin
      _T_227 <= 1'h0;
    end else begin
      if (_T_597) begin
        _T_227 <= 1'h0;
      end else begin
        if (_T_609) begin
          _T_227 <= 1'h0;
        end else begin
          if (_T_632) begin
            _T_227 <= 1'h0;
          end else begin
            if (_T_642) begin
              _T_227 <= _T_661;
            end
          end
        end
      end
    end
    if (_T_43) begin
      _T_252 <= 8'h0;
    end else begin
      if (_T_260) begin
        _T_252 <= _T_249;
      end
    end
    if (_T_43) begin
      _T_255 <= 8'h0;
    end else begin
      _T_255 <= _GEN_52[7:0];
    end
    if (_T_43) begin
      _T_278 <= 1'h0;
    end else begin
      _T_278 <= _T_596;
    end
    if (_T_43) begin
      _T_315 <= 64'h0;
    end else begin
      _T_315 <= _GEN_51[63:0];
    end
    if (_T_43) begin
      _T_334 <= 2'h0;
    end else begin
      if (_T_597) begin
        if (_T_215) begin
          _T_334 <= 2'h1;
        end else begin
          _T_334 <= 2'h0;
        end
      end else begin
        if (_T_609) begin
          if (_T_610) begin
            _T_334 <= 2'h2;
          end else begin
            _T_334 <= 2'h1;
          end
        end else begin
          if (_T_632) begin
            _T_334 <= 2'h3;
          end else begin
            if (_T_642) begin
              if (_T_661) begin
                _T_334 <= 2'h0;
              end else begin
                _T_334 <= 2'h3;
              end
            end
          end
        end
      end
    end
    if (_T_43) begin
      _T_406 <= 1'h0;
    end else begin
      if (_T_532) begin
        if (_T_212) begin
          _T_406 <= _T_46;
        end else begin
          _T_406 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_409 <= 1'h0;
    end else begin
      if (_T_534) begin
        if (_T_212) begin
          _T_409 <= _T_46;
        end else begin
          _T_409 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_412 <= 1'h0;
    end else begin
      if (_T_536) begin
        if (_T_212) begin
          _T_412 <= _T_46;
        end else begin
          _T_412 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_415 <= 1'h0;
    end else begin
      if (_T_538) begin
        if (_T_212) begin
          _T_415 <= _T_46;
        end else begin
          _T_415 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_418 <= 1'h0;
    end else begin
      if (_T_540) begin
        if (_T_212) begin
          _T_418 <= _T_46;
        end else begin
          _T_418 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_421 <= 1'h0;
    end else begin
      if (_T_542) begin
        if (_T_212) begin
          _T_421 <= _T_46;
        end else begin
          _T_421 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_424 <= 1'h0;
    end else begin
      if (_T_544) begin
        if (_T_212) begin
          _T_424 <= _T_46;
        end else begin
          _T_424 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_427 <= 1'h0;
    end else begin
      if (_T_546) begin
        if (_T_212) begin
          _T_427 <= _T_46;
        end else begin
          _T_427 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_430 <= 1'h0;
    end else begin
      if (_T_548) begin
        if (_T_212) begin
          _T_430 <= _T_46;
        end else begin
          _T_430 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_433 <= 1'h0;
    end else begin
      if (_T_550) begin
        if (_T_212) begin
          _T_433 <= _T_46;
        end else begin
          _T_433 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_436 <= 1'h0;
    end else begin
      if (_T_552) begin
        if (_T_212) begin
          _T_436 <= _T_46;
        end else begin
          _T_436 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_439 <= 1'h0;
    end else begin
      if (_T_554) begin
        if (_T_212) begin
          _T_439 <= _T_46;
        end else begin
          _T_439 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_442 <= 1'h0;
    end else begin
      if (_T_556) begin
        if (_T_212) begin
          _T_442 <= _T_46;
        end else begin
          _T_442 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_445 <= 1'h0;
    end else begin
      if (_T_558) begin
        if (_T_212) begin
          _T_445 <= _T_46;
        end else begin
          _T_445 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_448 <= 1'h0;
    end else begin
      if (_T_560) begin
        if (_T_212) begin
          _T_448 <= _T_46;
        end else begin
          _T_448 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_451 <= 1'h0;
    end else begin
      if (_T_562) begin
        if (_T_212) begin
          _T_451 <= _T_46;
        end else begin
          _T_451 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_454 <= 1'h0;
    end else begin
      if (_T_564) begin
        if (_T_212) begin
          _T_454 <= _T_46;
        end else begin
          _T_454 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_457 <= 1'h0;
    end else begin
      if (_T_566) begin
        if (_T_212) begin
          _T_457 <= _T_46;
        end else begin
          _T_457 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_460 <= 1'h0;
    end else begin
      if (_T_568) begin
        if (_T_212) begin
          _T_460 <= _T_46;
        end else begin
          _T_460 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_463 <= 1'h0;
    end else begin
      if (_T_570) begin
        if (_T_212) begin
          _T_463 <= _T_46;
        end else begin
          _T_463 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_466 <= 1'h0;
    end else begin
      if (_T_572) begin
        if (_T_212) begin
          _T_466 <= _T_46;
        end else begin
          _T_466 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_469 <= 1'h0;
    end else begin
      if (_T_574) begin
        if (_T_212) begin
          _T_469 <= _T_46;
        end else begin
          _T_469 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_472 <= 1'h0;
    end else begin
      if (_T_576) begin
        if (_T_212) begin
          _T_472 <= _T_46;
        end else begin
          _T_472 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_475 <= 1'h0;
    end else begin
      if (_T_578) begin
        if (_T_212) begin
          _T_475 <= _T_46;
        end else begin
          _T_475 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_478 <= 1'h0;
    end else begin
      if (_T_580) begin
        if (_T_212) begin
          _T_478 <= _T_46;
        end else begin
          _T_478 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_481 <= 1'h0;
    end else begin
      if (_T_582) begin
        if (_T_212) begin
          _T_481 <= _T_46;
        end else begin
          _T_481 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_484 <= 1'h0;
    end else begin
      if (_T_584) begin
        if (_T_212) begin
          _T_484 <= _T_46;
        end else begin
          _T_484 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_487 <= 1'h0;
    end else begin
      if (_T_586) begin
        if (_T_212) begin
          _T_487 <= _T_46;
        end else begin
          _T_487 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_490 <= 1'h0;
    end else begin
      if (_T_588) begin
        if (_T_212) begin
          _T_490 <= _T_46;
        end else begin
          _T_490 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_493 <= 1'h0;
    end else begin
      if (_T_590) begin
        if (_T_212) begin
          _T_493 <= _T_46;
        end else begin
          _T_493 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_496 <= 1'h0;
    end else begin
      if (_T_592) begin
        if (_T_212) begin
          _T_496 <= _T_46;
        end else begin
          _T_496 <= io_TDI;
        end
      end
    end
    if (_T_43) begin
      _T_499 <= 1'h0;
    end else begin
      if (_T_594) begin
        if (_T_212) begin
          _T_499 <= _T_46;
        end else begin
          _T_499 <= io_TDI;
        end
      end
    end
  end
endmodule
