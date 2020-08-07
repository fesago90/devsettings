# config fzf to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fdr - cd to selected parent directory
fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
  cd "$DIR"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls="ls -ah --color --group-directories-first"
	# init LS_COLORS from .dircolors
	eval $(dircolors -b $HOME/.sharedrc/dircolors)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls="ls -ah -G"
fi

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo -e " $RETVAL"
}
export PS1="\A \[\033[38;5;11m\]\w\[\033[m\]\[\033[48;5;1m\]\`nonzero_return\`\[\033[m\] \$ "

