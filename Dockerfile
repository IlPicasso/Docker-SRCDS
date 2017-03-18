##
# Minimalist Docker Container for SRCDS
# Built for Pterodactyl Panel
#
# MIT Licensed
##
FROM ubuntu:16.04

MAINTAINER  Dane Everitt, <dane@daneeveritt.com>
ENV         DEBIAN_FRONTEND noninteractive

# Install Dependencies
RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get upgrade -y \
            && apt-get install -y tar curl gcc g++ lib32gcc1 lib32tinfo5 lib32z1 lib32stdc++6 libtinfo5:i386 libncurses5:i386 libcurl3-gnutls:i386 \
            && useradd -m -d /home/container container

USER        container
ENV         HOME /home/container

WORKDIR     /home/container

COPY        ./start.sh /start.sh

CMD         ["/bin/bash", "/start.sh"]
