#!/bin/bash

# Update package manager
#
# Somehow make this distro agnostic as I have no idea if
# when I'm gonna distro-hop the next time
sudo apt update 
sudo apt upgrade -y

# Install zsh
sudo apt install zsh -y

filesAmount=0
dirsAmount=0

# Create directories for various dotfile locations
for dir in ./*/; do
  dir=${dir%*/}
  pwd=$(pwd)
  configDir=".config"

  # Create our config directory
  # This is only temporary
  mkdir -p ~/${configDir}
  
  # Create directory for every subdirectory of this directory
  # Directory-ception!!!1
  echo "Setting up config files for ${dir##*/}"
  mkdir -p ${HOME}/${configDir}/${dir##*/}

  # Loop over files in directory and symlink them to ~/.config/
  for filename in ${dir}/*; do
    ln -s ${pwd%*/}/${filename#*/} ${HOME}/${configDir}/${dir##*/}
    ((filesAmount+=1))
  done

  ((dirsAmount+=1))
done

echo "Done setting up ${filesAmount} config files in ${dirsAmount} directories"
