#!/bin/bash

set -eu

tag="team-fuho/build-rpm-action:latest"
docker build --no-cache -t "$tag" .
docker push "$tag"
