# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export ZSH="/home/roger/.oh-my-zsh"
export TERM="xterm-256color"
export FZF_BASE="/usr/bin/fzf"
eval "$(rbenv init -)"
# Themes
ZSH_THEME="spaceship"
KEYTIMEOUT=1

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting colored-man-pages vi-mode fzf zsh_reload postgres ruby)

export RPS1="%{$reset_color%}"
source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=039'

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi



bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey ';' autosuggest-accept


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias tmuxconfig="nvim ~/.tmux.conf"
alias lc='colorls -l --sd'

alias ber="bundle exec rspec"
alias be='bundle exec'
alias bi="bundle install"
