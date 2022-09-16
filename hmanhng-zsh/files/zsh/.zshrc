#!/bin/sh

autoload -Uz colors && colors
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/.zsh_history
setopt appendhistory
# some useful options (man zshoptions)
setopt autocd extendedglob nomatch
setopt interactive_comments
stty stop undef # Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
# beeping is annoying
unsetopt BEEP

# Useful Functions
source "$ZDOTDIR/zsh-functions"
# Plugins
zsh_add_plugin "marlonrichert/zsh-autocomplete"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
# zsh_add_plugin "unixorn/fzf-zsh-plugin"
# zsh_add_completion "esc/conda-zsh-completion" false
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions
# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
# zsh_add_file "zsh-prompt"
zsh_add_file "zsh-vim-mode"
autopair-init

# completions
zstyle ':autocomplete:*' widget-style menu-select
# zstyle ':autocomplete:*' fzf-completion yes
zstyle ':autocomplete:*' recent-dirs zoxide
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:aliases' list-colors '=*=2;38;5;205'
zstyle ':completion:*:builtins' list-colors '=*=1;38;5;105'
zstyle ':completion:*:options' list-colors '=^(-- *)=34'
zstyle ':completion:*:commands' list-colors '=*=1;36'
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?) *=00=$color[green]=$color[bg-green]" )'
zmodload zsh/complist

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey -s '^f' 'zi^M'
bindkey -s '^n' 'lvim $(fzf)^M'
# bindkey -s '^v' 'nvim\n'
bindkey -s '^z' 'zi^M'
# bindkey '^?' vi-delete-char
bindkey '^k' up-line-or-search # Up
bindkey '^j' down-line-or-select # Down
bindkey -r '^u'
bindkey -r '^d'
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# FZF 
# TODO update for mac
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
bindkey '^s' fzf-file-widget
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_DEFAULT_OPTS="--no-height --ansi --reverse --preview 'bat --color always {}'"
export FZF_DEFAULT_COMMAND="fd --hidden --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'exa -aT -L 3 --color=always --group-directories-first {}'"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

# Lunarvim
[ -d /home/${SUDO_USER:-$(whoami)}/.local/share/lunarvim/lvim ] || bash <(curl -s https://raw.githubusercontent.com/hmanhng/lvim/master/install.sh) --no-install-dependencies

eval "$(starship init zsh)"
