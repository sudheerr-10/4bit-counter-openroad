# 4-Bit Counter Physical Design Flow using OpenROAD

## Overview

This project demonstrates a complete RTL-to-Physical Design implementation of a 4-bit synchronous counter using the OpenROAD physical design toolchain and Nangate45 technology library.

The objective of this project is to perform the complete ASIC physical design flow starting from RTL design and ending with post-route timing verification.

---

## Design Specifications

### Design Name

4-Bit Synchronous Counter

### Inputs

* `clk` : Clock Input
* `rst` : Active High Reset

### Outputs

* `count[3:0]` : 4-Bit Counter Output

### Functionality

The counter increments its value by one on every positive edge of the clock signal. When reset is asserted, the counter value is cleared to zero.

---

## RTL Code

```verilog
module counter (
    input clk,
    input rst,
    output reg [3:0] count
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        count <= 4'b0000;
    else
        count <= count + 1'b1;
end

endmodule
```

---

# Technology and Tools

| Item               | Details                   |
| ------------------ | ------------------------- |
| Tool               | OpenROAD                  |
| Synthesis Tool     | Yosys                     |
| Timing Analysis    | OpenSTA (within OpenROAD) |
| Technology Library | Nangate45                 |
| HDL                | Verilog                   |
| Design Type        | Digital ASIC              |

---

# Project Directory Structure

```text
.
├── counter.v
├── counter_netlist.v
├── floorplan.tcl
├── place.tcl
├── cts.tcl
├── route.tcl
├── drt.tcl
├── post_sta.tcl
├── floorplan.def
├── placed.def
├── cts.def
├── route.def
├── routed.def
├── floorplan_view.tcl
├── place_view.tcl
├── cts_view.tcl
├── route_view.tcl
└── README.md
```

---

# Physical Design Flow

## 1. RTL Design

The Verilog RTL of the 4-bit counter was developed and verified.

### Output

```text
counter.v
```

---

## 2. Logic Synthesis

RTL was synthesized using Yosys with the Nangate45 standard cell library.

### Output

```text
counter_netlist.v
```

### Result

* Gate-level netlist generated successfully.
* Technology mapping completed.

---

## 3. Static Timing Analysis (Pre-Layout STA)

Timing analysis was performed on the synthesized netlist.

### Commands

```tcl
read_liberty Nangate45_typ.lib
read_verilog counter_netlist.v
link_design counter
create_clock -period 10 clk
report_checks
```

### Result

Design passed timing analysis successfully.

---

## 4. Floorplanning

Floorplanning defines:

* Die Area
* Core Area
* Standard Cell Rows
* IO Pin Placement

### Output

```text
floorplan.def
```

### Result

* Die Area created successfully.
* Core rows generated.
* IO pins placed.

---

## 5. Global Placement

Placement determines the physical locations of standard cells.

### Output

```text
placed.def
```

### Result

* Cells placed successfully.
* Placement legalized.

---

## 6. Detailed Placement

Detailed placement optimizes cell locations and removes overlaps.

### Result

```text
Total Cells : 14
Placement Success : 100%
```

### Output

```text
placed.def
```

---

## 7. Clock Tree Synthesis (CTS)

Clock Tree Synthesis inserts clock buffers and distributes the clock signal uniformly.

### Output

```text
cts.def
```

### CTS Statistics

```text
Clock Net : clk
Number of Sinks : 4
Clock Buffers Inserted : 3
Clock Subnets Created : 3
Clock Tree Depth : 2
```

### Result

Clock distribution completed successfully.

---

## 8. Global Routing

Global routing generates routing guides for signal connections.

### Output

```text
route.def
```

### Result

Global routing completed successfully.

---

## 9. Detailed Routing

Detailed routing performs actual routing using metal layers.

### Output

```text
routed.def
```

### Metal Layer Usage

```text
metal1 : 43
metal2 : 33
metal3 : 6
metal4 : 0
metal5 : 0
metal6 : 0
metal7 : 0
metal8 : 0
metal9 : 0
```

### Total Routed Segments

```text
82
```

### Result

Detailed routing completed successfully.

---

## 10. Post-Route Static Timing Analysis

Timing verification was performed after routing.

### Commands

```tcl
read_lef Nangate45_tech.lef
read_lef Nangate45_stdcell.lef
read_liberty Nangate45_typ.lib

read_verilog counter_netlist.v
link_design counter

create_clock -name clk -period 10 [get_ports clk]

report_checks
```

### Timing Result

```text
Slack (MET) = +9.78 ns
```

### Interpretation

* Positive Slack
* No Setup Violations
* Timing Requirements Met

---

# GUI Visualization

The design can be viewed at various stages using OpenROAD GUI.

---

## Floorplan View

```bash
openroad -gui floorplan_view.tcl
```

---

## Placement View

```bash
openroad -gui place_view.tcl
```

---

## CTS View

```bash
openroad -gui cts_view.tcl
```

---

## Routing View

```bash
openroad -gui route_view.tcl
```

---

# Results Summary

| Flow Stage           | Status |
| -------------------- | ------ |
| RTL Design           | ✅      |
| Logic Synthesis      | ✅      |
| Pre-Layout STA       | ✅      |
| Floorplanning        | ✅      |
| Global Placement     | ✅      |
| Detailed Placement   | ✅      |
| Clock Tree Synthesis | ✅      |
| Global Routing       | ✅      |
| Detailed Routing     | ✅      |
| Post-Route STA       | ✅      |

---

# Final Timing Report

```text
Clock Period : 10 ns
Slack        : +9.78 ns
Status       : TIMING MET
```

---

# Conclusion

A complete RTL-to-Physical Design flow for a 4-bit synchronous counter was successfully implemented using OpenROAD and Nangate45 technology.

The design successfully passed:

* Synthesis
* Floorplanning
* Placement
* Clock Tree Synthesis
* Routing
* Post-Route Timing Analysis

The final timing report showed a positive slack of +9.78 ns, confirming that the design meets all timing requirements without violations.

---

## Author

**Sudheer**

RTL-to-Physical Design Flow using OpenROAD and Nangate45 Technology.

