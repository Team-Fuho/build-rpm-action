#!/bin/bash

set -eu

version=$1
tag="team-fuho/build-rpm-action:latest"
docker build --no-cache -t "$tag" .
docker push "$tag"
