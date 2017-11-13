FROM buildpack-deps:sid

RUN VERSION=tags/RELEASE_500/final \
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
    && sudo make install \
  # Checkout libc++ and libc++abi:
    && cd /tmp \
    && svn co http://llvm.org/svn/llvm-project/libcxx/branches/release_50/ libcxx \
    && svn co http://llvm.org/svn/llvm-project/libcxxabi/branches/release_50/ libcxxabi \
    && mkdir -p libcxx/build libcxxabi/build \
  # Build libc++:
    && cd /tmp/libcxx/build \
    && cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
    && make install \
  # Build libc++abi:
    && cd /tmp/libcxxabi/build \
    && CPP_INCLUDE_PATHS=echo | c++ -Wp,-v -x c++ - -fsyntax-only 2>&1 \
    |grep ' /usr'|tr '\n' ' '|tr -s ' ' |tr ' ' ';' \
    && CPP_INCLUDE_PATHS="/usr/include/c++/v1/;$CPP_INCLUDE_PATHS" \
    && cmake -G "Unix Makefiles" -DLIBCXX_CXX_ABI=libstdc++ \
        -DLIBCXX_LIBSUPCXX_INCLUDE_PATHS="$CPP_INCLUDE_PATHS" \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIBCXXABI_LIBCXX_INCLUDES=../../libcxx/include  .. \
    && make install \
  # Rebuild libc++ with proper ABI lib deployed on system: 
    && cd /tmp/libcxx/build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIBCXX_CXX_ABI=libcxxabi \
        -DLIBCXX_CXX_ABI_INCLUDE_PATHS=../../libcxxabi/include .. \
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
        /tmp/libcxxabi \
        /var/lib/apt/lists/*

ENV CC="/usr/local/bin/clang-5.0" \
    CXX="/usr/local/bin/clang++-5.0"