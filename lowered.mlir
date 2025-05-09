module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @main() {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %2 = llvm.mlir.constant(2.000000e+00 : f32) : f32
    %3 = llvm.mlir.constant(4 : index) : i64
    %4 = llvm.mlir.constant(4 : index) : i64
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(16 : index) : i64
    %7 = llvm.mlir.zero : !llvm.ptr
    %8 = llvm.getelementptr %7[16] : (!llvm.ptr) -> !llvm.ptr, f32
    %9 = llvm.ptrtoint %8 : !llvm.ptr to i64
    %10 = llvm.call @malloc(%9) : (i64) -> !llvm.ptr
    %11 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %12 = llvm.insertvalue %10, %11[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %10, %12[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.mlir.constant(0 : index) : i64
    %15 = llvm.insertvalue %14, %13[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %3, %15[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.insertvalue %4, %16[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.insertvalue %4, %17[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %5, %18[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.constant(4 : index) : i64
    %21 = llvm.mlir.constant(4 : index) : i64
    %22 = llvm.mlir.constant(1 : index) : i64
    %23 = llvm.mlir.constant(16 : index) : i64
    %24 = llvm.mlir.zero : !llvm.ptr
    %25 = llvm.getelementptr %24[16] : (!llvm.ptr) -> !llvm.ptr, f32
    %26 = llvm.ptrtoint %25 : !llvm.ptr to i64
    %27 = llvm.call @malloc(%26) : (i64) -> !llvm.ptr
    %28 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %27, %28[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %27, %29[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(0 : index) : i64
    %32 = llvm.insertvalue %31, %30[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.insertvalue %20, %32[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %21, %33[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %21, %34[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %22, %35[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(4 : index) : i64
    %38 = llvm.mlir.constant(4 : index) : i64
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.mlir.constant(16 : index) : i64
    %41 = llvm.mlir.zero : !llvm.ptr
    %42 = llvm.getelementptr %41[16] : (!llvm.ptr) -> !llvm.ptr, f32
    %43 = llvm.ptrtoint %42 : !llvm.ptr to i64
    %44 = llvm.call @malloc(%43) : (i64) -> !llvm.ptr
    %45 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %46 = llvm.insertvalue %44, %45[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %44, %46[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.mlir.constant(0 : index) : i64
    %49 = llvm.insertvalue %48, %47[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %37, %49[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %38, %50[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %38, %51[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %39, %52[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.mlir.constant(0 : index) : i64
    %55 = llvm.mlir.constant(4 : index) : i64
    %56 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%54 : i64)
  ^bb1(%57: i64):  // 2 preds: ^bb0, ^bb5
    %58 = llvm.icmp "slt" %57, %55 : i64
    llvm.cond_br %58, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%54 : i64)
  ^bb3(%59: i64):  // 2 preds: ^bb2, ^bb4
    %60 = llvm.icmp "slt" %59, %55 : i64
    llvm.cond_br %60, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %61 = llvm.mlir.constant(4 : index) : i64
    %62 = llvm.mul %57, %61  : i64
    %63 = llvm.add %62, %59  : i64
    %64 = llvm.getelementptr %10[%63] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %1, %64 : f32, !llvm.ptr
    %65 = llvm.mlir.constant(4 : index) : i64
    %66 = llvm.mul %57, %65  : i64
    %67 = llvm.add %66, %59  : i64
    %68 = llvm.getelementptr %27[%67] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %2, %68 : f32, !llvm.ptr
    %69 = llvm.mlir.constant(4 : index) : i64
    %70 = llvm.mul %57, %69  : i64
    %71 = llvm.add %70, %59  : i64
    %72 = llvm.getelementptr %44[%71] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %0, %72 : f32, !llvm.ptr
    %73 = llvm.add %59, %56  : i64
    llvm.br ^bb3(%73 : i64)
  ^bb5:  // pred: ^bb3
    %74 = llvm.add %57, %56  : i64
    llvm.br ^bb1(%74 : i64)
  ^bb6:  // pred: ^bb1
    llvm.call @matmul(%10, %10, %14, %3, %4, %4, %5, %27, %27, %31, %20, %21, %21, %22, %44, %44, %48, %37, %38, %38, %39) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.return
  }
  llvm.func @matmul(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: !llvm.ptr, %arg8: !llvm.ptr, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: !llvm.ptr, %arg15: !llvm.ptr, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg5, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg4, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg6, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg7, %8[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg8, %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg9, %10[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg10, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg12, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg11, %13[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg13, %14[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %17 = llvm.insertvalue %arg14, %16[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.insertvalue %arg15, %17[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %arg16, %18[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.insertvalue %arg17, %19[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.insertvalue %arg19, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.insertvalue %arg18, %21[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %arg20, %22[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.mlir.constant(4 : index) : i64
    %26 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%24 : i64)
  ^bb1(%27: i64):  // 2 preds: ^bb0, ^bb8
    %28 = llvm.icmp "slt" %27, %25 : i64
    llvm.cond_br %28, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%24 : i64)
  ^bb3(%29: i64):  // 2 preds: ^bb2, ^bb7
    %30 = llvm.icmp "slt" %29, %25 : i64
    llvm.cond_br %30, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    llvm.br ^bb5(%24 : i64)
  ^bb5(%31: i64):  // 2 preds: ^bb4, ^bb6
    %32 = llvm.icmp "slt" %31, %25 : i64
    llvm.cond_br %32, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %33 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.mlir.constant(4 : index) : i64
    %35 = llvm.mul %27, %34  : i64
    %36 = llvm.add %35, %31  : i64
    %37 = llvm.getelementptr %33[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %38 = llvm.load %37 : !llvm.ptr -> f32
    %39 = llvm.extractvalue %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.mlir.constant(4 : index) : i64
    %41 = llvm.mul %31, %40  : i64
    %42 = llvm.add %41, %29  : i64
    %43 = llvm.getelementptr %39[%42] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %44 = llvm.load %43 : !llvm.ptr -> f32
    %45 = llvm.extractvalue %23[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.mlir.constant(4 : index) : i64
    %47 = llvm.mul %27, %46  : i64
    %48 = llvm.add %47, %29  : i64
    %49 = llvm.getelementptr %45[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %50 = llvm.load %49 : !llvm.ptr -> f32
    %51 = llvm.fmul %38, %44  : f32
    %52 = llvm.fadd %50, %51  : f32
    %53 = llvm.extractvalue %23[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.mlir.constant(4 : index) : i64
    %55 = llvm.mul %27, %54  : i64
    %56 = llvm.add %55, %29  : i64
    %57 = llvm.getelementptr %53[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %52, %57 : f32, !llvm.ptr
    %58 = llvm.add %31, %26  : i64
    llvm.br ^bb5(%58 : i64)
  ^bb7:  // pred: ^bb5
    %59 = llvm.add %29, %26  : i64
    llvm.br ^bb3(%59 : i64)
  ^bb8:  // pred: ^bb3
    %60 = llvm.add %27, %26  : i64
    llvm.br ^bb1(%60 : i64)
  ^bb9:  // pred: ^bb1
    llvm.return
  }
}

