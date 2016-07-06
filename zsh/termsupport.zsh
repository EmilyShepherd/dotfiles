function title
{
    print -Pn "\e]2;$1:q\a"
}

# Runs before showing the prompt
function precmd
{
  title ${PWD/~/\~}
}

# Runs before executing the command
function preexec
{
  title "%100>...>${2:gs/%/%%}%<<"
}

