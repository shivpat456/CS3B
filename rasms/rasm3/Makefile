CC=as
LL=ld
OBJ=obj/putstring.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o obj/hex64asc.o obj/String1.o obj/String2.o

all: rasm3

rasm3: rasm3.o String1.o String2.o
	$(LL) -o build/rasm3 /usr/lib/aarch64-linux-gnu/libc.so.6 build/rasm3.o $(OBJ) -dynamic-linker /lib/ld-linux-aarch64.so.1

String1.o: String1.s
	$(CC) -g -o obj/String1.o String1.s

String2.o: String2.s
	$(CC) -g -o obj/String2.o String2.s

rasm3.o: rasm3.s
	$(CC) -g -o build/rasm3.o rasm3.s

clean:
	rm build/*.o
	rm build/rasm3
