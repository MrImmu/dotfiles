# .bashrc

#######################################
# Source global definitions
#######################################
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

#######################################
# Umask + Variable
#######################################
umask 022
# COLOR_RED="\001\e[38;5;9m\002"
# COLOR_YELLOW="\001\e[0;33m\002"
# COLOR_GREEN="\001\e[38;5;2m\002"
# COLOR_OCHRE="\001\e[38;5;95m\002"
# COLOR_BLUE="\001\e[0;34m\002"
# COLOR_WHITE="\001\e[0;37m\002"
# COLOR_WHITEB="\001\e[38;5;15m\002"
# COLOR_RESET='\001$(tput sgr0)\002'

#COLOR_RED="\001\e[38;5;9m\002"
#COLOR_YELLOW="\001\e[38;5;11m\002"
#COLOR_GREEN="\001\e[38;5;2m\002"
#COLOR_OCHRE="\001\e[38;5;95m\002"
#COLOR_BLUE="\001\e[38;5;33m\002"
#COLOR_LIGHTGRAY="\001\e[0;37m\002"
#COLOR_WHITE="\001\e[38;5;15m\002"
#COLOR_RESET='\001$(tput sgr0)\002'

#COLOR_RED="\001\e[38;5;1m\002"
#COLOR_YELLOW="\001\e[38;5;3m\002"
#COLOR_GREEN="\001\e[38;5;2m\002"
#COLOR_OCHRE="\001\e[38;5;8m\002"
#COLOR_BLUE="\001\e[38;5;4m\002"
#COLOR_LIGHTGRAY="\001\e[0;37m\002"
#COLOR_WHITE="\001\e[38;5;15m\002"
#COLOR_RESET='\001$(tput sgr0)\002'


COLOR_RED="\001\e[38;5;160m\002"
COLOR_YELLOW="\001\e[38;5;3m\002"
COLOR_GREEN="\001\e[38;5;40m\002"
COLOR_OCHRE="\001\e[38;5;8m\002"
COLOR_BLUE="\001\e[38;5;4m\002"
COLOR_LIGHTGRAY="\001\e[0;37m\002"
COLOR_WHITE="\001\e[38;5;15m\002"
COLOR_RESET='\001$(tput sgr0)\002'

#######################################
# Alias
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
alias tmuxc="tmux -f $HOME/tmux.conf"
alias tmuxa='tmux attach'
alias vimdev="vim $HOME/.vimrc"

##################################################
# Git
##################################################
function git_color() {
  local git_status="$(git status 2>/dev/null)"
  if [[ $git_status =~ "Untracked files" ]] ; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "nothing to commit" ]] ; then
    echo -e $COLOR_WHITE
  elif [[ $git_status =~ "to be committed" ]] ; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}
function parse_git_branch() {
  local BRANCH=$(git symbolic-ref HEAD --short 2> /dev/null)
  if [[ ! -z "$BRANCH" ]] ; then
    echo " ($BRANCH)"
  fi
}

##################################################
# BACH Prompt
##################################################
COLOR_GIT="$(git_color)"

#set_bash_prompt(){
PS1="$COLOR_GREEN\u$COLOR_RESET$COLOR_WHITE@$COLOR_RESET$COLOR_RED\h$COLOR_RESET$COLOR_WHITE [\W]$COLOR_RESET"
#$COLOR_GIT\$(parse_git_branch)$COLOR_RESET $COLOR_YELLOW\$$COLOR_RESET "
PS1+="\$(git_color)"                           # colors git status
PS1+="\$(parse_git_branch)$COLOR_RESET"      # prints current branch
#PS1+=" $COLOR_YELLOW\$$COLOR_RESET "
export PS1
#}
#PROMPT_COMMAND=set_bash_prompt

##################################################
# SSH Name TMUX
##################################################
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

