# Standalone Selenium server with Firefox

## Usage

### One time container
```
docker run -p 4444:4444 -it --rm attr/selenium-server-standalone-firefox
```

### Persistent named container
```
docker run -p 4444:4444 -dit --name=selenium attr/selenium-server-standalone-firefox
```

### Container with access to local network sites.
```
docker run -dit \
  -p 4444:4444 \
  --add-host test.example.local:192.168.0.5 \
  --net my_docker_net \
  --ip 192.168.0.10 \
  --name selenium \
  attr/selenium-server-standalone-firefox
```
