CC = gcc
FLAGS = -O3
RM = rm -f

TARGET = flops-8

default: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(TARGET).c $(FLAGS) -o $(TARGET)

clean:
	$(RM) $(TARGET)
