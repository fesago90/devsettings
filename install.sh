#!/bin/bash
source sh/common.sh

for dir in $(find . -maxdepth 1 -type d ! -name '.*'); do
  LOGINFO "changing to ${dir}"
  pushd "$dir"
  ./install.sh
  popd
done
