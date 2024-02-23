CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o 

all: build/exam1

build/exam1: build/exam1.o
	$(LL) -o build/exam1 build/exam1.o $(OBJ)

build/exam1.o: exam1.s
	$(CC) -g -o build/exam1.o exam1.s

clean:
	rm build/*.o
	rm build/exam1
