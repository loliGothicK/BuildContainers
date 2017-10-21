FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git \
    mercurial \
    curl \
    wget \
    python \
    build-essential\
    ca-certificates

RUN apt-get update && apt-get upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    cmake \
    clang-3.5

ENV CC="/usr/bin/clang-3.5" \
    CXX="/usr/bin/clang++-3.5"
