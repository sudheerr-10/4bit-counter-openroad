read_lef /home/sudheer/OpenROAD/test/Nangate45/Nangate45_tech.lef

read_lef /home/sudheer/OpenROAD/test/Nangate45/Nangate45_stdcell.lef

read_liberty /home/sudheer/OpenROAD/test/Nangate45/Nangate45_typ.lib

read_verilog counter_netlist.v

link_design counter

initialize_floorplan \
     -site FreePDK45_38x28_10R_NP_162NW_34O \
     -die_area "0 0 100 100" \
     -core_area "10 10 90 90"

make_tracks

place_pins -hor_layers metal3 -ver_layers metal4

global_placement

write_def placed.def
