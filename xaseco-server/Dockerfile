FROM php:7.3-cli

VOLUME /xaseco/config_files /xaseco/log_files/

LABEL description="A docker image to run xaseco, a controller server for TMF"
LABEL serverversion="1.16"

MAINTAINER https://github.com/de-mo

RUN apt-get update  \
    && apt-get install -y --no-install-recommends  \
       gosu \
       iputils-ping \
	     unzip

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

COPY ./xaseco_116.zip .

RUN unzip xaseco_116.zip \
    && rm xaseco_116.zip \
    && mkdir /tmf

# Patches
COPY bugfix_memoryleaks/* /xaseco/includes/
COPY modernizer/modernizer.inc.php /xaseco/includes/
RUN sed --in-place "/^require_once.*/i require_once('includes/modernizer.inc.php');" /xaseco/aseco.php

COPY entrypoint.sh /
COPY initvolumes.sh /
RUN chmod +x /entrypoint.sh && chmod +x /initvolumes.sh

WORKDIR /xaseco

ENTRYPOINT ["/entrypoint.sh"]
CMD php aseco.php TMF
