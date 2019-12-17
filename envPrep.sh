#!/bin/bash
# dev environment preparer to work with cloudWraith

# install linux dependencies
sudo apt-get update
sudo apt-get install \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common \
	gnupg-agent

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
sudo usermod -aG docker $USER

# validate docker from another shell
spineCheck="$(~/cloudWraith/docker/dockerCheck.sh)";
echo Shelled health check:
echo $spineCheck