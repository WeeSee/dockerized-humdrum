Humdrum Docker Image
====================

This Docker image is intended for easy use of [Humdrum](https://www.humdrum.org).

Humdrum is a set of command-line tools that facilitates musical analysis, as well as a generalized syntax for representing sequential streams of data.

Installation of Humdrum tools on the Docker host is not required.

There are Humdrum music samples included in the image from Chopin, Joplin, Bach, Haydn, Hummel, Mozart, Scarlatti, Beethoven, ...

Have frun using Humdum!

# Prerequisites

You need preinstalled

* Docker

# Usage 

Directly execute Humdrum commands. When executing the first time the 
Docker image is being pulled from Dockerhub

    > cat bach.krn | docker run weesee/humdrum census -k

The output should be something like

```
HUMDRUM DATA

Number of data tokens:     13
Number of null tokens:     0
Number of multiple-stops:  0
Number of data records:    13
Number of comments:        0
Number of interpretations: 5
Number of records:         18

KERN DATA

Number of note-heads:      8
Number of notes:           8
Longest note:              2
Shortest note:             4
Highest note:              a
Lowest note:               c#
Number of rests:           1
Maximum number of voices:  1
Number of single barlines: 4
Number of double barlines: 0
```

You can read about the census command [here](https://www.humdrum.org/guide/ch03/#the-census-command).

Or enter the container with a bash:

    docker run -it weesee/humdum

# The Dockerfile

## Current status

The Humdrum build process is quite complex. There are sill some
errors in the build process. However the basic Humdrum commands
can be executed. 

## Dockerfile design

The build process is done at user level. The user 'humdrummy' has its
home directory at /app. 

In the Docker image there are installed

* Humdrum tools
* sample music data in ```~/humdrum-tools/data``` (Chopin, Joplin, Bach, Haydn, Hummel, Mozart, Scarlatti, Beethoven, ...)
* documentation in ```~/humdrum-tools/doc```

# Usage with make and docker-compose

Start with cloning [this repo](https://github.com/WeeSee/dockerized-humdrum):

    > git clone https://github.com/WeeSee/dockerized-humdrum

This tools help using Humdrum even simpler. Now start playing with Humdrum:

Show commands:

    > make

Start shell to enter the container:

    > make bash

Execute Humdrum commands on local files:

    > cat bach.krn | docker-compose run app "census -k"


# Credits

This repo builds upon and was inspired by

* https://www.humdrum.org

# Author

weesee@web.de

(C) Copyright, 2020