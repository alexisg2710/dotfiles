# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d ~/afs/bin ] ; then
	export PATH=~/afs/bin:$PATH
fi

if [ -d ~/.local/bin ] ; then
	export PATH=~/.local/bin:$PATH
fi

source ~/.git-prompt.sh

export LANG=en_US.utf8

export EDITOR=vim

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;94:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


# Color support for less
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

echo "
__          ________  _____ _    _     _      ______  _____      ____   _____ 
\ \        / /  ____|/ ____| |  | |   | |    |  ____|/ ____|    |  _ \ / ____|
 \ \  /\  / /| |__  | (___ | |__| |   | |    | |__  | (___      | |_) | |  __ 
  \ \/  \/ / |  __|  \___ \|  __  |   | |    |  __|  \___ \     |  _ <| | |_ |
   \  /\  /  | |____ ____) | |  | |   | |____| |____ ____) |    | |_) | |__| |
    \/  \/   |______|_____/|_|  |_|   |______|______|_____/     |____/ \_____|
"
##############################
#           ALIAS            #
##############################

alias printGod='i3lock'
alias autogit='~/misc-tools/auto-git.sh'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ls='ls --color=auto'

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# GIT Alias
alias log='git log --oneline --graph --decorate'
alias gs='git status'
alias cfi='clang-format -i'
alias gtam='git tag -a -m'
alias ga='git add'
alias gc='git commit'
alias gpf='git push --follow-tags'
alias cgpp='g++ -std=c++17 -Wall -Wextra -Werror -pedantic'

#############################
#         FUNCTIONS         #
#############################

#Function to extract any type of file
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# ARCHIVE COMPRESS {{{
compress() {
  if [[ -n "$1" ]]; then
    FILE=$1
    case $FILE in
      *.tar ) shift && tar cf $FILE $* ;;
      *.tar.bz2 ) shift && tar cjf $FILE $* ;;
      *.tar.gz ) shift && tar czf $FILE $* ;;
      *.tgz ) shift && tar czf $FILE $* ;;
      *.zip ) shift && zip $FILE $* ;;
      *.rar ) shift && rar $FILE $* ;;
    esac
  else
    echo "usage: compress <foo.tar.gz> ./foo ./bar"
  fi
}
#}}}


function __setprompt
{
	local LAST_COMMAND=$? # Must come first!

	# Define colors
	local LIGHTGRAY="\033[0;37m"
	local WHITE="\033[1;37m"
	local BLACK="\033[0;30m"
	local DARKGRAY="\033[1;30m"
	local RED="\033[0;31m"
	local LIGHTRED="\033[1;31m"
	local GREEN="\033[0;32m"
	local LIGHTGREEN="\033[1;32m"
	local BROWN="\033[0;33m"
	local YELLOW="\033[1;33m"
	local BLUE="\033[0;34m"
	local LIGHTBLUE="\033[1;34m"
	local MAGENTA="\033[0;35m"
	local LIGHTMAGENTA="\033[1;35m"
	local CYAN="\033[0;36m"
	local LIGHTCYAN="\033[1;36m"
	local NOCOLOR="\033[0m"
    
	# Show error exit code if there is one
	if [[ $LAST_COMMAND != 0 ]]; then
		# PS1="\[${RED}\](\[${LIGHTRED}\]ERROR\[${RED}\])-(\[${LIGHTRED}\]Exit Code \[${WHITE}\]${LAST_COMMAND}\[${RED}\])-(\[${LIGHTRED}\]"
		PS1="\[${LIGHTRED}\]X_X \[${WHITE}\](\[${LIGHTRED}\]ERROR\[${WHITE}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${WHITE}\])-(\[${RED}\]"
		if [[ $LAST_COMMAND == 1 ]]; then
			PS1+="General error"
		elif [ $LAST_COMMAND == 2 ]; then
			PS1+="Missing keyword, command, or permission problem"
		elif [ $LAST_COMMAND == 126 ]; then
			PS1+="Permission problem or command is not an executable"
		elif [ $LAST_COMMAND == 127 ]; then
			PS1+="Command not found"
		elif [ $LAST_COMMAND == 128 ]; then
			PS1+="Invalid argument to exit"
		elif [ $LAST_COMMAND == 129 ]; then
			PS1+="Fatal error signal 1"
		elif [ $LAST_COMMAND == 130 ]; then
			PS1+="Script terminated by Control-C"
		elif [ $LAST_COMMAND == 131 ]; then
			PS1+="Fatal error signal 3"
		elif [ $LAST_COMMAND == 132 ]; then
			PS1+="Fatal error signal 4"
		elif [ $LAST_COMMAND == 133 ]; then
			PS1+="Fatal error signal 5"
		elif [ $LAST_COMMAND == 134 ]; then
			PS1+="Fatal error signal 6"
		elif [ $LAST_COMMAND == 135 ]; then
			PS1+="Fatal error signal 7"
		elif [ $LAST_COMMAND == 136 ]; then
			PS1+="Fatal error signal 8"
		elif [ $LAST_COMMAND == 137 ]; then
			PS1+="Fatal error signal 9"
		elif [ $LAST_COMMAND -gt 255 ]; then
			PS1+="Exit status out of range"
		else
			PS1+="Unknown error code"
		fi
		PS1+="\[${WHITE}\])\[${NOCOLOR}\]\n"
	else
		PS1=""
	fi

    if [[ $LAST_COMMAND == 0 ]]; then
        PS1="\[${LIGHTGREEN}\]^_^ \[${WHITE}\](\[${GREEN}\]Exit Code \[${LIGHTGREEN}\]${LAST_COMMAND}\[${WHITE}\])\n"
    fi
    
	# Current directory
	PS1+="┌─\[${WHITE}\](\u@\h\[${WHITE}\] : \[${BROWN}\]\w\[${WHITE}\])──"

	# Date
    PS1+="\[${WHITE}\](\[${CYAN}\]\$(date +%a) $(date +%d) $(date +%b) $(date +%Y)\[${WHITE}\])" # Date
	PS1+="\[${WHITE}\](${LIGHTMAGENTA}$(date +%X)\[${WHITE}\])" # Time

	# CPU
	#PS1+="(\[${MAGENTA}\]CPU $(cpu)%"

	# Jobs
    #PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]\j"

	# Network Connections (for a server - comment out for non-server)
	#PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]Net $(awk 'END {print NR}' /proc/net/tcp)"

	#PS1+="\[${DARKGRAY}\])-"

	# User and server
	#local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
	#local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
	#if [ $SSH2_IP ] || [ $SSH_IP ] ; then
	#	PS1+="(\[${RED}\]\u@\h"
	#else
	#	PS1+="(\[${RED}\]\u"
	#fi



	# Total size of files in current directory
	PS1+="(\[${GREEN}\]$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')\[${WHITE}\] :"

	# Number of files
	PS1+=" \[${GREEN}\]\$(/bin/ls -A -1 | /usr/bin/wc -l) files\[${WHITE}\])"

	# Skip to the next line
	#PS1+="\n"

    local git_info=$(__git_ps1)
    if [[ ${git_info} ]]; then
        git_info="\n| \033[43;30;1mGIT\033[m :\[${YELLOW}\]${git_info}"
    fi

    PS1+="${git_info}"


	if [[ $EUID -ne 0 ]]; then
        PS1+="\n\[${GREEN}\]└─▶\[${NOCOLOR}\] " # Normal user
	else
		PS1+="\n\[${RED}\]└─▶\[${NOCOLOR}\] " # Root user
	fi
	# PS2 is used to continue a command using the \ character
	#PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "

	# PS3 is used to enter a number choice in a script
	#PS3='Please enter a number from above list: '

	# PS4 is used for tracing a script in debug mode
	#PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
}

GIT_PS1_SHOWUPSTREAM="auto"     # '<' behind, '>' ahead, '<>' diverged, '=' no difference
GIT_PS1_SHOWDIRTYSTATE=1        # staged '+', unstaged '*'
GIT_PS1_SHOWSTASHSTATE=1        # '$' something is stashed
GIT_PS1_SHOWUNTRACKEDFILES=1    # '%' untracked files

PROMPT_COMMAND='__setprompt'
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"
