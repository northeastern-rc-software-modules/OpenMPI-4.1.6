#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char** argv) {
    MPI_Init(NULL, NULL);

    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
    srand(time(NULL) * world_rank); // Ensure random numbers on all processes

    int local_count = 0;
    int global_count = 0;
    int flip = 1 << 24;
    double x, y, z;

    // Calculate hits within circle locally
    for (int i = 0; i < flip; i++) {
        x = (double)rand() / (double)RAND_MAX;
        y = (double)rand() / (double)RAND_MAX;
        z = sqrt((x*x) + (y*y));
        if (z <= 1.0) {
            local_count++;
        }
    }

    // Combine all local sums into the global sum
    MPI_Reduce(&local_count, &global_count, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

    // Process 0 calculates pi and prints the result
    if (world_rank == 0) {
        double pi = ((double)global_count / (double)(flip * world_rank)) * 4.0;
        printf("The estimated value of pi is %f\n", pi);
    }

    MPI_Finalize();
}
