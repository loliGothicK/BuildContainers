FROM enumack/buildcontainers:base

RUN apt upgrade -y && apt-get update
RUN sudo apt install -y software-properties-common python-software-properties
RUN sudo add-apt-repository ppa:jonathonf/gcc-7.1 \
    && sudo apt update \
    && apt -qq install -y --no-install-recommends g++-7 \
    && rm -rf /var/lib/apt/lists/*

ENV CC="/usr/bin/gcc-7" \
    CXX="/usr/bin/g++-7" \
    COVERAGE_COMMAND="/usr/bin/gcov-7" \
    COVERAGE_FLAGS="--coverage"