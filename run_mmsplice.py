#!/usr/bin/env python
"""
run_misplice.py is a simple wraper to start MMsplice from the commandline. 
See https://github.com/gagneurlab/MMSplice_MTSplice

"""
epilog="""
2020-06-06 Jonas Ibn-Salem, TRON gGmbH <jonas.ibn-salem@tron-mainz.de>
"""

# Import
import argparse
from mmsplice.vcf_dataloader import SplicingVCFDataloader
from mmsplice import MMSplice, predict_save
from mmsplice.utils import max_varEff

def run_mmsplice(vcf, gtf, fasta, csv):
  
  print("INFO: Executing `run_mmsplice.py` with the following input parameters:")
  print("INFO: vcf: " + vcf)
  print("INFO: gtf: " + gtf)
  print("INFO: fasta: " + fasta)
  print("INFO: csv: " + csv)
  
  # dataloader to load variants from vcf
  dl = SplicingVCFDataloader(gtf, fasta, vcf)
  
  # Specify model
  model = MMSplice()
  
  # predict and save to csv file
  predict_save(model, dl, csv, pathogenicity=True, splicing_efficiency=True)
  


def commandline():
    parser = argparse.ArgumentParser(description=__doc__, 
      formatter_class=argparse.RawDescriptionHelpFormatter, 
      epilog=epilog)
    
    parser.add_argument("-i", "--input_file", type=str, required=True, help="Input VCF file with variants.")
    parser.add_argument("-o", "--output_file", type=str, required=True, help="Ouput file in fomrat from MMsplice.")
    parser.add_argument("-g", "--genome_seq", type=str, required=True, help="Reference genome sequence in FASTA format.")
    parser.add_argument("-gtf", "--gtf_file", type=str, required=True, help="Reference GTF file with transcript annotations.")

    return parser.parse_args()


if __name__ == "__main__":

    args = commandline()
    
    run_mmsplice(
      args.input_file,
      args.gtf_file,
      args.genome_seq,
      args.output_file
    )
