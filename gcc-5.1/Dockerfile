FROM gcc:5.1

MAINTAINER LoliGothick "loligothick@gmail.com"

ENV HOME="/home/builder"
RUN mkdir -p $HOME

RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
        cmake \
        make \
        ninja-build \
        runit \
    && rm -rf /var/lib/apt-get/lists/*

# Disable git warning about detached HEAD.
RUN buildDeps='git' \
    && apt-get -qq update \
    && apt-get -qq install -y $buildDeps --no-install-recommends \
    && git config --global advice.detachedHead false \
    && apt-get -qq purge --auto-remove -y $buildDeps \
    && rm -rf /var/lib/apt-get/lists/*

COPY . /

ENTRYPOINT [ "./entrypoint.sh" ]

ENV CC="gcc" \
    CXX="g++" \
    COVERAGE_COMMAND="/usr/bin/gcov-7" \
    COVERAGE_FLAGS="--coverage"