#!/bin/bash
if [ -n "$(command -v apt)" ]; then
    apt update
    apt install ranger caca-utils highlight atool w3m poppler-utils mediainfo -y
    exit 0
fi
if [ -n "$(command -v yum)" ]; then
    yum update -y
    yum install ranger caca-utils highlight atool w3m poppler-utils mediainfo -y
    exit 0
fi
