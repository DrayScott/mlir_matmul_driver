## MLIR breakdown

module {...} 
top-level container for all code, similar to a .c file or translation unit in c++. 

func.func @matmul 
this declares a function with symbol name @matmul 
Arguments (%arg0 ..) are memref types - essentially raw memory buffers

memref<4x4xf32> means a 2D tensor of 32 bit floats with static shape 4x4

MLIR doesn't have types like floats, it uses memrefs which is more tensor/ML-friendly

# linalg.matmul ... 

this is a call to a linalg dialect operation, named matmul
It has a higher-level semantic meaning than raw loops or LLVM IR
linalg.matmul ins(%arg0, %arg1 : memref<4x4xf32>, memref<4x4xf32>)
              outs(%arg2 : memref<4x4xf32>)
It means: 
- Load matrices from %arg0 and %arg1
- Perform matrix multiplication
- Store the result into %arg2

These are buffered versions — so you provide the storage (no implicit allocation like you might see in pure functional IR).

## Transformed.mlir 

This is the result of lowering a linalg.matmul operation into a structured control flow (SCF) 
and basic arthmetic/memory operations. 

These are constants used for loop bounds:

    %c0: loop start

    %c4: loop end (4x4 matrices)

    %c1: step

This is the classic triple-nested loop:

    %arg3: i (row index of A, row index of output C)

    %arg4: j (column index of B, column index of output C)

    %arg5: k (reduction index — traverses the row of A and column of B)

%0: loads A[i][k]
%1: loads B[k][j]
%2: current value of C[i][j]
%3: computes A[i][k] * B[k][j]
%4: adds it to the current C[i][j]

This lowered version is:

    A hand-written triple-nested loop matmul that takes A and B as input, and accumulates the result into C.

This is exactly what MLIR is great at: progressively lowering from high-level abstractions (like linalg.matmul) into lower-level structured loops, then ultimately to LLVM IR and machine code.


## Adding Passes to C++ driver

Canonicalize: 
 - This cleans up the IR by folding constants, eliminating nops, and simplifying patterns (like x + 0 = x)

CSE: 
- Removes redundant computations (if two ops compute the same result, keep one and reuse it) 

Neither of these passes do anything for my current MLIR as there were no ops to change. We can change this later on to be more dynamic so we can see these passes actually doing something

## Lowering to LLVM IR

so we are starting from linalg.matmul <...> then we will add passes to lower this into: 
- memref + affine/scf (loops)
- arith, cf, func (core ops)
- llvm dialect

Then we can dump to LLVM IR, or JIT it. 

https://eli.thegreenplace.net/2018/affine-transformations/