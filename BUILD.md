# Build WebInject into a container

## Build it

Start Docker, then go to a command line:
    `docker build -t webinject .`

To force a full rebuild:
    `docker build --no-cache -t webinject .`

## Debug it

`docker logs 8af` - where 8af is first 3 characters of the Container Id

`docker stats webinject`

`docker cp <container_id>:/path/to/useful/file /local-path`

`docker commit 8af webinject-broken && docker run -it --entrypoint /bin/bash webinject-broken`

`docker run -it --entrypoint /bin/bash webinject`

## Publish it

```
export DOCKER_ID_USER="qarj"
docker login
docker tag webinject $DOCKER_ID_USER/webinject
docker push $DOCKER_ID_USER/webinject
```
