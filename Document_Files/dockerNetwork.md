# Docker network
## Create network overlay can attachable
`docker network create cloudera -d overlay --subnet 177.10.10.1/24 --attachable`

root@docker100:~# docker network create cloudera -d overlay --subnet 177.10.10.1/24 --attachable
gn58mja3hpa6h5sglv4d6ua0r
root@docker100:~#

----------------------------------------------------------------------------------------------------------------------
ubuntu1604:STDv2.12

```
docker service create -d -t \<br>
-p 30022:22 -p 30021:21 -p 30080:80 -p 33306:3306 \
--network cloudera --hostname hd-c2nn \
--name hd-c2nn \
-e contriner=docker \
--mount type=bind,source=/sys/fs/cgroup,destination=/sys/fs/cgroup \
hd-c1nn:0.1
```

----------------------------------------------------------------------------------------------------------------------
### run container attachable to the network.
```
docker run -dt --name CDH-namenode \
-p 20022:22 -p 20021:21 -p 20080:80 -p 23306:3306 \
--network cloudera --hostname CDH-namenode \
ubuntu1604_buildv2.1:latest
```

```
root@docker100:~# docker run -dt --name CDH-namenode \
> -p 20022:22 -p 20021:21 -p 20080:80 -p 23306:3306 \
> --network cloudera --hostname CDH-namenode \
> ubuntu1604_buildv2.1:latest
32e6017e60626716cd5102e0cf41ef8fcd7154866fa72c1995a836e14986f020
```

```
root@docker100:~# docker container ls -a
CONTAINER ID        IMAGE                                                     COMMAND                  CREATED             STATUS              PORTS                                                                                                                            NAMES
32e6017e6062        ubuntu1604_buildv2.1:latest                               "/bin/bash"              10 seconds ago      Up 8 seconds        443/tcp, 8080/tcp, 8088-8089/tcp, 0.0.0.0:20021->21/tcp, 0.0.0.0:20022->22/tcp, 0.0.0.0:20080->80/tcp, 0.0.0.0:23306->3306/tcp   CDH-namenode
```
**ubuntu1604_buildv2.1:latest already have and install utility tools**

### Check port

root@docker100:~# netstat -tulpn


----------------------------------------------------------------------------------------------------------------------
### run another container in another docker host<br>
**Must load ubuntu1604_buildv2.1:latest images to local docker host before run docker run**
```
docker run -dt --name CDH-datanode \
-p 20022:22 -p 20021:21 -p 20080:80 -p 23306:3306 \
--network cloudera --hostname CDH-datanode \
ubuntu1604_buildv2.1:latest
```


```
root@docker105:~# docker run -dt --name CDH-datanode \
> -p 20022:22 -p 20021:21 -p 20080:80 -p 23306:3306 \
> --network cloudera --hostname CDH-datanode \
> ubuntu1604_buildv2.1:latest
e1364f0ab250ca7ac6c707a11b8ec5cb2f183236ff68c55e7db14adbde334fbe
```

```
root@docker105:~# docker container ls
CONTAINER ID        IMAGE                         COMMAND             CREATED             STATUS              PORTS                                                                                                                            NAMES
e1364f0ab250        ubuntu1604_buildv2.1:latest   "/bin/bash"         9 seconds ago       Up 7 seconds        443/tcp, 8080/tcp, 8088-8089/tcp, 0.0.0.0:20021->21/tcp, 0.0.0.0:20022->22/tcp, 0.0.0.0:20080->80/tcp, 0.0.0.0:23306->3306/tcp   CDH-datanode
c58f23a6ac24        portainer/agent:latest        "./agent"           6 days ago          Up 6 days                                                                                                                                            portainer_agent.r936wsylwhft5fa826zzziet1.znjv7l3yv73i78kpw2gwyfcds
```


```
root@docker105:~# docker exec -it CDH-datanode bash
root@CDH-datanode:/myapp# cd
root@CDH-datanode:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 02:42:b1:0a:0a:0b  
          inet addr:177.10.10.11  Bcast:177.10.10.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1450  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

eth1      Link encap:Ethernet  HWaddr 02:42:ac:12:00:04  
          inet addr:172.18.0.4  Bcast:172.18.255.255  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:8 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:648 (648.0 B)  TX bytes:0 (0.0 B)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
```

## Set host


```
root@CDH-namenode:~# nano /etc/hosts
```

```
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
177.10.10.10    CDH-namenode
177.10.10.11    CDH-datanode

```

## Check ssh service

```
root@CDH-datanode:~# service ssh status
 * sshd is not running
root@CDH-datanode:~# service ssh start 
 * Starting OpenBSD Secure Shell server sshd                                                                                                                                                                                                                                         [ OK ] 
root@CDH-datanode:~# service ssh status
 * sshd is running

```

## Set root password all host (include CDH-namenode)

```
root@CDH-datanode:~# passwd
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully

```
## Set root password at CDH-namenode
```
root@CDH-namenode:~# passwd
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully

```


## Set ssh service all host (include CDH-namenode)
```
root@CDH-datanode:~# ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:QfkkkXLLUVmZkQCU4GJJNE4Tf5uSsW/r/zUg9QZH0dw root@CDH-datanode
The key's randomart image is:
+---[RSA 2048]----+
|   .B..o=Bo+o=o+.|
|   + *..B o +.  E|
|    = ++o*  o .  |
|   . . =o+.. +   |
|      + S . . o  |
|       o   . o   |
|        o     o  |
|       . .   . . |
|       .o....    |
+----[SHA256]-----+
root@CDH-datanode:~# nano .ssh/authorized_keys
root@CDH-datanode:~# cat .ssh/id_rsa.pub > .ssh/authorized_keys 
root@CDH-datanode:~# nano .ssh/authorized_keys 
root@CDH-datanode:~# cat .ssh/id_rsa.pub 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDc1FzqDFLV/QDDiuty1HiI5NPkAhRRw5VmXs6g/uW77mOVUZCrYbQDTv2MDvH2JZR5o3vJat4BZV7q1hPzBOtJItS+fAVe4uti1prMRvhSxKiBwMjURJFAKVahzfXOBi+PBeTwkebLX3qfNaG+hlJ71Ra79MbcTG/BA/e1naBSRX4wiRUfpxYntGXGEyXwYO1Iprzb9k6sfawYnpF5M7KD9ijWzAiwKoSZo/SVlebddOVebfujOerN4BevCLyjSDW+XZbGjsjTvPH886xG6rU3eJezd1iAI1YAf/fA74pNdOoelZoz+xjY8+hRami2tq3k+XwQd68LQYe2Hdb7IlWh root@CDH-datanode
root@CDH-datanode:~# nano .ssh/authorized_keys 
root@CDH-datanode:~# service ssh restart
 * Restarting OpenBSD Secure Shell server sshd                                                                                                                                                                                                                                       [ OK ] 
root@CDH-datanode:~# ssh CDH-datanode
The authenticity of host 'cdh-datanode (177.10.10.11)' can't be established.
ECDSA key fingerprint is SHA256:q2P5EI4wUh4UbG6X3Q/J8dyCYL7ri/L1WS1Fr+PtQgE.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'cdh-datanode,177.10.10.11' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 16.04.5 LTS (GNU/Linux 4.4.0-116-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Last login: Thu Oct  4 11:04:05 2018 from 177.10.10.10


```

```
root@CDH-datanode:~# cat .ssh/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjGGNZ2H59T0dvzPI4URudJaNwzxltZGTpI5ihhtUrelhCysR/C1K9ei6SpfsticR4ct0+WSAvolSrscki45HddwDUWahqDV9v2bticysRRlxmDpxoEzzskfv2w/l87Na7bAW3SfYrIYjJM2mDiDN5+AWE8uhs9W9pJytUTQHI09k93oks6NoaZoH3FfGj8dQY/shGVOuSuxcN8w/+dMX7LjkfMVlAwQijskOcn4KFo5v/wfSbGAtgy2FjSN6sgFwux3PZhiXDp8tZ1Bw5O01RKfn5AI7L/AwKA4EqT3lg7trEtQj+0KQ4WRKU5nt/8tUHTiHheh/anXCE72pjTH8H root@CDH-namenode
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDc1FzqDFLV/QDDiuty1HiI5NPkAhRRw5VmXs6g/uW77mOVUZCrYbQDTv2MDvH2JZR5o3vJat4BZV7q1hPzBOtJItS+fAVe4uti1prMRvhSxKiBwMjURJFAKVahzfXOBi+PBeTwkebLX3qfNaG+hlJ71Ra79MbcTG/BA/e1naBSRX4wiRUfpxYntGXGEyXwYO1Iprzb9k6sfawYnpF5M7KD9ijWzAiwKoSZo/SVlebddOVebfujOerN4BevCLyjSDW+XZbGjsjTvPH886xG6rU3eJezd1iAI1YAf/fA74pNdOoelZoz+xjY8+hRami2tq3k+XwQd68LQYe2Hdb7IlWh root@CDH-datanode

```

## Test ssh to CDH-namenode
```
root@CDH-datanode:~# ssh CDH-namenode
Welcome to Ubuntu 16.04.5 LTS (GNU/Linux 4.4.0-116-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

root@CDH-namenode:~#

```


















































