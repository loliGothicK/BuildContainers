FROM ubuntu:16.04
 
MAINTAINER Inamy

# Pre Install
RUN apt-get update && apt-get -y install sudo
RUN sudo apt-get update && apt-get upgrade -y

# GCC
RUN sudo apt-get update
RUN sudo apt-get install build-essential software-properties-common -y
RUN sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
RUN sudo apt-get update
RUN sudo apt-get install gcc-snapshot -y
RUN sudo apt-get update
RUN sudo apt-get install gcc-6 g++-6 -y

# Clang
RUN sudo apt-get update
RUN deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial main
RUN deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial main
RUN sudo apt-get update
RUN sudo deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main
RUN sudo deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main
RUN sudo apt-get update
RUN sudo wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
RUN sudo apt-get update
RUN sudo apt-get install clang-4.0 lldb-4.0

