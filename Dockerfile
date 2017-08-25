FROM ubuntu:16.04
 
MAINTAINER Inamy

# Pre Install
RUN apt-get update && apt-get -y install sudo
RUN sudo apt-get install wget -y
RUN sudo apt-get update && apt-get upgrade -y

# GCC
RUN sudo apt-get update
RUN sudo apt-get install build-essential software-properties-common -y
RUN sudo add-apt-get-repository ppa:ubuntu-toolchain-r/test -y
RUN sudo apt-get update
RUN sudo apt-get install gcc-snapshot -y
RUN sudo apt-get update
RUN sudo apt-get install gcc-6 g++-6 -y

# Clang
RUN sudo apt-get update
RUN sudo apt-get adv --keyserver keyserver.ubuntu.com --recv-keys 15CF4D18AF4F7421
RUN sudo apt-get update
RUN echo 'deb http://apt-get.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main' > /etc/apt-get/sources.list.d/llvm.list
RUN echo 'deb-src http://apt-get.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main' >> /etc/apt-get/sources.list.d/llvm.list
RUN sudo apt-get update
RUN sudo wget -O - https://apt-get.llvm.org/llvm-snapshot.gpg.key|sudo apt-get-key add -
RUN sudo apt-get update
RUN sudo apt-get install clang-4.0 lldb-4.0 -y

