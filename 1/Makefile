PROG = nbench
CC = gcc
CPPFLAGS = -DBASE_ITERATIONS=25
LDFLAGS  = -lm

all:
	$(CC) *.c $(CPPFLAGS) -o $(PROG) $(LDFLAGS)

clean:
	rm -f $(PROG)