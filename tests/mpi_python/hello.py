from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()

if rank == 0:
    print('Hello from the master process')
else:
    print(f'Hello from process {rank}')
