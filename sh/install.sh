#!/usr/bin/env bash

source ../sh/common.sh

myshconfig="${HOME}/.config/myshconfig"
link_dir "${PWD}" "${myshconfig}"
maybe_append "${HOME}/.zshrc" "source ${myshconfig}/zshrc"
maybe_append "${HOME}/.bashrc" "source ${myshconfig}/bashrc"
