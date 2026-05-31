read_lef /home/prashanth/OpenROAD/test/Nangate45/Nangate45_tech.lef
read_lef /home/prashanth/OpenROAD/test/Nangate45/Nangate45_stdcell.lef

read_liberty /home/prashanth/OpenROAD/test/Nangate45/Nangate45_typ.lib

read_def cts.def

global_route

write_guides route.guide

write_def route.def
