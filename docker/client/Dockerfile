FROM node:latest

# Apt requires minor user interaction.
# We have to disable it when building.
ARG DEBIAN_FRONTEND=noninteractive

# Certain applications require a
# timezone
ENV TZ=Europe/Berlin

RUN apt-get -qq update && \
    apt-get -qq upgrade

# Being sudo in a docker container is
# not a good idea. The dev user will
# need to run sudo before commands.
RUN apt-get -qq install sudo tzdata
RUN adduser --disabled-password --gecos '' dev
RUN adduser dev sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER dev

WORKDIR /home/dev
COPY . .

# All needed apt packages are listed in the
# packages file to keep dependencies somewhat
# managable.
RUN xargs sudo apt-get -qq install < packages

# Install scripts aren't called automatically
# because they need to be run in a certain
# order to work.
RUN bash /home/dev/docker/client/install.sh
RUN ls /home/dev/apps/**/install.sh | xargs bash

RUN sudo rm -r /home/dev/* && sudo rm -r .git

CMD /bin/bash
