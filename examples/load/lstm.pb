
5
lstm_1_inputPlaceholder*
dtype0*
shape: 
P
lstm_1/random_uniform/shapeConst*
dtype0*
valueB"      
F
lstm_1/random_uniform/minConst*
dtype0*
valueB
 *��
F
lstm_1/random_uniform/maxConst*
dtype0*
valueB
 *�?
�
#lstm_1/random_uniform/RandomUniformRandomUniformlstm_1/random_uniform/shape*
dtype0*
seed2���*
seed���)*
T0
_
lstm_1/random_uniform/subSublstm_1/random_uniform/maxlstm_1/random_uniform/min*
T0
i
lstm_1/random_uniform/mulMul#lstm_1/random_uniform/RandomUniformlstm_1/random_uniform/sub*
T0
[
lstm_1/random_uniformAddlstm_1/random_uniform/mullstm_1/random_uniform/min*
T0
a
lstm_1/kernel
VariableV2*
dtype0*
shape
:*
	container *
shared_name 
�
lstm_1/kernel/AssignAssignlstm_1/kernellstm_1/random_uniform*
validate_shape(* 
_class
loc:@lstm_1/kernel*
use_locking(*
T0
X
lstm_1/kernel/readIdentitylstm_1/kernel* 
_class
loc:@lstm_1/kernel*
T0
�
%lstm_1/recurrent_kernel/initial_valueConst*
dtype0*�
value�B�"��4>:F����G ;>}�	��P�>�Ư;+� ��<u��'�>w{d��o���=����PǼu[?(B>��>>�<?�:�>���@s�zO�=󺻼��G�I:Ž���>��=qʾ�W9��?�:Cfr>0������=?�>��(�r��k�ڼ���M>:��=��>�I�>.<�;��u<�c?\1]�!��>�tv>ޣc�nS(>�׷��l���}�J�b>�W���X�=�A���CK=�<��'�^��=k���;�I=
k
lstm_1/recurrent_kernel
VariableV2*
dtype0*
shape
:*
	container *
shared_name 
�
lstm_1/recurrent_kernel/AssignAssignlstm_1/recurrent_kernel%lstm_1/recurrent_kernel/initial_value*
validate_shape(**
_class 
loc:@lstm_1/recurrent_kernel*
use_locking(*
T0
v
lstm_1/recurrent_kernel/readIdentitylstm_1/recurrent_kernel**
_class 
loc:@lstm_1/recurrent_kernel*
T0
=
lstm_1/ConstConst*
dtype0*
valueB*    
[
lstm_1/bias
VariableV2*
dtype0*
shape:*
	container *
shared_name 
�
lstm_1/bias/AssignAssignlstm_1/biaslstm_1/Const*
validate_shape(*
_class
loc:@lstm_1/bias*
use_locking(*
T0
R
lstm_1/bias/readIdentitylstm_1/bias*
_class
loc:@lstm_1/bias*
T0
?
lstm_1/PlaceholderPlaceholder*
dtype0*
shape:
�
lstm_1/AssignAssignlstm_1/biaslstm_1/Placeholder*
validate_shape(*
_class
loc:@lstm_1/bias*
use_locking( *
T0
`
lstm_1/initNoOp^lstm_1/kernel/Assign^lstm_1/recurrent_kernel/Assign^lstm_1/bias/Assign
O
lstm_1/strided_slice/stackConst*
dtype0*
valueB"        
Q
lstm_1/strided_slice/stack_1Const*
dtype0*
valueB"       
Q
lstm_1/strided_slice/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_sliceStridedSlicelstm_1/kernel/readlstm_1/strided_slice/stacklstm_1/strided_slice/stack_1lstm_1/strided_slice/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Q
lstm_1/strided_slice_1/stackConst*
dtype0*
valueB"       
S
lstm_1/strided_slice_1/stack_1Const*
dtype0*
valueB"       
S
lstm_1/strided_slice_1/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_slice_1StridedSlicelstm_1/kernel/readlstm_1/strided_slice_1/stacklstm_1/strided_slice_1/stack_1lstm_1/strided_slice_1/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Q
lstm_1/strided_slice_2/stackConst*
dtype0*
valueB"       
S
lstm_1/strided_slice_2/stack_1Const*
dtype0*
valueB"       
S
lstm_1/strided_slice_2/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_slice_2StridedSlicelstm_1/kernel/readlstm_1/strided_slice_2/stacklstm_1/strided_slice_2/stack_1lstm_1/strided_slice_2/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Q
lstm_1/strided_slice_3/stackConst*
dtype0*
valueB"       
S
lstm_1/strided_slice_3/stack_1Const*
dtype0*
valueB"        
S
lstm_1/strided_slice_3/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_slice_3StridedSlicelstm_1/kernel/readlstm_1/strided_slice_3/stacklstm_1/strided_slice_3/stack_1lstm_1/strided_slice_3/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Q
lstm_1/strided_slice_4/stackConst*
dtype0*
valueB"        
S
lstm_1/strided_slice_4/stack_1Const*
dtype0*
valueB"       
S
lstm_1/strided_slice_4/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_slice_4StridedSlicelstm_1/recurrent_kernel/readlstm_1/strided_slice_4/stacklstm_1/strided_slice_4/stack_1lstm_1/strided_slice_4/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Q
lstm_1/strided_slice_5/stackConst*
dtype0*
valueB"       
S
lstm_1/strided_slice_5/stack_1Const*
dtype0*
valueB"       
S
lstm_1/strided_slice_5/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_slice_5StridedSlicelstm_1/recurrent_kernel/readlstm_1/strided_slice_5/stacklstm_1/strided_slice_5/stack_1lstm_1/strided_slice_5/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Q
lstm_1/strided_slice_6/stackConst*
dtype0*
valueB"       
S
lstm_1/strided_slice_6/stack_1Const*
dtype0*
valueB"       
S
lstm_1/strided_slice_6/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_slice_6StridedSlicelstm_1/recurrent_kernel/readlstm_1/strided_slice_6/stacklstm_1/strided_slice_6/stack_1lstm_1/strided_slice_6/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Q
lstm_1/strided_slice_7/stackConst*
dtype0*
valueB"       
S
lstm_1/strided_slice_7/stack_1Const*
dtype0*
valueB"        
S
lstm_1/strided_slice_7/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_slice_7StridedSlicelstm_1/recurrent_kernel/readlstm_1/strided_slice_7/stacklstm_1/strided_slice_7/stack_1lstm_1/strided_slice_7/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
J
lstm_1/strided_slice_8/stackConst*
dtype0*
valueB: 
L
lstm_1/strided_slice_8/stack_1Const*
dtype0*
valueB:
L
lstm_1/strided_slice_8/stack_2Const*
dtype0*
valueB:
�
lstm_1/strided_slice_8StridedSlicelstm_1/bias/readlstm_1/strided_slice_8/stacklstm_1/strided_slice_8/stack_1lstm_1/strided_slice_8/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 
J
lstm_1/strided_slice_9/stackConst*
dtype0*
valueB:
L
lstm_1/strided_slice_9/stack_1Const*
dtype0*
valueB:
L
lstm_1/strided_slice_9/stack_2Const*
dtype0*
valueB:
�
lstm_1/strided_slice_9StridedSlicelstm_1/bias/readlstm_1/strided_slice_9/stacklstm_1/strided_slice_9/stack_1lstm_1/strided_slice_9/stack_2*
new_axis_mask *
Index0*

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 
K
lstm_1/strided_slice_10/stackConst*
dtype0*
valueB:
M
lstm_1/strided_slice_10/stack_1Const*
dtype0*
valueB:
M
lstm_1/strided_slice_10/stack_2Const*
dtype0*
valueB:
�
lstm_1/strided_slice_10StridedSlicelstm_1/bias/readlstm_1/strided_slice_10/stacklstm_1/strided_slice_10/stack_1lstm_1/strided_slice_10/stack_2*
new_axis_mask *
Index0*

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 
K
lstm_1/strided_slice_11/stackConst*
dtype0*
valueB:
M
lstm_1/strided_slice_11/stack_1Const*
dtype0*
valueB: 
M
lstm_1/strided_slice_11/stack_2Const*
dtype0*
valueB:
�
lstm_1/strided_slice_11StridedSlicelstm_1/bias/readlstm_1/strided_slice_11/stacklstm_1/strided_slice_11/stack_1lstm_1/strided_slice_11/stack_2*
new_axis_mask *
Index0*

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
5
lstm_1/zeros_like	ZerosLikelstm_1_input*
T0
Q
lstm_1/Sum/reduction_indicesConst*
dtype0*
valueB"      
h

lstm_1/SumSumlstm_1/zeros_likelstm_1/Sum/reduction_indices*
T0*
	keep_dims( *

Tidx0
H
lstm_1/ExpandDims/dimConst*
dtype0*
valueB :
���������
W
lstm_1/ExpandDims
ExpandDims
lstm_1/Sumlstm_1/ExpandDims/dim*

Tdim0*
T0
J
lstm_1/Tile/multiplesConst*
dtype0*
valueB"      
X
lstm_1/TileTilelstm_1/ExpandDimslstm_1/Tile/multiples*

Tmultiples0*
T0
N
lstm_1/transpose/permConst*
dtype0*!
valueB"          
X
lstm_1/transpose	Transposelstm_1_inputlstm_1/transpose/perm*
Tperm0*
T0
@
lstm_1/ShapeShapelstm_1/transpose*
out_type0*
T0
K
lstm_1/strided_slice_12/stackConst*
dtype0*
valueB: 
M
lstm_1/strided_slice_12/stack_1Const*
dtype0*
valueB:
M
lstm_1/strided_slice_12/stack_2Const*
dtype0*
valueB:
�
lstm_1/strided_slice_12StridedSlicelstm_1/Shapelstm_1/strided_slice_12/stacklstm_1/strided_slice_12/stack_1lstm_1/strided_slice_12/stack_2*
new_axis_mask *
Index0*

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
K
lstm_1/strided_slice_13/stackConst*
dtype0*
valueB: 
M
lstm_1/strided_slice_13/stack_1Const*
dtype0*
valueB:
M
lstm_1/strided_slice_13/stack_2Const*
dtype0*
valueB:
�
lstm_1/strided_slice_13StridedSlicelstm_1/transposelstm_1/strided_slice_13/stacklstm_1/strided_slice_13/stack_1lstm_1/strided_slice_13/stack_2*
new_axis_mask *
Index0*

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
9
lstm_1/mul/yConst*
dtype0*
valueB
 *  �?
A

lstm_1/mulMullstm_1/strided_slice_13lstm_1/mul/y*
T0
f
lstm_1/MatMulMatMul
lstm_1/mullstm_1/kernel/read*
transpose_b( *
transpose_a( *
T0
;
lstm_1/mul_1/yConst*
dtype0*
valueB
 *  �?
9
lstm_1/mul_1Mullstm_1/Tilelstm_1/mul_1/y*
T0
t
lstm_1/MatMul_1MatMullstm_1/mul_1lstm_1/recurrent_kernel/read*
transpose_b( *
transpose_a( *
T0
:

lstm_1/addAddlstm_1/MatMullstm_1/MatMul_1*
T0
W
lstm_1/BiasAddBiasAdd
lstm_1/addlstm_1/bias/read*
T0*
data_formatNHWC
R
lstm_1/strided_slice_14/stackConst*
dtype0*
valueB"        
T
lstm_1/strided_slice_14/stack_1Const*
dtype0*
valueB"       
T
lstm_1/strided_slice_14/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_slice_14StridedSlicelstm_1/BiasAddlstm_1/strided_slice_14/stacklstm_1/strided_slice_14/stack_1lstm_1/strided_slice_14/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
R
lstm_1/strided_slice_15/stackConst*
dtype0*
valueB"       
T
lstm_1/strided_slice_15/stack_1Const*
dtype0*
valueB"       
T
lstm_1/strided_slice_15/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_slice_15StridedSlicelstm_1/BiasAddlstm_1/strided_slice_15/stacklstm_1/strided_slice_15/stack_1lstm_1/strided_slice_15/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
R
lstm_1/strided_slice_16/stackConst*
dtype0*
valueB"       
T
lstm_1/strided_slice_16/stack_1Const*
dtype0*
valueB"       
T
lstm_1/strided_slice_16/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_slice_16StridedSlicelstm_1/BiasAddlstm_1/strided_slice_16/stacklstm_1/strided_slice_16/stack_1lstm_1/strided_slice_16/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
R
lstm_1/strided_slice_17/stackConst*
dtype0*
valueB"       
T
lstm_1/strided_slice_17/stack_1Const*
dtype0*
valueB"        
T
lstm_1/strided_slice_17/stack_2Const*
dtype0*
valueB"      
�
lstm_1/strided_slice_17StridedSlicelstm_1/BiasAddlstm_1/strided_slice_17/stacklstm_1/strided_slice_17/stack_1lstm_1/strided_slice_17/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
;
lstm_1/mul_2/xConst*
dtype0*
valueB
 *��L>
E
lstm_1/mul_2Mullstm_1/mul_2/xlstm_1/strided_slice_14*
T0
;
lstm_1/add_1/yConst*
dtype0*
valueB
 *   ?
:
lstm_1/add_1Addlstm_1/mul_2lstm_1/add_1/y*
T0
;
lstm_1/Const_1Const*
dtype0*
valueB
 *    
;
lstm_1/Const_2Const*
dtype0*
valueB
 *  �?
N
lstm_1/clip_by_value/MinimumMinimumlstm_1/add_1lstm_1/Const_2*
T0
V
lstm_1/clip_by_valueMaximumlstm_1/clip_by_value/Minimumlstm_1/Const_1*
T0
;
lstm_1/mul_3/xConst*
dtype0*
valueB
 *��L>
E
lstm_1/mul_3Mullstm_1/mul_3/xlstm_1/strided_slice_15*
T0
;
lstm_1/add_2/yConst*
dtype0*
valueB
 *   ?
:
lstm_1/add_2Addlstm_1/mul_3lstm_1/add_2/y*
T0
;
lstm_1/Const_3Const*
dtype0*
valueB
 *    
;
lstm_1/Const_4Const*
dtype0*
valueB
 *  �?
P
lstm_1/clip_by_value_1/MinimumMinimumlstm_1/add_2lstm_1/Const_4*
T0
Z
lstm_1/clip_by_value_1Maximumlstm_1/clip_by_value_1/Minimumlstm_1/Const_3*
T0
A
lstm_1/mul_4Mullstm_1/clip_by_value_1lstm_1/Tile*
T0
5
lstm_1/TanhTanhlstm_1/strided_slice_16*
T0
?
lstm_1/mul_5Mullstm_1/clip_by_valuelstm_1/Tanh*
T0
8
lstm_1/add_3Addlstm_1/mul_4lstm_1/mul_5*
T0
;
lstm_1/mul_6/xConst*
dtype0*
valueB
 *��L>
E
lstm_1/mul_6Mullstm_1/mul_6/xlstm_1/strided_slice_17*
T0
;
lstm_1/add_4/yConst*
dtype0*
valueB
 *   ?
:
lstm_1/add_4Addlstm_1/mul_6lstm_1/add_4/y*
T0
;
lstm_1/Const_5Const*
dtype0*
valueB
 *    
;
lstm_1/Const_6Const*
dtype0*
valueB
 *  �?
P
lstm_1/clip_by_value_2/MinimumMinimumlstm_1/add_4lstm_1/Const_6*
T0
Z
lstm_1/clip_by_value_2Maximumlstm_1/clip_by_value_2/Minimumlstm_1/Const_5*
T0
,
lstm_1/Tanh_1Tanhlstm_1/add_3*
T0
C
lstm_1/mul_7Mullstm_1/clip_by_value_2lstm_1/Tanh_1*
T0
�
lstm_1/TensorArrayTensorArrayV3lstm_1/strided_slice_12*
dtype0*
clear_after_read(* 
tensor_array_name	output_ta*
dynamic_size( *
element_shape:
�
lstm_1/TensorArray_1TensorArrayV3lstm_1/strided_slice_12*
dtype0*
clear_after_read(*
tensor_array_name
input_ta*
dynamic_size( *
element_shape:
S
lstm_1/TensorArrayUnstack/ShapeShapelstm_1/transpose*
out_type0*
T0
[
-lstm_1/TensorArrayUnstack/strided_slice/stackConst*
dtype0*
valueB: 
]
/lstm_1/TensorArrayUnstack/strided_slice/stack_1Const*
dtype0*
valueB:
]
/lstm_1/TensorArrayUnstack/strided_slice/stack_2Const*
dtype0*
valueB:
�
'lstm_1/TensorArrayUnstack/strided_sliceStridedSlicelstm_1/TensorArrayUnstack/Shape-lstm_1/TensorArrayUnstack/strided_slice/stack/lstm_1/TensorArrayUnstack/strided_slice/stack_1/lstm_1/TensorArrayUnstack/strided_slice/stack_2*
new_axis_mask *
Index0*

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
O
%lstm_1/TensorArrayUnstack/range/startConst*
dtype0*
value	B : 
O
%lstm_1/TensorArrayUnstack/range/deltaConst*
dtype0*
value	B :
�
lstm_1/TensorArrayUnstack/rangeRange%lstm_1/TensorArrayUnstack/range/start'lstm_1/TensorArrayUnstack/strided_slice%lstm_1/TensorArrayUnstack/range/delta*

Tidx0
�
Alstm_1/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3lstm_1/TensorArray_1lstm_1/TensorArrayUnstack/rangelstm_1/transposelstm_1/TensorArray_1:1*'
_class
loc:@lstm_1/TensorArray_1*
T0
5
lstm_1/timeConst*
dtype0*
value	B : 
�
lstm_1/while/EnterEnterlstm_1/time*
is_constant( *
T0**

frame_namelstm_1/while/lstm_1/while/*
parallel_iterations 
�
lstm_1/while/Enter_1Enterlstm_1/TensorArray:1*
is_constant( *
T0**

frame_namelstm_1/while/lstm_1/while/*
parallel_iterations 
�
lstm_1/while/Enter_2Enterlstm_1/Tile*
is_constant( *
T0**

frame_namelstm_1/while/lstm_1/while/*
parallel_iterations 
�
lstm_1/while/Enter_3Enterlstm_1/Tile*
is_constant( *
T0**

frame_namelstm_1/while/lstm_1/while/*
parallel_iterations 
]
lstm_1/while/MergeMergelstm_1/while/Enterlstm_1/while/NextIteration*
T0*
N
c
lstm_1/while/Merge_1Mergelstm_1/while/Enter_1lstm_1/while/NextIteration_1*
T0*
N
c
lstm_1/while/Merge_2Mergelstm_1/while/Enter_2lstm_1/while/NextIteration_2*
T0*
N
c
lstm_1/while/Merge_3Mergelstm_1/while/Enter_3lstm_1/while/NextIteration_3*
T0*
N
�
lstm_1/while/Less/EnterEnterlstm_1/strided_slice_12*
is_constant(*
T0**

frame_namelstm_1/while/lstm_1/while/*
parallel_iterations 
O
lstm_1/while/LessLesslstm_1/while/Mergelstm_1/while/Less/Enter*
T0
4
lstm_1/while/LoopCondLoopCondlstm_1/while/Less
x
lstm_1/while/SwitchSwitchlstm_1/while/Mergelstm_1/while/LoopCond*%
_class
loc:@lstm_1/while/Merge*
T0
~
lstm_1/while/Switch_1Switchlstm_1/while/Merge_1lstm_1/while/LoopCond*'
_class
loc:@lstm_1/while/Merge_1*
T0
~
lstm_1/while/Switch_2Switchlstm_1/while/Merge_2lstm_1/while/LoopCond*'
_class
loc:@lstm_1/while/Merge_2*
T0
~
lstm_1/while/Switch_3Switchlstm_1/while/Merge_3lstm_1/while/LoopCond*'
_class
loc:@lstm_1/while/Merge_3*
T0
A
lstm_1/while/IdentityIdentitylstm_1/while/Switch:1*
T0
E
lstm_1/while/Identity_1Identitylstm_1/while/Switch_1:1*
T0
E
lstm_1/while/Identity_2Identitylstm_1/while/Switch_2:1*
T0
E
lstm_1/while/Identity_3Identitylstm_1/while/Switch_3:1*
T0
�
$lstm_1/while/TensorArrayReadV3/EnterEnterlstm_1/TensorArray_1*'
_class
loc:@lstm_1/TensorArray_1*
is_constant(*
T0**

frame_namelstm_1/while/lstm_1/while/*
parallel_iterations 
�
&lstm_1/while/TensorArrayReadV3/Enter_1EnterAlstm_1/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*'
_class
loc:@lstm_1/TensorArray_1*
is_constant(*
T0**

frame_namelstm_1/while/lstm_1/while/*
parallel_iterations 
�
lstm_1/while/TensorArrayReadV3TensorArrayReadV3$lstm_1/while/TensorArrayReadV3/Enterlstm_1/while/Identity&lstm_1/while/TensorArrayReadV3/Enter_1*
dtype0*'
_class
loc:@lstm_1/TensorArray_1
W
lstm_1/while/mul/yConst^lstm_1/while/Identity*
dtype0*
valueB
 *  �?
T
lstm_1/while/mulMullstm_1/while/TensorArrayReadV3lstm_1/while/mul/y*
T0
�
lstm_1/while/MatMul/EnterEnterlstm_1/kernel/read*
is_constant(*
T0**

frame_namelstm_1/while/lstm_1/while/*
parallel_iterations 
y
lstm_1/while/MatMulMatMullstm_1/while/mullstm_1/while/MatMul/Enter*
transpose_b( *
transpose_a( *
T0
Y
lstm_1/while/mul_1/yConst^lstm_1/while/Identity*
dtype0*
valueB
 *  �?
Q
lstm_1/while/mul_1Mullstm_1/while/Identity_2lstm_1/while/mul_1/y*
T0
�
lstm_1/while/MatMul_1/EnterEnterlstm_1/recurrent_kernel/read*
is_constant(*
T0**

frame_namelstm_1/while/lstm_1/while/*
parallel_iterations 

lstm_1/while/MatMul_1MatMullstm_1/while/mul_1lstm_1/while/MatMul_1/Enter*
transpose_b( *
transpose_a( *
T0
L
lstm_1/while/addAddlstm_1/while/MatMullstm_1/while/MatMul_1*
T0
�
lstm_1/while/BiasAdd/EnterEnterlstm_1/bias/read*
is_constant(*
T0**

frame_namelstm_1/while/lstm_1/while/*
parallel_iterations 
m
lstm_1/while/BiasAddBiasAddlstm_1/while/addlstm_1/while/BiasAdd/Enter*
T0*
data_formatNHWC
m
 lstm_1/while/strided_slice/stackConst^lstm_1/while/Identity*
dtype0*
valueB"        
o
"lstm_1/while/strided_slice/stack_1Const^lstm_1/while/Identity*
dtype0*
valueB"       
o
"lstm_1/while/strided_slice/stack_2Const^lstm_1/while/Identity*
dtype0*
valueB"      
�
lstm_1/while/strided_sliceStridedSlicelstm_1/while/BiasAdd lstm_1/while/strided_slice/stack"lstm_1/while/strided_slice/stack_1"lstm_1/while/strided_slice/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
o
"lstm_1/while/strided_slice_1/stackConst^lstm_1/while/Identity*
dtype0*
valueB"       
q
$lstm_1/while/strided_slice_1/stack_1Const^lstm_1/while/Identity*
dtype0*
valueB"       
q
$lstm_1/while/strided_slice_1/stack_2Const^lstm_1/while/Identity*
dtype0*
valueB"      
�
lstm_1/while/strided_slice_1StridedSlicelstm_1/while/BiasAdd"lstm_1/while/strided_slice_1/stack$lstm_1/while/strided_slice_1/stack_1$lstm_1/while/strided_slice_1/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
o
"lstm_1/while/strided_slice_2/stackConst^lstm_1/while/Identity*
dtype0*
valueB"       
q
$lstm_1/while/strided_slice_2/stack_1Const^lstm_1/while/Identity*
dtype0*
valueB"       
q
$lstm_1/while/strided_slice_2/stack_2Const^lstm_1/while/Identity*
dtype0*
valueB"      
�
lstm_1/while/strided_slice_2StridedSlicelstm_1/while/BiasAdd"lstm_1/while/strided_slice_2/stack$lstm_1/while/strided_slice_2/stack_1$lstm_1/while/strided_slice_2/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
o
"lstm_1/while/strided_slice_3/stackConst^lstm_1/while/Identity*
dtype0*
valueB"       
q
$lstm_1/while/strided_slice_3/stack_1Const^lstm_1/while/Identity*
dtype0*
valueB"        
q
$lstm_1/while/strided_slice_3/stack_2Const^lstm_1/while/Identity*
dtype0*
valueB"      
�
lstm_1/while/strided_slice_3StridedSlicelstm_1/while/BiasAdd"lstm_1/while/strided_slice_3/stack$lstm_1/while/strided_slice_3/stack_1$lstm_1/while/strided_slice_3/stack_2*
new_axis_mask *
Index0*

begin_mask*
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Y
lstm_1/while/mul_2/xConst^lstm_1/while/Identity*
dtype0*
valueB
 *��L>
T
lstm_1/while/mul_2Mullstm_1/while/mul_2/xlstm_1/while/strided_slice*
T0
Y
lstm_1/while/add_1/yConst^lstm_1/while/Identity*
dtype0*
valueB
 *   ?
L
lstm_1/while/add_1Addlstm_1/while/mul_2lstm_1/while/add_1/y*
T0
W
lstm_1/while/ConstConst^lstm_1/while/Identity*
dtype0*
valueB
 *    
Y
lstm_1/while/Const_1Const^lstm_1/while/Identity*
dtype0*
valueB
 *  �?
`
"lstm_1/while/clip_by_value/MinimumMinimumlstm_1/while/add_1lstm_1/while/Const_1*
T0
f
lstm_1/while/clip_by_valueMaximum"lstm_1/while/clip_by_value/Minimumlstm_1/while/Const*
T0
Y
lstm_1/while/mul_3/xConst^lstm_1/while/Identity*
dtype0*
valueB
 *��L>
V
lstm_1/while/mul_3Mullstm_1/while/mul_3/xlstm_1/while/strided_slice_1*
T0
Y
lstm_1/while/add_2/yConst^lstm_1/while/Identity*
dtype0*
valueB
 *   ?
L
lstm_1/while/add_2Addlstm_1/while/mul_3lstm_1/while/add_2/y*
T0
Y
lstm_1/while/Const_2Const^lstm_1/while/Identity*
dtype0*
valueB
 *    
Y
lstm_1/while/Const_3Const^lstm_1/while/Identity*
dtype0*
valueB
 *  �?
b
$lstm_1/while/clip_by_value_1/MinimumMinimumlstm_1/while/add_2lstm_1/while/Const_3*
T0
l
lstm_1/while/clip_by_value_1Maximum$lstm_1/while/clip_by_value_1/Minimumlstm_1/while/Const_2*
T0
Y
lstm_1/while/mul_4Mullstm_1/while/clip_by_value_1lstm_1/while/Identity_3*
T0
@
lstm_1/while/TanhTanhlstm_1/while/strided_slice_2*
T0
Q
lstm_1/while/mul_5Mullstm_1/while/clip_by_valuelstm_1/while/Tanh*
T0
J
lstm_1/while/add_3Addlstm_1/while/mul_4lstm_1/while/mul_5*
T0
Y
lstm_1/while/mul_6/xConst^lstm_1/while/Identity*
dtype0*
valueB
 *��L>
V
lstm_1/while/mul_6Mullstm_1/while/mul_6/xlstm_1/while/strided_slice_3*
T0
Y
lstm_1/while/add_4/yConst^lstm_1/while/Identity*
dtype0*
valueB
 *   ?
L
lstm_1/while/add_4Addlstm_1/while/mul_6lstm_1/while/add_4/y*
T0
Y
lstm_1/while/Const_4Const^lstm_1/while/Identity*
dtype0*
valueB
 *    
Y
lstm_1/while/Const_5Const^lstm_1/while/Identity*
dtype0*
valueB
 *  �?
b
$lstm_1/while/clip_by_value_2/MinimumMinimumlstm_1/while/add_4lstm_1/while/Const_5*
T0
l
lstm_1/while/clip_by_value_2Maximum$lstm_1/while/clip_by_value_2/Minimumlstm_1/while/Const_4*
T0
8
lstm_1/while/Tanh_1Tanhlstm_1/while/add_3*
T0
U
lstm_1/while/mul_7Mullstm_1/while/clip_by_value_2lstm_1/while/Tanh_1*
T0
�
6lstm_1/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterlstm_1/TensorArray*%
_class
loc:@lstm_1/TensorArray*
is_constant(*
T0**

frame_namelstm_1/while/lstm_1/while/*
parallel_iterations 
�
0lstm_1/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV36lstm_1/while/TensorArrayWrite/TensorArrayWriteV3/Enterlstm_1/while/Identitylstm_1/while/mul_7lstm_1/while/Identity_1*%
_class
loc:@lstm_1/TensorArray*
T0
V
lstm_1/while/add_5/yConst^lstm_1/while/Identity*
dtype0*
value	B :
O
lstm_1/while/add_5Addlstm_1/while/Identitylstm_1/while/add_5/y*
T0
H
lstm_1/while/NextIterationNextIterationlstm_1/while/add_5*
T0
h
lstm_1/while/NextIteration_1NextIteration0lstm_1/while/TensorArrayWrite/TensorArrayWriteV3*
T0
J
lstm_1/while/NextIteration_2NextIterationlstm_1/while/mul_7*
T0
J
lstm_1/while/NextIteration_3NextIterationlstm_1/while/add_3*
T0
7
lstm_1/while/ExitExitlstm_1/while/Switch*
T0
;
lstm_1/while/Exit_1Exitlstm_1/while/Switch_1*
T0
;
lstm_1/while/Exit_2Exitlstm_1/while/Switch_2*
T0
;
lstm_1/while/Exit_3Exitlstm_1/while/Switch_3*
T0
�
)lstm_1/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3lstm_1/TensorArraylstm_1/while/Exit_1*%
_class
loc:@lstm_1/TensorArray
t
#lstm_1/TensorArrayStack/range/startConst*
dtype0*%
_class
loc:@lstm_1/TensorArray*
value	B : 
t
#lstm_1/TensorArrayStack/range/deltaConst*
dtype0*%
_class
loc:@lstm_1/TensorArray*
value	B :
�
lstm_1/TensorArrayStack/rangeRange#lstm_1/TensorArrayStack/range/start)lstm_1/TensorArrayStack/TensorArraySizeV3#lstm_1/TensorArrayStack/range/delta*%
_class
loc:@lstm_1/TensorArray*

Tidx0
�
+lstm_1/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3lstm_1/TensorArraylstm_1/TensorArrayStack/rangelstm_1/while/Exit_1*
dtype0*%
_class
loc:@lstm_1/TensorArray*$
element_shape:���������
6
lstm_1/sub/yConst*
dtype0*
value	B :
;

lstm_1/subSublstm_1/while/Exitlstm_1/sub/y*
T0
�
lstm_1/TensorArrayReadV3TensorArrayReadV3lstm_1/TensorArray
lstm_1/sublstm_1/while/Exit_1*
dtype0*%
_class
loc:@lstm_1/TensorArray
P
lstm_1/transpose_1/permConst*
dtype0*!
valueB"          
{
lstm_1/transpose_1	Transpose+lstm_1/TensorArrayStack/TensorArrayGatherV3lstm_1/transpose_1/perm*
Tperm0*
T0
\
'time_distributed_1/random_uniform/shapeConst*
dtype0*
valueB"      
R
%time_distributed_1/random_uniform/minConst*
dtype0*
valueB
 *�7��
R
%time_distributed_1/random_uniform/maxConst*
dtype0*
valueB
 *�7�?
�
/time_distributed_1/random_uniform/RandomUniformRandomUniform'time_distributed_1/random_uniform/shape*
dtype0*
seed2���*
seed���)*
T0
�
%time_distributed_1/random_uniform/subSub%time_distributed_1/random_uniform/max%time_distributed_1/random_uniform/min*
T0
�
%time_distributed_1/random_uniform/mulMul/time_distributed_1/random_uniform/RandomUniform%time_distributed_1/random_uniform/sub*
T0

!time_distributed_1/random_uniformAdd%time_distributed_1/random_uniform/mul%time_distributed_1/random_uniform/min*
T0
m
time_distributed_1/kernel
VariableV2*
dtype0*
shape
:*
	container *
shared_name 
�
 time_distributed_1/kernel/AssignAssigntime_distributed_1/kernel!time_distributed_1/random_uniform*
validate_shape(*,
_class"
 loc:@time_distributed_1/kernel*
use_locking(*
T0
|
time_distributed_1/kernel/readIdentitytime_distributed_1/kernel*,
_class"
 loc:@time_distributed_1/kernel*
T0
I
time_distributed_1/ConstConst*
dtype0*
valueB*    
g
time_distributed_1/bias
VariableV2*
dtype0*
shape:*
	container *
shared_name 
�
time_distributed_1/bias/AssignAssigntime_distributed_1/biastime_distributed_1/Const*
validate_shape(**
_class 
loc:@time_distributed_1/bias*
use_locking(*
T0
v
time_distributed_1/bias/readIdentitytime_distributed_1/bias**
_class 
loc:@time_distributed_1/bias*
T0
U
 time_distributed_1/Reshape/shapeConst*
dtype0*
valueB"����   
r
time_distributed_1/ReshapeReshapelstm_1/transpose_1 time_distributed_1/Reshape/shape*
T0*
Tshape0
�
time_distributed_1/MatMulMatMultime_distributed_1/Reshapetime_distributed_1/kernel/read*
transpose_b( *
transpose_a( *
T0
~
time_distributed_1/BiasAddBiasAddtime_distributed_1/MatMultime_distributed_1/bias/read*
T0*
data_formatNHWC
J
time_distributed_1/SigmoidSigmoidtime_distributed_1/BiasAdd*
T0
[
"time_distributed_1/Reshape_1/shapeConst*
dtype0*!
valueB"����      
~
time_distributed_1/Reshape_1Reshapetime_distributed_1/Sigmoid"time_distributed_1/Reshape_1/shape*
T0*
Tshape0"