include:
  - yum.epel

install_pip:
  pkg.installed:
    - name: python-pip
