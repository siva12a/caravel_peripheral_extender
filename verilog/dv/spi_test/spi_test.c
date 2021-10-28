/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

// This include is relative to $CARAVEL_PATH (see Makefile)
#include "verilog/dv/caravel/defs.h"
#include "verilog/dv/caravel/stub.c"

/*
	IO Test:
		- Configures MPRJ lower 8-IO pins as outputs
		- Observes counter value through the MPRJ lower 8 IO pins (in the testbench)
*/

void main()
{
	/* 
	IO Control Registers
	| DM     | VTRIP | SLOW  | AN_POL | AN_SEL | AN_EN | MOD_SEL | INP_DIS | HOLDH | OEB_N | MGMT_EN |
	| 3-bits | 1-bit | 1-bit | 1-bit  | 1-bit  | 1-bit | 1-bit   | 1-bit   | 1-bit | 1-bit | 1-bit   |

	Output: 0000_0110_0000_1110  (0x1808) = GPIO_MODE_USER_STD_OUTPUT
	| DM     | VTRIP | SLOW  | AN_POL | AN_SEL | AN_EN | MOD_SEL | INP_DIS | HOLDH | OEB_N | MGMT_EN |
	| 110    | 0     | 0     | 0      | 0      | 0     | 0       | 1       | 0     | 0     | 0       |
	
	 
	Input: 0000_0001_0000_1111 (0x0402) = GPIO_MODE_USER_STD_INPUT_NOPULL
	| DM     | VTRIP | SLOW  | AN_POL | AN_SEL | AN_EN | MOD_SEL | INP_DIS | HOLDH | OEB_N | MGMT_EN |
	| 001    | 0     | 0     | 0      | 0      | 0     | 0       | 0       | 0     | 1     | 0       |

	*/

	/* Set up the housekeeping SPI to be connected internally so	*/
	/* that external pin changes don't affect it.			*/

	reg_spimaster_config = 0xa002;	// Enable, prescaler = 2,
                                        // connect to housekeeping SPI

	// Connect the housekeeping SPI to the SPI master
	// so that the CSB line is not left floating.  This allows
	// all of the GPIO pins to be used for user functions.

        // Program description : Read 4 bytes from a spi flash and check if its correct.
/*
	reg_mprj_io_34 =  GPIO_MODE_USER_STD_OUTPUT;  //uart txd

	reg_mprj_io_35 =  GPIO_MODE_USER_STD_INPUT_PULLUP;  // uart_rxd
*/	
	reg_mprj_io_0 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_1 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_2 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_3 =  GPIO_MODE_USER_STD_OUTPUT;
	
	reg_mprj_io_4 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_5 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_6 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_7 =  GPIO_MODE_USER_STD_OUTPUT;
	
	reg_mprj_io_8 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_9 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_10 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_11 =  GPIO_MODE_USER_STD_OUTPUT;
	
	reg_mprj_io_12 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_13 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_14 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_15 =  GPIO_MODE_USER_STD_OUTPUT;
	
	reg_mprj_io_16 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_17 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_18 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_19 =  GPIO_MODE_USER_STD_OUTPUT;

	reg_mprj_io_20 =  GPIO_MODE_USER_STD_OUTPUT;   // slave select 0
	reg_mprj_io_21 =  GPIO_MODE_USER_STD_OUTPUT;   // slave select 1
	reg_mprj_io_22 =  GPIO_MODE_USER_STD_OUTPUT;   // serial clock
	reg_mprj_io_24 =  GPIO_MODE_USER_STD_OUTPUT;  //mosi
 
       reg_mprj_io_23 =  GPIO_MODE_USER_STD_INPUT_PULLUP;  //miso

	
	/* Apply configuration */
	reg_mprj_xfer = 1;
	
	while (reg_mprj_xfer == 1);
	
	
	unsigned char d0,d1,d2,d3;
	
       int  *spi_cr    = (int*)   0x30010060;   // spi control register
       int  *spi_dtr   = (int*)   0x30010068;   // spi data transmit register
       int  *spi_drr   = (int*)   0x3001006c;   // spi data receive register
       int  *spi_ssr   = (int*)   0x30010070;   // spi slave select register
       int  *spi_sr    = (int*)   0x30010064;   // spi status register
       
       int SR,spiSR;
	
	
        
        int  *gpo_addr =  (int*) 0x30050000; // gpio out address
        int  *gpd_addr =  (int*) 0x3005000C; // gpio dir address
        int  *gpi_addr =  (int*) 0x30050004; // gpio dir address
        int  *reset_addr =  (int*) 0x3008001C; // reset address
        
        *reset_addr   = 0x00000000;
        *reset_addr   = 0x00000000;
        *reset_addr   = 0x00000000;
        *reset_addr   = 0x00000001;
        
        *gpd_addr  = 0x00000000; // setting all 20 gpio pins as output
        *gpo_addr  = 0x00000000; // all gpo ports set to 0
        
       
        *spi_cr   = 0x000001E6;
       // spi enable , inhibit mode 0, manual slave selection, loop disabled
       
       *spi_cr   = 0x000000E6;
       
       *spi_ssr  = 254; // selecting slave 0
       
       *spi_dtr  = 0x00000003; // read command
       *spi_dtr  = 0x00000000; // dummy cycle
       *spi_dtr  = 0x00000000; // dummy cycle
       *spi_dtr  = 0x00000000; // dummy cycle
       
        for (int i = 0; i < 4; i++) {
     
      do {
		spiSR  = *spi_sr;
		spiSR = spiSR & 0x00000001;
          }   while (spiSR == 0x00000001);
          
          spiSR   = *spi_drr;  // readind out dummy data
          
          
     }    
     
     // original datta
      for (int i = 0; i < 4; i++) {
      
      *spi_dtr  = 0x00000000;
      
       do {
		spiSR  = *spi_sr;
		spiSR = spiSR & 0x00000001;
          }   while (spiSR == 0x00000001);
          
     }
        *spi_ssr  = 255;
       d0 = *spi_drr;
       d1 = *spi_drr;
       d2 = *spi_drr;
       d3 = *spi_drr;
        
       if (d0 != 0x13) { while(1); }   // if anything fails endless loop
        if (d1 != 0x01) { while(1); }
         if (d2 != 0x01) { while(1); }
          if (d3 != 0xfe) { while(1); }
         
       *gpo_addr = 0x000ABCDE;  // sequence test in test bench
      
       
        while(1);
      

}

