#!/bin/bash
#SBATCH -J fastqc       # Job Name
#SBATCH -o fastqc.o%j    # Output and error file name (%j expands to jobID)
#SBATCH -N 1
#SBATCH -n 1       # Total number of mpi tasks requested
#SBATCH -p normal       # Queue (partition) name -- normal, development, etc.
#SBATCH -t 00:10:00      # Run time (hh:mm:ss) - 1.5 hours
#SBATCH -A iPlant-Collabs      # Project_name

module load tacc-singularity
singularity pull shub://patrickvdb/fastqc-singularity

wget https://raw.githubusercontent.com/linsalrob/fastq-pair/master/test/left.fastq
singularity exec /work/02114/wonaya/singularity_cache/patrickvdb-fastqc-singularity-master-latest.simg fastqc left.fastq


