FROM node:lts-slim

WORKDIR /code

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -yqq && \
    echo 'deb http://ftp.de.debian.org/debian sid main' >> '/etc/apt/sources.list' && \
    mkdir -p /usr/share/man/man1 && \
    apt-get install -yqq --no-install-recommends openjdk-8-jre-headless && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g sonarqube-scanner && \
    sonar-scanner --version

ENTRYPOINT ["sonar-scanner"]
