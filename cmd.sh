#!/bin/bash

rm -f /tmp/.X99-lock

xvfb-run java -jar /opt/selenium-server-standalone.jar
