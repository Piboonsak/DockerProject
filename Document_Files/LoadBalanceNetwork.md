Loadbalance

docker service create --name nginx --replicas 3 --publish 80:80 nginx<br>

# webpublic<br>
docker network create --driver bridge --subnet=192.168.100.0/24 --ip-range=192.168.100.128/25 --gateway=192.168.100.5 --opt="com.docker.network.mtu"="1500" webpublic<br>


# webinternal<br>
docker network create --driver bridge --subnet=192.168.101.0/24 --ip-range=192.168.101.128/25 --gateway=192.168.101.5 --opt="com.docker.network.mtu"="9000" webinternal<br>



docker run -dt --name web1 --net webinternal --net-alias web1 labdocker/alpineweb:web1 node hello.js<br>

docker run -dt --name web2 --net webinternal --net-alias web2 labdocker/alpineweb:web2 node hello.js<br>

# 6. Run container nginx and attach network 

docker run -dt --name nginx --net webinternal -p 80:8080 labdocker/nginx:labnetwork<br>

docker network connect webpublic nginx<br>



docker service create -dt --name nodejs --replicas=2 --network swarmnet -p 3300:3000 labdocker/alpineweb:latest node hello.js<br>


nodejs.1.qylitmmef6zxxn4mdwhesul7o 192.168.60.9<br>
nodejs.2.otpiena427pos8gq9ywvqopfm 192.168.60.10<br>
nodejs.3.b6sp47rq0jmnx9thah1l8e3ej 192.168.60.11<br>

docker exec -it nodejs ping 192.168.60.10<br>
docker exec -it nodejs.1.qylitmmef6zxxn4mdwhesul7o ping 192.168.100.7<br>
docker exec -it nodejs2.xxx ping 192.168.100.5<br>
docker exec -it nodejs2.xxx ping 192.168.100.6<br>

---------------------------------------------------------------------------------------------------------------------------------
## Create new overley network
docker network create --driver overlay --subnet=192.168.60.0/24 swarmnet<br>

## Create web nodejs 2 repicate
docker service create -dt --name nodejs --replicas=2 -p 3000:3000 labdocker/alpineweb:latest node hello.js<br>

## Create Nginx for revers proxy
docker run -dt --name nginx -p 80:8080 labdocker/nginx:labnetwork<br>

#docker service create -dt --name nginx -p 80:8080 labdocker/nginx:labnetwork

## connect nginx to new overley network
docker network connect swarmnet nginx<br>
---------------------------------------------------------------------------------------------------------------------------------

nodejs.1.muud64kwooql0dj7tk4z3iwe5   docker100  10.255.16.14<br>
nodejs.2.ub9xstita42uknilbt8kp2ss1   docker103  10.255.16.13<br>



docker service create -dt --name nginx --replicas=2 -p 80:8080 nginx<br>
nginx.1.mv90a45war6tp3f71ydogdy3l   docker101<br>
nginx.2.by036rz1w8uz6qk8kcjlehosv   docker105<br>

docker network connect swarmnet nginx.1.mv90a45war6tp3f71ydogdy3l<br>
docker network connect swarmnet nginx.2.by036rz1w8uz6qk8kcjlehosv<br>
<br>
<br>



docker run -dt --name nginx --net webinternal -p 80:8080 labdocker/nginx:lab<br>

docker exec -t nginx_lab sh<br>




















