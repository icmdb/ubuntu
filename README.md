# ubuntu

A debug image with useful tools installed based on the official ubuntu image.

It can be run as a sidecar, may be useful while debugging with Docker or Kubernetes containers and will auto-removed when exit.


## Quick Start

```sh
git clone https://github.com/icmdb/ubuntu.git ~/github.com/icmdb/ubuntu

sudo ln -s ~/github.com/icmdb/ubuntu/docker-debugger /usr/local/bin/

# run a debug container take the same pid,network,volume with <CONTAINER_NAME>
docker-debugger <CONTAINER_NAME> 

docker-debugger <CONTAINER_NAME> bash # start with bash (default is sh)

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!    Dangerous, careful     !!!
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
docker-debuger purge              # remove all undone images (filter by "none")
docker-debuger purge containers   # remove all Exited containers (filter by 'Exited')
docker-debuger purge volumes      # remove all volumes 

# recreate all containers with docker-compose if docker-compose file exists
docker-debuger recreate
```

