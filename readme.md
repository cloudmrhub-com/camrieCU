# Camrie CU

First implementation of the camrie Computing Unit. 
Camrie is part of [Cloud MR](http://www.cloudmrhub.com).

## Installation
```sh
git clone https://github.com/developcloudmrhub/camrieCU.git
cd camrieCU/
docker build ./ -t mycamrieimage
```
## Use
We want mount a local directory let's say /data/tmp of the host into /camrieTemp and enter in the image. If you don't have that directory /data/tmp, you can create it or provide a different path
```sh

docker run --rm -it --mount type=bind,source=/data/tmp,target=/camrieTemp mycamrieimage bash
```
Now you are inside the docker image of camrie.


From inside the container
```sh
sh run_camrie.sh /opt/mcr/v96/ /app/testoptions.json /camrieTemp/output.json /camrieTemp/l.json /camrieTemp/
```
the results will be available in the host computer in path /data/tmp/output.json

## Customize the simulation
From the container
```sh
cp /app/testoptions.json /camrieTemp/
```

From the host you can edit the new file that you'll find at /data/tmp/testoptions.json

and then from the container

```sh
sh run_camrie.sh /opt/mcr/v96/ /camrieTemp/testoptions.json /camrieTemp/output.json /camrieTemp/l.json /camrieTemp/
```
## Windows and space
docker on windows uses docker-toolbox which basically installs a VM on your windows machine and on that create a new linux os where it build the requested docker image. If you are running low on space on C:\ you can move .docker directory from C:\Users\{{username}} to e.g. D:\

and then  run:

``` 
cd C:\Users\{{username}}
mklink /j .docker D:\.docker

```


[*Dr. Eros Montin, PhD*](http://me.biodimensional.com)
**46&2 just ahead of me!**
