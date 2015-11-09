docka-hub
=========

docka-hub is the component for hooking up docker. Signing up for docker hub is
mandatory in this process, users can register here: https://hub.docker.com/ 

The primary purpose of this section is to detail the necessary webhooks for
SaltStack. This is simply a URL to your server, it looks like:

`http://your_domain_or_server_ip/hook/travis/success-test` for the test
environment, and `http://your_domain_or_server_ip/hook/travis/success-prod` for
the production environment.
