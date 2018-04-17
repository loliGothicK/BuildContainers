FROM buildpack-deps:sid

RUN VERSION=trunk/ \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        cmake \
    && rm -rf /var/lib/apt/lists/* \
  # Checkout and Build clang:
    && cd /tmp \
    && svn co http://llvm.org/svn/llvm-project/llvm/$VERSION llvm \
    && cd llvm/tools \
    && svn co http://llvm.org/svn/llvm-project/cfe/$VERSION clang \
    && cd clang/tools \
    && svn co http://llvm.org/svn/llvm-project/clang-tools-extra/$VERSION extra \
    && cd ../../../projects \
    && svn co http://llvm.org/svn/llvm-project/compiler-rt/$VERSION compiler-rt \
    && cd ../.. \  
    && mkdir llvm_build \
    && cd llvm_build \
    &&  cmake -G "Unix Makefiles" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/local ../llvm \
    && make \
    && make install \
  # Checkout libc++:
    && cd /tmp \
    && svn co http://llvm.org/svn/llvm-project/libcxx/branches/$VERSION libcxx \
    && mkdir -p libcxx/build \
  # Build libc++:
    && cd /tmp/libcxx/build \
    && cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
    && make install \
  # Turn off warning: detachedHead
    && git config --global advice.detachedHead false \
  # Clean:
    && cd / \
    && rm -rf \
        /tmp/clang \
        /tmp/llvm \
        /tmp/llvm_build \
        /tmp/libcxx \
        /var/lib/apt/lists/*

ENV CC="/usr/local/bin/clang" \
    CXX="/usr/local/bin/clang++"