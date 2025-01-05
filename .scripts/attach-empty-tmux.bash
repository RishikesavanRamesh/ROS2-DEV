#!/bin/bash

SESSION_NAME="unsourced"

# Create a new session if it does not exist
if ! tmux has-session -t $SESSION_NAME 2>/dev/null; then
    # Create a new session in detached mode
    tmux new-session -d -s $SESSION_NAME

    # Enable two prefixes and clipboard integration within the session
    tmux send-keys -t $SESSION_NAME 'tmux set-option prefix C-a' C-m
    tmux send-keys -t $SESSION_NAME 'tmux set-option prefix2 C-b' C-m
    tmux send-keys -t $SESSION_NAME 'tmux set mouse on' C-m
    tmux send-keys -t $SESSION_NAME 'tmux bind C-c run "tmux save-buffer - | xclip -i -sel clip"' C-m
    tmux send-keys -t $SESSION_NAME 'tmux bind C-v run "tmux set-buffer $(xclip -o -sel clip); tmux paste-buffer"' C-m

    # Set status bar background and foreground colors for this session
    tmux send-keys -t $SESSION_NAME 'tmux set status-bg violet' C-m
    tmux send-keys -t $SESSION_NAME 'tmux set status-fg white' C-m

    # Set the default command to bash in this session
    tmux send-keys -t $SESSION_NAME 'tmux set-option default-command "bash"' C-m
    tmux send-keys -t $SESSION_NAME 'bash' C-m
    tmux send-keys -t $SESSION_NAME 'clear ; echo ">>> ros2 not sourced. :("' C-m
fi

# Attach to the session
tmux attach-session -t $SESSION_NAME
