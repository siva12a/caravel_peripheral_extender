/*
//Copyright 2021 S SIVA PRASAD ssprasad12a@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

`timescale 1ns / 1ps
module i2s_transmitter(

// system clock domain signals


 
 input  wire  PCLK             ,  // system control clock 
 input  wire  PRESETn          ,  // system control reset active low
 input  wire  [31:0] PADDR     ,   
 input  wire  PPROT            ,
 input  wire  PSEL             ,
 input  wire  PENABLE          ,
 input  wire  PWRITE           ,
 input  wire  [31:0] PWDATA    ,    
 input  wire  [3:0] PSTRB      ,  
        
 output  wire  PREADY           ,
 output  reg  [31:0] PRDATA    ,  
 output  wire  PSLVERR          ,
 
 output wire irq                , // interrupt request active high.


 // audio clock domain signals
 input  wire aud_mclk           ,  //this is always the oversampling clock 36.864Mhz clock
 output wire audio_fifo_full_w_sys_port,
 // i2s ports
 output wire lrclk_out          , // left right identifier clock also called  WS , (this is the sampling frequency clock for the stereo data)
 output wire sclk_out           , // bit clock value is lrclk_out (sampling frequency) * no of bits/sample * 2 (stereo mode)
 output wire sdata_out            // audio data value
 );
 // constant port assignments
 assign PREADY = 1'b1;
 assign PSLVERR = 1'b0;
 
 
 
 
// core control regitsers address 
 localparam ENABLE_CORE_REG_ADDRESS                  = 8'h0; 
 localparam AUDIO_FIFO_REG_ADDRESS                   = 8'h4;
 localparam MCLK_TO_SCLK_CLOCK_DIVIDER_REG_ADDRESS   = 8'h8;
 localparam AUDIO_SAMPLE_BIT_REG_ADDRESS             = 8'hc;
 localparam AUDIO_FIFO_RESET_REG_ADDRESS             = 8'h10;
 localparam AUDIO_FIFO_STATUS_REGISTER               = 8'h14;
 localparam INTERRUPT_PENDING_REGISTER               = 8'h18;
 localparam AUDIO_FIFO_INTERRUPT_ENABLE_REGISTER     = 8'h20;
 localparam AUDIO_FIFO_INTERRUPT_WM_REGISTER         = 8'h24;
 // audio states
 localparam IDLE      = 2'b00;
 localparam IDLE_RL    = 2'b01;
 localparam LEFT      = 2'b10;
 localparam RIGHT     = 2'b11;

 
 
 
 
 
 // sys domain registers
 reg [31:0] PRDATA_r_sys ;
 reg enable_core_r_sys;
 reg audio_fifo_wr_en_sys;
 reg [31:0] audio_fifo_wdata_sys;
 reg [31:0] mclk_to_sclk_clock_divider_r_sys;
 reg [5:0]  audio_sample_bit_sys;
 reg issue_audio_fifo_reset_sys;
 reg [4:0] issue_audio_fifo_reset_counter_sys;
 reg issue_audio_fifo_prog_reset_sys;
 //sys domain wire 
 //wire wr_rst_busy_w_sys;
 //wire [3:0] wr_data_count_w_sys;
 //reg  [3:0] wr_data_count_r_sys;
wire audio_fifo_full_w_sys;
//reg audio_fifo_full_r_sys;
reg audio_interrupt_enable_r_sys;
reg [3:0] audio_interrupt_fifo_wm_count_r_sys;
reg irq_r_sw_sys ;

reg audio_tx_complete_r_sys ;
reg audio_tx_complete_rr_sys;
 // audio domain registers

 reg audio_fifo_rd_en_aud;
 reg [31:0] audio_fifo_rdata_r_aud;
 reg [31:0] mclk_to_sclk_clock_divider_r_aud;
 reg [31:0] mclk_to_sclk_clock_divider_rr_aud;
 reg [31:0] mclk_to_sclk_counter;
 reg audio_resetn_rn;
 reg audio_resetn_rrn;
 reg enable_core_r_aud;
 reg enable_core_rr_aud;
 reg [5:0]  audio_sample_bit_r_aud;
 reg [5:0]  audio_sample_bit_rr_aud;
 reg [5:0]  audio_sample_bit_counter_r_aud;
 reg sclk_aud_r;
 reg lrclk_aud_r;
 reg sdata_out_r;
 reg sclk_aud_rn;
 reg lrclk_aud_rn;
 reg sdata_out_rn;
 
 reg sclk_aud_rp;
 reg lrclk_aud_rp;
 reg sdata_out_rp;
 
 reg audio_tx_complete_r_aud;
 reg [1:0] audio_state_r;

 
 //audio domain wires
 wire [31:0] audio_fifo_read_data_w_aud;
 wire audio_fifo_empty_w_aud;
 
 
 //iis port assignments
 assign lrclk_out = lrclk_aud_rn;
 assign sclk_out  = sclk_aud_r & enable_core_rr_aud;
 assign sdata_out = sdata_out_rn;

 assign irq = (audio_interrupt_enable_r_sys &&  enable_core_r_sys ) ? (!audio_fifo_full_w_sys) ? 1 : 0 : 0;
 
 
 assign audio_fifo_full_w_sys_port = audio_fifo_full_w_sys ;
 
 
 
 // control register programming
 always @( posedge PCLK or negedge PRESETn) 
 begin 
 if(!PRESETn) begin
      PRDATA_r_sys                         <= 32'b0;
      enable_core_r_sys                    <= 1'b0;
      audio_fifo_wr_en_sys                 <= 1'b0;
      audio_fifo_wdata_sys                 <= 32'b0;
      mclk_to_sclk_clock_divider_r_sys     <= 2;
      audio_sample_bit_sys                 <= 32;
      issue_audio_fifo_prog_reset_sys      <= 1'b0;
      
      //audio_fifo_full_r_sys                <= 1'b0;      
      PRDATA                               <= 32'b0;
     
      audio_interrupt_enable_r_sys         <= 1'b0;
      audio_interrupt_fifo_wm_count_r_sys  <= 4'b0;
	  irq_r_sw_sys                         <= 1'b0;
 end else begin
     
	 
	 irq_r_sw_sys <= (audio_interrupt_enable_r_sys &&  enable_core_r_sys) ? (!audio_fifo_full_w_sys) ? 1 : 0 : 0;
     // write transactions
     
     //Write any non zero value to enable the core
     if(PSEL && PWRITE && PENABLE && (PADDR[7:0] == ENABLE_CORE_REG_ADDRESS)) begin
     enable_core_r_sys <= (PWDATA == 0) ? 0 : 1;
     end
     
     //audio data enq into fifo
     if(PSEL && PWRITE && PENABLE && (PADDR[7:0] ==  AUDIO_FIFO_REG_ADDRESS) && !audio_fifo_full_w_sys ) begin
       audio_fifo_wr_en_sys <= 1'b1;
       audio_fifo_wdata_sys <= PWDATA;
     end else begin
       audio_fifo_wr_en_sys <= 1'b0;
       audio_fifo_wdata_sys <= 32'b0;  //disable for power saving
    end
    
    // audio sclk generate divider value this value is such that (36.864/sclk) = (divider value * 2)
    if(PSEL && PWRITE && PENABLE && (PADDR[7:0] ==  MCLK_TO_SCLK_CLOCK_DIVIDER_REG_ADDRESS)) begin
       mclk_to_sclk_clock_divider_r_sys <= PWDATA;
    end
    
    // audio sample bit values legal values are 16, 24, 32
    if(PSEL && PWRITE && PENABLE && (PADDR[7:0] ==  AUDIO_SAMPLE_BIT_REG_ADDRESS)) begin
       audio_sample_bit_sys <= PWDATA[5:0];
    end
    
    
    
     if(PSEL && PWRITE && PENABLE && (PADDR[7:0] == AUDIO_FIFO_RESET_REG_ADDRESS)) begin
     issue_audio_fifo_prog_reset_sys <= (PWDATA == 0) ? 0 : 1;
     end else begin 
     issue_audio_fifo_prog_reset_sys <= 1'b0;
     end
     
     //fifo water mark interrupt
     if(PSEL && PWRITE && PENABLE && (PADDR[7:0] == AUDIO_FIFO_INTERRUPT_ENABLE_REGISTER)) begin
       audio_interrupt_enable_r_sys  <= (PWDATA == 0) ? 0 : 1;
     end
     
     
    
     
//// all read procedure happens here
     
   if (PSEL && !PWRITE) begin
   
      case(PADDR[7:0]) 
        ENABLE_CORE_REG_ADDRESS: begin
      PRDATA <= {31'b0,enable_core_r_sys};
      end
      
      AUDIO_FIFO_REG_ADDRESS: begin
        PRDATA <= 32'b0;
      end
      
      MCLK_TO_SCLK_CLOCK_DIVIDER_REG_ADDRESS: begin
         PRDATA <= mclk_to_sclk_clock_divider_r_sys;
      end
      
      AUDIO_SAMPLE_BIT_REG_ADDRESS: begin
        PRDATA <= {26'b0,audio_sample_bit_sys};
      end
      
      AUDIO_FIFO_RESET_REG_ADDRESS: begin
        PRDATA <= 32'b0;
      end
      
      AUDIO_FIFO_INTERRUPT_ENABLE_REGISTER: begin
        PRDATA <= {31'b0,audio_interrupt_enable_r_sys};
      end
      
      AUDIO_FIFO_STATUS_REGISTER : begin          // 2bit is actually the wr reset flag
        PRDATA <= {28'b0,audio_tx_complete_rr_sys,audio_fifo_full_w_sys,!audio_fifo_full_w_sys,audio_fifo_full_w_sys};
      audio_interrupt_enable_r_sys <= 1'b0;
      end
      
	  INTERRUPT_PENDING_REGISTER: begin
	    PRDATA <= {31'b0,irq_r_sw_sys};
	  end
      
      default: 
         PRDATA <= 32'b0;
      endcase
   end else begin
       PRDATA <= 32'b0;
   
   end
   



 end
 end //always block
 
 // issue audio fifo reset
  always @( posedge PCLK or negedge PRESETn) 
 begin 
 if(!PRESETn) begin
   issue_audio_fifo_reset_counter_sys <= 31;
   issue_audio_fifo_reset_sys         <= 1'b0;
   
   audio_tx_complete_r_sys   <=        1'b0;
   audio_tx_complete_rr_sys  <=        1'b0;
 end else begin 
 
 /*issue_audio_fifo_reset_counter_sys[4:3]   issue_audio_fifo_reset_sys
     00                                          0
     01                                          1
     10                                          1
     11                                          0 
   */
  audio_tx_complete_r_sys   <= audio_tx_complete_r_aud ;
  audio_tx_complete_rr_sys  <= audio_tx_complete_r_sys ;
 issue_audio_fifo_reset_sys            <= !(issue_audio_fifo_reset_counter_sys[4] ^ issue_audio_fifo_reset_counter_sys[3]);
 issue_audio_fifo_reset_counter_sys    <= (issue_audio_fifo_reset_counter_sys == 31) ? issue_audio_fifo_prog_reset_sys ? 5'h0 : 31 : (issue_audio_fifo_reset_counter_sys + 1);
   
  end
 end //always block
 
 
 
 //sync reset since 1bit its enough for 2 bit ff sync
 // for static signals also 2 bit is enough
  always @( posedge aud_mclk) begin
  
  audio_resetn_rn    <= PRESETn;
  audio_resetn_rrn   <= audio_resetn_rn;
  
  enable_core_r_aud  <= enable_core_r_sys;
  enable_core_rr_aud <= enable_core_r_aud;
  
  mclk_to_sclk_clock_divider_r_aud <= mclk_to_sclk_clock_divider_r_sys;
  mclk_to_sclk_clock_divider_rr_aud <= mclk_to_sclk_clock_divider_r_aud;
  
  audio_sample_bit_r_aud  <= audio_sample_bit_sys;
  audio_sample_bit_rr_aud <= audio_sample_bit_r_aud;
  

  
  end
 
   reg sclk_aud_rcc;
   reg sclk_aud_rpp;
   //sclk or bclk generator (sclk is also called bclk in some documents bit for texas instruments they use bclk for mclk)
   always @( posedge aud_mclk) begin
   
   if(!audio_resetn_rrn ) begin //!enable_core_rr_aud
     sclk_aud_r <= 0; //insert clock gate sometime
     mclk_to_sclk_counter <= 32'b0;
     sclk_aud_rcc <= 0;
     sclk_aud_rpp <= 0;
     
   end else begin
   
     sclk_aud_r <= (mclk_to_sclk_counter == (mclk_to_sclk_clock_divider_rr_aud - 1)) ? ~sclk_aud_r : sclk_aud_r;
     mclk_to_sclk_counter <= (mclk_to_sclk_counter == (mclk_to_sclk_clock_divider_rr_aud - 1)) ? 0 : (mclk_to_sclk_counter + 32'b1);
     sclk_aud_rcc <= sclk_aud_r;
     sclk_aud_rpp <= sclk_aud_rcc;
     
   end
   
  end
   
   always @( posedge aud_mclk or negedge audio_resetn_rrn) begin
   
   if(!audio_resetn_rrn) begin
     lrclk_aud_r                    <= 1'b1;
     sdata_out_r                    <= 1'b0;
     audio_state_r                  <= IDLE;
     audio_fifo_rd_en_aud           <= 1'b0;
     audio_sample_bit_counter_r_aud <= 6'b0;
     audio_fifo_rdata_r_aud         <= 32'b0;
     audio_tx_complete_r_aud        <= 1'b0;
   end else begin 
        if(sclk_aud_rcc && !sclk_aud_rpp) begin
            
             if(!enable_core_rr_aud) begin
                      lrclk_aud_r                    <= 1'b1;
                      sdata_out_r                    <= 1'b0;
                      audio_state_r                  <= IDLE;
                      audio_fifo_rd_en_aud           <= 1'b0;
                      audio_sample_bit_counter_r_aud <= 6'b0;
                      audio_fifo_rdata_r_aud         <= 32'b0;
                      audio_tx_complete_r_aud        <= 1'b0;
             end else begin
             
                     // audio_tx_complete_r_aud        <= (audio_fifo_empty_w_aud && enable_core_rr_aud);
                      if(audio_sample_bit_counter_r_aud == 0) begin
                         if(audio_fifo_empty_w_aud && enable_core_rr_aud) begin
                            audio_tx_complete_r_aud        <= 1'b1;
                         end else begin  
                            audio_tx_complete_r_aud        <= 1'b0;
                         end
                      end 
             
               case(audio_state_r) 
                 
                 IDLE: begin
                   
                   audio_state_r                  <= (enable_core_rr_aud && !audio_fifo_empty_w_aud) ? LEFT : IDLE;
                   lrclk_aud_r                    <= (enable_core_rr_aud && !audio_fifo_empty_w_aud) ? 1'b0 : 1'b1;
                   sdata_out_r                    <= 1'b0;
                   audio_fifo_rd_en_aud           <= (enable_core_rr_aud && !audio_fifo_empty_w_aud) ? 1'b1 : 1'b0 ;
                   audio_sample_bit_counter_r_aud <= 6'b0;
                   audio_fifo_rdata_r_aud         <= audio_fifo_read_data_w_aud;
                    // audio_fifo_rdata_r_aud <= 2863311530;
                 end 
                 
                 LEFT: begin
                   
                   audio_sample_bit_counter_r_aud <= ( (audio_sample_bit_counter_r_aud == (audio_sample_bit_rr_aud - 1) ) )  ?  6'b0 : (audio_sample_bit_counter_r_aud  + 1);
                   
                   audio_fifo_rdata_r_aud <= (audio_sample_bit_counter_r_aud == (audio_sample_bit_rr_aud - 1)) ? audio_fifo_read_data_w_aud : {audio_fifo_rdata_r_aud[30:0],1'b0};
                   
                   // AFTER LEFT DATA TRANSMIT CHECK IF FIFO IS EMPTY IF EMPTY GO TO IDLE AND REPEAT
                   audio_state_r          <= (audio_sample_bit_counter_r_aud == (audio_sample_bit_rr_aud - 1))    ? RIGHT : LEFT ;
                   
                   lrclk_aud_r            <= (audio_sample_bit_counter_r_aud == (audio_sample_bit_rr_aud - 1))    ? 1'b1 : 1'b0 ;
                   
                   audio_fifo_rd_en_aud   <= (audio_sample_bit_counter_r_aud == (audio_sample_bit_rr_aud - 1))    ? 1'b1 : 1'b0;
                   
                   
                   
                   case(audio_sample_bit_rr_aud)
                   
                   16: begin
                   sdata_out_r   <= audio_fifo_rdata_r_aud[15];
                   end
                   
                   24: begin
                   sdata_out_r   <= audio_fifo_rdata_r_aud[23];
                   end
                   
                   32: begin
                   sdata_out_r   <= audio_fifo_rdata_r_aud[31];
                   end
                   
                   default: begin
                   sdata_out_r   <= 1'b0;
                   end
                   
                   
                   
                   endcase
                 
                 
                 end //LEFT
                 
                 
                 RIGHT: begin
                 
                   audio_sample_bit_counter_r_aud <= ( (audio_sample_bit_counter_r_aud == (audio_sample_bit_rr_aud - 1) ) ) ?  6'b0 : (audio_sample_bit_counter_r_aud  + 1);
                   
                   audio_fifo_rdata_r_aud <= (audio_sample_bit_counter_r_aud == (audio_sample_bit_rr_aud - 1)) ? audio_fifo_read_data_w_aud : {audio_fifo_rdata_r_aud[30:0],1'b0};
                    // AFTER RIGHT DATA TRANSMIT CHECK IF FIFO IS EMPTY IF EMPTY GO TO IDLE AND REPEAT
                   audio_state_r          <= (audio_sample_bit_counter_r_aud == (audio_sample_bit_rr_aud - 1))   ? LEFT : RIGHT ;
                   
                   lrclk_aud_r            <= (audio_sample_bit_counter_r_aud == (audio_sample_bit_rr_aud - 1))   ? 1'b0 : 1'b1 ;
                   
                   audio_fifo_rd_en_aud   <= (audio_sample_bit_counter_r_aud == (audio_sample_bit_rr_aud - 1))   ? 1'b1 : 1'b0;
                   
                   
                   case(audio_sample_bit_rr_aud)
                   
                   16: begin
                   sdata_out_r   <= audio_fifo_rdata_r_aud[15];
                   end
                   
                   24: begin
                   sdata_out_r   <= audio_fifo_rdata_r_aud[23];
                   end
                   
                   32: begin
                   sdata_out_r   <= audio_fifo_rdata_r_aud[31];
                   end
                   
                   
                   default: begin
                   sdata_out_r   <= 1'b0;
                   end
                   
                    
                   endcase
                   
                  end//right
                 
                 default: begin
                 end
                 
                 
                 
                 endcase
            end // if(!enable_core_rr_aud || wr_rst_busy_rr_aud)
            
        end
        else begin
        audio_fifo_rd_en_aud <= 0;        
        
        end
   
   end
   
   end //always
   
  always @( negedge aud_mclk) begin
  //  sclk_aud_rn   <= sclk_aud_rp ;
   lrclk_aud_rn  <= lrclk_aud_rp;
   sdata_out_rn  <= sdata_out_rp;
  end
  
  always @( posedge aud_mclk) begin
 
 //  sclk_aud_rp   <= sclk_aud_r & enable_core_rr_aud;
   lrclk_aud_rp  <= lrclk_aud_r ;
   sdata_out_rp  <= sdata_out_r;
  
   end
  
  
 /*
 AUDIO_FIFO AUDIO_FIFO(
  .rst(issue_audio_fifo_reset_sys),
  .wr_clk(PCLK),                // input wire wr_clk
  .rd_clk(sclk_aud_r),                // input wire rd_clk
  .din(audio_fifo_wdata_sys),                      // input wire [31 : 0] din
  .wr_en(audio_fifo_wr_en_sys),                  // input wire wr_en
  .rd_en(audio_fifo_rd_en_aud),                  // input wire rd_en
  .dout(audio_fifo_read_data_w_aud),                    // output wire [31 : 0] dout
  .full(audio_fifo_full_w_sys),                    // output wire full
  .almost_full(),      // output wire almost_full
  .empty(audio_fifo_empty_w_aud),                  // output wire empty
  .almost_empty(),    // output wire almost_empty
  .rd_data_count(),  // output wire [3 : 0] rd_data_count
  .wr_data_count(wr_data_count_w_sys),  // output wire [3 : 0] wr_data_count
  .wr_rst_busy(wr_rst_busy_w_sys),      // output wire wr_rst_busy
  .rd_rst_busy() 
);
 */
mkAudiofifo  AUDIO_FIFO (
 
           .CLK_wr_clk(PCLK),
		   .RST_N_wr_rstn(issue_audio_fifo_reset_sys),
		   .CLK_rd_clk(aud_mclk),
		  

		   .data_enq_data(audio_fifo_wdata_sys),
		   .EN_data(audio_fifo_wr_en_sys),
		   .RDY_data(),

		   .EN_deq_data(audio_fifo_rd_en_aud),
		  . RDY_deq_data(),

		   .EN_first(1'b1),
		   .first(audio_fifo_read_data_w_aud),
		   .RDY_first(),

		   .empty(audio_fifo_empty_w_aud),
		   .RDY_empty(),

		   .full(audio_fifo_full_w_sys),
		   .RDY_full(),

		   .nempty(),
		   .RDY_nempty(),

		   .nfull(),
		   .RDY_nfull()
		   
		   );
 
 
 
 
 
 
 
 
endmodule
