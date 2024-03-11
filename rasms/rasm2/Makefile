CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o obj/hex64asc.o

all: build/rasm2

build/rasm2: build/rasm2.o
	$(LL) -o build/rasm2 build/rasm2.o $(OBJ)

build/rasm2.o: rasm2.s
	$(CC) -g -o build/rasm2.o rasm2.s

clean:
	rm build/*.o
	rm build/rasm2
