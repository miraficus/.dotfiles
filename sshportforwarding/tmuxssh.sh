#!/bin/bash

# Set Session Name
SESSION="vpsssh"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with selected name
    tmux new-session -d -s $SESSION

    tmux rename-window -t 0 'VPSssh'
    tmux send-keys -t 'VPSssh' 'cd /home/mira/sshportforwarding/' C-m './forwardservices.sh' C-m

    tmux split-window -v -l 50%

    tmux send-keys -t 1 'cd /home/mira/' C-m 'ls -lah' C-m

fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
