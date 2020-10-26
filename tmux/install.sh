#!/usr/bin/env bash
source ../sh/common.sh

link_dir "${PWD}" "${HOME}/.config/tmux" || LOGWARNING "Couldn't link tmux dir"
maybe_append "${HOME}/.tmux.conf" "source-file ${HOME}/.config/tmux/tmux.conf"

