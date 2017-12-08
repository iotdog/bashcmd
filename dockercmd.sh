#!/usr/bin/env sh

## Constants

CMD_RemoveAllStoppedContainers="rasc"

##

show_help()
{
  echo "$CMD_RemoveAllStoppedContainers - remove all stopped containers"
}

exec_cmd()
{
  if [ $1=$CMD_RemoveAllStoppedContainers ]; then
    docker rm $(docker ps -a -q)
  else
    echo "unknown command"
  fi
}

if [ $# -eq 0 ]; then
  show_help
elif [ $# -gt 1 ]; then
  echo "error: the command just take one argument."
else
  exec_cmd
fi
