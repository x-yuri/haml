#!/bin/bash

set -e
trap 'rm .ruby-version' 0

VERSIONS=(
  2.2.2
  2.1.6
  2.0.0
)

function test_with() {
  version=$1
  rbenv local $version
  ruby -v
  rake spec
}

for version in ${VERSIONS[@]}; do
  test_with $version
done

rbenv local ${VERSIONS[0]}
ruby -v
rake rails:spec
