#!/bin/bash
sudo apt update -y
sudo apt-get install git-all
# pipx
sudo apt install pipx
pipx ensurepath
sudo pipx ensurepath --global
# ansible
pipx install --include-deps ansible
