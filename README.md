![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# Tiny Tapeout Verilog Project Template

- [Read the documentation for project](docs/info.md)

## What is Tiny Tapeout?

Tiny Tapeout is an educational project that aims to make it easier and cheaper than ever to get your digital and analog designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

# TinyTapeout: Digital FIR Filter

A **third order digital FIR filter** for TinyTapeout. It has a **configurable cut-off frequency** and **two selectable behaviours**. The sampling frequency is equal to the clock frequency. Results are available after **one clock-cycle**. Data is **unsigned** and the output is bounded to fit 8 bits.

## Features

- Four cut-off frequencies: **0.125, 0.375, 0.625 and 0.875**
- Two filter behaviours: **lowpass and highpass**
- **Single-cycle execution**
- **No overflows**

## Top-Level I/O

| Signal        | Dir | W | Description |
| --- | :---: | :---: | --- |
| `clk`         | in  | 1 | System clock |
| `rst_n`       | in  | 1 | Async reset (active-low) |
| `ui_in[7:0]`  | in  | 8 | *Unsigned* **input data** |
| `uo_out[7:0]` | out | 8 | *Unsigned* **output data** |
| `uio_in[3]`   | in  | 1 | **Config enable** (active-high) - change current config |
| `uio_in[2]`   | in  | 1 | Config **filter behaviour** ('0' = lowpass, '1' = highpass) |
| `uio_in[1:0]` | in  | 2 | Config **cut-off frequency** (wg = b0.xx1) |
