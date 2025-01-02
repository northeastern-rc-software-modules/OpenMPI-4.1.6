from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()

if rank == 0:
    data = {'a': 1, 'b': 2, 'c': 3}
    comm.send(data, dest=1)
else:
    data = comm.recv(source=0)
    print(f'Received data {data} at process {rank}')
