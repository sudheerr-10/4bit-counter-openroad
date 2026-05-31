# Read modules from Verilog file
read_verilog counter.v

# Elaborate design hierarchy
hierarchy -check -top counter

# Translate processes to netlists
proc

# Mapping to the internal cell library
techmap

# Mapping flip-flops to NangateOpenCellLibrary_typical.lib
# for e.g., always block
dfflibmap -liberty NangateOpenCellLibrary_typical.lib

# Mapping logic to NangateOpenCellLibrary_typical.lib
# for e.g., assign block
abc -liberty NangateOpenCellLibrary_typical.lib

# Remove unused cells and wires
clean

# Write the current design to a Verilog file
write_verilog -noattr counter_netlist.v
