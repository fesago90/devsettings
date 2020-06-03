export PATH=$HOME/bin:$PATH
export EDITOR=vi

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# Homebrew stuff
export PATH=$HOME/homebrew/bin:$PATH
export LD_LIBRARY_PATH=$HOME/homebrew/lib:$LD_LIBRARY_PATH

NEW_IP=192.168.0.139
PRI_IP=192.168.0.119
ELA_IP=192.168.0.121

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
