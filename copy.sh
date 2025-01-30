#!/bin/bash

docker exec firstapp_mx_app bash -c "rm /srv/mendix/data/model-upload/*"
docker cp $1 firstapp_mx_app:/srv/mendix/data/model-upload/mendix.mda
docker exec firstapp_mx_app bash -c "chown mendix:mendix /srv/mendix/data/model-upload/mendix.mda"
docker exec firstapp_mx_app bash -c "chmod 700 /srv/mendix/data/model-upload/mendix.mda"
docker exec firstapp_mx_app bash -c "ls -al /srv/mendix/data/model-upload/"
