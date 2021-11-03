OBJECT_RECURSION: basicClassification.o advancedClassificationficationRecursion.o 
OBJECT_LOOP: basicClassification.o advancedClassificationficationLoop.o 

all: libclassloops.a libclassloops.so libclasslrec.a  libclasslrec.so mains maindloop mainrec

loop: libclassloops.a 
libclassloops.a: main.o libclassloops.a 
		ar -rcs libclassloops.a $(OBJECT_LOOP)

recursives: libclassrec.a
libclassrec.a: main.o libclassrec.a 
		ar -rcs libclassrec.so $(OBJECT_RECURSION)

recursived: libclassrec.so
libclassrec.so: main.o libclassrec.so
			gcc -shared -o libclassrec.so $(OBJECT_RECURSION)


loopd: libclassloops.so
libclassloops.so: main.o libclassloops.so 
			gcc -shared -o libclassloops.a $(OBJECT_LOOP)

mains: main.o libclassrec.a
		-wall -g -o mains main.c libclassrec.a

maindloop:main.o lobclassloops.so
		-wall -g -o maindloop main.c libclassloops.so

maindrec: main.o libclassloops.so 
		-wall -g -o maindrec main.c libclasslrec.so


clean: rm -f *.o *.a *.so loops recursives loopd recursived
