# Snapcast Server Docker
Useful for running snapcast server on Hifiberry OS or any other armv7 architecture

## Usage

### Build
To build the docker image from the raspberry Pi 3/4
```
docker build . -t ssalaues:snapcast
```

### Pull
Pull my pre-built image
```
docker pull ssalaues:snapcast
```

### Docker Run

Run interactively with defaults. This will clean up the container when it exits.
```
docker run --rm -it --network=host ssalaues:snapcast snapserver
```

Mount config file, run as detached process, and auto restart on failure
```
docker run -d --restart=always --network=host -v $PWD/snap_conf_folder:/config ssalaues:snapcast snapserver -c /config/snapserver.conf
```

### Docker Compose
The `docker-compose.yaml` file can be used to accomplish virtually the same as the above `docker run` command however in a configurable yaml file.

To run snapserver using Hifiberry OS specific folder structure:
```
git clone https://github.com/ssalaues/hifiberry-snapserver.git /data/docker/snapserver
cd /data/docker/snapserver
docker-compose up -d
```

The `/config` directory is mounted into the container and so all `snapserver.conf` values can be edited outside of the container. To restart the container after modifying the values run:

```
docker-compose restart
```

To tail the logs of the server:
```
docker-compose logs -f
```
