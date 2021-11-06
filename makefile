OBJECT_RECURSION: basicClassification.o advancedClassificationRecursion.o 
OBJECT_LOOP: basicClassification.o advancedClassificationLoop.o
CC=gcc
AR=ar
FLAGS= -Wall -g 


all:loopd loops recursived recursives maindrec mains maindloop

loops: libclassloops.a
loopd: libclassloops.so
recursives: libclassrec.a
recursived: libclassrec.so

mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a -lm
maindloop: main.o libclassloops.so
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so -lm
maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so -lm

	
libclassloops.a: $(OBJECT_LOOP)
	$(AR) -rcs libclassloops.a $(OBJECT_LOOP)
libclassrec.a: $(OBJECT_RECURSION)
	$(AR) -rcs libclassrec.a $(OBJECT_RECURSION)
libclassloops.so: $(OBJECT_LOOP)
	$(CC) -shared $(OBJECT_LOOP) -o libclassloops.so
libclassrec.so: $(OBJECT_RECURSION)
	$(CC) -shared $(OBJECT_RECURSION) -o libclassrec.so

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c 
basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
