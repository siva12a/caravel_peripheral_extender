# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_proj_example


set ::env(VERILOG_FILES) "\
        $script_dir/../../caravel/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/apb_crossbar_ssp.v \
	$script_dir/../../verilog/rtl/apbspi_ssp.v \
	$script_dir/../../verilog/rtl/apbuart_ssp.v \
        $script_dir/../../verilog/rtl/gpio_ssp.v \
        $script_dir/../../verilog/rtl/timer_ssp.v \
        $script_dir/../../verilog/rtl/pwm_ssp.v \
        $script_dir/../../verilog/rtl/dirctrl_ssp.v \
        $script_dir/../../verilog/rtl/i2c_ssp.v \
        $script_dir/../../verilog/rtl/i2s_transmitter.v \
        $script_dir/../../verilog/rtl/mkAudiofifo.v \
        $script_dir/../../verilog/rtl/SyncFIFO.v \
        $script_dir/../../verilog/rtl/apbled.v \
        $script_dir/../../verilog/rtl/jtag_ssp.v \
        $script_dir/../../verilog/rtl/apbqspi_ssp.v \
        $script_dir/../../verilog/rtl/peripheral_top.v \
	$script_dir/../../verilog/rtl/user_proj_example.v \
	$script_dir/../../verilog/rtl/wishbone2apb.v"

set ::env(DESIGN_IS_CORE) 0

set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "wb_clk_i"
set ::env(CLOCK_PERIOD) "40"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 1500 900"

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg
set ::env(BASE_SDC_FILE) "$script_dir/user_proj_example.sdc"
#set ::env(PL_BASIC_PLACEMENT) 1
set ::env(PL_TARGET_DENSITY) 0.40
#set ::env(PSN_ENABLE_RESIZING) 0
#set ::env(GLB_RT_ALLOW_CONGESTION) 0
#set ::env(GLB_RT_OVERFLOW_ITERS) 10

set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1
set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) 0.2
set ::env(PL_RESIZER_ALLOW_SETUP_VIOS) 1
set ::env(QUIT_ON_HOLD_VIOLATIONS) 0
set ::env(GLB_RT_ADJUSTMENT) 0.30
# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper) 
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.  
set ::env(GLB_RT_MAXLAYER) 5
set ::env(FP_PDN_CHECK_NODES) 0
# You can draw more power domains if you need to 
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

set ::env(DIODE_INSERTION_STRATEGY) 4 
# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1
