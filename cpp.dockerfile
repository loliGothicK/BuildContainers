$ cat Dockerfile
FROM ubuntu:16.04
 
MAINTAINER Inamy

# Clang
RUN sudo apt-get update && apt-get upgrade -y && \
    sudo deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main && \
    sudo deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main && \
    sudo wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add - && \
    sudo apt-get update && \
    sudo apt-get install clang-4.0 lldb-4.0

# GCC
RUN sudo apt-get update && \
    sudo apt-get install build-essential software-properties-common -y && \
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    sudo apt-get update && \
    sudo apt-get install gcc-snapshot -y && \
    sudo apt-get update && \
    sudo apt-get install gcc-6 g++-6 -y