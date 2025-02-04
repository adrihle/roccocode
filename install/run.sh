#!/bin/bash

# TODO: modify this to install the repository automatically
function install_brew () {
  if command -v brew >/dev/null; then
    echo "$SUCCESS_LOG_TAG Already installed ${BOLD}$(brew --version)${NC}"
  else
    git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew \
      && mkdir ~/.linuxbrew/bin \
      && ln -s ../Homebrew/bin/brew ~/.linuxbrew/bin
  fi
}

# function install_brew_packages () {
#   echo "$LOG_TAG Installing dependencies"
#   local dependencies=()
#   while IFS= read -r dependencie; do
#     dependencies+=("$dependencie")
#   done < "modules/homebrew/dependencies.txt"
#   for package in "${dependencies[@]}"; do
#     install_package "$package"
#   done
#   echo "$SUCCESS_LOG_TAG Finished installed dependencies"
# }

function init_homebrew () {
  local LOG_TAG="${BLUE}[HOMEBREW]${NC}"
  local SUCCESS_LOG_TAG="${GREEN}[HOMEBREW]${NC}"
  echo "$LOG_TAG ${BOLD}Installing${NC}"
  install_brew
  # install_brew_packages
  echo "$SUCCESS_LOG_TAG ${BOLD}Finished installation $(brew --version)${NC}"
}

init_homebrew
