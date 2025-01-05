# Define the build argument with a default value
ARG ROS_DISTRO="humble"
ARG USERNAME="developer"
ARG GROUPNAME="developer"
ARG GROUP_GID="1000"
ARG USER_UID="1000"
# Conditionally set the base image based on the argument
FROM eprosima/vulcanexus:${ROS_DISTRO}-desktop

ARG ROS_DISTRO
ARG USERNAME
ARG GROUPNAME
ARG GROUP_GID
ARG USER_UID


ENV SHELL /bin/bash
# # Install sudo
RUN <<EOF
apt-get update 
apt-get install -y sudo openssh-client rsyslog python3-pip curl
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF

## Install additional softwares
RUN <<EOF
apt-get update 
apt-get install -y icewm tmux xclip
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF


RUN <<EOF
apt-get update 
apt-get install -y ros-${ROS_DISTRO}-rmw-cyclonedds-cpp
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF


#RUN userdel ubuntu
RUN groupadd --gid $GROUP_GID $USERNAME
RUN useradd --uid $USER_UID --gid $GROUP_GID --create-home $USERNAME
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME
    
COPY <<EOF /post-create-script.sh
#!/bin/bash
bash /workspace/.scripts/post-create-script.bash
EOF

RUN chmod +x /post-create-script.sh

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
CMD ["/bin/bash"]
