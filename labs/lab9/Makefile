CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o

all: build/lab9

build/lab9: build/lab9.o
	$(LL) -o build/lab9 build/lab9.o $(OBJ)

build/lab9.o: lab9.s
	$(CC) -g -o build/lab9.o lab9.s

clean:
	rm build/*.o
	rm build/lab9
