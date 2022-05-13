; ModuleID = 'Test.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Input N (0~5)\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@main.arr = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@main.brr = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str.2 = private unnamed_addr constant [31 x i8] c"... %d MINUS %d MINUS %d = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @Add(i32* %arr, i32* %brr, i32* %crr, i64 %n) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i64, align 8
  store i32* %arr, i32** %1, align 8
  store i32* %brr, i32** %2, align 8
  store i32* %crr, i32** %3, align 8
  store i64 %n, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  %6 = load i32*, i32** %1, align 8
  %7 = getelementptr inbounds i32, i32* %6, i64 %5
  %8 = load i32, i32* %7, align 4
  %9 = load i64, i64* %4, align 8
  %10 = load i32*, i32** %2, align 8
  %11 = getelementptr inbounds i32, i32* %10, i64 %9
  %12 = load i32, i32* %11, align 4
  %13 = add nsw i32 %8, %12
  %14 = sext i32 %13 to i64
  %15 = load i64, i64* %4, align 8
  %16 = add i64 %14, %15
  %17 = trunc i64 %16 to i32
  %18 = load i64, i64* %4, align 8
  %19 = load i32*, i32** %3, align 8
  %20 = getelementptr inbounds i32, i32* %19, i64 %18
  store i32 %17, i32* %20, align 4
  %21 = load i64, i64* %4, align 8
  %22 = load i32*, i32** %3, align 8
  %23 = getelementptr inbounds i32, i32* %22, i64 %21
  %24 = load i32, i32* %23, align 4
  ret i32 %24
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %N = alloca i32, align 4
  %crr = alloca [5 x i32], align 16
  %arr = alloca [5 x i32], align 16
  %brr = alloca [5 x i32], align 16
  %result = alloca i32, align 4
  store i32 0, i32* %N, align 4
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0))
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* %N)
  %3 = bitcast [5 x i32]* %crr to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 20, i32 16, i1 false)
  %4 = bitcast [5 x i32]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* bitcast ([5 x i32]* @main.arr to i8*), i64 20, i32 16, i1 false)
  %5 = bitcast [5 x i32]* %brr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* bitcast ([5 x i32]* @main.brr to i8*), i64 20, i32 16, i1 false)
  %6 = getelementptr inbounds [5 x i32], [5 x i32]* %arr, i32 0, i32 0
  %7 = getelementptr inbounds [5 x i32], [5 x i32]* %brr, i32 0, i32 0
  %8 = getelementptr inbounds [5 x i32], [5 x i32]* %crr, i32 0, i32 0
  %9 = load i32, i32* %N, align 4
  %10 = sext i32 %9 to i64
  %11 = call i32 @Add(i32* %6, i32* %7, i32* %8, i64 %10)
  store i32 %11, i32* %result, align 4
  %12 = load i32, i32* %N, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [5 x i32], [5 x i32]* %arr, i64 0, i64 %13
  %15 = load i32, i32* %14, align 4
  %16 = load i32, i32* %N, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [5 x i32], [5 x i32]* %brr, i64 0, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = load i32, i32* %N, align 4
  %21 = load i32, i32* %result, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i32 0, i32 0), i32 %15, i32 %19, i32 %20, i32 %21)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

declare i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
