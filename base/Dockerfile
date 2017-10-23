FROM buildpack-deps:jessie

MAINTAINER LoliGothick "loligothick@gmail.com"

RUN true \
    && apt -qq update \
    && apt -qq install -y --no-install-recommends \
        cmake \
        runit \
    && rm -rf /var/lib/apt/lists/*

RUN git config --global advice.detachedHead false

ENV COVERAGE_COMMAND="/usr/bin/gcov-7" \
    COVERAGE_FLAGS="--coverage"