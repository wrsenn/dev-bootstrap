#!/usr/bin/env bash
## All potentially interactive commands belong here!

set -e

# Xcode Command Line Tools
xcode-select --install || true

# Install Homebrew
brew help &>/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install OhMyZsh
stat ~/.oh-my-zsh &>/dev/null || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Ansible
brew install ansible || true

# Run the M2 stack playbook
ansible-playbook --ask-become-pass `dirname "$0"`/m2_install.yml

# Secure the MariaDB installation
# mysql_secure_installation