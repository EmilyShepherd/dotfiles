
if echo "$TERM" | grep -q xterm
then
    USE_UNICODE_GLYPHS=${USE_UNICODE_GLYPHS:-y}
    USE_LINE_WRITES=${USE_LINE_WRITES:-y}
fi

# Dumb functions which zle apparently needs
function zle-line-init()
{
	test "$USE_LINE_WRITES" = "y" && echoti smkx
}

function zle-line-finish()
{
	test "$USE_LINE_WRITES" = "y" && echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish

