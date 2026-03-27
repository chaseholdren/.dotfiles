#!/usr/bin/env zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export DOTFILES="$HOME"

export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="fresh"
export VISUAL="code"

export ZSH_CONFIG_HOME="$XDG_CONFIG_HOME/zsh"
export ZSH_PLUGINS="$ZSH_CONFIG_HOME/plugins"
export STARSHIP_CONFIG="$ZSH_CONFIG_HOME/starship.toml"
export STARSHIP_COMMANDS="$ZSH_CONFIG_HOME/starship-commands"
