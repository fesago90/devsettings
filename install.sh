#!/bin/bash
base=$(dirname $0)
for dir in $(find . -maxdepth 1 -type d ! -name '.*'); do
  echo "changing to $dir"
  pushd $dir
  ./dotf-install.sh
  popd
done
