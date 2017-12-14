# docker-conan-server

[![Conan Version](https://img.shields.io/badge/Conan-0.30.2-blue.svg)](https://hub.docker.com/r/ktonon/conan-server/tags/)

Docker image definition for a [Conan.io](https://conan.io) server

## Running the server

First create the server container
```bash
mkdir conan_server
docker run \
    -p 9300:9300 \
    -v conan_server:/var/lib/conan \
    --name conan_server \
    ktonon/conan-server:latest
```

The configure the server by editting the `.conan_server/server.conf`
file. The `host_name` and `public_port` parameters are of particular
importance and must match the name of the docker host and the public
port exposed for the container.
For more information of the server.conf, see the http://conanio.readthedocs.io/en/latest/server.html#server-configuration.

## Example docker-compose.yml file

```
version: '2'
services:
  conan:
    image: ktonon/conan-server
    container_name: conan
    volumes:
      - ./conan:/var/lib/conan
    ports:
      - 9300:9300
```
