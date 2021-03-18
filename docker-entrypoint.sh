#!/bin/bash
# Docker secrets support
echo "Service start"
echo "Checking presence of docker secret"
if [ -f /run/secrets/vision_config ]
then
echo "Docker secret found, importing config"
export $(cat /run/secrets/vision_config  | xargs -0)
echo "Trying to import api config"
export $(cat /run/secrets/vision_api  | xargs -0)
echo "Trying to import ics config"
export $(cat /run/secrets/vision_ics  | xargs -0)
echo "Trying to import ncs config"
export $(cat /run/secrets/vision_ncs  | xargs -0)
echo "Trying to import maintenance config"
export $(cat /run/secrets/vision_maintenance  | xargs -0)
else
echo "Docker secret not detected, continuing with service startup"
fi

set -e
cd /app
python3 -W main.py
exec "$@"
