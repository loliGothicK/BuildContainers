FROM ubuntu:18.04

RUN buildDeps='wget software-properties-common gpg-agent'; \
  apt-get -y upgrade && apt-get -y update; \
  apt-get install -y --no-install-recommends $buildDeps; \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -; \
  apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main"; \
  apt-get -y update; \
  apt-get -y install --no-install-recommends \
      make \
			cmake \
      clang-7 \
      clang++-7; \
  rm -rf /var/lib/apt/lists/*; \
  apt-get purge -y --auto-remove $buildDeps
ENV CC="clang-7" \
    CXX="clang++-7"
