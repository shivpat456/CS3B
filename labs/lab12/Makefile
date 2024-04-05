CC=as
LL=ld
OBJ=obj/putstring.o obj/factorial.o obj/String_length.o obj/putch.o obj/ascint64.o obj/int64asc.o obj/getstring.o

all: lab12

lab12: factorial.o lab12.o
	$(LL) -o build/lab12 build/lab12.o $(OBJ)

factorial.o: factorial.s
	$(CC) -g -o obj/factorial.o factorial.s

lab12.o: lab12.s
	$(CC) -g -o build/lab12.o lab12.s

clean:
	rm build/*.o
	rm build/lab12
