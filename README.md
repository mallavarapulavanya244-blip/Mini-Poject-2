# 4-Way Traffic Light Controller using Verilog HDL

## Project Description
This project presents the design and verification of an automated 4-way traffic light controller (for North-South and East-West intersections) using **Verilog HDL** and a **Finite State Machine (FSM)** architecture. The primary objective is to manage traffic flow safely by switching Red, Yellow, and Green signals with precise timing delays so that vehicles move smoothly without collisions.

## Tools Used
* **Hardware Description Language:** Verilog HDL
* **Simulation Platform:** EDA Playground (Icarus Verilog)
* **Waveform Viewer:** EPWave

## How It Works
The controller operates as a **Moore Finite State Machine (FSM)** cycling continuously through four sequential states:
1. **State 0 (NS Green):** North-South road gets **Green** (10 clock cycles), while East-West stays **Red**.
2. **State 1 (NS Yellow):** North-South road transitions to **Yellow** (3 clock cycles), while East-West stays **Red**.
3. **State 2 (EW Green):** East-West road gets **Green** (10 clock cycles), while North-South stays **Red**.
4. **State 3 (EW Yellow):** East-West road transitions to **Yellow** (3 clock cycles), while North-South stays **Red**.
* **Reset:** Activating the `reset` signal immediately returns the system to the initial state (State 0).

## How to Run
1. Open **EDA Playground** and place the RTL design code in the design editor and the testbench code in the testbench editor.
2. Select **Icarus Verilog** as the simulator in the left panel and check the **"Open EPWave after run"** option.
3. Click **Run** to compile, simulate, and view the output timing waveforms in **EPWave**.
 ## Simulation Output
![Simulation Waveform](IMG-20261118-WA0019.jpg) 
