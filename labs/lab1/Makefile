CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o

all: build/lab1

build/lab1: build/lab1.o
	$(LL) -o build/lab1 build/lab1.o $(OBJ)

build/lab1.o: lab1.s
	$(CC) -g -o build/lab1.o lab1.s

clean:
	rm build/*.o
	rm build/lab1
