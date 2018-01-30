FROM gcc:7.3

LABEL maintainer="loligothick@gmail.com"

ENV HOME="/home/builder"

RUN mkdir -p $HOME \
    && buildDeps = 'git cmake ninja-build' \
    && apt -qq update \
    && apt -qq install -y $buildDeps --no-install-recommends \
    && git config --global advice.detachedHead false \
    && apt -qq purge --auto-remove -y $buildDeps \
    && rm -rf /var/lib/apt/lists/*

ENV CC="gcc" \
    CXX="g++" \
    COVERAGE_COMMAND="/usr/bin/gcov-7" \
    COVERAGE_FLAGS="--coverage"