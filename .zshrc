# Some nice colorfull things when opening a terminal
if type "dotacat" > /dev/null; then
	colorscript -r | dotacat
else
	colorscript -r
fi

# Set the default editor,
# many programs use this
export EDITOR='lvim'

alias ls='exa -la --header --git --icons --no-time'

if ! type "bat" > /dev/null; then
	alias bat='batcat'
fi
alias cat='bat --theme=Dracula --color=always'

ghc() { git clone https://github.com/"$@"; }
alias gd='git diff'
alias config='git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias configsync='config add -u && date | config commit -F - && config push'

alias shutdown='sudo shutdown -h now'

alias df='df -h'
alias dff='df /'

# If ~/.cargo/env exists, run it
if [ -f "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi

# Add local bin to path
export PATH="$HOME/.local/bin:$PATH"

# Enable vim keybindings in the terminal
bindkey -v

eval "$(starship init zsh)"

