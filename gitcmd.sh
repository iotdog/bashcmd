#!/usr/bin/env sh

## Constants

CMD_GetRepoInfo="repo"

##

show_help()
{
  echo "$CMD_GetRepoInfo - get repository info"
}

exec_cmd()
{
  if [ $1 = $CMD_GetRepoInfo ]; then
    git remote show origin
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
