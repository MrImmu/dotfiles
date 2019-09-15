# .bashrc

# Source of global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions
umask 022
# if [ -f /etc/profile ]; then
#       . /etc/profile
# fi
#
# if [ -f /root/.bash_profile ]; then
#       . /root/.bash_profile
# fi

# Mode vi in shell 1234
#set -o vi

USR_HOME="/usr/home/ni796admin"
alias grep='grep --color=auto'
alias tmuxc="tmux -f $USR_HOME/tmux.conf"
alias tmuxa='tmux attach'
alias vimdev="vim -u $USR_HOME/vimrc"
alias vimdiffdev="vimdiff -u $USR_HOME/vimrc"
alias INSOURCING='cd /secbin/security/Scripts/Insourcing_Users_mgmnt'
alias psmshit='env | grep -i SSH_Connection'
alias admin_user_v3="/secbin/security/Scripts/Oracle/admin_user_v3"

alias grep='grep --color'
alias df='df -h'
alias ls='ls --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -al'
alias _='sudo'

#folders
alias EUREX='cd /secbin/ft/eurex'
alias MISTP='cd /secbin/security/Scripts/Misc+Temp'
alias MODULE='cd /secbin/security/Scripts/Oracle/MODULE3'
alias ORACLE='cd /secbin/security/Scripts/Oracle'
alias HELPDESK='cd /secbin/security/Scripts/Helpdesk'
alias SUPPORT='cd /secbin/security/Scripts/Support'
alias PRJT='cd /secbin/security/Scripts/Oracle/Project'
alias UPM="cd /secbin/upm/conf"
alias DRP="cd /secbin/security/Scripts/DRP"
alias SCRIPTS="cd /secbin/security/Scripts"
alias UNIX="cd /secbin/security/Scripts/Unix"
alias SSH_KEYS="cd /secbin/security/Scripts/Unix/SSH_KEYS"
alias HOSTS="cd /secbin/security/Scripts/"
alias LEAVERS="cd /secbin/security/Scripts/Unix/LEAVERS/"
alias IMPLEM="cd /secbin/security/Scripts/Implementation/"
alias SECTRANS="cd /secbin/security/Sectransport/"
alias LDAP="cd /secbin/security/Scripts/LDAP/"
alias INSTALL="cd /secbin/security/Scripts/Unix/Install/"
alias CDIRECT="cd /secbin/security/Sectransport/Cdirect/bin/"
alias OAM="cd /secbin/security/Scripts/Unix/OAM_ADMINISTRATION/"
alias GPWD="cd /secbin/security/Scripts/get_passwd_tools/"
alias TOOLS="cd /secbin/security/Scripts/get_passwd_tools/"
alias BASH="cd /secbin/security/Scripts/Library/"
alias LOG="cd /secbin/log/"
alias REPO="cd /secbin/security/users_repository"
# git
alias glg='git log --oneline --decorate --graph --all'

TERM=putty-256color
export TERM

##################################################
# Git & prompt part
##################################################

COLOR_RED="\033[1;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_WHITEB="\033[1;37m"
COLOR_RESET="\033[0m"

#function git_color() {
#  local git_status="$(git status 2>/dev/null)"
#  if [[ $git_status =~ "Untracked files" ]] ; then
#    echo -e $COLOR_RED
#  elif [[ $git_status =~ "nothing to commit" ]] ; then
#    echo -e $COLOR_WHITE
#  elif [[ $git_status =~ "to be committed" ]] ; then
#    echo -e $COLOR_GREEN
#  else
#    echo -e $COLOR_OCHRE
#  fi
#}

#parse_git_branch() {
#  local BRANCH=$(git symbolic-ref HEAD --short 2> /dev/null)
#  if [[ ! -z "$BRANCH" ]] ; then
#    echo "branch:$BRANCH "
#  fi
#}

# prompt of BACH part
#PS1="\[$COLOR_GREEN\]\u\[$COLOR_WHITE\]@\[$COLOR_RED\]\H:\[$COLOR_WHITEB\][\w]\n\[$COLOR_YELLOW\]jobs:\j "
export PS1="\[\033[38;5;2m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] [\W]: \[$(tput sgr0)\]"
#PS1+="\[\$(git_color)\]"          # colors git status
#PS1+="\$(parse_git_branch)"       # prints current branch
#PS1+="\[$COLOR_YELLOW\]\$\[$COLOR_RESET\] "
export PS1

# SSH Name TMUX
case "$TERM" in
  tmux*)
    export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
    ;;
  xterm*)
    if [ $ITERM_SESSION_ID ]; then
      export PROMPT_COMMAND='echo -ne "\033];${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"; '
    else
      export PROMPT_COMMAND='echo -ne "\033]${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"; '
    fi
    ;;
esac
