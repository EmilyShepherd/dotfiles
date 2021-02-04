
if [ "$USE_UNICODE_GLYPHS" = "y" ]
then
    GIT="\ue725"
    GITHUB="\uf113 "
    GITLAB="\uf296 "

    DIRTY="\uf111"
    NEW="\uf1db"

    FOLDER="\uf07c "

    ERROR="\uf46e"

    ARROW=">"
else
    GIT="branch:"
    GITHUB="GH"
    GITLAB="GL"

    DIRTY="*"
    NEW="+"

    FOLDER=""

    ERROR="!"

    ARROW=">"
fi
