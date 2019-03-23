#!/usr/bin/env bash

set -e

function usage() {
  echo ""
  echo "Docker commands:"
  echo "  build                Build the docker container"
  echo "  config               Split out the docker-conpose file used"
  echo "  rm     [PARAMS]      Remove docker containers, add -v to remove volumes also"
  echo "  down   [PARAMS]      Stop and remove containers and networks, extra params:"
  echo "                           -v to remove volumes"
  echo "                           --rmi type [local, all] to remove images"
  echo ""
  echo "Development commands:"
  echo "  connect              Login to docker shell interface"
  echo "  npm    [COMMAND]     Run npm commands inside the docker container"
  echo "  sls    [COMMAND]     Run a serverless commands inside doker"
  echo "  invoke [-f FUNCTION] Invoke a local serverless function"
  echo "  deploy               Deploy to your sandbox"
  echo ""
  exit 0
}

COMPOSE="docker-compose"
SLS="node_modules/serverless/bin/serverless"

if [ $# -gt 0 ];then

    if [ "$1" == "npm" ]; then
        shift 1
        ${COMPOSE} run --rm -v $(pwd):/app app npm "$@"

    elif [ "$1" == "connect" ]; then
        ${COMPOSE} run --rm -v $(pwd):/app app /bin/sh

    elif [ "$1" == "sls" ]; then
        shift 1
        ${COMPOSE} run --rm -v $(pwd):/app app ${SLS} $@

    elif [ "$1" == "deploy" ]; then
        shift 1
        ${COMPOSE} run --rm -v $(pwd):/app app ${SLS} deploy --stage sandbox

    elif [ "$1" == "invoke" ]; then
        shift 1
        ${COMPOSE} run --rm -v $(pwd):/app app ${SLS} invoke local -f $@

    elif [ "$1" == "build" ]; then
        shift 1
        ${COMPOSE} build
        ${COMPOSE} run --rm -w /app -v $(pwd):/app app npm install

    else
        ${COMPOSE} "$@"
    fi

else
    usage
fi
