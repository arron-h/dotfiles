#
# Arron's .bashrc
# This file configures bash to be more useful
#

export PATH=/usr/local/bin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim

# Load aliases
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Regular colors
BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"

# Emphasized (bolded) colors
BBLACK="\033[1;30m"
BRED="\033[1;31m"
BGREEN="\033[1;32m"
BYELLOW="\033[1;33m"
BBLUE="\033[1;34m"
BMAGENTA="\033[1;35m"
BCYAN="\033[1;36m"
BWHITE="\033[1;37m"

# Reset
RESET="\033[0;0m"

# Customize the command prompt
TEXT_USERNAME='\u'
TEXT_AT=' at '
TEXT_HOSTNAME='\h'
TEXT_IN=' in '
TEXT_WORKING_DIRECTORY='\w'

if [ "$UID" == 0 ] || [ $TEXT_USERNAME == "root" ] ; then
    COLOR_USERNAME="\[$BRED\]"
else
    COLOR_USERNAME="\[$BYELLOW\]"
fi

if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] ; then
    COLOR_HOSTNAME="\[$BMAGENTA\]"
else
    COLOR_HOSTNAME="\[$BBLUE\]"
fi

COLOR_WORKING_DIRECTORY="\[$BCYAN\]"

function __git_prompt
{
	GIT_CHANGES_COLOUR=$RED
	GIT_NOCHANGES_COLOUR=$GREEN

	GIT_PS1_SHOWDIRTYSTATE=1
	
	# The general gist of the following sed command is as follows:
	# 1. Exploit the fact that git branches can't have spaces. So search for a string which does not have a space.
	# 1.1. If this matches, set colour to NOCHANGES, insert capture and skip to end of commands.
	# 2. Failing previous test, assume that the repo has changes because a space has been found, which indicates a following change state marker.
	# 2.2. Remove change markers as we're using colourisation to show the change state.
	# 3. Insert the full output and prefix the CHANGES colour.
	__git_ps1 "%s" | sed -e "s/^\([^ ]\{1,\}\)$/ on $(printf $GIT_NOCHANGES_COLOUR)\1/;t" -e "s/ [*+#]\{1,\}//" -e "s/^/ on $(printf $GIT_CHANGES_COLOUR)/"
}

PS1="$COLOR_USERNAME$TEXT_USERNAME$RESET$TEXT_AT$COLOR_HOSTNAME$TEXT_HOSTNAME$RESET\
$TEXT_IN$COLOR_WORKING_DIRECTORY$TEXT_WORKING_DIRECTORY$RESET\
\$(__git_prompt)$RESET\n$ "
PS2="> "
