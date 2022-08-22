alias ls='exa -la --header --git --icons --no-time'

if ! type "bat" > /dev/null; then
	alias bat='batcat'
fi
alias cat='bat --theme=Dracula --color=always'

ghc() { git clone https://github.com/"$@"; }
alias config='git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias configsync='config add -u && date | config commit -F - && config push'

alias shutdown='sudo shutdown -h now'

alias df='df -h'
alias dff='df /'
