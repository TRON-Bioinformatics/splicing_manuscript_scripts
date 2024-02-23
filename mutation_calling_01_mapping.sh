#!/usr/bin/sh


#===============================================================================
# Params
#===============================================================================
project_dir=/path/project
scratch_dir=/path/scratch

# input for mapping
WES_bamid_to_fastq=/path/sample_fastq_for_bam.tsv

ref=/path/reference.fasta


#===============================================================================
# Mapping
#===============================================================================

nextflow run tron-bioinformatics/tronflow-bwa \
-with-report -with-trace -with-timeline -with-dag \
   -work-dir $scratch_dir/bam_workdir \
   --input_files $WES_bamid_to_fastq \
   --reference $ref \
   --output $scratch_dir/bam \
   -profile conda \
   -r v1.5.0

