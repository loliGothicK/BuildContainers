FROM buildpack-deps:sid

# Install Build Dependency:
RUN apt-get update && apt-get upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      cmake \
  && rm -rf /var/lib/apt/lists/* \
# Checkout libc++ & c++abi:
  && cd /tmp \
  && svn co http://llvm.org/svn/llvm-project/llvm/branches/release_50 llvm \
  && cd ./llvm/tools \
  && svn co http://llvm.org/svn/llvm-project/libcxx/branches/release_50 clang \
  && cd ../.. \
  && mkdir build \
  && cd build \
  && cmake -G "Unix Makefiles" ../llvm \
  && make install \
  && cd /tmp \
  && rm -rf * \
# Turn off warning
  && git config --global advice.detachedHead false

ENV CC="clang" \
    CXX="clang++"
