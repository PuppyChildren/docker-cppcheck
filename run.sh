#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "ERROR: Illegal number of parameters"
	echo "    usage: run.sh <project_directory_path>"
	exit 1
fi

docker run --name cppcheck -v $1:/src uilianries/docker-cppcheck
exit $?
