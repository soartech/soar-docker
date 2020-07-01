# Soar Ubuntu Docker Image

Use this image to run Soar in Ubuntu.

## Building

The official distribution of Soar expects ActiveTCL. We can build against the tcl that is provided with the Ubuntu package manager from source. These instructions will create a container that pulls all of the necessary tools to build soar. We then extract the built files to create the running container. For simplicity, the latest built container is provided. You can update your build by issuing these commands from the `ubuntu` directory.

```bash
docker build -f Dockerfile.soar-ubuntu-build -t soar-ubuntu-build:latest .
docker create --name soar-ubuntu-build soar-ubuntu-build:latest
docker cp soar-ubuntu-build:/src/soar/soar-ubuntu.tgz soar-ubuntu.tgz
```

At this point you should have updated `soar-ubuntu.tgz` in the current directory. You can then use this to create your soar docker container.

## Creating a docker image

Before creating a docker container, you must first create an image that uses the `soar-ubuntu.tgz` file built in the previous section (or provided in this repository).

```bash
docker build -t soar-ubuntu:latest .
```

You can then create a container with the typical `docker run -it --name my-soar-container soar-ubuntu`.
