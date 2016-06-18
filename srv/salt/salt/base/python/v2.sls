# Tested on Ubuntu 14.04

# Debian section
{% if grains['os_family'] == 'Debian' %}
python2-packages:
  pkg.installed:
    - pkgs:
      - python
      - python-pip
{% endif %}

# Archlinux section
{% if grains['os_family'] == 'Arch' %}
python3-packages:
  pkg.installed:
    - pkgs:
      - python2

pip-install:
  cmd.run:
    - unless: ls /usr/bin/pip2
    - name: easy_install pip
    - require:
      - pkg: default-commons--packages
{% endif %}


