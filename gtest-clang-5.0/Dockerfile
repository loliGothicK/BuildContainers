FROM enumack/buildcontainers:clang-5.0

RUN git clone -q https://github.com/google/googletest.git /googletest \
  && mkdir -p /googletest/build \
  && cd /googletest/build \
  && cmake .. && make && make install \
  && cd / && rm -rf /googletest
