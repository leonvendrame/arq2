CC = gcc
FLAGS = -O3 -DMEDIUM_DATASET
FLAGS_2 = -I
UTILITIES_DIR = utilities/
RM = rm -f

TARGET = floyd-warshall

all:
	$(CC) $(FLAGS) $(FLAGS_2) $(UTILITIES_DIR) $(TARGET).c $(UTILITIES_DIR)polybench.c -o $(TARGET)

clean:
	$(RM) $(TARGET)
