#!/usr/bin/env bash

set -e
TAG=$1
WD=$(pwd)
OUTPUT_DIR=${WD}/dist/docs

echo "Removing existing files"
mkdir -p ${OUTPUT_DIR}
rm -Rf ${OUTPUT_DIR}/*.pdf

echo "Generating docs"
cd ${WD}/docs && ls *.adoc | xargs -I{} asciidoctor-pdf -a revnumber=${TAG} -D ${OUTPUT_DIR} {}
