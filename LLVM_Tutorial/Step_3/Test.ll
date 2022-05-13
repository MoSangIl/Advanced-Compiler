; ModuleID = 'Test.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @init(float* %arr, float* %brr, float* %crr, i64 %n) #0 {
  %1 = alloca float*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca i64, align 8
  %i = alloca i64, align 8
  store float* %arr, float** %1, align 8
  store float* %brr, float** %2, align 8
  store float* %crr, float** %3, align 8
  store i64 %n, i64* %4, align 8
  store i64 0, i64* %i, align 8
  br label %5

; <label>:5                                       ; preds = %33, %0
  %6 = load i64, i64* %i, align 8
  %7 = load i64, i64* %4, align 8
  %8 = icmp ult i64 %6, %7
  br i1 %8, label %9, label %36

; <label>:9                                       ; preds = %5
  %10 = load i64, i64* %4, align 8
  %11 = load i64, i64* %i, align 8
  %12 = sub i64 %10, %11
  %13 = uitofp i64 %12 to float
  %14 = load i64, i64* %i, align 8
  %15 = load float*, float** %1, align 8
  %16 = getelementptr inbounds float, float* %15, i64 %14
  store float %13, float* %16, align 4
  %17 = load i64, i64* %4, align 8
  %18 = load i64, i64* %4, align 8
  %19 = add i64 %17, %18
  %20 = load i64, i64* %i, align 8
  %21 = add i64 %19, %20
  %22 = uitofp i64 %21 to float
  %23 = load i64, i64* %i, align 8
  %24 = load float*, float** %2, align 8
  %25 = getelementptr inbounds float, float* %24, i64 %23
  store float %22, float* %25, align 4
  %26 = load i64, i64* %i, align 8
  %27 = load i64, i64* %4, align 8
  %28 = add i64 %26, %27
  %29 = uitofp i64 %28 to float
  %30 = load i64, i64* %i, align 8
  %31 = load float*, float** %3, align 8
  %32 = getelementptr inbounds float, float* %31, i64 %30
  store float %29, float* %32, align 4
  br label %33

; <label>:33                                      ; preds = %9
  %34 = load i64, i64* %i, align 8
  %35 = add i64 %34, 1
  store i64 %35, i64* %i, align 8
  br label %5

; <label>:36                                      ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define void @VectorAdd(float* %arr, float* %brr, float* %crr, i64 %n) #0 {
  %1 = alloca float*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca i64, align 8
  %i = alloca i64, align 8
  store float* %arr, float** %1, align 8
  store float* %brr, float** %2, align 8
  store float* %crr, float** %3, align 8
  store i64 %n, i64* %4, align 8
  store i64 0, i64* %i, align 8
  br label %5

; <label>:5                                       ; preds = %27, %0
  %6 = load i64, i64* %i, align 8
  %7 = load i64, i64* %4, align 8
  %8 = icmp ult i64 %6, %7
  br i1 %8, label %9, label %30

; <label>:9                                       ; preds = %5
  %10 = load i64, i64* %i, align 8
  %11 = load float*, float** %1, align 8
  %12 = getelementptr inbounds float, float* %11, i64 %10
  %13 = load float, float* %12, align 4
  %14 = load i64, i64* %i, align 8
  %15 = load float*, float** %2, align 8
  %16 = getelementptr inbounds float, float* %15, i64 %14
  %17 = load float, float* %16, align 4
  %18 = fadd float %13, %17
  %19 = load i64, i64* %i, align 8
  %20 = load float*, float** %1, align 8
  %21 = getelementptr inbounds float, float* %20, i64 %19
  %22 = load float, float* %21, align 4
  %23 = fdiv float %18, %22
  %24 = load i64, i64* %i, align 8
  %25 = load float*, float** %3, align 8
  %26 = getelementptr inbounds float, float* %25, i64 %24
  store float %23, float* %26, align 4
  br label %27

; <label>:27                                      ; preds = %9
  %28 = load i64, i64* %i, align 8
  %29 = add i64 %28, 1
  store i64 %29, i64* %i, align 8
  br label %5

; <label>:30                                      ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define void @FuseAddMul(float* %arr, float* %brr, float* %crr, i64 %n) #0 {
  %1 = alloca float*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca i64, align 8
  %i = alloca i64, align 8
  store float* %arr, float** %1, align 8
  store float* %brr, float** %2, align 8
  store float* %crr, float** %3, align 8
  store i64 %n, i64* %4, align 8
  store i64 0, i64* %i, align 8
  br label %5

; <label>:5                                       ; preds = %27, %0
  %6 = load i64, i64* %i, align 8
  %7 = load i64, i64* %4, align 8
  %8 = icmp ult i64 %6, %7
  br i1 %8, label %9, label %30

; <label>:9                                       ; preds = %5
  %10 = load i64, i64* %i, align 8
  %11 = load float*, float** %1, align 8
  %12 = getelementptr inbounds float, float* %11, i64 %10
  %13 = load float, float* %12, align 4
  %14 = load i64, i64* %i, align 8
  %15 = load float*, float** %2, align 8
  %16 = getelementptr inbounds float, float* %15, i64 %14
  %17 = load float, float* %16, align 4
  %18 = fmul float %13, %17
  %19 = load i64, i64* %i, align 8
  %20 = load float*, float** %3, align 8
  %21 = getelementptr inbounds float, float* %20, i64 %19
  %22 = load float, float* %21, align 4
  %23 = fadd float %18, %22
  %24 = load i64, i64* %i, align 8
  %25 = load float*, float** %3, align 8
  %26 = getelementptr inbounds float, float* %25, i64 %24
  store float %23, float* %26, align 4
  br label %27

; <label>:27                                      ; preds = %9
  %28 = load i64, i64* %i, align 8
  %29 = add i64 %28, 1
  store i64 %29, i64* %i, align 8
  br label %5

; <label>:30                                      ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %arr = alloca [10 x float], align 16
  %brr = alloca [10 x float], align 16
  %crr = alloca [10 x float], align 16
  %i = alloca i64, align 8
  store i32 0, i32* %1, align 4
  %2 = getelementptr inbounds [10 x float], [10 x float]* %arr, i32 0, i32 0
  %3 = getelementptr inbounds [10 x float], [10 x float]* %brr, i32 0, i32 0
  %4 = getelementptr inbounds [10 x float], [10 x float]* %crr, i32 0, i32 0
  call void @init(float* %2, float* %3, float* %4, i64 10)
  %5 = getelementptr inbounds [10 x float], [10 x float]* %arr, i32 0, i32 0
  %6 = getelementptr inbounds [10 x float], [10 x float]* %brr, i32 0, i32 0
  %7 = getelementptr inbounds [10 x float], [10 x float]* %crr, i32 0, i32 0
  call void @VectorAdd(float* %5, float* %6, float* %7, i64 10)
  %8 = getelementptr inbounds [10 x float], [10 x float]* %arr, i32 0, i32 0
  %9 = getelementptr inbounds [10 x float], [10 x float]* %brr, i32 0, i32 0
  %10 = getelementptr inbounds [10 x float], [10 x float]* %crr, i32 0, i32 0
  call void @FuseAddMul(float* %8, float* %9, float* %10, i64 10)
  store i64 0, i64* %i, align 8
  br label %11

; <label>:11                                      ; preds = %20, %0
  %12 = load i64, i64* %i, align 8
  %13 = icmp ult i64 %12, 10
  br i1 %13, label %14, label %23

; <label>:14                                      ; preds = %11
  %15 = load i64, i64* %i, align 8
  %16 = getelementptr inbounds [10 x float], [10 x float]* %crr, i64 0, i64 %15
  %17 = load float, float* %16, align 4
  %18 = fpext float %17 to double
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %18)
  br label %20

; <label>:20                                      ; preds = %14
  %21 = load i64, i64* %i, align 8
  %22 = add i64 %21, 1
  store i64 %22, i64* %i, align 8
  br label %11

; <label>:23                                      ; preds = %11
  %24 = load i32, i32* %1, align 4
  ret i32 %24
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
