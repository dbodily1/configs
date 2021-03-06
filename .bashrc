#PATH VARIABLE CHANGES
#colorgcc
# export PATH="/home/vab5007/bin/":$PATH
# export CCACHE_PATH="/usr/bin"

# export GREP_OPTIONS='--exclude-dir=.svn --exclude-dir=build --color=auto'
# export GREP_OPTIONS='--exclude-dir=build --color=auto'
# export SCREENRC="~/.screenrc"


# export SVN_EDITOR=vim
# export BASE=~/catkin_ws
alias grep='grep --exclude-dir=build --color=auto'
alias c="clear"
alias cb="pushd . && base && catkin build && popd"
alias cbd="pushd . && base && catkin build -DCMAKE_BUILD_TYPE=Debug && popd"
alias ls="ls --color=tty"
alias b="cd .."
# alias matlab="/apps/matlab_r2015b/bin/matlab"
alias open="xdg-open"
alias updatectags="cd && ./gentags.sh"
alias updatetags="cd && ./gentags.sh"
alias sudo="dzdo"
alias vimall="vim -p *"
alias sb="source ~/.bashrc && echo 'bash sourced!'"
alias st="pushd . && base && source devel/setup.bash && popd && echo 'Sourced /devel/setup.bash'"
alias gitdiff="diff $1"

#ROS Aliases
alias rte="rostopic echo /"
alias rtp="rostopic pub /"
alias rtl="rostopic list"

# alias sd="cd $WORKBASE"
# alias vb="vim ~/.bashrc"
# alias untrackedfiles="svn st | grep '^?' | awk '{print $2}'"
# alias removeuntrackedfiles="svn st | grep '^?' | awk '{print $2}' | xargs rm -rf"
# alias removeorigfiles="svn status | grep .orig | awk '{print $2}' | xargs rm -rf"
# alias removebakfiles="svn status | grep .bak | awk '{print $2}' | xargs rm -rf"
alias svndiff='vimdiff <(svn diff)'

# Make Alias Here Function
#mah() {
#    #do things with parameters like $1 such as
#    echo "alias cd${PWD##*/}='cd ${PWD}'" >> ~/.bashrc
#}

#return to base of branch

#finds dependicies for given build - 
dtree() {
    export curr_dir=${PWD}
    base
    if (test ${PWD##*/} != 'debug') && (test ${PWD##*/} != 'release')
    then
        cd build/release || cd build/debug || (echo "Error: Must relocate to base or build file first" && return)
    fi
    if [ -e graph.dot ]
    then
        echo "Tree Already Generated"
    else
        echo "Generating Tree"
        cmake --graphviz=graph.dot .
    fi
    if [ "$1" = "" ]; then
        dot -Tps graph.dot -o $1.ps
    else
        if [ "$2" = "--up" ] || [ "$2" = "-u" ] || [ "$2" = "-up" ] || [ "$2" = "--u" ] ; then
            echo "Dependers Tree"
            dot -Tps graph.dot.$1.dependers -o $1.ps
        else
            dot -Tps graph.dot.$1 -o $1.ps
        fi
    fi
    open $1.ps &
    cd $curr_dir
}
#rebuild the current branch
#rebuild with libraries
# rbl(){
#     export curr_dir=${PWD}
#     base
#     rm -rf simulation/IFS/lib/python/
#     buildit -j20
#     cd $curr_dir
#     ls
# }
diff(){
    if [ "$#" -le 0  ]; then
        git diff | vim -R -
    else
        git diff $1 | vim -R -
    fi
}

sdiff(){
    if [ "$#" -le 0  ]; then
        git diff --staged | vim -R -
    else
        git diff --staged $1 | vim -R -
    fi
}

base(){
    while (test ${PWD##*/} != 'a9gdkzz'); do
        cd ..
    done
    cd -
}

#Source Branch
#May be helpful to source ROS
tags(){
    export curr_dir=${PWD}
    cd && ./gentags.sh
    cd $curr_dir
}

#Helpful for adjusting tabs in python scripts
# retab(){
#     /projs/cs/pub/FUEL/collabsys-1.4.12.2/Linux-x86_64-gcc4.4/src/resources/python-2.7.2/Tools/scripts/reindent.py $1
# }

 


#Bad shortcut - gets yo uin to trouble


sedit(){
    if [ "$#" -le 1  ]; then
        echo "USAGE:  sedit <stringToBeReplaced> <stringToReplaceWith>"
        echo "USAGE:  add the '-w' option to make the write"
        set -e
    fi
    echo "Usages found in these files, grep to see usages."
    grep -RZl $1 | xargs -0 -l
 
    if [ "$#" -eq 3 ] && [ "$3" == "-w" ];
    then
        grep -RZl $1 | xargs -0 -l sed -i -e "s/$1/$2/g"
        echo "$1 has been replaced with $2"
    fi
}


#Set thread limit
# ulimit -u 2048
# ulimit -n 4096

# PS1="\[\e[33m\]\h-\[\e[m\]\[\e[33m\]\W:\[\e[m\] "
# PYTHON OPTIONS

source /opt/ros/melodic/setup.bash
# source /home/a9gdkzz/ws_moveit/devel/setup.bash
# source /home/a9gdkzz/catkin_ws/devel/setup.bash
source /home/a9gdkzz/ws/devel/setup.bash --extend
# source /srv/ws_moveit/devel/setup.bash --extend
# source ~/peel_ws/devel/setup.bash --extend

#Shows Computer-Currenty Folder - Git Branch in prompt
# export PS1="\[\e[32m\]\h \[\e[m\]\[\e[34m\]\W\[\e[m\] \$(git branch 2>/dev/null | grep '^*' | colrm 1 2): "
export PS1="\[\e[32m\]\h  \$(git branch 2>/dev/null | grep '^*' | colrm 1 2) \[\e[m\]\[\e[34m\]\W\[\e[m\]: "
# export PS1="\[\e[32m\]\h \[\e[m\]\[\e[34m\]\W\[\e[m\] \$(git branch 2>/dev/null | grep '^*' | colrm 1 2): "
# alias bringup='roslaunch mvt_crplr_bringup candy_magician_peel_tabbed.launch sim:=false use_rsi:=true rsi_listener_ip:=192.168.2.102'
# alias orchestrator='rosrun mvt_test_orchestrators orch_node'
# alias generate='rosrun mvt_test_orchestrators generate_stochastic_experiment'
# alias run_experiment='rosrun mvt_test_orchestrators run_experiment'
# alias mount_crplr='dzdo mount -t cifs -o username=a9gdkzz,domain=usac,vers=1.0,uid=541788875,gid=100,nobrl //usfile01/crplr /home/a9gdkzz/crplr'
