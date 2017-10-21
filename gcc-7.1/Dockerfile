FROM enumack/buildcontainers:base

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends g++-7.1 \
    && rm -rf /var/lib/apt/lists/*

ENV CC="/usr/bin/gcc-7" \
    CXX="/usr/bin/g++-7" \
    COVERAGE_COMMAND="/usr/bin/gcov-7" \
    COVERAGE_FLAGS="--coverage"