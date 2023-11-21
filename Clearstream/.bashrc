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
#######################################
# Alias Folder
#######################################

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
##################################################a
  PS1='`[ $(id -u) == "0" ] && echo -e "\001\e[38;5;1m\002" || echo -e "\001\e[38;5;2m\002"`'
  PS1+="\u$COLOR_WHITE@"
  PS1+='`[[ $(domainname) == *bat* ]] && echo -e "\001\e[38;5;2m\002" || echo -e "\001\e[38;5;1m\002"`'
  PS1+="\h$COLOR_WHITE [\W]$COLOR_RESET"
  PS1+='`[ ! $(id -u) == "0" ] && echo "\$(git_color)"`'
  PS1+='`[ ! $(id -u) == "0" ] && echo "$(parse_git_branch)"`'
  PS1+="$COLOR_YELLOW\$$COLOR_RESET "         #$
  export PS1
