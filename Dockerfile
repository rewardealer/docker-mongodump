FROM ubuntu:16.04

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5 && \
	apt-get update && \
	apt-get install -y apt-transport-https && \
	echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.6.list && \
	apt-get update && \
	apt-get install -y mongodb-org-tools ftp-upload

WORKDIR "/tmp"
COPY entrypoint.sh /tmp/entrypoint.sh
RUN  chmod +x /tmp/entrypoint.sh

CMD  ["/tmp/entrypoint.sh"]