
if [ "$USE_UNICODE_GLYPHS" = "y" ]
then
    GIT="\ue725"
    GITHUB="\uf113 "
    GITLAB="\uf296 "

    DIRTY="!"
    NEW="?"

    UP="\uf63e"
    DOWN="\uf63b"

    FOLDER="\uf07c "

    AWS="\uf0c2 "

    ERROR="\uf46e"

    ARROW=">"
else
    GIT="branch:"
    GITHUB="GH"
    GITLAB="GL"

    DIRTY="!"
    NEW="?"

    UP="^"
    DOWN="v"

    FOLDER=""

    AWS="aws"

    ERROR="!"

    ARROW=">"
fi
