{% if grains.get('os_family') == 'RedHat' %}
include:
  - yum.epel

install_pip:
  pkg.installed:
    - name: python-pip
    - refresh: True
{% elif grains.get('os_family') == 'Debian' %}
install_pip:
  cmd.run:
    - name: easy_install pip
{% endif %}
