#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Missing local path as flag"
    exit 1
fi
docker run -ti -v /var/run/docker.sock:/var/run/docker.sock -v $1:/data eclipse/che start &disown
exit 0
