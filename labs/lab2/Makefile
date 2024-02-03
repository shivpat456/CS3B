CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o

all: build/lab2

build/lab2: build/lab2.o
	$(LL) -o build/lab2 build/lab2.o $(OBJ)

build/lab2.o: lab2.s
	$(CC) -g -o build/lab2.o lab2.s

clean:
	rm build/*.o
	rm build/lab2
