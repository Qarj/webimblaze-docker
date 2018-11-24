# Build webimblaze-framework-Framework into a container

## Build it

Start Docker, then go to a command line:
```
cd /git/webimblaze-docker/webimblaze-framework
docker build -t webimblaze-framework .
```

To force a full rebuild:
```
docker build --no-cache -t webimblaze-framework .
```

## Debug it

`docker logs 8af` - where 8af is first 3 characters of the Container Id

`docker stats webimblaze-framework`

`docker cp <container_id>:/path/to/useful/file /local-path`

`docker commit 8af webimblaze-framework-broken && docker run -it --entrypoint /bin/bash webimblaze-framework-broken`

`docker run -it --entrypoint /bin/bash webimblaze-framework`

## Publish it

From MINGW64
```
export DOCKER_ID_USER="qarj"
docker login
docker tag webimblaze-framework $DOCKER_ID_USER/webimblaze-framework
docker push $DOCKER_ID_USER/webimblaze-framework
```
