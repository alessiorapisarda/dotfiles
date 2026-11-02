type -q starship; and starship init fish | source
type -q zoxide; and zoxide init fish | source
type -q fzf; and fzf --fish | source
type -q mise; and mise activate fish | source

fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.bun/bin

set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

abbr g git
abbr y yazi
abbr ff fastfetch
abbr p paru
abbr s shelly
abbr h herdr
abbr v nvim
abbr sv sudoedit

if status is-interactive
    # Start keychain with a 120-minute timeout (7200 seconds)
    keychain --timeout 7200 --eval --quiet | source
end
