# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
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
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

my_dir="${BASH_SOURCE%/*}"
if [[ ! -d "$my_dir" ]]; then my_dir="$PWD"; fi
my_dir=$my_dir/work
source "$my_dir/bash/vndk.sh"
source "$my_dir/bash/adb.sh"
source "$my_dir/bash/envsetup.sh"
source "$my_dir/bash/m.sh"
source "$my_dir/bash/grep.sh"
source "$my_dir/bash/network.sh"
source "$my_dir/bash/perl.sh"
source "$my_dir/bash/address.sh"
source "$my_dir/bash/lint.sh"
source "$my_dir/bash/cd.sh"
source "$my_dir/bash/git.sh"
source "$my_dir/bash/uml.sh"
source "$my_dir/bash/cts.sh"
source "$my_dir/bash/gdb.sh"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export jdkHome=$JAVA_HOME
export PATH=~/bin:$JAVA_HOME/bin:$PATH
export PATH=$PATH:/home/jwkang2/work/etc/tools:/home/jwkang2/work/etc/tools/bin:/home/jwkang2/bin/LogFilter
export PATH=$PATH:/home/jwkang2/work/etc/platform-tools

export ANDROID_HOME=/home/jwkang2/work/etc
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/jwkang2/work/android/examples/conscrypt
export BORINGSSL_HOME=/home/jwkang2/work/android/examples/conscrypt/boringssl

function droot()
{
    croot
    cd device/humax/xa402h                                           
}

function troot()
{
    croot
    cd vendor/humax/src/system/CoronaTvInput/modules/dvb/tunerhal/src/main/cpp
}

function yroot()
{
    croot
    cd vendor/humax/src/system/CoronaTvInput
}

function troot2()
{
    croot
    cd vendor/humax/src/system/CoronaTvInput2/modules/dvb/tunerhal/src/main/cpp
}

function rroot()
{
    croot
    cd vendor/humax/src/system/CoronaTvInput/modules/dvb/recording/src/main/cpp
}

# added by Anaconda4 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by "conda init" !!
__conda_setup="$(CONDA_REPORT_ERRORS=false "/home/jwkang3/etc/anaconda3/bin/conda" shell.bash hook 2> /dev/null)"
if [ $? -eq 1 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/jwkang3/etc/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jwkang3/etc/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS2=false conda activate base
    else
        \export PATH="/home/jwkang3/etc/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

function jdb()
{
    adb connect 192.168.0.132
    adb remount
    adb logcat -G 30M
}

function bl()
{
    echo "start build arib_booking"
    yroot
    ./gradlew :arib_booking:exportAar
    ./gradlew :reservation:exportAar
    cp modules/library-release/* /home/jwkang2/work/android/bookingSampleApp/app/libs
}

function prepare()
{
    current_path=$(pwd)
    echo "cp -r ~/work/android/prepare/include/* $current_path/include/"
    cp -r ~/work/android/prepare/include/* $current_path/include/
}

function install()
{
	IP='192.168.0.132' # default IP
	PS3='select source folder: '
	options=("current folder" "out folder" "set different IP" "Quit")

	select opt in "${options[@]}"
	do
		case $opt in
			${options[0]})
				_install $IP	
			    break	
				;;
			${options[1]})
				croot
				_install $IP	
			    break	
				;;
			${options[2]})
				echo -e "set new IP : "
				read newIP
				IP=$newIP
				;;
			"Quit")
				break
				;;
			*) echo invalid option;;
		esac
	done
}

function _install()
{
	fastboot -s tcp:$1 erase misc
	fastboot -s tcp:$1 erase eio
	fastboot -s tcp:$1 flash bootloader ./bootloader.prod.img
	fastboot -s tcp:$1 flash boot ./boot.img
	fastboot -s tcp:$1 flash system ./system.img
	fastboot -s tcp:$1 flash vendor ./vendor.img
	fastboot -s tcp:$1 flash cache ./cache.img
	fastboot -s tcp:$1 flash userdata ./userdata.img
	fastboot -s tcp:$1 reboot
}

function hlog()
{
    adb logcat -c
    pidcat-ex.py
    #pidcat-ex com.humaxdigital.corona.tvinput.jcom
    #pushd /home/jwkang2/bin/pidcat-ex
    #./pidcat-ex.py com.humaxdigital.atv.tr069service
    #popd 
    #pidcat-ex --timestamp
    #--ihl='oslog|logs|sensor\cyan|queuebatch\bg_blue|state\white|latency\bg_green|enable\magenta'
    #--hl='screen\yellow|far\bg_yellow|event\bg_ack'
}

#add clion path
PATH=$PATH:/home/jwkang2/work/etc/clion-2018.3.4/bin:/home/jwkang2/Android-studio/android-studio/bin

#pid log cat
PATH=$PATH:/home/jwkang2/bin/pidcat-ex
