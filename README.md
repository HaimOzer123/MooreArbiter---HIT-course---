# MooreArbiter
# Haim Ozer 

-----------
## Description:
A Verilog-based state machine module for managing resource arbitration among multiple requesters in a synchronous digital system.

## Project Overview:
This project implements a Moore state machine in Verilog, designed to manage up to four request signals (req0, req1, req2, req3).
The state machine grants access to one requester at a time based on a priority scheme. 
The module transitions between various states based on the current requests and grants the appropriate signals (grant0, grant1, grant2, grant3) accordingly.

## Features
### Synchronous Design:
The state transitions and output logic are clocked, ensuring reliable operation in synchronous systems.
### Priority-based Arbitration: 
Handles up to four requesters, with priority given to the lowest-numbered request line that is active.
### Modular Code Structure:
The design is modular, making it easy to integrate and reuse in larger systems.

## Files
**MooreArbiter.v**: The main Verilog module for the Moore state machine.
**MooreArbiter_tb.v**: A testbench for simulating and verifying the operation of the MooreArbiter module.
**Simulation Results**: Waveform images generated from the simulation to verify the state machine behavior.

## To use this module:
Clone the repository: git clone <repository-url>
Compile the Verilog code: Use a Verilog compiler like ModelSim or Vivado.
Run simulations: Use the provided testbench MooreArbiter_tb.v to verify the design.
Integrate into your project: Include the MooreArbiter.v module in your system design as needed.
