# Build WebImblaze into a container

## Build it

Start Docker, then go to a command line:
    `docker build -t webimblaze .`

To force a full rebuild:
    `docker build --no-cache -t webimblaze .`

## Debug it

`docker logs 8af` - where 8af is first 3 characters of the Container Id

`docker stats webimblaze`

`docker cp <container_id>:/path/to/useful/file /local-path`

`docker commit 8af webimblaze-broken && docker run -it --entrypoint /bin/bash webimblaze-broken`

`docker run -it --entrypoint /bin/bash webimblaze`

## Publish it

From MINGW64
```
export DOCKER_ID_USER="qarj"
docker login
docker tag webimblaze $DOCKER_ID_USER/webimblaze
docker push $DOCKER_ID_USER/webimblaze
```
