#!/bin/bash
source sh/common.sh

LOGINFO "installing nix env"
pushd "nix"
./install.sh
popd

for dir in $(find . -maxdepth 1 -type d ! -name '.*' ! -name 'nix'); do
  LOGINFO "changing to ${dir}"
  pushd "$dir"
  ./install.sh
  popd
done
