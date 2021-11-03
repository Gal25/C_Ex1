OBJECT_RECURSION: basicClassification.o advancedClassificationficationRecursion.o 
OBJECT_LOOP: basicClassification.o advancedClassificationficationLoop.o 


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
libclassloops.so: main.o libclassloops.a 
			gcc -shared -o libclassloops.a $(OBJECT_LOOP)

mains: main.o libclassrec.a
		-wall -g -o mains main.o libclassrec.a

maindloop:main.o lobclassloops.so
		-wall -g -o maindloop main.o libclassloops.so

mainrec: main.o libclassloops.so 
		-wall -g -o maindrec main.o libclasslrec.so

all: libclassloops.a libclasslrec.a libclassloops.so libclasslrec.so mains maindloop mainrec

clean: rm -f *.o *.a *.so 
