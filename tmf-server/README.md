README to Image tmf-server
===

This is an image for a dedicated server for TrackMania Forever. The installation of the
server is based on https://www.xaseco.org/.

The installation follow the Quick Start Guide. See http://www.gamers.org/tmf/quickstart.html or in
the directory docs.


# How to use?

Simply build the image using the standard docker command or pull the repository https://hub.docker.com/repository/docker/denmor/tmf-server.


## Environment variables

This image uses environment variables for configuration.

|Available variables  |Description                                         |
|---------------------|----------------------------------------------------|
|`LOCAL_UID`          | The id of the local user running the container     |
|`LOCAL_GID`          | The id of the local group running the container    |

## Volumes

Folloing volumes are available:

|Volume          |Description                                               |
|----------------|----------------------------------------------------------|
|`/tmf/GameData` | GameData directory with tracks, config files, cache, ... |
|`/tmf/Logs`     | Logs of the server                                       |


## Ports

Following ports are exposed

|Port       |Description                                               |
|-----------|----------------------------------------------------------|
|`2350/tcp` | TCP port to connect the server from the client           |
|`2350/udp` | UDP port to connect the server from the client           |
|`3450/tcp` | TCP port for P2P connection                              |
|`3450/tcp` | UDP port to connect the server from the client           |
|`5000`     | Port for remote rpc commands                             |


## Start the container

The container can be started with the [docker-compose file](../docker-compose_tmf_alone.yml).

See [README.md](../README.md) for details.


# License

The repository contains the installation zip of the TMF Server (licence from Nadeo).

The repository himself is under MIT licence.
