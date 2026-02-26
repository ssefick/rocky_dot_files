#JAVA
JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk.x86_64/jre/bin/

unset GTK_MODULES


#################################SET Complicated PATHS#####################3#############################
#pandoc
PATH=/home/ssefick/.local/bin:$PATH

PATH=$PATH:~/bin:~/bin/igmt_1.2:/sbin:~/scripts:~/grass_scripts:~scripts/GRASS_scripts/lidar:~/bin/bin

#mpicxx
PATH=$PATH:/usr/lib64/mpich/bin/


PATH="$(
    find /home/ssefick/scripts -mindepth 1 -maxdepth 1 -type d -print\
        | perl -ne 'chomp; print"${_}:";'
)${PATH}" ;


PATH="$(
    find /home/ssefick/grass_scripts -mindepth 1 -maxdepth 1 -type d -print\
        | perl -ne 'chomp; print"${_}:";'
)${PATH}" ;

export NETCDFHOME=/usr/lib

NETCDF_PREFIX=$NETCDFHOME

GMTHOME=/usr/lib/gmt

export GMTHOME

PATH="$PATH:$GMTHOME/bin"

export PATH

MANPATH="$MANPATH:$GMTHOME/man"

export MANPATH

PLOTICUS_PREFABS=/usr/share/ploticus/prefabs/

export PLOTICUS_PREFABS

#BioPerl gitclone
##export PERL5LIB="/home/ssefick/source/BioPerl/bioperl-live:$PERL5LIB"
######################################################################

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -al'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# General aliases for everyday functions
alias ll='ls -FGahl'
alias desktop='cd ~/Desktop'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias rmdir='rmdir -i'
alias bye='exit'
alias tarball='tar --verbose -pczf'
alias unpacktarball='tar xvfz'

#change is ssh port is ever different
alias copy='scp -P 50022'

#redhat alias
alias update='yum update'

#Various environmental settings (prompt, colors, etc)
export LESS='eMq'
export EDITOR="emacs -nw"

#change dir to purple, so can be seen well in emacs cobalt theme!!!
LS_COLORS=$LS_COLORS:'di=00;35:' ; export LS_COLORS

#test
export TERM=xterm-256color

# added by Anaconda3 4.1.1 installer
export PATH="/home/ssefick/anaconda3/bin:$PATH"
export PATH="/home/ssefick/anaconda3/lib/python3.5/site-packages:$PATH"

##add PATH to emacs build
##export PATH="/home/ssefick/bin/emacs_24.5/bin:$PATH"

##add gnome-terminal hack...
PATH="/home/ssefick/scripts/system:$PATH"

##git
PATH="${HOME}/bin/bin:$PATH"

##
PATH="/home/ssefick/.cabal/bin:$PATH"

##Add cd with history of 10 last directories - http://linuxgazette.net/109/marinov.html
##source acd_func.sh
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH"
alias config='/usr/bin/git --git-dir=/home/ssefick/.cfg/ --work-tree=/home/ssefick'
