; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

define void @main() {
  %1 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (float, ptr null, i32 16) to i64))
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %1, 1
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 4, 3, 0
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 4, 3, 1
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 4, 4, 0
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1
  %9 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (float, ptr null, i32 16) to i64))
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %9, 0
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %9, 1
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 4, 3, 0
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 4, 3, 1
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 4, 4, 0
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1
  %17 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (float, ptr null, i32 16) to i64))
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %17, 0
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, ptr %17, 1
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 0, 2
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 4, 3, 0
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 4, 3, 1
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 4, 4, 0
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 1, 4, 1
  br label %25

25:                                               ; preds = %43, %0
  %26 = phi i64 [ %44, %43 ], [ 0, %0 ]
  %27 = icmp slt i64 %26, 4
  br i1 %27, label %28, label %45

28:                                               ; preds = %25
  br label %29

29:                                               ; preds = %32, %28
  %30 = phi i64 [ %42, %32 ], [ 0, %28 ]
  %31 = icmp slt i64 %30, 4
  br i1 %31, label %32, label %43

32:                                               ; preds = %29
  %33 = mul i64 %26, 4
  %34 = add i64 %33, %30
  %35 = getelementptr float, ptr %1, i64 %34
  store float 1.000000e+00, ptr %35, align 4
  %36 = mul i64 %26, 4
  %37 = add i64 %36, %30
  %38 = getelementptr float, ptr %9, i64 %37
  store float 2.000000e+00, ptr %38, align 4
  %39 = mul i64 %26, 4
  %40 = add i64 %39, %30
  %41 = getelementptr float, ptr %17, i64 %40
  store float 0.000000e+00, ptr %41, align 4
  %42 = add i64 %30, 1
  br label %29

43:                                               ; preds = %29
  %44 = add i64 %26, 1
  br label %25

45:                                               ; preds = %25
  call void @matmul(ptr %1, ptr %1, i64 0, i64 4, i64 4, i64 4, i64 1, ptr %9, ptr %9, i64 0, i64 4, i64 4, i64 4, i64 1, ptr %17, ptr %17, i64 0, i64 4, i64 4, i64 4, i64 1)
  ret void
}

define void @matmul(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, ptr %7, ptr %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, ptr %14, ptr %15, i64 %16, i64 %17, i64 %18, i64 %19, i64 %20) {
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, ptr %1, 1
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 %2, 2
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 %3, 3, 0
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, i64 %5, 4, 0
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %26, i64 %4, 3, 1
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, i64 %6, 4, 1
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %7, 0
  %30 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, ptr %8, 1
  %31 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %30, i64 %9, 2
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, i64 %10, 3, 0
  %33 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, i64 %12, 4, 0
  %34 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %33, i64 %11, 3, 1
  %35 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %34, i64 %13, 4, 1
  %36 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %14, 0
  %37 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %36, ptr %15, 1
  %38 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %37, i64 %16, 2
  %39 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %38, i64 %17, 3, 0
  %40 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, i64 %19, 4, 0
  %41 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %40, i64 %18, 3, 1
  %42 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %41, i64 %20, 4, 1
  br label %43

43:                                               ; preds = %79, %21
  %44 = phi i64 [ %80, %79 ], [ 0, %21 ]
  %45 = icmp slt i64 %44, 4
  br i1 %45, label %46, label %81

46:                                               ; preds = %43
  br label %47

47:                                               ; preds = %77, %46
  %48 = phi i64 [ %78, %77 ], [ 0, %46 ]
  %49 = icmp slt i64 %48, 4
  br i1 %49, label %50, label %79

50:                                               ; preds = %47
  br label %51

51:                                               ; preds = %54, %50
  %52 = phi i64 [ %76, %54 ], [ 0, %50 ]
  %53 = icmp slt i64 %52, 4
  br i1 %53, label %54, label %77

54:                                               ; preds = %51
  %55 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, 1
  %56 = mul i64 %44, 4
  %57 = add i64 %56, %52
  %58 = getelementptr float, ptr %55, i64 %57
  %59 = load float, ptr %58, align 4
  %60 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %35, 1
  %61 = mul i64 %52, 4
  %62 = add i64 %61, %48
  %63 = getelementptr float, ptr %60, i64 %62
  %64 = load float, ptr %63, align 4
  %65 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %42, 1
  %66 = mul i64 %44, 4
  %67 = add i64 %66, %48
  %68 = getelementptr float, ptr %65, i64 %67
  %69 = load float, ptr %68, align 4
  %70 = fmul float %59, %64
  %71 = fadd float %69, %70
  %72 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %42, 1
  %73 = mul i64 %44, 4
  %74 = add i64 %73, %48
  %75 = getelementptr float, ptr %72, i64 %74
  store float %71, ptr %75, align 4
  %76 = add i64 %52, 1
  br label %51

77:                                               ; preds = %51
  %78 = add i64 %48, 1
  br label %47

79:                                               ; preds = %47
  %80 = add i64 %44, 1
  br label %43

81:                                               ; preds = %43
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
