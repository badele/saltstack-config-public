# Tested on Ubuntu 14.04

# Debian section
{% if grains['os_family'] == 'Debian' %}
python3-packages:
  pkg.installed:
    - pkgs:
      - python3
      - python3-pip
{% endif %}

# Archlinux section
{% if grains['os_family'] == 'Arch' %}
python3-packages:
  pkg.installed:
    - pkgs:
      - python

pip-install:
  cmd.run:
    - unless: ls /usr/bin/pip3
    - name: easy_install pip
    - require:
      - pkg: default-commons--packages
{% endif %}


