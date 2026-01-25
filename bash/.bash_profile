export EDITOR="nvim"
export HISTCONTROL="ignoreboth"

# Bin directories
export PATH="$PATH:$HOME/.local/bin:/opt/homebrew/bin:$HOME/Code/bin:$HOME/Code/bin/obsidian:$HOME/.composer/vendor/bin:$HOME/.fly/bin"
# ADB scripts
export PATH="$PATH:$HOME/.local/lib/platform-tools"
# Python versions
export PATH="$PATH:/Users/lapis/Library/Python/3.8/bin:/opt/homebrew/Cellar/python@3.9/3.9.13_1/Frameworks/Python.framework/Versions/3.9/bin"

export PROJ="$HOME/Code/Projects"
export OBSIDIAN_ROOT="/Users/lapis/Documents/Obsidian/Shelf"
export PLAYDATE_SDK_PATH="$HOME/Developer/PlaydateSDK"

export BASH_SILENCE_DEPRECATION_WARNING=1

shopt -s globstar

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.bash 2>/dev/null || :
