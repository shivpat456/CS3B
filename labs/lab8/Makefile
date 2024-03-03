CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o

all: build/lab8

build/lab8: build/lab8.o
	$(LL) -o build/lab8 build/lab8.o $(OBJ)

build/lab8.o: lab8.s
	$(CC) -g -o build/lab8.o lab8.s

clean:
	rm build/*.o
	rm build/lab8
