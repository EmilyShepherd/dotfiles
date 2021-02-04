
git_prompt ()
{
	local ref=$(git symbolic-ref HEAD 2> /dev/null || \
        git rev-parse --short HEAD 2> /dev/null) 

	if test -n "$ref"
	then
		echo -n "%{$fg[white]%}on %{$fg[green]%}"

        if git config -l | grep remote | grep -q gitlab
        then
            echo -n "$GITLAB "
        fi

        if git config -l | grep remote | grep -q github
        then
            echo -n "$GITHUB "
        fi

        echo -n "$GIT ${ref#refs/heads/} "
	fi

	if test -n "$(git status --porcelain --untracked-files=no 2> /dev/null)"
	then
		echo -n "%{$fg[red]%}$DIRTY "
	elif test -n "$(git status --porcelain 2> /dev/null)"
	then
		echo -n "%{$fb[red]%}$NEW "
	fi
}

folder_prompt() {
    echo -n "%{$fg[blue]%}$FOLDER %~ "
}

arrow() {
    echo -n "%{$fg_bold[green]%}$ARROW %{$reset_color%}"
}

prompt() {
    echo
    folder_prompt
    git_prompt
    echo
    arrow
}

rprompt() {
    if test -n "$PROMPT_HOST"
    then
        echo "$PROMPT_HOST"
    fi
}

reset_term() {
    OLD_PROMPT="$PROMPT"
    OLD_RPROMPT="$RPROMPT"
    PROMPT=$'
$(arrow)'
    RPROMPT=''
    zle accept-line
    zle reset-prompt
    PROMPT="$OLD_PROMPT"
    RPROMPT="$OLD_RPROMPT"
}
zle -N reset_term
bindkey "^M" reset_term

autoload -U colors && colors
setopt prompt_subst

test -z "$NO_CLEAR_CONSOLE" && printf '\n%.0s' {1..100}

PROMPT='$(prompt)'
RPROMPT='$(rprompt)'

