CC=gcc
AR=ar
FLAGS= -g -Wall
LM = -lm

all: libclassloops.a libclassrec.a libclassrec.so libclassloops.so mains maindloop maindrec


loops:libclassloops.a
libclassloops.a: basicClassification.o advancedClassificationLoop.o
	$(AR) -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o
recursives:libclassrec.a
libclassrec.a: basicClassification.o advancedClassificationRecursion.o
	$(AR) -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o
loopd:libclassloops.so 
libclassloops.so: basicClassification.o advancedClassificationLoop.o
	ar -rcs libclassloops.so basicClassification.o advancedClassificationLoop.o
recursived:libclassrec.so
libclassrec.so: basicClassification.o advancedClassificationRecursion.o
	ar -rcs libclassrec.so basicClassification.o advancedClassificationRecursion.o

basicClassification.o: basicClassification.c NumClass.h
	$(CC) -Wall -c basicClassification.c -lm
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) -Wall -c advancedClassificationLoop.c -lm
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) -Wall -c advancedClassificationRecursion.c -lm


mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a $(LM)
maindloop: main.o libclassloops.so
	$(CC) $(FLAGS) -o maindloop main.o libclassloops.so $(LM)
maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o libclassrec.so $(LM)

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
