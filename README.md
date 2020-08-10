README to TMF - Xaseco Server
===

This is dockerization of a dedicated server for TrackMania Forever with xaseco. The installation of the
server is based on https://www.xaseco.org/.

The installation follow the Quick Start Guide. See http://www.gamers.org/tmf/quickstart.html or in
the directory docs.


# Installation

## Environment variables

Copy `env.example` to `.env`, and configure the environment variables to your local
needs.

|Available variables      |Description                                                |
|-------------------------|-----------------------------------------------------------|
|`LOCAL_UID`              | The id of the local user running the container            |
|`LOCAL_GID`              | The id of the local group running the container           |
|`TMF_GAME_SETTINGS_FILE` | The location of the game settings file (in the container) |
|`TMF_ADDITIONAL_OPTIONS` | Additional options to start the server (e.g. /lan)        |
|`TMF_GAME_DATA_DIR`      | The host location of GameData of TMF                      |
|`TMF_GAME_LOGS_DIR`      | The host location of Logs of TMF                          |
|`TMF_PORT`               | The game port of the TMF server                           |
|`TMF_P2P_PORT`           | The P2P post of the TMF server                            |
|`XASECO_CONFIG_DIR`      | The host location of config files of Xaseco               |
|`XASECO_LOG_DIR`         | The host location of GameData of Xaseco                   |
|`XASECO_SUBNET`          | Subnet of the network of the containers                   |
|`XASECO_IP`              | IP-address of the container xaseco-server                 |


## Database

Setup a database with the name `xaseco` and the user `xaseco`. The user has to be configured
to accept connections from the ip of the xaseco-server (variable `XASECO_IP`)

## Start and configure

Start the containers with
```console
docker-compose up
```

All the config files are created. The containers stop with errors. Stop all the containers. If necessary stop the containers


Configure tmf and xaseco according to the quick startup guide: http://www.gamers.org/tmf/quickstart.html

Restart the containers with `docker-compose`.

## Change Challenge config file

To change the challenge file, simply change the variable `TMF_GAME_SETTINGS_FILE` in the file `.env`.

# TMF only

Use the file `docker-compose_tmf_alone.yml` with the commands:
- `docker-compose -f docker-compose_tmf_alone.yml up -d`
- `docker-compose -f docker-compose_tmf_alone.yml down`


# License

The repository contains the installation zip of the TMF Server (licence from Nadeo).

The repository himself is under MIT licence.
