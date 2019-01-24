# This directory collect shell utility command in docker.
## 1.[InstallversualBox.sh](http://gitlab/Piboonsak/DockerProject/blob/master/Shell_Script/InstallversualBox.sh) 
**This file run auto install versualbox in docker.**

## 1.



## 1.



## 4.[runCheckDockerPort.sh](http://gitlab/Piboonsak/DockerProject/blob/master/Shell_Script/runCheckDockrPort.sh)
**This file use to check port that run in all nodes in swarm.** <br>
### Use this file should run cli like this. <br>
`./runCheckDockerPort.sh |egrep '3306|docker'`

```vim
root@docker100:~/bashFile# ./runCheckDockerPort.sh |egrep '3306|docker'
!!!check port docker100!!!
tcp        0      0 192.168.23.100:10010    0.0.0.0:*               LISTEN      1808/docker-contain
tcp6       0      0 :::20000                :::*                    LISTEN      1575/dockerd    
tcp6       0      0 :::9600                 :::*                    LISTEN      1575/dockerd    
tcp6       0      0 :::5601                 :::*                    LISTEN      1575/dockerd    
tcp6       0      0 :::9000                 :::*                    LISTEN      1575/dockerd    
tcp6       0      0 :::5000                 :::*                    LISTEN      2928/docker-proxy
tcp6       0      0 :::2377                 :::*                    LISTEN      1575/dockerd    
tcp6       0      0 :::7946                 :::*                    LISTEN      1575/dockerd    
tcp6       0      0 :::2222                 :::*                    LISTEN      1575/dockerd    
tcp6       0      0 :::6000                 :::*                    LISTEN      1575/dockerd    
tcp6       0      0 :::9200                 :::*                    LISTEN      1575/dockerd    
tcp6       0      0 :::9300                 :::*                    LISTEN      1575/dockerd    
!!!check port docker101!!!
tcp        0      0 192.168.23.101:10010    0.0.0.0:*               LISTEN      1405/docker-contain
tcp6       0      0 :::20000                :::*                    LISTEN      1305/dockerd    
tcp6       0      0 :::9600                 :::*                    LISTEN      1305/dockerd    
tcp6       0      0 :::5601                 :::*                    LISTEN      1305/dockerd    
tcp6       0      0 :::9000                 :::*                    LISTEN      1305/dockerd    
tcp6       0      0 :::2377                 :::*                    LISTEN      1305/dockerd    
tcp6       0      0 :::7946                 :::*                    LISTEN      1305/dockerd    
tcp6       0      0 :::2222                 :::*                    LISTEN      1305/dockerd    
tcp6       0      0 :::6000                 :::*                    LISTEN      1305/dockerd    
tcp6       0      0 :::9200                 :::*                    LISTEN      1305/dockerd    
tcp6       0      0 :::9300                 :::*                    LISTEN      1305/dockerd    
!!!check port docker102!!!
tcp        0      0 192.168.23.102:10010    0.0.0.0:*               LISTEN      1395/docker-contain
tcp6       0      0 :::13306                :::*                    LISTEN      5000/docker-proxy
tcp6       0      0 :::20000                :::*                    LISTEN      1294/dockerd    
tcp6       0      0 :::10080                :::*                    LISTEN      5032/docker-proxy
tcp6       0      0 :::9600                 :::*                    LISTEN      1294/dockerd    
tcp6       0      0 :::5601                 :::*                    LISTEN      1294/dockerd    
tcp6       0      0 :::9000                 :::*                    LISTEN      1294/dockerd    
tcp6       0      0 :::7946                 :::*                    LISTEN      1294/dockerd    
tcp6       0      0 :::2222                 :::*                    LISTEN      1294/dockerd    
tcp6       0      0 :::6000                 :::*                    LISTEN      1294/dockerd    
tcp6       0      0 :::9200                 :::*                    LISTEN      1294/dockerd    
tcp6       0      0 :::9300                 :::*                    LISTEN      1294/dockerd    
!!!check port docker103!!!
tcp        0      0 192.168.23.103:10010    0.0.0.0:*               LISTEN      1585/docker-contain
tcp        0      0 192.168.23.103:3306     0.0.0.0:*               LISTEN      1457/mysqld     
tcp6       0      0 :::20000                :::*                    LISTEN      1390/dockerd    
tcp6       0      0 :::7946                 :::*                    LISTEN      1390/dockerd    
tcp6       0      0 :::2222                 :::*                    LISTEN      1390/dockerd    
tcp6       0      0 :::9200                 :::*                    LISTEN      1390/dockerd    
tcp6       0      0 :::9300                 :::*                    LISTEN      1390/dockerd    
!!!check port docker104!!!
tcp        0      0 192.168.23.104:3306     0.0.0.0:*               LISTEN      1438/mysqld     
tcp6       0      0 :::20000                :::*                    LISTEN      1384/dockerd    
tcp6       0      0 :::7946                 :::*                    LISTEN      1384/dockerd    
tcp6       0      0 :::2222                 :::*                    LISTEN      1384/dockerd    
tcp6       0      0 :::9200                 :::*                    LISTEN      1384/dockerd    
tcp6       0      0 :::9300                 :::*                    LISTEN      1384/dockerd    
!!!check port docker105!!!
tcp        0      0 192.168.23.105:10010    0.0.0.0:*               LISTEN      1448/docker-contain
tcp6       0      0 :::20000                :::*                    LISTEN      1307/dockerd    
tcp6       0      0 :::9600                 :::*                    LISTEN      1307/dockerd    
tcp6       0      0 :::5601                 :::*                    LISTEN      1307/dockerd    
tcp6       0      0 :::9000                 :::*                    LISTEN      1307/dockerd    
tcp6       0      0 :::2377                 :::*                    LISTEN      1307/dockerd    
tcp6       0      0 :::7946                 :::*                    LISTEN      1307/dockerd    
tcp6       0      0 :::3306                 :::*                    LISTEN      1329/mysqld     
tcp6       0      0 :::2222                 :::*                    LISTEN      1307/dockerd    
tcp6       0      0 :::6000                 :::*                    LISTEN      1307/dockerd    
tcp6       0      0 :::9200                 :::*                    LISTEN      1307/dockerd    
tcp6       0      0 :::9300                 :::*                    LISTEN      1307/dockerd    
```