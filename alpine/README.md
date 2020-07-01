# Soar Alpine Docker Image

Use this image to run a minimal Soar environment. This is based on the alpine docker image to keep the footprint as small as possible.

## Building

For alpine we need to build Soar from the source code. Additionally we need to make a few minor changes to Soar to get a constistent build. We perform this within an alpine docker container and then copy the resultant binaries to `soar-alpine.tgz`. This temporary container can be deleted after the build is complete. If you would like to build Soar from the latest development branch, use these commands from within the `alpine` directory.

```bash
docker build -f Dockerfile.soar-build -t soar-alpine-build:latest .
docker create --name soar-alpine-build soar-alpine-build:latest
docker cp soar-alpine-build:/src/soar/soar-alpine.tgz soar-alpine.tgz
```

At this point you should have updated `soar-alpine.tgz` in the current directory. You can then use this to create your soar docker container.

## Creating a docker image

Before creating a docker container, you must first create an image that uses the `soar-alpine.tgz` file built in the previous section (or provided in this repository).

```bash
docker build -t soar-alpine:latest .
```

You can then create a container with the typical `docker run -it --name my-soar-container soar-alpine`.
