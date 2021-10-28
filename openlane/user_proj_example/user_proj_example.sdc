create_clock [get_ports wb_clk_i]  -name wb_clk_i  -period 40
create_clock [get_ports io_in\[33\]]  -name aud_mclk  -period 25

set_false_path -from [get_clocks wb_clk_i] -to [get_clocks aud_mclk]
set_false_path -from [get_clocks aud_mclk] -to [get_clocks wb_clk_i]

set_input_delay 5 -clock [get_clocks wb_clk_i] [get_ports io_in[*]]
set_input_delay 5 -clock [get_clocks wb_clk_i] [get_ports wbs_stb_i]
set_input_delay 5 -clock [get_clocks wb_clk_i] [get_ports wbs_cyc_i]
set_input_delay 5 -clock [get_clocks wb_clk_i] [get_ports wbs_we_i]
set_input_delay 5 -clock [get_clocks wb_clk_i] [get_ports wbs_dat_i[*]]
set_input_delay 5 -clock [get_clocks wb_clk_i] [get_ports wbs_adr_i[*]]
set_input_delay 5 -clock [get_clocks wb_clk_i] [get_ports wbs_sel_i[*]]


set_output_delay 5 -clock [get_clocks wb_clk_i] [get_ports wbs_dat_o]
set_output_delay 5 -clock [get_clocks wb_clk_i] [get_ports io_out[*]]
set_output_delay 5 -clock [get_clocks wb_clk_i] [get_ports io_oeb[*]]
