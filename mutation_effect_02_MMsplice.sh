#!/bin/sh

# See:  https://github.com/gagneurlab/MMSplice_MTSplice


#===============================================================================
# Params
#===============================================================================

in_vcf=/path/mutect2.vcf.pass.vcf
out_file=/path/vcf.pass.vcf.mmsplice.csv

ref=/path/reference.fasta
gtf_file="/path/annotation"

#===============================================================================
# Run MMsplice
#===============================================================================

# activate conda environment with MMsplice
conda activate /path/splice_env

python run_mmsplice.py \
    -i ${in_vcf} \
    -o ${out_file} \
    -g $ref \
    -gtf $gtf_file

conda deactivate
