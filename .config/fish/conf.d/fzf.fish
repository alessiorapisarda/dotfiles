if type -q fd
    set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden"
    set -gx FZF_ALT_C_COMMAND "fd --type d --hidden"
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
else
    set -gx FZF_DEFAULT_COMMAND "find . -type f"
    set -gx FZF_ALT_C_COMMAND "find . -type d"
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
end

set -gx FZF_ALT_C_OPTS "--preview 'tree -C {}'"

if type -q bat
    set -gx FZF_CTRL_T_OPTS "--preview 'bat -n --color=always {}'"
else
    set -gx FZF_CTRL_T_OPTS "--preview 'head -n 200 {}'"
end
