# Some nice colorfull things when opening a terminal
if type "dotacat" > /dev/null; then
	colorscript -r | dotacat
else
	colorscript -r
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Where omz is installed
export ZSH="$HOME/.oh-my-zsh"

# Omz's theme, modify ~/.config/p10k.zsh to change
ZSH_THEME="powerlevel10k/powerlevel10k"

# Disable omz automatic updates
zstyle ':omz:update' mode disabled

# Where omz's custom plugins, themes, and scripts are placed
ZSH_CUSTOM=$HOME/omz_custom

# The plugins enabled in omz
plugins=(
	timer
	git
	colored-man-pages
	command-not-found
	history-substring-search
)

# Run omz
source $ZSH/oh-my-zsh.sh

# Configure the colour of colored-man-pages
less_termcap[md]="${fg_bold[blue]}"

# Set the default editor,
# many programs use this
export EDITOR='lvim'

# If ~/.cargo/env exists, run it
if [ -f "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi

# Add local bin to path
export PATH="$HOME/.local/bin:$PATH"

# Enable vim keybindings in the terminal
bindkey -v

# Run powerlevel10k
[[ ! -f ~/.config/p10k.zsh ]] || source ~/.config/p10k.zsh

