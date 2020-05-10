# vim mode
bindkey -v

source $HOME/.sharedrc/sharedrc.sh

# change prompt style
autoload -Uz promptinit
promptinit
prompt pws
PROMPT='%T %F{yellow}%~%f%(?.. %F{red}%?%f) %# '

# match tab completion colors with LS_COLORS
zstyle ':completion:*:default' list-colors ${(@s.:.)LS_COLORS}
autoload -Uz compinit
compinit

# init fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
