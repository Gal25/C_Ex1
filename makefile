OBJECT_RECURSION: basicClassification.o advancedClassificationficationRecursion.o 
OBJECT_LOOP: basicClassification.o advancedClassificationficationLoop.o 

all: libclassloops.a libclassrec.a libclassrec.so libclassloops.so mains maindloop maindrec

loops: libclassloops.a 
libclassloops.a: main.c NumClass.h libclassloops.a 
	ar -rcs libclassloops.a $(OBJECT_LOOP)

recursives: libclassrec.a
libclassrec.a: main.c NumClass.h libclassrec.a 
	ar -rcs libclassrec.a $(OBJECT_RECURSION)

recursived: libclassrec.so
libclassrec.so: main.c NumClass.h libclassrec.so
	ar -rcs libclassrec.so $(OBJECT_RECURSION)

loopd: libclassloops.so
libclassloops.so: main.c NumClass.h libclassloops.so 
	ar -rcs libclassloops.so $(OBJECT_LOOP)
	
basicClassification.o: basicClassification.c NumClass.h
	gcc -Wall -c basicClassification.c -lm
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	gcc -Wall -c advancedClassificationLoop.c -lm
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	gcc -Wall -c advancedClassificationRecursion.c -lm

mains: main.o libclassrec.a
	gcc -shared -Wall -o mains main.o libclassrec.a -lm

maindloop:main.o libclassloops.so
	gcc -shared -Wall -o maindloop main.o libclassloops.so -lm

maindrec: main.o libclassrec.so
	gcc -shared -Wall -o maindrec main.o libclassrec.so -lm
	


clean:
	rm -f *.o *.a *.so loops recursives loopd recursived mains maindloop maindrec
