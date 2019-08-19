#!/bin/bash

#
# Builds all files in this folder starting with TAG as Dockerfiles. Setting
# the TAG variable allows some configuration options. The images will carry
# the same name as the file.
#

DOCKERFILE_TAG=${TAG:-caf-jenkins-}

build_file() {
  echo "Building docker file $1"
  docker build -q -t $1 -f $1 .
}

if ls ${DOCKERFILE_TAG}* 1> /dev/null 2>&1; then
	for dockerfile in ${DOCKERFILE_TAG}*
	do
		build_file $dockerfile
	done
else
	echo "No files starting with '${DOCKERFILE_TAG}' found."
fi
