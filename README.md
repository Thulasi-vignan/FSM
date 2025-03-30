# Finite State Machine (FSM) Implementation in Verilog

## Overview

This repository contains an implementation of a **Finite State Machine (FSM)** in Verilog. FSMs are fundamental to digital design, widely used in control logic, sequential circuits, and embedded systems.

## Features

- **Parameterized State Encoding**: Supports different state encoding schemes (binary, gray, one-hot).
- **Moore & Mealy FSM Support**: Can be configured as a Moore or Mealy state machine.
- **Clock Synchronized**: Fully synchronous design with clock and reset.
- **Configurable States**: Easy to modify for different applications.

## FSM Design

The FSM consists of:

1. **State Registers**: Holds the current state.
2. **Next State Logic**: Determines the next state based on inputs.
3. **Output Logic**: Generates outputs based on the current state (Moore) or current state and inputs (Mealy).

## Module Interface

### Inputs

| Signal  | Width | Description                      |
|---------|------|----------------------------------|
| `clk`   | 1-bit | System clock                    |
| `rst`   | 1-bit | Asynchronous reset              |
| `in`    | n-bit | Input signals affecting state transitions |

### Outputs

| Signal  | Width | Description                      |
|---------|------|----------------------------------|
| `out`   | m-bit | FSM output signals              |

## Example FSM: Traffic Light Controller

This FSM manages a simple traffic light system with three states:

1. **Green**: Traffic flows.
2. **Yellow**: Warning before red.
3. **Red**: Stop traffic.

### State Diagram

```
  Green --> Yellow --> Red --> Green
```

## Simulation & Testing

1. Load the Verilog FSM module and testbench in a simulator.
2. Observe state transitions and outputs.
3. Validate timing and expected behavior.

## Applications

- Traffic light controllers
- Vending machines
- car parking system
- lift
- washing machine
- Communication protocols
- Embedded system controllers

## Future Enhancements

- Add configurable timing for state transitions.
- Implement a parameterized FSM generator.

## Contributors

- **Your Name** - Bolisetty Thulasi Vignan

## License

This project is open-source and licensed under the MIT License.


