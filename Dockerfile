FROM ubuntu:focal
WORKDIR /app
RUN apt-get update \
 && apt-get install -y software-properties-common  \
 && apt-get install -y ansible
COPY . .
CMD ["bash", "-c", "ansible-playbook local.yml"]
