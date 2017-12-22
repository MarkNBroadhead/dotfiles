#!/bin/bash
############################
# Dotfiles! Thank the Wizard
############################

name="Dotfiles 0.0.1"

# Add symlinks to each file.
function link_everything {
  echo "Symlinking dotfiles"
  for file in $(find "./files" -depth 1 -exec basename {} \;); do
    ln -sf "$(pwd)/files/$file" "$HOME/$file"
  done
}

# Update the dotfiles repo.
function update {
  echo Updating dotfiles...
  git pull origin master
}

# Show the usage screen.
function print_help {
  function indent {
    local indention=""
    for _ in `seq 1 "$1"`; do
      indention=`echo "$indention    "`
    done
    echo "$indention$2"
  }

  echo $name
  echo "Usage: dotfiles <command>"
  indent 1 "link    - Symlink everything in 'dotfiles/linked'"
  indent 1 "update  - Pull dotfile changes from git"
}

# Figure out which command to run.
case "$1" in
  "link")
    link_everything
    ;;
  "update")
    update
    ;;
  *)
    if [[ ! -z "$1" && "$1" != "--help" ]]; then
      echo "Invalid command '$@'. Showing help instead."
      print_help
      exit 1
    fi
    print_help
    ;;
esac
