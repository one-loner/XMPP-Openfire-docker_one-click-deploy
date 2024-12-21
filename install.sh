#!/bin/bash
if (($EUID !=0)); then
     echo Script must be run by root.
     exit
else
     docker run --name openfire -d --restart=always   --publish 127.0.0.1:9090:9090 --publish 5222:5222 --publish 7777:7777   --publish 5269:5269 --publish 5270:5270   --publish 5275:5275 --publish 5276:5276 --publish 5262:5262   --volume /srv/docker/openfire:/var/lib/openfire   nasqueron/openfire:4.9.2
     echo ''
     echo '----------------------------------------------------------'
     echo ''
     docker ps
     echo ''
     echo '----------------------------------------------------------'
     echo ''
     echo 'Done. To install and configurate caddy run ./install.caddy.sh by root'
fi
