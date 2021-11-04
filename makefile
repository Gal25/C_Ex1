OBJECT_RECURSION: basicClassification.o advancedClassificationficationRecursion.o 
OBJECT_LOOP: basicClassification.o advancedClassificationficationLoop.o 

all: libclassloops.a libclassrec.a libclassrec.so libclassloops.so mains maindloop mainrec

loop: libclassloops.a 
libclassloops.a: main.o libclassloops.a 
		ar -rcs libclassloops.a $(OBJECT_LOOP)

recursives: libclassrec.a
libclassrec.a: main.o libclassrec.a 
		ar -rcs libclassrec.a $(OBJECT_RECURSION)

recursived: libclassrec.so
libclassrec.so: main.o libclassrec.so
			gcc -shared -o libclassrec.so $(OBJECT_RECURSION)


loopd: libclassloops.so
libclassloops.so: main.o libclassloops.so 
			gcc -shared -o libclassloops.so $(OBJECT_LOOP)

mains: main.o libclassrec.a
		-wall -g -o mains main.o libclassrec.a

maindloop:main.o lobclassloops.so
		-wall -g -o maindloop main.o libclassloops.so

maindrec: main.o libclassloops.so 
		-wall -g -o maindrec main.o libclasslrec.so


clean: rm -f *.o *.a *.so loops recursives loopd recursived
