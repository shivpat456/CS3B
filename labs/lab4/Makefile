CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o

all: build/lab4

build/lab4: build/lab4.o
	$(LL) -o build/lab4 build/lab4.o $(OBJ)

build/lab4.o: lab4.s
	$(CC) -g -o build/lab4.o lab4.s

clean:
	rm build/*.o
	rm build/lab4
