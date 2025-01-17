; ModuleID = 'prog.opt.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@ncols = common global i16 0, align 2
@aPriori1 = common global [512 x float] zeroinitializer, align 16
@.str = private constant [13 x i8] c"aPriori1_out\00"
@aPriori2 = common global [512 x float] zeroinitializer, align 16
@.str1 = private constant [13 x i8] c"aPriori2_out\00"
@.str2 = private constant [10 x i8] c"matrix_in\00"
@mem11 = common global [512 x i16] zeroinitializer, align 16
@nrows = common global i16 0, align 2
@ncol_ind_11 = common global i16 0, align 2
@mem12 = common global [512 x i16] zeroinitializer, align 16
@ncol_ind_12 = common global i16 0, align 2
@mem21 = common global [512 x i16] zeroinitializer, align 16
@ncol_ind_21 = common global i16 0, align 2
@mem22 = common global [512 x i16] zeroinitializer, align 16
@ncol_ind_22 = common global i16 0, align 2
@.str3 = private constant [11 x i8] c"maxNitr_in\00"
@maxNitr = common global i16 0, align 2
@.str4 = private constant [10 x i8] c"ebbyNo_in\00"
@ebbyNo = common global float 0.000000e+00, align 4
@.str5 = private constant [8 x i8] c"rate_in\00"
@rate = common global float 0.000000e+00, align 4
@.str6 = private constant [14 x i8] c"code_block_in\00"
@code_block1 = common global [512 x float] zeroinitializer, align 16
@code_block2 = common global [512 x float] zeroinitializer, align 16
@message11 = common global [512 x float] zeroinitializer, align 16
@message12 = common global [512 x float] zeroinitializer, align 16
@message21 = common global [512 x float] zeroinitializer, align 16
@message22 = common global [512 x float] zeroinitializer, align 16
@aPosteriori1 = common global [512 x float] zeroinitializer, align 16
@aPosteriori2 = common global [512 x float] zeroinitializer, align 16
@ext_info11 = common global [512 x float] zeroinitializer, align 16
@ext_info12 = common global [512 x float] zeroinitializer, align 16
@ext_info21 = common global [512 x float] zeroinitializer, align 16
@ext_info22 = common global [512 x float] zeroinitializer, align 16
@trans_info11_12 = common global [512 x float] zeroinitializer, align 16
@trans_info12_11 = common global [512 x float] zeroinitializer, align 16
@trans_info21_22 = common global [512 x float] zeroinitializer, align 16
@trans_info22_21 = common global [512 x float] zeroinitializer, align 16
@is_decoded_1 = common global i16 0, align 2
@is_decoded_2 = common global i16 0, align 2
@.str7 = private constant [11 x i8] c"matrix_out\00"
@.str8 = private constant [16 x i8] c"code_block1_out\00"
@.str9 = private constant [16 x i8] c"code_block2_out\00"
@.str10 = private constant [19 x i8] c"init_message11_out\00"
@.str11 = private constant [19 x i8] c"init_message12_out\00"
@.str12 = private constant [19 x i8] c"init_message21_out\00"
@.str13 = private constant [19 x i8] c"init_message22_out\00"
@.str14 = private constant [17 x i8] c"aPosteriori1_out\00"
@.str15 = private constant [17 x i8] c"aPosteriori2_out\00"
@.str16 = private constant [15 x i8] c"ext_info11_out\00"
@.str17 = private constant [15 x i8] c"ext_info12_out\00"
@.str18 = private constant [15 x i8] c"ext_info21_out\00"
@.str19 = private constant [15 x i8] c"ext_info22_out\00"
@.str20 = private constant [20 x i8] c"trans_info22_21_out\00"
@.str21 = private constant [20 x i8] c"trans_info21_22_out\00"
@.str22 = private constant [20 x i8] c"trans_info11_12_out\00"
@.str23 = private constant [20 x i8] c"trans_info12_11_out\00"
@.str24 = private constant [24 x i8] c"reading_code_block_done\00"
@.str25 = private constant [18 x i8] c"aposteriori2_init\00"
@.str26 = private constant [22 x i8] c"message11_initialized\00"
@.str27 = private constant [32 x i8] c"trans_info11_12_calulation_done\00"
@.str28 = private constant [32 x i8] c"trans_info12_11_calulation_done\00"
@.str29 = private constant [26 x i8] c"aPosteriori1_phase_1_done\00"
@.str30 = private constant [18 x i8] c"is_decoded_from_2\00"
@.str31 = private constant [14 x i8] c"is_decoded_d2\00"
@.str32 = private constant [22 x i8] c"message12_initialized\00"
@.str33 = private constant [26 x i8] c"aPosteriori2_phase_1_done\00"
@.str34 = private constant [14 x i8] c"is_decoded_d3\00"
@.str35 = private constant [32 x i8] c"trans_info21_22_calulation_done\00"
@.str36 = private constant [32 x i8] c"trans_info22_21_calulation_done\00"
@.str37 = private constant [14 x i8] c"is_decoded_d4\00"
@Nitr_required = common global i16 0, align 2

define void @send_init_apriori1() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph.preheader

bb.nph.preheader:                                 ; preds = %0
  br label %bb.nph

bb.nph:                                           ; preds = %bb.nph, %bb.nph.preheader
  %indvar = phi i64 [ %tmp, %bb.nph ], [ 0, %bb.nph.preheader ]
  %tmp1 = add i64 %indvar, 1
  %tmp2 = trunc i64 %tmp1 to i32
  %scevgep = getelementptr [512 x float]* @aPriori1, i64 0, i64 %indvar
  %3 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), float %3) nounwind
  %tmp = add i64 %indvar, 1
  %4 = load i16* @ncols, align 2
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %tmp2, %5
  br i1 %6, label %bb.nph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %bb.nph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

declare void @write_float32(i8*, float)

define void @send_init_apriori2() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph.preheader

bb.nph.preheader:                                 ; preds = %0
  br label %bb.nph

bb.nph:                                           ; preds = %bb.nph, %bb.nph.preheader
  %indvar = phi i64 [ %tmp, %bb.nph ], [ 0, %bb.nph.preheader ]
  %tmp1 = add i64 %indvar, 1
  %tmp2 = trunc i64 %tmp1 to i32
  %scevgep = getelementptr [512 x float]* @aPriori2, i64 0, i64 %indvar
  %3 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([13 x i8]* @.str1, i64 0, i64 0), float %3) nounwind
  %tmp = add i64 %indvar, 1
  %4 = load i16* @ncols, align 2
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %tmp2, %5
  br i1 %6, label %bb.nph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %bb.nph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initMem() nounwind {
bb.nph20:
  br label %0

; <label>:0                                       ; preds = %0, %bb.nph20
  %indvar57 = phi i64 [ 0, %bb.nph20 ], [ %indvar.next58, %0 ]
  %scevgep60 = getelementptr [512 x i16]* @mem11, i64 0, i64 %indvar57
  %1 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) nounwind
  store i16 %1, i16* %scevgep60, align 2
  %indvar.next58 = add i64 %indvar57, 1
  %exitcond22 = icmp eq i64 %indvar.next58, 3
  br i1 %exitcond22, label %._crit_edge21, label %0

._crit_edge21:                                    ; preds = %0
  %2 = load i16* getelementptr inbounds ([512 x i16]* @mem11, i64 0, i64 0), align 16
  store i16 %2, i16* @nrows, align 2
  %3 = load i16* getelementptr inbounds ([512 x i16]* @mem11, i64 0, i64 1), align 2
  store i16 %3, i16* @ncols, align 2
  %4 = load i16* getelementptr inbounds ([512 x i16]* @mem11, i64 0, i64 2), align 4
  store i16 %4, i16* @ncol_ind_11, align 2
  %5 = sub i16 0, %4
  %6 = icmp eq i16 %2, %5
  br i1 %6, label %bb.nph15.preheader, label %bb.nph18

bb.nph18:                                         ; preds = %._crit_edge21
  %tmp52 = add i16 %2, %4
  %tmp1 = zext i16 %tmp52 to i64
  br label %7

; <label>:7                                       ; preds = %7, %bb.nph18
  %indvar50 = phi i64 [ 0, %bb.nph18 ], [ %indvar.next51, %7 ]
  %tmp3 = add i64 %indvar50, 3
  %scevgep56 = getelementptr [512 x i16]* @mem11, i64 0, i64 %tmp3
  %8 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) nounwind
  store i16 %8, i16* %scevgep56, align 2
  %indvar.next51 = add i64 %indvar50, 1
  %exitcond2 = icmp eq i64 %indvar.next51, %tmp1
  br i1 %exitcond2, label %bb.nph15.loopexit, label %7

bb.nph15.loopexit:                                ; preds = %7
  br label %bb.nph15.preheader

bb.nph15.preheader:                               ; preds = %bb.nph15.loopexit, %._crit_edge21
  br label %bb.nph15

bb.nph15:                                         ; preds = %bb.nph15, %bb.nph15.preheader
  %indvar46 = phi i64 [ %indvar.next47, %bb.nph15 ], [ 0, %bb.nph15.preheader ]
  %scevgep49 = getelementptr [512 x i16]* @mem12, i64 0, i64 %indvar46
  %9 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) nounwind
  store i16 %9, i16* %scevgep49, align 2
  %indvar.next47 = add i64 %indvar46, 1
  %exitcond20 = icmp eq i64 %indvar.next47, 3
  br i1 %exitcond20, label %._crit_edge16, label %bb.nph15

._crit_edge16:                                    ; preds = %bb.nph15
  %10 = load i16* getelementptr inbounds ([512 x i16]* @mem12, i64 0, i64 2), align 4
  store i16 %10, i16* @ncol_ind_12, align 2
  %11 = load i16* getelementptr inbounds ([512 x i16]* @mem12, i64 0, i64 0), align 16
  %12 = sub i16 0, %10
  %13 = icmp eq i16 %11, %12
  br i1 %13, label %bb.nph9.preheader, label %bb.nph12

bb.nph12:                                         ; preds = %._crit_edge16
  %tmp41 = add i16 %11, %10
  %tmp5 = zext i16 %tmp41 to i64
  br label %14

; <label>:14                                      ; preds = %14, %bb.nph12
  %indvar39 = phi i64 [ 0, %bb.nph12 ], [ %indvar.next40, %14 ]
  %tmp7 = add i64 %indvar39, 3
  %scevgep45 = getelementptr [512 x i16]* @mem12, i64 0, i64 %tmp7
  %15 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) nounwind
  store i16 %15, i16* %scevgep45, align 2
  %indvar.next40 = add i64 %indvar39, 1
  %exitcond6 = icmp eq i64 %indvar.next40, %tmp5
  br i1 %exitcond6, label %bb.nph9.loopexit, label %14

bb.nph9.loopexit:                                 ; preds = %14
  br label %bb.nph9.preheader

bb.nph9.preheader:                                ; preds = %bb.nph9.loopexit, %._crit_edge16
  br label %bb.nph9

bb.nph9:                                          ; preds = %bb.nph9, %bb.nph9.preheader
  %indvar35 = phi i64 [ %indvar.next36, %bb.nph9 ], [ 0, %bb.nph9.preheader ]
  %scevgep38 = getelementptr [512 x i16]* @mem21, i64 0, i64 %indvar35
  %16 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) nounwind
  store i16 %16, i16* %scevgep38, align 2
  %indvar.next36 = add i64 %indvar35, 1
  %exitcond18 = icmp eq i64 %indvar.next36, 3
  br i1 %exitcond18, label %._crit_edge10, label %bb.nph9

._crit_edge10:                                    ; preds = %bb.nph9
  %17 = load i16* getelementptr inbounds ([512 x i16]* @mem21, i64 0, i64 2), align 4
  store i16 %17, i16* @ncol_ind_21, align 2
  %18 = load i16* getelementptr inbounds ([512 x i16]* @mem21, i64 0, i64 0), align 16
  %19 = sub i16 0, %17
  %20 = icmp eq i16 %18, %19
  br i1 %20, label %bb.nph3.preheader, label %bb.nph6

bb.nph6:                                          ; preds = %._crit_edge10
  %tmp30 = add i16 %18, %17
  %tmp9 = zext i16 %tmp30 to i64
  br label %21

; <label>:21                                      ; preds = %21, %bb.nph6
  %indvar28 = phi i64 [ 0, %bb.nph6 ], [ %indvar.next29, %21 ]
  %tmp11 = add i64 %indvar28, 3
  %scevgep34 = getelementptr [512 x i16]* @mem21, i64 0, i64 %tmp11
  %22 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) nounwind
  store i16 %22, i16* %scevgep34, align 2
  %indvar.next29 = add i64 %indvar28, 1
  %exitcond10 = icmp eq i64 %indvar.next29, %tmp9
  br i1 %exitcond10, label %bb.nph3.loopexit, label %21

bb.nph3.loopexit:                                 ; preds = %21
  br label %bb.nph3.preheader

bb.nph3.preheader:                                ; preds = %bb.nph3.loopexit, %._crit_edge10
  br label %bb.nph3

bb.nph3:                                          ; preds = %bb.nph3, %bb.nph3.preheader
  %indvar24 = phi i64 [ %indvar.next25, %bb.nph3 ], [ 0, %bb.nph3.preheader ]
  %scevgep27 = getelementptr [512 x i16]* @mem22, i64 0, i64 %indvar24
  %23 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) nounwind
  store i16 %23, i16* %scevgep27, align 2
  %indvar.next25 = add i64 %indvar24, 1
  %exitcond = icmp eq i64 %indvar.next25, 3
  br i1 %exitcond, label %._crit_edge4, label %bb.nph3

._crit_edge4:                                     ; preds = %bb.nph3
  %24 = load i16* getelementptr inbounds ([512 x i16]* @mem22, i64 0, i64 2), align 4
  store i16 %24, i16* @ncol_ind_22, align 2
  %25 = load i16* getelementptr inbounds ([512 x i16]* @mem22, i64 0, i64 0), align 16
  %26 = sub i16 0, %24
  %27 = icmp eq i16 %25, %26
  br i1 %27, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %._crit_edge4
  %tmp = add i16 %25, %24
  %tmp13 = zext i16 %tmp to i64
  br label %28

; <label>:28                                      ; preds = %28, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %28 ]
  %tmp15 = add i64 %indvar, 3
  %scevgep = getelementptr [512 x i16]* @mem22, i64 0, i64 %tmp15
  %29 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) nounwind
  store i16 %29, i16* %scevgep, align 2
  %indvar.next = add i64 %indvar, 1
  %exitcond14 = icmp eq i64 %indvar.next, %tmp13
  br i1 %exitcond14, label %._crit_edge.loopexit, label %28

._crit_edge.loopexit:                             ; preds = %28
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge4
  ret void
}

declare zeroext i16 @read_uint16(i8*)

define void @initInputs() nounwind {
  %1 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0)) nounwind
  store i16 %1, i16* @maxNitr, align 2
  %2 = tail call float @read_float32(i8* getelementptr inbounds ([10 x i8]* @.str4, i64 0, i64 0)) nounwind
  store float %2, float* @ebbyNo, align 4
  tail call void @initMem()
  %3 = tail call float @read_float32(i8* getelementptr inbounds ([8 x i8]* @.str5, i64 0, i64 0)) nounwind
  store float %3, float* @rate, align 4
  ret void
}

declare float @read_float32(i8*)

define void @readCodeBlock() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph4.preheader

bb.nph4.preheader:                                ; preds = %0
  br label %bb.nph4

.preheader:                                       ; preds = %bb.nph4
  %.lcssa = phi i16 [ %9, %bb.nph4 ]
  %3 = icmp eq i16 %.lcssa, 0
  br i1 %3, label %._crit_edge, label %bb.nph.preheader

bb.nph.preheader:                                 ; preds = %.preheader
  br label %bb.nph

bb.nph4:                                          ; preds = %bb.nph4, %bb.nph4.preheader
  %4 = phi i16 [ %8, %bb.nph4 ], [ 0, %bb.nph4.preheader ]
  %tmp1 = add i16 %4, 1
  %5 = tail call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str6, i64 0, i64 0)) nounwind
  %6 = zext i16 %4 to i64
  %7 = getelementptr inbounds [512 x float]* @code_block1, i64 0, i64 %6
  store float %5, float* %7, align 4
  %8 = add i16 %4, 1
  %9 = load i16* @ncols, align 2
  %10 = icmp ult i16 %tmp1, %9
  br i1 %10, label %bb.nph4, label %.preheader

bb.nph:                                           ; preds = %bb.nph, %bb.nph.preheader
  %11 = phi i16 [ %15, %bb.nph ], [ 0, %bb.nph.preheader ]
  %tmp = add i16 %11, 1
  %12 = tail call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str6, i64 0, i64 0)) nounwind
  %13 = zext i16 %11 to i64
  %14 = getelementptr inbounds [512 x float]* @code_block2, i64 0, i64 %13
  store float %12, float* %14, align 4
  %15 = add i16 %11, 1
  %16 = load i16* @ncols, align 2
  %17 = icmp ult i16 %tmp, %16
  br i1 %17, label %bb.nph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %bb.nph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader, %0
  ret void
}

define void @initialize_aPriori2() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %send_init_apriori2.exit, label %bb.nph

bb.nph:                                           ; preds = %0
  %3 = load float* @ebbyNo, align 4
  %4 = load float* @rate, align 4
  %5 = fmul float %4, %3
  %tmp3 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op8 = add i64 %6, 1
  %tmp6 = select i1 %tmp3, i64 %.op8, i64 1
  br label %7

; <label>:7                                       ; preds = %7, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %7 ]
  %scevgep7 = getelementptr [512 x float]* @aPriori2, i64 0, i64 %indvar
  %scevgep = getelementptr [512 x float]* @code_block2, i64 0, i64 %indvar
  %8 = load float* %scevgep, align 4
  %9 = fmul float %8, -4.000000e+00
  %10 = fmul float %5, %9
  store float %10, float* %scevgep7, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond5 = icmp eq i64 %indvar.next, %tmp6
  br i1 %exitcond5, label %._crit_edge, label %7

._crit_edge:                                      ; preds = %7
  br i1 %2, label %send_init_apriori2.exit, label %bb.nph.i.preheader

bb.nph.i.preheader:                               ; preds = %._crit_edge
  br label %bb.nph.i

bb.nph.i:                                         ; preds = %bb.nph.i, %bb.nph.i.preheader
  %indvar.i = phi i64 [ %tmp, %bb.nph.i ], [ 0, %bb.nph.i.preheader ]
  %scevgep.i = getelementptr [512 x float]* @aPriori2, i64 0, i64 %indvar.i
  %tmp2 = add i64 %indvar.i, 1
  %tmp2.i = trunc i64 %tmp2 to i32
  %tmp = add i64 %indvar.i, 1
  %11 = load float* %scevgep.i, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([13 x i8]* @.str1, i64 0, i64 0), float %11) nounwind
  %12 = load i16* @ncols, align 2
  %13 = zext i16 %12 to i32
  %14 = icmp slt i32 %tmp2.i, %13
  br i1 %14, label %bb.nph.i, label %send_init_apriori2.exit.loopexit

send_init_apriori2.exit.loopexit:                 ; preds = %bb.nph.i
  br label %send_init_apriori2.exit

send_init_apriori2.exit:                          ; preds = %send_init_apriori2.exit.loopexit, %._crit_edge, %0
  ret void
}

define void @initialize_aPriori1() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %send_init_apriori1.exit, label %bb.nph

bb.nph:                                           ; preds = %0
  %3 = load float* @ebbyNo, align 4
  %4 = load float* @rate, align 4
  %5 = fmul float %4, %3
  %tmp3 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op8 = add i64 %6, 1
  %tmp6 = select i1 %tmp3, i64 %.op8, i64 1
  br label %7

; <label>:7                                       ; preds = %7, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %7 ]
  %scevgep7 = getelementptr [512 x float]* @aPriori1, i64 0, i64 %indvar
  %scevgep = getelementptr [512 x float]* @code_block1, i64 0, i64 %indvar
  %8 = load float* %scevgep, align 4
  %9 = fmul float %8, -4.000000e+00
  %10 = fmul float %5, %9
  store float %10, float* %scevgep7, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond5 = icmp eq i64 %indvar.next, %tmp6
  br i1 %exitcond5, label %._crit_edge, label %7

._crit_edge:                                      ; preds = %7
  br i1 %2, label %send_init_apriori1.exit, label %bb.nph.i.preheader

bb.nph.i.preheader:                               ; preds = %._crit_edge
  br label %bb.nph.i

bb.nph.i:                                         ; preds = %bb.nph.i, %bb.nph.i.preheader
  %indvar.i = phi i64 [ %tmp, %bb.nph.i ], [ 0, %bb.nph.i.preheader ]
  %scevgep.i = getelementptr [512 x float]* @aPriori1, i64 0, i64 %indvar.i
  %tmp2 = add i64 %indvar.i, 1
  %tmp2.i = trunc i64 %tmp2 to i32
  %tmp = add i64 %indvar.i, 1
  %11 = load float* %scevgep.i, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), float %11) nounwind
  %12 = load i16* @ncols, align 2
  %13 = zext i16 %12 to i32
  %14 = icmp slt i32 %tmp2.i, %13
  br i1 %14, label %bb.nph.i, label %send_init_apriori1.exit.loopexit

send_init_apriori1.exit.loopexit:                 ; preds = %bb.nph.i
  br label %send_init_apriori1.exit

send_init_apriori1.exit:                          ; preds = %send_init_apriori1.exit.loopexit, %._crit_edge, %0
  ret void
}

define void @initializeMessage11() nounwind {
  %1 = load i16* @ncol_ind_11, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op7 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op7, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %tmp2 = add i64 %indvar, 3
  %scevgep6 = getelementptr [512 x i16]* @mem11, i64 0, i64 %tmp2
  %scevgep = getelementptr [512 x float]* @message11, i64 0, i64 %indvar
  %5 = load i16* %scevgep6, align 2
  %6 = add i16 %5, -1
  %7 = zext i16 %6 to i64
  %8 = getelementptr inbounds [512 x float]* @aPriori1, i64 0, i64 %7
  %9 = load float* %8, align 4
  store float %9, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeMessage12() nounwind {
  %1 = load i16* @ncol_ind_12, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op7 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op7, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %tmp2 = add i64 %indvar, 3
  %scevgep6 = getelementptr [512 x i16]* @mem12, i64 0, i64 %tmp2
  %scevgep = getelementptr [512 x float]* @message12, i64 0, i64 %indvar
  %5 = load i16* %scevgep6, align 2
  %6 = add i16 %5, -1
  %7 = zext i16 %6 to i64
  %8 = getelementptr inbounds [512 x float]* @aPriori2, i64 0, i64 %7
  %9 = load float* %8, align 4
  store float %9, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeMessage21() nounwind {
  %1 = load i16* @ncol_ind_21, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op7 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op7, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %tmp2 = add i64 %indvar, 3
  %scevgep6 = getelementptr [512 x i16]* @mem21, i64 0, i64 %tmp2
  %scevgep = getelementptr [512 x float]* @message21, i64 0, i64 %indvar
  %5 = load i16* %scevgep6, align 2
  %6 = add i16 %5, -1
  %7 = zext i16 %6 to i64
  %8 = getelementptr inbounds [512 x float]* @aPriori1, i64 0, i64 %7
  %9 = load float* %8, align 4
  store float %9, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeMessage22() nounwind {
  %1 = load i16* @ncol_ind_22, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op7 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op7, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %tmp2 = add i64 %indvar, 3
  %scevgep6 = getelementptr [512 x i16]* @mem22, i64 0, i64 %tmp2
  %scevgep = getelementptr [512 x float]* @message22, i64 0, i64 %indvar
  %5 = load i16* %scevgep6, align 2
  %6 = add i16 %5, -1
  %7 = zext i16 %6 to i64
  %8 = getelementptr inbounds [512 x float]* @aPriori2, i64 0, i64 %7
  %9 = load float* %8, align 4
  store float %9, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initialize_aPosteriori1() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op6 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op6, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep5 = getelementptr [512 x float]* @aPosteriori1, i64 0, i64 %indvar
  %scevgep = getelementptr [512 x float]* @aPriori1, i64 0, i64 %indvar
  %5 = load float* %scevgep, align 4
  store float %5, float* %scevgep5, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initialize_aPosteriori2() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op6 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op6, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep5 = getelementptr [512 x float]* @aPosteriori2, i64 0, i64 %indvar
  %scevgep = getelementptr [512 x float]* @aPriori2, i64 0, i64 %indvar
  %5 = load float* %scevgep, align 4
  store float %5, float* %scevgep5, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeExtrinsicInfo11() nounwind {
  %1 = load i16* @ncol_ind_11, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op5 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op5, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep = getelementptr [512 x float]* @ext_info11, i64 0, i64 %indvar
  store float 0.000000e+00, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeExtrinsicInfo12() nounwind {
  %1 = load i16* @ncol_ind_12, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op5 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op5, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep = getelementptr [512 x float]* @ext_info12, i64 0, i64 %indvar
  store float 0.000000e+00, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeExtrinsicInfo21() nounwind {
  %1 = load i16* @ncol_ind_21, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op5 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op5, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep = getelementptr [512 x float]* @ext_info21, i64 0, i64 %indvar
  store float 0.000000e+00, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeExtrinsicInfo22() nounwind {
  %1 = load i16* @ncol_ind_22, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op5 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op5, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep = getelementptr [512 x float]* @ext_info22, i64 0, i64 %indvar
  store float 0.000000e+00, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeTransInfo11_12() nounwind {
  %1 = load i16* @ncol_ind_11, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op5 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op5, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep = getelementptr [512 x float]* @trans_info11_12, i64 0, i64 %indvar
  store float 0.000000e+00, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeTransInfo12_11() nounwind {
  %1 = load i16* @ncol_ind_12, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op5 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op5, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep = getelementptr [512 x float]* @trans_info12_11, i64 0, i64 %indvar
  store float 0.000000e+00, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeTransInfo21_22() nounwind {
  %1 = load i16* @ncol_ind_21, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op5 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op5, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep = getelementptr [512 x float]* @trans_info21_22, i64 0, i64 %indvar
  store float 0.000000e+00, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeTransInfo22_21() nounwind {
  %1 = load i16* @ncol_ind_22, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op5 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op5, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep = getelementptr [512 x float]* @trans_info22_21, i64 0, i64 %indvar
  store float 0.000000e+00, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @checkNodeComputeEngine11() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge12, label %bb.nph11

bb.nph11:                                         ; preds = %0
  %3 = load i16* @ncol_ind_11, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg2 = add i16 %3, 1
  %tmp17 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op34 = add i64 %6, 1
  %tmp20 = select i1 %tmp17, i64 %.op34, i64 1
  %tmp = zext i16 %3 to i64
  %tmp4 = add i64 %tmp, 4
  %tmp7 = add i64 %tmp, 3
  br label %7

; <label>:7                                       ; preds = %.loopexit, %bb.nph11
  %indvar = phi i64 [ 0, %bb.nph11 ], [ %indvar.next, %.loopexit ]
  %tmp5 = add i64 %tmp4, %indvar
  %scevgep29 = getelementptr [512 x i16]* @mem11, i64 0, i64 %tmp5
  %tmp8 = add i64 %tmp7, %indvar
  %scevgep26 = getelementptr [512 x i16]* @mem11, i64 0, i64 %tmp8
  %scevgep = getelementptr [512 x float]* @trans_info11_12, i64 0, i64 %indvar
  %tmp22 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp22, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep26, align 2
  %11 = sub i16 %.neg2, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep26, align 2
  %14 = load i16* %scevgep29, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp ugt i16 %range.0, 1
  br i1 %18, label %bb.nph9, label %70

bb.nph9:                                          ; preds = %16
  %tmp15 = add i16 %17, -1
  br label %bb.nph

bb.nph:                                           ; preds = %68, %bb.nph9
  %19 = phi i16 [ 0, %bb.nph9 ], [ %69, %68 ]
  %tmp16 = add i16 %tmp15, %19
  br label %20

; <label>:20                                      ; preds = %38, %bb.nph
  %21 = phi i16 [ 0, %bb.nph ], [ %39, %38 ]
  %val.25 = phi float [ 0.000000e+00, %bb.nph ], [ %val.1, %38 ]
  %flag.14 = phi i8 [ 0, %bb.nph ], [ %flag.0, %38 ]
  %exor.23 = phi i8 [ 0, %bb.nph ], [ %exor.1, %38 ]
  %tmp13 = add i16 %tmp15, %21
  %22 = zext i16 %tmp13 to i64
  %23 = getelementptr inbounds [512 x float]* @message11, i64 0, i64 %22
  %24 = load float* %23, align 4
  %25 = fpext float %24 to double
  %26 = fcmp olt double %25, 0.000000e+00
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %20
  %28 = fsub float -0.000000e+00, %24
  br label %29

; <label>:29                                      ; preds = %27, %20
  %temp1.0 = phi float [ %28, %27 ], [ %24, %20 ]
  %30 = icmp eq i16 %21, %19
  br i1 %30, label %38, label %31

; <label>:31                                      ; preds = %29
  %32 = fcmp ult double %25, 0.000000e+00
  %33 = zext i1 %32 to i8
  %exor.0 = xor i8 %33, %exor.23
  %34 = icmp eq i8 %flag.14, 0
  br i1 %34, label %38, label %35

; <label>:35                                      ; preds = %31
  %36 = fcmp olt float %temp1.0, %val.25
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %35
  br label %38

; <label>:38                                      ; preds = %37, %35, %31, %29
  %exor.1 = phi i8 [ %exor.23, %29 ], [ %exor.0, %31 ], [ %exor.0, %37 ], [ %exor.0, %35 ]
  %flag.0 = phi i8 [ %flag.14, %29 ], [ 1, %31 ], [ 1, %37 ], [ 1, %35 ]
  %val.1 = phi float [ %val.25, %29 ], [ %temp1.0, %31 ], [ %temp1.0, %37 ], [ %val.25, %35 ]
  %39 = add i16 %21, 1
  %exitcond1 = icmp eq i16 %39, %range.0
  br i1 %exitcond1, label %._crit_edge, label %20

._crit_edge:                                      ; preds = %38
  %val.1.lcssa = phi float [ %val.1, %38 ]
  %exor.1.lcssa = phi i8 [ %exor.1, %38 ]
  %40 = icmp eq i8 %exor.1.lcssa, 0
  %sign.0 = select i1 %40, float 1.000000e+00, float -1.000000e+00
  %41 = fmul float %val.1.lcssa, %sign.0
  %42 = zext i16 %tmp16 to i64
  %43 = getelementptr inbounds [512 x float]* @ext_info11, i64 0, i64 %42
  store float %41, float* %43, align 4
  %44 = icmp eq i16 %19, 0
  br i1 %44, label %45, label %68

; <label>:45                                      ; preds = %._crit_edge
  %46 = fcmp ult float %41, 0.000000e+00
  %47 = getelementptr inbounds [512 x float]* @message11, i64 0, i64 %42
  %48 = load float* %47, align 4
  br i1 %46, label %52, label %49

; <label>:49                                      ; preds = %45
  %50 = fcmp ult float %48, 0.000000e+00
  br i1 %50, label %51, label %55

; <label>:51                                      ; preds = %49
  br label %55

; <label>:52                                      ; preds = %45
  %53 = fcmp olt float %48, 0.000000e+00
  br i1 %53, label %55, label %54

; <label>:54                                      ; preds = %52
  br label %55

; <label>:55                                      ; preds = %54, %52, %51, %49
  %sign1.0 = phi float [ -1.000000e+00, %51 ], [ -1.000000e+00, %54 ], [ 1.000000e+00, %49 ], [ 1.000000e+00, %52 ]
  %56 = fpext float %48 to double
  %57 = fcmp olt double %56, 0.000000e+00
  br i1 %57, label %58, label %60

; <label>:58                                      ; preds = %55
  %59 = fsub float -0.000000e+00, %48
  br label %60

; <label>:60                                      ; preds = %58, %55
  %mod_self_info.0 = phi float [ %59, %58 ], [ %48, %55 ]
  %61 = fpext float %41 to double
  %62 = fcmp olt double %61, 0.000000e+00
  br i1 %62, label %63, label %65

; <label>:63                                      ; preds = %60
  %64 = fsub float -0.000000e+00, %41
  br label %65

; <label>:65                                      ; preds = %63, %60
  %mod_ext_info.0 = phi float [ %64, %63 ], [ %41, %60 ]
  %66 = fcmp ogt float %mod_self_info.0, %mod_ext_info.0
  %magnitude.0 = select i1 %66, float %mod_ext_info.0, float %mod_self_info.0
  %67 = fmul float %sign1.0, %magnitude.0
  store float %67, float* %scevgep, align 4
  br label %68

; <label>:68                                      ; preds = %65, %._crit_edge
  %69 = add i16 %19, 1
  %exitcond = icmp eq i16 %69, %range.0
  br i1 %exitcond, label %.loopexit.loopexit, label %bb.nph

; <label>:70                                      ; preds = %16
  %71 = icmp eq i16 %range.0, 1
  br i1 %71, label %72, label %.loopexit

; <label>:72                                      ; preds = %70
  %73 = zext i16 %17 to i64
  %74 = add i64 %73, -1
  %75 = getelementptr inbounds [512 x float]* @message11, i64 0, i64 %74
  %76 = load float* %75, align 4
  store float %76, float* %scevgep, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %68
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %72, %70
  %indvar.next = add i64 %indvar, 1
  %exitcond3 = icmp eq i64 %indvar.next, %tmp20
  br i1 %exitcond3, label %._crit_edge12.loopexit, label %7

._crit_edge12.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %0
  ret void
}

define void @checkNodeComputeEngine12() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge12, label %bb.nph11

bb.nph11:                                         ; preds = %0
  %3 = load i16* @ncol_ind_12, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg2 = add i16 %3, 1
  %tmp17 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op34 = add i64 %6, 1
  %tmp20 = select i1 %tmp17, i64 %.op34, i64 1
  %tmp = zext i16 %3 to i64
  %tmp4 = add i64 %tmp, 4
  %tmp7 = add i64 %tmp, 3
  br label %7

; <label>:7                                       ; preds = %.loopexit, %bb.nph11
  %indvar = phi i64 [ 0, %bb.nph11 ], [ %indvar.next, %.loopexit ]
  %tmp5 = add i64 %tmp4, %indvar
  %scevgep29 = getelementptr [512 x i16]* @mem12, i64 0, i64 %tmp5
  %tmp8 = add i64 %tmp7, %indvar
  %scevgep26 = getelementptr [512 x i16]* @mem12, i64 0, i64 %tmp8
  %scevgep = getelementptr [512 x float]* @trans_info12_11, i64 0, i64 %indvar
  %tmp22 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp22, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep26, align 2
  %11 = sub i16 %.neg2, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep26, align 2
  %14 = load i16* %scevgep29, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp ugt i16 %range.0, 1
  br i1 %18, label %bb.nph9, label %70

bb.nph9:                                          ; preds = %16
  %tmp15 = add i16 %17, -1
  br label %bb.nph

bb.nph:                                           ; preds = %68, %bb.nph9
  %19 = phi i16 [ 0, %bb.nph9 ], [ %69, %68 ]
  %tmp16 = add i16 %tmp15, %19
  br label %20

; <label>:20                                      ; preds = %38, %bb.nph
  %21 = phi i16 [ 0, %bb.nph ], [ %39, %38 ]
  %val.25 = phi float [ 0.000000e+00, %bb.nph ], [ %val.1, %38 ]
  %flag.14 = phi i8 [ 0, %bb.nph ], [ %flag.0, %38 ]
  %exor.23 = phi i8 [ 0, %bb.nph ], [ %exor.1, %38 ]
  %tmp13 = add i16 %tmp15, %21
  %22 = zext i16 %tmp13 to i64
  %23 = getelementptr inbounds [512 x float]* @message12, i64 0, i64 %22
  %24 = load float* %23, align 4
  %25 = fpext float %24 to double
  %26 = fcmp olt double %25, 0.000000e+00
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %20
  %28 = fsub float -0.000000e+00, %24
  br label %29

; <label>:29                                      ; preds = %27, %20
  %temp1.0 = phi float [ %28, %27 ], [ %24, %20 ]
  %30 = icmp eq i16 %21, %19
  br i1 %30, label %38, label %31

; <label>:31                                      ; preds = %29
  %32 = fcmp ult double %25, 0.000000e+00
  %33 = zext i1 %32 to i8
  %exor.0 = xor i8 %33, %exor.23
  %34 = icmp eq i8 %flag.14, 0
  br i1 %34, label %38, label %35

; <label>:35                                      ; preds = %31
  %36 = fcmp olt float %temp1.0, %val.25
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %35
  br label %38

; <label>:38                                      ; preds = %37, %35, %31, %29
  %exor.1 = phi i8 [ %exor.23, %29 ], [ %exor.0, %31 ], [ %exor.0, %37 ], [ %exor.0, %35 ]
  %flag.0 = phi i8 [ %flag.14, %29 ], [ 1, %31 ], [ 1, %37 ], [ 1, %35 ]
  %val.1 = phi float [ %val.25, %29 ], [ %temp1.0, %31 ], [ %temp1.0, %37 ], [ %val.25, %35 ]
  %39 = add i16 %21, 1
  %exitcond1 = icmp eq i16 %39, %range.0
  br i1 %exitcond1, label %._crit_edge, label %20

._crit_edge:                                      ; preds = %38
  %val.1.lcssa = phi float [ %val.1, %38 ]
  %exor.1.lcssa = phi i8 [ %exor.1, %38 ]
  %40 = icmp eq i8 %exor.1.lcssa, 0
  %sign.0 = select i1 %40, float 1.000000e+00, float -1.000000e+00
  %41 = fmul float %val.1.lcssa, %sign.0
  %42 = zext i16 %tmp16 to i64
  %43 = getelementptr inbounds [512 x float]* @ext_info12, i64 0, i64 %42
  store float %41, float* %43, align 4
  %44 = icmp eq i16 %19, 0
  br i1 %44, label %45, label %68

; <label>:45                                      ; preds = %._crit_edge
  %46 = fcmp ult float %41, 0.000000e+00
  %47 = getelementptr inbounds [512 x float]* @message12, i64 0, i64 %42
  %48 = load float* %47, align 4
  br i1 %46, label %52, label %49

; <label>:49                                      ; preds = %45
  %50 = fcmp ult float %48, 0.000000e+00
  br i1 %50, label %51, label %55

; <label>:51                                      ; preds = %49
  br label %55

; <label>:52                                      ; preds = %45
  %53 = fcmp olt float %48, 0.000000e+00
  br i1 %53, label %55, label %54

; <label>:54                                      ; preds = %52
  br label %55

; <label>:55                                      ; preds = %54, %52, %51, %49
  %sign1.0 = phi float [ -1.000000e+00, %51 ], [ -1.000000e+00, %54 ], [ 1.000000e+00, %49 ], [ 1.000000e+00, %52 ]
  %56 = fpext float %48 to double
  %57 = fcmp olt double %56, 0.000000e+00
  br i1 %57, label %58, label %60

; <label>:58                                      ; preds = %55
  %59 = fsub float -0.000000e+00, %48
  br label %60

; <label>:60                                      ; preds = %58, %55
  %mod_self_info.0 = phi float [ %59, %58 ], [ %48, %55 ]
  %61 = fpext float %41 to double
  %62 = fcmp olt double %61, 0.000000e+00
  br i1 %62, label %63, label %65

; <label>:63                                      ; preds = %60
  %64 = fsub float -0.000000e+00, %41
  br label %65

; <label>:65                                      ; preds = %63, %60
  %mod_ext_info.0 = phi float [ %64, %63 ], [ %41, %60 ]
  %66 = fcmp ogt float %mod_self_info.0, %mod_ext_info.0
  %magnitude.0 = select i1 %66, float %mod_ext_info.0, float %mod_self_info.0
  %67 = fmul float %sign1.0, %magnitude.0
  store float %67, float* %scevgep, align 4
  br label %68

; <label>:68                                      ; preds = %65, %._crit_edge
  %69 = add i16 %19, 1
  %exitcond = icmp eq i16 %69, %range.0
  br i1 %exitcond, label %.loopexit.loopexit, label %bb.nph

; <label>:70                                      ; preds = %16
  %71 = icmp eq i16 %range.0, 1
  br i1 %71, label %72, label %.loopexit

; <label>:72                                      ; preds = %70
  %73 = zext i16 %17 to i64
  %74 = add i64 %73, -1
  %75 = getelementptr inbounds [512 x float]* @message12, i64 0, i64 %74
  %76 = load float* %75, align 4
  store float %76, float* %scevgep, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %68
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %72, %70
  %indvar.next = add i64 %indvar, 1
  %exitcond3 = icmp eq i64 %indvar.next, %tmp20
  br i1 %exitcond3, label %._crit_edge12.loopexit, label %7

._crit_edge12.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %0
  ret void
}

define void @checkNodeComputeEngine21() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge12, label %bb.nph11

bb.nph11:                                         ; preds = %0
  %3 = load i16* @ncol_ind_21, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg2 = add i16 %3, 1
  %tmp17 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op34 = add i64 %6, 1
  %tmp20 = select i1 %tmp17, i64 %.op34, i64 1
  %tmp = zext i16 %3 to i64
  %tmp4 = add i64 %tmp, 4
  %tmp7 = add i64 %tmp, 3
  br label %7

; <label>:7                                       ; preds = %.loopexit, %bb.nph11
  %indvar = phi i64 [ 0, %bb.nph11 ], [ %indvar.next, %.loopexit ]
  %tmp5 = add i64 %tmp4, %indvar
  %scevgep29 = getelementptr [512 x i16]* @mem21, i64 0, i64 %tmp5
  %tmp8 = add i64 %tmp7, %indvar
  %scevgep26 = getelementptr [512 x i16]* @mem21, i64 0, i64 %tmp8
  %scevgep = getelementptr [512 x float]* @trans_info21_22, i64 0, i64 %indvar
  %tmp22 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp22, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep26, align 2
  %11 = sub i16 %.neg2, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep26, align 2
  %14 = load i16* %scevgep29, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp ugt i16 %range.0, 1
  br i1 %18, label %bb.nph9, label %70

bb.nph9:                                          ; preds = %16
  %tmp15 = add i16 %17, -1
  br label %bb.nph

bb.nph:                                           ; preds = %68, %bb.nph9
  %19 = phi i16 [ 0, %bb.nph9 ], [ %69, %68 ]
  %tmp16 = add i16 %tmp15, %19
  br label %20

; <label>:20                                      ; preds = %38, %bb.nph
  %21 = phi i16 [ 0, %bb.nph ], [ %39, %38 ]
  %val.25 = phi float [ 0.000000e+00, %bb.nph ], [ %val.1, %38 ]
  %flag.14 = phi i8 [ 0, %bb.nph ], [ %flag.0, %38 ]
  %exor.23 = phi i8 [ 0, %bb.nph ], [ %exor.1, %38 ]
  %tmp13 = add i16 %tmp15, %21
  %22 = zext i16 %tmp13 to i64
  %23 = getelementptr inbounds [512 x float]* @message21, i64 0, i64 %22
  %24 = load float* %23, align 4
  %25 = fpext float %24 to double
  %26 = fcmp olt double %25, 0.000000e+00
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %20
  %28 = fsub float -0.000000e+00, %24
  br label %29

; <label>:29                                      ; preds = %27, %20
  %temp1.0 = phi float [ %28, %27 ], [ %24, %20 ]
  %30 = icmp eq i16 %21, %19
  br i1 %30, label %38, label %31

; <label>:31                                      ; preds = %29
  %32 = fcmp ult double %25, 0.000000e+00
  %33 = zext i1 %32 to i8
  %exor.0 = xor i8 %33, %exor.23
  %34 = icmp eq i8 %flag.14, 0
  br i1 %34, label %38, label %35

; <label>:35                                      ; preds = %31
  %36 = fcmp olt float %temp1.0, %val.25
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %35
  br label %38

; <label>:38                                      ; preds = %37, %35, %31, %29
  %exor.1 = phi i8 [ %exor.23, %29 ], [ %exor.0, %31 ], [ %exor.0, %37 ], [ %exor.0, %35 ]
  %flag.0 = phi i8 [ %flag.14, %29 ], [ 1, %31 ], [ 1, %37 ], [ 1, %35 ]
  %val.1 = phi float [ %val.25, %29 ], [ %temp1.0, %31 ], [ %temp1.0, %37 ], [ %val.25, %35 ]
  %39 = add i16 %21, 1
  %exitcond1 = icmp eq i16 %39, %range.0
  br i1 %exitcond1, label %._crit_edge, label %20

._crit_edge:                                      ; preds = %38
  %val.1.lcssa = phi float [ %val.1, %38 ]
  %exor.1.lcssa = phi i8 [ %exor.1, %38 ]
  %40 = icmp eq i8 %exor.1.lcssa, 0
  %sign.0 = select i1 %40, float 1.000000e+00, float -1.000000e+00
  %41 = fmul float %val.1.lcssa, %sign.0
  %42 = zext i16 %tmp16 to i64
  %43 = getelementptr inbounds [512 x float]* @ext_info21, i64 0, i64 %42
  store float %41, float* %43, align 4
  %44 = icmp eq i16 %19, 0
  br i1 %44, label %45, label %68

; <label>:45                                      ; preds = %._crit_edge
  %46 = fcmp ult float %41, 0.000000e+00
  %47 = getelementptr inbounds [512 x float]* @message21, i64 0, i64 %42
  %48 = load float* %47, align 4
  br i1 %46, label %52, label %49

; <label>:49                                      ; preds = %45
  %50 = fcmp ult float %48, 0.000000e+00
  br i1 %50, label %51, label %55

; <label>:51                                      ; preds = %49
  br label %55

; <label>:52                                      ; preds = %45
  %53 = fcmp olt float %48, 0.000000e+00
  br i1 %53, label %55, label %54

; <label>:54                                      ; preds = %52
  br label %55

; <label>:55                                      ; preds = %54, %52, %51, %49
  %sign1.0 = phi float [ -1.000000e+00, %51 ], [ -1.000000e+00, %54 ], [ 1.000000e+00, %49 ], [ 1.000000e+00, %52 ]
  %56 = fpext float %48 to double
  %57 = fcmp olt double %56, 0.000000e+00
  br i1 %57, label %58, label %60

; <label>:58                                      ; preds = %55
  %59 = fsub float -0.000000e+00, %48
  br label %60

; <label>:60                                      ; preds = %58, %55
  %mod_self_info.0 = phi float [ %59, %58 ], [ %48, %55 ]
  %61 = fpext float %41 to double
  %62 = fcmp olt double %61, 0.000000e+00
  br i1 %62, label %63, label %65

; <label>:63                                      ; preds = %60
  %64 = fsub float -0.000000e+00, %41
  br label %65

; <label>:65                                      ; preds = %63, %60
  %mod_ext_info.0 = phi float [ %64, %63 ], [ %41, %60 ]
  %66 = fcmp ogt float %mod_self_info.0, %mod_ext_info.0
  %magnitude.0 = select i1 %66, float %mod_ext_info.0, float %mod_self_info.0
  %67 = fmul float %sign1.0, %magnitude.0
  store float %67, float* %scevgep, align 4
  br label %68

; <label>:68                                      ; preds = %65, %._crit_edge
  %69 = add i16 %19, 1
  %exitcond = icmp eq i16 %69, %range.0
  br i1 %exitcond, label %.loopexit.loopexit, label %bb.nph

; <label>:70                                      ; preds = %16
  %71 = icmp eq i16 %range.0, 1
  br i1 %71, label %72, label %.loopexit

; <label>:72                                      ; preds = %70
  %73 = zext i16 %17 to i64
  %74 = add i64 %73, -1
  %75 = getelementptr inbounds [512 x float]* @message21, i64 0, i64 %74
  %76 = load float* %75, align 4
  store float %76, float* %scevgep, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %68
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %72, %70
  %indvar.next = add i64 %indvar, 1
  %exitcond3 = icmp eq i64 %indvar.next, %tmp20
  br i1 %exitcond3, label %._crit_edge12.loopexit, label %7

._crit_edge12.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %0
  ret void
}

define void @checkNodeComputeEngine22() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge12, label %bb.nph11

bb.nph11:                                         ; preds = %0
  %3 = load i16* @ncol_ind_22, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg2 = add i16 %3, 1
  %tmp17 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op34 = add i64 %6, 1
  %tmp20 = select i1 %tmp17, i64 %.op34, i64 1
  %tmp = zext i16 %3 to i64
  %tmp4 = add i64 %tmp, 4
  %tmp7 = add i64 %tmp, 3
  br label %7

; <label>:7                                       ; preds = %.loopexit, %bb.nph11
  %indvar = phi i64 [ 0, %bb.nph11 ], [ %indvar.next, %.loopexit ]
  %tmp5 = add i64 %tmp4, %indvar
  %scevgep29 = getelementptr [512 x i16]* @mem22, i64 0, i64 %tmp5
  %tmp8 = add i64 %tmp7, %indvar
  %scevgep26 = getelementptr [512 x i16]* @mem22, i64 0, i64 %tmp8
  %scevgep = getelementptr [512 x float]* @trans_info22_21, i64 0, i64 %indvar
  %tmp22 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp22, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep26, align 2
  %11 = sub i16 %.neg2, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep26, align 2
  %14 = load i16* %scevgep29, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp ugt i16 %range.0, 1
  br i1 %18, label %bb.nph9, label %70

bb.nph9:                                          ; preds = %16
  %tmp15 = add i16 %17, -1
  br label %bb.nph

bb.nph:                                           ; preds = %68, %bb.nph9
  %19 = phi i16 [ 0, %bb.nph9 ], [ %69, %68 ]
  %tmp16 = add i16 %tmp15, %19
  br label %20

; <label>:20                                      ; preds = %38, %bb.nph
  %21 = phi i16 [ 0, %bb.nph ], [ %39, %38 ]
  %val.25 = phi float [ 0.000000e+00, %bb.nph ], [ %val.1, %38 ]
  %flag.14 = phi i16 [ 0, %bb.nph ], [ %flag.0, %38 ]
  %exor.23 = phi i16 [ 0, %bb.nph ], [ %exor.1, %38 ]
  %tmp13 = add i16 %tmp15, %21
  %22 = zext i16 %tmp13 to i64
  %23 = getelementptr inbounds [512 x float]* @message22, i64 0, i64 %22
  %24 = load float* %23, align 4
  %25 = fpext float %24 to double
  %26 = fcmp olt double %25, 0.000000e+00
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %20
  %28 = fsub float -0.000000e+00, %24
  br label %29

; <label>:29                                      ; preds = %27, %20
  %temp1.0 = phi float [ %28, %27 ], [ %24, %20 ]
  %30 = icmp eq i16 %21, %19
  br i1 %30, label %38, label %31

; <label>:31                                      ; preds = %29
  %32 = fcmp ult double %25, 0.000000e+00
  %33 = zext i1 %32 to i16
  %exor.0 = xor i16 %33, %exor.23
  %34 = icmp eq i16 %flag.14, 0
  br i1 %34, label %38, label %35

; <label>:35                                      ; preds = %31
  %36 = fcmp olt float %temp1.0, %val.25
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %35
  br label %38

; <label>:38                                      ; preds = %37, %35, %31, %29
  %exor.1 = phi i16 [ %exor.23, %29 ], [ %exor.0, %31 ], [ %exor.0, %37 ], [ %exor.0, %35 ]
  %flag.0 = phi i16 [ %flag.14, %29 ], [ 1, %31 ], [ 1, %37 ], [ 1, %35 ]
  %val.1 = phi float [ %val.25, %29 ], [ %temp1.0, %31 ], [ %temp1.0, %37 ], [ %val.25, %35 ]
  %39 = add i16 %21, 1
  %exitcond1 = icmp eq i16 %39, %range.0
  br i1 %exitcond1, label %._crit_edge, label %20

._crit_edge:                                      ; preds = %38
  %val.1.lcssa = phi float [ %val.1, %38 ]
  %exor.1.lcssa = phi i16 [ %exor.1, %38 ]
  %40 = icmp eq i16 %exor.1.lcssa, 0
  %sign.0 = select i1 %40, float 1.000000e+00, float -1.000000e+00
  %41 = fmul float %val.1.lcssa, %sign.0
  %42 = zext i16 %tmp16 to i64
  %43 = getelementptr inbounds [512 x float]* @ext_info22, i64 0, i64 %42
  store float %41, float* %43, align 4
  %44 = icmp eq i16 %19, 0
  br i1 %44, label %45, label %68

; <label>:45                                      ; preds = %._crit_edge
  %46 = fcmp ult float %41, 0.000000e+00
  %47 = getelementptr inbounds [512 x float]* @message22, i64 0, i64 %42
  %48 = load float* %47, align 4
  br i1 %46, label %52, label %49

; <label>:49                                      ; preds = %45
  %50 = fcmp ult float %48, 0.000000e+00
  br i1 %50, label %51, label %55

; <label>:51                                      ; preds = %49
  br label %55

; <label>:52                                      ; preds = %45
  %53 = fcmp olt float %48, 0.000000e+00
  br i1 %53, label %55, label %54

; <label>:54                                      ; preds = %52
  br label %55

; <label>:55                                      ; preds = %54, %52, %51, %49
  %sign1.0 = phi float [ -1.000000e+00, %51 ], [ -1.000000e+00, %54 ], [ 1.000000e+00, %49 ], [ 1.000000e+00, %52 ]
  %56 = fpext float %48 to double
  %57 = fcmp olt double %56, 0.000000e+00
  br i1 %57, label %58, label %60

; <label>:58                                      ; preds = %55
  %59 = fsub float -0.000000e+00, %48
  br label %60

; <label>:60                                      ; preds = %58, %55
  %mod_self_info.0 = phi float [ %59, %58 ], [ %48, %55 ]
  %61 = fpext float %41 to double
  %62 = fcmp olt double %61, 0.000000e+00
  br i1 %62, label %63, label %65

; <label>:63                                      ; preds = %60
  %64 = fsub float -0.000000e+00, %41
  br label %65

; <label>:65                                      ; preds = %63, %60
  %mod_ext_info.0 = phi float [ %64, %63 ], [ %41, %60 ]
  %66 = fcmp ogt float %mod_self_info.0, %mod_ext_info.0
  %magnitude.0 = select i1 %66, float %mod_ext_info.0, float %mod_self_info.0
  %67 = fmul float %sign1.0, %magnitude.0
  store float %67, float* %scevgep, align 4
  br label %68

; <label>:68                                      ; preds = %65, %._crit_edge
  %69 = add i16 %19, 1
  %exitcond = icmp eq i16 %69, %range.0
  br i1 %exitcond, label %.loopexit.loopexit, label %bb.nph

; <label>:70                                      ; preds = %16
  %71 = icmp eq i16 %range.0, 1
  br i1 %71, label %72, label %.loopexit

; <label>:72                                      ; preds = %70
  %73 = zext i16 %17 to i64
  %74 = add i64 %73, -1
  %75 = getelementptr inbounds [512 x float]* @message22, i64 0, i64 %74
  %76 = load float* %75, align 4
  store float %76, float* %scevgep, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %68
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %72, %70
  %indvar.next = add i64 %indvar, 1
  %exitcond3 = icmp eq i64 %indvar.next, %tmp20
  br i1 %exitcond3, label %._crit_edge12.loopexit, label %7

._crit_edge12.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %0
  ret void
}

define void @transverseCorrection11() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph4

bb.nph4:                                          ; preds = %0
  %3 = load i16* @ncol_ind_11, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg1 = add i16 %3, 1
  %tmp6 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op23 = add i64 %6, 1
  %tmp9 = select i1 %tmp6, i64 %.op23, i64 1
  %tmp3 = zext i16 %3 to i64
  %tmp4 = add i64 %tmp3, 4
  %tmp10 = add i64 %tmp3, 3
  br label %7

; <label>:7                                       ; preds = %.loopexit, %bb.nph4
  %indvar = phi i64 [ 0, %bb.nph4 ], [ %indvar.next, %.loopexit ]
  %tmp7 = add i64 %tmp4, %indvar
  %scevgep18 = getelementptr [512 x i16]* @mem11, i64 0, i64 %tmp7
  %tmp15 = add i64 %tmp10, %indvar
  %scevgep15 = getelementptr [512 x i16]* @mem11, i64 0, i64 %tmp15
  %scevgep = getelementptr [512 x float]* @trans_info12_11, i64 0, i64 %indvar
  %tmp11 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp11, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep15, align 2
  %11 = sub i16 %.neg1, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep15, align 2
  %14 = load i16* %scevgep18, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp ugt i16 %range.0, 1
  %19 = load float* %scevgep, align 4
  br i1 %18, label %20, label %45

; <label>:20                                      ; preds = %16
  %21 = fcmp une float %19, 0.000000e+00
  br i1 %21, label %bb.nph, label %.loopexit

bb.nph:                                           ; preds = %20
  %22 = fcmp olt float %19, 0.000000e+00
  %23 = fpext float %19 to double
  %24 = fcmp olt double %23, 0.000000e+00
  %25 = fsub float -0.000000e+00, %19
  %26 = fcmp ult float %19, 0.000000e+00
  %tmp = add i16 %17, -1
  br label %27

; <label>:27                                      ; preds = %41, %bb.nph
  %col.02 = phi i16 [ 0, %bb.nph ], [ %44, %41 ]
  %tmp5 = add i16 %tmp, %col.02
  %28 = zext i16 %tmp5 to i64
  %29 = getelementptr inbounds [512 x float]* @ext_info11, i64 0, i64 %28
  %30 = load float* %29, align 4
  %31 = fcmp ult float %30, 0.000000e+00
  br i1 %31, label %34, label %32

; <label>:32                                      ; preds = %27
  br i1 %26, label %33, label %36

; <label>:33                                      ; preds = %32
  br label %36

; <label>:34                                      ; preds = %27
  br i1 %22, label %36, label %35

; <label>:35                                      ; preds = %34
  br label %36

; <label>:36                                      ; preds = %35, %34, %33, %32
  %sign.0 = phi float [ -1.000000e+00, %33 ], [ -1.000000e+00, %35 ], [ 1.000000e+00, %32 ], [ 1.000000e+00, %34 ]
  %mod_self_info.0 = select i1 %24, float %25, float %19
  %37 = fpext float %30 to double
  %38 = fcmp olt double %37, 0.000000e+00
  br i1 %38, label %39, label %41

; <label>:39                                      ; preds = %36
  %40 = fsub float -0.000000e+00, %30
  br label %41

; <label>:41                                      ; preds = %39, %36
  %mod_ext_info.0 = phi float [ %40, %39 ], [ %30, %36 ]
  %42 = fcmp ogt float %mod_self_info.0, %mod_ext_info.0
  %magnitude.0 = select i1 %42, float %mod_ext_info.0, float %mod_self_info.0
  %43 = fmul float %sign.0, %magnitude.0
  store float %43, float* %29, align 4
  %44 = add i16 %col.02, 1
  %exitcond1 = icmp eq i16 %44, %range.0
  br i1 %exitcond1, label %.loopexit.loopexit, label %27

; <label>:45                                      ; preds = %16
  %46 = zext i16 %17 to i64
  %47 = add i64 %46, -1
  %48 = getelementptr inbounds [512 x float]* @ext_info11, i64 0, i64 %47
  store float %19, float* %48, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %41
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %45, %20
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp9
  br i1 %exitcond, label %._crit_edge.loopexit, label %7

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @transverseCorrection12() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph4

bb.nph4:                                          ; preds = %0
  %3 = load i16* @ncol_ind_12, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg1 = add i16 %3, 1
  %tmp6 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op23 = add i64 %6, 1
  %tmp9 = select i1 %tmp6, i64 %.op23, i64 1
  %tmp3 = zext i16 %3 to i64
  %tmp4 = add i64 %tmp3, 4
  %tmp10 = add i64 %tmp3, 3
  br label %7

; <label>:7                                       ; preds = %.loopexit, %bb.nph4
  %indvar = phi i64 [ 0, %bb.nph4 ], [ %indvar.next, %.loopexit ]
  %tmp7 = add i64 %tmp4, %indvar
  %scevgep18 = getelementptr [512 x i16]* @mem12, i64 0, i64 %tmp7
  %tmp15 = add i64 %tmp10, %indvar
  %scevgep15 = getelementptr [512 x i16]* @mem12, i64 0, i64 %tmp15
  %scevgep = getelementptr [512 x float]* @trans_info11_12, i64 0, i64 %indvar
  %tmp11 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp11, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep15, align 2
  %11 = sub i16 %.neg1, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep15, align 2
  %14 = load i16* %scevgep18, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp ugt i16 %range.0, 1
  %19 = load float* %scevgep, align 4
  br i1 %18, label %20, label %45

; <label>:20                                      ; preds = %16
  %21 = fcmp une float %19, 0.000000e+00
  br i1 %21, label %bb.nph, label %.loopexit

bb.nph:                                           ; preds = %20
  %22 = fcmp olt float %19, 0.000000e+00
  %23 = fpext float %19 to double
  %24 = fcmp olt double %23, 0.000000e+00
  %25 = fsub float -0.000000e+00, %19
  %26 = fcmp ult float %19, 0.000000e+00
  %tmp = add i16 %17, -1
  br label %27

; <label>:27                                      ; preds = %41, %bb.nph
  %col.02 = phi i16 [ 0, %bb.nph ], [ %44, %41 ]
  %tmp5 = add i16 %tmp, %col.02
  %28 = zext i16 %tmp5 to i64
  %29 = getelementptr inbounds [512 x float]* @ext_info12, i64 0, i64 %28
  %30 = load float* %29, align 4
  %31 = fcmp ult float %30, 0.000000e+00
  br i1 %31, label %34, label %32

; <label>:32                                      ; preds = %27
  br i1 %26, label %33, label %36

; <label>:33                                      ; preds = %32
  br label %36

; <label>:34                                      ; preds = %27
  br i1 %22, label %36, label %35

; <label>:35                                      ; preds = %34
  br label %36

; <label>:36                                      ; preds = %35, %34, %33, %32
  %sign.0 = phi float [ -1.000000e+00, %33 ], [ -1.000000e+00, %35 ], [ 1.000000e+00, %32 ], [ 1.000000e+00, %34 ]
  %mod_self_info.0 = select i1 %24, float %25, float %19
  %37 = fpext float %30 to double
  %38 = fcmp olt double %37, 0.000000e+00
  br i1 %38, label %39, label %41

; <label>:39                                      ; preds = %36
  %40 = fsub float -0.000000e+00, %30
  br label %41

; <label>:41                                      ; preds = %39, %36
  %mod_ext_info.0 = phi float [ %40, %39 ], [ %30, %36 ]
  %42 = fcmp ogt float %mod_self_info.0, %mod_ext_info.0
  %magnitude.0 = select i1 %42, float %mod_ext_info.0, float %mod_self_info.0
  %43 = fmul float %sign.0, %magnitude.0
  store float %43, float* %29, align 4
  %44 = add i16 %col.02, 1
  %exitcond1 = icmp eq i16 %44, %range.0
  br i1 %exitcond1, label %.loopexit.loopexit, label %27

; <label>:45                                      ; preds = %16
  %46 = zext i16 %17 to i64
  %47 = add i64 %46, -1
  %48 = getelementptr inbounds [512 x float]* @ext_info12, i64 0, i64 %47
  store float %19, float* %48, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %41
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %45, %20
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp9
  br i1 %exitcond, label %._crit_edge.loopexit, label %7

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @transverseCorrection21() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph4

bb.nph4:                                          ; preds = %0
  %3 = load i16* @ncol_ind_21, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg1 = add i16 %3, 1
  %tmp6 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op23 = add i64 %6, 1
  %tmp9 = select i1 %tmp6, i64 %.op23, i64 1
  %tmp3 = zext i16 %3 to i64
  %tmp4 = add i64 %tmp3, 4
  %tmp10 = add i64 %tmp3, 3
  br label %7

; <label>:7                                       ; preds = %.loopexit, %bb.nph4
  %indvar = phi i64 [ 0, %bb.nph4 ], [ %indvar.next, %.loopexit ]
  %tmp7 = add i64 %tmp4, %indvar
  %scevgep18 = getelementptr [512 x i16]* @mem21, i64 0, i64 %tmp7
  %tmp15 = add i64 %tmp10, %indvar
  %scevgep15 = getelementptr [512 x i16]* @mem21, i64 0, i64 %tmp15
  %scevgep = getelementptr [512 x float]* @trans_info22_21, i64 0, i64 %indvar
  %tmp11 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp11, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep15, align 2
  %11 = sub i16 %.neg1, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep15, align 2
  %14 = load i16* %scevgep18, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp ugt i16 %range.0, 1
  %19 = load float* %scevgep, align 4
  br i1 %18, label %20, label %45

; <label>:20                                      ; preds = %16
  %21 = fcmp une float %19, 0.000000e+00
  br i1 %21, label %bb.nph, label %.loopexit

bb.nph:                                           ; preds = %20
  %22 = fcmp olt float %19, 0.000000e+00
  %23 = fpext float %19 to double
  %24 = fcmp olt double %23, 0.000000e+00
  %25 = fsub float -0.000000e+00, %19
  %26 = fcmp ult float %19, 0.000000e+00
  %tmp = add i16 %17, -1
  br label %27

; <label>:27                                      ; preds = %41, %bb.nph
  %col.02 = phi i16 [ 0, %bb.nph ], [ %44, %41 ]
  %tmp5 = add i16 %tmp, %col.02
  %28 = zext i16 %tmp5 to i64
  %29 = getelementptr inbounds [512 x float]* @ext_info21, i64 0, i64 %28
  %30 = load float* %29, align 4
  %31 = fcmp ult float %30, 0.000000e+00
  br i1 %31, label %34, label %32

; <label>:32                                      ; preds = %27
  br i1 %26, label %33, label %36

; <label>:33                                      ; preds = %32
  br label %36

; <label>:34                                      ; preds = %27
  br i1 %22, label %36, label %35

; <label>:35                                      ; preds = %34
  br label %36

; <label>:36                                      ; preds = %35, %34, %33, %32
  %sign.0 = phi float [ -1.000000e+00, %33 ], [ -1.000000e+00, %35 ], [ 1.000000e+00, %32 ], [ 1.000000e+00, %34 ]
  %mod_self_info.0 = select i1 %24, float %25, float %19
  %37 = fpext float %30 to double
  %38 = fcmp olt double %37, 0.000000e+00
  br i1 %38, label %39, label %41

; <label>:39                                      ; preds = %36
  %40 = fsub float -0.000000e+00, %30
  br label %41

; <label>:41                                      ; preds = %39, %36
  %mod_ext_info.0 = phi float [ %40, %39 ], [ %30, %36 ]
  %42 = fcmp ogt float %mod_self_info.0, %mod_ext_info.0
  %magnitude.0 = select i1 %42, float %mod_ext_info.0, float %mod_self_info.0
  %43 = fmul float %sign.0, %magnitude.0
  store float %43, float* %29, align 4
  %44 = add i16 %col.02, 1
  %exitcond1 = icmp eq i16 %44, %range.0
  br i1 %exitcond1, label %.loopexit.loopexit, label %27

; <label>:45                                      ; preds = %16
  %46 = zext i16 %17 to i64
  %47 = add i64 %46, -1
  %48 = getelementptr inbounds [512 x float]* @ext_info21, i64 0, i64 %47
  store float %19, float* %48, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %41
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %45, %20
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp9
  br i1 %exitcond, label %._crit_edge.loopexit, label %7

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @transverseCorrection22() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph4

bb.nph4:                                          ; preds = %0
  %3 = load i16* @ncol_ind_22, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg1 = add i16 %3, 1
  %tmp6 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op23 = add i64 %6, 1
  %tmp9 = select i1 %tmp6, i64 %.op23, i64 1
  %tmp3 = zext i16 %3 to i64
  %tmp4 = add i64 %tmp3, 4
  %tmp10 = add i64 %tmp3, 3
  br label %7

; <label>:7                                       ; preds = %.loopexit, %bb.nph4
  %indvar = phi i64 [ 0, %bb.nph4 ], [ %indvar.next, %.loopexit ]
  %tmp7 = add i64 %tmp4, %indvar
  %scevgep18 = getelementptr [512 x i16]* @mem22, i64 0, i64 %tmp7
  %tmp15 = add i64 %tmp10, %indvar
  %scevgep15 = getelementptr [512 x i16]* @mem22, i64 0, i64 %tmp15
  %scevgep = getelementptr [512 x float]* @trans_info21_22, i64 0, i64 %indvar
  %tmp11 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp11, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep15, align 2
  %11 = sub i16 %.neg1, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep15, align 2
  %14 = load i16* %scevgep18, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp ugt i16 %range.0, 1
  %19 = load float* %scevgep, align 4
  br i1 %18, label %20, label %45

; <label>:20                                      ; preds = %16
  %21 = fcmp une float %19, 0.000000e+00
  br i1 %21, label %bb.nph, label %.loopexit

bb.nph:                                           ; preds = %20
  %22 = fcmp olt float %19, 0.000000e+00
  %23 = fpext float %19 to double
  %24 = fcmp olt double %23, 0.000000e+00
  %25 = fsub float -0.000000e+00, %19
  %26 = fcmp ult float %19, 0.000000e+00
  %tmp = add i16 %17, -1
  br label %27

; <label>:27                                      ; preds = %41, %bb.nph
  %col.02 = phi i16 [ 0, %bb.nph ], [ %44, %41 ]
  %tmp5 = add i16 %tmp, %col.02
  %28 = zext i16 %tmp5 to i64
  %29 = getelementptr inbounds [512 x float]* @ext_info22, i64 0, i64 %28
  %30 = load float* %29, align 4
  %31 = fcmp ult float %30, 0.000000e+00
  br i1 %31, label %34, label %32

; <label>:32                                      ; preds = %27
  br i1 %26, label %33, label %36

; <label>:33                                      ; preds = %32
  br label %36

; <label>:34                                      ; preds = %27
  br i1 %22, label %36, label %35

; <label>:35                                      ; preds = %34
  br label %36

; <label>:36                                      ; preds = %35, %34, %33, %32
  %sign.0 = phi float [ -1.000000e+00, %33 ], [ -1.000000e+00, %35 ], [ 1.000000e+00, %32 ], [ 1.000000e+00, %34 ]
  %mod_self_info.0 = select i1 %24, float %25, float %19
  %37 = fpext float %30 to double
  %38 = fcmp olt double %37, 0.000000e+00
  br i1 %38, label %39, label %41

; <label>:39                                      ; preds = %36
  %40 = fsub float -0.000000e+00, %30
  br label %41

; <label>:41                                      ; preds = %39, %36
  %mod_ext_info.0 = phi float [ %40, %39 ], [ %30, %36 ]
  %42 = fcmp ogt float %mod_self_info.0, %mod_ext_info.0
  %magnitude.0 = select i1 %42, float %mod_ext_info.0, float %mod_self_info.0
  %43 = fmul float %sign.0, %magnitude.0
  store float %43, float* %29, align 4
  %44 = add i16 %col.02, 1
  %exitcond1 = icmp eq i16 %44, %range.0
  br i1 %exitcond1, label %.loopexit.loopexit, label %27

; <label>:45                                      ; preds = %16
  %46 = zext i16 %17 to i64
  %47 = add i64 %46, -1
  %48 = getelementptr inbounds [512 x float]* @ext_info22, i64 0, i64 %47
  store float %19, float* %48, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %41
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %45, %20
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp9
  br i1 %exitcond, label %._crit_edge.loopexit, label %7

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @update_aPosteriori11() nounwind {
  %1 = load i16* @ncol_ind_11, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op7 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op7, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %tmp2 = add i64 %indvar, 3
  %scevgep6 = getelementptr [512 x i16]* @mem11, i64 0, i64 %tmp2
  %scevgep = getelementptr [512 x float]* @ext_info11, i64 0, i64 %indvar
  %5 = load i16* %scevgep6, align 2
  %6 = add i16 %5, -1
  %7 = load float* %scevgep, align 4
  %8 = zext i16 %6 to i64
  %9 = getelementptr inbounds [512 x float]* @aPosteriori1, i64 0, i64 %8
  %10 = load float* %9, align 4
  %11 = fadd float %10, %7
  store float %11, float* %9, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @update_aPosteriori12() nounwind {
  %1 = load i16* @ncol_ind_12, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op7 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op7, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %tmp2 = add i64 %indvar, 3
  %scevgep6 = getelementptr [512 x i16]* @mem12, i64 0, i64 %tmp2
  %scevgep = getelementptr [512 x float]* @ext_info12, i64 0, i64 %indvar
  %5 = load i16* %scevgep6, align 2
  %6 = add i16 %5, -1
  %7 = load float* %scevgep, align 4
  %8 = zext i16 %6 to i64
  %9 = getelementptr inbounds [512 x float]* @aPosteriori2, i64 0, i64 %8
  %10 = load float* %9, align 4
  %11 = fadd float %10, %7
  store float %11, float* %9, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @update_aPosteriori21() nounwind {
  %1 = load i16* @ncol_ind_21, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op7 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op7, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %tmp2 = add i64 %indvar, 3
  %scevgep6 = getelementptr [512 x i16]* @mem21, i64 0, i64 %tmp2
  %scevgep = getelementptr [512 x float]* @ext_info21, i64 0, i64 %indvar
  %5 = load i16* %scevgep6, align 2
  %6 = add i16 %5, -1
  %7 = load float* %scevgep, align 4
  %8 = zext i16 %6 to i64
  %9 = getelementptr inbounds [512 x float]* @aPosteriori1, i64 0, i64 %8
  %10 = load float* %9, align 4
  %11 = fadd float %10, %7
  store float %11, float* %9, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @update_aPosteriori22() nounwind {
  %1 = load i16* @ncol_ind_22, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op7 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op7, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %tmp2 = add i64 %indvar, 3
  %scevgep6 = getelementptr [512 x i16]* @mem22, i64 0, i64 %tmp2
  %scevgep = getelementptr [512 x float]* @ext_info22, i64 0, i64 %indvar
  %5 = load i16* %scevgep6, align 2
  %6 = add i16 %5, -1
  %7 = load float* %scevgep, align 4
  %8 = zext i16 %6 to i64
  %9 = getelementptr inbounds [512 x float]* @aPosteriori2, i64 0, i64 %8
  %10 = load float* %9, align 4
  %11 = fadd float %10, %7
  store float %11, float* %9, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @checkIsdecoded1() nounwind {
  store i16 1, i16* @is_decoded_1, align 2
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op6 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op6, i64 1
  br label %4

; <label>:4                                       ; preds = %22, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %22 ]
  %scevgep5 = getelementptr [512 x float]* @code_block1, i64 0, i64 %indvar
  %scevgep = getelementptr [512 x float]* @aPosteriori1, i64 0, i64 %indvar
  %5 = load float* %scevgep, align 4
  %6 = fpext float %5 to double
  %7 = fcmp ogt double %6, 0.000000e+00
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %4
  %9 = load float* %scevgep5, align 4
  %10 = fpext float %9 to double
  %11 = fcmp ogt double %10, 0.000000e+00
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %8
  store i16 0, i16* @is_decoded_1, align 2
  br label %13

; <label>:13                                      ; preds = %12, %8
  store float -1.000000e+00, float* %scevgep5, align 4
  br label %22

; <label>:14                                      ; preds = %4
  %15 = fcmp olt double %6, 0.000000e+00
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %14
  %17 = load float* %scevgep5, align 4
  %18 = fpext float %17 to double
  %19 = fcmp olt double %18, 0.000000e+00
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %16
  store i16 0, i16* @is_decoded_1, align 2
  br label %21

; <label>:21                                      ; preds = %20, %16
  store float 1.000000e+00, float* %scevgep5, align 4
  br label %22

; <label>:22                                      ; preds = %21, %14, %13
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %22
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @checkIsdecoded2() nounwind {
  store i16 1, i16* @is_decoded_2, align 2
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op6 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op6, i64 1
  br label %4

; <label>:4                                       ; preds = %22, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %22 ]
  %scevgep5 = getelementptr [512 x float]* @code_block2, i64 0, i64 %indvar
  %scevgep = getelementptr [512 x float]* @aPosteriori2, i64 0, i64 %indvar
  %5 = load float* %scevgep, align 4
  %6 = fpext float %5 to double
  %7 = fcmp ogt double %6, 0.000000e+00
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %4
  %9 = load float* %scevgep5, align 4
  %10 = fpext float %9 to double
  %11 = fcmp ogt double %10, 0.000000e+00
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %8
  store i16 0, i16* @is_decoded_2, align 2
  br label %13

; <label>:13                                      ; preds = %12, %8
  store float -1.000000e+00, float* %scevgep5, align 4
  br label %22

; <label>:14                                      ; preds = %4
  %15 = fcmp olt double %6, 0.000000e+00
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %14
  %17 = load float* %scevgep5, align 4
  %18 = fpext float %17 to double
  %19 = fcmp olt double %18, 0.000000e+00
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %16
  store i16 0, i16* @is_decoded_2, align 2
  br label %21

; <label>:21                                      ; preds = %20, %16
  store float 1.000000e+00, float* %scevgep5, align 4
  br label %22

; <label>:22                                      ; preds = %21, %14, %13
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %22
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @updateMessage11() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge5, label %bb.nph4

bb.nph4:                                          ; preds = %0
  %3 = load i16* @ncol_ind_11, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg1 = add i16 %3, 1
  %tmp7 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op19 = add i64 %6, 1
  %tmp10 = select i1 %tmp7, i64 %.op19, i64 1
  %tmp3 = zext i16 %3 to i64
  %tmp4 = add i64 %tmp3, 4
  %tmp8 = add i64 %tmp3, 3
  br label %7

; <label>:7                                       ; preds = %._crit_edge, %bb.nph4
  %indvar = phi i64 [ 0, %bb.nph4 ], [ %indvar.next, %._crit_edge ]
  %tmp5 = add i64 %tmp4, %indvar
  %scevgep18 = getelementptr [512 x i16]* @mem11, i64 0, i64 %tmp5
  %tmp9 = add i64 %tmp8, %indvar
  %scevgep = getelementptr [512 x i16]* @mem11, i64 0, i64 %tmp9
  %tmp12 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp12, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep, align 2
  %11 = sub i16 %.neg1, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep, align 2
  %14 = load i16* %scevgep18, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp eq i16 %range.0, 0
  br i1 %18, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %16
  %tmp = add i16 %17, -1
  br label %19

; <label>:19                                      ; preds = %19, %bb.nph
  %col.02 = phi i16 [ 0, %bb.nph ], [ %32, %19 ]
  %tmp6 = add i16 %tmp, %col.02
  %20 = zext i16 %tmp6 to i64
  %21 = add i64 %20, 3
  %22 = getelementptr inbounds [512 x i16]* @mem11, i64 0, i64 %21
  %23 = load i16* %22, align 2
  %24 = add i16 %23, -1
  %25 = zext i16 %24 to i64
  %26 = getelementptr inbounds [512 x float]* @aPosteriori1, i64 0, i64 %25
  %27 = load float* %26, align 4
  %28 = getelementptr inbounds [512 x float]* @ext_info11, i64 0, i64 %20
  %29 = load float* %28, align 4
  %30 = fsub float %27, %29
  %31 = getelementptr inbounds [512 x float]* @message11, i64 0, i64 %20
  store float %30, float* %31, align 4
  %32 = add i16 %col.02, 1
  %exitcond1 = icmp eq i16 %32, %range.0
  br i1 %exitcond1, label %._crit_edge.loopexit, label %19

._crit_edge.loopexit:                             ; preds = %19
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %16
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp10
  br i1 %exitcond, label %._crit_edge5.loopexit, label %7

._crit_edge5.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %0
  ret void
}

define void @updateMessage12() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge5, label %bb.nph4

bb.nph4:                                          ; preds = %0
  %3 = load i16* @ncol_ind_12, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg1 = add i16 %3, 1
  %tmp7 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op19 = add i64 %6, 1
  %tmp10 = select i1 %tmp7, i64 %.op19, i64 1
  %tmp3 = zext i16 %3 to i64
  %tmp4 = add i64 %tmp3, 4
  %tmp8 = add i64 %tmp3, 3
  br label %7

; <label>:7                                       ; preds = %._crit_edge, %bb.nph4
  %indvar = phi i64 [ 0, %bb.nph4 ], [ %indvar.next, %._crit_edge ]
  %tmp5 = add i64 %tmp4, %indvar
  %scevgep18 = getelementptr [512 x i16]* @mem12, i64 0, i64 %tmp5
  %tmp9 = add i64 %tmp8, %indvar
  %scevgep = getelementptr [512 x i16]* @mem12, i64 0, i64 %tmp9
  %tmp12 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp12, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep, align 2
  %11 = sub i16 %.neg1, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep, align 2
  %14 = load i16* %scevgep18, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp eq i16 %range.0, 0
  br i1 %18, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %16
  %tmp = add i16 %17, -1
  br label %19

; <label>:19                                      ; preds = %19, %bb.nph
  %col.02 = phi i16 [ 0, %bb.nph ], [ %32, %19 ]
  %tmp6 = add i16 %tmp, %col.02
  %20 = zext i16 %tmp6 to i64
  %21 = add i64 %20, 3
  %22 = getelementptr inbounds [512 x i16]* @mem12, i64 0, i64 %21
  %23 = load i16* %22, align 2
  %24 = add i16 %23, -1
  %25 = zext i16 %24 to i64
  %26 = getelementptr inbounds [512 x float]* @aPosteriori2, i64 0, i64 %25
  %27 = load float* %26, align 4
  %28 = getelementptr inbounds [512 x float]* @ext_info12, i64 0, i64 %20
  %29 = load float* %28, align 4
  %30 = fsub float %27, %29
  %31 = getelementptr inbounds [512 x float]* @message12, i64 0, i64 %20
  store float %30, float* %31, align 4
  %32 = add i16 %col.02, 1
  %exitcond1 = icmp eq i16 %32, %range.0
  br i1 %exitcond1, label %._crit_edge.loopexit, label %19

._crit_edge.loopexit:                             ; preds = %19
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %16
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp10
  br i1 %exitcond, label %._crit_edge5.loopexit, label %7

._crit_edge5.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %0
  ret void
}

define void @updateMessage21() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge5, label %bb.nph4

bb.nph4:                                          ; preds = %0
  %3 = load i16* @ncol_ind_21, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg1 = add i16 %3, 1
  %tmp7 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op19 = add i64 %6, 1
  %tmp10 = select i1 %tmp7, i64 %.op19, i64 1
  %tmp3 = zext i16 %3 to i64
  %tmp4 = add i64 %tmp3, 4
  %tmp8 = add i64 %tmp3, 3
  br label %7

; <label>:7                                       ; preds = %._crit_edge, %bb.nph4
  %indvar = phi i64 [ 0, %bb.nph4 ], [ %indvar.next, %._crit_edge ]
  %tmp5 = add i64 %tmp4, %indvar
  %scevgep18 = getelementptr [512 x i16]* @mem21, i64 0, i64 %tmp5
  %tmp9 = add i64 %tmp8, %indvar
  %scevgep = getelementptr [512 x i16]* @mem21, i64 0, i64 %tmp9
  %tmp12 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp12, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep, align 2
  %11 = sub i16 %.neg1, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep, align 2
  %14 = load i16* %scevgep18, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp eq i16 %range.0, 0
  br i1 %18, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %16
  %tmp = add i16 %17, -1
  br label %19

; <label>:19                                      ; preds = %19, %bb.nph
  %col.02 = phi i16 [ 0, %bb.nph ], [ %32, %19 ]
  %tmp6 = add i16 %tmp, %col.02
  %20 = zext i16 %tmp6 to i64
  %21 = add i64 %20, 3
  %22 = getelementptr inbounds [512 x i16]* @mem21, i64 0, i64 %21
  %23 = load i16* %22, align 2
  %24 = add i16 %23, -1
  %25 = zext i16 %24 to i64
  %26 = getelementptr inbounds [512 x float]* @aPosteriori1, i64 0, i64 %25
  %27 = load float* %26, align 4
  %28 = getelementptr inbounds [512 x float]* @ext_info21, i64 0, i64 %20
  %29 = load float* %28, align 4
  %30 = fsub float %27, %29
  %31 = getelementptr inbounds [512 x float]* @message21, i64 0, i64 %20
  store float %30, float* %31, align 4
  %32 = add i16 %col.02, 1
  %exitcond1 = icmp eq i16 %32, %range.0
  br i1 %exitcond1, label %._crit_edge.loopexit, label %19

._crit_edge.loopexit:                             ; preds = %19
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %16
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp10
  br i1 %exitcond, label %._crit_edge5.loopexit, label %7

._crit_edge5.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %0
  ret void
}

define void @updateMessage22() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge5, label %bb.nph4

bb.nph4:                                          ; preds = %0
  %3 = load i16* @ncol_ind_22, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg1 = add i16 %3, 1
  %tmp7 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op19 = add i64 %6, 1
  %tmp10 = select i1 %tmp7, i64 %.op19, i64 1
  %tmp3 = zext i16 %3 to i64
  %tmp4 = add i64 %tmp3, 4
  %tmp8 = add i64 %tmp3, 3
  br label %7

; <label>:7                                       ; preds = %._crit_edge, %bb.nph4
  %indvar = phi i64 [ 0, %bb.nph4 ], [ %indvar.next, %._crit_edge ]
  %tmp5 = add i64 %tmp4, %indvar
  %scevgep18 = getelementptr [512 x i16]* @mem22, i64 0, i64 %tmp5
  %tmp9 = add i64 %tmp8, %indvar
  %scevgep = getelementptr [512 x i16]* @mem22, i64 0, i64 %tmp9
  %tmp12 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp12, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep, align 2
  %11 = sub i16 %.neg1, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep, align 2
  %14 = load i16* %scevgep18, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp eq i16 %range.0, 0
  br i1 %18, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %16
  %tmp = add i16 %17, -1
  br label %19

; <label>:19                                      ; preds = %19, %bb.nph
  %col.02 = phi i16 [ 0, %bb.nph ], [ %32, %19 ]
  %tmp6 = add i16 %tmp, %col.02
  %20 = zext i16 %tmp6 to i64
  %21 = add i64 %20, 3
  %22 = getelementptr inbounds [512 x i16]* @mem22, i64 0, i64 %21
  %23 = load i16* %22, align 2
  %24 = add i16 %23, -1
  %25 = zext i16 %24 to i64
  %26 = getelementptr inbounds [512 x float]* @aPosteriori2, i64 0, i64 %25
  %27 = load float* %26, align 4
  %28 = getelementptr inbounds [512 x float]* @ext_info22, i64 0, i64 %20
  %29 = load float* %28, align 4
  %30 = fsub float %27, %29
  %31 = getelementptr inbounds [512 x float]* @message22, i64 0, i64 %20
  store float %30, float* %31, align 4
  %32 = add i16 %col.02, 1
  %exitcond1 = icmp eq i16 %32, %range.0
  br i1 %exitcond1, label %._crit_edge.loopexit, label %19

._crit_edge.loopexit:                             ; preds = %19
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %16
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp10
  br i1 %exitcond, label %._crit_edge5.loopexit, label %7

._crit_edge5.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %0
  ret void
}

define void @send_inputs() nounwind {
bb.nph20:
  br label %0

; <label>:0                                       ; preds = %0, %bb.nph20
  %indvar38 = phi i64 [ 0, %bb.nph20 ], [ %indvar.next39, %0 ]
  %scevgep41 = getelementptr [512 x i16]* @mem11, i64 0, i64 %indvar38
  %1 = load i16* %scevgep41, align 2
  tail call void @write_uint16(i8* getelementptr inbounds ([11 x i8]* @.str7, i64 0, i64 0), i16 zeroext %1) nounwind
  %indvar.next39 = add i64 %indvar38, 1
  %exitcond12 = icmp eq i64 %indvar.next39, 9
  br i1 %exitcond12, label %bb.nph18.preheader, label %0

bb.nph18.preheader:                               ; preds = %0
  br label %bb.nph18

bb.nph18:                                         ; preds = %bb.nph18, %bb.nph18.preheader
  %indvar34 = phi i64 [ %indvar.next35, %bb.nph18 ], [ 0, %bb.nph18.preheader ]
  %scevgep37 = getelementptr [512 x i16]* @mem12, i64 0, i64 %indvar34
  %2 = load i16* %scevgep37, align 2
  tail call void @write_uint16(i8* getelementptr inbounds ([11 x i8]* @.str7, i64 0, i64 0), i16 zeroext %2) nounwind
  %indvar.next35 = add i64 %indvar34, 1
  %exitcond10 = icmp eq i64 %indvar.next35, 7
  br i1 %exitcond10, label %bb.nph15.preheader, label %bb.nph18

bb.nph15.preheader:                               ; preds = %bb.nph18
  br label %bb.nph15

bb.nph15:                                         ; preds = %bb.nph15, %bb.nph15.preheader
  %indvar30 = phi i64 [ %indvar.next31, %bb.nph15 ], [ 0, %bb.nph15.preheader ]
  %scevgep33 = getelementptr [512 x i16]* @mem21, i64 0, i64 %indvar30
  %3 = load i16* %scevgep33, align 2
  tail call void @write_uint16(i8* getelementptr inbounds ([11 x i8]* @.str7, i64 0, i64 0), i16 zeroext %3) nounwind
  %indvar.next31 = add i64 %indvar30, 1
  %exitcond = icmp eq i64 %indvar.next31, 8
  br i1 %exitcond, label %bb.nph12.preheader, label %bb.nph15

bb.nph12.preheader:                               ; preds = %bb.nph15
  br label %bb.nph12

.preheader7:                                      ; preds = %bb.nph12
  %4 = load i16* @ncols, align 2
  %5 = icmp eq i16 %4, 0
  br i1 %5, label %._crit_edge, label %bb.nph9.preheader

bb.nph9.preheader:                                ; preds = %.preheader7
  br label %bb.nph9

bb.nph12:                                         ; preds = %bb.nph12, %bb.nph12.preheader
  %indvar27 = phi i64 [ %indvar.next28, %bb.nph12 ], [ 0, %bb.nph12.preheader ]
  %scevgep29 = getelementptr [512 x i16]* @mem22, i64 0, i64 %indvar27
  %6 = load i16* %scevgep29, align 2
  tail call void @write_uint16(i8* getelementptr inbounds ([11 x i8]* @.str7, i64 0, i64 0), i16 zeroext %6) nounwind
  %indvar.next28 = add i64 %indvar27, 1
  %exitcond7 = icmp eq i64 %indvar.next28, 8
  br i1 %exitcond7, label %.preheader7, label %bb.nph12

.preheader:                                       ; preds = %bb.nph9
  %.lcssa = phi i16 [ %9, %bb.nph9 ]
  %7 = icmp eq i16 %.lcssa, 0
  br i1 %7, label %._crit_edge, label %bb.nph.preheader

bb.nph.preheader:                                 ; preds = %.preheader
  br label %bb.nph

bb.nph9:                                          ; preds = %bb.nph9, %bb.nph9.preheader
  %indvar22 = phi i64 [ %tmp25, %bb.nph9 ], [ 0, %bb.nph9.preheader ]
  %tmp4 = add i64 %indvar22, 1
  %tmp26 = trunc i64 %tmp4 to i32
  %scevgep24 = getelementptr [512 x float]* @code_block1, i64 0, i64 %indvar22
  %8 = load float* %scevgep24, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([16 x i8]* @.str8, i64 0, i64 0), float %8) nounwind
  %tmp25 = add i64 %indvar22, 1
  %9 = load i16* @ncols, align 2
  %10 = zext i16 %9 to i32
  %11 = icmp slt i32 %tmp26, %10
  br i1 %11, label %bb.nph9, label %.preheader

bb.nph:                                           ; preds = %bb.nph, %bb.nph.preheader
  %indvar = phi i64 [ %tmp, %bb.nph ], [ 0, %bb.nph.preheader ]
  %tmp1 = add i64 %indvar, 1
  %tmp21 = trunc i64 %tmp1 to i32
  %scevgep = getelementptr [512 x float]* @code_block2, i64 0, i64 %indvar
  %12 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([16 x i8]* @.str9, i64 0, i64 0), float %12) nounwind
  %tmp = add i64 %indvar, 1
  %13 = load i16* @ncols, align 2
  %14 = zext i16 %13 to i32
  %15 = icmp slt i32 %tmp21, %14
  br i1 %15, label %bb.nph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %bb.nph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader, %.preheader7
  ret void
}

declare void @write_uint16(i8*, i16 zeroext)

define void @send_message() nounwind {
bb.nph12:
  br label %0

; <label>:0                                       ; preds = %0, %bb.nph12
  %indvar21 = phi i64 [ 0, %bb.nph12 ], [ %indvar.next22, %0 ]
  %scevgep24 = getelementptr [512 x float]* @message11, i64 0, i64 %indvar21
  %1 = load float* %scevgep24, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([19 x i8]* @.str10, i64 0, i64 0), float %1) nounwind
  %indvar.next22 = add i64 %indvar21, 1
  %exitcond6 = icmp eq i64 %indvar.next22, 4
  br i1 %exitcond6, label %bb.nph10.preheader, label %0

bb.nph10.preheader:                               ; preds = %0
  br label %bb.nph10

bb.nph10:                                         ; preds = %bb.nph10, %bb.nph10.preheader
  %indvar17 = phi i64 [ %indvar.next18, %bb.nph10 ], [ 0, %bb.nph10.preheader ]
  %scevgep20 = getelementptr [512 x float]* @message12, i64 0, i64 %indvar17
  %2 = load float* %scevgep20, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([19 x i8]* @.str11, i64 0, i64 0), float %2) nounwind
  %indvar.next18 = add i64 %indvar17, 1
  %exitcond4 = icmp eq i64 %indvar.next18, 2
  br i1 %exitcond4, label %bb.nph7.preheader, label %bb.nph10

bb.nph7.preheader:                                ; preds = %bb.nph10
  br label %bb.nph7

bb.nph7:                                          ; preds = %bb.nph7, %bb.nph7.preheader
  %indvar13 = phi i64 [ %indvar.next14, %bb.nph7 ], [ 0, %bb.nph7.preheader ]
  %scevgep16 = getelementptr [512 x float]* @message21, i64 0, i64 %indvar13
  %3 = load float* %scevgep16, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([19 x i8]* @.str12, i64 0, i64 0), float %3) nounwind
  %indvar.next14 = add i64 %indvar13, 1
  %exitcond = icmp eq i64 %indvar.next14, 3
  br i1 %exitcond, label %bb.nph.preheader, label %bb.nph7

bb.nph.preheader:                                 ; preds = %bb.nph7
  br label %bb.nph

bb.nph:                                           ; preds = %bb.nph, %bb.nph.preheader
  %indvar = phi i64 [ %indvar.next, %bb.nph ], [ 0, %bb.nph.preheader ]
  %scevgep = getelementptr [512 x float]* @message22, i64 0, i64 %indvar
  %4 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([19 x i8]* @.str13, i64 0, i64 0), float %4) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, 3
  br i1 %exitcond1, label %._crit_edge, label %bb.nph

._crit_edge:                                      ; preds = %bb.nph
  ret void
}

define void @sendOther() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph4.preheader

bb.nph4.preheader:                                ; preds = %0
  br label %bb.nph4

.preheader:                                       ; preds = %bb.nph4
  %.lcssa = phi i16 [ %5, %bb.nph4 ]
  %3 = icmp eq i16 %.lcssa, 0
  br i1 %3, label %._crit_edge, label %bb.nph.preheader

bb.nph.preheader:                                 ; preds = %.preheader
  br label %bb.nph

bb.nph4:                                          ; preds = %bb.nph4, %bb.nph4.preheader
  %indvar6 = phi i64 [ %tmp9, %bb.nph4 ], [ 0, %bb.nph4.preheader ]
  %tmp4 = add i64 %indvar6, 1
  %tmp10 = trunc i64 %tmp4 to i32
  %scevgep8 = getelementptr [512 x float]* @aPriori1, i64 0, i64 %indvar6
  %4 = load float* %scevgep8, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), float %4) nounwind
  %tmp9 = add i64 %indvar6, 1
  %5 = load i16* @ncols, align 2
  %6 = zext i16 %5 to i32
  %7 = icmp slt i32 %tmp10, %6
  br i1 %7, label %bb.nph4, label %.preheader

bb.nph:                                           ; preds = %bb.nph, %bb.nph.preheader
  %indvar = phi i64 [ %tmp, %bb.nph ], [ 0, %bb.nph.preheader ]
  %tmp1 = add i64 %indvar, 1
  %tmp5 = trunc i64 %tmp1 to i32
  %scevgep = getelementptr [512 x float]* @aPriori2, i64 0, i64 %indvar
  %8 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([13 x i8]* @.str1, i64 0, i64 0), float %8) nounwind
  %tmp = add i64 %indvar, 1
  %9 = load i16* @ncols, align 2
  %10 = zext i16 %9 to i32
  %11 = icmp slt i32 %tmp5, %10
  br i1 %11, label %bb.nph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %bb.nph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader, %0
  ret void
}

define void @send_aPosteriori() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph4.preheader

bb.nph4.preheader:                                ; preds = %0
  br label %bb.nph4

.preheader:                                       ; preds = %bb.nph4
  %.lcssa = phi i16 [ %5, %bb.nph4 ]
  %3 = icmp eq i16 %.lcssa, 0
  br i1 %3, label %._crit_edge, label %bb.nph.preheader

bb.nph.preheader:                                 ; preds = %.preheader
  br label %bb.nph

bb.nph4:                                          ; preds = %bb.nph4, %bb.nph4.preheader
  %indvar6 = phi i64 [ %tmp9, %bb.nph4 ], [ 0, %bb.nph4.preheader ]
  %tmp4 = add i64 %indvar6, 1
  %tmp10 = trunc i64 %tmp4 to i32
  %scevgep8 = getelementptr [512 x float]* @aPosteriori1, i64 0, i64 %indvar6
  %4 = load float* %scevgep8, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([17 x i8]* @.str14, i64 0, i64 0), float %4) nounwind
  %tmp9 = add i64 %indvar6, 1
  %5 = load i16* @ncols, align 2
  %6 = zext i16 %5 to i32
  %7 = icmp slt i32 %tmp10, %6
  br i1 %7, label %bb.nph4, label %.preheader

bb.nph:                                           ; preds = %bb.nph, %bb.nph.preheader
  %indvar = phi i64 [ %tmp, %bb.nph ], [ 0, %bb.nph.preheader ]
  %tmp1 = add i64 %indvar, 1
  %tmp5 = trunc i64 %tmp1 to i32
  %scevgep = getelementptr [512 x float]* @aPosteriori2, i64 0, i64 %indvar
  %8 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([17 x i8]* @.str15, i64 0, i64 0), float %8) nounwind
  %tmp = add i64 %indvar, 1
  %9 = load i16* @ncols, align 2
  %10 = zext i16 %9 to i32
  %11 = icmp slt i32 %tmp5, %10
  br i1 %11, label %bb.nph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %bb.nph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader, %0
  ret void
}

define void @send_transverseCorrection11() nounwind {
bb.nph:
  br label %0

; <label>:0                                       ; preds = %0, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %0 ]
  %scevgep = getelementptr [512 x float]* @ext_info11, i64 0, i64 %indvar
  %1 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([15 x i8]* @.str16, i64 0, i64 0), float %1) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, 4
  br i1 %exitcond1, label %._crit_edge, label %0

._crit_edge:                                      ; preds = %0
  ret void
}

define void @send_transverseCorrection12() nounwind {
bb.nph:
  br label %0

; <label>:0                                       ; preds = %0, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %0 ]
  %scevgep = getelementptr [512 x float]* @ext_info12, i64 0, i64 %indvar
  %1 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([15 x i8]* @.str17, i64 0, i64 0), float %1) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, 2
  br i1 %exitcond1, label %._crit_edge, label %0

._crit_edge:                                      ; preds = %0
  ret void
}

define void @send_transverseCorrection21() nounwind {
bb.nph:
  br label %0

; <label>:0                                       ; preds = %0, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %0 ]
  %scevgep = getelementptr [512 x float]* @ext_info21, i64 0, i64 %indvar
  %1 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([15 x i8]* @.str18, i64 0, i64 0), float %1) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, 3
  br i1 %exitcond1, label %._crit_edge, label %0

._crit_edge:                                      ; preds = %0
  ret void
}

define void @send_transverseCorrection22() nounwind {
bb.nph:
  br label %0

; <label>:0                                       ; preds = %0, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %0 ]
  %scevgep = getelementptr [512 x float]* @ext_info22, i64 0, i64 %indvar
  %1 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([15 x i8]* @.str19, i64 0, i64 0), float %1) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, 3
  br i1 %exitcond1, label %._crit_edge, label %0

._crit_edge:                                      ; preds = %0
  ret void
}

define void @send_tens_info22_21() nounwind {
bb.nph:
  br label %0

; <label>:0                                       ; preds = %0, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %0 ]
  %scevgep = getelementptr [512 x float]* @trans_info22_21, i64 0, i64 %indvar
  %1 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([20 x i8]* @.str20, i64 0, i64 0), float %1) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, 2
  br i1 %exitcond1, label %._crit_edge, label %0

._crit_edge:                                      ; preds = %0
  ret void
}

define void @send_tens_info21_22() nounwind {
bb.nph:
  br label %0

; <label>:0                                       ; preds = %0, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %0 ]
  %scevgep = getelementptr [512 x float]* @trans_info21_22, i64 0, i64 %indvar
  %1 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([20 x i8]* @.str21, i64 0, i64 0), float %1) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, 2
  br i1 %exitcond1, label %._crit_edge, label %0

._crit_edge:                                      ; preds = %0
  ret void
}

define void @send_tens_info11_12() nounwind {
bb.nph:
  br label %0

; <label>:0                                       ; preds = %0, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %0 ]
  %scevgep = getelementptr [512 x float]* @trans_info11_12, i64 0, i64 %indvar
  %1 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([20 x i8]* @.str22, i64 0, i64 0), float %1) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, 2
  br i1 %exitcond1, label %._crit_edge, label %0

._crit_edge:                                      ; preds = %0
  ret void
}

define void @send_tens_info12_11() nounwind {
bb.nph:
  br label %0

; <label>:0                                       ; preds = %0, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %0 ]
  %scevgep = getelementptr [512 x float]* @trans_info12_11, i64 0, i64 %indvar
  %1 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([20 x i8]* @.str23, i64 0, i64 0), float %1) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, 2
  br i1 %exitcond1, label %._crit_edge, label %0

._crit_edge:                                      ; preds = %0
  ret void
}

define void @top_daemon_1() noreturn nounwind {
  br label %1

; <label>:1                                       ; preds = %checkIsdecoded1.exit, %0
  %2 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0)) nounwind
  store i16 %2, i16* @maxNitr, align 2
  %3 = tail call float @read_float32(i8* getelementptr inbounds ([10 x i8]* @.str4, i64 0, i64 0)) nounwind
  store float %3, float* @ebbyNo, align 4
  tail call void @initMem() nounwind
  %4 = tail call float @read_float32(i8* getelementptr inbounds ([8 x i8]* @.str5, i64 0, i64 0)) nounwind
  store float %4, float* @rate, align 4
  %5 = load i16* @ncols, align 2
  %6 = icmp eq i16 %5, 0
  br i1 %6, label %readCodeBlock.exit, label %bb.nph4.i.preheader

bb.nph4.i.preheader:                              ; preds = %1
  br label %bb.nph4.i

.preheader.i:                                     ; preds = %bb.nph4.i
  %.lcssa = phi i16 [ %13, %bb.nph4.i ]
  %7 = icmp eq i16 %.lcssa, 0
  br i1 %7, label %readCodeBlock.exit, label %bb.nph.i.preheader

bb.nph.i.preheader:                               ; preds = %.preheader.i
  br label %bb.nph.i

bb.nph4.i:                                        ; preds = %bb.nph4.i, %bb.nph4.i.preheader
  %8 = phi i16 [ %9, %bb.nph4.i ], [ 0, %bb.nph4.i.preheader ]
  %tmp = add i16 %8, 1
  %9 = add i16 %8, 1
  %10 = tail call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str6, i64 0, i64 0)) nounwind
  %11 = zext i16 %8 to i64
  %12 = getelementptr inbounds [512 x float]* @code_block1, i64 0, i64 %11
  store float %10, float* %12, align 4
  %13 = load i16* @ncols, align 2
  %14 = icmp ult i16 %tmp, %13
  br i1 %14, label %bb.nph4.i, label %.preheader.i

bb.nph.i:                                         ; preds = %bb.nph.i, %bb.nph.i.preheader
  %15 = phi i16 [ %16, %bb.nph.i ], [ 0, %bb.nph.i.preheader ]
  %tmp67 = add i16 %15, 1
  %16 = add i16 %15, 1
  %17 = tail call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str6, i64 0, i64 0)) nounwind
  %18 = zext i16 %15 to i64
  %19 = getelementptr inbounds [512 x float]* @code_block2, i64 0, i64 %18
  store float %17, float* %19, align 4
  %20 = load i16* @ncols, align 2
  %21 = icmp ult i16 %tmp67, %20
  br i1 %21, label %bb.nph.i, label %readCodeBlock.exit.loopexit

readCodeBlock.exit.loopexit:                      ; preds = %bb.nph.i
  br label %readCodeBlock.exit

readCodeBlock.exit:                               ; preds = %readCodeBlock.exit.loopexit, %.preheader.i, %1
  tail call void @send_inputs()
  tail call void @write_uint8(i8* getelementptr inbounds ([24 x i8]* @.str24, i64 0, i64 0), i8 zeroext 1) nounwind
  %22 = tail call zeroext i8 @read_uint8(i8* getelementptr inbounds ([18 x i8]* @.str25, i64 0, i64 0)) nounwind
  %23 = load i16* @ncols, align 2
  %24 = icmp eq i16 %23, 0
  br i1 %24, label %initialize_aPriori1.exit, label %bb.nph.i1

bb.nph.i1:                                        ; preds = %readCodeBlock.exit
  %25 = load float* @ebbyNo, align 4
  %26 = load float* @rate, align 4
  %27 = fmul float %26, %25
  %tmp3.i = icmp ugt i16 %23, 1
  %.op.i = add i16 %23, -1
  %28 = zext i16 %.op.i to i64
  %.op8.i = add i64 %28, 1
  %tmp6.i = select i1 %tmp3.i, i64 %.op8.i, i64 1
  br label %29

; <label>:29                                      ; preds = %29, %bb.nph.i1
  %indvar.i = phi i64 [ 0, %bb.nph.i1 ], [ %indvar.next.i, %29 ]
  %scevgep.i = getelementptr [512 x float]* @code_block1, i64 0, i64 %indvar.i
  %scevgep7.i = getelementptr [512 x float]* @aPriori1, i64 0, i64 %indvar.i
  %30 = load float* %scevgep.i, align 4
  %31 = fmul float %30, -4.000000e+00
  %32 = fmul float %27, %31
  store float %32, float* %scevgep7.i, align 4
  %indvar.next.i = add i64 %indvar.i, 1
  %exitcond11 = icmp eq i64 %indvar.next.i, %tmp6.i
  br i1 %exitcond11, label %._crit_edge.i, label %29

._crit_edge.i:                                    ; preds = %29
  br i1 %24, label %initialize_aPriori1.exit, label %bb.nph.i.i.preheader

bb.nph.i.i.preheader:                             ; preds = %._crit_edge.i
  br label %bb.nph.i.i

bb.nph.i.i:                                       ; preds = %bb.nph.i.i, %bb.nph.i.i.preheader
  %indvar.i.i = phi i64 [ %tmp68, %bb.nph.i.i ], [ 0, %bb.nph.i.i.preheader ]
  %scevgep.i.i = getelementptr [512 x float]* @aPriori1, i64 0, i64 %indvar.i.i
  %tmp9 = add i64 %indvar.i.i, 1
  %tmp2.i.i = trunc i64 %tmp9 to i32
  %tmp68 = add i64 %indvar.i.i, 1
  %33 = load float* %scevgep.i.i, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), float %33) nounwind
  %34 = load i16* @ncols, align 2
  %35 = zext i16 %34 to i32
  %36 = icmp slt i32 %tmp2.i.i, %35
  br i1 %36, label %bb.nph.i.i, label %initialize_aPriori1.exit.loopexit

initialize_aPriori1.exit.loopexit:                ; preds = %bb.nph.i.i
  br label %initialize_aPriori1.exit

initialize_aPriori1.exit:                         ; preds = %initialize_aPriori1.exit.loopexit, %._crit_edge.i, %readCodeBlock.exit
  %37 = load i16* @ncol_ind_11, align 2
  %38 = icmp eq i16 %37, 0
  br i1 %38, label %initializeMessage11.exit, label %bb.nph.i4

bb.nph.i4:                                        ; preds = %initialize_aPriori1.exit
  %tmp.i2 = icmp ugt i16 %37, 1
  %.op.i3 = add i16 %37, -1
  %39 = zext i16 %.op.i3 to i64
  %.op7.i = add i64 %39, 1
  %tmp4.i = select i1 %tmp.i2, i64 %.op7.i, i64 1
  br label %40

; <label>:40                                      ; preds = %40, %bb.nph.i4
  %indvar.i5 = phi i64 [ 0, %bb.nph.i4 ], [ %indvar.next.i7, %40 ]
  %scevgep.i6 = getelementptr [512 x float]* @message11, i64 0, i64 %indvar.i5
  %tmp8 = add i64 %indvar.i5, 3
  %scevgep6.i = getelementptr [512 x i16]* @mem11, i64 0, i64 %tmp8
  %41 = load i16* %scevgep6.i, align 2
  %42 = add i16 %41, -1
  %43 = zext i16 %42 to i64
  %44 = getelementptr inbounds [512 x float]* @aPriori1, i64 0, i64 %43
  %45 = load float* %44, align 4
  store float %45, float* %scevgep.i6, align 4
  %indvar.next.i7 = add i64 %indvar.i5, 1
  %exitcond7 = icmp eq i64 %indvar.next.i7, %tmp4.i
  br i1 %exitcond7, label %initializeMessage11.exit.loopexit, label %40

initializeMessage11.exit.loopexit:                ; preds = %40
  br label %initializeMessage11.exit

initializeMessage11.exit:                         ; preds = %initializeMessage11.exit.loopexit, %initialize_aPriori1.exit
  tail call void @write_uint8(i8* getelementptr inbounds ([22 x i8]* @.str26, i64 0, i64 0), i8 zeroext 1) nounwind
  %46 = load i16* @ncols, align 2
  %47 = icmp eq i16 %46, 0
  br i1 %47, label %initialize_aPosteriori1.exit, label %bb.nph.i13

bb.nph.i13:                                       ; preds = %initializeMessage11.exit
  %tmp.i10 = icmp ugt i16 %46, 1
  %.op.i11 = add i16 %46, -1
  %48 = zext i16 %.op.i11 to i64
  %.op6.i = add i64 %48, 1
  %tmp4.i12 = select i1 %tmp.i10, i64 %.op6.i, i64 1
  br label %49

; <label>:49                                      ; preds = %49, %bb.nph.i13
  %indvar.i14 = phi i64 [ 0, %bb.nph.i13 ], [ %indvar.next.i16, %49 ]
  %scevgep.i15 = getelementptr [512 x float]* @aPriori1, i64 0, i64 %indvar.i14
  %scevgep5.i = getelementptr [512 x float]* @aPosteriori1, i64 0, i64 %indvar.i14
  %50 = load float* %scevgep.i15, align 4
  store float %50, float* %scevgep5.i, align 4
  %indvar.next.i16 = add i64 %indvar.i14, 1
  %exitcond6 = icmp eq i64 %indvar.next.i16, %tmp4.i12
  br i1 %exitcond6, label %initialize_aPosteriori1.exit.loopexit, label %49

initialize_aPosteriori1.exit.loopexit:            ; preds = %49
  br label %initialize_aPosteriori1.exit

initialize_aPosteriori1.exit:                     ; preds = %initialize_aPosteriori1.exit.loopexit, %initializeMessage11.exit
  %51 = load i16* @ncol_ind_11, align 2
  %52 = icmp eq i16 %51, 0
  br i1 %52, label %initializeTransInfo11_12.exit, label %bb.nph.i22

bb.nph.i22:                                       ; preds = %initialize_aPosteriori1.exit
  %tmp.i19 = icmp ugt i16 %51, 1
  %.op.i20 = add i16 %51, -1
  %53 = zext i16 %.op.i20 to i64
  %.op5.i = add i64 %53, 1
  %tmp4.i21 = select i1 %tmp.i19, i64 %.op5.i, i64 1
  br label %54

; <label>:54                                      ; preds = %54, %bb.nph.i22
  %indvar.i23 = phi i64 [ 0, %bb.nph.i22 ], [ %indvar.next.i25, %54 ]
  %scevgep.i24 = getelementptr [512 x float]* @ext_info11, i64 0, i64 %indvar.i23
  store float 0.000000e+00, float* %scevgep.i24, align 4
  %indvar.next.i25 = add i64 %indvar.i23, 1
  %exitcond4 = icmp eq i64 %indvar.next.i25, %tmp4.i21
  br i1 %exitcond4, label %bb.nph.i32.loopexit, label %54

bb.nph.i32.loopexit:                              ; preds = %54
  br label %bb.nph.i32

bb.nph.i32:                                       ; preds = %bb.nph.i32, %bb.nph.i32.loopexit
  %indvar.i33 = phi i64 [ %indvar.next.i35, %bb.nph.i32 ], [ 0, %bb.nph.i32.loopexit ]
  %scevgep.i34 = getelementptr [512 x float]* @trans_info11_12, i64 0, i64 %indvar.i33
  store float 0.000000e+00, float* %scevgep.i34, align 4
  %indvar.next.i35 = add i64 %indvar.i33, 1
  %exitcond5 = icmp eq i64 %indvar.next.i35, %tmp4.i21
  br i1 %exitcond5, label %initializeTransInfo11_12.exit.loopexit, label %bb.nph.i32

initializeTransInfo11_12.exit.loopexit:           ; preds = %bb.nph.i32
  br label %initializeTransInfo11_12.exit

initializeTransInfo11_12.exit:                    ; preds = %initializeTransInfo11_12.exit.loopexit, %initialize_aPosteriori1.exit
  tail call void @checkNodeComputeEngine11()
  tail call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str27, i64 0, i64 0), i8 zeroext 1) nounwind
  %55 = tail call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str28, i64 0, i64 0)) nounwind
  tail call void @transverseCorrection11()
  br label %56

; <label>:56                                      ; preds = %56, %initializeTransInfo11_12.exit
  %indvar.i39 = phi i64 [ 0, %initializeTransInfo11_12.exit ], [ %indvar.next.i41, %56 ]
  %scevgep.i40 = getelementptr [512 x float]* @ext_info11, i64 0, i64 %indvar.i39
  %57 = load float* %scevgep.i40, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([15 x i8]* @.str16, i64 0, i64 0), float %57) nounwind
  %indvar.next.i41 = add i64 %indvar.i39, 1
  %exitcond = icmp eq i64 %indvar.next.i41, 4
  br i1 %exitcond, label %send_transverseCorrection11.exit, label %56

send_transverseCorrection11.exit:                 ; preds = %56
  %58 = tail call zeroext i8 @read_uint8(i8* getelementptr inbounds ([26 x i8]* @.str29, i64 0, i64 0)) nounwind
  %59 = load i16* @ncol_ind_11, align 2
  %60 = icmp eq i16 %59, 0
  br i1 %60, label %update_aPosteriori11.exit, label %bb.nph.i48

bb.nph.i48:                                       ; preds = %send_transverseCorrection11.exit
  %tmp.i44 = icmp ugt i16 %59, 1
  %.op.i45 = add i16 %59, -1
  %61 = zext i16 %.op.i45 to i64
  %.op7.i46 = add i64 %61, 1
  %tmp4.i47 = select i1 %tmp.i44, i64 %.op7.i46, i64 1
  br label %62

; <label>:62                                      ; preds = %62, %bb.nph.i48
  %indvar.i49 = phi i64 [ 0, %bb.nph.i48 ], [ %indvar.next.i53, %62 ]
  %scevgep.i50 = getelementptr [512 x float]* @ext_info11, i64 0, i64 %indvar.i49
  %tmp3 = add i64 %indvar.i49, 3
  %scevgep6.i52 = getelementptr [512 x i16]* @mem11, i64 0, i64 %tmp3
  %63 = load i16* %scevgep6.i52, align 2
  %64 = add i16 %63, -1
  %65 = load float* %scevgep.i50, align 4
  %66 = zext i16 %64 to i64
  %67 = getelementptr inbounds [512 x float]* @aPosteriori1, i64 0, i64 %66
  %68 = load float* %67, align 4
  %69 = fadd float %68, %65
  store float %69, float* %67, align 4
  %indvar.next.i53 = add i64 %indvar.i49, 1
  %exitcond2 = icmp eq i64 %indvar.next.i53, %tmp4.i47
  br i1 %exitcond2, label %update_aPosteriori11.exit.loopexit, label %62

update_aPosteriori11.exit.loopexit:               ; preds = %62
  br label %update_aPosteriori11.exit

update_aPosteriori11.exit:                        ; preds = %update_aPosteriori11.exit.loopexit, %send_transverseCorrection11.exit
  store i16 1, i16* @is_decoded_1, align 2
  %70 = load i16* @ncols, align 2
  %71 = icmp eq i16 %70, 0
  br i1 %71, label %checkIsdecoded1.exit, label %bb.nph.i60

bb.nph.i60:                                       ; preds = %update_aPosteriori11.exit
  %tmp.i56 = icmp ugt i16 %70, 1
  %.op.i57 = add i16 %70, -1
  %72 = zext i16 %.op.i57 to i64
  %.op6.i58 = add i64 %72, 1
  %tmp4.i59 = select i1 %tmp.i56, i64 %.op6.i58, i64 1
  br label %73

; <label>:73                                      ; preds = %91, %bb.nph.i60
  %indvar.i61 = phi i64 [ 0, %bb.nph.i60 ], [ %indvar.next.i64, %91 ]
  %scevgep.i62 = getelementptr [512 x float]* @aPosteriori1, i64 0, i64 %indvar.i61
  %scevgep5.i63 = getelementptr [512 x float]* @code_block1, i64 0, i64 %indvar.i61
  %74 = load float* %scevgep.i62, align 4
  %75 = fpext float %74 to double
  %76 = fcmp ogt double %75, 0.000000e+00
  br i1 %76, label %77, label %83

; <label>:77                                      ; preds = %73
  %78 = load float* %scevgep5.i63, align 4
  %79 = fpext float %78 to double
  %80 = fcmp ogt double %79, 0.000000e+00
  br i1 %80, label %81, label %82

; <label>:81                                      ; preds = %77
  store i16 0, i16* @is_decoded_1, align 2
  br label %82

; <label>:82                                      ; preds = %81, %77
  store float -1.000000e+00, float* %scevgep5.i63, align 4
  br label %91

; <label>:83                                      ; preds = %73
  %84 = fcmp olt double %75, 0.000000e+00
  br i1 %84, label %85, label %91

; <label>:85                                      ; preds = %83
  %86 = load float* %scevgep5.i63, align 4
  %87 = fpext float %86 to double
  %88 = fcmp olt double %87, 0.000000e+00
  br i1 %88, label %89, label %90

; <label>:89                                      ; preds = %85
  store i16 0, i16* @is_decoded_1, align 2
  br label %90

; <label>:90                                      ; preds = %89, %85
  store float 1.000000e+00, float* %scevgep5.i63, align 4
  br label %91

; <label>:91                                      ; preds = %90, %83, %82
  %indvar.next.i64 = add i64 %indvar.i61, 1
  %exitcond1 = icmp eq i64 %indvar.next.i64, %tmp4.i59
  br i1 %exitcond1, label %checkIsdecoded1.exit.loopexit, label %73

checkIsdecoded1.exit.loopexit:                    ; preds = %91
  br label %checkIsdecoded1.exit

checkIsdecoded1.exit:                             ; preds = %checkIsdecoded1.exit.loopexit, %update_aPosteriori11.exit
  %92 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([18 x i8]* @.str30, i64 0, i64 0)) nounwind
  %93 = load i16* @is_decoded_1, align 2
  %94 = icmp ne i16 %92, 0
  %not. = icmp ne i16 %93, 0
  %95 = and i1 %94, %not.
  %96 = zext i1 %95 to i16
  tail call void @write_uint16(i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0), i16 zeroext %96) nounwind
  br label %1
}

declare void @write_uint8(i8*, i8 zeroext)

declare zeroext i8 @read_uint8(i8*)

define void @top_daemon_2() noreturn nounwind {
  br label %1

; <label>:1                                       ; preds = %checkIsdecoded2.exit, %0
  %2 = tail call zeroext i8 @read_uint8(i8* getelementptr inbounds ([24 x i8]* @.str24, i64 0, i64 0)) nounwind
  %3 = load i16* @ncols, align 2
  %4 = icmp eq i16 %3, 0
  br i1 %4, label %initialize_aPriori2.exit, label %bb.nph.i

bb.nph.i:                                         ; preds = %1
  %5 = load float* @ebbyNo, align 4
  %6 = load float* @rate, align 4
  %7 = fmul float %6, %5
  %tmp3.i = icmp ugt i16 %3, 1
  %.op.i = add i16 %3, -1
  %8 = zext i16 %.op.i to i64
  %.op8.i = add i64 %8, 1
  %tmp6.i = select i1 %tmp3.i, i64 %.op8.i, i64 1
  br label %9

; <label>:9                                       ; preds = %9, %bb.nph.i
  %indvar.i = phi i64 [ 0, %bb.nph.i ], [ %indvar.next.i, %9 ]
  %scevgep.i = getelementptr [512 x float]* @code_block2, i64 0, i64 %indvar.i
  %scevgep7.i = getelementptr [512 x float]* @aPriori2, i64 0, i64 %indvar.i
  %10 = load float* %scevgep.i, align 4
  %11 = fmul float %10, -4.000000e+00
  %12 = fmul float %7, %11
  store float %12, float* %scevgep7.i, align 4
  %indvar.next.i = add i64 %indvar.i, 1
  %exitcond11 = icmp eq i64 %indvar.next.i, %tmp6.i
  br i1 %exitcond11, label %._crit_edge.i, label %9

._crit_edge.i:                                    ; preds = %9
  br i1 %4, label %initialize_aPriori2.exit, label %bb.nph.i.i.preheader

bb.nph.i.i.preheader:                             ; preds = %._crit_edge.i
  br label %bb.nph.i.i

bb.nph.i.i:                                       ; preds = %bb.nph.i.i, %bb.nph.i.i.preheader
  %indvar.i.i = phi i64 [ %tmp, %bb.nph.i.i ], [ 0, %bb.nph.i.i.preheader ]
  %scevgep.i.i = getelementptr [512 x float]* @aPriori2, i64 0, i64 %indvar.i.i
  %tmp9 = add i64 %indvar.i.i, 1
  %tmp2.i.i = trunc i64 %tmp9 to i32
  %tmp = add i64 %indvar.i.i, 1
  %13 = load float* %scevgep.i.i, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([13 x i8]* @.str1, i64 0, i64 0), float %13) nounwind
  %14 = load i16* @ncols, align 2
  %15 = zext i16 %14 to i32
  %16 = icmp slt i32 %tmp2.i.i, %15
  br i1 %16, label %bb.nph.i.i, label %initialize_aPriori2.exit.loopexit

initialize_aPriori2.exit.loopexit:                ; preds = %bb.nph.i.i
  br label %initialize_aPriori2.exit

initialize_aPriori2.exit:                         ; preds = %initialize_aPriori2.exit.loopexit, %._crit_edge.i, %1
  tail call void @write_uint8(i8* getelementptr inbounds ([18 x i8]* @.str25, i64 0, i64 0), i8 zeroext 1) nounwind
  %17 = load i16* @ncol_ind_12, align 2
  %18 = icmp eq i16 %17, 0
  br i1 %18, label %initializeMessage12.exit, label %bb.nph.i3

bb.nph.i3:                                        ; preds = %initialize_aPriori2.exit
  %tmp.i1 = icmp ugt i16 %17, 1
  %.op.i2 = add i16 %17, -1
  %19 = zext i16 %.op.i2 to i64
  %.op7.i = add i64 %19, 1
  %tmp4.i = select i1 %tmp.i1, i64 %.op7.i, i64 1
  br label %20

; <label>:20                                      ; preds = %20, %bb.nph.i3
  %indvar.i4 = phi i64 [ 0, %bb.nph.i3 ], [ %indvar.next.i6, %20 ]
  %scevgep.i5 = getelementptr [512 x float]* @message12, i64 0, i64 %indvar.i4
  %tmp8 = add i64 %indvar.i4, 3
  %scevgep6.i = getelementptr [512 x i16]* @mem12, i64 0, i64 %tmp8
  %21 = load i16* %scevgep6.i, align 2
  %22 = add i16 %21, -1
  %23 = zext i16 %22 to i64
  %24 = getelementptr inbounds [512 x float]* @aPriori2, i64 0, i64 %23
  %25 = load float* %24, align 4
  store float %25, float* %scevgep.i5, align 4
  %indvar.next.i6 = add i64 %indvar.i4, 1
  %exitcond7 = icmp eq i64 %indvar.next.i6, %tmp4.i
  br i1 %exitcond7, label %initializeMessage12.exit.loopexit, label %20

initializeMessage12.exit.loopexit:                ; preds = %20
  br label %initializeMessage12.exit

initializeMessage12.exit:                         ; preds = %initializeMessage12.exit.loopexit, %initialize_aPriori2.exit
  tail call void @write_uint8(i8* getelementptr inbounds ([22 x i8]* @.str32, i64 0, i64 0), i8 zeroext 1) nounwind
  %26 = load i16* @ncols, align 2
  %27 = icmp eq i16 %26, 0
  br i1 %27, label %initialize_aPosteriori2.exit, label %bb.nph.i40

bb.nph.i40:                                       ; preds = %initializeMessage12.exit
  %tmp.i36 = icmp ugt i16 %26, 1
  %.op.i37 = add i16 %26, -1
  %28 = zext i16 %.op.i37 to i64
  %.op6.i38 = add i64 %28, 1
  %tmp4.i39 = select i1 %tmp.i36, i64 %.op6.i38, i64 1
  br label %29

; <label>:29                                      ; preds = %29, %bb.nph.i40
  %indvar.i41 = phi i64 [ 0, %bb.nph.i40 ], [ %indvar.next.i44, %29 ]
  %scevgep.i42 = getelementptr [512 x float]* @aPriori2, i64 0, i64 %indvar.i41
  %scevgep5.i43 = getelementptr [512 x float]* @aPosteriori2, i64 0, i64 %indvar.i41
  %30 = load float* %scevgep.i42, align 4
  store float %30, float* %scevgep5.i43, align 4
  %indvar.next.i44 = add i64 %indvar.i41, 1
  %exitcond6 = icmp eq i64 %indvar.next.i44, %tmp4.i39
  br i1 %exitcond6, label %initialize_aPosteriori2.exit.loopexit, label %29

initialize_aPosteriori2.exit.loopexit:            ; preds = %29
  br label %initialize_aPosteriori2.exit

initialize_aPosteriori2.exit:                     ; preds = %initialize_aPosteriori2.exit.loopexit, %initializeMessage12.exit
  %31 = load i16* @ncol_ind_12, align 2
  %32 = icmp eq i16 %31, 0
  br i1 %32, label %initializeTransInfo12_11.exit, label %bb.nph.i50

bb.nph.i50:                                       ; preds = %initialize_aPosteriori2.exit
  %tmp.i47 = icmp ugt i16 %31, 1
  %.op.i48 = add i16 %31, -1
  %33 = zext i16 %.op.i48 to i64
  %.op5.i = add i64 %33, 1
  %tmp4.i49 = select i1 %tmp.i47, i64 %.op5.i, i64 1
  br label %34

; <label>:34                                      ; preds = %34, %bb.nph.i50
  %indvar.i51 = phi i64 [ 0, %bb.nph.i50 ], [ %indvar.next.i53, %34 ]
  %scevgep.i52 = getelementptr [512 x float]* @ext_info12, i64 0, i64 %indvar.i51
  store float 0.000000e+00, float* %scevgep.i52, align 4
  %indvar.next.i53 = add i64 %indvar.i51, 1
  %exitcond4 = icmp eq i64 %indvar.next.i53, %tmp4.i49
  br i1 %exitcond4, label %bb.nph.i60.loopexit, label %34

bb.nph.i60.loopexit:                              ; preds = %34
  br label %bb.nph.i60

bb.nph.i60:                                       ; preds = %bb.nph.i60, %bb.nph.i60.loopexit
  %indvar.i61 = phi i64 [ %indvar.next.i63, %bb.nph.i60 ], [ 0, %bb.nph.i60.loopexit ]
  %scevgep.i62 = getelementptr [512 x float]* @trans_info12_11, i64 0, i64 %indvar.i61
  store float 0.000000e+00, float* %scevgep.i62, align 4
  %indvar.next.i63 = add i64 %indvar.i61, 1
  %exitcond5 = icmp eq i64 %indvar.next.i63, %tmp4.i49
  br i1 %exitcond5, label %initializeTransInfo12_11.exit.loopexit, label %bb.nph.i60

initializeTransInfo12_11.exit.loopexit:           ; preds = %bb.nph.i60
  br label %initializeTransInfo12_11.exit

initializeTransInfo12_11.exit:                    ; preds = %initializeTransInfo12_11.exit.loopexit, %initialize_aPosteriori2.exit
  tail call void @checkNodeComputeEngine12()
  tail call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str28, i64 0, i64 0), i8 zeroext 1) nounwind
  %35 = tail call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str27, i64 0, i64 0)) nounwind
  tail call void @transverseCorrection12()
  br label %36

; <label>:36                                      ; preds = %36, %initializeTransInfo12_11.exit
  %indvar.i31 = phi i64 [ 0, %initializeTransInfo12_11.exit ], [ %indvar.next.i33, %36 ]
  %scevgep.i32 = getelementptr [512 x float]* @ext_info12, i64 0, i64 %indvar.i31
  %37 = load float* %scevgep.i32, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([15 x i8]* @.str17, i64 0, i64 0), float %37) nounwind
  %indvar.next.i33 = add i64 %indvar.i31, 1
  %exitcond = icmp eq i64 %indvar.next.i33, 2
  br i1 %exitcond, label %send_transverseCorrection12.exit, label %36

send_transverseCorrection12.exit:                 ; preds = %36
  %38 = tail call zeroext i8 @read_uint8(i8* getelementptr inbounds ([26 x i8]* @.str33, i64 0, i64 0)) nounwind
  %39 = load i16* @ncol_ind_12, align 2
  %40 = icmp eq i16 %39, 0
  br i1 %40, label %update_aPosteriori12.exit, label %bb.nph.i22

bb.nph.i22:                                       ; preds = %send_transverseCorrection12.exit
  %tmp.i18 = icmp ugt i16 %39, 1
  %.op.i19 = add i16 %39, -1
  %41 = zext i16 %.op.i19 to i64
  %.op7.i20 = add i64 %41, 1
  %tmp4.i21 = select i1 %tmp.i18, i64 %.op7.i20, i64 1
  br label %42

; <label>:42                                      ; preds = %42, %bb.nph.i22
  %indvar.i23 = phi i64 [ 0, %bb.nph.i22 ], [ %indvar.next.i27, %42 ]
  %scevgep.i24 = getelementptr [512 x float]* @ext_info12, i64 0, i64 %indvar.i23
  %tmp3 = add i64 %indvar.i23, 3
  %scevgep6.i26 = getelementptr [512 x i16]* @mem12, i64 0, i64 %tmp3
  %43 = load i16* %scevgep6.i26, align 2
  %44 = add i16 %43, -1
  %45 = load float* %scevgep.i24, align 4
  %46 = zext i16 %44 to i64
  %47 = getelementptr inbounds [512 x float]* @aPosteriori2, i64 0, i64 %46
  %48 = load float* %47, align 4
  %49 = fadd float %48, %45
  store float %49, float* %47, align 4
  %indvar.next.i27 = add i64 %indvar.i23, 1
  %exitcond2 = icmp eq i64 %indvar.next.i27, %tmp4.i21
  br i1 %exitcond2, label %update_aPosteriori12.exit.loopexit, label %42

update_aPosteriori12.exit.loopexit:               ; preds = %42
  br label %update_aPosteriori12.exit

update_aPosteriori12.exit:                        ; preds = %update_aPosteriori12.exit.loopexit, %send_transverseCorrection12.exit
  store i16 1, i16* @is_decoded_2, align 2
  %50 = load i16* @ncols, align 2
  %51 = icmp eq i16 %50, 0
  br i1 %51, label %checkIsdecoded2.exit, label %bb.nph.i12

bb.nph.i12:                                       ; preds = %update_aPosteriori12.exit
  %tmp.i9 = icmp ugt i16 %50, 1
  %.op.i10 = add i16 %50, -1
  %52 = zext i16 %.op.i10 to i64
  %.op6.i = add i64 %52, 1
  %tmp4.i11 = select i1 %tmp.i9, i64 %.op6.i, i64 1
  br label %53

; <label>:53                                      ; preds = %74, %bb.nph.i12
  %54 = phi i16 [ 1, %bb.nph.i12 ], [ %75, %74 ]
  %indvar.i13 = phi i64 [ 0, %bb.nph.i12 ], [ %indvar.next.i15, %74 ]
  %scevgep.i14 = getelementptr [512 x float]* @aPosteriori2, i64 0, i64 %indvar.i13
  %scevgep5.i = getelementptr [512 x float]* @code_block2, i64 0, i64 %indvar.i13
  %55 = load float* %scevgep.i14, align 4
  %56 = fpext float %55 to double
  %57 = fcmp ogt double %56, 0.000000e+00
  br i1 %57, label %58, label %65

; <label>:58                                      ; preds = %53
  %59 = load float* %scevgep5.i, align 4
  %60 = fpext float %59 to double
  %61 = fcmp ogt double %60, 0.000000e+00
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %58
  store i16 0, i16* @is_decoded_2, align 2
  br label %63

; <label>:63                                      ; preds = %62, %58
  %64 = phi i16 [ 0, %62 ], [ %54, %58 ]
  store float -1.000000e+00, float* %scevgep5.i, align 4
  br label %74

; <label>:65                                      ; preds = %53
  %66 = fcmp olt double %56, 0.000000e+00
  br i1 %66, label %67, label %74

; <label>:67                                      ; preds = %65
  %68 = load float* %scevgep5.i, align 4
  %69 = fpext float %68 to double
  %70 = fcmp olt double %69, 0.000000e+00
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %67
  store i16 0, i16* @is_decoded_2, align 2
  br label %72

; <label>:72                                      ; preds = %71, %67
  %73 = phi i16 [ 0, %71 ], [ %54, %67 ]
  store float 1.000000e+00, float* %scevgep5.i, align 4
  br label %74

; <label>:74                                      ; preds = %72, %65, %63
  %75 = phi i16 [ %73, %72 ], [ %54, %65 ], [ %64, %63 ]
  %indvar.next.i15 = add i64 %indvar.i13, 1
  %exitcond1 = icmp eq i64 %indvar.next.i15, %tmp4.i11
  br i1 %exitcond1, label %checkIsdecoded2.exit.loopexit, label %53

checkIsdecoded2.exit.loopexit:                    ; preds = %74
  %.lcssa = phi i16 [ %75, %74 ]
  br label %checkIsdecoded2.exit

checkIsdecoded2.exit:                             ; preds = %checkIsdecoded2.exit.loopexit, %update_aPosteriori12.exit
  %76 = phi i16 [ 1, %update_aPosteriori12.exit ], [ %.lcssa, %checkIsdecoded2.exit.loopexit ]
  tail call void @write_uint16(i8* getelementptr inbounds ([18 x i8]* @.str30, i64 0, i64 0), i16 zeroext %76) nounwind
  %77 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0)) nounwind
  tail call void @write_uint16(i8* getelementptr inbounds ([14 x i8]* @.str34, i64 0, i64 0), i16 zeroext %77) nounwind
  br label %1
}

define void @daemon_3() noreturn nounwind {
  br label %1

; <label>:1                                       ; preds = %update_aPosteriori21.exit, %0
  %2 = tail call zeroext i8 @read_uint8(i8* getelementptr inbounds ([22 x i8]* @.str26, i64 0, i64 0)) nounwind
  %3 = load i16* @ncol_ind_21, align 2
  %4 = icmp eq i16 %3, 0
  br i1 %4, label %initializeTransInfo21_22.exit, label %bb.nph.i

bb.nph.i:                                         ; preds = %1
  %tmp.i = icmp ugt i16 %3, 1
  %.op.i = add i16 %3, -1
  %5 = zext i16 %.op.i to i64
  %.op7.i = add i64 %5, 1
  %tmp4.i = select i1 %tmp.i, i64 %.op7.i, i64 1
  br label %6

; <label>:6                                       ; preds = %6, %bb.nph.i
  %indvar.i = phi i64 [ 0, %bb.nph.i ], [ %indvar.next.i, %6 ]
  %scevgep.i = getelementptr [512 x float]* @message21, i64 0, i64 %indvar.i
  %tmp4 = add i64 %indvar.i, 3
  %scevgep6.i = getelementptr [512 x i16]* @mem21, i64 0, i64 %tmp4
  %7 = load i16* %scevgep6.i, align 2
  %8 = add i16 %7, -1
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [512 x float]* @aPriori1, i64 0, i64 %9
  %11 = load float* %10, align 4
  store float %11, float* %scevgep.i, align 4
  %indvar.next.i = add i64 %indvar.i, 1
  %exitcond3 = icmp eq i64 %indvar.next.i, %tmp4.i
  br i1 %exitcond3, label %bb.nph.i20.loopexit, label %6

bb.nph.i20.loopexit:                              ; preds = %6
  br label %bb.nph.i20

bb.nph.i20:                                       ; preds = %bb.nph.i20, %bb.nph.i20.loopexit
  %indvar.i21 = phi i64 [ %indvar.next.i23, %bb.nph.i20 ], [ 0, %bb.nph.i20.loopexit ]
  %scevgep.i22 = getelementptr [512 x float]* @ext_info21, i64 0, i64 %indvar.i21
  store float 0.000000e+00, float* %scevgep.i22, align 4
  %indvar.next.i23 = add i64 %indvar.i21, 1
  %exitcond = icmp eq i64 %indvar.next.i23, %tmp4.i
  br i1 %exitcond, label %bb.nph.i29.loopexit, label %bb.nph.i20

bb.nph.i29.loopexit:                              ; preds = %bb.nph.i20
  br label %bb.nph.i29

bb.nph.i29:                                       ; preds = %bb.nph.i29, %bb.nph.i29.loopexit
  %indvar.i30 = phi i64 [ %indvar.next.i32, %bb.nph.i29 ], [ 0, %bb.nph.i29.loopexit ]
  %scevgep.i31 = getelementptr [512 x float]* @trans_info21_22, i64 0, i64 %indvar.i30
  store float 0.000000e+00, float* %scevgep.i31, align 4
  %indvar.next.i32 = add i64 %indvar.i30, 1
  %exitcond5 = icmp eq i64 %indvar.next.i32, %tmp4.i
  br i1 %exitcond5, label %initializeTransInfo21_22.exit.loopexit, label %bb.nph.i29

initializeTransInfo21_22.exit.loopexit:           ; preds = %bb.nph.i29
  br label %initializeTransInfo21_22.exit

initializeTransInfo21_22.exit:                    ; preds = %initializeTransInfo21_22.exit.loopexit, %1
  tail call void @checkNodeComputeEngine21()
  tail call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str35, i64 0, i64 0), i8 zeroext 1) nounwind
  %12 = tail call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str36, i64 0, i64 0)) nounwind
  tail call void @transverseCorrection21()
  br label %13

; <label>:13                                      ; preds = %13, %initializeTransInfo21_22.exit
  %indvar.i13 = phi i64 [ 0, %initializeTransInfo21_22.exit ], [ %indvar.next.i15, %13 ]
  %scevgep.i14 = getelementptr [512 x float]* @ext_info21, i64 0, i64 %indvar.i13
  %14 = load float* %scevgep.i14, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([15 x i8]* @.str18, i64 0, i64 0), float %14) nounwind
  %indvar.next.i15 = add i64 %indvar.i13, 1
  %exitcond6 = icmp eq i64 %indvar.next.i15, 3
  br i1 %exitcond6, label %send_transverseCorrection21.exit, label %13

send_transverseCorrection21.exit:                 ; preds = %13
  %15 = load i16* @ncol_ind_21, align 2
  %16 = icmp eq i16 %15, 0
  br i1 %16, label %update_aPosteriori21.exit, label %bb.nph.i5

bb.nph.i5:                                        ; preds = %send_transverseCorrection21.exit
  %tmp.i1 = icmp ugt i16 %15, 1
  %.op.i2 = add i16 %15, -1
  %17 = zext i16 %.op.i2 to i64
  %.op7.i3 = add i64 %17, 1
  %tmp4.i4 = select i1 %tmp.i1, i64 %.op7.i3, i64 1
  br label %18

; <label>:18                                      ; preds = %18, %bb.nph.i5
  %indvar.i6 = phi i64 [ 0, %bb.nph.i5 ], [ %indvar.next.i10, %18 ]
  %scevgep.i7 = getelementptr [512 x float]* @ext_info21, i64 0, i64 %indvar.i6
  %tmp2 = add i64 %indvar.i6, 3
  %scevgep6.i9 = getelementptr [512 x i16]* @mem21, i64 0, i64 %tmp2
  %19 = load i16* %scevgep6.i9, align 2
  %20 = add i16 %19, -1
  %21 = load float* %scevgep.i7, align 4
  %22 = zext i16 %20 to i64
  %23 = getelementptr inbounds [512 x float]* @aPosteriori1, i64 0, i64 %22
  %24 = load float* %23, align 4
  %25 = fadd float %24, %21
  store float %25, float* %23, align 4
  %indvar.next.i10 = add i64 %indvar.i6, 1
  %exitcond1 = icmp eq i64 %indvar.next.i10, %tmp4.i4
  br i1 %exitcond1, label %update_aPosteriori21.exit.loopexit, label %18

update_aPosteriori21.exit.loopexit:               ; preds = %18
  br label %update_aPosteriori21.exit

update_aPosteriori21.exit:                        ; preds = %update_aPosteriori21.exit.loopexit, %send_transverseCorrection21.exit
  tail call void @write_uint8(i8* getelementptr inbounds ([26 x i8]* @.str29, i64 0, i64 0), i8 zeroext 1) nounwind
  %26 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([14 x i8]* @.str34, i64 0, i64 0)) nounwind
  tail call void @write_uint16(i8* getelementptr inbounds ([14 x i8]* @.str37, i64 0, i64 0), i16 zeroext %26) nounwind
  br label %1
}

define void @daemon_4() noreturn nounwind {
  br label %send_aPosteriori.exit

send_aPosteriori.exit.loopexit:                   ; preds = %bb.nph.i5
  br label %send_aPosteriori.exit.backedge

send_aPosteriori.exit:                            ; preds = %send_aPosteriori.exit.backedge, %0
  %1 = tail call zeroext i8 @read_uint8(i8* getelementptr inbounds ([22 x i8]* @.str32, i64 0, i64 0)) nounwind
  %2 = load i16* @ncol_ind_22, align 2
  %3 = icmp eq i16 %2, 0
  br i1 %3, label %initializeTransInfo22_21.exit, label %bb.nph.i

bb.nph.i:                                         ; preds = %send_aPosteriori.exit
  %tmp.i = icmp ugt i16 %2, 1
  %.op.i = add i16 %2, -1
  %4 = zext i16 %.op.i to i64
  %.op7.i = add i64 %4, 1
  %tmp4.i = select i1 %tmp.i, i64 %.op7.i, i64 1
  br label %5

; <label>:5                                       ; preds = %5, %bb.nph.i
  %indvar.i = phi i64 [ 0, %bb.nph.i ], [ %indvar.next.i, %5 ]
  %scevgep.i = getelementptr [512 x float]* @message22, i64 0, i64 %indvar.i
  %tmp8 = add i64 %indvar.i, 3
  %scevgep6.i = getelementptr [512 x i16]* @mem22, i64 0, i64 %tmp8
  %6 = load i16* %scevgep6.i, align 2
  %7 = add i16 %6, -1
  %8 = zext i16 %7 to i64
  %9 = getelementptr inbounds [512 x float]* @aPriori2, i64 0, i64 %8
  %10 = load float* %9, align 4
  store float %10, float* %scevgep.i, align 4
  %indvar.next.i = add i64 %indvar.i, 1
  %exitcond7 = icmp eq i64 %indvar.next.i, %tmp4.i
  br i1 %exitcond7, label %bb.nph.i9.loopexit, label %5

bb.nph.i9.loopexit:                               ; preds = %5
  br label %bb.nph.i9

bb.nph.i9:                                        ; preds = %bb.nph.i9, %bb.nph.i9.loopexit
  %indvar.i10 = phi i64 [ %indvar.next.i12, %bb.nph.i9 ], [ 0, %bb.nph.i9.loopexit ]
  %scevgep.i11 = getelementptr [512 x float]* @ext_info22, i64 0, i64 %indvar.i10
  store float 0.000000e+00, float* %scevgep.i11, align 4
  %indvar.next.i12 = add i64 %indvar.i10, 1
  %exitcond = icmp eq i64 %indvar.next.i12, %tmp4.i
  br i1 %exitcond, label %bb.nph.i18.loopexit, label %bb.nph.i9

bb.nph.i18.loopexit:                              ; preds = %bb.nph.i9
  br label %bb.nph.i18

bb.nph.i18:                                       ; preds = %bb.nph.i18, %bb.nph.i18.loopexit
  %indvar.i19 = phi i64 [ %indvar.next.i21, %bb.nph.i18 ], [ 0, %bb.nph.i18.loopexit ]
  %scevgep.i20 = getelementptr [512 x float]* @trans_info22_21, i64 0, i64 %indvar.i19
  store float 0.000000e+00, float* %scevgep.i20, align 4
  %indvar.next.i21 = add i64 %indvar.i19, 1
  %exitcond9 = icmp eq i64 %indvar.next.i21, %tmp4.i
  br i1 %exitcond9, label %initializeTransInfo22_21.exit.loopexit, label %bb.nph.i18

initializeTransInfo22_21.exit.loopexit:           ; preds = %bb.nph.i18
  br label %initializeTransInfo22_21.exit

initializeTransInfo22_21.exit:                    ; preds = %initializeTransInfo22_21.exit.loopexit, %send_aPosteriori.exit
  tail call void @checkNodeComputeEngine22()
  tail call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str36, i64 0, i64 0), i8 zeroext 1) nounwind
  %11 = tail call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str35, i64 0, i64 0)) nounwind
  tail call void @transverseCorrection22()
  br label %12

; <label>:12                                      ; preds = %12, %initializeTransInfo22_21.exit
  %indvar.i29 = phi i64 [ 0, %initializeTransInfo22_21.exit ], [ %indvar.next.i31, %12 ]
  %scevgep.i30 = getelementptr [512 x float]* @ext_info22, i64 0, i64 %indvar.i29
  %13 = load float* %scevgep.i30, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([15 x i8]* @.str19, i64 0, i64 0), float %13) nounwind
  %indvar.next.i31 = add i64 %indvar.i29, 1
  %exitcond10 = icmp eq i64 %indvar.next.i31, 3
  br i1 %exitcond10, label %send_transverseCorrection22.exit, label %12

send_transverseCorrection22.exit:                 ; preds = %12
  %14 = load i16* @ncol_ind_22, align 2
  %15 = icmp eq i16 %14, 0
  br i1 %15, label %update_aPosteriori22.exit, label %bb.nph.i37

bb.nph.i37:                                       ; preds = %send_transverseCorrection22.exit
  %tmp.i33 = icmp ugt i16 %14, 1
  %.op.i34 = add i16 %14, -1
  %16 = zext i16 %.op.i34 to i64
  %.op7.i35 = add i64 %16, 1
  %tmp4.i36 = select i1 %tmp.i33, i64 %.op7.i35, i64 1
  br label %17

; <label>:17                                      ; preds = %17, %bb.nph.i37
  %indvar.i38 = phi i64 [ 0, %bb.nph.i37 ], [ %indvar.next.i42, %17 ]
  %scevgep.i39 = getelementptr [512 x float]* @ext_info22, i64 0, i64 %indvar.i38
  %tmp6 = add i64 %indvar.i38, 3
  %scevgep6.i41 = getelementptr [512 x i16]* @mem22, i64 0, i64 %tmp6
  %18 = load i16* %scevgep6.i41, align 2
  %19 = add i16 %18, -1
  %20 = load float* %scevgep.i39, align 4
  %21 = zext i16 %19 to i64
  %22 = getelementptr inbounds [512 x float]* @aPosteriori2, i64 0, i64 %21
  %23 = load float* %22, align 4
  %24 = fadd float %23, %20
  store float %24, float* %22, align 4
  %indvar.next.i42 = add i64 %indvar.i38, 1
  %exitcond5 = icmp eq i64 %indvar.next.i42, %tmp4.i36
  br i1 %exitcond5, label %update_aPosteriori22.exit.loopexit, label %17

update_aPosteriori22.exit.loopexit:               ; preds = %17
  br label %update_aPosteriori22.exit

update_aPosteriori22.exit:                        ; preds = %update_aPosteriori22.exit.loopexit, %send_transverseCorrection22.exit
  tail call void @write_uint8(i8* getelementptr inbounds ([26 x i8]* @.str33, i64 0, i64 0), i8 zeroext 1) nounwind
  %25 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([14 x i8]* @.str37, i64 0, i64 0)) nounwind
  br label %26

; <label>:26                                      ; preds = %26, %update_aPosteriori22.exit
  %indvar21.i = phi i64 [ 0, %update_aPosteriori22.exit ], [ %indvar.next22.i, %26 ]
  %scevgep24.i = getelementptr [512 x float]* @message11, i64 0, i64 %indvar21.i
  %27 = load float* %scevgep24.i, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([19 x i8]* @.str10, i64 0, i64 0), float %27) nounwind
  %indvar.next22.i = add i64 %indvar21.i, 1
  %exitcond11 = icmp eq i64 %indvar.next22.i, 4
  br i1 %exitcond11, label %bb.nph10.i.loopexit, label %26

bb.nph10.i.loopexit:                              ; preds = %26
  br label %bb.nph10.i

bb.nph10.i:                                       ; preds = %bb.nph10.i, %bb.nph10.i.loopexit
  %indvar17.i = phi i64 [ %indvar.next18.i, %bb.nph10.i ], [ 0, %bb.nph10.i.loopexit ]
  %scevgep20.i = getelementptr [512 x float]* @message12, i64 0, i64 %indvar17.i
  %28 = load float* %scevgep20.i, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([19 x i8]* @.str11, i64 0, i64 0), float %28) nounwind
  %indvar.next18.i = add i64 %indvar17.i, 1
  %exitcond12 = icmp eq i64 %indvar.next18.i, 2
  br i1 %exitcond12, label %bb.nph7.i.loopexit, label %bb.nph10.i

bb.nph7.i.loopexit:                               ; preds = %bb.nph10.i
  br label %bb.nph7.i

bb.nph7.i:                                        ; preds = %bb.nph7.i, %bb.nph7.i.loopexit
  %indvar13.i = phi i64 [ %indvar.next14.i, %bb.nph7.i ], [ 0, %bb.nph7.i.loopexit ]
  %scevgep16.i = getelementptr [512 x float]* @message21, i64 0, i64 %indvar13.i
  %29 = load float* %scevgep16.i, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([19 x i8]* @.str12, i64 0, i64 0), float %29) nounwind
  %indvar.next14.i = add i64 %indvar13.i, 1
  %exitcond13 = icmp eq i64 %indvar.next14.i, 3
  br i1 %exitcond13, label %bb.nph.i53.loopexit, label %bb.nph7.i

bb.nph.i53.loopexit:                              ; preds = %bb.nph7.i
  br label %bb.nph.i53

bb.nph.i53:                                       ; preds = %bb.nph.i53, %bb.nph.i53.loopexit
  %indvar.i49 = phi i64 [ %indvar.next.i51, %bb.nph.i53 ], [ 0, %bb.nph.i53.loopexit ]
  %scevgep.i50 = getelementptr [512 x float]* @message22, i64 0, i64 %indvar.i49
  %30 = load float* %scevgep.i50, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([19 x i8]* @.str13, i64 0, i64 0), float %30) nounwind
  %indvar.next.i51 = add i64 %indvar.i49, 1
  %exitcond14 = icmp eq i64 %indvar.next.i51, 3
  br i1 %exitcond14, label %send_message.exit.loopexit, label %bb.nph.i53

send_message.exit.loopexit:                       ; preds = %bb.nph.i53
  br label %send_message.exit

send_message.exit:                                ; preds = %send_message.exit, %send_message.exit.loopexit
  %indvar.i55 = phi i64 [ %indvar.next.i57, %send_message.exit ], [ 0, %send_message.exit.loopexit ]
  %scevgep.i56 = getelementptr [512 x float]* @trans_info11_12, i64 0, i64 %indvar.i55
  %31 = load float* %scevgep.i56, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([20 x i8]* @.str22, i64 0, i64 0), float %31) nounwind
  %indvar.next.i57 = add i64 %indvar.i55, 1
  %exitcond15 = icmp eq i64 %indvar.next.i57, 2
  br i1 %exitcond15, label %send_tens_info11_12.exit.loopexit, label %send_message.exit

send_tens_info11_12.exit.loopexit:                ; preds = %send_message.exit
  br label %send_tens_info11_12.exit

send_tens_info11_12.exit:                         ; preds = %send_tens_info11_12.exit, %send_tens_info11_12.exit.loopexit
  %indvar.i60 = phi i64 [ %indvar.next.i62, %send_tens_info11_12.exit ], [ 0, %send_tens_info11_12.exit.loopexit ]
  %scevgep.i61 = getelementptr [512 x float]* @trans_info12_11, i64 0, i64 %indvar.i60
  %32 = load float* %scevgep.i61, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([20 x i8]* @.str23, i64 0, i64 0), float %32) nounwind
  %indvar.next.i62 = add i64 %indvar.i60, 1
  %exitcond16 = icmp eq i64 %indvar.next.i62, 2
  br i1 %exitcond16, label %send_tens_info12_11.exit.loopexit, label %send_tens_info11_12.exit

send_tens_info12_11.exit.loopexit:                ; preds = %send_tens_info11_12.exit
  br label %send_tens_info12_11.exit

send_tens_info12_11.exit:                         ; preds = %send_tens_info12_11.exit, %send_tens_info12_11.exit.loopexit
  %indvar.i45 = phi i64 [ %indvar.next.i47, %send_tens_info12_11.exit ], [ 0, %send_tens_info12_11.exit.loopexit ]
  %scevgep.i46 = getelementptr [512 x float]* @trans_info21_22, i64 0, i64 %indvar.i45
  %33 = load float* %scevgep.i46, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([20 x i8]* @.str21, i64 0, i64 0), float %33) nounwind
  %indvar.next.i47 = add i64 %indvar.i45, 1
  %exitcond17 = icmp eq i64 %indvar.next.i47, 2
  br i1 %exitcond17, label %send_tens_info21_22.exit.loopexit, label %send_tens_info12_11.exit

send_tens_info21_22.exit.loopexit:                ; preds = %send_tens_info12_11.exit
  br label %send_tens_info21_22.exit

send_tens_info21_22.exit:                         ; preds = %send_tens_info21_22.exit, %send_tens_info21_22.exit.loopexit
  %indvar.i24 = phi i64 [ %indvar.next.i26, %send_tens_info21_22.exit ], [ 0, %send_tens_info21_22.exit.loopexit ]
  %scevgep.i25 = getelementptr [512 x float]* @trans_info22_21, i64 0, i64 %indvar.i24
  %34 = load float* %scevgep.i25, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([20 x i8]* @.str20, i64 0, i64 0), float %34) nounwind
  %indvar.next.i26 = add i64 %indvar.i24, 1
  %exitcond18 = icmp eq i64 %indvar.next.i26, 2
  br i1 %exitcond18, label %send_tens_info22_21.exit, label %send_tens_info21_22.exit

send_tens_info22_21.exit:                         ; preds = %send_tens_info21_22.exit
  %35 = load i16* @ncols, align 2
  %36 = icmp eq i16 %35, 0
  br i1 %36, label %send_aPosteriori.exit.backedge, label %bb.nph4.i.preheader

send_aPosteriori.exit.backedge:                   ; preds = %.preheader.i, %send_tens_info22_21.exit, %send_aPosteriori.exit.loopexit
  br label %send_aPosteriori.exit

bb.nph4.i.preheader:                              ; preds = %send_tens_info22_21.exit
  br label %bb.nph4.i

.preheader.i:                                     ; preds = %bb.nph4.i
  %.lcssa = phi i16 [ %39, %bb.nph4.i ]
  %37 = icmp eq i16 %.lcssa, 0
  br i1 %37, label %send_aPosteriori.exit.backedge, label %bb.nph.i5.preheader

bb.nph.i5.preheader:                              ; preds = %.preheader.i
  br label %bb.nph.i5

bb.nph4.i:                                        ; preds = %bb.nph4.i, %bb.nph4.i.preheader
  %indvar6.i = phi i64 [ %tmp66, %bb.nph4.i ], [ 0, %bb.nph4.i.preheader ]
  %scevgep8.i = getelementptr [512 x float]* @aPosteriori1, i64 0, i64 %indvar6.i
  %tmp3 = add i64 %indvar6.i, 1
  %tmp10.i = trunc i64 %tmp3 to i32
  %tmp66 = add i64 %indvar6.i, 1
  %38 = load float* %scevgep8.i, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([17 x i8]* @.str14, i64 0, i64 0), float %38) nounwind
  %39 = load i16* @ncols, align 2
  %40 = zext i16 %39 to i32
  %41 = icmp slt i32 %tmp10.i, %40
  br i1 %41, label %bb.nph4.i, label %.preheader.i

bb.nph.i5:                                        ; preds = %bb.nph.i5, %bb.nph.i5.preheader
  %indvar.i1 = phi i64 [ %tmp, %bb.nph.i5 ], [ 0, %bb.nph.i5.preheader ]
  %scevgep.i2 = getelementptr [512 x float]* @aPosteriori2, i64 0, i64 %indvar.i1
  %tmp1 = add i64 %indvar.i1, 1
  %tmp5.i4 = trunc i64 %tmp1 to i32
  %tmp = add i64 %indvar.i1, 1
  %42 = load float* %scevgep.i2, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([17 x i8]* @.str15, i64 0, i64 0), float %42) nounwind
  %43 = load i16* @ncols, align 2
  %44 = zext i16 %43 to i32
  %45 = icmp slt i32 %tmp5.i4, %44
  br i1 %45, label %bb.nph.i5, label %send_aPosteriori.exit.loopexit
}
