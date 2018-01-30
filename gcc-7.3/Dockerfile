FROM gcc:7.3

LABEL maintainer="loligothick@gmail.com"

RUN buildDeps='git cmake ninja-build' \
    && set -x \
    && apt update && apt install -y $buildDeps --no-install-recommends \
    && git config --global advice.detachedHead false \
    && apt -qq purge --auto-remove -y $buildDeps \
    && rm -rf /var/lib/apt/lists/*

ENV CC="gcc" \
    CXX="g++" \
    COVERAGE_COMMAND="/usr/bin/gcov-7" \
    COVERAGE_FLAGS="--coverage"