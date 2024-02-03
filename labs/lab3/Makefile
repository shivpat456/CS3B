CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o

all: build/lab3

build/lab3: build/lab3.o
	$(LL) -o build/lab3 build/lab3.o $(OBJ)

build/lab3.o: lab3.s
	$(CC) -g -o build/lab3.o lab3.s

clean:
	rm build/*.o
	rm build/lab3
