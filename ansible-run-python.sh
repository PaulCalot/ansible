#!/bin/bash
sudo apt update
# git
sudo apt install git-all -y
sudo apt install -y software-properties-common 
# python
sudo apt install python3 -y
# pipx
sudo apt install pipx -y
pipx ensurepath
# ansible
pipx install --include-deps ansible
