FROM ubuntu:focal

RUN apt-get update \
 && apt-get install -y \
            sudo \
            software-properties-common \
            ansible


RUN adduser --disabled-password --gecos '' questionmorc
RUN adduser questionmorc sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER questionmorc

WORKDIR /app
COPY . .
CMD ["bash", "-c", "ansible-playbook local.yml"]
