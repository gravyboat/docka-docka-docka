configure_docker_repo:
  pkgrepo.managed:
    - name: dockerrepo
    - hummanname: Docker Repository
    - baseurl: https://yum.dockerproject.org/repo/main/centos/7
    - gpgcheck: True
    - key_url: https://yum.dockerproject.org/repo/main/centos/7
    - refresh_db: True

install_docker:
  pkg.installed:
    - name: docker-engine

install_docker_py:
  pip.install:
    - name: docker-py

install_nginx_proxy_container:
  dockerng.running:
    - name: jwilder/nginx-proxy
    - port_bindings:
      - 80:80
    - detach: True
    - volumes:
      - /var/run/docker.sock:/tmp/docker.sock:ro


install_docka_project_container:
  dockerng.running:
{% if grains['env'] == 'prod' %}
    - name: forresta/docka-docka-docka
{% elif grains['env'] == 'test' %}
    - name: forresta/docka-docka-docka-test
{% endif %}
    - force: True
    - ports: 5000
    - publish_all_ports: True
    - environment:
      - VIRTUAL_HOST: test.hungryadmin.com
    - detach: True
