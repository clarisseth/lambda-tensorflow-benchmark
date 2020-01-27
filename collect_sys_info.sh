#!/bin/sh
# Get info about your system
printf  "Distribution level\n"
lsb_release -a
printf "\n"
printf  "Kernel level\n"
uname -r
printf "\n"
printf "Tensorflow version\n"
conda list | grep tensorflow-gpu
printf "\n"
printf "WML-CE version\n"
conda list | grep powerai-release
printf "\n"
printf "CUDA version\n"
# nvcc --version
cat /usr/local/cuda/version.txt
printf "\n"
printf "Python version\n"
python --version 2>&1
printf "\n"
printf "GPU info\n"
nvidia-smi
printf "\n"
printf "CPU info\n"
