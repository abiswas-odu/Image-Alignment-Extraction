#!/bin/bash

#SBATCH --job-name=hist
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=16G
#SBATCH --time=02:00:00
##SBATCH --mail-type=end
##SBATCH --mail-user=ddenberg@princeton.edu
#SBATCH -A molbio

module purge
module load matlab/R2023a

HISTONE_KLB="/scratch/gpfs/ddenberg/231214_stack9/histone"
CDX2_KLB="/scratch/gpfs/ddenberg/231214_stack9/cdx2"

matlab -nodisplay -nosplash -r "../max_projection_across_time('${HISTONE_KLB}', 'histone_maxproj.h5', [0:120], 16)"

matlab -nodisplay -nosplash -r "../max_projection_across_time('${CDX2_KLB}', 'cdx2_maxproj.h5', [0:120], 16)"
