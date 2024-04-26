FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/local/bin

RUN apt update && apt install -y \
    git-all \
    software-properties-common \
    python3 \
    python3-pip; \
    curl \
    && apt-get clean all

RUN pip3 install --upgrade pip; \
    pip3 install "ansible==${ANSIBLE_VERSION}"; \
    pip3 install ansible
COPY . .

CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

