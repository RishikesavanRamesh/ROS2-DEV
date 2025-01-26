add a readme
add ros2-devcontaioner like admiring samples ,
add about windows, codespaces, and linux support, 
**explain the setup , ssh , docker build workflow, and so on** .... :: marked as must
might also wanna add linting and batches for verifing features...
move the todo to github project

- EP25 tasks for gdb also 
- check if adding the user developer to dialout group is needed
- also add docker security tesing reports convincingly  

- docker file should be images on diff levels based on the base, simulation, , full, desktop or any other intermediate levels and should be build and exported , thinking in that perspective. eg: desktop may have eclipse trace-compass, but base should not even have unminimized mans.

- use file-server as needed and opt. eg: in the packages print, or in the actions build ( docker file build ) getting the working versions or new install instructions of softwares. as a script. this will increase maintainability

- add build results in readme, which is working and which is not,
- think of including the simple tracer( from the construct )in full; and the binary should be build in separate repo, and be hosted there, and the getting and install will be using the file-server script.

- add record and play topics, services( from jazzy ) tasks using ros2bag  ( do not use tasks heavily, but use scripts as they can be interfaced into tasks easily if needed)

- ros2tracing should be enabled in linux only and if possible or document its limits for windows.  newly installed in system : lttng-modules-dkms ; and unminimized ; also installed ros-humble-tracetools*

- installing tracecompass-server at /usr/bin/tracecompass-server will make the tracecompass server companion plugin for traccompass viewer


- make the container defintions ( devcontainer totally, containerfile, and devcontainer features ) to be abled to run multiple times. as this would helps saving container and using the saved container... 

- should have only less amount of configurations to the base image so to minimize image pulled time to devcontainer uptime...




# EPs:

- ~~EP01 get and update deps using rosdep .~~
- ~~EP06 use prebuild docker image in the compose ( with ep01 of this specific repo)~~ 
- ~~EP19 x11 TO USE XEPHYR~~
- ~~EP05 update the file execution permission level for the .sh files in the root of this workspace ( build , setup, test bash scripts )~~
- ~~DROPPED: EP21 tasks not opening inside devcontainer using keybindings ctrl + ;~~
- ~~EP18 workspace ownership needs to be updated~~
- ~~EP02 post-create-script.sh make it inline file if possible~~ 
- ~~EP11 mount /dev as devices instead of volumes add that so it is working if devices are present in local devcontainers or in the remote codespace~~
- ~~DROPPED : EP16 add username uid and gid from the devcontainer, however much that is possible... and care for that the packages generated from ros2 pkg use the system username as the maintainer name :: WILL BE CARED ABOUT IN TEMPLATING~~
- ~~DROPPED : EP09 use a mock package to have the dev dependencies and once its been to prod , we can do something like colcon_ignore inside the dir. :: EVERYTHING FOR DEVELOPMENT WILL BE IN DEVCONTAINER~~
- ~~EP07 guess need to chown -r developer /tmp in post-start.script~~


- ~~DROPPED : EP10 need a add an additional file that will be sourced in post-scripts(one time sourceable or put in bashrc upto the user but need to provide provisions) which is for the particular project. :: DROPPING IN MERCY OF CONFIGURED TASKS~~

- ~~EP24 should update to vulcanexus humble base image~~
- ~~EP12 need to use the rosteamworkspace folder structure for development~~

- ~~EP22 add templating from rtworking group into tasks~~
- ~~EP27 create a list of softwares that are installed in the system , and make that image specific and also show it in the startup or print it on console.~~ 

- ~~revise the post install script,(ssh keys not needed, also rosdep init is also not require, rosdep init should be moved to tasks)~~ :: completed

- ~~Dropped:: EP13 give a robot start script here in the repo, for anyone to just run it and pull the build foss docker image (or probably private docker repo prompting a docker access secret to enter) :: dropped as this setup is entirely for development while this idea is for deployment or demo ~~
- ~~consider /workspace to /home/developer/workspace and mounting the /home/devloper in the vscode workspacefolder, so the .ros/tracing can be used by the trace viewer ext, and also other dot files can be viewed while still maintaining the git structure for the workspace folder..~~

- ~~EP23 why not mounting everything inside of /tmp/workspace so that one can easily save the contaienr for tools and softwares and the source code remains clean outside of container.~~  this is not needed as commiting containers will not have the mounts.


~~EP26 SHOULD ADD THE AUTO LISTING OF DIRS FOR INPUT FOR RTW TASKS~~ should not focus on tightly binding the setup with vscode ( should be finely workable in cli)

~~- make the readme open when starting devcontainer~~ not necessary 

~~- opening new terminals is slower ( ros, vulcanexus both are sourcing) ~~ this is solved already by only sourcing ros and not vulcanexus, where not needed..


~~- add unminimize for manuals in devcontainer~~ will not focus on this as it is trivial

~~- add colcon_ignore to all pakcages .gitignore ~~  nothing to do directly, in the setup. but has to be practiced.

~~- add backward_ros in rtw_templates ~~  will not be feasible to do this in separate fork or in mainstream repo with pr as it is a development mainly for development , though is very simple to add.. 

~~- check if the subpackages are working with existing tasks settings~~ done already

~~- git username and email has to be configured firstly. then github can be connected with the same vscode account.( github account)~~

~~- install xclip for tmux copy paste, icewm also~~ already done

~~- add prebuilds for codespace~~ making saving and reusing containers will fulfil the requirement of this requirement.

~~- EP15 add the platformio, wowki sim within here,~~ configure and use them if and when they are needed( wowki is still a no, as it is oss but freemium and account needed)
~~- EP17 colcon hooks location updated in jazzy, ( why not maintain two branch )~~ solved . two branch approch is hard to maintain, thus dropped..

~~explain the .env file things and everything else etc ...~~ dropped such setting
~~also explain ( yet to be added ) build tasks configurations... ~~

### for later

- EP03 check and find if we can control the default location where the rosdep install python pacakges( using envs) and do multiple versions of things in one program using .dsv.in files' help // solved ; only needed in jazzy 
- EP20 RSS FEED OF github action builds of ros and other projects,>> not related to this directly but important.

## usbip
        - EP08 if codespace add the methods and tools if possible to connect local devices to the codespacee and create a compatible companion script 
        - EP04 also keep an eye for wsl2 development to know updates about usb integration in dev contianers

- EP14 add contributing guide (devcontainer and so) along with the above how to run with in the readme 




### issues : 
- i01: configured task ( purge failed saying cannot allocate ptr in this ros-tws-shell) :: solved when not mounting /dev:/dev have to look into it
- setup-robot-description added the add_test twice in cmakelist, which causing failure of the package // it seems running init of setup-robot-description twice without removing dir is the issue..
- when templating hardware interface package the cmake cannot find some files that are of hardware interface package and related, should preinstall any necessary packages for the template to work when giving the template option :: updated:: after rosdep install deps , it is reduced to only ament_add_gmock cmake command not found  :: updated ::: adding this line solves the error ```find_package(ament_cmake_gmock REQUIRED)```


- also add .gitkeep in templated empty folder or keep the .gitkeep within the templates :: mostly it is done internally



############

developer@0a7a70eb1536:<humble>workspace$ ros2 daemon status
The daemon is running
developer@0a7a70eb1536:<humble>workspace$ sudo apt install ros-humble-demo-cpp-nodes -y 
sudo: /etc/sudoers is owned by uid 1000, should be 0
sudo: no valid sudoers sources found, quitting
sudo: error initializing audit plugin sudoers_audit
developer@0a7a70eb1536:<humble>workspace$ sudo apt update
sudo: /etc/sudoers is owned by uid 1000, should be 0
sudo: no valid sudoers sources found, quitting
sudo: error initializing audit plugin sudoers_audit
developer@0a7a70eb1536:<humble>workspace$ apt update
Reading package lists... Done
E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
E: Unable to lock directory /var/lib/apt/lists/ observed when silver bullet hit hard



------------------------------------


developer@6953e98b98e0:/workspace$ sudo
sudo: /usr/bin/sudo must be owned by uid 0 and have the setuid bit set
developer@6953e98b98e0:/workspace$ sudo
usage: sudo -h | -K | -k | -V
usage: sudo -v [-ABknS] [-g group] [-h host] [-p prompt] [-u user]
usage: sudo -l [-ABknS] [-g group] [-h host] [-p prompt] [-U user] [-u user] [command]
usage: sudo [-ABbEHknPS] [-r role] [-t type] [-C num] [-D directory] [-g group] [-h host] [-p prompt] [-R directory] [-T timeout] [-u user] [VAR=value] [-i|-s]
            [<command>]
usage: sudo -e [-ABknS] [-r role] [-t type] [-C num] [-D directory] [-g group] [-h host] [-p prompt] [-R directory] [-T timeout] [-u user] file ...
developer@6953e98b98e0:/workspace$ # have run the following as root inside the container ,
developer@6953e98b98e0:/workspace$ # chown root:root /usr/bin/sudo
developer@6953e98b98e0:/workspace$ # chmod 4755 /usr/bin/sudo
developer@6953e98b98e0:/workspace$ 


also changed for /etc/sudoers file

############

using with  priviledged, causes no ros2 transport over dds, with the given xml config. (fastdds)



################
################
################
################
################
################


configuring pre-commit

sudo apt install locales;
sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8

pip3 install pre-commit ; 
sudo apt install python3-ament-cpplint python3-ament-cppcheck python3-ament-copyright -y

#test-signing-commit 
# test-singing-commit :container :emacs-tramp :magit  ====> sign missed 
# retrying again ====> signing failed still


## singing test 03 
