FROM debian:jessie

RUN apt-get update && apt-get install -y wget xvfb default-jre

RUN echo 'deb http://mozilla.debian.net/ jessie-backports firefox-release' > /etc/apt/sources.list.d/debian-mozilla.list

RUN wget mozilla.debian.net/pkg-mozilla-archive-keyring_1.1_all.deb && \
    dpkg -i pkg-mozilla-archive-keyring_1.1_all.deb && \
    apt-get update && \
    apt-get install -y -t jessie-backports firefox

RUN wget -O /opt/selenium-server-standalone.jar http://selenium-release.storage.googleapis.com/2.53/selenium-server-standalone-2.53.1.jar

CMD xvfb-run java -jar /opt/selenium-server-standalone.jar
