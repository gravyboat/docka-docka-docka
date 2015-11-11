docka-docka-docka
=================

docka-docka-docka is a full environment example to help you and your developers
get up to speed quickly with an environment which can be duplicated between
environments. Keep in mind that this repo is simply an example that shows
all components. In a real example (which you'll hopefully create) the
directories populated with actual content would be different repos. This is
simply an example of how to set up all the components you will need to get
going. Currently it is suggested to use Ubuntu due to the known issues
listed at the bottom of this Readme. It's made of three components:

components
----------

docka-project
-------------

docka-project uses boot2docker/docker, GitHub, and Travis CI to allow devs to
write code locally, build container images, push to an environment, allow
testing to occur, and merge back into a branch on GitHub which is then ready
for deployment.

docka-hub
---------

docka-hub explains how to set up web hooks within docker hub to hook up to the
salt service that is listening.

docka-salt
----------

docka-salt uses SaltStack to listen for docker updates and deploy them to the
server, it also handles the nginx-proxy that updates when services change.

The Goal
--------

docka-docka-docka was designed to use open source software that
anyone would have access to. It takes advantage of these tools to show how
streamlined and easy the process can be so that engineers don't have to set up
an excessive number of tools to deploy their docker containers to their hosting
provider.

Workflow
--------

The average workflow for docka-docka-docka is pretty standard. Once a docker
file is written for the associated project a developer can PR against the
associated repository's dev branch. The code will be tested against Travis
and if the PR passes the PR can be merged into dev. Once the developer's
branch is merged into the dev branch it is then accessible by other users. If
everything looks good the developer can then open a PR against the test branch
which is once again tested in Travis, if this PR passes and the content is
merged SaltStack will then pick up the associated Docker image and push it
to the test server for deployment, nginx-proxy will pick up this change for
the associated service. If everything looks good here the same process can be
repeated for the production branch and environment which will be automatically
deployed.

Note that currently docker has no way to distinguish between when
``after_success`` commands should be run based on branches. There
are workarounds in the .travis.yml file that handle this.
Https://github.com/travis-ci/travis-ci/issues/5065 has been
opened to request support for only completing after_success based on branch in
a more streamlined manner

known issues
------------

The current way the states are configured only support CentOS/RHEL based
distros. There should only be minor changes (primarily the repo data) required
to make this support other distros.

Currently on RHEL based distros it seems as though there is an issue removing
containers: https://github.com/docker/docker/issues/3610#issuecomment-155532043
this means that sometimes the docker deployment (unfortunately) fails. There
are workarounds, however they require adding a disk which was not something
that belonged in this repo.

On Debian based distros there is an odd pip issue which may cause an error
during the Salt run. This is caused by some pip problems as noted here:
https://bugs.launchpad.net/ubuntu/+source/python-pip/+bug/1306991
This is currently worked around in the associated salt code.
