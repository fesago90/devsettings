#!/usr/bin/env bash
source ../sh/common.sh

link_file "${PWD}/config" "${HOME}/.config/i3/config" || LOGWARNING "Can't link i3 config  "
