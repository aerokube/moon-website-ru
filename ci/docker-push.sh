#!/usr/bin/env bash

set -e

TAG="registry.aerokube.com/moon-ru/website"
docker build --pull -t $TAG -t $TAG:$1 .
docker push $TAG
docker push $TAG:$1
