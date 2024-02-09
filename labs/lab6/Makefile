CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o

all: build/lab6

build/lab6: build/lab6.o
	$(LL) -o build/lab6 build/lab6.o $(OBJ)

build/lab6.o: lab6.s
	$(CC) -g -o build/lab6.o lab6.s

clean:
	rm build/*.o
	rm build/lab6
