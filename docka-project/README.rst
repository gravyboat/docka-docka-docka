docka-project
=============

This is the example project, with an example docker file. Our project consists
of three key points, working locally, creating a PR which is tested, and
building/storing the docker container.

Using Docker Locally
--------------------

If a user is running on Mac/Windows refer to the Boot2Docker installation
guide: https://github.com/boot2docker/boot2docker#installation, if a user
is running Linux refer to the Docker installation guide for the associated
distro: http://docs.docker.com/v1.8/installation/

Creating the Container Locally
------------------------------

This repo contains an example docker file for a simple Flask app. You can use
the following steps to create this image (run these within this directory):

Note that these commands may need to be run as root.

`sudo service docker start`

`sudo docker build -t docka-project .`

Once the container is created you will need to use the nginx-proxy container
from jwilder (https://github.com/jwilder/nginx-proxy) to do our automated
nginx proxying. To start that run this command:

`sudo docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy`

Then start our Flask app container:

`sudo docker run -e VIRTUAL_HOST=test.com -t -d -p 5000:5000 docka-project`

You will need to modify your hosts file to point test.com to either your local
IP address, or 0.0.0.0.

The container should now be accessible from your local system so you can see
the running application. Note that this process can be duplicated for as many
containers as you may have, just make sure they're associated with different
ports.

Travis Setup for Testing and Docker
-----------------------------------

Start by following the excellent getting started guide provided by Travis for
your project:
http://docs.travis-ci.com/user/getting-started/

Note that Travis will automatically test when you make a PR as noted here:
http://docs.travis-ci.com/user/pull-requests/

It is important to ensure that you complete the instructions to use Travis and
Docker, as users will be pushing to the Docker registry. For this project it is
recommended that you use the same login as otherwise SaltStack will not know
which project to pull down.

At this point you should now be able to locally create your containers and run
them via boot2docker or just docker and serve them via nginx-proxy like you
would in the test/production environment.
