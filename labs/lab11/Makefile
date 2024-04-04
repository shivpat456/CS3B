CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o

all: lab11

lab11: lab11.o
	$(LL) -o build/lab11 /usr/lib/aarch64-linux-gnu/libc.so.6 build/lab11.o $(OBJ) -dynamic-linker /lib/ld-linux-aarch64.so.1

lab11.o: lab11.s
	$(CC) -g -o build/lab11.o lab11.s

clean:
	rm build/*.o
	rm build/lab11
