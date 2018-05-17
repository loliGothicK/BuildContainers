FROM buildpack-deps:jessie-jessie

# Install Build Dependency:
RUN apt-get upgrade -y && apt-get update -y \
  && apt-get install clang-3.8 clang++-3.8 cmake

ENV CC="clang-3.8.1" \
    CXX="clang++-3.8.1"
