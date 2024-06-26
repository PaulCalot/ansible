# TODO: use the latest version and ansible-run-python.sh
# To do that, we have to wait for portage on 24.04 I believe
FROM ubuntu:focal
ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt-add-repository -y ppa:neovim-ppa/unstable && apt update && apt install -y curl git ansible build-essential neovim
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

