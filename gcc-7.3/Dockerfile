FROM gcc:7.3

LABEL maintainer="loligothick@gmail.com"
ENV HOME="/home/builder"

RUN mkdir -p $HOME \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends cmake \
    && git config --global advice.detachedHead false \
    && rm -rf /var/lib/apt/lists/*

ENV CC="gcc" \
    CXX="g++" \
    COVERAGE_COMMAND="/usr/bin/gcov-7" \
    COVERAGE_FLAGS="--coverage"
