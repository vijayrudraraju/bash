export HISTFILESIZE=
export HISTSIZE=

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

alias job='cd ~/Code/parsegarden/parsegarden-jobs'
alias jobs='cd ~/Code/parsegarden/parsegarden-jobs'
alias code='cd ~/Code'
alias p='cd ~/Code/parsegarden'
alias parse='cd ~/Code/parsegarden'
alias parsegarden='cd ~/Code/parsegarden'
alias module='cd ~/Code/parsegarden/parsegarden-modules'
alias modules='cd ~/Code/parsegarden/parsegarden-modules'
alias terra='cd ~/Code/terraform'
alias pex='cd ~/Code/parsegarden/parsegarden-apex'
alias gitground='cd ~/Code/gitground'
alias gitg='cd ~/Code/gitground'
alias apexsource='cd ~/Code/gitground/apex'
alias free='cd ~/Code/gitground/freedraw'
alias yyy='cd ~/Code/yyy'
alias viz='cd ~/Code/vizground'
alias admin='cd ~/Code/parsegarden/parsegarden-admin'
alias slicr='cd ~/Code/slicr/slicr'
alias dev='cd ~/Code/parsegarden/parsegarden-admin; npm run dev'
alias stage='cd ~/Code/stagecraft'
alias stagecraft='cd ~/Code/stagecraft'
alias market='cd ~/Code/stagecraft/WebApps/AudioMarket'
alias startmarket='cd ~/Code/stagecraft; source venv/bin/activate; cd WebApps/AudioMarket/; python manage.py runserver'
alias gopath='cd ~/Code/src'
alias vijay='cd ~/Code/vijayrudraraju.github.io'
alias toptal='cd ~/Code/toptal-interview/vijay-rudraraju'
alias buefy='cd ~/Code/gitground/buefy'
alias front='cd ~/Code/parsegarden/parsegarden-web-frontend'
alias web='cd ~/Code/parsegarden/parsegarden-web-frontend'
alias exp='cd ~/Code/parsegarden/parsegarden-expo'

export GOPATH=/Users/vijayrudraraju/Code
export TERRAFORM=/Users/vijayrudraraju/Code/terraform
#export BIN=/bin
export ANDROID_HOME="$HOME/Library/Android/sdk"
#export ANACONDA="$HOME/anaconada/bin"
export PATH=$ANDROID_HOME:$TERRAFORM:$GOPATH:$GOPATH/bin:$PATH

# Allows Ctrl-s to be using to do forward search (in middle of Ctrl-R search)
stty -ixon
if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    RED=$(tput setaf 9)
    ORANGE=$(tput setaf 172)
    GREEN=$(tput setaf 190)
    PURPLE=$(tput setaf 141)
    WHITE=$(tput setaf 256)
  else
    RED=$(tput setaf 5)
    ORANGE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    PURPLE=$(tput setaf 1)
    WHITE=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  RED="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1="\[${BOLD}${ORANGE}\]\u ${RED}\D{%T} \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by Anaconda2 4.2.0 installer
#export PATH="/Users/vijayrudraraju/anaconda/bin:$PATH"

source ~/.bash/init.sh

# added by Anaconda3 4.3.1 installer
export PATH="/anaconda/bin:$PATH"

_apex()  {
  COMPREPLY=()
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local opts="$(apex autocomplete -- ${COMP_WORDS[@]:1})"
  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}

complete -F _apex apex

# color tab completion text
set colored-stats on
