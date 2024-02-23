#!/usr/bin/sh


#===============================================================================
# Params
#===============================================================================

project_dir=/path/project
scratch_dir=/path/scratch
WES_sample_to_bam=path/sample_bam_for_preprocessing.tsv

ref=/path/reference.fasta
dbsnp=/path/dbsnp.vcf
known_indels1=/path/data/known_indels1
known_indels2=/path/data/known_indels2

#===============================================================================
# BAM processing
#===============================================================================

nextflow run -resume -with-report -with-trace -with-timeline -with-dag \
   -work-dir $scratch_dir/bam_processing_workdir \
   tron-bioinformatics/tronflow-bam-preprocessing \
   --input_files $WES_sample_to_bam \
   --reference $ref \
   --dbsnp $dbsnp \
   --known_indels1 $known_indels1 \
   --known_indels2 $known_indels2 \
   --skip_realignment true \
   --platform ILLUMINA \
   --output $scratch_dir/bam_processed \
   -profile conda,standard \
   -r v1.7.3
