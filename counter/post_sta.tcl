read_lef /home/sudheer/OpenROAD/test/Nangate45/Nangate45_tech.lef
read_lef /home/sudheer/OpenROAD/test/Nangate45/Nangate45_stdcell.lef

read_liberty /home/sudheer/OpenROAD/test/Nangate45/Nangate45_typ.lib

read_verilog counter_netlist.v

link_design counter

create_clock -name clk -period 10 [get_ports clk]

report_checks
