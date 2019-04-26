# The following lines were added by compinstall
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/usr/home/ni796admin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS

autoload bashcompinit
bashcompinit
FILE=/usr/share/bash-completion/completions/VBoxManage && test -f $FILE && source $FILE
FILE=~/.zshfct_android && test -f $FILE && source $FILE
FILE=/root/.bashrc && test -f $FILE && source $FILE

bindkey -e
# End of lines configured by zsh-newuser-install

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY


#pour la couleur et mettre le prompt_nailyk ici?
#host_color=cyan
#if [[ $USER == root ]]; then
#    post_prompt="%{$fg_bold[$root_color]%}%#%{$reset_color%}"
#else
#    post_prompt="%{$fg_bold[$user_color]%}%#%{$reset_color%}"
#fi
#history_prompt1="%{$fg_bold[$history_color]%}[%{$reset_color%}"

PATH="$HOME/bin:$PATH"


case "$TERM" in
        ## on est dans un tmux
#    (screen)
#      function preexec()
#      {
#         printf "\ek$1\e\\"
#       }
#      function precmd()
#      {
#         echo -ne "\ek${USER}\e\\"
#      }
#      ;;

        ## on est dans un screen
    (screen-256color)
      function preexec()
      {
          printf "\ek$1\e\\"
        }
      function precmd()
      {
          echo -ne "\ek${USER}\e\\"
      }
      ;;
esac

# fait main
autoload -Uz promptinit
promptinit
FILE=/usr/home/ni796admin/.zsh_prompt && test -f $FILE && source $FILE
setopt prompt_subst

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
alias GPWD="cd /secbin/security/Scripts/get_passwd_tools"
alias sudo='sudo '


export VISUAL=vim
export EDITOR="$VISUAL"

ssh() {
    case "$TERM" in
          ## on est dans un tmux
        (screen)
            #tmux rename-window "$*"
            printf "\033k$*\033\\"
            command ssh "$@"
            #tmux rename-window "${USER}@${HOST}"
            printf "\033k${HOST}\033\\"
        ;;
          ## on est dans un screen
        (screen-256color)
            echo -ne "\ek$*\e\\"
            command ssh "$@"
            echo -ne "\ek${USER}\e\\"
        ;;
        (*)
           command ssh "$@"
        ;;
    esac
}

#export LC_ALL=fr_FR.UTF-8

ins_sudo () {
  prefix="sudo"
  BUFFER="$prefix $BUFFER"
  CURSOR=$(($CURSOR + $#prefix + 1))
}
zle -N ins-sudo ins_sudo
bindkey "^f" ins-sudo

# var for gpgp pinentry
export GPG_TTY=$(tty)
export PINENTRY_USER_DATA="USE_CURSES=1"

export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/quest/sbin:/opt/quest/bin:/opt/tools/git/bin:/opt/oracle/product/CLT_11204/bin:$PATH

# Oracle
export ORACLE_SID=CLT_SEC
export ORACLE_HOME=/opt/oracle/product/CLT_11204
export ORAENV_ASK=NO
. /usr/local/bin/oraenv

# Putty workarounds for keypad:
if [[ "$TERM" != emacs ]]; then
[[ -z "$terminfo[kdch1]" ]] || bindkey -M emacs "$terminfo[kdch1]" delete-char
[[ -z "$terminfo[khome]" ]] || bindkey -M emacs "$terminfo[khome]" beginning-of-line
[[ -z "$terminfo[kend]" ]] || bindkey -M emacs "$terminfo[kend]" end-of-line
[[ -z "$terminfo[kich1]" ]] || bindkey -M emacs "$terminfo[kich1]" overwrite-mode
[[ -z "$terminfo[kdch1]" ]] || bindkey -M vicmd "$terminfo[kdch1]" vi-delete-char
[[ -z "$terminfo[khome]" ]] || bindkey -M vicmd "$terminfo[khome]" vi-beginning-of-line
[[ -z "$terminfo[kend]" ]] || bindkey -M vicmd "$terminfo[kend]" vi-end-of-line
[[ -z "$terminfo[kich1]" ]] || bindkey -M vicmd "$terminfo[kich1]" overwrite-mode

[[ -z "$terminfo[cuu1]" ]] || bindkey -M viins "$terminfo[cuu1]" vi-up-line-or-history
[[ -z "$terminfo[cuf1]" ]] || bindkey -M viins "$terminfo[cuf1]" vi-forward-char
[[ -z "$terminfo[kcuu1]" ]] || bindkey -M viins "$terminfo[kcuu1]" vi-up-line-or-history
[[ -z "$terminfo[kcud1]" ]] || bindkey -M viins "$terminfo[kcud1]" vi-down-line-or-history
[[ -z "$terminfo[kcuf1]" ]] || bindkey -M viins "$terminfo[kcuf1]" vi-forward-char
[[ -z "$terminfo[kcub1]" ]] || bindkey -M viins "$terminfo[kcub1]" vi-backward-char

# ncurses fogyatekos
[[ "$terminfo[kcuu1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" vi-up-line-or-history
[[ "$terminfo[kcud1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" vi-down-line-or-history
[[ "$terminfo[kcuf1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcuf1]/O/[}" vi-forward-char
[[ "$terminfo[kcub1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcub1]/O/[}" vi-backward-char
[[ "$terminfo[khome]" == "^[O"* ]] && bindkey -M viins "${terminfo[khome]/O/[}" beginning-of-line
[[ "$terminfo[kend]" == "^[O"* ]] && bindkey -M viins "${terminfo[kend]/O/[}" end-of-line
[[ "$terminfo[khome]" == "^[O"* ]] && bindkey -M emacs "${terminfo[khome]/O/[}" beginning-of-line
[[ "$terminfo[kend]" == "^[O"* ]] && bindkey -M emacs "${terminfo[kend]/O/[}" end-of-line
fi
