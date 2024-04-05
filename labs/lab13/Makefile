CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o

all: lab13

lab13: factorial.o lab13.o
	$(LL) -o build/lab13 build/lab13.o $(OBJ)

lab13.o: lab13.s
	$(CC) -g -o build/lab13.o lab13.s

clean:
	rm build/*.o
	rm build/lab13
