#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# add my shit to the executable path
export PATH=/home/tom/bin:$PATH
# config default directory
export XDG_CONFIG_HOME=$HOME/.config

# set some nice options
shopt -s checkwinsize

# screen boi
#screen -ArxR 

# ls colors i guess
alias ls='ls -CF --color=auto'
alias grep='grep --color=auto'
export GREP_COLORS='ms=07;33:mc=07;33:sl=:cx=:fn=35:ln=32:bn=32:se=36'
alias pacman='pacman --color=auto'

# prompt settings
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
GRAY=$(tput setaf 7)
LTBLACK=$(tput setaf 8)
LTRED=$(tput setaf 9)
LTGREEN=$(tput setaf 10)
LTYELLOW=$(tput setaf 11)
LTBLUE=$(tput setaf 12)
LTMAGENTA=$(tput setaf 13)
LTCYAN=$(tput setaf 14)
WHITE=$(tput setaf 15)
RESET=$(tput sgr0)
BOLD=$(tput bold)
RCODE=""

getcode() {
	if [ $? -eq 0 ]; then
		echo -n ""
	else
		echo -n "[\$?]"
	fi
}

getbranch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -n "$SSH_CLIENT" ]; then
	COLOR=$YELLOW
else
	COLOR=$CYAN
fi

# check for a term that sux
# if [ $TERM -eq "linux" ]; then

PS1='\[$BOLD\]\[$COLOR\]\u\[$GRAY\]\[$WHITE\]@\h\[$RESET\]:\[$BLUE\]\[$LTBLUE\]\W\[$MAGENTA\]$(getbranch)\[$WHITE\] $(getcode)\[$GREEN\]\$\[$RESET\] '

# PS1='\[$BOLD\]\[$(getssh)\]\u\[$WHITE\]@\h\[$RESET\]:\[$LTBLUE\]\W\[$MAGENTA\]$(getbranch)\[$WHITE\] $(getcode)\[$GREEN\]\$\[$RESET\] '



# shortcut for keyboard backlight manipulation
alias kbd_backlight="/bin/bash /usr/local/share/kbd_backlight"

# restart network service
alias netrestart="sudo systemctl restart NetworkManager"
# turn on firewall
alias fwon="iptables-restore < ~/firewall.rules"
#alias fwoff="iptables -F; iptables -X; iptables -t nat -F; iptables -t nat -X; iptables -t mangle -F; iptables -t mangle -X; iptables -P INPUT ACCEPT; iptables -P OUTPUT ACCEPT; iptables -P FORWARD ACCEPT"

# to celebrate
alias witness="{ ogg123 ~/songs/witness.ogg & disown; } 2>/dev/null"
alias plz="&& witness"

# quick ip 
alias addr="ip -o a | grep -v ' lo ' | cut -d ' ' -f2,7"

# So I don't have to remember what mounting daemon I use
alias unmount="udiskie-umount"

# just a small lol
alias thanks="echo no problem"

# edit multiple files as tabs plz
alias vim="vim -p"

# for finding a process
alias peg="ps -ef | grep $1"

# ssh control
alias sshon="sudo systemctl start sshd.socket"
alias sshoff="sudo systemctl stop sshd.socket"

# 'colored man' pages
man() {
    LESS_TERMCAP_md=$'\e[01;36m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;04;37m' \
    command man "$@"
}

# git dotfile shit
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
