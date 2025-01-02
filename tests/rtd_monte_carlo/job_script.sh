#!/bin/bash
#SBATCH --job-name=mpi_monte_carlo
#SBATCH --output=result_%j.txt
#SBATCH --ntasks=4
#SBATCH --time=10:00
#SBATCH --mem-per-cpu=2000

module load OpenMPI/4.1.6
mpicc monte_carlo.c -o monte_carlo
mpirun -n 4 ./monte_carlo
