#!/usr/bin/env bash
## All potentially interactive commands belong here!

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# # Xcode Command Line Tools
# xcode-select --install || true

# # Install Homebrew
# brew help &>/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# # Install OhMyZsh
# stat ~/.oh-my-zsh &>/dev/null || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# # Install Ansible
# brew install ansible || true

# Run the M2 stack playbook
ansible-playbook --ask-become-pass $DIR/m2_install.yml

# Secure the MariaDB installation
# mysql_secure_installation