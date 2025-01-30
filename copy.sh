#!/bin/bash

docker exec demoapp_mx_app bash -c "rm /srv/mendix/data/model-upload/*"
docker cp $1 demoapp_mx_app:/srv/mendix/data/model-upload/mendix.mda
docker exec demoapp_mx_app bash -c "chown mendix:mendix /srv/mendix/data/model-upload/mendix.mda"
docker exec demoapp_mx_app bash -c "chmod 700 /srv/mendix/data/model-upload/mendix.mda"
docker exec demoapp_mx_app bash -c "ls -al /srv/mendix/data/model-upload/"
