# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install

# pretty colors
eval "$(dircolors -b $ZSH_CONFIG_HOME/dircolors)"

setopt CORRECT              # Spelling correction
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
# fix zsh annoying history behavior
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

eval "$(starship init zsh)"
eval "$(~/.local/bin/mise activate zsh)"

source $ZSH_CONFIG_HOME/aliases
source $ZSH_CONFIG_HOME/bindings.zsh
source $ZSH_CONFIG_HOME/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CONFIG_HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_CONFIG_HOME/mouse.zsh
