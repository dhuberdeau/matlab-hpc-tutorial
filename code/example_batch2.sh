#!/bin/bash
#SBATCH -J my_matlab_job
#SBATCH -c 4
#SBATCH -t 1:00:00
#SBATCH -p short

INPUT=10

module load Apps/Matlab/R2016b
matlab -nodisplay -nosplash -r example_batch($INPUT) < /dev/null