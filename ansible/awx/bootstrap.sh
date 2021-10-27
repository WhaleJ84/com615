#!/bin/sh

# https://docs.docker.com/engine/install/ubuntu/
echo "Ensure older versions of Docker are removed"
sudo apt remove -y docker docker-engine docker.io containerd runc

echo "Ensure apt repository is up-to-date"
sudo apt update

echo "Ensure requirements are installed"
sudo apt install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

echo "Ensure Docker's GPG key is added"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


echo "Ensure Docker repository is added to apt"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Ensure apt repository is up-to-date with Docker repository"
sudo apt update

echo "Ensure latest version of Docker is installed from apt repository"
sudo apt install docker-ce docker-ce-cli containerd.io

echo "Ensure current user is in the docker group"
sudo usermod -aG docker "$USER"