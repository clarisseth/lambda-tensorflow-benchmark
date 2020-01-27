#!/bin/sh
# This script launches the Lambda deep learning benchmarks - hardcoded for 1 iteration with 1 GPU
#./benchmark.sh 0 1 > out_1pass_1gpu.log 2>&1
#./report.sh *-*.logs 1 0
#grep 'total images' out_1pass_1gpu.log | awk 'BEGIN{s=1}{s=s*$3}END{print NR,s**(1.0/NR)}'
# if ok, change number of iterations and/or number of GPUs. Plan an hour of execution time per iteration.
ITER=2
NUMGPU=4
GPUS="0,1,2,3"
echo "Start run with  $ITER iterations with $NUMGPU GPU(s)"
./benchmark.sh ${GPUS} ${ITER} > out_${ITER}pass_${NUMGPU}gpu.log 2>&1
./report.sh *-*.logs ${ITER} ${GPUS}
grep 'total images' out_${ITER}pass_${GPUS}gpu.log | awk 'BEGIN{s = 0.}{s = s + log($3)}END{print NR, exp(s / NR)}
echo "End run"
