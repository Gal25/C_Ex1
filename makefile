CC=gcc
AR=ar
FLAGS= -g -Wall
LM = -lm

all: maindloop loops recursives recursived loopd mains maindrec

loopd:libclassloops.so 
recursived:libclassrec.so
recursives:libclassrec.a
loops:libclassloops.a 

libclassloops.a: basicClassification.o advancedClassificationLoop.o
	$(AR) -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o
libclassrec.a: basicClassification.o advancedClassificationRecursion.o
	$(AR) -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o
libclassloops.so: basicClassification.o advancedClassificationLoop.o
	$(CC) -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o
libclassrec.so: basicClassification.o advancedClassificationRecursion.o
	$(CC) -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a $(LM)
maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o libclassrec.so $(LM)
maindloop:main.o libclassloops.so
	gcc -g -Wall -o maindloop main.o libclassloops.so -lm

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
