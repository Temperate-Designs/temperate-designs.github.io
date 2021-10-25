#!/bin/bash

set -e -u -x

basedir=$(readlink --canonicalize $(dirname $0))

docker build --tag temperate-designs/gh-pages .
docker run \
  --interactive --tty --rm \
  --volume "${basedir}":/src \
  --env HUGO_ENV=production \
  --publish 0.0.0.0:1313:1313 \
  --entrypoint /bin/bash \
  temperate-designs/gh-pages \
  -c "pushd themes/tella; npm install; popd; hugo server --disableFastRender"
