FROM ubuntu:xenial

MAINTAINER LoliGothick "loligothick@gmail.com"

ENV HOME="/home/builder"
RUN mkdir -p $HOME

# Install build tools
RUN true \
    && apt -qq update \
    && apt -qq install -y --no-install-recommends \
        ca-certificates \
        cmake \
        make \
        runit \
    && rm -rf /var/lib/apt/lists/*

# Disable git warning about detached HEAD.
RUN buildDeps='git' \
    && apt -qq update \
    && apt -qq install -y $buildDeps --no-install-recommends \
    && apt config --global advice.detachedHead false \
    && apt -qq purge --auto-remove -y $buildDeps \
    && rm -rf /var/lib/apt/lists/*

# Install gcc-5.1
RUN sudo apt -qq install -y gcc-5.1 --no-install-recommends

COPY . /

ENTRYPOINT [ "./entrypoint.sh" ]

ENV CC="gcc" \
    CXX="g++" \
    COVERAGE_COMMAND="/usr/bin/gcov-7" \
    COVERAGE_FLAGS="--coverage"