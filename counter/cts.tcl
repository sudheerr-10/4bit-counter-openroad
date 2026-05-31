read_lef /home/prashanth/OpenROAD/test/Nangate45/Nangate45_tech.lef
read_lef /home/prashanth/OpenROAD/test/Nangate45/Nangate45_stdcell.lef

read_liberty /home/prashanth/OpenROAD/test/Nangate45/Nangate45_typ.lib


read_def placed.def

create_clock -period 10 clk

clock_tree_synthesis

write_def cts.def
