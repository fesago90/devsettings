# vim mode
bindkey -v

source .sharedrc/sharedrc.sh

# change prompt style
autoload -Uz promptinit
promptinit
prompt pws

zstyle ':completion:*:default' list-colors ${(@s.:.)LS_COLORS}
autoload -Uz compinit
compinit

