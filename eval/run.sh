#!/bin/bash

work_dir="/mnt/data1/${USER}"
JAVA_8_HOME="${work_dir}/openjdks/jdk8u/build/linux-x86_64-normal-server-release/jdk/bin"
dacapo="${work_dir}/benchmarks/dacapobench"
now=$(date "+%Y%m%d%H%M%S")

# function build() {
#     ${JAVA_8_HOME}/javac ./MemoryAllocation.java
#     ${JAVA_8_HOME}/jar cvf MemoryAllocation.jar MemoryAllocation.class
# }

# build
${JAVA_8_HOME}/java -XX:+UseParNewGC -Xms10G -Xmx10G -XX:NewSize=9g -XX:MaxNewSize=9g \
    -XX:ParallelGCThreads=13 -XX:ConcGCThreads=3 -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=256m \
    -XX:+DisableExplicitGC -XX:SurvivorRatio=1 \
    -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintHeapAtGC -Xloggc:./logs/gc-${now}.log \
    -jar ${dacapo}/benchmarks/dacapo-evaluation-git-20e72f36.jar tradebeans -t 16 -s large >& gc.console &

    # -cp MemoryAllocation.jar MemoryAllocation >& gc.console &