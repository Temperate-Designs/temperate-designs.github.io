#!/bin/bash

set -e -u -x

basedir=$(readlink --canonicalize $(dirname $0))

docker run \
  --volume ${basedir}:/srv/jekyll \
  --publish [::1]:4000:4000 \
  jekyll/jekyll \
  jekyll serve
