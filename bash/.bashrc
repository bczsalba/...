### PLATFORM AND HOSTNAME ACTIONS
#
case "${unameOut}" in
    Linux*)     platform=linux;;
    Darwin*)    platform=mac;;
esac

bold='\[\033[1m\]'
reset='\[\033[00m\]'

case $HOSTNAME in
    turquoise* )
        col_main='\[\033[38;5;109m\]'
        col_accent='\[\033[38;5;110m\]'
        alias fn='open -a Finder .'
        ;;

    turquoise_old* )
        col_main='\[\033[38;5;60m\]'
        col_accent='\[\033[38;5;146m\]'
        alias fn='open -a Finder .'
        ;;

    maci* )
        col_main='\[\033[38;5;140m\]'
        col_accent='\[\033[38;5;146m\]'
        ;;

    "turtl" )
        col_main='\[\033[38;5;222m\]'
        col_accent='\[\033[38;5;214m\]'
        ;;

    "malni" )
        col_main='\[\033[38;5;203m\]'
        col_accent='\[\033[38;5;149m\]'
        ;;

    "nectarine" )
        col_main='\[\033[97m\]'
        col_accent='\[\033[90m\]'
        ;;
esac

### FUNCTIONS
#
set_ps1() {
    export PS1="$bold$col_main\u: $col_accent\W $col_main\$$reset "
    export SUDO_PS1="$bold\[\033[38;5;210m\]\u: $col_accent\W $col_main#$reset "
}

export -f set_ps1

# Change to current finder directory
cf() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

push() {
    rsync -r "$1" "pi@malni.local:/home/pi/sync/$2" | tqdm --unit-scale
}

pull() {
    rsync -r "pi@malni.local:/home/pi/sync/$1" "$2" | tqdm --unit-scale
}

push_mov() {
    filename=$(basename -- "$1")
    fallback="${filename%.*}.mp4"

    case "$2" in
        "") hostedname=$fallback ;;
        *)  hostedname=$2 ;;
    esac

    ffmpeg -i "$1" -q:v 0 "/tmp/host-mov.mp4"
    push "/tmp/host-mov.mp4" $hostedname
    rm "/tmp/host-mov.mp4"
}

lorem () {
    count="$1"

    if [ "$count" = "" ]; then
        count="5"
    fi

    curl -s http://metaphorpsum.com/paragraphs/"$count"
    echo ""
}

make_favicon() {
    convert "$1"  -bordercolor white -border 0 \
          \( -clone 0 -filter point -resize 16x16 \) \
          \( -clone 0 -filter point -resize 32x32 \) \
          \( -clone 0 -filter point -resize 48x48 \) \
          \( -clone 0 -filter point -resize 64x64 \) \
          -delete 0 -alpha off -colors 256 favicon.ico
}

function pcop() {
    if [[ $platform = "linux" ]]; then
        echo "cd `pwd`" | xclip -sel c
    else
        echo "cd `pwd`" | pbcopy
    fi
}

ssh() {
    TERM=xterm-256color /usr/bin/ssh $@
}

amp() {
    AMP_TOOLBOX=".amp:../.amp:$AMP_TOOLBOX" command amp $@
}

set_ps1

### ALIASES
#
alias gap='git commit -p'
alias vim="nvim"

### AUTO INSERTED
#
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

. $HOME/.bash_profile
