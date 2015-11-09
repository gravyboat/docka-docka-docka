docka-docka-docka
=================

docka-docka-docka is a full environment example to help you and your developers
get up to speed quickly with an environment which can be duplicated between
environments. It's made of three components:

components
----------

docka-project
-------------

docka-dev uses boot2docker/docker, GitHub, and Travis CI to allow devs to
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

docka-docka-docka was designed to use only free, open source software that
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
the associated service. If everything looks good here the same process is
repeated for the prod branch, and the prod environment.

Note that currently docker has no way to distinguish between when
`after_success` commands should be run based on branches, so if a developer
opens a PR against test and the code runs it will be deployed to the docka
test environment. https://github.com/travis-ci/travis-ci/issues/5065 has been
opened to request support for only completing after_success based on branch.
