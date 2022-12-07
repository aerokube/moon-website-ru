#!/usr/bin/env bash

set -e
TAG=$1
WD=$(pwd)
SOURCE_DIR=${WD}/docs
OUTPUT_DIR=${WD}/dist/docs

echo "Removing existing files"
mkdir -p ${OUTPUT_DIR}
rm -Rf ${OUTPUT_DIR}/*.pdf

echo "Generating docs"
set -x
cd "$SOURCE_DIR" && ls *.adoc | while read file; do
  docker run --rm --pull always -v "$OUTPUT_DIR:/output" -v "$SOURCE_DIR:/source" asciidoctor/docker-asciidoctor:1 asciidoctor-pdf -a "revnumber=$TAG" -D /output "/source/$file"
done
