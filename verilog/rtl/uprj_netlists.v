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

// Include caravel global defines for the number of the user project IO pads 
//`include "/home/siva/Documents/caravel_user_project_extended/caravel/verilog/rtl/defines.v"

`define USE_POWER_PINS

`ifdef GL
    // Assume default net type to be wire because GL netlists don't have the wire definitions
    `default_nettype wire
    `include "gl/user_project_wrapper.v"
    `include "gl/user_proj_example.v"
`else
    `include "./user_project_wrapper.v"
    `include "./apb_crossbar_ssp.v"
    `include "./apbspi_ssp.v"
    `include "./apbuart_ssp.v"
    `include "./i2s_transmitter.v"
    `include "./mkAudiofifo.v"
    `include "./SyncFIFO.v"
    `include "./apbled.v"
    `include "./gpio_ssp.v"
     `include "./apbqspi_ssp.v"
      `include "./jtag_ssp.v"
    `include "./dirctrl_ssp.v"
     `include "./timer_ssp.v"
     `include "./i2c_ssp.v"
    `include "./peripheral_top.v"
    `include "./pwm_ssp.v"
    `include "./user_proj_example.v"
    `include "./wishbone2apb.v"
     
`endif
