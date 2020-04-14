# debug

A debug image with useful tools installed based on the official ubuntu image.

It can be run as a sidecar, may be useful while debugging with Docker or Kubernetes containers.


## Quick Start

```sh
git clone https://github.com/icmdb/debugger.git

cd debugger

sudo ln -s $(pwd)/docker-debugger /usr/bin/

docker-debugger <CONTAINER_NAME>

docker-debugger <CONTAINER_NAME> bash
```
