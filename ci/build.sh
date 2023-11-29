#!/bin/bash
set -e
set -x
TAG=$1
npm install
if [ "$TAG" == "latest" ]; then
  npm run build-testing
else
  npm run build
fi

