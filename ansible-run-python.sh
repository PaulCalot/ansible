#!/bin/bash

sudo apt update -y
sudo apt install -y python3 python3-pip
sudo pip3 install pipx
pipx ensurepath
pipx install ansible
