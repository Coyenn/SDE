FROM ubuntu:latest

# Apt requires minor user interaction.
# We have to disable it when building.
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /home/dev
COPY . .
RUN bash install-all.sh
