### Features
- Docker
- Git
- Jenkins

# DevOps Jenkins & Docker

**Table of Contents**

[TOC]

### Setup

#### Install Docker & Docker-compose

- [For Windows](https://docs.docker.com/docker-for-windows/install/ "For Windows")
- [For Mac](https://docs.docker.com/docker-for-mac/install/")
- For Linux (Ubuntu)
	1. [Docker](https://docs.docker.com/engine/install/ubuntu/")
	2. [Docker-compose](https://docs.docker.com/compose/install/")

#### Environment　

```env
HOST_WWW=8080
HOST_OTHER=50000
HOST_JENKINS_DATA=./jenkins_home
HOST_SSH_KEYS=./keys
USERNAME={username slack app}
WEBHOOK={webhook slack}
#HOST_SSH_KEYS=~/.ssh/
#in Windows & Mac
HOST_DOCKER=//var/run/docker.sock
#in linux
#HOST_DOCKER=/var/run/docker.sock
```
### Init

`$ docker-compose build` \
`$ docker-compose up`

### Close
`$ docker-compose down`