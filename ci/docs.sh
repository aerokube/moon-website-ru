#!/usr/bin/env bash

set -e
TAG=$1
WD=$(pwd)
SOURCE_DIR=${WD}/docs
OUTPUT_DIR=${WD}/dist/docs

echo "Removing existing files"
mkdir -p ${OUTPUT_DIR}
rm -Rf ${OUTPUT_DIR}/*.pdf

echo "Uploading site to S3"
cd ${GITHUB_WORKSPACE}/dist
key="moon/"
if [ "$TAG" == "latest" ]; then
  key="unstable/moon/"
fi
aws s3 cp . --endpoint="$S3_ENDPOINT" "s3://$S3_BUCKET_NAME/$key" --recursive
