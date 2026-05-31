read_liberty NangateOpenCellLibrary_typical.lib

read_verilog counter_netlist.v

link_design counter

read_sdc counter.sdc

report_checks

report_tns

report_wns
