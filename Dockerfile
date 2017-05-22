FROM debian:jessie

RUN apt-get update && apt-get install -y wget xvfb default-jre

RUN echo 'deb http://mozilla.debian.net/ jessie-backports firefox-release' > /etc/apt/sources.list.d/debian-mozilla.list

RUN wget mozilla.debian.net/pkg-mozilla-archive-keyring_1.1_all.deb && \
    dpkg -i pkg-mozilla-archive-keyring_1.1_all.deb && \
    apt-get update && \
    apt-get install -y -t jessie-backports firefox

RUN wget -O /opt/selenium-server-standalone.jar http://selenium-release.storage.googleapis.com/2.53/selenium-server-standalone-2.53.1.jar

RUN wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_"1.2.0"_amd64.deb && dpkg -i dumb-init_*.deb && rm dumb-init_"1.2.0"_amd64.deb

COPY cmd.sh /root/cmd.sh
RUN chmod +x /root/cmd.sh

CMD ["dumb-init", "-c", "--", "/root/cmd.sh"]
