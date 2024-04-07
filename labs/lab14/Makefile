CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o

all: lab14

lab14: lab14.o
	$(LL) -o build/lab14 build/lab14.o $(OBJ)

lab14.o: lab14.s
	$(CC) -g -o build/lab14.o lab14.s

clean:
	rm build/*.o
	rm build/lab14
