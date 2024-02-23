#!/usr/bin/sh

#===============================================================================
# Params
#===============================================================================

project_dir=/path/project
scratch_dir=/path/scratch

WES_sample_rep_id_to_processed_bams=/path/sample_bam_for_mutect2.tsv
ref=/path/reference.fasta

pon=/path/pon.vcf
gnomad=/path/gnomad.vcf.bgz

#===============================================================================
# Variant calling
#===============================================================================


nextflow run -resume -with-report -with-trace -with-timeline -with-dag \
   -work-dir $scratch_dir/mutect2_workdir \
   tron-bioinformatics/tronflow-mutect2 \
   --input_files $WES_sample_rep_id_to_processed_bams \
   --reference $ref \
   --gnomad $gnomad \
   --output $scratch_dir/mutect2 \
   -profile conda,standard \
   -r v1.2.0

#===============================================================================
# Filter for PASS only
#===============================================================================

OUT_VCFS=`ls -1 $scratch_dir/mutect2/*/*mutect2.vcf`

# get only snvs marked with pass (high confidence)
for vcf in $OUT_VCFS; do
   echo "INFO: Filter VCF file:" $vcf
   bcftools view -f 'PASS,.' $vcf > $vcf.pass.vcf
done
