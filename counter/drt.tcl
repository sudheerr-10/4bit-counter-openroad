read_lef /home/prashanth/OpenROAD/test/Nangate45/Nangate45_tech.lef
read_lef /home/prashanth/OpenROAD/test/Nangate45/Nangate45_stdcell.lef

read_def placed.def

global_route
write_guides route.guide

read_guides route.guide
detailed_route

write_def routed.def
