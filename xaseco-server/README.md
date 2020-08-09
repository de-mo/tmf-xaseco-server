README to Image xaseco-server
===

This is an image for Xaseco for TrackMania Forever. The installation of the
server is based on https://www.xaseco.org/.

The installation follow the Quick Start Guide. See http://www.gamers.org/tmf/quickstart.html or in
the directory docs.

The image contains also:
- Modernizer for php7 (see http://www.tm-forum.com/viewtopic.php?f=127&t=35817 with the correction)
- bugfix of memory leaks (see https://ftp.bueddl.de/tm/php7_patches/)


# How to use?

Simply build the image using the standard docker command or pull the repository https://hub.docker.com/repository/docker/denmor/xaseco-server.


## Environment variables

This image uses environment variables for configuration.

|Available variables  |Description                                         |
|---------------------|----------------------------------------------------|
|`LOCAL_UID`          | The id of the local user running the container     |
|`LOCAL_GID`          | The id of the local group running the container    |

## Volumes

Folloing volumes are available:

|Volume                 |Description                      |
|-----------------------|---------------------------------|
|`/xaseco/config_files` | Config files of the server      |
|`/xaseco/log_files/`   | Logs of the server              |
|`/tmf/GameData`        | GameData of the tmf server      |

Note that the structure of xaseco put all the files in the root directory. In order
to avoid to have a volume with the whole installation directory, a separate directory
is created and symbolic links are used.

The directory plugin is not a volume actually.


## Start the container

The container can be started with the [docker-compose file](../docker-compose.yml).

See [README.md](../README.md) for details.


# License

The repository contains the installation zip of xaseco (see https://www.xaseco.org/)
and the fixed listed at the beginning of readme.

The repository himself is under MIT licence.
