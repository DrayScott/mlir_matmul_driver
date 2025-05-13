# toy-mlir-matmul

A minimal C++ driver for loading and processing MLIR modules, focused on a simple matrix multiplication use case using the `linalg.matmul` operation.

## Overview

This project demonstrates how to build a C++ application that:
- Initializes an MLIR context and loads required dialects
- Parses an input MLIR file (e.g., `matmul.mlir`)
- Applies standard MLIR transformation passes (canonicalization, CSE)
- Dumps the resulting module to stdout (note no changes due to simple MLIR)

This setup is designed to serve as a starting point for experimenting with MLIR transformations and compiler pipelines.
Next Steps are to lower to LLVM and eventually integrate with HIP. 

## Dependencies

- [LLVM/MLIR (built and installed)](https://mlir.llvm.org/getting_started/)
- CMake >= 3.13
- C++17 compatible compiler

