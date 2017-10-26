FROM nwtgck/llvm-clang:3.6.2

RUN apt-get update && apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      libc++-dev \
      git \
      cmake \
    && rm -rf /var/lib/apt/lists/*

RUN git config --global advice.detachedHead false

ENV CC="clang-3.6.2" \
    CXX="clang++-3.6.2"
