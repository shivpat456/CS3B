CC=as
LL=ld
OBJ=obj/putstring.o obj/string_length.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o

all: build/lab10

build/lab10: obj/string_length.o build/lab10.o
	$(LL) -o build/lab10 build/lab10.o $(OBJ)

obj/string_length.o: string_length.s
	$(CC) -g -o obj/string_length.o string_length.s

build/lab10.o: lab10.s
	$(CC) -g -o build/lab10.o lab10.s

clean:
	rm build/*.o
	rm build/lab10
