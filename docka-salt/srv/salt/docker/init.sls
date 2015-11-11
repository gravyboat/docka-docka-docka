include:
  - python.pip

{% if grains.get('os_family') == 'RedHat' %}
configure_docker_repo:
  pkgrepo.managed:
    - name: dockerrepo
    - hummanname: Docker Repository
    - baseurl: https://yum.dockerproject.org/repo/main/centos/7
    - gpgcheck: 0
    - key_url: https://yum.dockerproject.org/repo/main/centos/7
    - refresh_db: True
{% endif %}

install_docker:
  pkg.installed:
{% if grains.get('os_family') == 'RedHat' %}
    - name: docker-engine
{% else %}
    - name: docker.io
{% endif %}

install_docker_py:
  pip.installed:
    - name: docker-py

docker_service:
  service.running:
    - name: docker
    - enable: True
