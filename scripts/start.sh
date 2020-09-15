#!/bin/bash

rm /var/run/docker.pid
dockerd &
sleep 2
echo " "
exec bash