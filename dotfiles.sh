#!/bin/bash
############################
# Dotfiles! Thank the wizard
############################

name="Dotfiles 0.0.2"

# Show the usage screen.
function print_help {

  # Add an indent level to messages.
  function indent {
    local indention=""
    for _ in `seq 1 "$1"`; do
      indention=`echo "$indention    "`
    done
    echo "$indention$2"
  }

  echo $name
  echo "Usage: dotfiles <command>"
  indent 1 "link    - Symlink project dotfiles to home directory"
  indent 1 "update  - Pull new dotfiles from git repo"
  indent 1 "install - Install programs"
  indent 1 "dir     - Print the dotfiles directory"
}

function install {
  bash "$DOTFILES_DIR/install.sh"
}

# Figure out what command to run.
case "$1" in
  "link")
    link_everything
    ;;
  "update")
    update
    ;;
  "install")
    install
    ;;
  "dir")
    echo "$DOTFILES_DIR"
    ;;
  *)
    if [[ ! -z "$1" && "$1" != "--help" ]]; then
      echo "Invalid command '$@'. Showing help instead."
      print_help

      # Probably a typo. Make them feel the pain!
      exit 1
    fi
    print_help
    ;;
esac
