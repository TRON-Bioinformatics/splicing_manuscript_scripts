#!/bin/bash


#===============================================================================
# Params to splicing detection with Leafcutter for one sample 
#===============================================================================

fastq_R1=/path/fastq_R1.fastq
fastq_R2=/path/fastq_R2.fastq

outprefix=sample

#===============================================================================
# Run STAR
#===============================================================================

/code/STAR \
  --genomeDir /code/refs/genome_SJ/ \
  --genomeLoad NoSharedMemory \
  --twopassMode Basic \
  --outSAMstrandField intronMotif \
  --readFilesCommand 'gzip -d -f -c' \
  --readFilesIn $fastq_R1 $fastq_R2  \
  --runThreadN 12 \
  --outFileNamePrefix $outprefix"_" \
  --outSAMtype BAM Unsorted



#===============================================================================
# Run Leafcutter
#===============================================================================

bamfile=$outprefix"_"Aligned.out.sorted.bam
junc_file=$outprefix"_"Aligned.out.bam.junc

# s needs to be chosen based on onput file
/code/regtools junctions extract \
  -a 8 \
  -m 50 \
  -M 500000 \
  ${bamfile_sorted} \
  -o ${junc_file}  \
  -s 1

echo ${junc_file} >> test_juncfiles.txt



python /code/leafcutter_cluster_regtools.py \
  -j test_juncfiles.txt \
  -m 50 \
  -o $outprefix \
  -l 500000 \
  --checkchrom


