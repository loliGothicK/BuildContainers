FROM purplekarrot/base:latest

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends g++-4.9 \
    && rm -rf /var/lib/apt/lists/*

ENV CC="/usr/bin/gcc-4.9" \
    CXX="/usr/bin/g++-4.9" \
    COVERAGE_COMMAND="/usr/bin/gcov-4.9" \
    COVERAGE_FLAGS="--coverage"