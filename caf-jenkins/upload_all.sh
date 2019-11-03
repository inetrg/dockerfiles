#!/bin/bash

#
# Uploads all images with tags/names matchting the local files startign with
# TAG. Assigns a prefix based on the LOGIN. Creates two versions, one with
# :YEAR-MONTH-DAY and one with :latest.
#

DOCKERFILE_TAG=${TAG:-caf-jenkins-}
DOCKERHUB_LOGIN=${LOGIN:-inetjenkins}

VERSION=$(date +"%Y-%m-%d")

upload_image() {
  name=$1
	echo "uploading $name"
	if $(docker inspect --type=image $name  > /dev/null 2>&1)
	then
		docker tag $name $DOCKERHUB_LOGIN/$name:$VERSION || exit 1
		docker tag $name $DOCKERHUB_LOGIN/$name:latest || exit 1
		docker push $DOCKERHUB_LOGIN/$name || exit 1
	fi
}

for dockerfile in ${DOCKERFILE_TAG}*
do
	upload_image $dockerfile
done
