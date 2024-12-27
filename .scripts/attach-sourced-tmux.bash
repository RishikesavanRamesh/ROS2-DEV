#!/bin/bash

SESSION_NAME="sourced"

# Create a new session if it does not exist
if ! tmux has-session -t $SESSION_NAME 2>/dev/null; then
    # Create a new session in detached mode
    tmux new-session -d -s $SESSION_NAME

    # Set up tmux options for the session
    tmux send-keys -t $SESSION_NAME 'tmux set-option prefix C-a' C-m
    tmux send-keys -t $SESSION_NAME 'tmux set-option prefix2 C-b' C-m
    tmux send-keys -t $SESSION_NAME 'tmux set mouse on' C-m
    tmux send-keys -t $SESSION_NAME 'tmux bind C-c run "tmux save-buffer - | xclip -i -sel clip"' C-m
    tmux send-keys -t $SESSION_NAME 'tmux bind C-v run "tmux set-buffer $(xclip -o -sel clip); tmux paste-buffer"' C-m

    # Set background and foreground colors for the status bar
    tmux send-keys -t $SESSION_NAME 'tmux set status-bg colour17' C-m
    tmux send-keys -t $SESSION_NAME 'tmux set status-gg colour81' C-m
    

    # Set the default command to source ROS environment and start bash
    # tmux send-keys -t $SESSION_NAME 'tmux set-option default-command "[ -f /opt/ros/humble/setup.bash ] && source /opt/ros/humble/setup.bash ; [ -f /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash ] && source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash ; exec bash"' C-m
    tmux send-keys -t $SESSION_NAME 'tmux set-option default-command "bash --rcfile /workspace/.scripts/sourcerc"' C-m
    tmux send-keys -t $SESSION_NAME 'bash' C-m
    tmux send-keys -t $SESSION_NAME 'source /workspace/.scripts/sourcerc' C-m
    

    tmux send-keys -t $SESSION_NAME 'clear ; echo -e ">>> sourced ros2."' C-m

fi

# Attach to the session
tmux attach-session -t $SESSION_NAME
