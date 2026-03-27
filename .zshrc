#!/usr/bin/env zsh

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

git() {
  if [[ "$PWD" == "$DOTFILES" ]]; then
    echo "\e[33mWarning: Running git in dotfiles directory\e[0m"
    command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
  else
    command git "$@"
  fi
}

eval "$(starship init zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(pitchfork activate zsh)"

source $ZSH_CONFIG_HOME/aliases
source $ZSH_CONFIG_HOME/bindings.zsh
source $ZSH_CONFIG_HOME/mouse.zsh

# git clone https://github.com/zsh-users/zsh-autosuggestions
source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
