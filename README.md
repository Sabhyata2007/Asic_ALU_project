# ASIC Design of a 32-bit ALU using OpenLane (Sky130 PDK)

##  Project Overview

This project demonstrates a full RTL-to-GDSII flow for a 32-bit Arithmetic Logic Unit (ALU) designed in Verilog, implemented using the [OpenLane](https://github.com/The-OpenROAD-Project/OpenLane) open-source digital ASIC design flow, targeting the Sky130 standard cell PDK.

The objective was to gain hands-on experience with the physical design flow of a synthesized digital design and to generate a manufacturable GDSII layout.

---

##  Features

- **RTL Design**: 32-bit ALU in Verilog supporting basic arithmetic and logic operations.
- **RTL Simulation**: Functional simulation and linting using Verilator.
- **Synthesis**: Logic synthesis using Yosys.
- **Floorplanning**: Core and die area allocation, pin placement, power grid setup.
- **Placement**: Standard cell placement using RePlAce.
- **Clock Tree Synthesis (CTS)**: Optional (skipped due to clk-less design).
- **Routing**: Global and detailed routing using FastRoute and TritonRoute.
- **GDS Generation**: Layout export to GDSII using Magic.
- **DRC/LVS Checks**: Enabled via Magic and KLayout (partial).

---

---

##  Tools and Technologies Used

| Tool        | Purpose                      |
|-------------|------------------------------|
| **Verilog** | RTL design                   |
| **Yosys**   | Logic synthesis              |
| **OpenLane**| ASIC design flow automation  |
| **Magic**   | Layout generation and DRC    |
| **KLayout** | GDS viewer / LVS             |
| **Python/TCL** | Flow scripting             |
| **Sky130**  | Open-source PDK              |
| **Ubuntu**  | Linux OS used for setup      |

---

##  Visualization

- **KLayout** was used to view the final `alu.gds` file.
- Due to Magic GUI setup issues, the layout was exported and viewed externally using KLayout.
- Routing was completed successfully, and the GDSII layout was generated without DRC violations (*CTS phase was skipped*).

---

##  Limitations

- Clock port (`clk`) was not present in the design, hence **Clock Tree Synthesis (CTS)** and proper **timing optimization** were not executed.
- No custom SDC constraints were defined; the flow defaulted to `BASE_SDC_FILE`.
- **LVS/DRC verification via Magic** was incomplete due to missing or misconfigured `.tech` files.

---

##  Key Learnings

- Gained practical understanding of the complete **ASIC digital backend flow**.
- Learned to handle toolchain and environment issues with OpenLane, Magic, and Docker.
- Debugged complex synthesis/floorplanning/routing issues with minimal automation.
- Understood how to **manually inspect GDS and DEF files** using external tools like KLayout.
- Experienced real-world challenges of open-source silicon physical design.

---

##  Future Improvements

- Integrate a proper clock port and re-run the flow with full **CTS** support.
- Define and use custom **SDC constraints** for improved synthesis and timing accuracy.
- Perform full **LVS and DRC signoff** with properly configured Magic/KLayout environments.
- Extend the ALU to a **pipelined version** and implement a complete datapath or processor.
- Automate the ASIC flow using **Makefiles or Python wrappers** for efficiency and reusability.

---

##  License

This project uses open-source tools and libraries, primarily under the **Apache 2.0 License**:

- [OpenLane](https://github.com/The-OpenROAD-Project/OpenLane) - Apache 2.0
- [Sky130 PDK](https://github.com/google/skywater-pdk) - Apache 2.0 / open-source


