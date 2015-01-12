#
# Arron's .bash_aliases
# This file contains useful aliases and functions when running under a bash terminal
#

# Aliases
if [ "$(uname)" == "Darwin" ]; then
	BREW_VIM_CMD=$(brew --prefix macvim)/MacVim.app/Contents/MacOS/Vim
	if [ -f $BREW_VIM_CMD ]; then
		alias vim=$BREW_VIM_CMD
	fi
fi
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Enable color support of ls and also add handy aliases
if [ "$(uname)" == "Linux" ]; then
	if [ -x /usr/bin/dircolors ]; then
		test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
		alias ls='ls --color=auto'
		alias grep='grep --color=auto'
		alias fgrep='fgrep --color=auto'
		alias egrep='egrep --color=auto'
	fi
fi

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Functions
dirsize ()
{
	du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
	egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
	egrep '^ *[0-9.]*M' /tmp/list
	egrep '^ *[0-9.]*G' /tmp/list
	rm /tmp/list
}
