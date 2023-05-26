#!/usr/bin/env bash

doIt() {
  script_dir="$(realpath "$(dirname "$0")")"
  backup_dir="$script_dir/.dotfiles.bak"

  if [[ ! -d $backup_dir ]]; then
    echo creating backup directory "$backup_dir"
    echo 
    mkdir "$backup_dir"
  fi

  rsync --exclude "bootstrap.sh" \
        --exclude ".gitignore" \
        --exclude "$backup_dir" \
        --exclude ".git" \
        -avh . ~ \
        --backup \
        --backup-dir="$backup_dir" \
        --suffix=".bak"

  # source ~/.bash_profile
}

if [[ "$1" == "--force" || "$1" == "-f" ]]; then
  doIt
else
  read -r -p "This may overwrite existing files in your home directory. Do
  you wnat to continue? (y/n)" -n 1

  echo
  echo 

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi
fi
