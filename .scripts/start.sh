#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"/../docker/
docker-compose run --rm client bash