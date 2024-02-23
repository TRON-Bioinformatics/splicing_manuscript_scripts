#!/bin/bash

#===============================================================================
# Params to re-quantication with EASYQUANT for one sample 
#===============================================================================
project_dir=/path/project

fastq_R1=/path/fastq_R1.fastq
fastq_R2=/path/fastq_R2.fastq

context_sequences=/path/context_sequences.txt

# EasyQuant 0.4.0
path_to_easyquant="/code/easyquant/easy_quant.py"

#===============================================================================
# Run EASYQUANT 
#===============================================================================

python $path_to_easyquant \
  --fq1 $fastq_R1 \
  --fq2 $fastq_R2 \
  -s $context_sequences \
  -o $project_dir \
  -d 10 \
  --interval_mode \
  -m star

