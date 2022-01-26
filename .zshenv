export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8

# emacs within terminal
export EDITOR='emacsclient -a "" -t "$@"'

# emacs Window X11
# export EDITOR='emacsclient -a "" "$@"'

export TERM=xterm-256color
export ZSH=/Users/manute/.oh-my-zsh

export UPDATE_ZSH_DAYS=13

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export GOPRIVATE=github.com/
export GO111MODULE=on
export GOBIN=/Users/manute/go/bin


# https://stackoverflow.com/questions/52524112/how-do-i-install-java-11-on-mac-osx-allowing-version-switching
# for checking all paths: /usr/libexec/java_home -V
export JAVA_HOME=$(/usr/libexec/java_home -v 11)

export PATH="/usr/local/opt/make/libexec/gnubin:/usr/local/bin:/usr/local/sbin:usr/sbin:/usr/bin:/sbin:/bin:$GOROOT/bin:$GOPATH/bin:$NVM_BIN:$JAVA_HOME/bin:/Users/manute/.npm-global/bin:$PATH"
