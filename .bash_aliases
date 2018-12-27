alias cls='clear'
alias cd..="cd .."
alias dc='cd'
alias ..="cd .."
alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lAhF'
alias hosts='sudo $EDITOR /etc/hosts'

# mv, rm, cp
alias mv='mv -v'
# alias rm='rm -i -v'
alias cp='cp -v'
function mkcd(){
    mkdir -p $1
    cd $1
}

# Git
alias gti='git'
alias g="git"
alias gc='git commit -v'
alias git-undopush='git push -f origin HEAD^:master'
alias git-stashpopforce='git stash show -p | git apply && git stash drop'
alias yolo='git push --force'

# Docker
alias doco='docker-compose'

# Personal projects folders
alias cdp='cd $HOME/Code'
alias archivecode='mv . '
alias unarchivecode=''

# iMac + dual screen => 💔
dock() {
    defaults write com.apple.dock position-immutable -bool YES; killall Dock
}

ds_fucking_store() {
    sudo find / -name ".DS_Store" -depth -exec rm {} \;
}


# HTTP/REST API
jsonapi() {
    http "$@" Accept:application/vnd.api+json Content-Type:application/vnd.api+json
}

pyserver() {
    if [[ $OSTYPE == darwin* ]] ; then
        /usr/bin/open -a "/Applications/Google Chrome.app" 'http://127.0.0.1:8000/'
    else
        google-chrome "http://0.0.0.0:8000/"
    fi
    python -m SimpleHTTPServer 8000
}

# WTF 😇
# alias russian-roulette='[ $(( $RANDOM % 6 )) == 0 ] && rm -rf / || echo "You live"'

#################
#    PROXY      #
#################
enableProxy() {
    export http_proxy=$HTTPPROXY
    export https_proxy=$HTTPSPROXY
    export HTTP_PROXY=$HTTPPROXY
    export HTTPS_PROXY=$HTTPSPROXY

    npm config set proxy $HTTPPROXY
    npm config set https-proxy $HTTPPROXY
}

disableProxy() {
    unset http_proxy
    unset https_proxy
    unset HTTP_PROXY
    unset HTTPS_PROXY

    npm config delete proxy
    npm config delete https-proxy
}

# WTF Composer
disableHttpsProxyOnly() {
    export http_proxy=$URLPROXY
    export HTTP_PROXY=$URLPROXY
    export HTTP_PROXY REQUEST_FULLURI=true

    # http instead
    export https_proxy=$URLPROXY
    export HTTPS_PROXY=$URLPROXY
    export HTTPS_PROXY_REQUEST_FULLURI=false
}
