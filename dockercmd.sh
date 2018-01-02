#!/usr/bin/env sh

## Constants

CMD_RemoveAllStoppedContainers="rasc"
CMD_RemoveAllUntaggedImages="raui"

##

show_help()
{
  echo "$CMD_RemoveAllStoppedContainers - remove all stopped containers"
  echo "$CMD_RemoveAllUntaggedImages - remove all untagged images"
}

exec_cmd()
{
  if [ $1 = $CMD_RemoveAllStoppedContainers ]; then
    docker rm $(docker ps -a -q)
  elif [[ $1 = $CMD_RemoveAllUntaggedImages ]]; then
    docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
  else
    echo "unknown command"
  fi
}

if [ $# -eq 0 ]; then
  show_help
elif [ $# -gt 1 ]; then
  echo "error: the command just take one argument."
else
  exec_cmd $1
fi
