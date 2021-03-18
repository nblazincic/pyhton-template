FROM ubuntu:18.04

## Install OS packages from list supplied in apt-requirements.txt
ADD apt-requirements.txt .

RUN set -xe;\
    apt-get update;\
    cat apt-requirements.txt |  DEBIAN_FRONTEND=noninteractive xargs apt-get install -y

## Install python packages from list supplied in pip-requirements.txt
ADD pip-requirements.txt .

RUN pip3 --no-cache-dir install  -r pip-requirements.txt

# Set locale
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ENV PYTHONUNBUFFERED 0

# COPY Files to image
RUN mkdir -p /app
WORKDIR /app
ADD . .
RUN chmod +x /app/docker-entrypoint.sh
ENTRYPOINT  ["/app/docker-entrypoint.sh" ]
