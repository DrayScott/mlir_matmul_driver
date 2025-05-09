module {
    func.func @main() {
        %c0_f32 = arith.constant 0.0 : f32
        %c1_f32 = arith.constant 1.0 : f32
        %c2_f32 = arith.constant 2.0 : f32

        %A = memref.alloc() : memref<4x4xf32>
        %B = memref.alloc() : memref<4x4xf32>
        %C = memref.alloc() : memref<4x4xf32>
    
        // Fill A and B with constants
        %c0 = arith.constant 0 : index
        %c4 = arith.constant 4 : index
        %c1 = arith.constant 1 : index 

        scf.for %i = %c0 to %c4 step %c1 {
            scf.for %j = %c0 to %c4 step %c1 {
                memref.store %c1_f32, %A[%i, %j] : memref<4x4xf32>
                memref.store %c2_f32, %B[%i, %j] : memref<4x4xf32>
                memref.store %c0_f32, %C[%i, %j] : memref<4x4xf32>
            }
        }

        // This is where you call the matmul I made
        call @matmul(%A, %B, %C) : (memref<4x4xf32>, memref<4x4xf32>, memref<4x4xf32>) -> ()

        return
    }
    
    func.func @matmul(%arg0: memref<4x4xf32>, %arg1: memref<4x4xf32>, %arg2: memref<4x4xf32>) {
        %c0 = arith.constant 0 : index
        %c4 = arith.constant 4 : index
        %c1 = arith.constant 1 : index
        scf.for %arg3 = %c0 to %c4 step %c1 {
            scf.for %arg4 = %c0 to %c4 step %c1 {
                scf.for %arg5 = %c0 to %c4 step %c1 {
                    %0 = memref.load %arg0[%arg3, %arg5] : memref<4x4xf32>
                    %1 = memref.load %arg1[%arg5, %arg4] : memref<4x4xf32>
                    %2 = memref.load %arg2[%arg3, %arg4] : memref<4x4xf32>
                    %3 = arith.mulf %0, %1 : f32
                    %4 = arith.addf %2, %3 : f32
                    memref.store %4, %arg2[%arg3, %arg4] : memref<4x4xf32>
                }
            }
    }
    return
  }

}