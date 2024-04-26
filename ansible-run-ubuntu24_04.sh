#!/usr/bin/env bash
sudo apt update \
    && sudo apt install -y software-properties-common \
    && sudo add-apt-repository --yes --update ppa:ansible/ansible \
    && sudo apt install -y curl git ansible build-essential neovim
# remove ppa because it does not have release file yet for 24.04
# so it will fail afterwards
# by removing ppa, apt update does not look at the repo so no issue
sudo add-apt-repository --remove ppa:ansible/ansible
