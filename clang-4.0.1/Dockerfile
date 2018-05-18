FROM buildpack-deps:stretch

# Install Build Dependency:
RUN apt-get upgrade -y && apt-get update -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends software-properties-common\ 
  && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
  && apt-add-repository "deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-4.0 main" \
  && apt-get update -y && apt-get upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      cmake \
      clang-4.0 \ 
      clang++-4.0 \
  && rm -rf /var/lib/apt/lists/* \
# Turn off warning
  && git config --global advice.detachedHead false

ENV CC="clang-4.0" \
    CXX="clang++-4.0"
