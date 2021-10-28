/*
//Copyright 2021 S SIVA PRASAD ssprasad12a@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
`timescale 1ns / 1ps



module dirctrl_ssp (
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
    
    output reg   	uart_txd_dir,  // txd 
    output reg         uart_rxd_dir,  // rxd
    
    output reg [4:0] 	spi_dir,  // mosi , miso , sclk, ssel1, ssel0
    
    output reg  	scl_dir,
    output reg   	sda_dir,
    
    output reg [1:0]  	pwm_dir,
    
    output reg       	led_dir,
    
    output reg       	i2s_dir,
    
    output reg         rst_n_ctrl,
   
    output reg         aud_clk_mux ,  // 0 is internal 1 is external
    
    output reg         jtag_mux,      // 0 is gpio else its jtag
    
    output reg         qspi_mux       // 0 is gpio else its qspi
    
    );
    localparam UART_DADDR    	= 8'h10;
    localparam SPI_DADDR    	= 8'h00;
    localparam I2C_DADDR    	= 8'h04;
    localparam PWM_DADDR   	= 8'h08;
    localparam LED_DADDR   	= 8'h0C;
    localparam I2S_DADDR   	= 8'h14;
    localparam RESET_ADDR   	= 8'h1C;
    localparam AUDCLK_MUX      = 8'h20;
    localparam JTAG_MUXADDR        = 8'h2c;
    localparam QSPI_MUXADDR        = 8'h30;
    
    assign apb_rready = 1'b1;
    
   
     
    always @(posedge clock or negedge rst_n) begin 
        if(!rst_n) begin
        	
            uart_txd_dir <= 1'b0;
            uart_rxd_dir <= 1'b1;
            spi_dir <= 5'b01000; // setting all spi pins to output except miso
            scl_dir <= 1'b0;
            sda_dir <= 1'b0;
            pwm_dir <= 2'b00;
            led_dir <= 1'b0;
            i2s_dir <= 1'b0;
            rst_n_ctrl   <= 1'b0;
            aud_clk_mux  <= 1'b0;
            jtag_mux     <= 1'b0;
            qspi_mux     <= 1'b0;
        end else begin
        
            if(apb_sel && apb_write) begin 
                case(apb_addr[7:0]) 
                            SPI_DADDR     : begin spi_dir    <= apb_wdata[4:0] ;end
                            I2C_DADDR     : begin scl_dir     <= apb_wdata[0] ;
                                                  sda_dir     <= apb_wdata[1] ;
                                            end
                           PWM_DADDR      : begin  pwm_dir    <= apb_wdata[1:0] ; end
                           LED_DADDR      : begin  led_dir    <= apb_wdata[0] ;  end
                           UART_DADDR     : begin   uart_txd_dir <= apb_wdata[0] ;  
                           			      uart_rxd_dir <= apb_wdata[1] ;  
                           		      end
                           I2S_DADDR      : begin     i2s_dir   <= apb_wdata[0] ;  end    
                           RESET_ADDR     : begin     rst_n_ctrl    <= apb_wdata[0] ; end
                           
                           AUDCLK_MUX     : begin aud_clk_mux <= apb_wdata[0] ; end
                           
                           JTAG_MUXADDR     : begin     jtag_mux    <= apb_wdata[0] ; end
                           QSPI_MUXADDR  : begin     qspi_mux    <= apb_wdata[0] ; end
                            
                 endcase        
              end
              
             if(apb_sel && !apb_write) begin 
                    case(apb_addr[7:0]) 
                            SPI_DADDR      : begin apb_rdata  <= {24'h000000,3'b000,spi_dir}  ;end
                            I2C_DADDR      : begin apb_rdata  <= {28'h0000000,2'b00,sda_dir,scl_dir}  ;end
                            PWM_DADDR      : begin apb_rdata  <= {28'h0000000,2'b00,pwm_dir}    ;end
                            LED_DADDR      : begin apb_rdata  <= {28'h0000000,3'b000,led_dir}  ;end
                            UART_DADDR     : begin apb_rdata  <= {28'h0000000,2'b00,uart_rxd_dir,uart_txd_dir}    ;end
                            I2S_DADDR      : begin apb_rdata  <= {28'h0000000,3'b000,i2s_dir}  ;end
                             RESET_ADDR     : begin apb_rdata  <= {28'h0000000,3'b000,rst_n_ctrl}  ;end
                             AUDCLK_MUX     : begin apb_rdata  <= {28'h0000000,3'b000,aud_clk_mux}  ;end
                              JTAG_MUXADDR     : begin    apb_rdata  <= {28'h0000000,3'b000,jtag_mux}   ; end
                           QSPI_MUXADDR  : begin    apb_rdata  <= {28'h0000000,3'b000,qspi_mux}    ; end
                             
                            default        : begin apb_rdata  <= apb_rdata  <= 32'h0000_0000; end
                    endcase      
                            
            end            
            
              
              
              
              
              
             
        
        end
    
    end
    
    
    
    
    
    
    
    
    
    
endmodule
