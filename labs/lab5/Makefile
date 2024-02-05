CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o

all: build/lab5

build/lab5: build/lab5.o
	$(LL) -o build/lab5 build/lab5.o $(OBJ)

build/lab5.o: lab5.s
	$(CC) -g -o build/lab5.o lab5.s

clean:
	rm build/*.o
	rm build/lab5
