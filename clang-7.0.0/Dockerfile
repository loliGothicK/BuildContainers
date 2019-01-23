FROM buildpack-deps:bionic

# Install Build Dependency:
RUN apt-get upgrade -y && apt-get update -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends software-properties-common\ 
  && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
  && apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7.0 main" \
  && apt-get update -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      cmake \
      clang-7.0 \ 
      clang++-7.0 \
  && rm -rf /var/lib/apt/lists/* \
# Turn off warning
  && git config --global advice.detachedHead false

ENV CC="clang-7.0" \
    CXX="clang++-7.0"
