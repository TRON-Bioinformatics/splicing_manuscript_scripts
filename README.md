# splicing_manuscript_shell_scripts



## About

This repository contains shell script to run tools for splicing analysis as shown in Figure 1B of the manuscript. (https://doi.org/10.1101/2023.06.27.546494).
For a splice2neo example please refer to the splice2neo documentation (https://github.com/TRON-Bioinformatics/splice2neo)

| Step        | Sub-step        | Script      | Comment |
| ----------- | ----------- | ----------- | ----------- |
| Mutation calling | Mapping       | mutation_calling_01_mapping.sh       | |
|  Mutation calling  | Bam pre-processing        | mutation_calling_02_bam_processing.sh |  |
|  Mutation calling | Mutect2        | mutation_calling_03_mutect2.sh | |
| Splicing effect prediction | SpliceAI        | mutation_effect_01_spliceAI.sh |example script for one sample |
| Splicing effect prediction | MMsplice        | mutation_effect_02_MMsplice.sh |example script for one sample |
| Splicing detection | SplAdder        | splicing_detection_01_SplAdder.sh |example script for one sample |
| Splicing detection | LeafCutter        | splicing_detection_02_LeafCutter.sh |example script for one sample |
| EasyQuant | EasyQuant        | easyquant.sh |example script for one sample |

