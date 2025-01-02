#!/bin/bash
#SBATCH --job-name=hello_world
#SBATCH --output=result_%j.txt
#SBATCH --ntasks=4
#SBATCH --time=10:00
#SBATCH --mem-per-cpu=2000

module load OpenMPI/4.1.6
mpicc send_rec.c -o send_rec
mpirun -n 4 ./send_rec
