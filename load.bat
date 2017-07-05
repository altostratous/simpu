cd simpasm\src
javac SimpASM.java
java SimpASM ..\..\tests\%1.asm	..\..\cpu\data_path\instmemory.v
cd ..\..