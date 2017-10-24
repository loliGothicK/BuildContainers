FROM ubuntu:trusty

RUN apt-get update && apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git \
    mercurial \
    curl \
    wget \
    python \
    build-essential\
    ca-certificates

RUN apt-get update && apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    cmake \
    clang-3.6

ENV CC="/usr/bin/clang-3.6" \
    CXX="/usr/bin/clang++-3.6"
