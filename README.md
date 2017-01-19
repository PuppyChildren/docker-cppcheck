# Docker Cppcheck 

Run cppcheck on a Docker container

## Usage

Mount your directory project as _volume_:  

`docker run -v ${pwd}:/src --name cppcheck uilianries/docker-cppcheck`

or 

`./run.sh <project_path>`

## Features

- Enable all warnings
- Use C++ language by default
- Enable C++11 feature standard
- Verbose mode on

## install

`docker pull uilianries/docker-cppcheck`

