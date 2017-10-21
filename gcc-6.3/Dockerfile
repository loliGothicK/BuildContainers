FROM gcc:6.3

MAINTAINER LoliGothick "loligothick@gmail.com"

ENV HOME="/home/builder"
RUN mkdir -p $HOME

RUN true \
    && apt -qq update \
    && apt -qq install -y --no-install-recommends \
        ca-certificates \
        cmake \
        make \
        ninja-build \
        runit \
    && rm -rf /var/lib/apt/lists/*

# Disable git warning about detached HEAD.
RUN buildDeps='git' \
    && apt -qq update \
    && apt -qq install -y $buildDeps --no-install-recommends \
    && git config --global advice.detachedHead false \
    && apt -qq purge --auto-remove -y $buildDeps \
    && rm -rf /var/lib/apt/lists/*

COPY . /

ENTRYPOINT [ "./entrypoint.sh" ]

ENV CC="gcc" \
    CXX="g++" \
    COVERAGE_COMMAND="/usr/bin/gcov-7" \
    COVERAGE_FLAGS="--coverage"