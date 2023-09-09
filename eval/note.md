## how to build openjdk
~~~shell
bash configure --with-boot-jdk=/usr/lib/jvm/java-8-openjdk-amd64 --with-jvm-variants=server --with-target-bits=64 --with-native-debug-symbols=internal
make clean
make images JOBS=$(nproc)
./build/linux-x86_64-normal-server-release/jdk/bin/java -version
~~~
## how to build xxx.java into xxx.jar
~~~shell
./build/linux-x86_64-normal-server-release/jdk/bin/javac ./xxx.java
./build/linux-x86_64-normal-server-release/jdk/bin/jar cvf <name of jar> *.class
~~~