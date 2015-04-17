# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#Virtual wrapper http://virtualenvwrapper.readthedocs.org/en/latest/
VIRTUAL_ENV=$HOME/.virtualenvs/

export GOPATH=$HOME/go

export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:$GOPATH/bin:$VIRTUAL_ENV:$PATH

#Ports
alias ports=netstat -nlp

#ALIASES GIT
grhead(){
  git rebase -i HEAD~$1
}

alias woo="git status"

gitbranchNcommits(){
  git branch $1
  git reset --hard origin/master
  git checkout $1
}

TERM=xterm-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

#ALIASES GIT
alias git_prune='git remote prune origin'
alias git_prunegit_status='git remote prune origin --dry-run'

alias cleanpyc="find . -name '*.pyc' -exec rm {} \;"

prstat(){
  sv status $1
}

#JAVA 
#export JAVA_HOME="/usr/lib/jvm/java-7-oracle"

plugins=( git ruby lighthouse git-flow brew zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh
source /usr/local/bin/virtualenvwrapper.sh

PROMPT='%{$reset_color%}%n %{$fg[green]%}{%{$reset_color%}%~%{$fg[green]%}}%{$reset_color%}$(git_prompt_info)%{$fg[green]%}%{$fg[red]%} $%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
