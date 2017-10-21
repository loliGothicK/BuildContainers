FROM enumack/buildcontainers:base

RUN apt-get upgrade -y && apt-get update
RUN sudo apt-get install -y software-properties-common && sudo apt-get update
RUN sudo add-apt-repository ppa:jonathonf/gcc-7.1 \
    && sudo apt-get update \
    && apt-get -qq install -y --no-install-recommends g++-7 \
    && rm -rf /var/lib/apt/lists/*

ENV CC="/usr/bin/gcc-7" \
    CXX="/usr/bin/g++-7" \
    COVERAGE_COMMAND="/usr/bin/gcov-7" \
    COVERAGE_FLAGS="--coverage"