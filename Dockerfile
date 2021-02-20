FROM jenkins/jenkins:2.60.3
USER root
RUN apt-get update
RUN apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    sudo
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN apt-get -y install docker-ce docker-ce-cli containerd.io
#RUN sudo usermod -aG docker jenkins/
RUN sudo adduser jenkins docker
#USER jenkins