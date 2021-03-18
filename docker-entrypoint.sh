#!/bin/bash
# Docker secrets support
echo "Service start"
echo "Checking presence of docker secret"
set -e
cd /app
python3 -W main.py
exec "$@"
