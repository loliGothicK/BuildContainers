FROM enumack/buildcontainers:base

RUN sudo apt-get -qq install clang-3.6 -y --no-install-recommends

ENV CC="/usr/bin/clang-3.6" \
    CXX="/usr/bin/clang++-3.6"
