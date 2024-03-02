#!/bin/bash

function _log {
  local log_level="${1}"
  local call_frame="${2}"
  local message="${@:3}"
  local color=""
  local should_print=1
  local prefix=""

  case "${log_level}" in
    INFO)
      color=$'\e[32m' # green
      prefix="I"
      ;;
    WARNING)
      color=$'\e[95m' # light magenta
      prefix="W"
      ;;
    ERROR)
      color=$'\e[31m' # red
      prefix="E"
      ;;
    VERBOSE)
      color=$'\e[33m' # yellow
      if [[ -z "${LOG_VERBOSE}" ]]; then
        should_print=0
      fi
      prefix="V"
      ;;
    *)
      color=$'\e[96m' # light cyan
      prefix="#"
      ;;
  esac

  local line_no fn filename
  if (( should_print )); then
    read line_no fn filename < <(caller ${call_frame})
    echo -e \
      "${color}${prefix}:$(basename "${filename}"):${fn}:${line_no}"$'\e[0m'" ${message}" 1>&2
  fi
}

function LOGINFO {
  _log INFO 1 "$*"
}

function LOGWARNING {
  _log WARNING 1 "$*"
}

function LOGERROR {
  _log ERROR 1 "$*"
}

function LOGVERBOSE {
  _log VERBOSE 1 "$*"
}

function DIE {
  local frame line_no fn filename
  echo -e "\e[31mFATAL:\e[0m $*" 1>&2
  frame=1
  while caller $frame 1>/dev/null 2>/dev/null; do
    read line_no filename fn < <(caller $frame)
    echo -e " ** \e[31m${filename}:${fn}:${line_no}\e[0m" 1>&2
    ((frame++))
  done
  exit 1
}

function link_dir {
  if (( $# != 2 )); then
    DIE "Illegal number of parameters"
  fi
  local src_dir="$1"
  local dst_dir_link="$2"
  if [[ ! -d "$src_dir" ]]; then
    LOGVERBOSE "src is not a dir: ${src_dir}"
    return 1
  fi

  if [[ -h "${dst_dir_link}" || -e "${dst_dir_link}" ]]; then
    if [[ "$(readlink ${dst_dir_link})" == "${src_dir}" ]]; then
      return 0
    fi
    return 1
  else
    mkdir -p "$(dirname "${dst_dir_link}")"
    ln -s "${src_dir}" "${dst_dir_link}"
  fi
}

function link_file {
  if (( $# != 2 )); then
    DIE "Illegal number of parameters"
  fi
  local src_file="$1"
  local dst_file_link="$2"
  if [[ ! -f "$src_file" ]]; then
    LOGVERBOSE "src is not a file: ${src_file}"
    return 1
  fi

  if [[ -h "${dst_file_link}" || -e "${dst_file_link}" ]]; then
    if [[ "$(readlink ${dst_file_link})" == "${src_file}" ]]; then
      return 0
    fi
    return 1
  else
    mkdir -p "$(dirname "${dst_file_link}")"
    ln -s "${src_file}" "${dst_file_link}"
  fi
}

function maybe_append {
  local dst_file str_to_append
  if (( $# != 2 )); then
    DIE "Illegal number of parameters"
  fi
  dst_file="$1"
  str_to_append="$2"
  if ! grep -F "${str_to_append}" "${dst_file}" > /dev/null; then
    echo "${str_to_append}" >> "${dst_file}"
  fi
}

function link_or_append {
  local src_file dst_file str_to_append
  if (( $# != 3 )); then
    DIE "Illegal number of parameters"
  fi
  src_file="$1"
  dst_file="$2"
  str_to_append="$3"
  if [[ -e "${dst_file}" && ! "${src_file}" -ef "{$dst_file}" ]]; then
    maybe_append "${dst_file}" "${str_to_append}"
  else
    link_file "${src_file}" "${dst_file}"
  fi
}

