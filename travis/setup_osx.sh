#!/usr/bin/env bash
set -x

diskutil erasevolume HFS+ 'ram-disk' `hdiutil attach -nomount ram://6165430`
df -h

brew update
brew install zlib
brew install snappy
brew install openssl git gnu-getopt coreutils
brew install gflags protobuf leveldb
brew install gperftools

brew upgrade pyenv

export PATH="${HOME}/.pyenv/shims/:/root/.pyenv/bin:${PATH}"

pyenv install ${PYTHON_VERSION} || travis_terminate 1;
pyenv global ${PYTHON_VERSION} || travis_terminate 1;

pip install -r python/requirements.txt || travis_terminate 1;
