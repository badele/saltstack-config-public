# Tested on Ubuntu 14.04

# Debian section
{% if grains['os_family'] == 'Debian' %}
python2-packages:
  pkg.installed:
    - pkgs:
      - python
      - python-pip

/usr/local/bin/my_pip2:
  file.managed:
    - source: salt://language/python/files/my_pip2.sh
    - mode: 755
    - template: jinja
    - require:
      - pkg: python2-packages
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


