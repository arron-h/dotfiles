# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell_svn"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git svn command-not-found jira sudo web-search)

source $ZSH/oh-my-zsh.sh

# User configuration
##############################
# Exports
##############################
# You may need to manually set your language environment
export LANG=en_GB.UTF-8

export PATH=$PATH:/arm/devsys-tools/abs

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    if [ "$(uname)" = "Darwin" ]; then
        export EDITOR='mvim'
	else
		export EDITOR='gvim'
	fi
fi

##############################
# Aliases
##############################
if [ "$(uname)" = "Darwin" ]; then
	BREW_VIM_CMD=$(brew --prefix macvim)/MacVim.app/Contents/MacOS/Vim
	if [ -f $BREW_VIM_CMD ]; then
		alias vim=$BREW_VIM_CMD
	fi
fi

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias lock="xscreensaver-command -lock"

# SVN alias
alias svndiff="svn diff --diff-cmd='meld'"
alias svnstat="svn status | grep 'M\s'"

##############################
# Login items
##############################
if command -v archey >/dev/null 2>&1; then
  archey
fi

# Load the environment variable file for SSH sessions
REMOTE_DISPLAY_ENV_FILE="$HOME/.config/xorg_remote_display.env"
if [ -n "$SSH_TTY" ]; then
	if [ -f "$REMOTE_DISPLAY_ENV_FILE" ]; then
		echo "Loading remote display environment file..."
		. $REMOTE_DISPLAY_ENV_FILE
		rm $REMOTE_DISPLAY_ENV_FILE
	fi
fi
