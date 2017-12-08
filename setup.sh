#!/usr/bin/env sh

## Constants

SETUP_ALL="all"
SETUP_DOCKER="docker"

##

show_help()
{
  echo "$SETUP_ALL - setup all scripts"
  echo "$SETUP_DOCKER - setup docker script"
}

setup_script()
{
  if [ $1 = $SETUP_ALL ]; then
    setup_docker_script
  elif [ $1 = $SETUP_DOCKER ]; then
    setup_docker_script
  else
    echo "unknown command"
  fi
}

setup_env() {
  ## TODO check if current directory is in PATH
  echo "export $(PWD) to PATH"
  echo "please add $(PWD) to PATH (in .bash_profile or .bashrc) if you want permanently set up the script"
}

setup_docker_script()
{
  setup_env
  echo "setup docker"
  chmod +x dockercmd.sh
}

if [ $# -eq 0 ]; then
  show_help
elif [ $# -gt 1 ]; then
  echo "error: the command just take one argument."
else
  setup_script
fi
