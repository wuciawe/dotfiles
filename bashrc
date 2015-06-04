#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


export JAVA_HOME=~/bin/java/jdk
export SCALA_HOME=~/bin/typesafe/scala
export PATH=$JAVA_HOME/bin:$SCALA_HOME/bin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
