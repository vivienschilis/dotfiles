# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Display red dots to be while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails git ruby bundler gem rake rbenv)

source $ZSH/oh-my-zsh.sh

# Disable autocorrect
unsetopt correct_all

# Display a full range of colours
export TERM=screen-256color

# Set up default PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/texbin:$HOME/bin

# Add DotFiles bins
export PATH="$HOME/.DotFiles/bins:$PATH"

export EDITOR=vi

export LC_ALL=en_US.UTF-8

export PS1="${ret_status} `whoami` %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}"

# Misc aliases
alias ll="ls -la"
alias sr="screen -r"
alias tmux="tmux -2"

[[ -f ~/.aliases  ]] && source ~/.aliases

[[ -f ~/.zshrc.local  ]] && source ~/.zshrc.local

eval "$(direnv hook zsh)"
