# Docker Command Line
## docker swarm unlock keys
**Run every time when restart swarm hosts ,Include worker's host.**

`docker swarm unlock`

SWMKEY-1-M1dMzFkht8EEh3dPmzu8kLXorb0yl/zyAIuA71R4K2o

**At Manager/Leader node**
```
root@docker100:~# docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
t6lzlmlgi0guuqxgxtli5gaam *   docker100           Ready               Active              Reachable           18.06.0-ce
5sm7tgb3x939ylfclxcb66p7g     docker101           Ready               Active              Leader              18.06.0-ce
2jrc8ohqm2yu56cqxlq0bvcwj     docker102           Down                Active              Unreachable         18.06.0-ce
r936wsylwhft5fa826zzziet1     docker105           Ready               Active                                  18.06.0-ce
```
**At host that restart**
```
root@docker102:~# service docker restart
root@docker102:~# docker swarm unlock
Please enter unlock key: 
root@docker102:~#
```
**At Manager/Leader node**
```
root@docker100:~# docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
t6lzlmlgi0guuqxgxtli5gaam *   docker100           Ready               Active              Reachable           18.06.0-ce
5sm7tgb3x939ylfclxcb66p7g     docker101           Ready               Active              Leader              18.06.0-ce
2jrc8ohqm2yu56cqxlq0bvcwj     docker102           Ready               Active              Reachable           18.06.0-ce
r936wsylwhft5fa826zzziet1     docker105           Ready               Active                                  18.06.0-ce

```

# Checkversion
`docker -v`
`docker-machine --version` 
`vboxmanage --version`
`docker-compose --version`

# Load docker images
`docker pull ubuntu:16.04`
`docker pull nginx:1.15`
`docker pull mysql:5.7.23`
`docker pull php:7.0.31-cli`


# Save images
`docker save -o /root/alpine.tar labdocker/alpine`
`docker save -o /root/mysql.tar mysql`
`docker save -o /root/mysql-cluster.tar mysql/mysql-cluster`
`docker save -o /root/ubuntu_1604_GUI.tar ubuntu:16.04_GUI`
`docker save -o /root/nginx_lb.tar nginx:ububtu16.04_STD`
`docker save -o /root/images/ubuntuv212.tar ubuntu1604_buildv2.1:latest`


# Load images
`docker load -i /root/alpine.tar`
`docker load -i /root/alpinepython.tar`
`docker load -i /root/alpineweb.tar`


# docker useful command
`docker ps`
`docker images`
`docker contailner ls`
`docker node ls`

# join swarm
## Check token and command
`docker swarm join-token manager`

## Join
`docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.100:2377`


# Run container
`docker run -d -t --name ubuntu_1604_STD ubuntu:16.04`
`docker run -d -t --name ubuntu_1604_STD ubuntu:16.04`
`docker run -d -t --name k8s 80:80 piboonsak/ubuntu:STD`

```sh
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
ubuntu1604               RVM                 85df110f3556        17 seconds ago      557MB
```
`docker run -d -t --name ubuntu_1604_RVM ubuntu1604:RVM`


# Access to running container
`docker container exec -it ubuntu_1604_STD sh`

# Commit to build new images version
## Don't run again ,It will replace saved image.
`docker commit b5980576fa93 ubuntu:16.04_STD`  
`docker commit 03dc875fd549 ubuntu:16.04_GUI`
`docker commit 1c718bc65a08 ubuntu_Ruby:RVM`
`docker commit c64e98c20968 nginx:ububtu16.04_STD` 
`docker commit 79fac4107fa5 ubuntu:16.04_STD_LAMP`
`docker commit c106dd81a949 google-ads-api-ruby`

# Rename Image
`docker tag server:latest myname/server:latest`
or
`docker tag d583c3ac45fd myname/server:latest`

## ex
`docker tag 436b51bf1cb4 piboonsak/ubuntu:STD`
`docker tag 35912fdceace piboonsak/ubuntu1604:GUI`


# Remove Image
`docker image rm 35912fdceace --no-prune`
or
`docker image rm ubuntu:16.04_STD`
or
`docker image rm piboonsak/ubuntu1604:GUI`


# SSH into running containner.
`docker exec -it <container name> /bin/bash`

`docker exec -it ubuntu1604_GUI /bin/bash`

```sh
root@docker100:~# docker exec -it ubuntu1604_GUI /bin/bash
root@03dc875fd549:/# 
```

# Docker build
`docker build -t labdocker/web:1.0 /Share_DockerToolbox/nginx`
01880df5126b
`docker tag 01880df5126b php-fpm:v7.2.2`
`docker image rm 53b752ad6744 --no-prune`

Ex.
direct to docker file path
then run
docker build .


# Docker Registry

## tag
`docker tag labdocker/alpine:latest localhost:5000/alpine:latest`
`docker tag piboonsak/ubuntu:STD registry/ubuntu:STD`
`docker tag piboonsak/ubuntu:STD docker102:5000/ubuntu:STD`

## push
`docker push localhost:5000/alpine:latest`

`docker push docker102:5000/ubuntu:STD`

## List images
`curl -X GET http://localhost:5000/v2/_catalog`

`curl -X GET http://docker102:5000/v2/_catalog`



## Copy file into docker container

The cp command can be used to copy files. One specific file can be copied like:

`docker cp foo.txt mycontainer:/foo.txt`
`docker cp mycontainer:/foo.txt foo.txt`

Multiple files contained by the folder src can be copied into the target folder using:

`docker cp src/. mycontainer:/target`
`docker cp mycontainer:/src/. target`


## [Change port :](https://stackoverflow.com/questions/19335444/how-do-i-assign-a-port-mapping-to-an-existing-docker-container)

### To add port forwardings, I always follow these steps,

`stop running container`

`docker stop test01`

### commit the container

`docker commit test01 test02`

NOTE: *The above, test02 is a new image that I'm constructing from the test01 container.*

re-run from the commited image

`docker run -p 8080:8080 -td test02`
Where the first 8080 is the local port and the second 8080 is the container port.


## [EXPOSE Port on running container](https://forums.docker.com/t/how-to-expose-port-on-running-container/3252/8) 

docker run -i --expose=22 b5593e60c33b bash

docker run -d -p 5801:5801 -p 5802:5802 .....

docker run -d -p 5801:5800 --name vnc1 myvnc
docker run -d -p 5802:5800 --name vnc2 myvnc

docker run -d --net=host myvnc

that will expose and map the port automatically to your host

### Ex

CONTAINER ID        IMAGE                    COMMAND             CREATED             STATUS                   PORTS               NAMES
4eb892011dd2        ubuntu_rvm:ver1          "/bin/bash"         11 days ago         Exited (1) 11 days ago                       rvm
c00295c22cbf        ubuntu1604:RVM           "/bin/bash"         13 days ago         Up 13 days                                   ubuntu_1604_RVM
fd56a54989bb        piboonsak/ubuntu:STD     "/bin/bash"         13 days ago         Up 13 days                                   ubuntu_STD
2d70cba50a53        ubuntu_ruby:RVM          "/bin/bash"         13 days ago         Up 13 days                                   ubuntu_ruby
df625f7f9f52        ubuntu:16.04_GUI         "/bin/bash"         13 days ago         Exited (0) 13 days ago                       ubuntuGUI

docker run -d -p 8080:80 --name ubuntu_STD ubuntu_STD_8080

### To expose multiple ports, simply provide multiple -p arguments:

docker run -p <host_port1>:<container_port1> -p <host_port2>:<container_port2>

### docker run
docker run -p 80:80/tcp -p 80:80/udp ...

### Check network route
iptables -t nat -L -n

# Dockerfile
## Example dockerfile
```yml
FROM ubuntu:16.04
MAINTAINER Piboonsak Pimsarn (PiboonsakTraceon@gmail.com) 
LABEL Description="ubuntu STD"
ENV ubuntu=16.04
RUN apt-get update && apt-get install -y \
	nano \
	wget \
	curl \
	htop \
	man \
	net-tools \
        iptables iptables-persistent
RUN apt-get install iputils-ping
RUN mkdir -p /myapp
WORKDIR /myapp
EXPOSE 3000 80 443 22 3306
```
### Muti EXPOSE port in dockfile

EXPOSE 3000 80 443 22

EXPOSE 80/tcp
EXPOSE 80/udp

### Example run auto build.
`docker build -t shykes/myapp:1.0.2 -t shykes/myapp:latest .`

`docker build -f /path/to/a/Dockerfile .`
`docker build -t shykes/myapp .`
`docker build -t shykes/myapp:1.0.2 -t shykes/myapp:latest .`


## Check container port
docker port test_sshd 22
0.0.0.0:49154

```sh
root@docker102:~# docker container ls
CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS              PORTS                                                                       NAMES
79fac4107fa5        ubuntu1604:STDv2.12        "/bin/bash"              28 minutes ago      Up 28 minutes       22/tcp, 443/tcp, 8080/tcp, 0.0.0.0:10080->80/tcp, 0.0.0.0:13306->3306/tcp   testPort
fab51f2118e5        labdocker/alpineweb:web1   "node hello.js"          5 days ago          Up 5 days           0.0.0.0:3000->3000/tcp                                                      web1
8dfd5cad96ef        registry:latest            "/entrypoint.sh /etc…"   12 days ago         Up 12 days          5000/tcp                                                                    registry.2.tky3q6fvgzehiclb4xz67o6ul
f17ddba182ec        portainer/agent:latest     "./agent"                2 weeks ago         Up 2 weeks                                                                                      portainer_agent.2jrc8ohqm2yu56cqxlq0bvcwj.6vd57v83jnsx9nrzrmrovora2
root@docker102:~# docker port testPort 22
Error: No public port '22/tcp' published for testPort
root@docker102:~# docker port testPort 80
0.0.0.0:10080
root@docker102:~# docker port testPort 443
Error: No public port '443/tcp' published for testPort
root@docker102:~# docker port testPort 13306
Error: No public port '13306/tcp' published for testPort
root@docker102:~# docker port testPort 3306
0.0.0.0:13306
root@docker102:~# 

```



## tag & push

ubuntu1604_buildv2.1:latest
docker tag ubuntu1604_buildv2.1:latest localhost:5000/ubuntu1604:buildv2.1
docker push localhost:5000/ubuntu1604:buildv2.1

ubuntu:16.04_STD_LAMP 
docker tag ubuntu:16.04_STD_LAMP docker100:5000/ubuntu:16.04_STD_LAMP
docker push docker100:5000/ubuntu:16.04_STD_LAMP
## volume host docker100

volume in path /var/lib/docker/volumes/registry_data/_data

## webUI
http://docker100:35000/repositories/


cat ~/my_password.txt | docker login --username root --password-stdin


## Docker swarm
docker swarm init --advertise-addr 192.168.23.100:2377
docker swarm join-token manager

## Join swarm node
location: ####docker101####
docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.100:2377

location: ####docker102####
docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.100:2377

-----------------------------------------------------------------------------------------------------------------------------
# Docker node admin(can command only on manager/Leader node)

docker node ls

## start node service ("active"|"pause"|"drain")
docker node update --availability active docker104

## stop node service
docker node update --availability pause docker104

## update --role  ("worker"|"manager")

docker node update --role manager docker104
docker node update --role worker docker103

## auto lock swarm after restart

```
root@docker100:~# docker swarm update --autolock
Swarm updated.
To unlock a swarm manager after it restarts, run the `docker swarm unlock`
command and provide the following key:

    SWMKEY-1-M1dMzFkht8EEh3dPmzu8kLXorb0yl/zyAIuA71R4K2o

Please remember to store this key in a password manager, since without it you
will not be able to restart the manager.
```
-----------------------------------------------------------------------------------------------------------------------------
## remove node from swarm
### drain

```
root@docker101:~# docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
t6lzlmlgi0guuqxgxtli5gaam     docker100           Ready               Active              Reachable           18.06.0-ce
5sm7tgb3x939ylfclxcb66p7g *   docker101           Ready               Active              Leader              18.06.0-ce
2jrc8ohqm2yu56cqxlq0bvcwj     docker102           Ready               Active                                  18.06.0-ce
vawf47totfd82nw9pd0nzlsul     docker103           Down                Active                                  18.06.0-ce
r936wsylwhft5fa826zzziet1     docker105           Ready               Active              Reachable           18.06.0-ce
root@docker101:~# docker node update --availability drain vawf47totfd82nw9pd0nzlsul
vawf47totfd82nw9pd0nzlsul
```

### pause
root@docker101:~# docker node update --availability pause vawf47totfd82nw9pd0nzlsul
vawf47totfd82nw9pd0nzlsul

### remove from swarm

```
root@docker101:~# docker node rm vawf47totfd82nw9pd0nzlsul
vawf47totfd82nw9pd0nzlsul
root@docker101:~# docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
t6lzlmlgi0guuqxgxtli5gaam     docker100           Ready               Active              Reachable           18.06.0-ce
5sm7tgb3x939ylfclxcb66p7g *   docker101           Ready               Active              Leader              18.06.0-ce
2jrc8ohqm2yu56cqxlq0bvcwj     docker102           Ready               Active                                  18.06.0-ce
r936wsylwhft5fa826zzziet1     docker105           Ready               Active              Reachable           18.06.0-ce

```

## leave from swarm
### **At worker node**
**go to worker node**

```
root@docker104:~# docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
ddcba13191be        bridge              bridge              local
c2219592e39c        docker_gwbridge     bridge              local
1dec40a14de3        host                host                local
20ed4cdc2e96        none                null                local
root@docker104:~# docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.101:2377
Error response from daemon: This node is already part of a swarm. Use "docker swarm leave" to leave this swarm and join another one.
root@docker104:~# docker swarm leave
Node left the swarm.
```

# Add worker node back
### **At Manager/Leader node**
backto mangernode and run command to check join work token

```
root@docker101:~# docker swarm join-token worker
To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.101:2377

```

## Go to worker node
### **At worker node**
**go to worker node** run command to join swarm

```
root@docker104:~# docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.101:2377
This node joined a swarm as a worker.
root@docker104:~# 

```

---------------------------------------------------------------------------------------------------------------------------------------------------
### **At Manager/Leader node**

```
root@docker101:~# docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
t6lzlmlgi0guuqxgxtli5gaam     docker100           Ready               Active              Reachable           18.06.0-ce
5sm7tgb3x939ylfclxcb66p7g *   docker101           Ready               Active              Leader              18.06.0-ce
2jrc8ohqm2yu56cqxlq0bvcwj     docker102           Ready               Active                                  18.06.0-ce
a00fskq22ef7qhnnivqze2908     docker103           Ready               Active                                  18.06.0-ce
gwptx47s5u2l2sksg041t2iwi     docker104           Ready               Active                                  18.06.1-ce
r936wsylwhft5fa826zzziet1     docker105           Ready               Active              Reachable           18.06.0-ce
root@docker101:~# 


```

# HA swarm manager
### **At Manager/Leader node**

docker node update --role  manager

root@docker101:~# docker swarm join-token worker
To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.101:2377

-------------------------------------------------------------------------------------------------------------------------------------------
```
root@docker101:~# docker node --help

Usage:	docker node COMMAND

Manage Swarm nodes

Commands:
  demote      Demote one or more nodes from manager in the swarm
  inspect     Display detailed information on one or more nodes
  ls          List nodes in the swarm
  promote     Promote one or more nodes to manager in the swarm
  ps          List tasks running on one or more nodes, defaults to current node
  rm          Remove one or more nodes from the swarm
  update      Update a node

Run 'docker node COMMAND --help' for more information on a command.

-------------------------------------------------------------------------------------------------------------------------------------------
root@docker101:~# docker node update --help

Usage:	docker node update [OPTIONS] NODE

Update a node

Options:
      --availability string   Availability of the node ("active"|"pause"|"drain")
      --label-add list        Add or update a node label (key=value)
      --label-rm list         Remove a node label if exists
      --role string           Role of the node ("worker"|"manager")

```

-------------------------------------------------------------------------------------------------------------------------------------------

root@docker101:~# docker swarm join-token manager 
To add a manager to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-cspwqxq7cjj8clbu86yq0uf68 192.168.23.101:2377

root@docker101:~# docker swarm join-token worker 
To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-65sbts17ywloq8xhgntcbd02bs8jxh01zpciinrtx3uki0gjs7-f0v8inkgl7zbksha4oq56txeq 192.168.23.101:2377


-------------------------------------------------------------------------------------------------------------------------------------------

## Copy files/folders between a container and the local filesystem
root@docker100:~/ClouderaOnDocker/src# docker cp /root/ClouderaOnDocker/src/mysql-connector-java-5.1.47.jar db-cdh:/usr/share/java
root@docker100:~/ClouderaOnDocker/src# docker exec -it db-cdh bash
root@db-cdh:/# cd /usr/share/java/
root@db-cdh:/usr/share/java# ls
mysql-connector-java-5.1.47.jar
root@db-cdh:/usr/share/java# exit

See 'docker cp --help'.

Usage:  docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
	docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH


-------------------------------------------------------------------------------------------------------------------------------------------



































































































































































































