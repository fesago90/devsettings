# init LS_COLORS from .dircolors
eval $(dircolors -b $HOME/.sharedrc/dircolors)

# aliases
alias ls="ls -ah --color --group-directories-first"

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo -e " \033[48;5;1m$RETVAL\033[m"
}
export PS1="\A \[\033[38;5;11m\]\w\[\033[m\]\`nonzero_return\` \$ "

# config fzf to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
