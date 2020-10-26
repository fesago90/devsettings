#!/usr/bin/env bash

source ../sh/common.sh

link_dir ${PWD} "${HOME}/.config/nvim/after" || LOGWARNING "Can't link nvim dir"
link_dir ${PWD} "${HOME}/.vim" || LOGWARNING "Can't link vim dir"
maybe_append "${HOME}/.vimrc" "source ${PWD}/vimrc"
