# .bashrc

#######################################
# Umask + Variable
#######################################
umask 022
COLOR_RED="\001\e[38;5;1m\002"
COLOR_YELLOW="\001\e[38;5;3m\002"
COLOR_GREEN="\001\e[38;5;2m\002"
COLOR_OCHRE="\001\e[38;5;8m\002"
COLOR_BLUE="\001\e[38;5;4m\002"
COLOR_LIGHTGRAY="\001\e[0;37m\002"
COLOR_WHITE="\001\e[38;5;15m\002"
COLOR_RESET="\001$(tput sgr0)\002"

#######################################
# Alias Basic Command
#######################################
alias ls='ls --color=auto'
alias ll='ls -al --group-directories-first'
alias grep='grep --color'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias df='df -h'
alias glg='git log --oneline --decorate --graph'
alias _='sudo'
alias tmux='tmux -f ~/ni796/.tmux.conf'
alias tmuxa='tmux attach'
alias vim='vim -u ~/ni796/.vimrc'

#######################################
# Alias Folder
#######################################
alias LIB="cd /secbin/security/Scripts/Library/"
alias DRP="cd /secbin/security/Scripts/DRP"
alias GPWD="cd /secbin/security/Scripts/get_passwd_tools_2/"
alias UHD='cd /secbin/security/Scripts/Helpdesk/UHD_PORTAL/'
alias HOSTS="cd /secbin/security/Scripts/"
alias IMPLEM="cd /secbin/security/Scripts/Implementation/"
alias INSTALL="cd /secbin/security/Scripts/Unix/Install/"
alias LDAP="cd /secbin/security/Scripts/LDAP/"
alias LEAVERS="cd /secbin/security/Scripts/Unix/LEAVERS/"
alias LOG="cd /secbin/log/"
alias MODULE='cd /secbin/security/Scripts/Oracle/MODULE3'
alias ORACLE='cd /secbin/security/Scripts/Oracle'
alias PRJT='cd /secbin/security/Scripts/Oracle/Project'
alias REPO="cd /secbin/security/users_repository"
alias SCRIPTS="cd /secbin/security/Scripts"
alias SSH_KEYS="cd /secbin/security/Scripts/Unix/SSH_KEYS"
alias SUPPORT='cd /secbin/security/Scripts/Support'
alias UNIX="cd /secbin/security/Scripts/Unix"
alias CMS="cd /secbin/security/cms_wrapper"

#######################################
# Alias BAU Command
#######################################
alias check_domain="sudo /secbin/security/Scripts/Unix/check_domain.sh"
alias check_cms="sudo /secbin/security/cms_wrapper/get_host_data.py"
alias sqlcqr_install="sudo /opt/oracle/sqlsecure/ORA9/sqlsecure_install.sh"
alias sqlcqr_scanner="sudo /opt/oracle/sqlsecure/Scanner/sqlcqr_scanner.sh"

#######################################
# Oracle
#######################################
ORACLE_SID=CLT_SEC
export ORACLE_SID
ORAENV_ASK=NO
export ORAENV_ASK
ORACLE_HOME=/opt/oracle/product/CLT_11204
export ORACLE_HOME
PATH=$PATH:$ORACLE_HOME/bin

##################################################
# Git
##################################################
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
#
#function parse_git_branch() {
#  local BRANCH=$(git symbolic-ref HEAD --short 2> /dev/null)
#  if [[ ! -z "$BRANCH" ]] ; then
#    echo " ($BRANCH)"
#  fi
#}

##################################################
# BACH Prompt
##################################################a
#if [ 'whoami' != root ]; then
# PS1='`[ $(whoami) == "root" ] && echo -e "$COLOR_RED" || echo -e "$COLOR_GREEN"`'
  PS1='`[ $(whoami) == "root" ] && echo -e "$COLOR_RED" || echo -e "$COLOR_GREEN"`'
  PS1+="\u$COLOR_RESET$COLOR_WHITE@$COLOR_RESET$COLOR_RED\h$COLOR_RESET$COLOR_WHITE [\W]$COLOR_RESET"
  #PS1+="\$(git_color)"                          # colors git status
  #PS1+='`[ ! $(id -u) == "0" ] && echo "\$(git_color)"`'
  #PS1+="\$(parse_git_branch)$COLOR_RESET"      # prints current branch
  #PS1+='`[ ! $(id -u) == "0" ] && echo "$(parse_git_branch)"`'
  PS1+="$COLOR_RESET $COLOR_YELLOW\$$COLOR_RESET "         #$
  export PS1
#else
 #PS1="$COLOR_RED\u$COLOR_RESET$COLOR_WHITE@$COLOR_RESET$COLOR_RED\h$COLOR_RESET$COLOR_WHITE [\W]$COLOR_RESET"
 #PS1+=" $COLOR_YELLOW\$$COLOR_RESET "
  #export PS1
#fi

##################################################
# SSH Name TMUX
##################################################
#case "$TERM" in
#            tmux*)
#export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
#    ;;
#      xterm*)
# if [ $ITERM_SESSION_ID ]; then
#     export PROMPT_COMMAND='echo -ne "\033];${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"; '
# else
#  export PROMPT_COMMAND='echo -ne "\033]${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"; '
#fi
#;;
#esac
