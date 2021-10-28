/*
//Copyright 2021 S SIVA PRASAD ssprasad12a@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/


`timescale 1ns / 1ps


module gpio_ssp(
    input              clock,
    input              rst_n,
    input  [31:0]      apb_addr,
    input              apb_sel,
    input              apb_write,
    input              apb_ena,
    input  [31:0]      apb_wdata,
    output reg [31:0]  apb_rdata,
    input  [3:0]       apb_pstb,
    output             apb_rready,
    output             gpio_intr,
    
    input  [19:0]      gpi,
    output [19:0]      gpo,
    output [19:0]      gpd
   
     
    
    );
    
    localparam GPO_ADDR    = 8'h00;
    localparam GPI_ADDR    = 8'h04;
    localparam GPID_ADDR   = 8'h0C;
    
    
    reg [19:0] gpo_r;
    reg [19:0] gpd_r;
    assign apb_rready = 1'b1;
    
    assign gpd   = gpd_r; 
    assign gpo   = gpo_r;
    
assign gpio_intr = 1'b0;
     
    always @(posedge clock or negedge rst_n) begin 
        if(!rst_n) begin
        
            gpo_r      <= 20'h00000;
            apb_rdata  <= 32'h0000_0000;
            gpd_r      <= 20'h00000;
        
        end else begin
        
            if(apb_sel && apb_write) begin 
                case(apb_addr[7:0]) 
                            GPO_ADDR     : begin gpo_r    <= apb_wdata[19:0] ;end
                            GPID_ADDR    : begin gpd_r    <= apb_wdata[19:0] ;end
                            
                 endcase        
              end
              
             if(apb_sel && !apb_write) begin 
                    case(apb_addr[7:0]) 
                            GPO_ADDR     : begin apb_rdata  <= {12'h000,gpo_r}  ;end
                            GPID_ADDR    : begin apb_rdata  <= {12'h000,gpd_r}  ;end
                            GPI_ADDR     : begin apb_rdata  <= {12'h000,gpi}; end
                            default      : begin apb_rdata  <= apb_rdata  <= 32'h0000_0000; end
                    endcase      
                            
            end            
            
              
              
              
              
              
             
        
        end
    
    end
    
    
    
    
    
    
    
    
    
    
endmodule
