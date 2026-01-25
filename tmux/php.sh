#!/bin/bash
WORK_DIR=~/Code/$1

cd $WORK_DIR

tmux \
    new-session -s php \; \
    new-window "echo `pwd`; php -S 0.0.0.0:9999" \; \
    split-window "npx tailwindcss -i res/base.css -o res/tailwind.css -w" \; \
    detach-client

tmux a -t php
cd $WORK_DIR
