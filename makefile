OBJECT_RECURSION: basicClassification.o advancedClassificationficationRecursion.o 
OBJECT_LOOP: basicClassification.o advancedClassificationficationLoop.o 

all: libclassloops.a libclassrec.a libclassrec.so libclassloops.so mains maindloop maindrec

loops: libclassloops.a 
libclassloops.a: main.c libclassloops.a 
	ar -rcs libclassloops.a $(OBJECT_LOOP)

recursives: libclassrec.a
libclassrec.a: main.c libclassrec.a 
	ar -rcs libclassrec.a $(OBJECT_RECURSION)

recursived: libclassrec.so
libclassrec.so: main.c libclassrec.so
	ar -rcs libclassrec.so $(OBJECT_RECURSION)

loopd: libclassloops.so
libclassloops.so: main.c libclassloops.so 
	ar -rcs libclassloops.so $(OBJECT_LOOP)

mains: main.o libclassrec.a
	gcc -shared -Wall -o mains main.c libclassrec.a

maindloop:main.o libclassloops.so
	gcc -shared -Wall -o maindloop main.o libclassloops.so

maindrec: main.o libclassrec.so
	gcc -shared -Wall -o maindrec main.o libclassrec.so

clean:
	rm -f *.o *.a *.so loops recursives loopd recursived mains maindloop maindrec
