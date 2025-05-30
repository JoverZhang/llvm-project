; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -passes='default<O2>' -mtriple=powerpc64le-- -o - %s | \
; RUN:   FileCheck %s

%0 = type <{ double }>

define dso_local void @test(ptr %arg) #0 {
; CHECK-LABEL: @test(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    [[I19:%.*]] = getelementptr i8, ptr [[ARG:%.*]], i64 -32
; CHECK-NEXT:    [[I21:%.*]] = getelementptr inbounds nuw i8, ptr [[ARG]], i64 48
; CHECK-NEXT:    [[I21_REPACK1:%.*]] = getelementptr inbounds nuw i8, ptr [[ARG]], i64 64
; CHECK-NEXT:    br label [[BB16:%.*]]
; CHECK:       bb16:
; CHECK-NEXT:    [[I20:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20]])
; CHECK-NEXT:    [[I24_ELT:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_1:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_1:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_1]])
; CHECK-NEXT:    [[I24_ELT_1:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_1]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_1]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_1:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_1]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_1]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_2:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_2:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_2]])
; CHECK-NEXT:    [[I24_ELT_2:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_2]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_2]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_2:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_2]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_2]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_3:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_3:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_3]])
; CHECK-NEXT:    [[I24_ELT_3:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_3]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_3]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_3:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_3]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_3]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_4:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_4:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_4]])
; CHECK-NEXT:    [[I24_ELT_4:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_4]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_4]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_4:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_4]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_4]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_5:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_5:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_5]])
; CHECK-NEXT:    [[I24_ELT_5:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_5]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_5]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_5:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_5]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_5]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_6:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_6:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_6]])
; CHECK-NEXT:    [[I24_ELT_6:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_6]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_6]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_6:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_6]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_6]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_7:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_7:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_7]])
; CHECK-NEXT:    [[I24_ELT_7:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_7]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_7]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_7:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_7]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_7]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_8:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_8:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_8]])
; CHECK-NEXT:    [[I24_ELT_8:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_8]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_8]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_8:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_8]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_8]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_9:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_9:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_9]])
; CHECK-NEXT:    [[I24_ELT_9:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_9]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_9]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_9:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_9]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_9]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_10:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_10:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_10]])
; CHECK-NEXT:    [[I24_ELT_10:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_10]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_10]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_10:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_10]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_10]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_11:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_11:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_11]])
; CHECK-NEXT:    [[I24_ELT_11:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_11]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_11]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_11:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_11]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_11]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_12:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_12:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_12]])
; CHECK-NEXT:    [[I24_ELT_12:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_12]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_12]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_12:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_12]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_12]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_13:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_13:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_13]])
; CHECK-NEXT:    [[I24_ELT_13:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_13]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_13]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_13:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_13]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_13]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_14:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_14:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_14]])
; CHECK-NEXT:    [[I24_ELT_14:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_14]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_14]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_14:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_14]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_14]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    [[I20_15:%.*]] = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr [[I19]])
; CHECK-NEXT:    [[I24_15:%.*]] = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> [[I20_15]])
; CHECK-NEXT:    [[I24_ELT_15:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_15]], 0
; CHECK-NEXT:    store <16 x i8> [[I24_ELT_15]], ptr [[I21]], align 16
; CHECK-NEXT:    [[I24_ELT1_15:%.*]] = extractvalue { <16 x i8>, <16 x i8> } [[I24_15]], 1
; CHECK-NEXT:    store <16 x i8> [[I24_ELT1_15]], ptr [[I21_REPACK1]], align 16
; CHECK-NEXT:    br label [[BB16]], !llvm.loop [[LOOP0:![0-9]+]]
;
bb:
  %i = alloca ptr, align 8
  store ptr %arg, ptr %i, align 8
  %i1 = alloca ptr, align 8
  %i2 = alloca ptr, align 8
  %i3 = alloca i32, align 4
  %i4 = alloca i32, align 4
  %i5 = alloca i64, align 8
  %i6 = alloca i64, align 8
  %i7 = alloca <256 x i1>, align 32
  %i8 = load ptr, ptr %i, align 8
  %i9 = load i32, ptr %i8, align 4
  %i10 = sub nsw i32 %i9, 0
  store i32 %i10, ptr %i4, align 4
  %i11 = load i32, ptr %i4, align 4
  %i12 = ashr i32 %i11, 5
  %i13 = sext i32 %i12 to i64
  %i14 = load i64, ptr %i6, align 8
  %i15 = sub nsw i64 %i14, 1
  br label %bb16

bb16:                                             ; preds = %bb16, %bb
  %i17 = load i64, ptr %i5, align 8
  %i18 = icmp sge i64 %i17, 1
  %i19 = getelementptr i8, ptr %arg, i64 -32
  %i20 = call <256 x i1> @llvm.ppc.vsx.lxvp(ptr %i19)
  store <256 x i1> %i20, ptr %i7, align 32
  %i21 = getelementptr inbounds i8, ptr %arg, i64 48
  %i23 = load <256 x i1>, ptr %i7, align 32
  %i24 = call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i23)
  store { <16 x i8>, <16 x i8> } %i24, ptr %i21, align 16
  br label %bb16, !llvm.loop !1
}

; Function Attrs: argmemonly nounwind readonly
declare <256 x i1> @llvm.ppc.vsx.lxvp(ptr) #1

; Function Attrs: nounwind readnone
declare { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1>) #2

attributes #0 = { "no-trapping-math"="true" }
attributes #1 = { argmemonly nounwind readonly }
attributes #2 = { nounwind readnone }

!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!"llvm.loop.unroll.count", i32 16}
