// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32
)(

`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

   // IOs
    input  [38-1:0] io_in,
    output [38-1:0] io_out,
    output [38-1:0] io_oeb,
  
    input   user_clock2,
    // IRQ
    output [2:0] irq
    

    
    
);
    
  
 //  assign clk = user_clock2;
 //  assign rst = wb_rst_i;
//
    

    
    // IRQ
    assign irq = 3'b000;	// Unused

    // LA
    assign la_data_out = 128'h0000_0000_0000_0000_0000_0000_0000_0000;
   
    wire  w_uart_txd ;
    wire  w_uart_rxd ;
   
   
    wire   w_spi_clk ;
    wire   w_spi_miso  ; 
    wire   w_spi_mosi  ;
    wire   [1:0] w_spi_ssel;
   
    wire  [19:0] w_gpi, w_gpo, w_gpd;
    
    wire  [1:0] w_pwm_o;
   
    wire  w_sda_i,w_scl_i,w_sda_o,w_scl_o,w_sda_t,w_scl_t;
    
    wire  w_lrclk,w_bclk,w_audo;
   
   wire w_ledcntrl;
   
   wire w_pwrled;
   
   wire w_uart_txd_dir,w_uart_rxd_dir;
   
   wire [4:0] w_spi_dir;
   
   wire w_scl_dir, w_sda_dir;
   
   wire [1:0] w_pwm_dir;
   wire w_led_dir;
   wire w_i2s_dir;
   
   wire ext_aud_mclk;
   
   wire jtag_mux;
   wire qspi_mux;
   
   wire TMS,TDI,TDO,TCK;
   
   wire q_io0_o;
   wire q_io1_o;
   wire q_io2_o;
   wire q_io3_o;
   
   wire q_io0_t;
   wire q_io1_t;
   wire q_io2_t;
   wire q_io3_t;
   
   wire q_io0_i;
   wire q_io1_i;
   wire q_io2_i;
   wire q_io3_i;
   
   wire q_spi_clk_o;
   wire q_spi_clk_t;
   
   wire q_spi_ssel_o;
   wire q_spi_ssel_t;
   
   
   // gpio mapping   gpio is muxed along with qspi and jtag
   assign io_out[9:0]   = w_gpo[9:0];
   assign io_oeb[9:0]   = w_gpd;
   assign w_gpi[9:0]    = io_in[9:0] ;
   
   assign io_out[13:10]  = jtag_mux ?  {1'b0,TMS,TDO,TCK}  : w_gpo[13:10] ;
   assign io_oeb[13:10]  = jtag_mux ? 4'b1000 : w_gpd[13:10];
   assign TDI            = jtag_mux ? io_in[13] : 1'b1;
   assign w_gpi[13:10]   = jtag_mux ? 4'b0000 : io_in[13:10];
   
   assign io_out[19:14]  = qspi_mux ? {q_io3_o,q_io2_o,q_io1_o,q_io0_o,q_spi_clk_o,q_spi_ssel_o} : w_gpo[19:14];
   assign io_oeb[19:14]  = qspi_mux ? {q_io3_t,q_io2_t,q_io1_t,q_io0_t,q_spi_clk_t,q_spi_ssel_t} : w_gpd[19:14];
   assign w_gpi[19:14]   = qspi_mux ? 6'b000000 : io_in[19:14];
   
   assign q_io3_i = io_in[19] ;
   assign q_io2_i = io_in[18] ;
   assign q_io1_i = io_in[17] ;
   assign q_io0_i = io_in[16] ;
   
   
   
   
   
   // spi mapping
   
   assign io_out[24:20] = {w_spi_mosi,1'b1,w_spi_clk,w_spi_ssel};
   assign io_oeb[24:20] = w_spi_dir;
   assign w_spi_miso    = io_in[23];
   
   // i2c mapping
   assign io_out[26:25] = {w_sda_o,w_scl_o};
   assign io_oeb[26]    = w_sda_t ^ w_sda_dir; // the control from i2c will be inverted if w_sda_dir = 1
   assign io_oeb[25]    = w_scl_t ^ w_scl_dir;
   assign w_sda_i       = io_in[26];
   assign w_scl_i       = io_in[25];
   
   // i2s mapping
   assign io_out[29:27] = {w_lrclk,w_bclk,w_audo};
   assign io_oeb[29:27] = {w_i2s_dir,w_i2s_dir,w_i2s_dir};
   
   //pwm mapping
   
   assign io_out[31:30] = w_pwm_o;
   assign io_oeb[31:30] = {w_pwm_dir,w_pwm_dir};
   
   // led control
   assign io_out[32]    = w_ledcntrl;
   assign io_oeb[32]    = w_led_dir;
   
   assign io_out[33]    = 1'b1;
   assign io_oeb[33]    = !w_i2s_dir;
   assign ext_aud_mclk  = io_in[33];   // external master audio clock
   
   //uart mapping
   assign io_oeb[35:34] = {w_uart_rxd_dir,w_uart_txd_dir};
   assign io_out[35:34] = {1'b1,w_uart_txd};
   assign w_uart_rxd = io_in[35];
   
   // power led
   assign io_out[36]    = w_pwrled;
   assign io_oeb[36]    = 1'b0;
   
   assign io_out[37] = 0;
   assign io_oeb[37] = 0;
   
  peripheral_top  u_peripheral_top(
    .wb_clk_i    (wb_clk_i ),
    .wb_rst_i    (wb_rst_i ),
    .wbs_stb_i   (wbs_stb_i),
    .wbs_cyc_i   (wbs_cyc_i),
    .wbs_we_i    (wbs_we_i ),
    .wbs_sel_i   (wbs_sel_i),
    .wbs_dat_i   (wbs_dat_i),
    .wbs_adr_i   (wbs_adr_i),
    .wbs_ack_o   (wbs_ack_o),
    .wbs_dat_o   (wbs_dat_o),
    
    .uart_txd    (w_uart_txd),
    .uart_rxd    (w_uart_rxd),
     
    .spi_clk     (w_spi_clk ),
    .spi_miso    (w_spi_miso),
    .spi_mosi    (w_spi_mosi),
    .spi_ssel    (w_spi_ssel),
    
    .gpi         (w_gpi    ),
    .gpo         (w_gpo    ),
    .gpd         (w_gpd    ),
                
    .pwm_o       (w_pwm_o),
    
    .sda_i       (w_sda_i),
    .scl_i       (w_scl_i),
    
    .sda_o       (w_sda_o),
    .scl_o       (w_scl_o),
    
    .sda_t       (w_sda_t),
    .scl_t       (w_scl_t),
    
    .ext_aud_mclk    (ext_aud_mclk),
    .lrclk       (w_lrclk),
    .bclk        (w_bclk),
    .audo        (w_audo),
    
    .ledcntrl    (w_ledcntrl),
    .pwrled      (w_pwrled),
    
    .uart_txd_dir (w_uart_txd_dir),
    .uart_rxd_dir (w_uart_rxd_dir),
    
    .spi_dir      (w_spi_dir),
    
    .scl_dir      (w_scl_dir),
    .sda_dir      (w_sda_dir),
    
    .pwm_dir      (w_pwm_dir),
    
    .led_dir      (w_led_dir),
    
    .i2s_dir      (w_i2s_dir),
    
   
   
 .q_io0_i(q_io0_i), 
 .q_io0_o(q_io0_o), 
 .q_io0_t(q_io0_t), 
 .q_io1_i(q_io1_i), 
 .q_io1_o(q_io1_o), 
 .q_io1_t(q_io1_t), 
 .q_io2_i(q_io2_i), 
 .q_io2_o(q_io2_o), 
 .q_io2_t(q_io2_t), 
 .q_io3_i(q_io3_i), 
 .q_io3_o(q_io3_o), 
 .q_io3_t(q_io3_t), 
 .q_spi_clk_i (1'b1 ), 
 .q_spi_clk_o (q_spi_clk_o ),  
 .q_spi_clk_t (q_spi_clk_t ), 
 .q_spi_ssel_i(1'b1),
 .q_spi_ssel_o(q_spi_ssel_o),
 .q_spi_ssel_t(q_spi_ssel_t),
   
  .TMS  	(TMS),
  .TCK   	(TCK),
  .TDO   	(TDO),
  .TDI 	(TDI),
   
   
   
   
   
   
   
       .jtag_mux     (jtag_mux),
    
    .qspi_mux     (qspi_mux)
   
    
  
    );
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

endmodule

`default_nettype wire
