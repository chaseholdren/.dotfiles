#!/usr/bin/env zsh

bindkey -v

# pretty colors
eval "$(dircolors -b $ZSH_CONFIG_HOME/dircolors)"

# setopt CORRECT              # Spelling correction
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

source $ZSH_CONFIG_HOME/aliases.zsh
source $ZSH_CONFIG_HOME/bindings.zsh
source $ZSH_CONFIG_HOME/completion.zsh
source $ZSH_CONFIG_HOME/mouse.zsh

# git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGINS/zsh-autosuggestions
source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# git clone https://github.com/zsh-users/zsh-completions.git $ZSH_PLUGINS/zsh-completions
source $ZSH_PLUGINS/zsh-completions/zsh-completions.plugin.zsh

eval "$(~/.local/bin/mise activate zsh)"
eval "$(pitchfork activate zsh)"
eval "$(starship init zsh)"

for file in $ZSH_CONFIG_HOME/completions/*; do
    source "$file"
done

