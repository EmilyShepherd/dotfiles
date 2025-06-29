
_p() {
    echo -n "$@ "
}

git_prompt ()
{
	local ref=$(git symbolic-ref HEAD 2> /dev/null || \
        git rev-parse --short HEAD 2> /dev/null) 

	[ -z "$ref" ] && return

    ref="${ref#refs/heads/}"

    echo -n "%{$fg[white]%}on %{$fg[green]%}"

    (git config -l | grep remote | grep -q gitlab) && _p "$GITLAB"

    (git config -l | grep remote | grep -q github) && _p "$GITHUB"

    _p "$GIT $ref"

    if ! [ "$(git config core.bare)" = "true" ]
    then
        dirty=$(git status -s -uno | wc -l)
        new=$(git status -s | grep '?' | wc -l)

        [ "$dirty" -gt 0 ] && _p "$DIRTY$dirty"
        [ "$new" -gt 0 ] && _p "$NEW$new"
    fi

    remote=$(git config branch.$ref.remote)
    if [ -n "$remote" ]
    then
        up=$(git rev-list --count $remote/$ref..$ref)
        down=$(git rev-list --count $ref..$remote/$ref)

        [ "$up" -gt 0 ] && [ "$down" -gt 0 ] && echo -n "%{$fg[red]%}"
        [ "$up" -gt 0 ] && _p "$UP$up"
        [ "$down" -gt 0 ] && _p "$DOWN$down"
    fi
}

folder_prompt() {
    echo -n "%{$fg[blue]%}$FOLDER %~ "
}

aws_vault_prompt() {
    if [ -n "$AWS_VAULT" ]
    then
        echo -n "%{$fg[red]%}$AWS $AWS_VAULT "
    fi
}

arrow() {
    echo -n "%{$fg_bold[green]%}$ARROW %{$reset_color%}"
}

prompt() {
    echo
    folder_prompt
    git_prompt
    aws_vault_prompt
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

# If we are running in a hyprland session and we are in a terminal in the leftmost window,
# output a nice opening session fastfetch before the prompt.
if test "${XDG_SESSION_DESKTOP}" = "hyprland" || test "${XDG_CURRENT_DESKTOP}" = "Hyprland"
then
  if hyprctl clients -j | ~/.config/scripts/is_first_window.jq kitty $KITTY_PID >/dev/null
  then
    tput cup 4
    fastfetch
  fi
elif test -f /etc/motd
then
  cat /etc/motd
fi

PROMPT='$(prompt)'
RPROMPT='$(rprompt)'

