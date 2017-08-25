FROM ubuntu:16.04
 
MAINTAINER Inamy

# Pre Install
RUN apt update && apt -y install sudo
RUN sudo apt install wget -y
RUN sudo apt update && apt upgrade -y

# GCC
RUN sudo apt update
RUN sudo apt install build-essential software-properties-common -y
RUN sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
RUN sudo apt update
RUN sudo apt install gcc-snapshot -y
RUN sudo apt update
RUN sudo apt install gcc-6 g++-6 -y

# Clang
RUN sudo apt update
RUN echo 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main' > /etc/apt/sources.list.d/llvm.list
RUN echo 'deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main' >> /etc/apt/sources.list.d/llvm.list
RUN sudo apt update
RUN sudo wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
RUN sudo apt update
RUN sudo apt install clang-4.0 lldb-4.0 -y

