# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#Python
#Virtual wrapper http://virtualenvwrapper.readthedocs.org/en/latest/
WORKON_HOME=/Users/manu/Envs/

# Customize to your needs...
export PATH=/usr/local/bin:$WORKON_HOME:$PATH

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"


alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

#ALIASES Mac Helpers
alias show_finder_all="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hide_finder_all="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"

#ALIASES GIT
alias git_prune='git remote prune origin'
alias git_prunegit_status='git remote prune origin --dry-run'

alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs "

plugins=( git ruby lighthouse git-flow brew zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh
source /usr/local/bin/virtualenvwrapper.sh

PROMPT='%{$reset_color%}%n %{$fg[green]%}{%{$reset_color%}%~%{$fg[green]%}}%{$reset_color%}$(git_prompt_info)%{$fg[green]%}%{$fg[red]%} $%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""


#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/manu/.gvm/bin/gvm-init.sh" ]] && source "/Users/manu/.gvm/bin/gvm-init.sh"

eval "$(rbenv init -)"
