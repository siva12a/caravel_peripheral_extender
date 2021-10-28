/*
//Copyright 2021 S SIVA PRASAD ssprasad12a@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/


`timescale 1ns / 1ps



module timer_ssp(
    input              clock,
    input              rst_n,
    input  [31:0]      apb_addr,
    input              apb_sel,
    input              apb_write,
    input              apb_ena,
    input  [31:0]      apb_wdata,
    output reg [31:0]  apb_rdata,
    input  [3:0]       apb_pstb,
    output             apb_rready
   
    
    
    );
    
   
    localparam TIME0_LADDR         = 8'h00;
    localparam TIME0_HADDR         = 8'h04;
    localparam TIME0_CMPLADDR      = 8'h08;
    localparam TIME0_CMPHADDR      = 8'h0C;
    localparam TIME1_LADDR         = 8'h10;
    localparam TIME1_HADDR         = 8'h14;
    localparam TIME1_CMPLADDR      = 8'h18;
    localparam TIME1_CMPHADDR      = 8'h1C;
    localparam TIMEENA_ADDR        = 8'h20;
    
    reg [63:0] time0;
    reg [63:0] time1;
    reg [63:0] time0_cmp;
    reg [63:0] time1_cmp;
    
   
    wire   [1:0] count_eq;
    assign count_eq[0] = (time0 >= time0_cmp);
    assign count_eq[1] = (time1 >= time1_cmp);
    
    reg    [1:0] tmr_ena;
 
    
    assign apb_rready = 1'b1;
    
    always @(posedge clock ) begin
    
    if (!rst_n) begin
    
       time0     <= 64'h0000_0000_0000_0000;
       time1     <= 64'h0000_0000_0000_0000;
       time0_cmp <= 64'h0000_0000_0000_0000;
       time1_cmp <= 64'h0000_0000_0000_0000;
       time1_cmp <= 64'h0000_0000_0000_0000;
       tmr_ena   <= 2'b00;
      apb_rdata  <= 32'h0000_0000;
       
    end else begin
   
        if(apb_sel && apb_write && !apb_ena) begin 
        
            case(apb_addr[7:0]) 
                TIME0_LADDR      : begin  time0[31:0]      <= apb_wdata; end
                TIME0_HADDR      : begin  time0[63:32]     <= apb_wdata; end
                TIME0_CMPLADDR   : begin  time0_cmp[31:0]  <= apb_wdata; end 
                TIME0_CMPHADDR   : begin  time0_cmp[63:32] <= apb_wdata; end 
                TIME1_LADDR      : begin  time1[31:0]      <= apb_wdata; end   
                TIME1_HADDR      : begin  time1[63:32]     <= apb_wdata; end   
                TIME1_CMPLADDR   : begin  time1_cmp[31:0]  <= apb_wdata; end   
                TIME1_CMPHADDR   : begin  time1_cmp[63:32] <= apb_wdata; end   
                TIMEENA_ADDR     : begin  tmr_ena <= apb_wdata[1:0]; end  
             endcase        
        
        end else begin
        // no autoreload
                time0   <= tmr_ena[0] ? (time0 == time0_cmp) ? time0 : time0 + 64'h0000_0000_0000_0001 : 64'h0000_0000_0000_0000;
           // auto reload
                time1   <= tmr_ena[1] ? (time1 == time1_cmp) ? time1_cmp : time1 + 64'h0000_0000_0000_0001 : 64'h0000_0000_0000_0000; 
        
        
        end
      
        if(apb_sel && !apb_write && !apb_ena) begin 
        
            case(apb_addr[7:0]) 
                 TIME0_LADDR      : begin apb_rdata  <= time0[31:0]     ; end
                 TIME0_HADDR      : begin apb_rdata  <= time0[63:32]    ; end
                 TIME0_CMPLADDR   : begin apb_rdata  <= time0_cmp[31:0] ; end
                 TIME0_CMPHADDR   : begin apb_rdata  <= time0_cmp[63:32]; end
                 TIME1_LADDR      : begin apb_rdata  <= time1[31:0]     ; end
                 TIME1_HADDR      : begin apb_rdata  <= time1[63:32]    ; end
                 TIME1_CMPLADDR   : begin apb_rdata  <= time1_cmp[31:0] ; end
                 TIME1_CMPHADDR   : begin apb_rdata  <= time1_cmp[63:32]; end
                 TIMEENA_ADDR     : begin apb_rdata  <= {28'h0000000,2'b00,count_eq}   ; end
                 default          : begin apb_rdata      <= 32'h0000_0000;     end
             endcase  
            
        end  
       
        
        
         
        
    
    
    
    
    
    
   
   
    end 
    end
      
endmodule
