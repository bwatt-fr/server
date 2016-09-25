#!/bin/sh
# start.sh

export APP_CONFIG_FILE=/app/blog-jonglage/config/dev_docker.py
circusd circus.ini
