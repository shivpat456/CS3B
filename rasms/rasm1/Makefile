CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o obj/hex64asc.o

all: build/rasm1

build/rasm1: build/rasm1.o
	$(LL) -o build/rasm1 build/rasm1.o $(OBJ)

build/rasm1.o: rasm1.s
	$(CC) -g -o build/rasm1.o rasm1.s

clean:
	rm build/*.o
	rm build/rasm1
