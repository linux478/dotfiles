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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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
    alias ls='ls --color=auto --group-directories-first'
    alias dir='dir --color=auto --group-directories-first'
    alias vdir='vdir --color=auto --group-directories-first'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

## Environment Variables
#############################################################################

## Default Editor
EDITOR=/usr/bin/nvim 

# Override PS1 with a personal setting

PS1_PRE=''
PS1_PRE="${PS1_PRE}\u"     # Username
PS1_PRE="${PS1_PRE}@"      # literial '@'
PS1_PRE="${PS1_PRE}\h"     # Hostname
PS1_PRE="${PS1_PRE} "      # literial ' '
PS1_PRE="${PS1_PRE}\A"     # current time in 24 hour format
PS1_PRE="${PS1_PRE} "      # literial ' '
PS1_PRE="${PS1_PRE}("      # literial '('
PS1_PRE="${PS1_PRE}\j"     # number of jobs running for the current user
PS1_PRE="${PS1_PRE})"      # literial ')'
PS1_PRE="${PS1_PRE} "      # literial ' '
PS1_PRE="${PS1_PRE}["      # literial '['
PS1_PRE="${PS1_PRE}\!"     # current history number
PS1_PRE="${PS1_PRE}]"      # literial ']'
PS1_PRE="${PS1_PRE} "      # literial ' '
PS1_PRE="${PS1_PRE}<"      # literial '<'

# PROMPT_COMMAND GOES HERE

PS1_POST=">"                 # literial '>'
PS1_POST=${PS1_POST}" "      # literial ' '
PS1_POST="${PS1_POST}\W"     # current working directory
PS1_POST="${PS1_POST}\n"     # Newline
PS1_POST="${PS1_POST}\$"     # Prompt Sign

PROMPT_COMMAND='read WORKTREE < <(git worktree list 2>/dev/null | grep -v "^${HOME} " | tr -d "][") ; PS1=$(echo "${PS1_PRE}${WORKTREE##* }${PS1_POST}") '

## Aliases
#############################################################################

alias .....='cd ../../../../'
alias ....='cd ../../../../'
alias ...='cd ../../../'
alias ..='cd ..'
alias cp='cp -i'
alias e="${EDITOR}"
alias g="/home/michael/bin/git"
alias genpasswd='echo `env LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 20`'
alias h="history"
alias mkdir='mkdir -p -v'
alias mv='mv -i'
alias o="xdg-open"
alias rm='rm -i'

## Shorter commands for the `Advanced Packaging Tool`
#############################################################################

alias apti="sudo apt-get install -y"
alias aptr="sudo apt-get remove"
alias apts="sudo apt-cache search"
alias aptu="sudo apt-get update \
                && sudo apt-get upgrade -y \
                && sudo apt-get autoremove -y"

## Aliases for calendar months
#############################################################################
alias cjan='cal -m 01'
alias cfeb='cal -m 02'
alias cmar='cal -m 03'
alias capr='cal -m 04'
alias cmay='cal -m 05'
alias cjun='cal -m 06'
alias cjul='cal -m 07'
alias caug='cal -m 08'
alias csep='cal -m 09'
alias coct='cal -m 10'
alias cnov='cal -m 11'
alias cdec='cal -m 12'

## Functions
#############################################################################

files-largest() {
    du -h -x -s -- * | sort -r -h | head -20;
}

hg() {
    history | grep "$1";
}

sys-info() {
  printf "\n"
  printf "   %s\n" "USER: $(echo $USER)"
  printf "   %s\n" "DATE: $(date)"
  printf "   %s\n" "UPTIME: $(uptime -p)"
  printf "   %s\n" "HOSTNAME: $(hostname -f)"
  printf "   %s\n" "KERNEL: $(uname -rms)"
  printf "   %s\n" "PACKAGES: $(dpkg --get-selections | wc -l)"
  printf "   %s\n" "RESOLUTION: $(xrandr | awk '/\*/{printf $1" "}')"
  printf "   %s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
  printf "\n"
}

git-init() {
    if [ -z "$1" ]; then
        printf "%s\n" "Please provide a directory name.";
    else
        mkdir "$1";
        builtin cd "$1";
        pwd;
        git init;
        touch readme.md .gitignore LICENSE;
        echo "# $(basename $PWD)" >> readme.md
    fi
}
