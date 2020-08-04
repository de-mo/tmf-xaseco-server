FROM php:7.3-cli

VOLUME /xaseco

LABEL description="A docker image to run xaseco, a controller server for TMF"
LABEL serverversion="1.16"

MAINTAINER https://github.com/de-mo

RUN apt-get update  \
    && apt-get install -y --no-install-recommends  \
       gosu \
       iputils-ping \
	     unzip

RUN mkdir /install
WORKDIR /install

COPY ./xaseco_116.zip .

RUN unzip xaseco_116.zip \
    && rm xaseco_116.zip \
    && mv xaseco/newinstall/*.xml xaseco/ \
    && mv xaseco/newinstall/*.php xaseco/includes/ \
    && mv xaseco/newinstall/AsecoF.sh xaseco/

# Patches
COPY bugfix_memoryleaks/* xaseco/includes/
COPY modernizer/modernizer.inc.php xaseco/includes/
RUN sed --in-place "/^require_once.*/i require_once('includes/modernizer.inc.php');" xaseco/aseco.php

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /xaseco

ENTRYPOINT ["/entrypoint.sh"]
CMD php aseco.php TMF </dev/null >aseco.log 2>&1
