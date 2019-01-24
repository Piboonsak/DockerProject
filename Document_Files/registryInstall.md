# registry installation

## install registry
### install on host
- container was deploy in server docker100

`docker run -dt -p 5000:5000 --restart always --name registry registry:2`

## install konradkleine/docker-registry-frontend
## deploy container on host in server docker100 port 35000

```sh
sudo docker run \
  -dt \
  --name registry_webUI \
  -e ENV_DOCKER_REGISTRY_HOST=192.168.23.100 \
  -e ENV_DOCKER_REGISTRY_PORT=5000 \
  -e ENV_MODE_BROWSE_ONLY=true \
  -e ENV_DEFAULT_REPOSITORIES_PER_PAGE=50 \
  -p 35000:80 \
  konradkleine/docker-registry-frontend:v2

```

## tag & push
*ubuntu1604_buildv2.1:latest*
`docker tag ubuntu1604_buildv2.1:latest localhost:5000/ubuntu1604:buildv2.1`
`docker push localhost:5000/ubuntu1604:buildv2.1`

## volume host docker100

*volume in path* `/var/lib/docker/volumes/registry_data/_data`

## webUI
http://docker100:35000/repositories/