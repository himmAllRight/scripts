#!/bin/bash


usage() {
	  echo -e "ryan-init-script.sh\n\tThis script installs my basic setup my computers.\n"
    echo -e "Note: This is likely out of date until I get everything sorted out!!\n"
	  echo "Usage:"
	  echo "  base_solus                          - install solus basemin + base pkgs"
	  echo "  basemin_solus                       - install solus base min pkgs"
	  echo "  dotfiles                            - get dotfiles"
    echo "  dev-setup                           - setup dev environments"
	  echo "  scripts                             - install scripts"
}

check_is_sudo() {
	  if [ "$EUID" -ne 0 ]; then
		    echo "Please run as root."
		    exit
	  fi
}

set_spacemacs() {
    (## Install spacemacs to .emacs.d
        git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    )
    (## Init spacemacs dotfiles
        cd "$HOME/dotfiles"
        stow spacemacs
    )
}

# Work in Progress
set_ohmyfish() {
    (
        curl -L https://get.oh-my.fish | fish
    )
}

get_dotfiles() {
	  (
	      cd "$HOME"
	      # install dotfiles from repo
	      git clone https://github.com/himmAllRight/dotfiles.git "${HOME}/dotfiles"

	  )
}

set_dotfiles() {
    cd "$HOME/dotfiles"

    stow bash
    stow tmux
    stow vim
    set_ohmyfish
    stow fish
    set_spacemacs
}

# Setup go dev env
devsetup_golang() {
    ## Make my golang dir
    (
        mkdir -p ${HOME}/Documents/Programming/golang/{bin,pkg,src}
    )

    (
        ## Temp Setup paths in bash
        ## NOTE: These should also define in whatever shell configs I use
        export GOROOT=/usr/bin/go
        export GOPATH=~/Documents/Programming/golang
        export PATH=$PATH:$GOROOT/bin
        export PATH=$PATH:$GOPATH/bin
    )
    ## Install packages with go get
    (
        go get golang.org/x/tools/cmd/...
    )
}

# Setup website repos
setup_website() {
    # Ensure Documents dir exists and move to it
    mkdir -p "$HOME/Documents/"
    cd "$HOME/Documents/"

    # Pull down repos
    git clone git@github.com:himmAllRight/himmAllRight-source.git
    git clone git@github.com:himmAllRight/himmAllRight.github.io.git
}

# Setup Dev environments
setup_dev() {
    devsetup_golang
}

# Bare Min apps for Solus Install
basemin_solus() {
    ## Update System First
    sudo eopkg it update

    ## System Devel files
    sudo eopkg it -c system.devel

    ## Remaining Solus Packages
    sudo eopkg it \
         vim \
         stow \
         tmux \
         fish \
         emacs \
         password-store
}

setup_solus_desktop() {
    # get solus bare min first
    basemin_solus

    # More custom solus packages
    sudo eopkg it \
         telegram \
         wire \
         shotwell \
         pithos \
         gnome-tweak-tool \
         hugo \
         signal-desktop \
         budgie-screenshot-applet \
         budgie-caffeine-applet \
         budgie-haste-applet \
         peek \
         virt-manager \
         # Dev Packages
         python3 \
             golang
    
    setup_website
}


main() {
	  local cmd=$1

	  if [[ -z "$cmd" ]]; then
		    usage
		    exit 1
	  fi

	  if [[ $cmd == "setup-solus-desktop" ]]; then
		    #check_is_sudo
		    setup_solus_desktop

	  elif [[ $cmd == "basemin-solus" ]]; then
		    check_is_sudo
		    basemin_solus
	  elif [[ $cmd == "get-dotfiles" ]]; then 
		    get_dotfiles
	  elif [[ $cmd == "set-dotfiles" ]]; then
		    set_dotfiles
	  elif [[ $cmd == "dotfiles" ]]; then
		    get_dotfiles
        set_dotfiles
	  elif [[ $cmd == "scripts" ]]; then
		    install_scripts
	  elif [[ $cmd == "dev-setup" ]]; then
		    setup_dev
	  else
		    usage
	  fi
}

main "$@"
