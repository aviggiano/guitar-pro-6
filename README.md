# guitar-pro-6
Unofficial Guitar Pro 6 docker image for linux

## Run

```
docker pull aviggiano/guitar-pro-6
xhost +local:root
docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -it aviggiano/guitar-pro-6:latest /opt/GuitarPro6/launcher.sh
```

## References

- [Installing GuitarPro6 on 64 bit Ubuntu 16.04 (and other Linux distros) [Tutorial]](https://www.reddit.com/r/GuitarPro/comments/4vqlpc/installing_guitarpro6_on_64_bit_ubuntu_1604_and/)
- [cannot connect to X server in a Docker container](https://groups.google.com/forum/#!topic/etetoolkit/4SrZk5fRtCM)

