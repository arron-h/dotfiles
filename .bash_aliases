#
# Arron's .bash_aliases
# This file contains useful aliases and functions when running under a bash terminal
#

# Aliases
BREW_VIM_CMD=$(brew --prefix macvim)/MacVim.app/Contents/MacOS/Vim
if [ -f $BREW_VIM_CMD ]; then
	alias vim=$BREW_VIM_CMD
fi
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Functions
dirsize ()
{
	du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
	egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
	egrep '^ *[0-9.]*M' /tmp/list
	egrep '^ *[0-9.]*G' /tmp/list
	rm /tmp/list
}
