# DockerProject
DockerProject
# [Docker](https://docs.docker.com/)
# [Docker Commandline](http://gitlab/Piboonsak/DockerProject/blob/master/Document_Files/Dockercommand.md)

# Installation
## Get Docker CE for Ubuntu

ref link : https://docs.docker.com/install/linux/docker-ce/ubuntu/

-----------------------------------

### Older versions of Docker were called docker or docker-engine. If these are installed, uninstall them:
```sh
$ sudo apt-get remove docker docker-engine docker.io
```

#### 1.Update the apt package index:
```sh
$ sudo apt-get update
```
#### 2.Install packages to allow apt to use a repository over HTTPS:
```sh
$ sudo apt-get install \
    apt-transport-https \ 
    ca-certificates \ 
    curl \ 
    software-properties-common 
```
#### 3.Add Docker’s official GPG key: 
```sh
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

###### Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.
```sh
$ sudo apt-key fingerprint 0EBFCD88

pub   4096R/0EBFCD88 2017-02-22
      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid                  Docker Release (CE deb) <docker@docker.com>
sub   4096R/F273FCD8 2017-02-22
```
#### 4.Use the following command to set up the stable repository. You always need the stable repository, even if you want to install builds from the edge or test repositories as well. To add the edge or test repository, add the word edge or test (or both) after the word stable in the commands below.
```sh
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

## INSTALL DOCKER CE
#### 1.Update the apt package index.
```sh
$ sudo apt-get update
```
#### 2.Install the latest version of Docker CE, or go to the next step to install a specific version:
```sh
$ sudo apt-get install docker-ce
```
#### 3.Verify that Docker CE is installed correctly by running the hello-world image.
```sh
$ sudo docker run hello-world
```

----------------------------------------------------------------------------------------------------------------
## Install Docker Machine

ref link : https://docs.docker.com/machine/install-machine/#install-machine-directly

```sh
$ base=https://github.com/docker/machine/releases/download/v0.14.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo install /tmp/docker-machine /usr/local/bin/docker-machine

$ docker-machine ls
```
### Script Install VirtualBox Latest On Ubuntu 16.04 LTS / 17.04 / 17.10
```sh
#!/bin/bash
### Install versualbox
### Ref Link : https://websiteforstudents.com/install-virtualbox-latest-on-ubuntu-16-04-lts-17-04-17-10/


## Step 1: Add VirtualBox Repository Key
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -


## Step 2: Add VirtualBox Repository
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list.d/virtualbox.list'


## Step 3: Installing VirtualBox


sudo apt remove virtualbox virtualbox-5.1

sudo apt update
sudo apt-get -y install gcc make linux-headers-$(uname -r) dkms

sudo apt update
sudo apt-get install virtualbox-5.2

vboxmanage --version
```
----------------------------------------------------------------------------------------------------------------
### Load docker images
```sh
docker pull ubuntu:16.04
docker pull openshift/base-centos7:latest
docker pull openshift/wildfly-101-centos7:latest
docker pull nginx:1.15
docker pull mysql:5.7.23
docker pull php:7.0.31-cli
docker pull elasticsearch:5.6.10
docker pull redis:4.0.10
docker pull gitlab/gitlab-ee:10.5.1-ee.0
docker pull shipyard/shipyard:latest
docker pull python:3.7
docker pull labdocker/alpinepython:2.7-onbuild
docker pull labdocker/linenotify:bot_v1
docker pull labdocker/cluster:webservicelite
```
---
## Move images
```
docker save -o <path for generated tar file> <image name>

docker load -i <path to image tar file>
```
----------------------------------------------------------------------------------------------------------------
#### Save images
```sh
docker save -o /root/alpine.tar labdocker/alpine
docker save -o /root/mysql.tar mysql
docker save -o /root/mysql-cluster.tar mysql/mysql-cluster
docker save -o /root/ubuntu.tar ubuntu
docker save -o /root/wildfly-101-centos7.tar openshift/wildfly-101-centos7
docker save -o /root/nginx.tar nginx
docker save -o /root/php.tar php
docker save -o /root/elasticsearch.tar elasticsearch
docker save -o /root/redis.tar redis
docker save -o /root/hello-world.tar
docker save -o /root/gitlab-ee.tar gitlab/gitlab-ee
docker save -o /root/alpinepython.tar labdocker/alpinepython
docker save -o /root/base-centos7.tar openshift/base-centos7
docker save -o /root/shipyard.tar shipyard/shipyard
docker save -o /root/cadvisor.tar labdocker/cadvisor
docker save -o /root/alpineweb.tar labdocker/alpineweb
docker save -o /root/alpine.tar alpine
```

#### Load images
```sh
docker load -i /root/alpine.tar
docker load -i /root/alpinepython.tar
docker load -i /root/alpineweb.tar
docker load -i /root/base-centos7.tar
docker load -i /root/cadvisor.tar
docker load -i /root/elasticsearch.tar
docker load -i /root/gitlab-ee.tar
docker load -i /root/mysql-cluster.tar
docker load -i /root/mysql.tar
docker load -i /root/nginx.tar
docker load -i /root/php.tar
docker load -i /root/redis.tar
docker load -i /root/shipyard.tar
docker load -i /root/ubuntu.tar
docker load -i /root/wildfly-101-centos7.tar
```

----------------------------------------------------------------------------------------------------------------
###### check version docker-machine
```sh
$ docker-machine --version
```

###### Create Driver Vistualbox
```sh
$ docker-machine create --driver virtualbox labdocker
```

## login docker hub :
```sh
root@docker100:~# docker login -u piboonsak
Password: 
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store
Login Succeeded
```

## tag image to registry
```sh
root@docker100:~# docker images
REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
mysql                           5.7.23              75576f90a779        5 days ago          372MB
mysql/mysql-cluster             latest              70a24b0c4ad8        7 days ago          342MB
ubuntu                          16.04               7aa3602ab41e        10 days ago         115MB
openshift/wildfly-101-centos7   latest              0e2f337b26d1        11 days ago         947MB
nginx                           1.15                c82521676580        12 days ago         109MB
php                             7.0.31-cli          9199f57dbf35        2 weeks ago         356MB
elasticsearch                   5.6.10              37ad37f1c8a7        2 weeks ago         486MB
redis                           4.0.10              f06a5773f01e        2 weeks ago         83.4MB
hello-world                     latest              2cb0d9787c4d        3 weeks ago         1.85kB
gitlab/gitlab-ee                10.5.1-ee.0         c6cccbe5b89c        5 months ago        1.59GB
labdocker/linenotify            bot_v1              bfa380101436        12 months ago       61.7MB
labdocker/cluster               webservicelite      837c8f41c918        13 months ago       82.6MB
labdocker/alpinepython          2.7-onbuild         0f4df961b16b        13 months ago       475MB
labdocker/redis                 latest              4e482b286430        13 months ago       99MB
labdocker/mysql                 latest              44a8e1a5c0b2        13 months ago       407MB
openshift/base-centos7          latest              4842f0bd3d61        18 months ago       383MB
shipyard/shipyard               latest              36fb3dc0907d        22 months ago       58.8MB
labdocker/cadvisor              latest              4bc3588563b1        2 years ago         48.2MB
labdocker/alpineweb             latest              20f37a9ebc28        2 years ago         24.5MB
labdocker/alpine                latest              14f89d0e6257        2 years ago         4.79MB
```
```sh
root@docker100:~# docker tag labdocker/alpineweb:latest piboonsak/alpineweb:latest
```
## push image to own registry.
```sh
root@docker100:~# docker push piboonsak/alpineweb:latest
The push refers to repository [docker.io/piboonsak/alpineweb]
fac72fe33938: Pushed 
37f16ffbfe68: Pushed 
660068aaf582: Pushed 
6102f0d2ad33: Mounted from labdocker/linenotify 
latest: digest: sha256:1e8d03501b58cb7b79cd5a9545a1e60061e97fc4cf2e35858e6dc087d951e72a size: 1152
```
---
## Interactive NODEJS
```
$ docker run  -i -t --rm --name nodejs -p 3000:3000 labdocker/alpineweb:latest node hello.js
```

## Detach NODEJS
```sh
$ docker run -d -t --name nodejs -p 3000:3000 labdocker/alpineweb:latest node hello.js
```

## Run ubuntu
```sh
$ docker run -d -t --name ubuntu1604 ubuntu:latest
```





----------------------------------------------------------------------------------------------------------------
### docker swarm

```sh
Name 	    Role	IP Address	
docker100	manager	192.168.23.100	ready
docker101	worker  192.168.23.101	ready
docker102	worker	192.168.23.102	ready
docker103	worker	192.168.23.103	ready
docker104	worker	192.168.23.104	ready
```

###  Docker swarm manager
```sh 
$ docker swarm init --advertise-addr 192.168.23.100:2377
docker swarm join-token manager
```
```sh
root@docker100:~# docker swarm init --advertise-addr 192.168.23.100:2377
Swarm initialized: current node (t6lzlmlgi0guuqxgxtli5gaam) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.100:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

### Docker worker
```sh
location: ####docker101####
docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.100:2377

location: ####docker102####
docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.100:2377

location: ####docker103####
docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.100:2377

location: ####docker104####
docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.100:2377
```


## test
```sh
docker service create --name nodejs -dt labdocker/alpineweb:latest node hello.js
```


## Check token
```sh
root@docker100:~# docker swarm join-token manager 
To add a manager to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-cspwqxq7cjj8clbu86yq0uf68 192.168.23.100:2377


docker build -t piboonsak/myfirstapp .

docker run -p 8888:5000 --name myfirstapp piboonsak/myfirstapp

```

### Install RVM

Ref :  https://rvm.io/rvm/install
Ref :  https://github.com/rvm/ubuntu_rvm


`gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

`curl -sSL https://get.rvm.io | bash -s stable`

`sudo apt-get install software-properties-common`

`rvm install ruby`

```sh
root@0b123ace96d4:/# rvm install ruby
Searching for binary rubies, this might take some time.
Found remote file https://rvm_io.global.ssl.fastly.net/binaries/ubuntu/16.04/x86_64/ruby-2.5.1.tar.bz2
Checking requirements for ubuntu.
Installing requirements for ubuntu.
Updating system..
```

`curl -sSL https://get.rvm.io | bash -s stable`

```sh
root@0b123ace96d4:~# curl -sSL https://get.rvm.io | bash -s stable
Downloading https://github.com/rvm/rvm/archive/1.29.4.tar.gz
Downloading https://github.com/rvm/rvm/releases/download/1.29.4/1.29.4.tar.gz.asc
gpg: Signature made Sun Jul  1 19:41:26 2018 UTC using RSA key ID BF04FF17
gpg: Can't check signature: public key not found

```

`rvm reload`

```sh
root@0b123ace96d4:~# rvm reload
RVM reloaded!

```

```sh
root@0b123ace96d4:~# source /etc/profile
root@0b123ace96d4:~# rvm user gemsets
root@0b123ace96d4:~# rvm list known
# MRI Rubies
[ruby-]1.8.6[-p420]
[ruby-]1.8.7[-head] # security released on head
[ruby-]1.9.1[-p431]

```

```sh
root@0b123ace96d4:~# rvm install 2.1
Searching for binary rubies, this might take some time.
Found remote file https://rubies.travis-ci.org/ubuntu/16.04/x86_64/ruby-2.1.10.tar.bz2
Checking requirements for ubuntu.
Requirements installation successful.
ruby-2.1.10 - #configure
ruby-2.1.10 - #download
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0
100 22.9M  100 22.9M    0     0  1963k      0  0:00:11  0:00:11 --:--:-- 4857k

```


`nano ~/.bashrc`

```
### add line :

/bin/bash --login
```
`source ~/.bashrc`

```
root@0b123ace96d4:~# nano ~/.bashrc
root@0b123ace96d4:~# source ~/.bashrc
bash: /bin/bash: Argument list too long
```
----------------------------------------------------------------------------------------------------------------

## Run service on swarm

Ex.1
docker service create --name="myservice" ubuntu:16.04
docker service create --name="ubuntu_1604" ubuntu:16.04
docker service create --name="Pre_ubuntu_1604" ubuntu:16.04
docker service create --name="ruby_ubuntu_1604" ubuntu:16.04

docker service create --name="portainer" portainer/portainer

docker service create --name=

docker service create --name= "Pentaho80" consol/ubuntu-icewm-vnc:latest



### deploy portainner on swarm
```sh
$ curl -L https://portainer.io/download/portainer-agent-stack.yml -o portainer-agent-stack.yml

$ docker stack deploy --compose-file=portainer-agent-stack.yml portainer

!Don't run portainer on container if you plan to deploy on swarm.

```

----------------------------------------------------------------------------------------------------------------

$ docker service create - d -t --name ubuntu-ruby drecom/ubuntu-ruby



drecom/ubuntu-ruby:latest
