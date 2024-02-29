CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o

all: build/lab7

build/lab7: build/lab7.o
	$(LL) -o build/lab7 build/lab7.o $(OBJ)

build/lab7.o: lab7.s
	$(CC) -g -o build/lab7.o lab7.s

clean:
	rm build/*.o
	rm build/lab7
