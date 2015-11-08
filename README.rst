docka-docka-docka
=================

docka-docka-docka is a full environment example to help you and your developers
get up to speed quickly with an environment which can be duplicated between
environments. It's made of three components:

components
----------

docka-dev:

docka-dev uses boot2docker, GitHub, and Travis CI to allow devs to write code
locally, push to an environment, allow testing to occur, and merge back into a
branch on GitHub which is then ready for docka-test.

docka-test:

docka-test uses docker, GitHub, Travis CI, nginx-proxy and SaltStack for
configuration management to build your system and keep your docker containers
up to date so they are accessible for the test environment.

docka-prod:

docker-prod uses docker, GitHub, Travis CI, nginx-proxy, and SaltStack for
configuration management to build your system and keep your docker containers
up to date so they are accessible for the production environment.

The Goal
--------

docka-docka-docka was designed to use only free, open source software. It takes
advantage of these tools to streamline and ease the process so that engineers
don't have to set up an excessive number of tools.

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

docka-dev
---------
