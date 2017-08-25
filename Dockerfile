FROM ubuntu:16.04
 
MAINTAINER Inamy

# Pre Install
RUN apt-get update && apt-get -y install sudo
RUN sudo apt-get install wget -y
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
RUN sudo apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y vim curl && \
 curl -q http://apt.llvm.org/llvm-snapshot.gpg.key |apt-key add -

RUN cat << EOF > /etc/apt/sources.list.d/llvm-repos.list  \
deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial main \
deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial main \
deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.9 main \
deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.9 main \
deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main \
deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main \
EOF

RUN apt-get update && apt-get install -y clang-4.0 clang-4.0-doc \
libclang-common-4.0-dev libclang-4.0-dev libclang1-4.0 libclang1-4.0-dbg \
libllvm4.0 libllvm4.0-dbg lldb-4.0 llvm-4.0 llvm-4.0-dev llvm-4.0-runtime \
clang-format-4.0 python-clang-4.0 liblldb-4.0-dev lld-4.0 libfuzzer-4.0-dev \
subversion cmake

RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang-4.0 100 \
&& update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-4.0 100 \
&& update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-4.0 100 \
&& update-alternatives --install /usr/bin/clang clang /usr/bin/clang-4.0 100 \
&& update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-4.0 10 \
&& update-alternatives --install /usr/bin/ld ld /usr/bin/ld.gold 20 \
&& update-alternatives --install /usr/bin/ld ld /usr/bin/ld.bfd 30 \
&& ld --version && echo 3 | update-alternatives --config ld && ld --version

RUN cd /tmp
RUN svn co http://llvm.org/svn/llvm-project/libcxx/branches/release_40/ libcxx
RUN svn co http://llvm.org/svn/llvm-project/libcxxabi/branches/release_40/ libcxxabi
RUN mkdir -p libcxx/build libcxxabi/build

RUN cd /tmp/libcxx/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_CONFIG_PATH=/usr/bin/llvm-config-4.0\
      -DCMAKE_INSTALL_PREFIX=/usr .. \
&& make install

RUN cd /tmp/libcxxabi/build
RUN CPP_INCLUDE_PATHS=echo | c++ -Wp,-v -x c++ - -fsyntax-only 2>&1 \
  |grep ' /usr'|tr '\n' ' '|tr -s ' ' |tr ' ' ';'
RUN CPP_INCLUDE_PATHS="/usr/include/c++/v1/;$CPP_INCLUDE_PATHS"
RUN cmake -G "Unix Makefiles" -DLIBCXX_CXX_ABI=libstdc++ \
      -DLIBCXX_LIBSUPCXX_INCLUDE_PATHS="$CPP_INCLUDE_PATHS" \
      -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
      -DLLVM_CONFIG_PATH=/usr/bin/llvm-config-4.0 \
      -DLIBCXXABI_LIBCXX_INCLUDES=../../libcxx/include  .. \
&& make install

RUN cd /tmp/libcxx/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
      -DLIBCXX_CXX_ABI=libcxxabi -DLLVM_CONFIG_PATH=/usr/bin/llvm-config-4.0\
      -DLIBCXX_CXX_ABI_INCLUDE_PATHS=../../libcxxabi/include .. \
&& make install