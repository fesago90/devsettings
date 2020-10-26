#!/usr/bin/env bash
source ../sh/common.sh

link_file "${PWD}/settings.json" "${HOME}/.config/Code/User/settings.json" || \
  LOGWARNING "Couldn't link vscode settings"
link_file "${PWD}/keybindings.json" "${HOME}/.config/Code/User/keybindings.json" || \
  LOGWARNING "Couldn't link vscode keybindings"
