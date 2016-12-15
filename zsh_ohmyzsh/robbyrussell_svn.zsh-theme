local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local user="%{$fg[cyan]%}%m%{$reset_color%}"
PROMPT='${user} ${ret_status}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)$(svn_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_THEME_SVN_PROMPT_PREFIX="%{$fg_bold[blue]%}svn:(%{$fg[green]%}"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗ "
ZSH_THEME_SVN_PROMPT_CLEAN="%{$fg[blue]%}) "
