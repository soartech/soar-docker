# Soar Docker

These docker files are intended to be a starting point for building containers containing the Soar Cognitive Architecture. To learn more about Soar, visit the [Soar Group Website](https://soar.eecs.umich.edu/) or [GitHub repository](https://github.com/SoarGroup/Soar). Additionally, you can find useful tools for operating with Soar and developing agents in the [SoarTech github repositories](https://github.com/soartech/), provided by [Soar Technology, Inc.](https://soartech.com)

## Usage

Each of the directories within this repository is named after the base image it is built from. See the subdirectory README files to learn more about building or using a specific image. In general, if you want to run a minimal Soar container using alpine as your base image, you can use the following commands:

```bash
cd alpine
docker build -t soar-alpine:latest .
docker run -it --name my-soar-container soar-alpine
```

Within that container, you can launch soar from any location by typing `soar`.

## Image Layout

Typically the images provided will install soar at `/opt/soar` and will have the `SOAR_HOME` and `PATH` environment variables set. Bindings for python and java are included in the binary distributions, but python and java are not installed by default. If you wish to use python you will need to install it and set your `PYTHONPATH`.
