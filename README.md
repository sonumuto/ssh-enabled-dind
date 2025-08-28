# ssh-enabled-dind
An Ubuntu based Docker in Docker environment with SSH access. Designed for testing, DevOps labs and learning scenarios. Not recommended for production.

> [!CAUTION]
> **NOT FOR PRODUCTION USE!** Running DinD with root SSH access in production is insecure. **Use at your own risk.**

```bash
docker run -d \
  --name ubuntu_ssh1 \
  -p 2222:22 \
  ubuntu_ssh:latest
```

## Features
- Ubuntu 24.04 base image
- Docker CLI and Daemon pre-installed
- SSH enabled

## Usage

Build the Docker image:

```bash
docker buildx build -t ssh-enabled-dind .
```

Run the container:

```bash
docker run -d \
  --name ssh-enabled-dind \
  --privileged \
  -p 2222:22 \
  ssh-enabled-dind:latest
```

Then connect via SSH:

```bash
ssh root@localhost -p 2222
```
(Default password: `password123`)

You can test Docker with the hello-world image:

```bash
docker run hello-world
```

## Disclaimer
This image is developed for testing and development only. It contains insecure defaults and is not hardened for public or production environments.

## Open Source
Any contributions or feedbacks are much appreciated! Thank you!
