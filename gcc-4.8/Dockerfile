FROM purplekarrot/base:latest

RUN echo 'deb http://ftp.jp.debian.org/debian/ jessie main contrib non-free' >> /etc/apt/sources.list \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends g++-4.8 \
    && rm -rf /var/lib/apt/lists/*

ENV CC="/usr/bin/gcc-4.8" \
    CXX="/usr/bin/g++-4.8" \
    COVERAGE_COMMAND="/usr/bin/gcov-4.8" \
    COVERAGE_FLAGS="--coverage"