# pyhton-template
App should be able to take configuration parameters from 
1. Environment variables or from file like /run/secrets/some file (preferbaly both)
2. Healthchek would be nice (ie something that we can execute in container to verify that app is running (if app does not have  http interfaces)

apt-requirements: put your linux packages required for app here

pip-requirements: put you pip requiremets here. You can use pip freze to dispaly required version for the app.

App will be copied in /app inside container

Any persistent data should be configured when deploying container (ie if service is not stateless, we need to know where persistent data will be saved inside container)




