FROM gcc:7.2

MAINTAINER LoliGothick "loligothick@gmail.com"

ENV HOME="/home/builder"


RUN mkdir -p $HOME \
    && apt -qq update \
    && buildDeps='cmake git' \
    && apt -qq install -y $buildDeps --no-install-recommends \
    && git config --global advice.detachedHead false \
    && rm -rf /var/lib/apt/lists/*

ENV CC="gcc" \
    CXX="g++" \
    COVERAGE_COMMAND="/usr/bin/gcov-7" \
    COVERAGE_FLAGS="--coverage"