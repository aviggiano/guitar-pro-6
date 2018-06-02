# guitar-pro-6
Unofficial Guitar Pro 6 docker image for linux

## Run

To instanciate your container:

```
docker pull aviggiano/guitar-pro-6
xhost +local:root
docker run -d --name gp6-01 \
	-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ \
	--device /dev/snd -v /run/user/$(id -u)/pulse:/run/pulse:ro \
	aviggiano/guitar-pro-6

```

Then the next times:

```
xhost +local:root
docker start gp6-01
```

## Recipes

Here are some frequent usages conveniently packaged in scripts.
Wrap them in your own script with the path parameters that are good your you.

#### Basic usage with only one host, no RSE

 - use `01_run_standalone.sh` script to create a container called `gp6-01` in your host
 - Guitar Pro will ask for your credentials (USER ID / KEY ID) then you can use it
 - when Guitar Pro is closed, the container is stopped
 - start again `gp6-01` to launch again Guitar Pro without having to fill in credentials
 - the credentials are lost if the container is removed from host


#### Option : Downloading and saving RSE Soundbanks

 - don't use `01_run_standalone.sh`
 - use `02_run_shell.sh` script to create a shell container called `gp6-02` in your host
 - on the opened shell execute following:
 ```
 # cd is important to find one .so file contained in GuitarPro6 folder
 cd /opt/GuitarPro6/
 ./GPUpdater
 ```
 - Guitar Pro will ask for your credentials (USER ID / KEY ID) , enter KEY ID with '-' between the 3 parts
 - GPUpdater will present you the list of Soundbanks you own in your account, choose the ones you want and download them
 - when finished, **don't close the terminal**
 - execute `03_save_soundbanks.sh $PWD` to copy Data folder outside of container in your current directory (replace $PWD by any place you want to save your files to)
 - you can know close the terminal and `docker rm gp6-02`
 - you can know use `04_run_with_soundbanks.sh $PWD/Data` exactly as you would use `01_run.sh` in basic usage


#### Option : Portable installation usable on several hosts

 - while `gp6-01` is started, execute `05_save_user_files.sh $PWD` to get from container user files containing your own preferences and credentials (again, replace $PWD by any place you want to save your files to)
 - moves the generated folders ($PWD/home.config and $PWD/home.ArobasMusic) to another host
 - execute on the other host `06_run_with_user_files.sh PATH/TO/SAVED/FOLDER` : Guitar Pro is executed without asking for credentials again
 - you may even `docker rm gp6-01` on your first host and always use `06_run_with_user_files.sh $PWD` to start Guitar Pro with your credentials


#### Option : Mounting a shared drive

 - if you are using several hosts, you may want to share your .gpx files too
 - add them to a cloud shared drive (nextcloud, owndrive, dropbox, google drive, ... )
 - mount it as a volume by adding `-v /PATH/TO/DRIVE:/root/drive` to your run script
 - of course, you can mount any local drive like this, not necessarily a cloud one


#### Do it all  : Full portable installation

 - get soundbanks and user files from previous sections and store them as your "installation files" (e.g on a pendrive)
 - use `07_run_full.sh` on any docker host to have a full GuitarPro6 ready to use with Soundbanks folder, user files, and drive mounted


## References

- [Installing GuitarPro6 on 64 bit Ubuntu 16.04 (and other Linux distros) [Tutorial]](https://www.reddit.com/r/GuitarPro/comments/4vqlpc/installing_guitarpro6_on_64_bit_ubuntu_1604_and/)
- [Cannot connect to X server in a Docker container](https://groups.google.com/forum/#!topic/etetoolkit/4SrZk5fRtCM)
- [Dockerized Spotify](https://github.com/terlar/docker-spotify-pulseaudio) for an example of working pulseaudio link in Docker container

