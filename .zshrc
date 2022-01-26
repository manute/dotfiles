# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

autoload -Uz add-zsh-hook

# Path to your oh-my-zsh installation.
alias net_ports=netstat -nlp
alias net_all=netstat -a -n -p -l

# EMACS DAEMON
# The empty -a parameter means that if no daemon exists, it should start one in the background and retry.
# The -c option means that a new frame (window) should be created instead of reusing an existing one.
# "$@" means that when the script is invoked with a path as command-line

# emacs client when used within the terminal
alias ec='emacsclient -a "" -t "$@"'
# This will shutdown the emacs daemon immediately with out prompting or saving files.
alias eck="emacsclient -e '(kill-emacs)'"

# emacs client when used as Window X11
# alias ec='emacsclient -a "" "$@"'

alias zshconfig="ec ~/.zshrc"
alias zshenv="ec ~/.zshenv"
alias ohmyzsh="ec ~/.oh-my-zsh"


# workpath directories
WORK_PATH=$HOME/go/src/github.com/

alias gowork="cd $WORK_PATH"

alias docker-stop-all="docker stop $(docker ps -a -q)"
alias docker-prune="docker system prune"
alias docker-prune-all="docker system prune -a"

alias kx="kubectx"
alias kn="kubens"
alias kt="stern"

# get all services with in a cluster and the nodePorts they use (if any)
alias ksvc="kubectl get --all-namespaces svc -o json | jq -r '.items[] | [.metadata.name,([.spec.ports[].nodePort | tostring ] | join(\"|\"))] | @csv'"

# shortcuts for frequent kubernetes commands
function krun() { name=$1; shift; image=$1; shift; kubectl run -it --generator=run-pod/v1 --image $image $name -- $@; }
function klogs() { kubectl logs $*;}
function kexec(){ pod=$1; shift; kubectl exec -it $pod -- $@; }

# workspaces terraform
tws() { terraform workspace select $@ ; direnv reload ; }

load-tfswitch() {
  local tfswitchrc_path=".tfswitchrc"

  if [ -f "$tfswitchrc_path" ]; then
    tfswitch
  fi
}
add-zsh-hook chpwd load-tfswitch
load-tfswitch

# kubectl load custom clusters - context
# source $HOME/.config/kube/kubeconfig.sh

# https://unix.stackexchange.com/questions/431805/zsh-is-there-a-problem-with-always-enabling-extended-glob
# setopt extended_glob

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sobole"
SOBOLE_THEME_MODE="light"

# plugins=(git zsh-syntax-highlighting zsh-kubectl-prompt git-prompt ssh-agent keychain kubectl terraform fzf-tab)
plugins=(git zsh-syntax-highlighting zsh-kubectl-prompt git-prompt ssh-agent keychain kubectl terraform fzf-tab)

zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities github_rsa

# fzf for everything
zstyle ':completion:*' fzf-search-display true
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# User configuration
source $ZSH/oh-my-zsh.sh

# RPROMPT='%{$fg[magenta]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
RPROMPT=''

alias pip="pip3"
eval "$(pyenv init --path)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/kustomize kustomize
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/kustomize kustomize

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
