#########################
# CONFIGS
#######################

export LANG=en_US.UTF-8
export EDITOR='emacs'
export TERM=xterm-256color
export ZSH=/home/manu/.oh-my-zsh

#NET
alias net_ports=netstat -nlp
alias net_all=netstat -a -n -p -l

#OPEN
alias open=xdg-open

#EMACS CLIENT
ec() {
    emacsclient -n $1 &
}

ZSH_THEME="robbyrussell"

alias zshconfig="emacsclient ~/.zshrc &"
alias ohmyzsh="emacsclient ~/.oh-my-zsh &"

#ALIASES GIT
grhead(){
  git rebase -i HEAD~$1
}

alias woo="git status"
alias git_prune='git remote prune origin'
alias git_prunegit_status='git remote prune origin --dry-run'

alias cleanpyc="find . -name '*.pyc' -exec rm {} \;"

######### VIRTUALENV ##########################

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

###################################


####################################################
# Monitor SQL SHELL
# watch -t -n 1 "echo 'Query\tTime\tSQL\n'; echo 'show full processlist' | mysql -B -u USERDBNAME -h IPHOST -P PORT -pPASWWD DBNAME -A | cut -f 1,6,8 | grep -v ^Id | sort -r -n -k 2"
#####################################################

prstat(){
  sv status $1
}

CASK=$HOME/.cask

export ELM_HOME=$HOME/npm-global/bin/elm

export GOPATH=$HOME/go
export GOROOT=$HOME/goroot/go

export RUST_SRC_PATH=$HOME/.rust/src
export RACER_TARGET=$HOME/.racer/target/release/racer

export PATH="$CASK/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$GOROOT/bin:$GOPATH/bin:$HOME/bin:$HOME/npm-global/bin:$HOME/.rbenv/bin:$RACER_TARGET:$PATH"

plugins=( git lighthouse git-flow zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

PROMPT='%{$reset_color%}%n %{$fg[green]%}{%{$reset_color%}%~%{$fg[green]%}}%{$reset_color%}$(git_prompt_info)%{$fg[green]%}%{$fg[red]%} $%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
