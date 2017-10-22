FROM enumack/buildcontainers:base

RUN wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add - \
    && sudo apt update \
    && sudo apt install -y clang-5.0

ENV CC="/usr/bin/clang-5.0" \
    CXX="/usr/bin/clang++-5.0"
