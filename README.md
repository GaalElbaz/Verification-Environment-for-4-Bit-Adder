# 4-Bit Adder Verification

## About

This project is designed to verify the fundamental functionality of a 4-bit adder. The adder module takes two 4-bit inputs and generates a 5-bit output representing their sum. The verification environment ensures that the adder operates correctly under various input combinations, including boundary conditions and overflow scenarios.

## Code Overview

The project consists of SystemVerilog modules and classes:

- **add:** Implements the 4-bit adder functionality, adding two 4-bit inputs to produce a 5-bit sum.
- **add_if:** Defines the interface for the adder module, specifying input and output ports.
- **transaction:** Represents a packet of data with control and data signals for verification purposes.
- **generator:** Generates random stimuli and sends data to the driver.
- **driver:** Applies stimuli to the adder module and manages the clock signal.
- **monitor:** Collects results from the adder module and sends them to the scoreboard.
- **scoreboard:** Compares expected results with actual results and reports any discrepancies.
- **add_tb:** Top-level testbench module instantiating the adder module and the verification environment components.
