FROM debian:sid

RUN apt-get update && apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      git \
      mercurial \
      curl \
      wget \
      python \
      build-essential\
      ca-certificates \
      cmake \
      clang-3.6 \
    && rm -rf /var/lib/apt/lists/*

RUN git config --global advice.detachedHead false

ENV CC="/usr/bin/clang-3.6" \
    CXX="/usr/bin/clang++-3.6"
