# WebImblaze in a Docker container

WebImblaze is available as a Docker container with all the dependencies pre-installed.

To use it, first install Docker for your OS:

-   [Docker Engine Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
-   [Docker Destktop Mac](https://docs.docker.com/desktop/mac/install/)

Then pull it from the public repository, https://hub.docker.com/r/qarj/webimblaze/

```sh
docker pull qarj/webimblaze
```

## Usage

### Directly from your OS command line

To execute the example test `examples/demo.test`

```sh
docker run -it --rm webimblaze examples/demo.test
```

To run all self tests

```sh
docker run -it --rm webimblaze selftest/all_core.test
```

### From within the container

To enter the container

```sh
docker run -it --entrypoint /bin/bash webimblaze
```

Then run a test

```sh
perl wi.pl examples/demo.test
```

### Run single local testcase in container

```sh
docker run -it --mount type=bind,source="/path/to/your-testcase.test",target=/usr/local/bin/WebImblaze/examples/get.test qarj/webimblaze
```

## Further info

To build the container yourself, see [BUILD.md](BUILD.md).
