# !/bin/bash
metrics="sm__sass_thread_inst_executed_op_fadd_pred_on.sum,\
sm__sass_thread_inst_executed_op_ffma_pred_on.sum,\
sm__sass_thread_inst_executed_op_fmul_pred_on.sum,\
dram__bytes.sum"

python=/home/zelin/anaconda3/bin/python
alg=alexnet
ncu=nv-nsight-cu-cli

($ncu --profile-from-start off --metrics $metrics --target-processes all --csv \
$python main.py -a $alg ./imagenet-mini 2>&1 | tee output_${alg}.csv)