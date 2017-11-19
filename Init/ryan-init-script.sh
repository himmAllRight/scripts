#!/bin/bash


usage() {
	  echo -e "install.sh\n\tThis script installs my basic setup my computers.\n"
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

# Setup Dev environments
setup_dev() {
    devsetup_golang
}

# Setup the i3 window manager and associated packages
setup_i3wm-solus() {
    # Clone my i3blocks
    cd "$HOME/Builds/"
    git clone https://github.com/himmAllRight/i3blocks

}

# Bare Min apps for Solus Install
basemin_solus() {
    ## Update System First
    eopkg it update

    ## System Devel files
    eopkg it -c system.devel

    ## Remaining Solus Packages
    eopkg it \
          vim \
          stow \
          tmux \
          fish \
          emacs \
          password-store
}

base_solus() {
    # get solus bare min first
    basemin_solus

    # More custom solus packages
    eopkg it \
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
}


main() {
	  local cmd=$1

	  if [[ -z "$cmd" ]]; then
		    usage
		    exit 1
	  fi

	  if [[ $cmd == "base_solus" ]]; then
		    check_is_sudo
		    base_solus

	  elif [[ $cmd == "basemin_solus" ]]; then
		    check_is_sudo
		    basemin_solus
	  elif [[ $cmd == "get_dotfiles" ]]; then 
		    get_dotfiles
	  elif [[ $cmd == "set_dotfiles" ]]; then
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
