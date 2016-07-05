
git_prompt ()
{
	local ref=$(git symbolic-ref HEAD 2> /dev/null || \
        git rev-parse --short HEAD 2> /dev/null) 

	if test -n "$ref"
	then
		echo -n " %B"
		echo -n "%{$fg[blue]%}( "
		echo -n "%{$fg[green]%}${ref#refs/heads/}"
		echo -n "%{$fg[blue]%} )"
		echo -n "%b"
	fi
}

git_rprompt ()
{
	if test -n "$(git status --porcelain --untracked-files=no 2> /dev/null)"
	then
		echo -n "DIRTY"
	elif test -n "$(git status --porcelain 2> /dev/null)"
	then
		echo -n "NEW FILES"
	fi
}

autoload -U colors && colors
setopt prompt_subst

PROMPT=$'%{$fg[green]%}%n: %{$fg[blue]%}%~ $(git_prompt)
%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})➜ %{$reset_color%} '
RPROMPT='$(git_rprompt)'
