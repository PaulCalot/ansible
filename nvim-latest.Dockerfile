FROM ubuntu:24.04
ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y software-properties-common \
    && add-apt-repository --yes --update ppa:ansible/ansible \
    && apt install -y curl git ansible build-essential neovim
# remove ppa because it does not have release file yet for 24.04
# so it will fail afterwards
RUN add-apt-repository --remove ppa:ansible/ansible
RUN apt clean 

COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
