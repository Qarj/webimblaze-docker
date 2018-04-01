# WebInject in a Docker container

WebInject is available as a Docker container with all the dependencies pre-installed.

To use it, first install Docker for your OS:
* Windows 7 & 8: https://docs.docker.com/toolbox/toolbox_install_windows/
* Windows 10: https://docs.docker.com/docker-for-windows/install/
* Mac: https://docs.docker.com/docker-for-mac/install/

Then pull it from the public repository, https://hub.docker.com/r/qarj/webinject/

```
docker pull qarj/webinject
```

## Usage

### Directly from your OS command line

To execute the example tests `examples/hello.xml`:
```
docker run -it --rm webinject examples/hello.xml
```

### From within the container

To enter the container:
```
docker run -it --entrypoint /bin/bash webinject
```

Then run a test:
```
perl webinject.pl examples/hello.xml
```

## Further info

To build the container yourself, see [BUILD.md](BUILD.md). 
