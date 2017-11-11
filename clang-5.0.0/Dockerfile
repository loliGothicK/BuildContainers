FROM nwtgck/llvm-clang:5.0.0

# Install Build Dependency:
RUN apt-get update && apt-get upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      subversion \
      git \
      cmake \
  && rm -rf /var/lib/apt/lists/* \
# Checkout libc++ & c++abi:
  && cd /tmp \
  && svn co http://llvm.org/svn/llvm-project/libcxx/branches/release_50/ libcxx \
  && svn co http://llvm.org/svn/llvm-project/libcxxabi/branches/release_50/ libcxxabi \
  && mkdir -p libcxx/build libcxxabi/build \
# Build libc++:
  && cd /tmp/libcxx/build \
  && cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_CONFIG_PATH=llvm-config-5.0.0 \
      -DLIBCXX_INCLUDE_BENCHMARKS=NO \
      -DLIBCXX_ENABLE_EXPERIMENTAL_LIBRARY=NO \
      -DLIBCXX_INSTALL_EXPERIMENTAL_LIBRARY=NO \
      -DLIBCXX_ENABLE_SHARED=YES \
      -DLIBCXX_ENABLE_STATIC=NO \
      -DLIBCXX_ENABLE_FILESYSTEM=NO \
  && make install \
# Turn off warning:
  && git config --global advice.detachedHead false \
# Clean:
  && cd /tmp && rm -rf libcxx libcxxabi

# Set env: clang
ENV CC="clang-5.0.0" \
    CXX="clang++-5.0.0"
