#!/usr/bin/env bash
ln -s -n "$(pwd)" ~/.tmux
ln -s "$(pwd)/.tmux.conf" ~/
git clone https://github.com/tmux-plugins/tpm plugins/tpm

