FROM buildpack-deps:stretch

# Install Build Dependency:
ENV VERSION = 6.0 \
    CC="clang-{$VERSION}" \
    CXX="clang++-{$VERSION}"

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add - \
  && sudo apt-add-repository "deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-{$VERSION} main" \
  && apt-get update && apt-get upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      cmake \
      $CC \
      $CXX \
  && rm -rf /var/lib/apt/lists/* \
# Turn off warning
  && git config --global advice.detachedHead false
