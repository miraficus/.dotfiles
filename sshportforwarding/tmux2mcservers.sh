#!/bin/bash

# Set Session Name
SESSION="mcservers"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with selected name
    tmux new-session -d -s $SESSION

    tmux rename-window -t 0 'MCServers'
    tmux send-keys -t 'MCServers' 'cd /home/mira/minecraft/server/' C-m './server-autorestart.sh' C-m

    tmux split-window -v -l 50%

    tmux send-keys -t 1 'cd /home/mira/back2beta/' C-m 'java -jar back2beta-server-1.7.9.jar' C-m

fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
