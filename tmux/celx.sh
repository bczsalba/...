#!/bin/bash
export WORK_DIR=~/Code/$1

cd $WORK_DIR

tmux new-session -d -s celx
tmux send-keys "cd $WORK_DIR" C-m C-l

tmux new-window -d -n celx "cd $WORK_DIR/server; php -S 0.0.0.0:8080"

tmux attach -t celx
