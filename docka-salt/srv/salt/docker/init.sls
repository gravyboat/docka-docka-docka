include:
  - python.pip

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
