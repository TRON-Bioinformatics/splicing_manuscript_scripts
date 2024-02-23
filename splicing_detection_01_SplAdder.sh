#!/bin/bash

#===============================================================================
# Params to splicing detection with SplAdder for one sample 
#===============================================================================
project_dir=/path/project

fastq_R1=/path/fastq_R1.fastq
fastq_R2=/path/fastq_R2.fastq

outprefix=sample

#===============================================================================
# Run STAR
#===============================================================================

/code/STAR \
  --genomeDir /code/genome_SJ/ \
  --genomeLoad NoSharedMemory \
  --readFilesCommand 'gzip -d -f -c' \
  --readFilesIn $fastq_R1 $fastq_R2 \
  --outSAMmode Full \
  --outSAMattributes Standard \
  --outSAMunmapped None \
  --runThreadN 12 \
  --outFileNamePrefix $outprefix


#===============================================================================
# Run Samtools
#===============================================================================

samfile=$outprefix"Aligned.out.sam"
suffix=.out.sam
prefix=${samfile%"$suffix"}


/code/samtools view -bS $samfile > $prefix.out.bam
/code/samtools sort -o $prefix.out_sorted.bam -T ctrl1_temp $prefix.out.bam
/code/samtools index $prefix.out_sorted.bam


#===============================================================================
# Run SplAdder 
#===============================================================================

bamfile=$prefix.out_sorted.bam
annotation=path/annotation

# activate virtual env with SplAdder
source venv_spladder3/bin/activate

# single graphs
spladder build -o ${project_dir} \
  -a $annotation \
  -b ${bamfile} \
  --merge-strat single\
  --quantify-graph\
  --qmode single \
  --event-types exon_skip,intron_retention,alt_3prime,alt_5prime,mutex_exons\
  --output-txt\
  --ignore-mismatches