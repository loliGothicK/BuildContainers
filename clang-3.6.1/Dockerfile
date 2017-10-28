FROM nwtgck/llvm-clang:3.6.1

# Install Build Dependency:
RUN apt-get update && apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      subversion \
      git \
      cmake \
    && rm -rf /var/lib/apt/lists/*

# Checkout libc++ & c++abi:
RUN cd /tmp \
  && svn co http://llvm.org/svn/llvm-project/libcxx/branches/release_50/ libcxx \
  && svn co http://llvm.org/svn/llvm-project/libcxxabi/branches/release_50/ libcxxabi \
  && mkdir -p libcxx/build libcxxabi/build

# Build libc++:
RUN cd /tmp/libcxx/build \
  && cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_CONFIG_PATH=llvm-config-3.6.1 -DCMAKE_INSTALL_PREFIX=/usr .. \
  && make install

# Build c++abi:
RUN cd /tmp/libcxxabi/build \
  && CPP_INCLUDE_PATHS=echo | c++ -Wp,-v -x c++ - -fsyntax-only 2>&1 \
  |grep ' /usr'|tr '\n' ' '|tr -s ' ' |tr ' ' ';' \
  && CPP_INCLUDE_PATHS="/usr/include/c++/v1/;$CPP_INCLUDE_PATHS" \
  && cmake -G "Unix Makefiles" -DLIBCXX_CXX_ABI=libstdc++ \
      -DLIBCXX_LIBSUPCXX_INCLUDE_PATHS="$CPP_INCLUDE_PATHS" \
      -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
      -DLLVM_CONFIG_PATH=llvm-config-3.6.1 \
      -DLIBCXXABI_LIBCXX_INCLUDES=../../libcxx/include  .. \
  && make install

# Rebuild libc++ with proper ABI lib deployed on system: 
RUN cd /tmp/libcxx/build \
  && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
      -DLIBCXX_CXX_ABI=libcxxabi -DLLVM_CONFIG_PATH=llvm-config-3.6.1\
      -DLIBCXX_CXX_ABI_INCLUDE_PATHS=../../libcxxabi/include .. \
  && make install

# Turn off warning
RUN git config --global advice.detachedHead false

ENV CC="clang-3.6.1" \
    CXX="clang++-3.6.1"
