FROM jenkins/jenkins
USER root
RUN apt-get update
RUN apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    sudo
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN apt-get -y install docker-ce docker-ce-cli containerd.io
RUN curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod 770 /usr/local/bin/docker-compose
RUN mkdir /root/.ssh/
#RUN echo -e $HOST_SSH_ID_RSA>/root/.ssh/id_rsa
COPY ./keys/ /root/.ssh/
COPY ./slackmessage.sh /var/lib/jenkins/
#RUN adduser jenkins docker
#RUN usermod -aG docker jenkins
#USER jenkins