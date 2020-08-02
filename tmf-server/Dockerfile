FROM ubuntu:latest

EXPOSE 2350

LABEL description="A docker image to run Trackmania nations forever server"
LABEL serverversion="2.11.26 from 2011-02-21"

MAINTAINER https://github.com/de-mo

RUN apt-get update  \
    && apt-get install -y --no-install-recommends  \
        gosu \
	unzip \
        wget 

RUN mkdir /tmf
WORKDIR /tmf

RUN wget http://files2.trackmaniaforever.com/TrackmaniaServer_2011-02-21.zip \
    && unzip TrackmaniaServer_2011-02-21.zip \ 
    && rm TrackmaniaServer_2011-02-21.zip \
    && mv GameData GameData_NewInstall

VOLUME /tmf/GameData
VOLUME /tmf/Logs

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["./TrackmaniaServer", "/game_settings=MatchSettings/Nations/NationsBlue.txt", "/dedicated_cfg=dedicated_cfg.txt", "/nodaemon"]

