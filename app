#!/usr/bin/env bash

set -e

function usage() {
  echo ""
  echo "Docker commands:"
  echo "  stop               Stops docker containers"
  echo "  config             Split out the docker-conpose file used"
  echo "  logs   [PARAMS]    See docker logs, add param -f to tail logs"
  echo "  rm     [PARAMS]    Remove docker containers, add -v to remove volumes also"
  echo "  down   [PARAMS]    Stop and remove containers and networks, extra params:"
  echo "                           -v to remove volumes"
  echo "                           --rmi type [local, all] to remove images"
  echo ""
  echo "Development commands:"
  echo "  build              Build the docker container"
  echo "  bash               Login to docker bash interface as ROOT"
  echo "  exec   [COMMAND]   Run a command as ROOT inside the docker container"
  echo "  sls    [COMMAND]   Run a serverless command inside doker"
  echo ""
  exit 0
}

COMPOSE="docker-compose"

if [ $# -gt 0 ];then

    if [ "$1" == "exec" ]; then
        shift 1
        ${COMPOSE} exec -v $(pwd):/app app "$@"

    elif [ "$1" == "bash" ]; then
        ${COMPOSE} run --rm -v $(pwd):/app app bash

    elif [ "$1" == "sls" ]; then
        shift 1
        ${COMPOSE} run --rm -v $(pwd):/app app sls "$@"

    elif [ "$1" == "build" ]; then
        shift 1
        ${COMPOSE} build

    else
        ${COMPOSE} "$@"
    fi

else
    usage
fi