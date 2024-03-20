# splicing_manuscript_shell_scripts


This repository contains shell scripts to document and reproduce the analysis steps described in the manuscript
[Lang et al. 2024, Prediction of tumor-specific splicing from somatic mutations as a source of neoantigen candidates](https://doi.org/10.1101/2023.06.27.546494) (see Figure 1B).

- The splice2neo R-package is documented here: https://github.com/TRON-Bioinformatics/splice2neo
- EasyQuant is available here: https://github.com/TRON-Bioinformatics/easyquant


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

