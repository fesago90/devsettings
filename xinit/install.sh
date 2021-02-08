#!/usr/bin/env bash
source ../sh/common.sh

link_file "${PWD}/xinitrc" "${HOME}/.xinitrc" || LOGWARNING "Can't link xinitrc"
