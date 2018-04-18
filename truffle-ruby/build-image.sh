#!/usr/bin/env bash

ME=`basename "$0"`

usage()
{
  echo "Usage: $ME [docker_tag (required)] [docker_repo]" >&2
  exit 1
}

VERSION=$1
if [ -z "$VERSION" ]; then usage; fi
REPO=${2:-lusu777/truffle-ruby}

GRAALVM_VERSION=graalvm-1.0.0-rc1
GRAALVM_URL=https://github.com/oracle/graal/releases/download/vm-1.0.0-rc1/graalvm-ce-1.0.0-rc1-linux-amd64.tar.gz 
TRUFFLE_RUBY_URL=https://github.com/oracle/truffleruby/releases/download/vm-1.0.0-rc1/ruby-installable-linux-amd64.jar

wget -O ${GRAALVM_VERSION}.tar.gz ${GRAALVM_URL}


docker build -t $REPO:$VERSION --build-arg GRAALVM_VERSION=${GRAALVM_VERSION} \
             --build-arg TRUFFLE_RUBY_URL=${TRUFFLE_RUBY_URL} .

docker push $REPO:$VERSION