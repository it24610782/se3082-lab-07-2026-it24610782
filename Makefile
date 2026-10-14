CC = mpicc
CFLAGS = -Wall -O2

PROGS = sum_bcast sum_scatter sum_gather sum_reduce sum_allreduce sum_scan

all: $(PROGS)

sum_bcast: sum_bcast.c
	$(CC) $(CFLAGS) -o $@ $<

sum_scatter: sum_scatter.c
	$(CC) $(CFLAGS) -o $@ $<

sum_gather: sum_gather.c
	$(CC) $(CFLAGS) -o $@ $<

sum_reduce: sum_reduce.c
	$(CC) $(CFLAGS) -o $@ $<

sum_allreduce: sum_allreduce.c
	$(CC) $(CFLAGS) -o $@ $<

sum_scan: sum_scan.c
	$(CC) $(CFLAGS) -o $@ $<

run: all
	@echo "=== Running sum_bcast ==="
	mpirun --oversubscribe -np 4 ./sum_bcast
	@echo -e "\n=== Running sum_scatter ==="
	mpirun --oversubscribe -np 4 ./sum_scatter
	@echo -e "\n=== Running sum_gather ==="
	mpirun --oversubscribe -np 4 ./sum_gather
	@echo -e "\n=== Running sum_reduce ==="
	mpirun --oversubscribe -np 4 ./sum_reduce
	@echo -e "\n=== Running sum_allreduce ==="
	mpirun --oversubscribe -np 4 ./sum_allreduce
	@echo -e "\n=== Running sum_scan ==="
	mpirun --oversubscribe -np 4 ./sum_scan

clean:
	rm -f $(PROGS)
