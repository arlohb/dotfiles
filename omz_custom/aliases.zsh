alias ls='exa -la --header --git --icons --no-time'
alias cat='batcat --theme=Dracula --color=always'

ghc() { git clone https://github.com/"$@"; }
alias config='git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias configsync='date | config commit -F - && config push'
