/*
//Copyright 2021 S SIVA PRASAD ssprasad12a@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/


`timescale 1ns / 1ps


module pwm_ssp(
    input              clock,
    input              rstn,
    input  [31:0]      apb_addr,
    input              apb_sel,
    input              apb_write,
    input              apb_ena,
    input  [31:0]      apb_wdata,
    output reg [31:0]  apb_rdata,
    input  [3:0]       apb_pstb,
    output             apb_rready,
    output [1:0]       pwm_o
     
    
    );
    
    assign apb_rready = 1'b1;
    reg [31:0] pwm0_l;
    reg [31:0] pwm0_h;
    
    reg [31:0] pwm1_l;
    reg [31:0] pwm1_h;
    
    reg [63:0] pwm0_counter;
    reg [63:0] pwm1_counter;
    
    reg [1:0] pwm_en;
    
    reg [63:0] pwm_0_cmp;
    reg [63:0] pwm_1_cmp;
    
    localparam PWMENA_ADDR        = 8'h00;
    localparam PWM0_CMPLADDR      = 8'h04;
    localparam PWM0_CMPHADDR      = 8'h08;
    localparam PWM1_CMPLADDR      = 8'h0C;
    localparam PWM1_CMPHADDR      = 8'h10;
    
     wire [1:0] pwm_sig;
        
        assign pwm_sig[0] = (pwm0_counter <=  {32'h0000_0000,pwm0_l})  ? 1'b0 :
                            (pwm0_counter > {32'h0000_0000,pwm0_l})  && (pwm0_counter <= pwm_0_cmp) ? 1'b1  : 1'b0;
                            
        assign pwm_sig[1] = (pwm1_counter <=  {32'h0000_0000,pwm1_l})  ? 1'b0 :
                            (pwm1_counter > {32'h0000_0000,pwm1_l})  && (pwm1_counter <= pwm_1_cmp) ? 1'b1  : 1'b0; 
                            
    assign pwm_o[0] = pwm_sig[0] & pwm_en[0];
    assign pwm_o[1] = pwm_sig[1] & pwm_en[1];
     
     
                   
    
     always @(posedge clock or negedge rstn) begin
        if(!rstn) begin 
            pwm0_counter    <= 64'h0000_0000_0000_0000;
            pwm1_counter    <= 64'h0000_0000_0000_0000;
            pwm_en          <= 2'b00;
            pwm_0_cmp       <= 64'h0000_0000_0000_0001;     
            pwm_1_cmp       <= 64'h0000_0000_0000_0001;     
            apb_rdata       <= 32'h0000_0000;   
            
            pwm0_l   <=  32'h0000_0000;   
            pwm0_h   <=  32'h0000_0000;   
                    
            pwm1_l   <=  32'h0000_0000;   
            pwm1_h   <=  32'h0000_0000;   
              
         end else begin
         
            if(apb_sel && apb_write && !apb_ena) begin 
        
                case(apb_addr[7:0]) 
                    PWMENA_ADDR      : begin  pwm_en               <= apb_wdata[1:0]; end
                    PWM0_CMPLADDR    : begin  pwm0_l    <= apb_wdata; end
                    PWM0_CMPHADDR    : begin  pwm0_h    <= apb_wdata; end
                    PWM1_CMPLADDR    : begin  pwm1_l    <= apb_wdata; end 
                    PWM1_CMPHADDR    : begin  pwm1_h    <= apb_wdata; end 
                    
                    
                endcase        
        
                end else begin
              
              pwm_0_cmp      <= {32'h00000000,pwm0_l} + {32'h00000000,pwm0_h};
              pwm_1_cmp      <= {32'h00000000,pwm1_l} + {32'h00000000,pwm1_h};
              
              pwm0_counter   <= pwm_en[0] ? ( (pwm0_counter == pwm_0_cmp) ? 64'h0000_0000_0000_0001 : pwm0_counter + 64'h0000_0000_0000_0001) : 64'h0000_0000_0000_0001;
              pwm1_counter   <= pwm_en[1] ? ( (pwm1_counter == pwm_1_cmp) ? 64'h0000_0000_0000_0001 : pwm1_counter + 64'h0000_0000_0000_0001) : 64'h0000_0000_0000_0001;
              
          end
          
           if(apb_sel && apb_write && !apb_ena) begin 
        
                case(apb_addr[7:0]) 
                    PWMENA_ADDR      : begin  apb_rdata     <= {28'h0000000,2'b00,pwm_en} ;  end
                    PWM0_CMPLADDR    : begin  apb_rdata     <= pwm0_counter[31:0]  ;  end
                    PWM0_CMPHADDR    : begin  apb_rdata     <= pwm0_counter[63:32] ;  end
                    PWM1_CMPLADDR    : begin  apb_rdata     <= pwm1_counter[31:0]  ;  end
                    PWM1_CMPHADDR    : begin  apb_rdata     <= pwm1_counter[63:32] ;  end
                    default          : begin  apb_rdata      <= 32'h0000_0000;     end
                    
                endcase   
          end
          
          
          
          
          
          
           
         
         end   
     
     end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    endmodule
