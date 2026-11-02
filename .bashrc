#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# fzf - Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# starship
eval "$(/usr/bin/starship init bash --print-full-init)"

# zoxide
eval "$(zoxide init bash)"
