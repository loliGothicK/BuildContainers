FROM ubuntu:16.04
 
MAINTAINER Inamy

# Clang
RUN sudo apt-get update && apt-get upgrade -y
RUN sudo deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main
RUN sudo deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main
RUN sudo wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
RUN sudo apt-get update
RUN sudo apt-get install clang-4.0 lldb-4.0

# GCC
RUN sudo apt-get update
RUN sudo apt-get install build-essential software-properties-common -y
RUN sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
RUN sudo apt-get update
RUN sudo apt-get install gcc-snapshot -y
RUN sudo apt-get update
RUN sudo apt-get install gcc-6 g++-6 -y