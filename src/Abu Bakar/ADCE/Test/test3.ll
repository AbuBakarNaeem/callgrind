; ModuleID = 'hello.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %usefulA = alloca i32, align 4
  %uselessA = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 4, i32* %a, align 4
  store i32 4, i32* %b, align 4
  %0 = load i32* %a, align 4
  %cmp = icmp slt i32 %0, 3
  br label %next
next:
  %useful1 = add nsw i32 1, 3
  %useful2 = add nsw i32 %useful1, 2
  store i32 %useful2, i32* %usefulA, align 4
  %useless1 = add nsw i32 %useful1, 2
  %useless2 = mul nsw i32 %useful1, %useful2
  %useless3 = mul nsw i32 %useless1, %useless2 
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 2, i32* %b, align 4
  %1 = load i32* %b, align 4
  %mul = mul nsw i32 %1, 4
  store i32 %mul, i32* %c, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 4, i32* %a, align 4
  store i32 3, i32* %b, align 4
  %2 = load i32* %a, align 4
  %3 = load i32* %b, align 4
  %add = add nsw i32 %2, %3
  store i32 %add, i32* %a, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32* %a, align 4
  ret i32 %4
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
