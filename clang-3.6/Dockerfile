FROM enumack/buildcontainers:base

RUN apt-add-repository -y "deb http://llvm.org/apt/trusty llvm-toolchain-trusty main"
RUN apt-add-repository -y "deb http://llvm.org/apt/trusty llvm-toolchain-trusty-3.6 main"
RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add -
RUN apt-get update -qq
RUN apt-get install -qq clang-3.6 llvm-3.6
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 90
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 90
RUN rm -rf /var/lib/apt/lists/*

ENV CC="clang" \
    CXX="clang++"

RUN echo "--- Build Enviroment ---"
RUN gcc --version | grep gcc
RUN g++ --version | grep g++
RUN lcov --version | grep version
RUN clang --version | grep version
RUN clang++ --version | grep version
RUN cmake --version | grep version
RUN echo "------------------------"