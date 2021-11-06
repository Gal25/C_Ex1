CC=gcc
AR=ar
FLAGS= -Wall -g 
LM = -lm

all:loopd loops recursived recursives maindrec mains maindloop

loops: libclassloops.a
loopd: libclassloops.so
recursives: libclassrec.a
recursived: libclassrec.so

mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a $(LM)
maindloop: main.o libclassloops.so
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so $(LM)
maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so $(LM)

	
libclassloops.a: basicClassification.o advancedClassificationLoop.o
	$(AR) -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o
libclassrec.a: basicClassification.o advancedClassificationRecursion.o
	$(AR) -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o
libclassloops.so: basicClassification.o advancedClassificationLoop.o
	$(CC) -shared basicClassification.o advancedClassificationLoop.o -o libclassloops.so
libclassrec.so: basicClassification.o advancedClassificationRecursion.o
	$(CC) -shared basicClassification.o advancedClassificationRecursion.o -o libclassrec.so

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c 
basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c


.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
