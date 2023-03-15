if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path ~/.local/bin
fish_add_path ~/.local/share/cargo/bin

set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

alias dots='git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias etc='sudo git --git-dir=/etc/.cfg --work-tree=/etc'
