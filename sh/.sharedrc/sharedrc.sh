# init LS_COLORS from .dircolors
eval $(dircolors -b $HOME/.sharedrc/dircolors)

# config fzf to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# init fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
