#!/bin/sh

# See: https://github.com/Illumina/SpliceAI


#===============================================================================
# Params
#===============================================================================

in_vcf=/path/mutect2.vcf.pass.vcf
out_vcf=/path/vcf.pass.vcf.spliceAI.vcf

ref=/path/reference.fasta

#===============================================================================
# run spliceAI
#===============================================================================

# activate conda environment with SpliceAI
conda activate /path/splice_env

# run SpliceAI
spliceai \
    -I $in_vcf \
    -O $out_vcf \
    -R $genome_fa \
    -A grch37 \


conda deactivate