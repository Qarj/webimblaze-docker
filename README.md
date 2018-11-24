# WebImblaze in a Docker container

WebImblaze is available as a Docker container with all the dependencies pre-installed.

To use it, first install Docker for your OS:
* Windows 7 & 8: https://docs.docker.com/toolbox/toolbox_install_windows/
* Windows 10: https://docs.docker.com/docker-for-windows/install/
* Mac: https://docs.docker.com/docker-for-mac/install/

Then pull it from the public repository, https://hub.docker.com/r/qarj/webimblaze/

```
docker pull qarj/webimblaze
```

## Usage

### Directly from your OS command line

To execute the example test `examples/demo.test`:
```
docker run -it --rm webimblaze examples/demo.test
```

### From within the container

To enter the container:
```
docker run -it --entrypoint /bin/bash webimblaze
```

Then run a test:
```
perl wi.pl examples/demo.test
```

## Further info

To build the container yourself, see [BUILD.md](BUILD.md). 
