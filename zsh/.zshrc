# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/robgev/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
source ~/.antigen.zsh
antigen use oh-my-zsh

# Plugins
antigen bundle git
antigen bundle ruby
antigen bundle rbenv
antigen bundle rake
antigen bundle rails
antigen bundle nvm
antigen bundle node
antigen bundle bundler
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k
# Tell Antigen that you're done.
antigen apply

# Feel free to change the powerline
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  dir
  custom_node
  custom_ruby
  vcs
  status
)

RGLOBAL="$(rbenv global)"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_CUSTOM_NODE="echo -n '\ued0d' $(node --version)"
POWERLEVEL9K_CUSTOM_NODE_BACKGROUND="green"
POWERLEVEL9K_CUSTOM_RUBY="echo -n '\ue23e' $RGLOBAL"
POWERLEVEL9K_CUSTOM_RUBY_BACKGROUND="red"


plugins=(
  zsh-autosuggestions
  ruby
  git
)

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# nvm config - can go into ~/.zshenv as well 
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Always eval rbenv
eval "$(rbenv init -)"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
alias vim=nvim

export PATH="$HOME/.bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

. "$HOME/.local/bin/env"
export OPENBLAS="/opt/homebrew/opt/openblas"

# Discord Integration Environment Variables
export DISCORD_SERVICE_URL=""

export EDITOR="nvim"
source /Users/robertgevorgyan/.claude/plugins/marketplaces/claude-plugins/env.sh

function getdlq() {
  if [[ -z "$1" ]]; then
    echo "Error: Queue name is required"
    echo "Usage: get-dlq-messages <queue-name> [max-messages]"
    return 1
  fi

  local dlq_url=$(aws sqs get-queue-url \
    --queue-name "$1" \
    --query 'QueueUrl' \
    --output text)

  if [[ -z "$dlq_url" ]]; then
    echo "Error: Could not retrieve queue URL for $queue_name"
    return 1
  fi

  echo "Queue URL: $dlq_url"

  aws sqs receive-message \
    --queue-url "$dlq_url" \
    --max-number-of-messages 10 \
    --visibility-timeout 0 \
    --query 'Messages[].MessageId' \
    --output text
}

alias shuffle-theme='~/.config/ghostty/shuffle-theme.sh'
