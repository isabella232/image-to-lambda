#!/usr/bin/env sh

set -e

mkdir -p $1

TAG="img2lambda-build:alpine"
OUT="$PWD/tmp"

docker build -f Dockerfile.alpine -t $TAG .
docker run --rm --volume "$OUT":/out $TAG

mv "$OUT/img2lambda" "$1/$2"
mv "$OUT/img2lambda.md5" "$1/$2.md5"
mv "$OUT/img2lambda.sha256" "$1/$2.sha256"

# docker image rm $TAG