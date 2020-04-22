# debug

A debug image with useful tools installed based on the official ubuntu image.

It can be run as a sidecar, may be useful while debugging with Docker or Kubernetes containers and will auto-removed when exit.


## Quick Start

```sh
git clone https://github.com/icmdb/ubuntu.git ~/github.com/icmdb/ubuntu

sudo ln -s ~/github.com/icmdb/ubuntu/docker-debugger /usr/bin/

# run a debug container take the same pid,network,volume with <CONTAINER_NAME>
docker-debugger <CONTAINER_NAME> 

docker-debugger <CONTAINER_NAME> bash # start with bash (default is sh)

# Remove all undone images and Exited containers 
docker-debuger purge              # remove undone images (filter by "none")

# !!!!!!!!!!!!!!!!!!!!!!!!!
# !!!    Be careful     !!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
docker-debuger purge containers   # remove Exited containers (filter by 'Exited')

# recreate all containers with docker-compose if docker-compose file exists
docker-debuger recreate
```
